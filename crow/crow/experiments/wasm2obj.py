from crow.events import STORE_MESSAGE, GENERATED_WASM_VARIANT, WASMTIME_QUEUE, NATIVE_WASMTIME_GENERATED
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.settings import config
from crow.commands.stages import WASM2OBJ

from crow.utils import ContentToTmpFile
import hashlib

import sys
import traceback
from crow.monitor.monitor import log_system_exception

from crow.monitor.logger import LOGGER

publisher = Publisher()
COUNT = 0

@log_system_exception()
def wasm2obj(wasm, program_name, file_name, variant_name):
    global COUNT

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
                print(f"WASMTIME {COUNT} {file_name} {hashvalue} {h2}")

                publisher.publish(message=dict(
                    event_type=NATIVE_WASMTIME_GENERATED,
                    stream=nativeObj,
                    hash=h2,
                    options="",
                    program_name=f"{program_name}",
                    file_name=f"{file_name}.native",
                    variant_name=variant_name,
                    path="native/variants"
                ), routing_key="")

                publisher.publish(message=dict(
                    event_type=STORE_MESSAGE,
                    stream=nativeObj,
                    program_name=f"{program_name}",
                    file_name=f"{file_name}.native",
                    path="native/variants"
                ), routing_key="")

                COUNT += 1

            except Exception as e:
                LOGGER.error(program_name, traceback.format_exc(), )
                raise e

@log_system_exception()
@subscriber_function(event_type=GENERATED_WASM_VARIANT)
def subscriber(data):
    wasm2obj(data["stream"],data["program_name"], data["file_name"], data["variant_name"])


if __name__ == "__main__":

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, WASMTIME_QUEUE, config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        wasm2obj(open(sys.argv[2], 'rb').read(), program_name, None)