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

r = None
port = None

COUNT = 0

def generateVariant(j, program_name, merging, bc):
    global COUNT

    variants = []
    print(f"Generating {COUNT}")

    LOGGER.info(program_name, f"Cleaning previous cache for variant generation...{port}")
    try:
        LOGGER.success(program_name, f"Flushing redis DB...")

        result = r.flushall()
        LOGGER.success(program_name, f"DB flushed away: result({result})")
    except Exception as e:
        LOGGER.error(program_name, traceback.format_exc())

    # Set keys

    name = ""

    try:
        for k, v in j.items():
            LOGGER.info(program_name, f"Setting redis db")

            if v is not None:
        #        name += "[%s-%s]" % (keys.index(k), merging[k].index(v))
                r.hset(k, "result", v)
            else:
         #       name += "[%s-n]" % (keys.index(k),)
                # search for infer word
                rer = re.compile(r"infer %(\d+)")
                kl = k
                if rer.search(kl):
                    r.hset(k, "result", ("result %%%s\n" % (rer.search(kl).group(1),)).encode("utf-8"))
                LOGGER.info(program_name, f"Replacing redundant key-value pair...")

        name = base64.b64encode(os.urandom(32))[:8].decode(errors="ignore")\
            .replace("\\", "_").replace("+", "_").replace("-", "_")

        CACHE.init(f"{program_name}:variants:{name}", j)

        LOGGER.info(program_name, f"Preparing new variant generation...{name}")

        with ContentToTmpFile(content=bc, LOG_LEVEL=2) as BCIN:
            tmpIn = BCIN.file
            with ContentToTmpFile(LOG_LEVEL=2) as BCOUT:
                tmpOut = BCOUT.file

                try:
                    sanitized_set_name = f"_[{name}]"
                    print(f"Generating variant {program_name} {sanitized_set_name}...")
                    LOGGER.info(program_name, f"Generating variant {sanitized_set_name}...")

                    optBc = BCToSouper(program_name, level=1, debug=True, redisport=port,
                                       timeout=config["DEFAULT"].getint("generation-simple-timeout") - 1)
                    optBc(args=[tmpIn, tmpOut], std=None)

                    bsOpt = open(tmpOut, 'rb').read()

                    # Explicitly saving bitcode file

                    if config["DEFAULT"].getboolean("keep-bc-files"):
                        publisher.publish(message=dict(
                            event_type=STORE_MESSAGE,
                            stream=bsOpt,
                            program_name=f"{program_name}",
                            variant_name=sanitized_set_name,
                            file_name=f"{program_name}{sanitized_set_name}.bc",
                            path="bitcodes/variants"
                        ), routing_key=STORE_KEY)

                        hsh = hashlib.sha256(bsOpt).hexdigest()
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
                except Exception as e:
                    print(f"{e} {traceback.format_exc()}")
                    LOGGER.error(program_name, traceback.format_exc(), )
        # call Souper and the linker again
    except Exception as e:
        print(f"{e} {traceback.format_exc()}")
        LOGGER.error(program_name, traceback.format_exc())
    finally:

        LOGGER.info(program_name, "Cleaning cache from generation...")

        result = r.flushdb()
        LOGGER.success(
            program_name, f"Final flushing: result({result})")
    return variants

REDIS_PORT=9090

@log_system_exception()
def generatevariant(bc, replacements, exploration, program_name):
    generateVariant(replacements, program_name, exploration, bc)



@log_system_exception()
@subscriber_function(event_type=GENERATE_VARIANT_MESSAGE)
def subscriber(data):
    generatevariant(data["bc"], data["replacements"], data["overall"], data["program_name"])


if __name__ == "__main__":

    #updatesettings(sys.argv[2:-1])
    #f = sys.argv[-1]
    port=int(sys.argv[1])
    r = redis.Redis(host="localhost", port=port)
    levelPool = ThreadPoolExecutor(
    max_workers=config["DEFAULT"].getint("workers"))

    if len(sys.argv) == 2:
        subscriber = Subscriber(1, GENERATION_QUEUE, CREATE_VARIANT_KEY, config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        generatevariant(open(sys.argv[2], 'rb').read(), json.loads(open(sys.argv[1]).read()), {}) # First argument is a dictionary with the replacements to apply