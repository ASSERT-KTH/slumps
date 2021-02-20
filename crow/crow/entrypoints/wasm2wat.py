
from crow.commands.stages import WASM2WAT
from crow.events import STORE_MESSAGE, WASM2WAT_MESSAGE, WAT_QUEUE
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.settings import config

import sys
from crow.utils import ContentToTmpFile

import os
from crow.monitor.monitor import log_system_exception

@log_system_exception()
def wasm2wat(wasm, program_name, file_name = None):

    publisher = Publisher()

    file_name = program_name if file_name is None else file_name
    print(file_name)

    with ContentToTmpFile(name="%s.wasm" % file_name, content=wasm, ext=".wasm", persist=False) as TMP_WASM:

        finalObjCreator = WASM2WAT(program_name, debug=True)
        finalObjCreator(args=[
            "%s.wasm" % (file_name,),
            "%s.wat" % (file_name,)]
        , std=None)

        if  config["DEFAULT"].getboolean("keep-wat-files"):
            # Explicitly saving wasm file
            publisher.publish(message=dict(
                event_type=STORE_MESSAGE,
                stream=open(f"{file_name}.wat", 'rb').read(),
                program_name=f"{program_name}",
                file_name=f"{file_name}.wat"
            ), routing_key="")

        os.remove("%s.wat" % (file_name,))

@log_system_exception()
@subscriber_function(event_type=WASM2WAT_MESSAGE)
def subscriber(data):
    wasm2wat(data["stream"], data["program_name"], data["file_name"] if "file_name" in data else None)


if __name__ == "__main__":

    #updatesettings(sys.argv[2:-1])
    #f = sys.argv[-1]

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, WAT_QUEUE, "*", config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        wasm2wat(open(sys.argv[2], 'rb').read(), program_name)