import redis
import sys
import re
import json
import dash
import dash_core_components as dcc
import dash_html_components as html
import dash_auth

from plotly import graph_objects as go
import dash_bootstrap_components as dbc
from crow.events import LOG_MESSAGE, GENERATED_BC_VARIANT, EXPLORATION_RESULT, BC_EXPLORATION_QUEUE, GENERATION_QUEUE, \
    WAT_QUEUE, WASM_QUEUE
from crow.monitor.logger import ERROR
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
import traceback
from crow.settings import config
from crow.monitor import MONITOR_QUEUE_NAME
from crow.storage import STORAGE_QUEUE_NAME
from crow.utils import printProgressBar
from zipfile import ZipFile
import os
from flask import render_template, Flask, jsonify, send_from_directory
from shutil import make_archive
from flask.helpers import send_file
import pika
import time
import base64
import subprocess

from flask_cors import CORS
# regular expressions
PROGRAM_RE = re.compile(r"^(.+?):")
FUNCTION_NAME=re.compile(r"\n[ \t]+\(func (\$.+) \(type \d\)")
BLACK_LIST=["$__wasm_call_ctors"]

DEBUG=False
# flask app
app = Flask(__name__)
CORS(app, resources={r"/programs": {"origins": "*"}})

# TODO caching memoization for request
# Add time expiration for the request
# Create the caching mechanism as a decorator

# pagination
def paginate_collection(collection, page=0, page_size=100):
    page=int(page)
    number_of_pages = int(len(collection)/page_size)

    if len(collection) % page_size != 0:
        number_of_pages += 1
    return dict(
        total=len(collection),
        page=page,
        page_size=page_size,
        result=collection[page*page_size:(page + 1)*page_size],
        number_of_pages=number_of_pages
    )

# retrieve redis connection
def get_connection():
    redis_host = os.environ.get("REDIS_HOST", "0.0.0.0")
    redis_port = os.environ.get("REDIS_PORT", "7256")
    redis_port = int(redis_port)

    redis_pass = os.environ.get("REDIS_PASS", "")
    redis_db = os.environ.get("REDIS_DB", "0")

    connection = redis.Redis(host=redis_host,port=redis_port, db=redis_db, password=redis_pass)

    return connection

def get_function_name_from_file(file):

    result = []
    c = open(f"{file}", 'r').read()

    for f in FUNCTION_NAME.findall(c):
        if f not in BLACK_LIST:
            result.append(f.replace("$", "")) # sanitize

    return result

def get_function_name(connection, program_id):
    unique = get_unique_wasm(connection, program_id)['keys'][0]
    variants = get_eq_variants_for_wasm(connection, unique)['equal_variants'][0]

    # decoding base64 stream
    stream = variants['stream']
    stream = base64.decodebytes(stream.encode())

    wasmname = f"out/{variants['file_name']}"
    w = open(wasmname, 'wb')
    w.write(stream)
    w.close()

    try:
        watname = f"out/{variants['file_name']}.wat"
        content = subprocess.check_output([
            os.environ.get("WASM2WAT", "wasm2wat"),
            wasmname,
            "--enable-all",
            "-o",
            watname
        ])
        functions = get_function_name_from_file(watname)
        return dict(
            program_id=program_id,
            functions = functions
        )
    except Exception as e:
        print(e)
        return dict(
            program_id=program_id,
            functions = []
        )


def get_all_programs(connection, page=0, prefix="opencv_", only_diversified=True):

    print("getting programs")
    allkeys = connection.keys(f"{prefix}*")

    r = { }

    print("keys retrieved")
    for k in allkeys:
        kd = k.decode()

        match= PROGRAM_RE.match(kd)
        if match:
            r[match.group(1)] = { }

    print("Filtering by more than one variant")
    names=[k for k in list(r.keys()) if len(get_unique_bitcodes(connection, k)) > 1]

    print("Sorting names", len(names))
    names=sorted(names)
    print("Paginating...")
    names = paginate_collection(names, page=page)
    print("Adding function names")
    withnames = [ get_function_name(connection, k) for k in names['result'] ]
    names['result'] = withnames

    print("Returning all programs")

    return names

def get_unique_bitcodes(connection, program):

    bc_keys = connection.keys(f"{program}:bc:*")

    if len(bc_keys) > 1:
        print(program, len(bc_keys))
    return dict(
        total=len(bc_keys),
        keys=[bc.decode() for bc in bc_keys]
    )


def get_eq_variants_for_bc(connection, bitcode_key):

    try:
        variants = connection.get(f"{bitcode_key}")
    except:
        variants = connection.get(f"{bitcode_key}")
    
    r =  json.loads(variants.decode()) if variants else []
    
    return  dict(
        total=len(r),
        equal_variants=r
    )

def get_eq_variants_for_wasm(connection, wasm_key):
    variants = connection.get(f"{wasm_key}")

    r =  json.loads(variants.decode()) if variants else []
    return  dict(
        total=len(r),
        equal_variants=r
    )

def get_unique_wasm(connection, program):
    wasm_keys = connection.keys(f"{program}:wasm:*")


    return dict(
        total=len(wasm_keys),
        keys=[bc.decode() for bc in wasm_keys]
    )

# Endpoints
if __name__ == "__main__":
    
    for f in sys.argv[1:]:
        function_id = f

        redis_host = os.environ.get("REDIS_HOST", "0.0.0.0")
        redis_port = os.environ.get("REDIS_PORT", "7256")
        redis_port = int(redis_port)

        redis_pass = os.environ.get("REDIS_PASS", "")
        redis_db = os.environ.get("REDIS_DB", "0")

        connection = redis.Redis(host=redis_host,port=redis_port, db=redis_db, password=redis_pass)

        name = get_function_name(connection, function_id)

        print(function_id, len(name['functions']))
