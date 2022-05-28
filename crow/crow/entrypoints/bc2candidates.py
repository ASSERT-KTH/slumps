from crow.cache import cache
from crow.entrypoints import EXPLORE_KEY, CREATE_VARIANT_KEY, STORE_KEY, GENERATED_BC_KEY, BC2WASM_KEY
from crow.events import BC2Candidates_MESSAGE, BC_EXPLORATION_QUEUE, STORE_MESSAGE, GENERATE_VARIANT_MESSAGE, \
    EXPLORATION_RESULT, GENERATED_BC_VARIANT, BC2WASM_MESSAGE
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.sanitzers.sanitizer import Sanitizer
from crow.settings import config
from crow.commands.stages import BCCountCandidates, TimeoutException, BCToSouper
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
        print(f"Sending job, size {len(job)}")

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

def validate_replacements(replacements, bc):
    INDEX=0

    # creating no replacement variant
    program_name = "checking"
    with ContentToTmpFile(content=bc, LOG_LEVEL=2) as BCIN:
        tmpIn = BCIN.file
        tmpOut = f"original"
        optBc = BCToSouper(program_name,{} , level=1, debug=True, redisport=1, timeout=config["DEFAULT"].getint("generation-simple-timeout") - 1)

        print(f"Prepare to call")
        optBc(args=[tmpIn, tmpOut], std=None)
        CONTENT = open(tmpOut, 'rb').read()
        os.remove(tmpOut)

    hsho = hashlib.sha256(CONTENT).hexdigest()

    with ContentToTmpFile(content=bc, LOG_LEVEL=2) as BCIN:
        tmpIn = BCIN.file
        tmpOut = f"temp{INDEX}"
        try:
            print(f"Calling souper to replace to see factibility")
            optBc = BCToSouper(program_name,replacements, level=1, debug=True, redisport=1)

            print(f"Prepare to call")
            try:
                optBc(args=[tmpIn, tmpOut], std=None)
                r = open(tmpOut, 'rb').read()
                hshr = hashlib.sha256(r).hexdigest()
            except Exception as e:
                print(e)
                hshr = hsho
                r = CONTENT

            print(f"Gotcha")
            if hshr == hsho:
                print("Invalid")
                return (False, None)
            else:
                print("Valid!")
                return (True, CONTENT)
                
            os.remove(tmpOut)

        except Exception as e:
            print(e, traceback.format_exc())
    return (False, None)
def processLevel(levels, program_name, port, bc, worker_index, merging):
    socket_port = config["souper"].getint("socket_port") + port
    JOBS = []

    # set random shift
    print(len(bc))
    def cb(level, k, v):
        sanitized = SANITIZER.sanitize_replacement(k, v)

        if sanitized:
            print(k)
            print(sanitized)
            print()
            JOBS.append([k, sanitized])

            # Send from here already
            JB = {
                k: sanitized
            }

            print(f"Sending job, queue size {len(QUEUE)}")
            send_job(JB, program_name, JB , bc)

        return
    print(levels)
    #print_timer(config["DEFAULT"].getint("exploration-timeout"))
    for level in levels:
        # shift address from
        socket_port += random.randint(1, 100)
        LOGGER.success(program_name,
                       "%s: Searching level (increasing execution time) %s: %s souper-workers:%s souper-port:%s host:%s" % (
                       program_name,
                       level, config["souper"][
                           "souper-level-%s" % level] if level > 0 else "DEFAULT", config["souper"].getint("workers"), socket_port, config["souper"]["socket-host"]))

        try:
            print("Creating bridge")
            bctocand = BCCountCandidates(program_name, level=level,
                                         souper_workers=config["souper"].getint("workers"),
                                         timeout=config["DEFAULT"].getint("exploration-timeout"),
                                         socket_port=socket_port,
                                         socket_host=config["souper"]["socket-host"], redirect=True)
            print("Bridge created!")
        except Exception as e:
            print(f"FAIL {e}")
            LOGGER.error(program_name, traceback.format_exc())
            return
        print("Calling")

        with ContentToTmpFile(content=bc) as TMP_BC:
            print("TMP file created")
            try:
                bctocand(args=[TMP_BC.file], std=None)

                #print(1)
                listen(socket_port, cb, program_name, worker_index, level, config["DEFAULT"].getint("exploration-timeout"))

            except TimeoutException as e:
                print(e)
                LOGGER.warning(program_name, f"{program_name}  Timeout reached")

            except Exception as e:
                print(e)
                LOGGER.error(program_name, traceback.format_exc())

            time.sleep(1)
            try:
                bctocand.p.kill()
            except Exception as e:
                LOGGER.error(program_name, f" {program_name}  Error killing process: {e}")
            LOGGER.warning(program_name, f"{program_name}  Stopping thread...")
            LOGGER.success(program_name, f"REDO")
    #print_timer(config["DEFAULT"].getint("generation-timeout") - config["DEFAULT"].getint("exploration-timeout") + 2)
    print("Building dict")
    REPLACEMENTS = {}

    for j, r in JOBS:

        if j not in REPLACEMENTS:
            REPLACEMENTS[j] = []

        if r not in REPLACEMENTS[j]:
            REPLACEMENTS[j].append(r)

    print(f"Validating REPLACEMENTS {len(REPLACEMENTS)}")
    import math
    def prob(current_state, new_replacement):
        d1 = dict(current_state)
        copy = [p for p in current_state]
        copy.append(new_replacement)

        d2 = dict(copy)

        if d1 == d2:
            return 0, 0

        newk, newv = new_replacement

        if newk in d1: # then if newv > old one, the prob is large
            t = math.tanh(math.abs(len(newv) - len(d1[newk])))
            return t, 1 - t
        else:
            return 1, 0

    DISTANCE_CACHE = {}

    def rep_key(d):
        return "-".join([f"{k}:{v}" for k, v in d.items()])

    def distance(state, bc):
        d1 = dict(state)
        rk = rep_key(d1)

        if rk in DISTANCE_CACHE:
            return DISTANCE_CACHE[rk]
        else:
            # check if it compiles
            compiles, bcnew = validate_replacements(d1, bc)
            
            if not compiles:
                DISTANCE_CACHE[rk] = 0
                return 0
            
            D = abs(len(bc) - len(bcnew))
            print(D)
            DISTANCE_CACHE[rk] = D
            return D 
    def acceptance(current_state, new_replacement, bc, alpha = 0.1):

        if len(current_state) == 0:
            d1 = 0
        else:
            d1 = distance(current_state, bc)
        d2 = distance(current_state + [new_replacement], bc)

        #p1, p2 = prob(current_state, new_replacement)
        d = abs(d2 - d1)
        d = alpha*math.e**(d)
        a = min(1, d)
        print(d, d2, a)

        return a

    # monte carlo markov chain
    
    def mcmc():

        print("Doing MCMC sampling", REPLACEMENTS)
        import random
        CURRENT_STATE = []
        rnd = random.Random(0)
        ITERATIONS = 10000000 # upper bound
        while ITERATIONS > 0:

            # select candidate with current transformation
            newk = rnd.randrange(0, len(REPLACEMENTS.keys()))
            newk = list(REPLACEMENTS.keys())[newk]
            newv = rnd.randrange(0, len(REPLACEMENTS[newk]))
            newv = REPLACEMENTS[newk][newv]
            
            # select one that was not selected previously, in theory this behavior should be "learned" by the probability function ?
            # while (newk, newv) not in CURRENT_STATE:
            #    newk = rnd.randrange(0, len(REPLACEMENTS.keys()))
            #    newv = rnd.randrange(0, len(REPLACEMENTS[newk]))
            p = rnd.random()

            # print("Current state ", len(REPLACEMENTS.keys()), p)
            # generate p
            a = acceptance(CURRENT_STATE, (newk, newv), bc)
            print(a)
            if p < a:
                CURRENT_STATE.append((newk, newv))
                JOB = dict(CURRENT_STATE)
                send_job(JOB, program_name, REPLACEMENTS, bc)
            ITERATIONS -=1

    if len(REPLACEMENTS) > 0:

        if config["DEFAULT"].getboolean("mcmc"):
            # Better sampling here
            try:
                mcmc()
            except Exception as e:
                print(e, traceback.format_exc())
        else: # legacy
            # REPLACEMENTS =  validate_replacements(program_name, REPLACEMENTS, bc)
            print(REPLACEMENTS)
            S=reduce(operator.mul,[len(REPLACEMENTS[k]) + 1 for k in REPLACEMENTS.keys()])
            print(f"Sending JOBS {S}")

            for k, V in REPLACEMENTS.items():
                print(f"\t{len(V)}")


            keys = REPLACEMENTS.keys()


            # starting consumer

            # producer
            if config["DEFAULT"].getboolean("combinations"):
                for i in range(len(keys), 0, -1):  # Start at combination of two keys
                    print(f"Combination size {i}")
                    for v1 in itertools.combinations(keys, i):
                        for p in itertools.product(*[REPLACEMENTS[k1] for k1 in v1]):
                            JOB = dict(zip(v1, p))

                            print(f"Sending job, queue size {len(QUEUE)}")
                            if config["DEFAULT"].getboolean("prune-same-block-replacement"):
                                if not sanitize_by_block_id(JOB):
                                    continue

                            # JOBS.append([JOB, program_name, merging, bc])
                            #print(JOB)
                            send_job(JOB, program_name, REPLACEMENTS, bc)

    LOGGER.custom(program_name, f"{program_name}  DONE: processing queue", custom="EXPLORATION")
    print()

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

    done, fail = wait(futures, timeout=config["DEFAULT"].getint("generation-timeout") + 2, return_when=ALL_COMPLETED)

    CACHE.init(f"{program_name}:metadata:exploration", OVERALL)

    LOGGER.custom(program_name, f"OVERALL COUNT {program_name} {OVERALL_COUNT}", custom="EXPLORATION")
    CACHE.init(PROCESS_KEY, dict(
        COUNT=OVERALL_COUNT
    ))


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
        subscriber = Subscriber(1, BC_EXPLORATION_QUEUE, EXPLORE_KEY, config["event"].getint("port"), subscriber, heartbeat=config["DEFAULT"].getint("exploration-timeout"), ack_on_receive=config["DEFAULT"].getboolean("exploration-immediate-ack"))
        subscriber.setup()
    else:
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        bcexploration(open(sys.argv[2], 'rb').read(), program_name)

    consumer.join()