# -*- coding: utf-8 -*-

import os
import sys
from stages import CToLLStage, LLToBC, BCToSouper, ObjtoWASM, WASM2WAT, BCCountCandidates
from utils import bcolors, OUT_FOLDER, printProgressBar, config, createTmpFile, getIteratorByName, \
    ContentToTmpFile, BreakException
from logger import LOGGER
import collections
import hashlib


class Pipeline(object):

    def check_file(self, file: str):
        if file.endswith(".c") or file.endswith(".cpp"):
            return True

        if file.endswith(".ll"):
            # Check triple
            if not open(file, 'r').read().find('triple = "wasm32-unknown-unknown"'):
                LOGGER.warning("LL file triple is not targeting wasm32-unknown-unknown")
                return False

            return True

        return False

    def process(self, file):

        program_name = file.split("/")[-1].split(".")[0]

        if not self.check_file(file):
            LOGGER.error("Invalid file %s" % (file,))
            return

        if not os.path.exists(OUT_FOLDER):
            os.mkdir(OUT_FOLDER)

        ll1 = b''

        if file.endswith(".c") or file.endswith(".cpp"):
            ctoll = CToLLStage(program_name)
            ll1 = ctoll(file)
        if file.endswith(".ll"):
            ll1 = open(file, 'rb')

        lltobc = LLToBC(program_name)
        bc = lltobc(std=ll1)

        sha = set([])
        sizes = {}

        originalSha, originalSize, _, _ = self.generateWasm(program_name, bc, OUT_FOLDER, program_name)
        sha.add(originalSha)
        sizes[originalSha] = [originalSize, []]

        try:

            for level in range(1, 11):

                LOGGER.success("Searching level (increasing execution time) %s: %s..." % (
                level, config["souper"]["souper-level-%s" % level]))

                bctocand = BCCountCandidates(program_name, level=level)

                with ContentToTmpFile(content=bc) as TMP_BC:
                    cand = bctocand(args=[TMP_BC.file], std=None)

                    # Saving candidate
                    LOGGER.success("Found %s arithmetic expression candidates. %s Can be replaced" % (cand[1], cand[0]))

                    # Test set the second candidate for optimization

                    # BC to tmpfile
                    with ContentToTmpFile(content=bc) as BCIN:
                        with ContentToTmpFile() as BCOUT:
                            tmpIn = BCIN.file
                            tmpOut = BCOUT.file

                            total = 2 ** (cand[0])  # tentative, TODO change to the iterator
                            current = 1
                            pruned = 0

                            if cand[0] > 0 and config["DEFAULT"].getint("candidates-threshold") < cand[0]:
                                for s in getIteratorByName(config["DEFAULT"]["generator-method"])(range(cand[0])):
                                    sanitized_set_name = "_".join(list(map(lambda x: x.__str__(), s)))

                                    optBc = BCToSouper(program_name, candidates=list(s), level=level)
                                    optBc(args=[tmpIn, tmpOut], std=None)

                                    bsOpt = open(tmpOut, 'rb').read()

                                    hex, size, wasmFile, watFile = self.generateWasm(program_name, bsOpt, OUT_FOLDER,
                                                                                     "[%s]%s[%s]" % (level,
                                                                                                     program_name,
                                                                                                     sanitized_set_name),
                                                                                     debug=False)

                                    printProgressBar(current, total,
                                                     suffix="Completed %s[%s] %s" % (
                                                     program_name, sanitized_set_name, hex),
                                                     length=50)

                                    current += 1
                                    if config["DEFAULT"].getboolean("prune-equal"):
                                        if hex in sha:
                                            os.remove(wasmFile)
                                            os.remove(watFile)
                                            pruned += 1
                                            continue

                                    sizes[hex] = [size, list(s)]

                                    sha.add(hex)

                                printProgressBar(current, total,
                                                 suffix="Total number of programs %s. Different sha count %s. Pruned count %s      %s" % (
                                                     current, len(sha), pruned, " " * 100), length=50)

                                raise BreakException()

                            else:
                                LOGGER.error(
                                    "No succesfull replacements. Total number of subexpressions  %s. Souper level %s" % (
                                    cand[1], level))
        except BreakException:
            pass

        if config["DEFAULT"].getboolean("print-sha"):
            LOGGER.warning("Summary ")
            for s in sha:
                LOGGER.warning("WASM SHA256 %s. Size %s. Combination %s" % (s, sizes[s][0], sizes[s][1]))

    def generateWasm(self,namespace, bc, OUT_FOLDER, fileName, debug=True):
        llFileName = "%s/%s" % (OUT_FOLDER, fileName)

        with ContentToTmpFile(content=bc, ext=".bc") as TMP_WASM:

            tmpWasm = TMP_WASM.file

            finalObjCreator = ObjtoWASM(namespace,debug=debug)
            finalObjCreator(args=[
                "%s.wasm" % (llFileName,),
                tmpWasm
            ], std=None)

            wat = WASM2WAT(namespace,debug=debug)
            wat(std=None, args=[
                "%s.wasm" % (llFileName,),
                "%s.wat" % (llFileName,)]
                )

            finalStream = open("%s.wasm" % (llFileName,), 'rb').read()
            if debug:
                LOGGER.warning("WASM SIZE %s" % (len(finalStream),))
            hashvalue = hashlib.sha256(finalStream)
            if debug:
                LOGGER.warning("WASM SHA %s" % (hashvalue.hexdigest(),))
            return hashvalue.hexdigest(), len(finalStream), "%s.wasm" % (llFileName,), "%s.wat" % (llFileName,)


if __name__ == "__main__":
    pipeline = Pipeline()

    f = sys.argv[1]

    if os.path.isfile(f):
        pipeline.process(f)
    else:
        from multiprocessing import Pool

        LOGGER.info("Pool size: %s" % config["DEFAULT"].getint("thread-pool-size"))

        with Pool(config["DEFAULT"].getint("thread-pool-size")) as p:
            p.map(pipeline.process, ["%s/%s" % (f, i) for i in os.listdir(f)])
