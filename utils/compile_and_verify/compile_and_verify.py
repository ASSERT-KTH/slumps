#! python

import os
from json import loads
import json
import re
import requests
import zipfile
import gzip
import sys
import shutil
import tarfile
from subprocess import Popen, PIPE
from  common import Reporter, download_wabtBinaries, saveBeforeExit


reporter = Reporter()

BASE_DIR = os.path.dirname(__file__)

#os.chdir(BASE_DIR)

print(BASE_DIR)


if len(sys.argv) < 3:
    print("You must provide the os binary options: (osx, linux, win32, win64)")
    print("You must the path to the wat files folder")
    exit(1)
    
BENCHMARK_FOLDER = sys.argv[2]
EXIT_ON_FAIL = True
KEEP_BINARIES = False

WAST2WASM = "wat2wasm"
WASMVALIDATE = "wasm-validate"


def compile_and_verify(BIN_FOLDER, startIn):
    for root, _, files in os.walk(startIn):
        for f in files:
            if f.endswith(".wat") or f.endswith(".wast"):
                
                wasm_bin_folder = "%s_bin"%(root,)
                print("Compiling ...", f)
                if not os.path.exists(wasm_bin_folder):
                    os.mkdir(wasm_bin_folder)

                # calling compiler in a subprocess (https://webassembly.github.io/wabt/doc/wat2wasm.1.html)
                p = Popen(["%s/%s"%(BIN_FOLDER, WAST2WASM), "%s/%s"%(root, f), "-o", "%s/%s.wasm"%(wasm_bin_folder, f)], stdout=PIPE, stderr=PIPE)
                _, err = p.communicate()
                rc = p.returncode
                if rc != 0:
                    print("Failing with %s/%s"%(root, f))
                    reporter.reportFail(f, "%s/%s.wasm"%(wasm_bin_folder, f), "%s/%s"%(root, f), 
                    err.decode("utf-8") + "\n```\n" + open("%s/%s"%(root, f), 'r').read() + '\n```')

                    print(err.decode("utf-8"))

                    if EXIT_ON_FAIL:
                        print("Exiting...")
                        saveBeforeExit(1, BIN_FOLDER, reporter)
                    continue

                
                print("Validating...", "%s.wasm"%(f,))

                # calling validator in a subprocess (https://webassembly.github.io/wabt/doc/wat2wasm.1.html)
                p = Popen(["%s/%s"%(BIN_FOLDER, WASMVALIDATE), "%s/%s.wasm"%(wasm_bin_folder, f)], stdout=PIPE, stderr=PIPE)
                _, err = p.communicate()
                rc = p.returncode
                if rc != 0:
                    print("Not valid wasm %s/%s"%(wasm_bin_folder, f))
                    reporter.reportFail(f, "%s/%s.wasm"%(wasm_bin_folder, f), "%s/%s"%(root, f), str(err))
                    if EXIT_ON_FAIL:
                        print("Exiting...")
                        saveBeforeExit(1, BIN_FOLDER, reporter)

                if KEEP_BINARIES:
                    reporter.reportSuccess(f, "%s/%s.wasm"%(wasm_bin_folder, f), "%s/%s"%(root, f))
                else:
                    reporter.reportSuccess(f, "%s/%s"%(root, f), "%s/%s"%(root, f))

                    # add to git history


                if not KEEP_BINARIES:
                    os.remove("%s/%s.wasm"%(wasm_bin_folder, f))


if __name__ == "__main__":
    

    #WebAssembly/wabt
    bin_folder =  download_wabtBinaries("WebAssembly", "wabt")

    print("Compiling benchmark programs")
    compile_and_verify(bin_folder, BENCHMARK_FOLDER)
    
    saveBeforeExit(0, bin_folder, reporter)
