import hashlib

from crow.commands.stages import WASM2WAT
from crow.entrypoints import GENERATED_WAT_KEY, WASM2WAT_KEY, STORE_KEY
from crow.events import STORE_MESSAGE, WASM2WAT_MESSAGE, GENERATED_WAT_FILE, WAT_QUEUE
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.settings import config

import sys
from crow.utils import ContentToTmpFile

import os
from crow.monitor.monitor import log_system_exception

publisher = Publisher()
COUNT = 0

@log_system_exception()
def wasm2wat(wasm, program_name, file_name = None, variant_name = None):
    global COUNT

    file_name = program_name if file_name is None else file_name
    with ContentToTmpFile(content=wasm, ext=".wasm", persist=False) as TMP_WASM:

        outTMP = TMP_WASM.file
        finalObjCreator = WASM2WAT(program_name, debug=True)
        finalObjCreator(args=[
            outTMP,
            "%s.wat" % (file_name,)]
        , std=None)

        if  config["DEFAULT"].getboolean("keep-wat-files"):
            # Explicitly saving wasm file
            publisher.publish(message=dict(
                event_type=STORE_MESSAGE,
                stream=open(f"{file_name}.wat", 'rb').read(),
                program_name=f"{program_name}",
                file_name=f"{file_name}.wat",
                path="wat"
            ), routing_key=STORE_KEY)

        watContent = open(f"{file_name}.wat", 'rb').read()
        hsh = hashlib.sha256(watContent).hexdigest()

        print(f"WASM2WAT ({COUNT}) {file_name}")
        publisher.publish(message=dict(
            event_type=GENERATED_WAT_FILE,
            stream=watContent,
            hash=hsh,
            program_name=f"{program_name}",
            variant_name=variant_name,
            file_name=f"{file_name}.wat"
        ), routing_key=GENERATED_WAT_KEY)

        os.remove("%s.wat" % (file_name,))
        COUNT += 1

@log_system_exception()
@subscriber_function(event_type=WASM2WAT_MESSAGE)
def subscriber(data):
    wasm2wat(data["stream"], data["program_name"], data["file_name"] if "file_name" in data else None)


if __name__ == "__main__":

    #updatesettings(sys.argv[2:-1])
    #f = sys.argv[-1]

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, WAT_QUEUE,WASM2WAT_KEY,  config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        wasm2wat(open(sys.argv[2], 'rb').read(), program_name)