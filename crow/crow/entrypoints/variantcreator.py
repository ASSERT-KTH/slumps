from crow.events import BC2Candidates_MESSAGE, BC_EXPLORATION_QUEUE, STORE_MESSAGE,BC2WASM_MESSAGE, GENERATION_QUEUE, \
    GENERATE_VARIANT_MESSAGE
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.sanitizer import Sanitizer
from crow.settings import config
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED
from crow.commands.stages import BCCountCandidates, TimeoutException
from crow.socket_server import listen

from crow.commands.stages import BCToSouper
from crow.utils import ContentToTmpFile
import threading, queue
import hashlib
import json
import redis
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED

import sys
import traceback
from crow.monitor.monitor import log_system_exception
import time
import operator

from functools import reduce
from crow.monitor.logger import LOGGER
import re


levelPool = None
publisher = Publisher()

r = None

def generateVariant(j, program_name, merging, bc):


    variants = []
    # print(f"Generating {job}")

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
        keys = list(merging.keys())
        for k, v in j.items():
            LOGGER.info(program_name, f"Setting redis db")

            if v is not None:
                name += "[%s-%s]" % (keys.index(k), merging[k].index(v))
                r.hset(k, "result", v)
            else:
                name += "[%s-n]" % (keys.index(k),)
                # search for infer word
                rer = re.compile(r"infer %(\d+)")
                kl = k
                if rer.search(kl):
                    r.hset(k, "result", ("result %%%s\n" % (rer.search(kl).group(1),)).encode("utf-8"))
                LOGGER.info(program_name, f"Replacing redundant key-value pair...")

        LOGGER.info(program_name, f"Preparing new variant generation...")

        with ContentToTmpFile(content=bc, LOG_LEVEL=2) as BCIN:
            tmpIn = BCIN.file
            with ContentToTmpFile(LOG_LEVEL=2) as BCOUT:
                tmpOut = BCOUT.file

                try:
                    sanitized_set_name = name
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
                            file_name=f"{program_name}{sanitized_set_name}.bc"
                        ), routing_key="")

                    # Launching task create wasm
                    if config["DEFAULT"].getboolean("keep-wasm-files"):
                        publisher.publish(message=dict(
                            event_type=BC2WASM_MESSAGE,
                            bc=bsOpt,
                            program_name=f"{program_name}",
                            file_name=f"{program_name}{sanitized_set_name}.bc"
                        ), routing_key="")

                except Exception as e:
                    LOGGER.error(program_name, traceback.format_exc(), )
                    raise e
        # call Souper and the linker again
    except Exception as e:
        LOGGER.error(program_name, traceback.format_exc())
    finally:

        LOGGER.info(program_name, "Cleaning cache from variant generation...")

        result = r.flushdb()
        LOGGER.success(
            program_name, f"Flushing redis DB: result({result})")
        r.close()
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
        subscriber = Subscriber(1, GENERATION_QUEUE, "*", config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        generatevariant(open(sys.argv[2], 'rb').read(), json.loads(open(sys.argv[1]).read()), {}) # First argument is a dictionary with the replacements to apply