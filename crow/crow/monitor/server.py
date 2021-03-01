from flask import Flask, jsonify, request, url_for
from flask_socketio import SocketIO, emit, join_room, leave_room, send, Namespace
from threading import Thread
from flask_basicauth import BasicAuth
from flask_cors import CORS

import os
import threading
import json

from crow.events import GENERATED_BC_VARIANT, EXPLORATION_RESULT, GENERATED_WASM_VARIANT, NATIVE_WASMTIME_GENERATED, GENERATE_VARIANT_MESSAGE
from crow.events.event_manager import subscriber_function, Subscriber, Listener, function_discrimator, listener
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
import time

STATUS = {
    'NOW': time.time()
}


class SimulatorNamespace(Namespace):

    # @socketio.on('connect', namespace='/simulator')
    def on_connect(self):
        pass

    # @socketio.on('disconnect', namespace='/simulator')
    def on_disconnect(self):
        pass


socketio.on_namespace(SimulatorNamespace("/dashboard"))


# STATIC CONTENT
@app.route('/')
def index_handler():
    return index()

@listener
class ServerListener(Listener):
    # Monitor status
    COUNT = 0
    TENTATIVE_NUMBER = -1
    BITCODE_HASHES = []
    WASM_HASHES = []
    NATIVE_HASHES = []

    def __init__(self):
        pass

    @function_discrimator(event_type=EXPLORATION_RESULT)
    def wathever(self, data):
        self.TENTATIVE_NUMBER = data["tentative_number"]

    @function_discrimator(event_type=GENERATED_WASM_VARIANT)
    def on_generated_wasm(self, data):
        self.WASM_HASHES.append(data["hash"])

        socketio.emit("COUNT", dict(
            program_name="Program",
            total=len(self.WASM_HASHES),
            unique=len(set(self.WASM_HASHES)),
            type="wasm",
            at=STATUS["NOW"] - data["time"]
        ), json=True, namespace='/dashboard')

    @function_discrimator(event_type=NATIVE_WASMTIME_GENERATED)
    def on_generated_native(self, data):
        self.NATIVE_HASHES.append(data["hash"])

        socketio.emit("COUNT", dict(
            program_name="Program",
            total=len(self.NATIVE_HASHES),
            unique=len(set(self.NATIVE_HASHES)),
            type="native",
            at=STATUS["NOW"] - data["time"]
        ), json=True, namespace='/dashboard')

    @function_discrimator(event_type=GENERATED_BC_VARIANT)
    def on_generated_bc(self, data):
        self.COUNT += 1

        self.BITCODE_HASHES.append(data["hash"])

        if self.TENTATIVE_NUMBER == -1:  # WARNING something happend with the exploration service
            print(f"WARNING something happend with the exploration service. Count: {self.COUNT}")

        socketio.emit("NEW_VARIANT", dict(
            program_name="Program",
            count=self.COUNT,
            tentative=self.TENTATIVE_NUMBER if self.TENTATIVE_NUMBER != -1 else self.COUNT,
            at=STATUS["NOW"] - data["time"]
        ), json=True, namespace='/dashboard')

        socketio.emit("COUNT", dict(
            program_name="Program",
            total=len(self.BITCODE_HASHES),
            unique=len(set(self.BITCODE_HASHES)),
            type="bc",
            at=STATUS["NOW"] - data["time"]
        ), json=True, namespace='/dashboard')


l = ServerListener()

def start_listening_post():
    global l

    key = config["event"]["process-id-exploration"]
    subscriber = Subscriber(1, MONITOR_QUEUE_NAME, key, config["event"].getint("port"), l)
    subscriber.setup()

if __name__ == '__main__':
    APP_HOST = os.environ.get("DASHBOARD_HOST", '0.0.0.0')
    APP_PORT = int(os.environ.get("DASHBOARD_PORT", "8000"))

    th = Thread(target=start_listening_post, args=())
    th.start()

    socketio.run(app, debug=True, host=APP_HOST, port=APP_PORT)
    th.join()