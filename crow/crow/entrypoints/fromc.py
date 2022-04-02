
from crow.commands.stages import CToLLStage
from crow.entrypoints import LOG_KEY, GENERATE_BC_KEY, STORE_KEY, LL_KEY
from crow.events import LOG_MESSAGE, LL2BC_MESSAGE, STORE_MESSAGE
from crow.events.event_manager import Publisher
from crow.monitor.logger import ERROR
import random

import sys

from crow.monitor.monitor import log_system_exception
from crow.settings import config

@log_system_exception()
def c2ll(file):
    program_name = file.split("/")[-1].split(".")[0]

    publisher = Publisher()

    # TODO the validation of a C file is done using file extension, use clang compilable instead
    if not file.endswith(".c") and not file.endswith(".cpp"):
        # Publish a log message
        publisher.publish(message = dict(
            event_type = LOG_MESSAGE,
            message = f"File {file} is not a valid C/C++ file",
            severity=ERROR,
        ), routing_key=LOG_KEY)
        return

    ctoll = CToLLStage(program_name)
    ll1 = ctoll(file)

    publisher.publish(message=dict(
        event_type=LL2BC_MESSAGE,
        ll=ll1,
        program_name=program_name,
    ), routing_key=LL_KEY)

    if config["DEFAULT"].getboolean("keep-ll-files"):
        publisher.publish(message=dict(
            event_type=STORE_MESSAGE,
            stream=ll1,
            program_name=f"{program_name}",
            file_name=f"{program_name}.ll",
            path="ll"
        ), routing_key=STORE_KEY)


if __name__ == "__main__":

    if len(sys.argv) == 1:
        pass
    else:
        c2ll(sys.argv[1])