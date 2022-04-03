import hashlib

from crow.commands.stages import ObjtoWASM, LLVMSplit, CountDeclarations, LLVMExtract
from crow.entrypoints import EXPLORE_KEY, STORE_KEY, GENERATED_WASM_KEY, GENERATED_WAT_KEY, BC2WASM_KEY, WASM2WAT_KEY, \
    SPLIT_KEY, SPLIT_MESSAGE
from crow.events import BC2WASM_MESSAGE, STORE_MESSAGE,CROW_HEARTBEAT_NEW_FUNCTION, CROW_HEARTBEAT_NEW_PROGRAM, CROW_HEARTBEAT_NEW_PROGRAM, CROW_HEARTBEAT_KEY_NEW_PROGRAM, CROW_HEARTBEAT_KEY_NEW_FUNCTION, WASM_QUEUE, WASM2WAT_MESSAGE, GENERATED_WASM_VARIANT, \
    BC2Candidates_MESSAGE, SPLIT_QUEUE
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.monitor.logger import LOGGER
from crow.settings import config
import json
import subprocess
import sys
from crow.utils import ContentToTmpFile
import time
import os
from crow.monitor.monitor import log_system_exception
import re
import random

COUNT = 0

publisher = Publisher()


@log_system_exception()
def split(bc, program_name, file_name=None):
    # Send even to heart queue
    hsh_original = hashlib.md5(bc).hexdigest()
    
    global COUNT
    file_name = program_name if file_name is None else file_name
    
    original = open("%s.bc" % file_name, 'wb')
    original.write(bc)
    original.close()

    #time.sleep(1)
    publisher.publish(message=dict(
                            event_type=CROW_HEARTBEAT_NEW_PROGRAM,
                            program_name=program_name,
                            hsh=hsh_original
                        ), routing_key=CROW_HEARTBEAT_KEY_NEW_PROGRAM)


    print("Reading file declaration")
    # o = subprocess.check_output(["ls", "-lah"])
    # print(o.decode())

    tmpOut=f"{file_name}_count"

    counter = CountDeclarations(program_name)
    declared, defined = counter(args=[
                    "%s.bc" % file_name,
                    tmpOut
                ])

    print("Meta", len(declared), len(defined))
    time.sleep(1)
    # Send this to a queue to prevent the channel to close
    META = {}
    filterre = config["extract"]["filter"]
    print("Filter", filterre)
    for i, def_ in enumerate(defined):
        if filterre == "*" or re.compile(filterre).match(def_):
            print(f"Extracting {i + 1}/{len(defined)}", def_)
            try:
                original = open("%s.bc" % file_name, 'wb')
                original.write(bc)
                original.close()    
                extractor = LLVMExtract(program_name)
                # Hash the name and send the map for saving
                name = hashlib.md5(def_.encode()).hexdigest()
                META[name] = def_
                functionbc = extractor(args=[
                    def_,
                    "%s.bc" % file_name,
                    "%s.bc" % name
                ])
                stream = open("%s.bc" % name, 'rb').read()

                publisher.publish(message=dict(
                            event_type=STORE_MESSAGE,
                            stream=stream,
                            program_name=f"{program_name}_{name}",
                            file_name=f"{program_name}_{name}.original.bc",
                            path=f"bitcodes"
                        ), routing_key=STORE_KEY)
                
                hsh_fb = hashlib.md5(stream).hexdigest()

                publisher.publish(message=dict(
                            event_type=CROW_HEARTBEAT_NEW_FUNCTION,
                            program_name=program_name,
                            name=name,
                            hsh=hsh_fb,
                            original=hsh_original,
                            status="PENDING",
                            realname=def_)
                            , routing_key=CROW_HEARTBEAT_KEY_NEW_FUNCTION)

                # Call for exploration
                publisher.publish(message=dict(
                    event_type=BC2Candidates_MESSAGE,
                    bc=stream,
                    program_name=f"{program_name}_{name}"
                ), routing_key=EXPLORE_KEY)

                publisher.publish(message=dict(
                    event_type=BC2WASM_MESSAGE,
                    bc=stream,
                    program_name=f"{program_name}_{name}",
                    file_name=f"{program_name}_{name}.bc"
                ), routing_key=BC2WASM_KEY)


                os.remove("%s.bc" % name)
            except Exception as e:
                print("Error", e)
                #print("Sending full bitcode instead")
                # Call for exploration
                #publisher.publish(message=dict(
                #    event_type=BC2Candidates_MESSAGE,
                #    bc=bc,
                #    program_name=f"{program_name}"
                #), routing_key=EXPLORE_KEY)
            publisher.publish(message=dict(
                event_type=STORE_MESSAGE,
                stream=json.dumps({name: def_}, indent=4).encode(),
                program_name=f"{program_name}",
                variant_name=f"extraction_{name}",
                file_name=f"extraction_{name}.json",
                path=f"bitcodes/extraction"
            ), routing_key=STORE_KEY)
        # Read file and send
    
    publisher.publish(message=dict(
        event_type=STORE_MESSAGE,
        stream=json.dumps(META, indent=4).encode(),
        program_name=f"{program_name}",
        variant_name=f"extraction_all",
        file_name=f"extraction_all.json",
        path=f"bitcodes/extraction"
    ), routing_key=STORE_KEY)
    os.remove("%s.bc"%file_name)

@log_system_exception()
@subscriber_function(event_type=SPLIT_MESSAGE)
def subscriber(data):
    split(data["bc"], data["program_name"], data["file_name"] if "file_name" in data else None)


if __name__ == "__main__":

    if not os.path.exists("out"):
        os.mkdir("out")

    if len(sys.argv) == 1:
        id = f"extractor-{random.randint(0, 2000)}"
        subscriber = Subscriber(id, SPLIT_QUEUE, SPLIT_KEY, config["event"].getint("port"), subscriber, ack_on_receive=True)
        subscriber.setup()
    else:
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        split(open(sys.argv[2], 'rb').read(), program_name)