# -*- coding: utf-8 -*-

import os
import configparser
import uuid
import iterators

config = configparser.ConfigParser(interpolation=configparser.ExtendedInterpolation())
config.read("settings/config.ini")

DEBUG_FILE = open(config["DEFAULT"]["debugfile"], 'wb')

OUT_FOLDER = config["DEFAULT"]["outfolder"]


def getIteratorByName(name: str):
    return getattr(iterators, name)


def createTmpFile():
    return "%s/%s" % (OUT_FOLDER, uuid.uuid4())


def globalCounter():
    globalCounter.counter += 1
    return globalCounter.counter


globalCounter.counter = 0


def printProgressBar(iteration, total, prefix='', suffix='', decimals=1, length=100, fill='█', printEnd="\r"):
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
    percent = ("{0:." + str(decimals) + "f}").format(100 * (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print('\r%s |%s| %s%% %s' % (prefix, bar, percent, suffix), end=printEnd)
    # Print New Line on Complete
    if iteration == total:
        print()


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


class Alias:
    clang = config["clang"]["path"]
    opt = config["opt"]["path"]

    # llc = "%s/souper/third_party/llvm/Release/bin/llc"%(BASE_DIR,)
    # lli = "%s/souper/third_party/llvm/Release/bin/lli"%(BASE_DIR,)
    llvm_as = config["llvm-as"]["path"]
    # "%s/souper/third_party/llvm/Release/bin/llvm-as"%(BASE_DIR,)
    # llc = "/usr/local/opt/llvm/bin/llc" #"%s/souper/third_party/llvm/Release/bin/llc"%(BASE_DIR,) # /usr/local/opt/llvm/bin/wasm-ld

    wasm_ld = config["wasm-ld"][
        "path"]  # os.environ.get("WASM_LD", "/usr/local/opt/llvm/bin/wasm-ld")  #"/usr/bin/wasm-ld-8" # /usr/local/opt/llvm/bin/wasm-ld
    souper = config["souper"]["souper"]
    souper_check = config["souper"]["check"]
    # souper2llvm = "%s/souper/build/souper2llvm"%(BASE_DIR,)
    wasm2wat = config["wabt"]["wasm2wat"]
    # libsouperPass_so = "../../souper/build/libsouperPass.so"
    # z3 = "%s/souper/third_party/z3/build/z3"%(BASE_DIR,)
