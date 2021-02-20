
from crow.commands.stages import CToLLStage
from crow.events import LOG_MESSAGE, C2LL_MESSAGE, LL2BC_MESSAGE, STORE_MESSAGE
from crow.events.event_manager import Publisher, subscriber_function, Subscriber
from crow.logger import ERROR

import sys
from crow.utils import printProgressBar, createTmpFile, getIteratorByName, \
    ContentToTmpFile, BreakException, RUNTIME_CONFIG, updatesettings, NOW

from crow.monitor.logger import log_system_exception

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
        ), routing_key=LOG_MESSAGE)
        return

    ctoll = CToLLStage(program_name)
    ll1 = ctoll(file)

    publisher.publish(message=dict(
        event_type=LL2BC_MESSAGE,
        ll=ll1,
        program_name=program_name,
    ), routing_key="")

    publisher.publish(message=dict(
        event_type=STORE_MESSAGE,
        stream=ll1,
        program_name=f"{program_name}",
        file_name=f"{program_name}.ll"
    ), routing_key="")


if __name__ == "__main__":

    #updatesettings(sys.argv[2:-1])
    #f = sys.argv[-1]

    if len(sys.argv) == 1:
        pass
        # Start a subscriber listening for C2LL message
    else:
        # Convert and send a LL to BC message
        c2ll(sys.argv[1])