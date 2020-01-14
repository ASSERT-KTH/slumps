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

        if config["DEFAULT"].getboolean("export-original"):
            self.generateWasm(bc, OUT_FOLDER, program_name)

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

        for set in getIteratorByName(config["DEFAULT"]["generator-method"])(range(cand[0])):
            LOGGER.success("Generating version for %s" % set.__str__())
            optBc = BCToSouper(candidates=list(set))
            optBc(args=[tmpIn, tmpOut], std=None)

            bsOpt = open(tmpOut, 'rb').read()

            sanitized_set_name =  "_".join(list(map(lambda x: x.__str__(), set)))
            self.generateWasm(bsOpt, OUT_FOLDER, "%s%s"%(program_name, sanitized_set_name))

            os.remove(tmpOut)
        os.remove(tmpIn)



    def generateWasm(self, bc, OUT_FOLDER, fileName):
        llFileName = "%s/%s" % (OUT_FOLDER, fileName)

        tmpWasm = createTmpFile(ext=".bc")
        tmpWasmF = open(tmpWasm, 'wb')
        tmpWasmF.write(bc)
        tmpWasmF.close()

        finalObjCreator = ObjtoWASM()
        finalObjCreator(args=[
            "%s.wasm"%(llFileName,),
            tmpWasm
        ], std=None)

        os.remove(tmpWasm)
        wat = WASM2WAT()
        wat(std=None, args=[
            "%s.wasm" % (llFileName,),
            "%s.wat" % (llFileName,)]
            )

        finalStream = open("%s.wasm" % (llFileName,), 'rb').read()
        LOGGER.warning("WASM SIZE %s" % (len(finalStream),))
        hashvalue = hashlib.sha256(finalStream)
        LOGGER.warning("WASM SHA %s" % (hashvalue.hexdigest(),))


if __name__ == "__main__":
    pipeline = Pipeline()

    f = sys.argv[1]

    pipeline.process(f)
