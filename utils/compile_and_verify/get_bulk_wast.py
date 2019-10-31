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
from  common import download_wabtBinaries, saveBeforeExit


BASE_DIR = os.path.dirname(__file__)

#os.chdir(BASE_DIR)

print(BASE_DIR)


if len(sys.argv) < 3:
    print("You must provide the os binary options: (osx, linux, win32, win64)")
    print("You must the path to the wat files folder")
    exit(1)
    
BENCHMARK_FOLDER = sys.argv[2]
OUT_FOLDER = sys.argv[3]

WASM2WAST = "wasm2wat"

#out/wasm2wat test.wasm -o test.wat

def generate_bulk(BIN_FOLDER, startIn, OUT_FOLDER):
    for root, _, files in os.walk(startIn):
        for f in files:
            if f.endswith(".wasm"):
                
                wasm_bin_folder = OUT_FOLDER
                print("Decompiling ...", f)
                
                if not os.path.exists(wasm_bin_folder):
                    os.mkdir(wasm_bin_folder)

                # calling compiler in a subprocess (https://webassembly.github.io/wabt/doc/wat2wasm.1.html)
                p = Popen(["%s/%s"%(BIN_FOLDER, WASM2WAST), "%s/%s"%(root, f), "-o", "%s/%s.wat"%(wasm_bin_folder, f)], stdout=PIPE, stderr=PIPE)
                _, err = p.communicate()
                rc = p.returncode
                if rc != 0:
                    print("Failing with %s/%s"%(root, f))
                    
                    print(err.decode("utf-8"))

                    continue

                


if __name__ == "__main__":
    

    #WebAssembly/wabt
    bin_folder =  download_wabtBinaries("WebAssembly", "wabt")

    print("Compiling benchmark programs")
    generate_bulk(bin_folder, BENCHMARK_FOLDER, OUT_FOLDER)
    
    saveBeforeExit(0, bin_folder, None)
