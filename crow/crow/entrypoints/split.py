import hashlib

from crow.commands.stages import ObjtoWASM, LLVMSplit, CountDeclarations
from crow.entrypoints import EXPLORE_KEY, STORE_KEY, GENERATED_WASM_KEY, GENERATED_WAT_KEY, BC2WASM_KEY, WASM2WAT_KEY, \
    SPLIT_KEY, SPLIT_MESSAGE
from crow.events import BC2WASM_MESSAGE, STORE_MESSAGE, WASM_QUEUE, WASM2WAT_MESSAGE, GENERATED_WASM_VARIANT, \
    BC2Candidates_MESSAGE, SPLIT_QUEUE
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.monitor.logger import LOGGER
from crow.settings import config

import sys
from crow.utils import ContentToTmpFile

import os
from crow.monitor.monitor import log_system_exception

COUNT = 0

publisher = Publisher()


@log_system_exception()
def split(bc, program_name, file_name=None):
    global COUNT
    file_name = program_name if file_name is None else file_name

    with ContentToTmpFile(name="%s.bc" % file_name, content=bc, ext=".bc", persist=False) as TMP_BC:
        tmpBC = TMP_BC.file

        print("Doing split")
        splitter = LLVMSplit(program_name)
        chunks = splitter(args=[
            config["DEFAULT"].getint("split-module-in"),
            f"out/{file_name}_",
            tmpBC
        ])

        print(chunks)

        counter = CountDeclarations(program_name)

        for i,chunk in enumerate(chunks):
            tmpOut=f"out/{file_name}_{i}_c"

            declared, defined = counter(args=[
                chunk,
                tmpOut
            ])

            if defined > 0:
                sys.stdout.write(f"\r{i}/{len(chunks)} {tmpOut} {chunk} {declared}/{defined}")
                # Save the piece
                stream = open(chunk, 'rb').read()
                publisher.publish(message=dict(
                    event_type=STORE_MESSAGE,
                    stream=stream,
                    program_name=f"{program_name}_{i}",
                    file_name=f"{program_name}_{i}.original.bc",
                    path=f"bitcodes"
                ), routing_key=STORE_KEY)

                # Call for exploration
                publisher.publish(message=dict(
                    event_type=BC2Candidates_MESSAGE,
                    bc=stream,
                    program_name=f"{program_name}_{i}"
                ), routing_key=EXPLORE_KEY)

                publisher.publish(message=dict(
                    event_type=BC2WASM_MESSAGE,
                    bc=stream,
                    program_name=f"{program_name}_{i}",
                    file_name=f"{program_name}_{i}.bc"
                ), routing_key=BC2WASM_KEY)

                os.remove(chunk)
                os.remove(tmpOut)


@log_system_exception()
@subscriber_function(event_type=SPLIT_MESSAGE)
def subscriber(data):
    split(data["bc"], data["program_name"], data["file_name"] if "file_name" in data else None)


if __name__ == "__main__":

    if not os.path.exists("out"):
        os.mkdir("out")

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, SPLIT_QUEUE, SPLIT_KEY, config["event"].getint("port"), subscriber)
        subscriber.setup()
    else:
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        split(open(sys.argv[2], 'rb').read(), program_name)