# -*- coding: utf-8 -*-

import os
import sys,traceback
from settings import config
from stages import CToLLStage, LLToBC, BCToSouper, ObjtoWASM, WASM2WAT, BCCountCandidates, TimeoutException
from utils import printProgressBar, createTmpFile, getIteratorByName, \
    ContentToTmpFile, BreakException, RUNTIME_CONFIG, updatesettings, sendReportEmail

from logger import LOGGER, getlogfilename
import threading, queue
import hashlib
import json
import redis
import copy
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED
import traceback

import multiprocessing
import time
import re
import uuid
from socket_server import listen
import numpy as np


levelPool = None
generationPool = None

class Pipeline(object):
    PROGRAM_COUNTER = 0
    

    def __init__(self):
        self.LOG_LEVEL = 3

    def check_file(self, file: str):
        program_name = file.split("/")[-1].split(".")[0]

        if file.endswith(".c") or file.endswith(".cpp"):
            return True

        if file.endswith(".ll"):
            # Check triple
            if not open(file, 'r').read().find('triple = "wasm32-unknown-unknown"'):
                LOGGER.warning(
                    program_name, "LL file triple is not targeting wasm32-unknown-unknown")
                return False

            return True

        return False

    def chunkIt(self, s, num):
        avg = len(s) / float(num)
        out = []
        last = 0.0

        while last < len(s):
            out.append(s[int(last):int(last + avg)])
            last += avg

        return out

    def processBitcode(self, bc, outResult, program_name, redisports, OUT_FOLDER, onlybc):

        # mem2reg
        #mem2reg = BCMem2Reg(program_name, debug=True)


        sha = set()
        meta = dict()
        sizes = {}

        originalSha, originalSize, originalWasmName, _ = self.generateWasm(
            program_name, bc, OUT_FOLDER, program_name, generateOnlyBc=onlybc)
        sha.add(originalSha)
        sizes[originalSha] = [originalSize, []]

        meta[originalWasmName.split(
            "/")[-1]] = dict(size=originalSize, sha=originalSha)
        outResult["candidates"].append(
            dict(size=originalSize, sha=originalSha, name=originalWasmName.split("/")[-1]))

        try:

            futures = []
            order = list(
                map(lambda x: int(x),  config["DEFAULT"]["order"].split(",")))
            LOGGER.info("ORDER", order)
            # split levels by redis interface

            works = self.chunkIt(order, len(redisports))



            for i,port in enumerate(redisports):
                job = levelPool.submit(
                    self.processLevel, works[i], program_name, port, bc, OUT_FOLDER, onlybc, meta, outResult)
                # job.result()

                futures.append(job)
            
            timeout = config["DEFAULT"].getint("exploration-timeout")
            done, fail = wait(futures, return_when=ALL_COMPLETED)
            levelPool.shutdown(False)
            #Merging results

            LOGGER.info(program_name, "Merging exploration results...")

            merging = {}

            codeCount = -1
            for f in done:
                try:
                    r=f.result()
                    for k,v in r.items():
                        LOGGER.info(program_name, f"[{k}] {len(v)} code blocks")
                        #if len(v) != codeCount and codeCount != -1:
                        #    LOGGER.warning(program_name, f"Sanity check warning, different exploration stage with different code blocks")
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
            
            # TODO Separate both stages to support continuing on
            variantsFile = open(f"{OUT_FOLDER}/{program_name}.exploration.json", 'w')
            variantsFile.write(json.dumps([[k, [v1 for v1 in v if v1 is not None] ] for k, v in merging.items()],indent=4))
            variantsFile.close()
            # Call the generation stage
            # Split jobs
            #for k in merging.keys():
            LOGGER.info(program_name,f"Generating jobs for {len(redisports)} REDIS instances...")

            generationcount = 0
            futures = []
            variants = []

            showGenerationProgress = config["DEFAULT"].getboolean("show-generation-progress")

            temptativeNumber = np.prod([len(v) + 1 for v in merging.values()])

            LOGGER.info(program_name,f"Temptative number of variants {temptativeNumber} (plus original). Expected ratio {len(redisports)} of programs in each iteration.")
            
            if showGenerationProgress:
                LOGGER.disable()
                printProgressBar(generationcount, temptativeNumber,suffix=f'             {generationcount}/{temptativeNumber}')

            for subset in getIteratorByName("keysSubset")(merging):
                
                job = generationPool.submit(
                    self.generateVariant, [subset], program_name, merging, redisports[generationcount
                    %len(redisports)], bc, OUT_FOLDER, onlybc, meta, outResult, generationcount, temptativeNumber)
                    # job.result()

                futures.append(job)
                generationcount += 1
                
                if generationcount % len(redisports) == 0:
                    ## WAIT for it

                    generationStartTime = time.time_ns()
                    LOGGER.info(program_name,f"Executing parallel generation job...")
                    done, fail = wait(futures, return_when=ALL_COMPLETED)
                    generationEndTime = time.time_ns() - generationStartTime

                    futures = []

                    LOGGER.info(program_name,f"Disposing job...{len(done)} {len(fail)}")

                    for f in done:
                        variants += f.result()



                    if showGenerationProgress:
                        speed = len(redisports)/generationEndTime
                        eta = (temptativeNumber-len(variants))/speed/1e9
                        unique = len(set([v[0] for v in variants]))
                        total = len([v[0] for v in variants])

                        uniquenessRatio = 100.0*unique/total

                        printProgressBar(len(variants), temptativeNumber,suffix=f'  {generationcount}/{temptativeNumber} eta:{eta:.2f}s r:{uniquenessRatio:.2f}')

            

            LOGGER.info(program_name,f"Executing final parallel generation job...")
            done, fail = wait(futures, return_when=ALL_COMPLETED)
            futures = []
            LOGGER.info(program_name,f"Disposing job...{len(done)} {len(fail)}")
            generationcount += len(done) + len(fail)

            for f in done:
                variants += f.result()
                # Save metadata

            LOGGER.info(program_name, f"Saving metadata...")
            variantsFile = open(f"{OUT_FOLDER}/{program_name}.variants.json", 'w')
            variantsFile.write(json.dumps({
                "variants": variants,
                "unique": len(set([v[0] for v in variants])),
                "total": len([v[0] for v in variants])
            }, indent=4))
            variantsFile.close()

        except BreakException:
            pass


        return dict(programs=meta, count=len(meta.keys()))

    def generateVariant(self,job,program_name, merging, port,bc, OUT_FOLDER, onlybc, meta, outResult, current, total):
        
        if len(job) == 0 :
            LOGGER.info(program_name,f"Empty job...")    
            return []

        variants = []
        LOGGER.info(program_name,f"Generating {len(job)} variants...") 
        r = redis.Redis(host="localhost", port=port)
        for jindex,j in enumerate(job):
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
                       name +=  "[%s-%s]"%(keys.index(k), merging[k].index(v))
                       r.hset(k, "result", v)
                   else:
                       
                       # search for infer word
                       rer = re.compile(r"infer %(\d+)")
                       kl = k
                       if rer.search(kl):
                           r.hset(k, "result", ("result %%%s\n"%(rer.search(kl).group(1),)).encode("utf-8"))
                       LOGGER.info(program_name, f"Replacing redundant key-value pair...")

               LOGGER.info(program_name, f"Preparing new variant generation...")

               with ContentToTmpFile(content=bc, LOG_LEVEL=2) as BCIN:
                   tmpIn = BCIN.file
                   with ContentToTmpFile(LOG_LEVEL=2) as BCOUT:
                       tmpOut = BCOUT.file
                       
                       try:
                           sanitized_set_name = name
                           LOGGER.info(program_name, f"Generating variant {sanitized_set_name}...")


                           optBc = BCToSouper(program_name, level=1, debug=True, redisport=port)
                           optBc(args=[tmpIn, tmpOut], std=None)

                           bsOpt = open(tmpOut, 'rb').read()

                           # Generate wasm
                           n = "%s[%s]" % (program_name,sanitized_set_name)
                           hex, size, wasmFile, watFile = self.generateWasm(program_name, bsOpt,
                                                                           OUT_FOLDER,
                                                                           name,
                                                                           debug=True, generateOnlyBc=onlybc)

                           variants.append([hex, n, [[k, v if v is not None else "No replace"] for k,v in j.items()]])
                       except Exception as e:
                           LOGGER.error(program_name, traceback.format_exc())
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

    def process(self, file, OUT_FOLDER, program_name, redisports, onlybc, outResult=None):

        if not os.path.exists(OUT_FOLDER):
            os.mkdir(OUT_FOLDER)

        if not self.check_file(file):
            LOGGER.error(program_name, "Invalid file %s" % (file,))
            return

        ll1 = b''

        if file.endswith(".c") or file.endswith(".cpp"):
            ctoll = CToLLStage(program_name)
            ll1 = ctoll(file)
        elif file.endswith(".ll"):
            ll1 = open(file, 'rb')

        lltobc = LLToBC(program_name, debug=False)
        bc = lltobc(std=ll1)
        self.processBitcode(bc, outResult, program_name,redisports, OUT_FOLDER, onlybc)

    def processLevel(self, levels, program_name, port, bc, OUT_FOLDER, onlybc, meta, outResult):

        pool = ThreadPoolExecutor(
            max_workers=config["DEFAULT"].getint("workers"))

        results = {}

        socket_port = config["souper"].getint("socket_port") + port
        q = queue.Queue()
        for level in levels:

            results[level] = {}

            LOGGER.success(program_name,
                        "%s: Searching level (increasing execution time) %s: %s souper-workers:%s souper-port:%s" % (program_name,
                                                                                        level, config["souper"][
                                                                                            "souper-level-%s" % level], config["souper"].getint("workers"), socket_port))

            try:
                bctocand = BCCountCandidates(program_name, level=level, souper_workers=config["souper"].getint("workers"), 
                timeout=config["DEFAULT"].getint("exploration-timeout"), socket_port=socket_port)
                
            except Exception as e:
                LOGGER.error(program_name,  traceback.format_exc())
                return
            with ContentToTmpFile(content=bc) as TMP_BC:

                try:
                    
                    serverThread = threading.Thread(target=listen, args=[socket_port, q, program_name])
                    serverThread.start()

                    bctocand(args=[TMP_BC.file], std=None)


                except TimeoutException as e:
                    LOGGER.warning(program_name, f"Timeout reached")

                except Exception as e:
                    LOGGER.error(program_name, traceback.format_exc())
                    raise e

            waitFor = 5
            LOGGER.warning(program_name, f"Sleeping for {waitFor} seconds waiting for free ports...")
            time.sleep(waitFor)
            while not q.empty():
                i = q.get()
                k, v = i

                if k not in results[level]:
                    results[level][k] = []

                results[level][k].append(v)
        return results   
    
    def generateWasm(self, namespace, bc, OUT_FOLDER, fileName, debug=True, generateOnlyBc=False):
        llFileName = "%s/%s" % (OUT_FOLDER, fileName)

        if generateOnlyBc:
            hashvalue = hashlib.sha256(bc)
            return hashvalue.hexdigest(), len(bc), "%s.bc" % (fileName,), "%s.bc" % (fileName,)

        with ContentToTmpFile(name="%s.bc" % llFileName, content=bc, ext=".bc", persist=True) as TMP_WASM:

            tmpWasm = TMP_WASM.file

            try:
                finalObjCreator = ObjtoWASM(namespace, debug=debug)
                finalObjCreator(args=[
                    "%s.wasm" % (llFileName,),
                    tmpWasm
                ], std=None)

                wat = WASM2WAT(namespace, debug=debug)
                wat(std=None, args=[
                    "%s.wasm" % (llFileName,),
                    "%s.wat" % (llFileName,)]
                    )
                finalStream = open("%s.wasm" % (llFileName,), 'rb').read()
                hashvalue = hashlib.sha256(finalStream)
                if debug:
                    LOGGER.warning(namespace, "%s: WASM SIZE %s" %
                                   (namespace, len(finalStream),))
                    LOGGER.warning(namespace, "%s: WASM SHA %s" %
                                   (namespace, hashvalue.hexdigest(),))
                return hashvalue.hexdigest(), len(finalStream), "%s.wasm" % (llFileName,), "%s.wat" % (llFileName,)
            except Exception as e:
                LOGGER.error(namespace, traceback.format_exc())


def getFileMeta(file, outResult=None):

    program_name = file.split("/")[-1].split(".")[0]
    OUT_FOLDER = "%s/%s" % (config["DEFAULT"]["outfolder"], program_name)
    onlybc = config["DEFAULT"].getboolean("generate-bc-only")

    return (program_name, OUT_FOLDER, onlybc)


def removeDuplicate(program_name, folder, filt="*.wasm", remove=False):

    if not os.path.exists(f"{folder}"):
        return

    LOGGER.warning(program_name, "Removing duplicated variants")

    l = [f for f in os.listdir(folder) if f.endswith(filt)]
    LOGGER.info(program_name, "Total candidates: %s" % (len(l), ))

    st = set()

    for f in l:
        realPath = f"{folder}/{f}"
        content = open(realPath, 'rb').read()
        hashvalue = hashlib.sha256(content).hexdigest()

        if hashvalue in st:
            if remove:
                os.remove(realPath)
        else:
            st.add(hashvalue)
    LOGGER.info(program_name, "Unique: %s" % (len(st), ))


def process(f, OUT_FOLDER, onlybc, program_name, redisports, isBc=False):

    LEVELS = len(config["DEFAULT"]["order"].split(","))
    exploration_workers = config["DEFAULT"].getint("workers")
    exploration_timeout = config["DEFAULT"].getint("exploration-timeout")
    total_timeout = config["DEFAULT"].getint("timeout")

    if total_timeout > 0 : # There is a timeout
        if exploration_workers > LEVELS:
            LOGGER.warning(program_name, f"The number of generation workers is the maximum number of levels {LEVELS}. You set the maximum to {exploration_workers}, skipped.")
            exploration_workers = LEVELS
    if 1.0*exploration_timeout * LEVELS / exploration_workers >= total_timeout or exploration_timeout <= -1:
        if total_timeout > 0:
            LOGGER.error(program_name, f"The total timeout set {total_timeout}s must be larger than the whole (even parallel) generation stage, which is {1.0*exploration_timeout * LEVELS / exploration_workers}s, according to the number of threads and exploration timeout ")
            exit(1)
        else:
            if exploration_timeout > -1:
                LOGGER.info(program_name, f"The total exploration stage would take {1.0*exploration_timeout * LEVELS / exploration_workers}s, according to the number of threads and exploration timeout ")
            else:
                LOGGER.warning(program_name, f"Sit and wait, there is no timeout")



    global launch

    MANAGER = multiprocessing.Manager()
    pipeline = Pipeline()

    result_overall = MANAGER.dict()

    def launch(file, result):
        result[file] = MANAGER.dict()
        result[file]["candidates"] = MANAGER.list()
        try:
            if not isBc:
                pipeline.process(file, OUT_FOLDER, program_name, redisports,
                                 onlybc, outResult=result[file])
                return

            bc = open(file, 'rb').read()

            if not os.path.exists(f"{OUT_FOLDER}"):
                os.mkdir(f"{OUT_FOLDER}")

            tmp = open(f"{OUT_FOLDER}/{program_name}.bc", 'wb')
            tmp.write(bc)
            tmp.close()

            pipeline.processBitcode(
                bc, result[file], program_name, redisports, OUT_FOLDER, onlybc)

        except Exception as e:
            LOGGER.error(file, traceback.format_exc())

    th = multiprocessing.Process(target=launch, args=(f, result_overall,))
    th.start()

    timeout = config["DEFAULT"].getint("timeout")

    if total_timeout > 0:
        th.join(timeout=timeout)
    else:
        th.join()

    if th.is_alive():
        th.kill()
        program_name = f.split("/")[-1].split(".")[0]
        LOGGER.error(program_name, "Exiting %s due to timeout" % f)
        result_overall[f]["error"] = "Timeout %s" % timeout

    result_overall[f]["candidates"] = result_overall[f]["candidates"].__deepcopy__({
    })
    result_overall[f] = result_overall[f].copy()
    result_overall = result_overall.copy()

    # clean OUT_FOLDER

    remove_duplicate = config["DEFAULT"].getboolean("prune-equal")
    filt = ".bc" if onlybc else ".wasm"

    removeDuplicate(program_name, OUT_FOLDER, filt, remove_duplicate)

    return result_overall


def main(f, redisports):

    if os.path.isfile(f):
        if not f.endswith(".c") and not f.endswith(".cpp") and not f.endswith(".bc"):
            return

        program_name, OUT_FOLDER, onlybc = getFileMeta(f)
        r = process(f, OUT_FOLDER, onlybc, program_name,redisports,
                    isBc=f.endswith(".bc"))
        return

    program_name = f.split("/")[-1].split(".")[0]

    LOGGER.info(program_name, "Pool size: %s" % len(redisports))

    

    result = dict(namespace=program_name, programs=[])
    attach = []
    for final in ["%s/%s" % (f, i) for i in os.listdir(f)]:

        program_name, OUT_FOLDER, onlybc = getFileMeta(final)

        if not final.endswith(".bc") and not final.endswith(".c") and not final.endswith(".cpp"):
            continue

        try:
            r = process(final, OUT_FOLDER, onlybc,
                        program_name, redisports, isBc=final.endswith(".bc"))
            result["programs"].append(r)
            attach.append(getlogfilename(
                final.split("/")[-1].replace(".c", "")))
        except Exception as e:
            LOGGER.error(program_name,  traceback.format_exc())

    OUT_FOLDER = "%s" % config["DEFAULT"]["outfolder"]

    if not os.path.exists(OUT_FOLDER):
        os.mkdir(OUT_FOLDER)



if __name__ == "__main__":

    redis_interfaces = sys.argv[1]
    redisports = [6379]
    
    if re.compile(r"(,\d+)+").match(redis_interfaces):
        max_workers = len(redis_interfaces.split(",")) - 1
        redisports = [int(t) for t in redis_interfaces.split(",")[1:]]
    else:
        max_workers = 1


    updatesettings(sys.argv[2:-1])

    levelPool = ThreadPoolExecutor(
    max_workers=config["DEFAULT"].getint("workers"))

    generationPool = ThreadPoolExecutor(
    max_workers=max_workers)

    if not os.path.exists("out"):
        os.mkdir("out")



    RUNTIME_CONFIG["USE_REDIS"] = True

    f = sys.argv[-1]
    LOGGER.success("general", "STARTING")
    main(f, redisports)
