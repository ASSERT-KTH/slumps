from flask import Flask, jsonify, request, url_for
from flask_socketio import SocketIO, emit, join_room, leave_room, send, Namespace
from threading import Thread
from flask_basicauth import BasicAuth
from flask_cors import CORS

import os
import threading
import json

from crow.events import GENERATED_BC_VARIANT, EXPLORATION_RESULT, GENERATED_WASM_VARIANT, NATIVE_WASMTIME_GENERATED
from crow.events.event_manager import subscriber_function, Subscriber
from crow.monitor import MONITOR_QUEUE_NAME
from crow.settings import config

app = Flask(__name__, template_folder='templates')
app.config["SECRET_KEY"] = 'secret!'
app.config['CORS_HEADERS'] = 'Content-Type'
CORS(app, resources={r"/*": {"origins": "*"}})

# This is not the best solution, but its ok for the r-pi deployment
app.config['BASIC_AUTH_USERNAME'] = os.environ.get("ADMIN_USER", 'admin')
app.config['BASIC_AUTH_PASSWORD'] = os.environ.get("ADMIN_PASSWORD", 'admin')
async_mode = None
socketio = SocketIO(app, logger=True, engineio_logger=True, aync_mode=async_mode, cors_allowed_origins="*")

basic_auth = BasicAuth(app)

from views import index

STATUS = {

}

# Monitor status
COUNT = 0
TENTATIVE_NUMBER = -1
BITCODE_HASHES = []
WASM_HASHES = []
NATIVE_HASHES = []

class SimulatorNamespace(Namespace):

    # @socketio.on('connect', namespace='/simulator')
    def on_connect(self):

        socketio.emit("COUNT", dict(
            program_name="Program",
            total=len(NATIVE_HASHES),
            unique=len(set(NATIVE_HASHES)),
            type="native"
        ), json=True, namespace='/dashboard')

        socketio.emit("COUNT", dict(
            program_name="Program",
            total=len(BITCODE_HASHES),
            unique=len(set(BITCODE_HASHES)),
            type="bc"
        ), json=True, namespace='/dashboard')

        socketio.emit("COUNT", dict(
            program_name="Program",
            total=len(WASM_HASHES),
            unique=len(set(WASM_HASHES)),
            type="wasm"
        ), json=True, namespace='/dashboard')

    # @socketio.on('disconnect', namespace='/simulator')
    def on_disconnect(self):
        pass


socketio.on_namespace(SimulatorNamespace("/dashboard"))


# STATIC CONTENT
@app.route('/')
def index_handler():
    return index()


@subscriber_function(event_type="*")
def general_log(data):
    global COUNT
    global TENTATIVE_NUMBER

    STATUS["NOW"] = data["time"]

    if data["event_type"] == GENERATED_BC_VARIANT:
        COUNT += 1

        BITCODE_HASHES.append(data["hash"])

        if TENTATIVE_NUMBER == -1:  # WARNING something happend with the exploration service
            print(f"WARNING something happend with the exploration service. Count: {COUNT}")

        socketio.emit("NEW_VARIANT", dict(
            program_name="Program",
            count=COUNT,
            tentative=TENTATIVE_NUMBER if TENTATIVE_NUMBER != -1 else COUNT,
            at=STATUS["NOW"] - data["time"]
        ), json=True, namespace='/dashboard')

        socketio.emit("COUNT", dict(
            program_name="Program",
            total=len(BITCODE_HASHES),
            unique=len(set(BITCODE_HASHES)),
            type="bc",
            at=STATUS["NOW"] - data["time"]
        ), json=True, namespace='/dashboard')

    if data["event_type"] == EXPLORATION_RESULT:
        TENTATIVE_NUMBER = data["tentative_number"]

    if data["event_type"] == GENERATED_WASM_VARIANT:
        WASM_HASHES.append(data["hash"])

        socketio.emit("COUNT", dict(
            program_name="Program",
            total=len(WASM_HASHES),
            unique=len(set(WASM_HASHES)),
            type="wasm",
            at=STATUS["NOW"] - data["time"]
        ), json=True, namespace='/dashboard')

    if data["event_type"] == NATIVE_WASMTIME_GENERATED:
        NATIVE_HASHES.append(data["hash"])

        socketio.emit("COUNT", dict(
            program_name="Program",
            total=len(NATIVE_HASHES),
            unique=len(set(NATIVE_HASHES)),
            type="native",
            at=STATUS["NOW"] - data["time"]
        ), json=True, namespace='/dashboard')


    STATUS["count"] = COUNT
    STATUS["tentative"] = TENTATIVE_NUMBER

def start_listening_post():

    key = config["event"]["process-id-exploration"]
    subscriber = Subscriber(1, MONITOR_QUEUE_NAME, key, config["event"].getint("port"), general_log)
    subscriber.setup()

if __name__ == '__main__':
    APP_HOST = os.environ.get("DASHBOARD_HOST", '0.0.0.0')
    APP_PORT = int(os.environ.get("DASHBOARD_PORT", "8000"))

    th = Thread(target=start_listening_post, args=())
    th.start()

    socketio.run(app, debug=True, host=APP_HOST, port=APP_PORT)
    th.join()