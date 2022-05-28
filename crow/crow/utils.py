# -*- coding: utf-8 -*-

import os
import subprocess

import uuid
import sys
from crow.settings import config, reload
from crow.monitor.logger import LOGGER
import re
import traceback
import time
from crow import iterators


NOW = time.time()
BASE_DIR = os.path.dirname(__file__)
RUNTIME_CONFIG = dict(USE_REDIS=False)

import os
import sys
OUT_FOLDER = os.getenv("OUT_FOLDER", "out")

def create_path(base_path, path):
    root = base_path

    subfolders = path.split("/")

    for folder in subfolders:
        if not os.path.exists(f"{root}/{folder}"):
            os.mkdir(f"{root}/{folder}")
        root = f"{root}/{folder}"


class ContentToTmpFile(object):


    def __init__(self, content=None, name=None, ext=None, persist=False, LOG_LEVEL =  0, outFolder=None):
        try:
            tmp = createTmpFile(ext, outFolder) if not name else name

            tmp = ''.join([c for c in tmp])

            create_path(".","".join(tmp.split("/")[:-1])) # create path if not exist


            if content:
                self.tmpF = open(tmp, "wb")
                self.tmpF.write(content)
                self.tmpF.close()
            else:
                self.tmpF = open(tmp, 'wb')
            self.file = tmp
            self.persist = persist
            self.LOG_LEVEL = LOG_LEVEL
        except Exception as e:
            print(f"Failing {e}")
            raise e


    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_vadl, exc_tb):
        try:
            if self.tmpF:
                self.tmpF.close()
            if not self.persist:
                os.remove(self.file)
        except Exception as e:
            print(f"{e} {traceback.format_exc()}")
            pass
            #if self.LOG_LEVEL > 1:
            #    LOGGER.error(self.tmpF, traceback.format_exc())


def updatesettings(argvs):

    SLUMPS_DIR = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))

    print("Slumps dir...%s" % SLUMPS_DIR)
    config["DEFAULT"]["slumpspath"] = SLUMPS_DIR
    configfile = os.path.join(os.path.dirname(__file__),  "settings/config.ini")

    with open(configfile, 'w') as configFile:
        config.write(configFile)
        
    
    platform = ".so" if sys.platform == 'linux' else '.dylib'  # dylib for MacOS

    print("OS...%s" % sys.platform)
    config["souper"]["passName"] = config["souper"]["passName"].split(".")[
        0] + platform

        
    pairs = []
    for index, a in enumerate(argvs):
        if a.startswith("%"):
            if index + 1 < len(argvs) and not argvs[index + 1].startswith("%"):
                pairs.append([a, argvs[index + 1]])
            else:
                raise Exception(
                    "Invalid option %s. Full options line %s" % (a, " ".join(argvs)))

    for pair in pairs:
        processOptionValuePair(pair)


    with open(configfile, 'w') as configFile:
        config.write(configFile)
        
    OUT_FOLDER = config["DEFAULT"]["outfolder"]

    reload()

def processOptionValuePair(pair):
    option, value = pair
    option = option[1:]  # Remove the firsst dash
    namespace, key = option.split(".")  # Getting namespace and key

    if not namespace in config:
        print("Available namespace for configuration:")
        for k in config.keys():
            print("\t%s" % k)
        raise Exception("%s namespace not found" % namespace)

    if not key in config[namespace]:
        print("Available keys for namespace %s:" % namespace)
        for k in config[namespace].keys():
            print("\t%s: %s" % (k, config[namespace][k]))
        raise Exception("%s key not found" % key)

    config[namespace][key] = value
    print(namespace, key, value)


def get_variant_name(merging: dict, j: dict, onlykeys=False):


    name = ""

    keys = list(merging.keys())
    for k, v in j.items():
        if v is not None:
            name += "[%s-%s]" % (keys.index(k), merging[k].index(v))
        else:
            name += "[%s-n]" % (keys.index(k),)
    return name

def getIteratorByName(name: str):
    return getattr(iterators, name)


def createTmpFile(ext="", outFolder=None):
    r = "%s/CROW_TMP-%s%s" % (OUT_FOLDER if outFolder is None else outFolder, uuid.uuid4(), ext if ext else "")

    return r


def globalCounter():
    globalCounter.counter += 1
    return globalCounter.counter


globalCounter.counter = 0



def printinSameLine(text, printEnd="\r"):
    sys.stdout.write('\r%s' % (text,))
    sys.stdout.flush()




def printProgressBar(iteration, total, prefix='', suffix='', decimals=1, length=40, fill='█', printEnd="\r"):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
        printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
    """
    percent = ("{0:." + str(decimals) + "f}").format(100 *
                                                     (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print('\r%s |%s| %s%% %s' % (prefix, bar, percent, suffix), end=printEnd)
    # Print New Line on Complete
    if iteration == total:
        print()


class Alias:

    
    clang = config["clang"]["path"]
    opt = config["opt"]["path"]

    llvm_as = config["llvm-as"]["path"]

    wasm_ld = config["wasm-ld"]["path"] 
    souper = config["souper"]["souper"]
    souper_check = config["souper"]["check"]
    wasm2wat = config["wabt"]["wasm2wat"]
    wasmtime = config["wasmtime"]["bin"]
    dump = config["objdump"]["bin"]
    diff = config["diff"]["bin"]
    llvm_split = config["split"]["bin"]
    llvm_extract = config["extract"]["bin"]


def processCandidatesMetaOutput(output):
    meta = re.compile(r'\[(.*)/(\d+)\]')
    setRe = re.compile(r"\[SLUMPS-META replacement idx (\d+)\]\n")
    match = meta.search(output)

    total = int(match.group(2))

    # process set
    try:
        resultSet = [int(r) for r in setRe.findall(output)]

        return [resultSet, total]
    except Exception as e:
        return [[], total]


class BreakException(Exception):
    pass

import threading

def print_timer(timeout):
    NOW = time.time()
    def print_time():
        while True:
            time.sleep(0.5)
            printinSameLine(f"{timeout -(time.time() - NOW):.2f}s")

            if time.time() - NOW >= timeout:
                break

    th = threading.Thread(target=print_time)
    th.start()

