# -*- coding: utf-8 -*-

import os
import sys
from crow.settings import config
from stages import CToLLStage, LLToBC, BCToSouper, ObjtoWASM, WASM2WAT, BCCountCandidates
from utils import printProgressBar, createTmpFile, getIteratorByName, \
    ContentToTmpFile, BreakException, RUNTIME_CONFIG, updatesettings, sendReportEmail, make_github_issue, getlogfilename
from logger import LOGGER
import threading
import hashlib
import json
import redis
import copy
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED
import traceback

import multiprocessing
import time

levelPool = ThreadPoolExecutor(
    max_workers=config["DEFAULT"].getint("level-workers"))


class Pipeline(object):

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

    def processBitcode(self, bc, outResult, program_name, OUT_FOLDER, onlybc):

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
            for level in order:
                job = levelPool.submit(
                    self.processLevel, level, program_name, bc, OUT_FOLDER, onlybc, meta, outResult)
                # job.result()

                futures.append(job)
            wait(futures, return_when=ALL_COMPLETED)

        except BreakException:
            pass

        if config["DEFAULT"].getboolean("print-sha"):
            LOGGER.warning(program_name, "Summary %s:" % program_name)
            for s in sha:
                LOGGER.warning(program_name, "WASM SHA256 %s. Size %s. Combination %s" % (
                    s, sizes[s][0], sizes[s][1]))

        return dict(programs=meta, count=len(meta.keys()))

    def process(self, file, OUT_FOLDER, program_name, onlybc, outResult=None):

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
        self.processBitcode(bc, outResult, program_name, OUT_FOLDER, onlybc)

    def processLevel(self, level, program_name, bc, OUT_FOLDER, onlybc, meta, outResult):

        pool = ThreadPoolExecutor(
            max_workers=config["DEFAULT"].getint("workers"))

        LOGGER.success(program_name,
                       "%s: Searching level (increasing execution time) %s: %s..." % (program_name,
                                                                                      level, config["souper"][
                                                                                          "souper-level-%s" % level]))
        try:
            bctocand = BCCountCandidates(program_name, level=level)
        except Exception as e:
            LOGGER.error(program_name, e)
            return

        with ContentToTmpFile(content=bc) as TMP_BC:
            try:
                cand = bctocand(args=[TMP_BC.file], std=None)
            except Exception as e:
                LOGGER.error(program_name, e)
                return
            # Saving candidate
            canCount = len(cand[0])
            LOGGER.success(program_name, "%s: Found %s arithmetic expression candidates. %s Can be replaced" % (
                program_name, cand[1], canCount))

            # Test set the second candidate for optimization

            # BC to tmpfile
            if len(cand[0]) > 0:
                with ContentToTmpFile(content=bc) as BCIN:
                    tmpIn = BCIN.file

                    futures = []
                    for s in getIteratorByName(config["DEFAULT"]["generator-method"])(cand[0]):
                        job = pool.submit(self.processSingle, s, level, tmpIn, program_name, OUT_FOLDER, onlybc, meta,
                                          outResult)
                        # job.result()

                        futures.append(job)
                    r = wait(futures, return_when=ALL_COMPLETED)
            try:
                LOGGER.info(program_name, "Cleaning cache...")
                r = redis.Redis(host="localhost", port=6379)

                result = r.flushdb()
                LOGGER.success(
                    program_name, f"Flushing redis DB: result({result})")
                r.close()
            except Exception as e:
                LOGGER.error(program_name, e)

    def processSingle(self, s, level, tmpIn, program_name, OUT_FOLDER, onlybc, meta, outResult):
        with ContentToTmpFile() as BCOUT:
            tmpOut = BCOUT.file
            try:
                sanitized_set_name = "_".join(
                    list(map(lambda x: x.__str__(), s)))

                optBc = BCToSouper(program_name, candidates=list(
                    s), level=level, debug=True)
                optBc(args=[tmpIn, tmpOut], std=None)

                bsOpt = open(tmpOut, 'rb').read()

                # Generate wasm

                hex, size, wasmFile, watFile = self.generateWasm(program_name, bsOpt,
                                                                 OUT_FOLDER,
                                                                 "[%s]%s[%s]" % (level,
                                                                                 program_name,
                                                                                 sanitized_set_name),
                                                                 debug=True, generateOnlyBc=onlybc)

                #meta[wasmFile.split("/")[-1]] = dict(size=size, sha=hex)
                #outResult["candidates"].append(dict(size=size, sha=hex, name=wasmFile))

                #sizes[hex] = [size, list(s)]

                # sha.add(hex)
                LOGGER.info(program_name, size)

            except Exception as e:
                raise e
                if config["DEFAULT"].getboolean("fail-silently"):
                    LOGGER.error(program_name, e)
                else:
                    raise e

    def generateWasm(self, namespace, bc, OUT_FOLDER, fileName, debug=True, generateOnlyBc=False):
        llFileName = "%s/%s" % (OUT_FOLDER, fileName)

        if generateOnlyBc:
            hashvalue = hashlib.sha256(bc)
            return hashvalue.hexdigest(), len(bc), "%s.bc" % (fileName,), "%s.bc" % (fileName,)

        with ContentToTmpFile(name="%s.bc" % llFileName, content=bc, ext=".bc", persist=generateOnlyBc) as TMP_WASM:

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


def process(f, OUT_FOLDER, onlybc, program_name, isBc=False):
    MANAGER = multiprocessing.Manager()
    pipeline = Pipeline()

    result_overall = MANAGER.dict()

    def launch(file, result):
        result[file] = MANAGER.dict()
        result[file]["candidates"] = MANAGER.list()
        try:
            if not isBc:
                pipeline.process(file, OUT_FOLDER, program_name,
                                 onlybc, outResult=result[file])
                return

            bc = open(file, 'rb').read()

            if not os.path.exists(f"{OUT_FOLDER}"):
                os.mkdir(f"{OUT_FOLDER}")

            tmp = open(f"{OUT_FOLDER}/{program_name}.bc", 'wb')
            tmp.write(bc)
            tmp.close()

            pipeline.processBitcode(
                bc, result[file], program_name, OUT_FOLDER, onlybc)

        except Exception as e:
            result[file]["error"] = e.__str__()

    th = multiprocessing.Process(target=launch, args=(f, result_overall,))
    th.start()

    timeout = config["DEFAULT"].getint("timeout")

    print("Timeout ... %s s" % timeout)

    th.join(timeout=timeout)

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


def main(f):

    if os.path.isfile(f):
        if not f.endswith(".c") and not f.endswith(".cpp") and not f.endswith(".bc"):
            return

        program_name, OUT_FOLDER, onlybc = getFileMeta(f)
        r = process(f, OUT_FOLDER, onlybc, program_name,
                    isBc=f.endswith(".bc"))
        return

    program_name = f.split("/")[-1].split(".")[0]

    LOGGER.info(program_name, "Pool size: %s" %
                config["DEFAULT"].getint("thread-pool-size"))

    result = dict(namespace=program_name, programs=[])
    attach = []
    print(os.listdir(f))
    for final in ["%s/%s" % (f, i) for i in os.listdir(f)]:

        program_name, OUT_FOLDER, onlybc = getFileMeta(final)

        if not final.endswith(".bc") and not final.endswith(".c") and not final.endswith(".cpp"):
            continue

        try:
            r = process(final, OUT_FOLDER, onlybc,
                        program_name, isBc=final.endswith(".bc"))
            result["programs"].append(r)
            attach.append(getlogfilename(
                final.split("/")[-1].replace(".c", "")))
        except Exception as e:
            print(e)

    OUT_FOLDER = "%s" % config["DEFAULT"]["outfolder"]

    if not os.path.exists(OUT_FOLDER):
        os.mkdir(OUT_FOLDER)

    print(json.dumps(result, indent=4))


if __name__ == "__main__":

    updatesettings(sys.argv[1:-1])

    if not os.path.exists("out"):
        os.mkdir("out")



    RUNTIME_CONFIG["USE_REDIS"] = True

    f = sys.argv[-1]
    LOGGER.success("general", "STARTING")
    main(f)
