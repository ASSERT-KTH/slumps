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


BASE_DIR = os.path.dirname(__file__)

#os.chdir(BASE_DIR)

print(BASE_DIR)


if len(sys.argv) < 3:
    print("You must provide the os binary options: (osx, linux, win32, win64)")
    print("You must the path to the wat files folder")
    exit(1)
    
BENCHMARK_FOLDER = sys.argv[2]
EXIT_ON_FAIL = False
KEEP_BINARIES = False

WAST2WASM = "wat2wasm"
WASMVALIDATE = "wasm-validate"
REPORT_OUTPUT = os.path.dirname(__file__)
ADD_TO_GIT = False

def download_wabtBinaries():

    # OS release target (osx, linux, win32, win64)
    

    OS = sys.argv[1]
    PATTERN = ".*-%s.((tar.gz)|(zip))"%(OS,)
    BIN_OUT_DIR = "bin"
    PROJECT_NAME = "wabt"

    # list wabt releases
    URL = "https://api.github.com/repos/WebAssembly/wabt/releases/latest"
        
    r = requests.get(url = URL) 

    latest = loads(r.text)

    print("Release published at", latest["published_at"], "downloading binaries")

    binaries = latest["assets"]

    tag = latest["tag_name"]
    print(len(binaries), "binaries found. Getting specific OS binary. Tag", tag)

    for bin in binaries:
        print("--", bin["name"], bin["content_type"])

    selectedIndex = -1

    for i in range(len(binaries)):
        if  re.match(PATTERN, binaries[i]["name"]):
            print("Choosing ", binaries[i]["name"], "based on input OS", "Size", binaries[i]["size"])
            selectedIndex = i
            break

    if selectedIndex == -1:
        print("OS specific binary not found '{}'".format(OS))
        exit(1)

    filedata = requests.get(binaries[selectedIndex]["browser_download_url"])
    zipName = binaries[selectedIndex]["name"]
    contentType = binaries[selectedIndex]["content_type"]
    chunkSize = 512*1024

    with open(zipName, 'wb') as f:
        for chunk in filedata.iter_content(chunk_size=chunkSize):
            if chunk:
                f.write(chunk)

    print("Unzipping files...", contentType)

    if contentType  == "application/octet-stream" or contentType == "application/zip": # windows? zip
        with zipfile.ZipFile(zipName, 'r') as zip_ref:
            zip_ref.extractall(BIN_OUT_DIR)

    elif contentType  == "application/gzip":  # osx and linux gzip
        if zipName.endswith(".tar.gz"):
            tar = tarfile.open(zipName, "r:gz")
            tar.extractall()
            tar.close()
        elif zipName.endswith("tar"):
            tar = tarfile.open(zipName, "r:")
            tar.extractall()
            tar.close()
        else:
            print("Impossible to unzip")
            exit(1)
        # move tar content to our bin folder
        if not os.path.exists(BIN_OUT_DIR):
            shutil.move("%s-%s"%(PROJECT_NAME, tag), BIN_OUT_DIR)  
    else:
        print("Unknown content type. Exiting...")
        exit(1)
    

    print("Cleaning zip files...")
    os.remove(zipName)

    return BIN_OUT_DIR

class Reporter(object):

    def __init__(self):
        self.logs = []
        self.valid_count = 0
        self.erro_count = 0

    def reportSuccess(self, fName, dst, path, message = ""):
        self.logs.append([1, "- [Success %s](%s) %s"%(fName, dst, message)])
        self.valid_count += 1
    def reportFail(self, fName, dst, path, err, message = ""):
        self.logs.append([0, "- [Error %s](%s) %s %s"%(fName, path, err, message)])
        self.erro_count += 1


    def getBadge(self, message, value, type):

        color = "#4c1" if type == "success" else "#f00"

        return  '''<?xml version="1.0"?>
            <svg xmlns="http://www.w3.org/2000/svg" width="139" height="20">
                <linearGradient id="a" x2="0" y2="100%">
                    <stop offset="0" stop-color="#bbb" stop-opacity=".1"/>
                    <stop offset="1" stop-opacity=".1"/>
                </linearGradient>
                <rect rx="3" width="139" height="20" fill="#555"/>
                <rect rx="3" x="96" width="43" height="20" fill="{color}"/>
                <path fill="{color}" d="M96 0h4v20h-4z"/>
                <rect rx="3" width="139" height="20" fill="url(#a)"/>
                <g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="11">
                    <text x="49" y="15" fill="#010101" fill-opacity=".3">{message}</text>
                    <text x="49" y="14">{message}</text>
                    <text x="116.5" y="15" fill="#010101" fill-opacity=".3">{value}</text>
                    <text x="116.5" y="14">{value}</text>
                </g>
            </svg>
        '''.format(message = message, value = value, color=color)
    def save(self):

        # creating badges

        
        valid_badge = self.getBadge("valid wasm", self.valid_count , "success")

        f = open("%s/valid_badge.svg"%(REPORT_OUTPUT,), 'w')
        f.write(valid_badge)
        f.close()


        invalid_badge = self.getBadge("errored wasm", self.erro_count , "error")

        f = open("%s/error_badge.svg"%(REPORT_OUTPUT,), 'w')
        f.write(invalid_badge)
        f.close()


        # md report

        f = open("%s/report.md"%(REPORT_OUTPUT,), 'w')

        f.write("![valid](./valid_badge.svg) ![valid](./error_badge.svg)\n")

        for l in self.logs:
            f.write(l[1] + "\n\n")
        f.close()

        ## add files to git


reporter = Reporter()

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
                output, err = p.communicate()
                rc = p.returncode
                if rc != 0:
                    print("Failing with %s/%s"%(root, f))
                    reporter.reportFail(f, "%s/%s.wasm"%(wasm_bin_folder, f), "%s/%s"%(root, f), str(err))
                    if EXIT_ON_FAIL:
                        print("Exiting...")
                        exit(1)
                    continue

                
                print("Validating...", "%s.wasm"%(f,))

                # calling validator in a subprocess (https://webassembly.github.io/wabt/doc/wat2wasm.1.html)
                p = Popen(["%s/%s"%(BIN_FOLDER, WASMVALIDATE), "%s/%s.wasm"%(wasm_bin_folder, f)], stdout=PIPE, stderr=PIPE)
                output, err = p.communicate()
                rc = p.returncode
                if rc != 0:
                    print("Not valid wasm %s/%s"%(wasm_bin_folder, f))
                    reporter.reportFail(f, "%s/%s.wasm"%(wasm_bin_folder, f), "%s/%s"%(root, f), str(err))
                    if EXIT_ON_FAIL:
                        print("Exiting...")
                        exit(1)

                if KEEP_BINARIES:
                    reporter.reportSuccess(f, "%s/%s.wasm"%(wasm_bin_folder, f), "%s/%s"%(root, f))
                else:
                    reporter.reportSuccess(f, "%s/%s"%(root, f), "%s/%s"%(root, f))

                    # add to git history


                if not KEEP_BINARIES:
                    os.remove("%s/%s.wasm"%(wasm_bin_folder, f))

bin_folder =  download_wabtBinaries()

print("Compiling benchmark programs")
compile_and_verify(bin_folder, BENCHMARK_FOLDER)

reporter.save()

print("Cleaning binary dir...")
shutil.rmtree(bin_folder)