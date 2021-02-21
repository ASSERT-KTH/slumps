from crow.events import BC2Candidates_MESSAGE, BC_EXPLORATION_QUEUE, STORE_MESSAGE, GENERATE_VARIANT_MESSAGE, EXPLORATION_RESULT
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.sanitizer import Sanitizer
from crow.settings import config
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED
from crow.commands.stages import BCCountCandidates, TimeoutException
from crow.socket_server import listen

from crow.utils import ContentToTmpFile, getIteratorByName
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

levelPool = None

def chunkIt(s, num):
    avg = len(s) / float(num)
    out = []
    last = 0.0

    while last < len(s):
        out.append(s[int(last):int(last + avg)])
        last += avg

    return out

def processLevel(levels, program_name, port, bc, worker_index, launch_socket_server = True):

    results = {}
    socket_port = config["souper"].getint("socket_port") + port
    q = queue.Queue()
    for level in levels:

        results[level] = {}

        LOGGER.success(program_name,
                       "%s: Searching level (increasing execution time) %s: %s souper-workers:%s souper-port:%s host:%s" % (
                       program_name,
                       level, config["souper"][
                           "souper-level-%s" % level], config["souper"].getint("workers"), socket_port, config["souper"]["socket-host"]))

        try:
            bctocand = BCCountCandidates(program_name, level=level,
                                         souper_workers=config["souper"].getint("workers"),
                                         timeout=config["DEFAULT"].getint("exploration-timeout"),
                                         socket_port=socket_port,
                                         socket_host=config["souper"]["socket-host"])

        except Exception as e:
            LOGGER.error(program_name, traceback.format_exc())
            return results

        with ContentToTmpFile(content=bc) as TMP_BC:

            try:
                #serverThread = None
                if launch_socket_server:
                    serverThread = threading.Thread(target=listen,
                                                    args=[socket_port, q, program_name, worker_index, level])
                    serverThread.start()

                bctocand(args=[TMP_BC.file], std=None)

            except TimeoutException as e:
                LOGGER.warning(program_name, f"Timeout reached")

            except Exception as e:
                LOGGER.error(program_name, traceback.format_exc())

            if launch_socket_server:
                waitFor = 3
                LOGGER.warning(program_name, f"Sleeping for {waitFor} seconds waiting for free ports...")
                serverThread.join()
                time.sleep(waitFor)
                LOGGER.success(program_name, f"REDO")

            while not q.empty():
                i = q.get()
                k, v = i

                if k not in results[level]:
                    results[level][k] = []

                results[level][k].append(v)
        return results

@log_system_exception()
def bcexploration(bc, program_name):

    #publisher = Publisher()
    print(f"Exploration {program_name}")

    futures = []
    order = list(
        map(lambda x: int(x), config["DEFAULT"]["order"].split(",")))
    # split levels by redis interface

    works = chunkIt(order, config["DEFAULT"].getint("workers"))

    LOGGER.warning(program_name, f"Exploration jobs {works}")

    for i in range(config["DEFAULT"].getint("workers")):
        # TODO assign random port
        job = levelPool.submit(processLevel, works[i], program_name, 2620 + i, bc, i)

        #job.result()
        futures.append(job)

    timeout = config["DEFAULT"].getint("exploration-timeout")
    done, fail = wait(futures, return_when=ALL_COMPLETED)
    #levelPool.shutdown(False)

    # Merging results

    LOGGER.info(program_name, "Merging exploration results...")
    merging = {}

    codeCount = -1
    for f in done:
        try:
            r = f.result()
            if not r:
                continue
            for k, v in r.items():
                LOGGER.info(program_name, f"[{k}] {len(v)} code blocks")
                if len(v) != codeCount and codeCount != -1:
                    LOGGER.warning(program_name, f"Sanity check warning, different exploration stage with different code blocks")
                codeCount = len(v)
                for k1, v1 in v.items():
                    vSet = set(v1)
                    if k1 not in merging:
                        merging[k1] = []
                    merging[k1] += vSet
                    merging[k1] = list(set(merging[k1]))
                    LOGGER.info(program_name, f"\t - {len(merging[k1])} replacements")
        except Exception as e:
            LOGGER.error(program_name, traceback.format_exc())

    san = Sanitizer(
        sanitize_redundant=config["sanitizer"].getboolean("sanitize-redundant"),
        sanitize_no_wasm=config["sanitizer"].getboolean("sanitize-non-wasm"),
        report_overlapping=config["sanitizer"].getboolean("report-overlapping"))

    tentativeNumber = reduce(operator.mul, [len(v) + 1 for v in merging.values()], 1)

    LOGGER.info(program_name, f"tentative number of variants {tentativeNumber} (plus original).")

    sanitized = san.sanitize(merging)

    tentativeNumber = reduce(operator.mul, [len(v) + 1 for v in sanitized.values()], 1)

    LOGGER.info(program_name, f"After sanitization {tentativeNumber} (plus original).")

    # Send exploration result to storage service

    publisher = Publisher()

    publisher.publish(message=dict(
        event_type=STORE_MESSAGE,
        stream=json.dumps([[k, [v1 for v1 in v if v1 is not None]] for k, v in merging.items()], indent=4).encode(),
        program_name=f"{program_name}",
        file_name=f"{program_name}.exploration.result.json"
    ), routing_key="")

    publisher.publish(message=dict(
        event_type=EXPLORATION_RESULT,
        all_replacements=[[k, [v1 for v1 in v if v1 is not None]] for k, v in merging.items()],
        tentative_number=tentativeNumber,
        program_name=f"{program_name}"
    ), routing_key="")

    start_at = time.time()
    for iteratorFunction, size in getIteratorByName("keysSubsetIterators")(merging):

        for j in iteratorFunction():
            publisher.publish(message=dict(
                event_type=GENERATE_VARIANT_MESSAGE,
                bc=bc,
                program_name=f"{program_name}",
                replacements=j,
                overall=merging
            ), routing_key="")

    LOGGER.info(program_name, f"All variants are in the queue ({time.time() - start_at:.2f}s)")


@log_system_exception()
@subscriber_function(event_type=BC2Candidates_MESSAGE)
def subscriber(data):
    bcexploration(data["bc"], data["program_name"])


if __name__ == "__main__":

    #updatesettings(sys.argv[2:-1])
    #f = sys.argv[-1]

    levelPool = ThreadPoolExecutor(
    max_workers=config["DEFAULT"].getint("workers"))

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, BC_EXPLORATION_QUEUE, "*", config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        bcexploration(open(sys.argv[2], 'rb').read(), program_name)