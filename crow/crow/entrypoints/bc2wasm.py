
from crow.commands.stages import ObjtoWASM
from crow.events import LOG_MESSAGE, C2LL_MESSAGE, LL2BC_MESSAGE, BC2Candidates_MESSAGE, BC2WASM_MESSAGE, STORE_MESSAGE
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.logger import ERROR
from crow.settings import config

import sys
from crow.utils import printProgressBar, createTmpFile, getIteratorByName, \
    ContentToTmpFile, BreakException, RUNTIME_CONFIG, updatesettings, NOW

from crow.monitor.logger import log_system_exception

@log_system_exception()
def bc2wasm(bc, program_name):

    publisher = Publisher()

    with ContentToTmpFile(name="%s.bc" % program_name, content=bc, ext=".bc", persist=False) as TMP_WASM:
        tmpWasm = TMP_WASM.file

        finalObjCreator = ObjtoWASM(program_name, debug=True)
        finalObjCreator(args=[
            "%s.wasm" % (program_name,),
            tmpWasm
        ], std=None)

        # Explicitly saving wasm file
        publisher.publish(message=dict(
            event_type=STORE_MESSAGE,
            stream=open(f"{program_name}.wasm", 'rb').read(),
            program_name=f"{program_name}",
            file_name=f"{program_name}.wasm"
        ), routing_key="")


@log_system_exception()
@subscriber_function(event_type=BC2WASM_MESSAGE)
def subscriber(data):
    bc2wasm(data["bc"], data["program_name"])


if __name__ == "__main__":

    #updatesettings(sys.argv[2:-1])
    #f = sys.argv[-1]

    if len(sys.argv) == 1:
        key = config["event"]["process-id-exploration"]
        subscriber = Subscriber(1, config["event"]["queue-name"], key, config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        bc2wasm(open(sys.argv[2], 'rb').read(), program_name)