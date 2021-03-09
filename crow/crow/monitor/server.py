from flask import Flask, jsonify, request, url_for
from flask_socketio import SocketIO, emit, join_room, leave_room, send, Namespace
from threading import Thread
from flask_basicauth import BasicAuth
from flask_cors import CORS

import os
import threading
import json

from crow.events import GENERATED_BC_VARIANT, EXPLORATION_RESULT, GENERATED_WASM_VARIANT, NATIVE_WASMTIME_GENERATED, \
    GENERATE_VARIANT_MESSAGE, MACHINE_CODE_DUMPED
from crow.events.event_manager import subscriber_function, Subscriber, Listener, function_discrimator, listener
from crow.experiments.pairwisediff import UnixDiffComparer
from crow.monitor import MONITOR_QUEUE_NAME, SERVER_QUEUE_NAME
from crow.settings import config
import random

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

    def __init__(self):
        self.diff_analyser = UnixDiffComparer(cb=self.send_stability)

        self.COUNT = 0
        self.TENTATIVE_NUMBER = -1
        self.BITCODE_HASHES = []
        self.WASM_HASHES = []
        self.NATIVE_HASHES = []

        self.BUFFER = []
        self.BUFFER_MAX = 100

    def emit(self, tpe, data, namespace):

        self.BUFFER.append((
            tpe, data, namespace
        ))

        if len(self.BUFFER) >= self.BUFFER_MAX:
            for tp, d, n in self.BUFFER:

                print(f"TOTAL LLVM {len(self.BITCODE_HASHES)} TOTAL WASM {len(self.WASM_HASHES)} TOTAL NATIVE {len(self.NATIVE_HASHES)}")
                print(f"UNIQUE LLVM {len(set(self.BITCODE_HASHES))} UNIQUE WASM {len(set(self.WASM_HASHES))} UNIQUE NATIVE {len(set(self.NATIVE_HASHES))}")
                socketio.emit(tp, d, json=True, namespace=namespace)

            self.BUFFER = []

    @function_discrimator(event_type=EXPLORATION_RESULT)
    def send_exploration_result(self, data):
        if data["tentative_number"] != -1:
            self.TENTATIVE_NUMBER = data["tentative_number"]

        self.emit("NEW_VARIANT", dict(
                program_name="Program",
                count=self.COUNT,
                tentative=self.TENTATIVE_NUMBER,
                at=STATUS["NOW"] - data["time"]
            ), "/dashboard")

    def send_stability(self, name, total, llvm, wasm, native):

        self.emit("STABILITY", dict(
                program_name="Program",
                total=total,
                llvm=llvm,
                wasm = wasm,
                native=native
            ), "/dashboard")

    @function_discrimator(event_type=GENERATED_WASM_VARIANT)
    def on_generated_wasm(self, data):
        self.WASM_HASHES.append(data["hash"])

        self.emit("COUNT", dict(
                program_name="Program",
                total=len(self.WASM_HASHES),
                unique=len(set(self.WASM_HASHES)),
                type="wasm",
                at=STATUS["NOW"] - data["time"]
            ), "/dashboard")


        self.diff_analyser.on_receive_wasm(data)

    @function_discrimator(event_type=MACHINE_CODE_DUMPED)
    def on_receive_dumped_code(self, data):
        self.diff_analyser.on_receive(data)

    @function_discrimator(event_type=NATIVE_WASMTIME_GENERATED)
    def on_generated_native(self, data):
        self.NATIVE_HASHES.append(data["hash"])

        self.emit("COUNT", dict(
                program_name="Program",
                total=len(self.NATIVE_HASHES),
                unique=len(set(self.NATIVE_HASHES)),
                type="native",
                at=STATUS["NOW"] - data["time"]
            ), "/dashboard")

    @function_discrimator(event_type=GENERATED_BC_VARIANT)
    def on_generated_bc(self, data):
        self.COUNT += 1

        self.BITCODE_HASHES.append(data["hash"])

        #   if self.TENTATIVE_NUMBER == -1:  # WARNING something happend with the exploration service
        print(f"Count: {self.COUNT} {self.TENTATIVE_NUMBER}")

        self.emit("NEW_VARIANT", dict(
                program_name="Program",
                count=self.COUNT,
                tentative=self.TENTATIVE_NUMBER,
                at=STATUS["NOW"] - data["time"]
            ), "/dashboard")
        self.emit("COUNT", dict(
                program_name="Program",
                total=len(self.BITCODE_HASHES),
                unique=len(set(self.BITCODE_HASHES)),
                type="bc",
                at=STATUS["NOW"] - data["time"]
            ), "/dashboard")

        self.diff_analyser.on_receive_bc(data)


def start_listening_post():
    l = ServerListener()
    subscriber = Subscriber(1, SERVER_QUEUE_NAME, config["event"].getint("port"), l)
    subscriber.setup()

if __name__ == '__main__':
    APP_HOST = os.environ.get("DASHBOARD_HOST", '0.0.0.0')
    APP_PORT = int(os.environ.get("DASHBOARD_PORT", "8000"))


    th = Thread(target=start_listening_post, args=())
    th.start()

    socketio.run(app, debug=True, host=APP_HOST, port=APP_PORT)
    th.join()