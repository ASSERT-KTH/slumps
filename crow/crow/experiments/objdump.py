from crow.events import BC2Candidates_MESSAGE, BC_EXPLORATION_QUEUE, STORE_MESSAGE, GENERATE_VARIANT_MESSAGE, \
    EXPLORATION_RESULT, GENERATED_WASM_VARIANT, WASMTIME_QUEUE, NATIVE_WASMTIME_GENERATED, OBJDUMP_QUEUE, \
    MACHINE_CODE_DUMPED
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.sanitizer import Sanitizer
from crow.settings import config
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED
from crow.commands.stages import BCCountCandidates, TimeoutException, WASM2OBJ, OBJ2DUMP
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

def sanitize(content):

    result = []

    for line in content.split("\n")[3:]:# Remove first two lines that contains the file name
        result.append(line)


    return "\n".join(result)

@log_system_exception()
def objdump(obj, program_name, file_name):

    print("Getting machine code text...")
    with ContentToTmpFile(content=obj, LOG_LEVEL=2) as BCIN:
        tmpIn = BCIN.file

        try:
            LOGGER.info(program_name, f"Dumping native object {file_name}...")

            obj2dump = OBJ2DUMP(program_name, True)
            dump = obj2dump(args=[tmpIn], std=None).decode()

            publisher.publish(message=dict(
                event_type=MACHINE_CODE_DUMPED,
                stream=sanitize(dump).encode(errors="ignore"),
                options="",
                program_name=f"{program_name}",
                file_name=f"{file_name}.native",
                path="native/variants"
            ), routing_key="")

            publisher.publish(message=dict(
                event_type=STORE_MESSAGE,
                stream=sanitize(dump).encode(errors="ignore"),
                program_name=f"{program_name}",
                file_name=f"{file_name}.native.txt",
                path="native/variants/dump"
            ), routing_key="")



        except Exception as e:
            LOGGER.error(program_name, traceback.format_exc(), )
            raise e

@log_system_exception()
@subscriber_function(event_type=NATIVE_WASMTIME_GENERATED)
def subscriber(data):
    objdump(data["stream"],data["program_name"], data["file_name"])


if __name__ == "__main__":

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, OBJDUMP_QUEUE, "*", config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        objdump(open(sys.argv[2], 'rb').read(), program_name)