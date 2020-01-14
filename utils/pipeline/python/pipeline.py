# -*- coding: utf-8 -*-

import os
import sys
from stages import CToLLStage, LLToBC, BCToSouper, ObjtoWASM, WASM2WAT, BCCountCandidates
from utils import bcolors, DEBUG_FILE, OUT_FOLDER, printProgressBar, config, createTmpFile, getIteratorByName
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

        if not self.check_file(file):
            LOGGER.error("Invalid file %s" % (file,))
            return

        if not os.path.exists(OUT_FOLDER):
            os.mkdir(OUT_FOLDER)

        ll1 = b''

        if file.endswith(".c") or file.endswith(".cpp"):
            ctoll = CToLLStage()
            ll1 = ctoll(file)
        if file.endswith(".ll"):
            ll1 = open(file, 'rb')

        lltobc = LLToBC()
        bc = lltobc(std=ll1)

        program_name = file.split("/")[-1].split(".")[0]
        sha = set([])
        sizes = {}

        originalSha, originalSize = self.generateWasm(bc, OUT_FOLDER, program_name)
        sha.add(originalSha)
        sizes[originalSha] = [originalSize, []]


        bctocand = BCCountCandidates()

        tmpBC = createTmpFile()
        tmpBCF = open(tmpBC, 'wb')
        tmpBCF.write(bc)
        tmpBCF.close()

        cand = bctocand(args=[tmpBC], std=None)
        os.remove(tmpBC)
        # Infer candidates one by one

        # Saving candidate

        LOGGER.success("Found %s arithmetic expression candidates. %s Can be replaced" % (cand[1], cand[0]))

        # Test set the second candidate for optimization

        # BC to tmpfile
        tmpIn = createTmpFile()
        tmpOut = createTmpFile()

        tmpInFile = open(tmpIn, 'wb')
        tmpInFile.write(bc)
        tmpInFile.close()

        total = 2 ** (cand[0])  # tentative, TODO change to the iterator
        current = 1

        if cand[0] > 0:
            for s in getIteratorByName(config["DEFAULT"]["generator-method"])(range(cand[0])):
                sanitized_set_name = "_".join(list(map(lambda x: x.__str__(), s)))

                optBc = BCToSouper(candidates=list(s))
                optBc(args=[tmpIn, tmpOut], std=None)

                bsOpt = open(tmpOut, 'rb').read()

                hex, size = self.generateWasm(bsOpt, OUT_FOLDER, "%s[%s]" % (program_name, sanitized_set_name), debug=False)

                sizes[hex] = [size, list(s)]
                os.remove(tmpOut)
                printProgressBar(current, total,
                                 suffix="Completed %s[%s] %s" % (program_name, sanitized_set_name, hex), length=50)

                sha.add(hex)
                current += 1

            printProgressBar(current, total, suffix="Total number of programs %s. Different sha count %s      %s" % (
            current, len(sha), " " * 100), length=50)
        else:
            LOGGER.error("No succesfull replacements. Total number of subexpressions  %s" % cand[1])
        os.remove(tmpIn)

        if config["DEFAULT"].getboolean("print-sha"):
            LOGGER.warning("Summary ")
            for s in sha:
                LOGGER.warning("WASM SHA256 %s. Size %s. Combination %s"%(s, sizes[s][0],sizes[s][1] ))

    def generateWasm(self, bc, OUT_FOLDER, fileName, debug=True):
        llFileName = "%s/%s" % (OUT_FOLDER, fileName)

        tmpWasm = createTmpFile(ext=".bc")
        tmpWasmF = open(tmpWasm, 'wb')
        tmpWasmF.write(bc)
        tmpWasmF.close()

        finalObjCreator = ObjtoWASM(debug=debug)
        finalObjCreator(args=[
            "%s.wasm" % (llFileName,),
            tmpWasm
        ], std=None)

        os.remove(tmpWasm)
        wat = WASM2WAT(debug=debug)
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
        return hashvalue.hexdigest(), len(finalStream)


if __name__ == "__main__":
    pipeline = Pipeline()

    f = sys.argv[1]

    pipeline.process(f)
