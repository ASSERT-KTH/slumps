import sys

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

REPORT_OUTPUT = os.path.dirname(__file__)


def download_wabtBinaries(repoOwner, projectName):

    # OS release target (osx, linux, win32, win64)
    

    OS = sys.argv[1]
    PATTERN = ".*-%s.((tar.gz)|(zip))"%(OS,)
    BIN_OUT_DIR = "bin"
    

    # list wabt releases
    URL = "https://api.github.com/repos/{repoOwner}/{projectName}/releases/latest".format(repoOwner = repoOwner, 
    projectName=projectName)
        
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
            shutil.move("%s-%s"%(projectName, tag), BIN_OUT_DIR)  
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
        self.error_count = 0

    def reportSuccess(self, fName, dst, path, message = ""):
        #self.logs.append([1, "- [Success %s](%s) %s"%(fName, dst, message)])
        self.valid_count += 1
    def reportFail(self, fName, dst, path, err, message = ""):
        self.logs.append([0, "- [Error](%s) %s %s"%(path, err, message)])
        self.error_count += 1


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


        invalid_badge = self.getBadge("errored wasm", self.error_count , "error")

        f = open("%s/error_badge.svg"%(REPORT_OUTPUT,), 'w')
        f.write(invalid_badge)
        f.close()


        # md report

        f = open("%s/report.md"%(REPORT_OUTPUT,), 'w')

        f.write("![valid](./error_badge.svg)\n")

        for l in self.logs:
            f.write(l[1] + "\n\n")
        f.close()

        ## add files to git


def saveBeforeExit(code, bin_folder, reporter):
    reporter.save()

    print("Cleaning binary dir...")
    shutil.rmtree(bin_folder)

    exit(code)

