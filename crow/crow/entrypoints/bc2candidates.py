from crow.cache import cache
from crow.entrypoints import EXPLORE_KEY, CREATE_VARIANT_KEY, STORE_KEY
from crow.events import BC2Candidates_MESSAGE, BC_EXPLORATION_QUEUE, STORE_MESSAGE, GENERATE_VARIANT_MESSAGE, EXPLORATION_RESULT
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.sanitzers.sanitizer import Sanitizer
from crow.settings import config
from crow.commands.stages import BCCountCandidates, TimeoutException
from crow.socket_server import listen
import random

from crow.utils import ContentToTmpFile, getIteratorByName, printinSameLine
import threading, queue
import json
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED

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

def send_job(job, program_name, merging, bc):

    key = f"{program_name}:exploration:{get_job_key(job)}"

    if not CACHE.has(key):
        global OVERALL_COUNT
        OVERALL_COUNT += 1
        publisher.publish(message=dict(
            event_type=GENERATE_VARIANT_MESSAGE,
            bc=bc,
            program_name=f"{program_name}",
            replacements=job,
            overall=merging
        ), routing_key=CREATE_VARIANT_KEY)

        CACHE.init(key, job)

MAX = config["DEFAULT"].getint("upper-bound")

def send_replacement(program_name, k,replacement, merging, bc):

    try:
        printinSameLine(f"Sending replacement {OVERALL_COUNT} ")
        if k not in merging:
            merging[k] = [None]  # Add the option to not generate replacement for the key at all

        if replacement not in merging[k]:
            merging[k].append(replacement)

            # All combinations without it have been generated

            # Generate alone
            # There is a priority over single alone replacements
            send_job({
                k: replacement
            }, program_name, merging, bc)

            if config["DEFAULT"].getboolean("combinations"):
                print()
                NOW = time.time()
                print("Generating combinations")
                keys = list(merging.keys())
                for i in range(2, len(merging.keys()) + 1):  # Start at combination of two keys
                    for v1 in itertools.combinations(keys, i):
                        for p in itertools.product(*[merging[k1] for k1 in v1 if k1 != k]):
                            JOB = dict(zip(v1, p))
                            JOB[k] = replacement

                            # print(JOB.keys())
                            NEW_JOB = {}
                            for j1, j2 in JOB.items():
                                if j2:
                                    NEW_JOB[j1] = j2
                            send_job(NEW_JOB, program_name, merging, bc)
                print(f"Combinations sent in {time.time() - NOW}s")
    except Exception as e:
        print(e)


def processLevel(levels, program_name, port, bc, worker_index, merging, launch_socket_server = True):

    socket_port = config["souper"].getint("socket_port") + port
    # set random shift

    levelFutures = []

    def cb(level, k, v):
        global OVERALL_COUNT

        if OVERALL_COUNT >= MAX:
            return

        sanitized = SANITIZER.sanitize_replacement(k, v)
        if sanitized: # Valid replacement
            send_replacement(program_name,
                k, sanitized, merging, bc
            )


    for level in levels:
        # shift address from
        socket_port += random.randint(1, 100)
        LOGGER.success(program_name,
                       "%s: Searching level (increasing execution time) %s: %s souper-workers:%s souper-port:%s host:%s" % (
                       program_name,
                       level, config["souper"][
                           "souper-level-%s" % level] if level > 0 else "DEFAULT", config["souper"].getint("workers"), socket_port, config["souper"]["socket-host"]))

        try:
            bctocand = BCCountCandidates(program_name, level=level,
                                         souper_workers=config["souper"].getint("workers"),
                                         timeout=config["DEFAULT"].getint("exploration-timeout"),
                                         socket_port=socket_port,
                                         socket_host=config["souper"]["socket-host"], redirect=True)

        except Exception as e:
            LOGGER.error(program_name, traceback.format_exc())
            return

        with ContentToTmpFile(content=bc) as TMP_BC:

            try:
                bctocand(args=[TMP_BC.file], std=None)

                if launch_socket_server:

                    listen(socket_port, cb, program_name, worker_index, level, config["DEFAULT"].getint("exploration-timeout"))

            except TimeoutException as e:
                LOGGER.warning(program_name, f"Timeout reached")

            except Exception as e:
                LOGGER.error(program_name, traceback.format_exc())

            if launch_socket_server:
                time.sleep(1)
                try:
                    bctocand.p.kill()
                except Exception as e:
                    LOGGER.error(program_name, f"Error killing process: {e}")
                LOGGER.warning(program_name, f"Stopping thread...")
                LOGGER.success(program_name, f"REDO")

    LOGGER.custom(program_name, f"DONE: processing queue", custom="EXPLORATION")
    print()

def check_prefixes(pr:dict, combination:str, CFG: dict):
    r = re.compile(r"\[(\d+)-")
    for k in pr.keys():
        pre, size = get_preffix(k, combination)
        if size > 0:

            remainingK = k.replace(pre, "")
            remainingC = combination.replace(pre, "")

            if len(remainingK) > len(remainingC): # swap if the remaining from the prefix key is larger
                remainingK, remainingC = remainingC, remainingK

            if remainingK and remainingC:
                k1 = int(r.search(remainingC).group(1))
                k2 = int(r.search(remainingK).group(1))

                if CFG[k1] == CFG[k2]: # I they are in the same connected component, then the transformation is the same
                    print(f"Common prefix {pre} and same key afterward K1 {k1} K2 {k2}, CC1 {CFG[k1]} CC2 {CFG[k2]} R1 {combination} R2 {remainingK}")
                    return True # both keys are equal then, prefix will prevale
            elif not remainingK: # Compare the keys in the prefix
                if remainingC:
                    k1 = int(r.search(remainingC).group(1))
                    for k in r.finditer(pre):
                        ki = int(k.group(1))

                        if CFG[ki] == CFG[k1]:
                            print(f"Common prefix {pre} and same key afterward k1 {k1} ki {ki}, CC {CFG[k1]}  {combination}. The combination has a different key but the component is the same")
                            return True
                else:
                    print(f"Ful prefix {pre} match {combination}")
                    # Fulll prefix match
                    return True

    return False

@log_system_exception()
def bcexploration(bc, program_name):

    #publisher = Publisher()
    global OVERALL_COUNT

    OVERALL_COUNT = 0
    print(f"Exploration {program_name}")

    futures = []
    order = list(
        map(lambda x: int(x), config["DEFAULT"]["order"].split(",")))

    works = chunkIt(order, config["DEFAULT"].getint("workers"))

    LOGGER.custom(program_name, f"Exploration jobs {works}", custom="EXPLORATION")

    OVERALL = {}

    for i in range(config["DEFAULT"].getint("workers")):
        job = levelPool.submit(processLevel, works[i], program_name, 2620 + i, bc, i, OVERALL)
        futures.append(job)

    done, fail = wait(futures, return_when=ALL_COMPLETED)

    CACHE.init(f"{program_name}:metadata:exploration", OVERALL)

    LOGGER.custom(program_name, f"OVERALL COUNT {OVERALL_COUNT}", custom="EXPLORATION")


@log_system_exception()
@subscriber_function(event_type=BC2Candidates_MESSAGE)
def subscriber(data):
    bcexploration(data["bc"], data["program_name"])


if __name__ == "__main__":

    levelPool = ThreadPoolExecutor(
    max_workers=config["DEFAULT"].getint("workers"))

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, BC_EXPLORATION_QUEUE, EXPLORE_KEY, config["event"].getint("port"), subscriber, heartbeat=0, ack_on_receive=config["DEFAULT"].getboolean("exploration-immediate-ack"))
        subscriber.setup()
    else:
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        bcexploration(open(sys.argv[2], 'rb').read(), program_name)