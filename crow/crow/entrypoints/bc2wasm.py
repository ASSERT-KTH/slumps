import hashlib

from crow.commands.stages import ObjtoWASM
from crow.entrypoints import EXPLORE_KEY, STORE_KEY, GENERATED_WASM_KEY, GENERATED_WAT_KEY, BC2WASM_KEY, WASM2WAT_KEY, \
    SPLIT_KEY, SPLIT_MESSAGE
from crow.events import BC2WASM_MESSAGE, STORE_MESSAGE, WASM_QUEUE, WASM2WAT_MESSAGE, GENERATED_WASM_VARIANT, CROW_HEARTBEAT_NEW_WASM , CROW_HEARTBEAT_NEW_WAT, CROW_HEARTBEAT_NEW_BC,CROW_HEARTBEAT_KEY_NEW_BC, CROW_HEARTBEAT_KEY_NEW_WASM , CROW_HEARTBEAT_KEY_NEW_WAT ,BC2Candidates_MESSAGE
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.monitor.logger import LOGGER
from crow.settings import config
import random
import sys
from crow.utils import ContentToTmpFile

import os
from crow.monitor.monitor import log_system_exception
import traceback

COUNT = 0

publisher = Publisher()


@log_system_exception()
def bc2wasm(bc, program_name, file_name=None, variant_name=None, explore=False):
    global COUNT
    hsh_bc = hashlib.md5(bc).hexdigest()
    file_name = program_name if file_name is None else file_name
    # Explicitly saving bc file
    publisher.publish(message=dict(
        event_type=STORE_MESSAGE,
        stream=bc,
        program_name=program_name,
        file_name=f"{program_name}.original.bc",
        path=f"bitcodes/variants"
    ), routing_key=STORE_KEY)

    if explore:

        if config["DEFAULT"].getint("split-module-in") > 0:
            # Split then
            # Call for candidates exploration
            publisher.publish(message=dict(
                event_type=SPLIT_MESSAGE,
                bc=bc,
                program_name=program_name
            ), routing_key=SPLIT_KEY)
        else:
            # Call for candidates exploration
            publisher.publish(message=dict(
                event_type=BC2Candidates_MESSAGE,
                bc=bc,
                program_name=program_name
            ), routing_key=EXPLORE_KEY)

    # 2 WASM transformation
    if config["DEFAULT"].getboolean("keep-wasm-files"):
        with ContentToTmpFile(name="%s.bc" % file_name, content=bc, ext=".bc", persist=False) as TMP_WASM:
            tmpWasm = TMP_WASM.file

            finalObjCreator = ObjtoWASM(file_name, debug=True)
            finalObjCreator(args=[
                "%s.wasm" % (file_name,),
                tmpWasm
            ], std=None)

            try:
                st = open(f"{file_name}.wasm", 'rb').read()
            except Exception as e:
                print(e, traceback.format_exc())
                LOGGER.error(program_name, f"{e}")
                return
            # Explicitly saving wasm file
            print(f"WASM hash ", hashlib.md5(st).hexdigest())

            publisher.publish(message=dict(
                event_type=CROW_HEARTBEAT_NEW_WASM,
                program_name=program_name,
                file_name=file_name,
                hsh=hashlib.md5(st).hexdigest(),
                parent = hsh_bc,
                )
            , routing_key=CROW_HEARTBEAT_KEY_NEW_WASM)

            publisher.publish(message=dict(
                event_type=STORE_MESSAGE,
                stream=st,
                program_name=program_name,
                file_name=f"{file_name}.wasm",
                path=f"wasm"
            ), routing_key=STORE_KEY)

            hsh = hashlib.md5(st).hexdigest()

            publisher.publish(message=dict(
                event_type=GENERATED_WASM_VARIANT,
                stream=st,
                hash=hsh,
                program_name=program_name,
                variant_name=variant_name,
                file_name=f"{file_name}.wasm"
            ), routing_key=GENERATED_WASM_KEY)

            print(f"BC2WASM ({COUNT}) {program_name} {file_name}")
            # Generate wat file ?
            if config["DEFAULT"].getboolean("keep-wat-files"):
                publisher.publish(message=dict(
                    event_type=WASM2WAT_MESSAGE,
                    stream=st,
                    program_name=program_name,
                    file_name=f"{file_name}"
                ), routing_key=WASM2WAT_KEY)

            os.remove("%s.wasm" % (file_name,))
            COUNT += 1

@log_system_exception()
@subscriber_function(event_type=BC2WASM_MESSAGE)
def subscriber(data):
    bc2wasm(data["bc"], data["program_name"], data["file_name"] if "file_name" in data else None, data["variant_name"] if "variant_name" in data else None, False)


if __name__ == "__main__":

    if len(sys.argv) == 1:
        id = f"bc2wasm-{random.randint(0, 2000)}"
        subscriber = Subscriber(id, WASM_QUEUE, BC2WASM_KEY, config["event"].getint("port"), subscriber)
        subscriber.setup()
    else:
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        bc2wasm(open(sys.argv[2], 'rb').read(), program_name, explore=True)