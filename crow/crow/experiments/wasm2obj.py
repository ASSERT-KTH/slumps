from crow.events import BC2Candidates_MESSAGE, BC_EXPLORATION_QUEUE, STORE_MESSAGE, GENERATE_VARIANT_MESSAGE, \
    EXPLORATION_RESULT, GENERATED_WASM_VARIANT, WASMTIME_QUEUE, NATIVE_WASMTIME_GENERATED
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.sanitizer import Sanitizer
from crow.settings import config
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED
from crow.commands.stages import BCCountCandidates, TimeoutException, WASM2OBJ
from crow.socket_server import listen

from crow.utils import ContentToTmpFile, getIteratorByName
import threading, queue
import hashlib
import json
import redis
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED

import sys
import traceback
from crow.monitor.monitor import log_system_exception
import time
import operator

from functools import reduce
from crow.monitor.logger import LOGGER

publisher = Publisher()

@log_system_exception()
def wasm2obj(wasm, program_name, file_name):

    hashvalue = hashlib.sha256(wasm).hexdigest()

    with ContentToTmpFile(content=wasm, LOG_LEVEL=2) as BCIN:
        tmpIn = BCIN.file
        with ContentToTmpFile(LOG_LEVEL=2) as BCOUT:
            tmpOut = BCOUT.file

            try:
                LOGGER.info(program_name, f"Generating native object {file_name}...")

                wasm2obj = WASM2OBJ(program_name, True)
                wasm2obj(args=[tmpIn, tmpOut], std=None)

                nativeObj = open(tmpOut, 'rb').read()

                h2 = hashlib.sha256(nativeObj).hexdigest()
                print(f"WASMTIME {file_name} {hashvalue} {h2}")

                publisher.publish(message=dict(
                    event_type=NATIVE_WASMTIME_GENERATED,
                    stream=nativeObj,
                    hash=h2,
                    options="",
                    program_name=f"{program_name}",
                    file_name=f"{file_name}.native",
                    path="native/variants"
                ), routing_key="")

                publisher.publish(message=dict(
                    event_type=STORE_MESSAGE,
                    stream=nativeObj,
                    program_name=f"{program_name}",
                    file_name=f"{file_name}.native",
                    path="native/variants"
                ), routing_key="")



            except Exception as e:
                LOGGER.error(program_name, traceback.format_exc(), )
                raise e

@log_system_exception()
@subscriber_function(event_type=GENERATED_WASM_VARIANT)
def subscriber(data):
    wasm2obj(data["stream"],data["program_name"], data["file_name"])


if __name__ == "__main__":

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, WASMTIME_QUEUE, "*", config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        wasm2obj(open(sys.argv[2], 'rb').read(), program_name)