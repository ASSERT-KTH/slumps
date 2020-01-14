# -*- coding: utf-8 -*-

import os
import sys
from stages import CToLLStage, LLToBC, BCToSouper, ObjtoWASM, WASM2WAT, BCListCandidates
from utils import bcolors, DEBUG_FILE, flatten, OUT_FOLDER, printProgressBar, config, createTmpFile
from logger import LOGGER

import collections


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

        if config["DEFAULT"].getboolean("export-original"):
            self.generateOriginalWASM(ll1, OUT_FOLDER, file)

        lltobc = LLToBC()
        bc = lltobc(std=ll1)

        LOGGER.success("Initial BC size %s bytes" % (len(bc),))

        bctocand = BCListCandidates()
        cand = bctocand(std=bc)
        # Infer candidates one by one

        # Saving candidate
        candidates = cand.decode("utf-8").split("\n\n")  # Avoid the last separator
        candidates = list(candidates)

        LOGGER.success("Found %s arithmetic expression candidates. Filtering and solving..." % (len(candidates),))

        # Test set the second candidate for optimization

        # BC to tmpfile
        tmpIn = createTmpFile()
        tmpOut = createTmpFile()

        tmpInFile = open(tmpIn, 'wb')
        tmpInFile.write(bc)


        optBc = BCToSouper(candidates=[2])
        optBc(args=[tmpIn, tmpOut], std=None)

        bsOpt = open(tmpOut, 'rb').read()

        LOGGER.success("Optimized BC size %s bytes" % (len(bsOpt),))

        os.remove(tmpIn)
        os.remove(tmpOut)

    def generateOriginalWASM(self, bc, OUT_FOLDER, file):
        llFileName = "%s/%s.all.ll" % (OUT_FOLDER, file.split("/")[-1])

        finalObjCreator = ObjtoWASM()
        finalobj = finalObjCreator(std=bc)

        open("%s.orig.wasm" % (llFileName,), 'wb').write(finalobj)

        wat = WASM2WAT()
        wat(std=None, args=[
            "%s.orig.wasm" % (llFileName,),
            "%s.orig.wat" % (llFileName,)]
            )

        LOGGER.warning("WASM SIZE %s" % (len(open("%s.orig.wasm" % (llFileName,), 'rb').read()),))


if __name__ == "__main__":
    pipeline = Pipeline()

    f = sys.argv[1]

    pipeline.process(f)
