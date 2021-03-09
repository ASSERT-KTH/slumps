from crow.events import STORE_MESSAGE, NATIVE_WASMTIME_GENERATED, OBJDUMP_QUEUE, \
    MACHINE_CODE_DUMPED
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.settings import config
from crow.commands.stages import OBJ2DUMP

from crow.utils import ContentToTmpFile
import re

import sys
import traceback
from crow.monitor.monitor import log_system_exception

from crow.monitor.logger import LOGGER

publisher = Publisher()

def sanitize(content):

    result = []

    for line in content.split("\n")[3:]:# Remove first two lines that contains the file name
        ln: str = line
        result.append(re.sub(r"[\d\w]+:", "", ln)) # Remove address of the instruction


    return "\n".join(result)
COUNT = 0

@log_system_exception()
def objdump(obj, program_name, file_name, variant_name):
    global COUNT
    #print("Getting machine code text...")
    with ContentToTmpFile(content=obj, LOG_LEVEL=2) as BCIN:
        tmpIn = BCIN.file

        try:
            LOGGER.info(program_name, f"Dumping native object {file_name}...")

            obj2dump = OBJ2DUMP(program_name, True)
            dump = obj2dump(args=[tmpIn], std=None).decode()

            publisher.publish(message=dict(
                event_type=MACHINE_CODE_DUMPED,
                stream=sanitize(dump).encode(),
                options="",
                program_name=f"{program_name}",
                variant_name=variant_name,
                file_name=f"{file_name}.native",
            ), routing_key="")

            publisher.publish(message=dict(
                event_type=STORE_MESSAGE,
                stream=sanitize(dump).encode(),
                program_name=f"{program_name}",
                file_name=f"{file_name}.dump.txt",
                path="native/variants/dump"
            ), routing_key="")

            print(f"OBJDUMP ({COUNT})")
            COUNT += 1

        except Exception as e:
            LOGGER.error(program_name, traceback.format_exc(), )
            raise e

@log_system_exception()
@subscriber_function(event_type=NATIVE_WASMTIME_GENERATED)
def subscriber(data):
    objdump(data["stream"],data["program_name"], data["file_name"],  data["variant_name"])


if __name__ == "__main__":

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, OBJDUMP_QUEUE, config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        objdump(open(sys.argv[2], 'rb').read(), program_name, None)