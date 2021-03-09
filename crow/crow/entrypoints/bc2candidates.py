from crow.entrypoints import EXPLORE_KEY, CREATE_VARIANT_KEY, STORE_KEY
from crow.events import BC2Candidates_MESSAGE, BC_EXPLORATION_QUEUE, STORE_MESSAGE, GENERATE_VARIANT_MESSAGE, EXPLORATION_RESULT
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.sanitzers.sanitizer import Sanitizer
from crow.settings import config
from crow.commands.stages import BCCountCandidates, TimeoutException
from crow.socket_server import listen

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
from crow.experiments.overlap_check import get_preffix
import re
import threading
import multiprocessing

levelPool = None

publisher = Publisher()
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


    def cb(level, k, v):

        if level not in results:
            results[level]={}

        if k not in results[level]:
            results[level][k] = set()

        results[level][k].add(v)


    for level in levels:

        results[level] = {}

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
                                         socket_host=config["souper"]["socket-host"])

        except Exception as e:
            LOGGER.error(program_name, traceback.format_exc())
            return results

        with ContentToTmpFile(content=bc) as TMP_BC:

            try:
                #serverThread = None
                if launch_socket_server:
                    serverThread = threading.Thread(target=listen,
                                                    args=(socket_port, cb, program_name, worker_index, level))
                    serverThread.start()
                print()
                bctocand(args=[TMP_BC.file], std=None)

            except TimeoutException as e:
                LOGGER.warning(program_name, f"Timeout reached")

            except Exception as e:
                LOGGER.error(program_name, traceback.format_exc())

            if launch_socket_server:
                time.sleep(1)
                try:
                    bctocand.p.kill()
                except Exception as e:
                    print(e)
                LOGGER.warning(program_name, f"Stopping thread...")
                serverThread.join(timeout=0)
                serverThread._stop() # Force termination
                LOGGER.success(program_name, f"REDO")

    #print(results)
    LOGGER.success(program_name, f"DONE: processing queue")
    return results

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
                # otherwise the block code is different and the replacement should not overlap
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

    print(f"Tentative number of variants {tentativeNumber}")

    sanitized = san.sanitize(merging)
    merging=sanitized

    tentativeNumber = reduce(operator.mul, [len(v) + 1 for v in merging.values()], 1)

    print(f"Tentative number of variants after sanitization {tentativeNumber}")

    # Send exploration result to storage service


    publisher.publish(message=dict(
        event_type=STORE_MESSAGE,
        stream=json.dumps([[k, [v1 for v1 in v if v1 is not None]] for k, v in merging.items()], indent=4).encode(),
        program_name=f"{program_name}",
        file_name=f"{program_name}.exploration.result.json",
        path="metadata"
    ), routing_key=STORE_KEY)


    # launch in a thread


    print("Sending")
    start_at = time.time()
    count = 0

    parser = SouperParser()
    prefixes = {}
    CFG = {}

    MX = config["DEFAULT"].getint("upper-bound")
    KEEP_EVERY= config["DEFAULT"].getint("skip-every-x-replacement")
    if config["sanitizer"].getboolean("remove-if-prefix"):
        print("Getting connected components")
        entries, nodes, assignent = parser.set_cc(list(merging.keys()))

        for e in entries:
            index = list(merging.keys()).index(e.code)
            CFG[index] = assignent[e.varId]  # add a CC to the piece of code
    DONE = False
    for iteratorFunction, size in getIteratorByName("keysSubsetIterators")(merging):
        # iterator, publisher, merging, bc
        for j in iteratorFunction():

            variant_name = get_variant_name(merging, j)
            if config["sanitizer"].getboolean("remove-if-prefix"):

                if check_prefixes(prefixes, variant_name, CFG):
                    continue
                else:
                    prefixes[variant_name] = 1

            if count % KEEP_EVERY == 0: # sample every
                # If the keys overlap, avoid
                #print(f"Sending {variant_name}")
                publisher.publish(message=dict(
                    event_type=GENERATE_VARIANT_MESSAGE,
                    bc=bc,
                    program_name=f"{program_name}",
                    replacements=j,
                    overall=merging
                ), routing_key=CREATE_VARIANT_KEY)
                printinSameLine(f"Creating {variant_name} {program_name} {count}/{tentativeNumber} ")

            else:
                printinSameLine(f"Skipping {variant_name} {program_name} {count}/{tentativeNumber} ")
            count += 1
            if count >= MX:
                DONE = True
                break
        if DONE:
            break

        print()
        print(f"Variants {count} {program_name} after overlap filter")
    #print(f"Prefixes {prefixes}")
        LOGGER.info(program_name, f"All variants ({count}) are in the queue ({time.time() - start_at:.2f}s)")

        #th.join()


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
        subscriber = Subscriber(1, BC_EXPLORATION_QUEUE, EXPLORE_KEY, config["event"].getint("port"), subscriber, heartbeat=0)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        bcexploration(open(sys.argv[2], 'rb').read(), program_name)