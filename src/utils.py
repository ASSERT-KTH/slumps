# -*- coding: utf-8 -*-

import os
import configparser
import uuid
import iterators
import sys
from subprocess import check_output
from subprocess import Popen, PIPE

config = configparser.ConfigParser(interpolation=configparser.ExtendedInterpolation())
config.read("settings/config.ini")


class ContentToTmpFile(object):

    def __init__(self, content=None, name=None, ext=None):

        tmp = createTmpFile(ext) if not name else name

        if content:
            tmpF = open(tmp, "wb")
            tmpF.write(content)
            tmpF.close()
        else:
            self.tmpF = open(tmp, 'wb')

        self.file = tmp

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        try:
            if self.tmpF:
                self.tmpF.close()
            os.remove(self.file)
        except:
            pass

def updatesettings():
    if not os.path.exists("settings/.slumps"):
        print("Setting up slumps for the first time...")
        open("settings/.slumps", 'w').write("SLUMPs them all!")

        SLUMPS_DIR = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))

        print("Slumps dir...%s"%SLUMPS_DIR)
        config["DEFAULT"]["slumpspath"] = SLUMPS_DIR

        platform = ".so" if sys.platform == 'linux' else '.dylib' # dylib for MacOS
        print("OS...%s"%sys.platform)
        config["souper"]["passName"] = config["souper"]["passName"].split(".")[0] + platform

        # WAS-ld binary

        # Read available binaries
        bins = check_output('compgen -c', shell=True, executable='/bin/bash').splitlines()

        wasm_bins = list(filter(lambda x: x.startswith("wasm-ld") ,map(lambda x: x.decode("utf-8"), bins)))
        emcc = list(filter(lambda x: x.startswith("emcc") ,map(lambda x: x.decode("utf-8"), bins)))


        if len(wasm_bins) == 0:
            raise Exception("WASM linker not found. Please install it (apt-get install lld-<version> for ubuntu)")

        wasm_ld = wasm_bins[0]
        if len(wasm_bins) > 1:
            print("Multiple WASM linkers. Choose one, take into account the version of llvm built with Souper:")

            for i, b in enumerate(wasm_bins):
                print("%s -  %s"%(i + 1, b))

            option = int(input("Option: "))
            wasm_ld = wasm_bins[option - 1]

        config["wasm-ld"]["path"] = wasm_ld

        if len(emcc) == 0:
            print("No Emscripten bins found. This can be harmful for SLUMPs")
        else:
            with ContentToTmpFile(name="setting.c", content=b'int main(){return 0;}') as tmpC:

                emcc = Popen(('emcc -v %s -o -' % tmpC.file).split(" "),  stdout=PIPE, stderr=PIPE, stdin=PIPE)
                emcc, err = emcc.communicate()

                words = err.decode("utf-8").split(" ")

                includes = []
                for w in words:
                    if w.startswith("-isystem"):
                        includes.append(w)

                config["clang"]["includes"] = " ".join(includes)


        with open("settings/config.ini", 'w') as configFile:
            config.write(configFile)

updatesettings()

DEBUG_FILE = open(config["DEFAULT"]["debugfile"], 'wb')

OUT_FOLDER = config["DEFAULT"]["outfolder"]


def getIteratorByName(name: str):
    return getattr(iterators, name)


def createTmpFile(ext=""):
    return "%s/%s%s" % (OUT_FOLDER, uuid.uuid4(), ext)


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
    WARNING = '\u001b[36;1m'
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

class BreakException(Exception):
    pass