from crow.cache import cache
from crow.entrypoints import CREATE_VARIANT_KEY, STORE_KEY, GENERATED_BC_KEY, BC2WASM_KEY
from crow.events import STORE_MESSAGE,BC2WASM_MESSAGE, \
    GENERATION_QUEUE,GENERATE_VARIANT_MESSAGE, GENERATED_BC_VARIANT

from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.settings import config

from crow.commands.stages import BCToSouper
from crow.utils import ContentToTmpFile
import hashlib
import json
import redis
from concurrent.futures import ThreadPoolExecutor
import random

import sys
import traceback
from crow.monitor.monitor import log_system_exception

from crow.monitor.logger import LOGGER
import re
import base64
import os

CACHE = cache.getcache(True)

levelPool = None
publisher = Publisher()

port = None

COUNT = 0

def generateVariant(j, program_name, merging, bc):
    global COUNT

    variants = []

    # print(f"Generating {COUNT} {program_name} {j}")

    try:
        name = "][".join([base64.b64encode(os.urandom(32))[:8].decode(errors="ignore")\
            .replace("\\", "_").replace("+", "_").replace("-", "_").replace("/", "_") for _ in range(len(j.keys()))])

        CACHE.init(f"{program_name}:variants:{name}", j)

        #LOGGER.info(program_name, f"Preparing new variant generation...{name}")

        with ContentToTmpFile(content=bc, LOG_LEVEL=2) as BCIN:
            tmpIn = BCIN.file
            with ContentToTmpFile(LOG_LEVEL=2) as BCOUT:
                tmpOut = BCOUT.file

                try:
                    sanitized_set_name = f"_[{name}]"
                    LOGGER.info(program_name, f"Generating variant {sanitized_set_name}...")

                    optBc = BCToSouper(program_name, j, level=1, debug=True, redisport=port,
                                       timeout=config["DEFAULT"].getint("generation-simple-timeout") - 1)
                    optBc(args=[tmpIn, tmpOut], std=None)

                    bsOpt = open(tmpOut, 'rb').read()

                    # Explicitly saving bitcode file

                    hsh = hashlib.sha256(bsOpt).hexdigest()
                    keybc = f"{program_name}:bc:{hsh}"
                    if not CACHE.has(keybc) or not config['DEFAULT'].getboolean("prune-equal"):
                        print(f"Generating variant {program_name} {sanitized_set_name}...")
                        if config["DEFAULT"].getboolean("keep-bc-files"):

                            publisher.publish(message=dict(
                                event_type=STORE_MESSAGE,
                                stream=bsOpt,
                                program_name=f"{program_name}",
                                variant_name=sanitized_set_name,
                                file_name=f"{program_name}{sanitized_set_name}.bc",
                                path=f"bitcodes/variants"
                            ), routing_key=STORE_KEY)

                            if config["DEFAULT"].getboolean("keep-wasm-files"):
                                print(f"Sending task to generate WASM...")
                                publisher.publish(message=dict(
                                    event_type=GENERATED_BC_VARIANT,
                                    bc=bsOpt,
                                    hash=hsh,
                                    program_name=f"{program_name}",
                                    variant_name=sanitized_set_name,
                                    file_name=f"{program_name}{sanitized_set_name}.bc"
                                ), routing_key=GENERATED_BC_KEY)

                        # Launching task create wasm
                        if config["DEFAULT"].getboolean("keep-wasm-files"):
                            publisher.publish(message=dict(
                                event_type=BC2WASM_MESSAGE,
                                bc=bsOpt,
                                program_name=f"{program_name}",
                                variant_name=sanitized_set_name,
                                file_name=f"{program_name}{sanitized_set_name}.bc"
                            ), routing_key=BC2WASM_KEY)

                        COUNT += 1

                        # Save for later debugging the replacements placed together
                        publisher.publish(message=dict(
                            event_type=STORE_MESSAGE,
                            stream=json.dumps(dict(name=sanitized_set_name, job=j, created=True), indent=4).encode(),
                            program_name=f"{program_name}",
                            variant_name=sanitized_set_name,
                            file_name=f"{program_name}{sanitized_set_name}.json",
                            path=f"bitcodes/maps"
                        ), routing_key=STORE_KEY)

                    else:
                        publisher.publish(message=dict(
                            event_type=STORE_MESSAGE,
                            stream=json.dumps(dict(name=sanitized_set_name, job=j, created=False), indent=4).encode(),
                            program_name=f"{program_name}",
                            variant_name=sanitized_set_name,
                            file_name=f"{program_name}{sanitized_set_name}.json",
                            path=f"bitcodes/maps"
                        ), routing_key=STORE_KEY)

                        CACHE.addtoexisting(keybc, dict(
                                event_type=STORE_MESSAGE,
                                program_name=f"{program_name}",
                                variant_name=sanitized_set_name,
                                file_name=f"{program_name}{sanitized_set_name}.bc",
                                path=f"bitcodes/variants"
                            ))
                except Exception as e:
                    print(f"{e} {traceback.format_exc()}")
                    publisher.publish(message=dict(
                            event_type=STORE_MESSAGE,
                            stream=json.dumps(dict(name=sanitized_set_name, job=j, error=True, created=False, errr=f"{e} {traceback.format_exc()}"), indent=4).encode(),
                            program_name=f"{program_name}",
                            variant_name=sanitized_set_name,
                            file_name=f"{program_name}{sanitized_set_name}.json",
                            path=f"bitcodes/maps"
                        ), routing_key=STORE_KEY)
                   # LOGGER.error(program_name, traceback.format_exc(), )
        # call Souper and the linker again
    except Exception as e:
        print(f"{e} {traceback.format_exc()}")
        LOGGER.error(program_name, traceback.format_exc())
    finally:
        pass
    print(f"Done")
    return variants


@log_system_exception()
def generatevariant(bc, replacements, exploration, program_name):
    generateVariant(replacements, program_name, exploration, bc)



@log_system_exception()
@subscriber_function(event_type=GENERATE_VARIANT_MESSAGE)
def subscriber(data):
    generatevariant(data["bc"], data["replacements"], data["overall"], data["program_name"])


if __name__ == "__main__":

    levelPool = ThreadPoolExecutor(
    max_workers=config["DEFAULT"].getint("workers"))

    if len(sys.argv) == 1:
        id = f"variantcreator-{random.randint(0, 2000)}"
        subscriber = Subscriber(id, GENERATION_QUEUE, CREATE_VARIANT_KEY, config["event"].getint("port"), subscriber)
        subscriber.setup()
    else:
        generatevariant(open(sys.argv[2], 'rb').read(), {}, {}, sys.argv[3]) # First argument is a dictionary with the replacements to apply