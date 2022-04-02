from crow.cache import cache
from crow.entrypoints import EXPLORE_KEY, CREATE_VARIANT_KEY, STORE_KEY, GENERATED_BC_KEY, BC2WASM_KEY
from crow.events import BC2Candidates_MESSAGE, BC_EXPLORATION_QUEUE, STORE_MESSAGE, GENERATE_VARIANT_MESSAGE, \
    EXPLORATION_RESULT, GENERATED_BC_VARIANT, BC2WASM_MESSAGE
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.sanitzers.sanitizer import Sanitizer
from crow.settings import config
from crow.commands.stages import BCCountCandidates, TimeoutException, BCToSouper, fix_key, fix_pair
from crow.socket_server import listen
import random

from crow.utils import print_timer
from crow.utils import ContentToTmpFile, getIteratorByName, printinSameLine
import threading, queue
import json
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED
import os
import base64
import sys
import traceback
from crow.monitor.monitor import log_system_exception
import time
import operator

from functools import reduce
from crow.monitor.logger import LOGGER
from crow.utils import get_variant_name
from crow.sanitzers.overlap import SouperParser
import re
import threading
import multiprocessing
import hashlib
import time
import itertools

levelPool = None
sendPool = None

publisher = Publisher()
def chunkIt(s, num):
    avg = len(s) / float(num)
    out = []
    last = 0.0

    while last < len(s):
        out.append(s[int(last):int(last + avg)])
        last += avg

    return out

SANITIZER=Sanitizer(
        sanitize_redundant=config["sanitizer"].getboolean("sanitize-redundant"),
        sanitize_no_wasm=config["sanitizer"].getboolean("sanitize-non-wasm"),
        report_overlapping=config["sanitizer"].getboolean("report-overlapping"))

OVERALL_COUNT = 0
CACHE = cache.getcache(True)


def get_job_key(job):

    r = ""

    for k, v in job.items():
        kstr = hashlib.md5(k.encode()).hexdigest()
        vstr = hashlib.md5(v.encode()).hexdigest() if v else "None"

        r += f"{kstr}:{vstr}"

    return r

SEND_SEMAPHORE = threading.Semaphore(0)
print(SEND_SEMAPHORE)



def send_th(job, program_name, merging, bc):
    global publisher
    COUNT = 2
    while True:
        try:
            publisher.publish(message=dict(
                event_type=GENERATE_VARIANT_MESSAGE,
                bc=bc,
                program_name=f"{program_name}",
                replacements=job,
                overall=merging
            ), routing_key=CREATE_VARIANT_KEY)

            print(f"Size {len(job)}")
            break
        except Exception as e:
            print("Failing to send the generation job", e)
            print("Waiting for 30 seconds")
            publisher = Publisher()
            if COUNT > 0:
                time.sleep(30) 
                COUNT -= 1
            else: 
                break

        SEND_SEMAPHORE.release()

QUEUE = []

def send_consumer():
    global QUEUE
    print("Starting consumer")
    while True:
        try:
            SEND_SEMAPHORE.acquire()
            print(f"Sending job, queue size {len(QUEUE)}")
            j = QUEUE.pop()
            send_th(*j)
        except KeyboardInterrupt:
            return

def send_job(job, program_name, merging, bc):
    global QUEUE
    key = f"{program_name}:exploration:{get_job_key(job)}"
    # Send in a separeted thread
    if not CACHE.has(key):
        global OVERALL_COUNT
        OVERALL_COUNT += 1

        QUEUE.append(
            [job, program_name, merging, bc]
        )
        SEND_SEMAPHORE.release()
        CACHE.init(key, job)

                
MAX = config["DEFAULT"].getint("upper-bound")
BLOCK_ID_RE = re.compile(r"; Block ID (\d+)")

def sanitize_by_block_id(job):
    blocks = set()
    for k in job.keys():
        lines = [l for l in k.split("\n") if l]
        last = lines[-1]

        match = BLOCK_ID_RE.match(last)
        if match:
            if match.group(1) in blocks:
                return False # block overlaps
            else:
                blocks.add(match.group(1))
    return True

def processLevel(levels, program_name, _, bc, worker_index, merging):
    # set random shift
    print(len(bc))
    print(levels)
    #print_timer(config["DEFAULT"].getint("exploration-timeout"))
    pref=f"r{random.randint(0, 20000)}" # worker name

    with ContentToTmpFile(content=bc, name=f"{program_name}.o.bc") as TMP_BC:
        print("TMP file created")
        time.sleep(5)

        for level in levels:
            # shift address from
            LOGGER.success(program_name,
                        "%s: Searching level (increasing execution time) %s: %s souper-workers:%s " % (
                        program_name,
                        level, config["souper"][
                            "souper-level-%s" % level] if level > 0 else "DEFAULT", config["souper"].getint("workers")))

            try:
                bctocand = BCCountCandidates(program_name, level=level,
                                            souper_workers=config["souper"].getint("workers"),
                                            timeout=config["DEFAULT"].getint("exploration-timeout"),
                                            pref=pref,
                                            redirect=True)
            except Exception as e:
                LOGGER.error(program_name, traceback.format_exc())
                return
            print("Calling")

            try:
                bctocand(args=[TMP_BC.file], std=None)

            except TimeoutException as e:
                print(e)
                LOGGER.warning(program_name, f"{program_name}  Timeout reached")

            except Exception as e:
                print(e)
                LOGGER.error(program_name, traceback.format_exc())

            LOGGER.success(program_name, f"Waiting to interrupt...")
    
            time.sleep(config['DEFAULT'].getint("exploration-timeout") + 1)
            try:
                if bctocand.p:
                    bctocand.p.kill()
            except Exception as e:
                LOGGER.error(program_name, f" {program_name}  Error killing process: {e}")

            LOGGER.warning(program_name, f"{program_name}  Stopping thread and reading generated bitcodes")
            LOGGER.success(program_name, f"REDO")

            bcs = os.listdir("./")

            tosend = [bc for bc in bcs if bc.endswith(".bc") and bc.startswith("%s.%sv"%(pref, level))]
            maps = [mp for mp in bcs if mp.endswith(".map.txt") and mp.startswith("%s.%sv"%(pref, level))]

            LOGGER.warning(program_name, f"{program_name}  Sending {len(tosend)} {len(maps)}")

            for bc in tosend:
                # Reading file
                stream = open(bc, 'rb').read()
                hsh = hashlib.sha256(stream).hexdigest()

                if config["DEFAULT"].getboolean("keep-bc-files"):

                    publisher.publish(message=dict(
                        event_type=STORE_MESSAGE,
                        stream=stream,
                        program_name=f"{program_name}",
                        variant_name=f"{bc}",
                        file_name=f"{bc}.bc",
                        path=f"bitcodes/variants"
                    ), routing_key=STORE_KEY)

                    if config["DEFAULT"].getboolean("keep-wasm-files"):
                        print(f"Sending task to generate WASM...")
                        publisher.publish(message=dict(
                            event_type=GENERATED_BC_VARIANT,
                            bc=stream,
                            hash=hsh,
                            program_name=f"{program_name}",
                            variant_name=bc,
                            file_name=f"{bc}.bc"
                        ), routing_key=GENERATED_BC_KEY)

                if config["DEFAULT"].getboolean("keep-wasm-files"):
                    publisher.publish(message=dict(
                        event_type=BC2WASM_MESSAGE,
                        bc=stream,
                        program_name=f"{program_name}",
                        variant_name=f"{bc}",
                        file_name=f"{bc}.bc"
                    ), routing_key=BC2WASM_KEY)

            for mp in maps:
                # TODO, parse
                stream = open(mp, "rb").read()
                # Launching task create wasm
                publisher.publish(message=dict(
                        event_type=STORE_MESSAGE,
                        stream=stream,
                        program_name=f"{program_name}",
                        variant_name=bc,
                        file_name=f"{mp}",
                        path=f"bitcodes/maps"
                    ), routing_key=STORE_KEY)


@log_system_exception()
def bcexploration(bc, program_name):

    #publisher = Publisher()
    global OVERALL_COUNT

    OVERALL_COUNT = 0
    print(f"Exploration {program_name}")
    PROCESS_KEY = f"processed:{program_name}"
    if CACHE.has(PROCESS_KEY):
        # this was already processed
        return

    futures = []
    order = list(
        map(lambda x: int(x), config["DEFAULT"]["order"].split(",")))

    works = chunkIt(order, config["DEFAULT"].getint("workers"))

    LOGGER.custom(program_name, f"Exploration jobs {program_name} {works}", custom="EXPLORATION")

    OVERALL = {}

    for i in range(config["DEFAULT"].getint("workers")):
        job = levelPool.submit(processLevel, works[i], program_name, 2620 + i, bc, i, OVERALL)
        futures.append(job)

    
    _ = wait(futures, timeout=config["DEFAULT"].getint("generation-timeout") + 2, return_when=ALL_COMPLETED)


@log_system_exception()
@subscriber_function(event_type=BC2Candidates_MESSAGE)
def subscriber(data):
    bcexploration(data["bc"], data["program_name"])


if __name__ == "__main__":

    levelPool = ThreadPoolExecutor(
    max_workers=config["DEFAULT"].getint("workers"))

    consumer = threading.Thread(target=send_consumer)
    consumer.start()

    if len(sys.argv) == 1:
        id = f"explorer-{random.randint(0, 2000)}"
        subscriber = Subscriber(id, BC_EXPLORATION_QUEUE, EXPLORE_KEY, config["event"].getint("port"), subscriber, ack_on_receive=True)
        subscriber.setup()
    else:
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        bcexploration(open(sys.argv[2], 'rb').read(), program_name)
