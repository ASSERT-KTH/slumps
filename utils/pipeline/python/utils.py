
import itertools
import collections
import os

DEBUG_FILE = open("debug.slumps.log", 'wb')

OUT_FOLDER = "out"

def getSubsetIterator(S,m):
    if m == len(S):
        yield S
    else:
        yield from itertools.combinations(S, m)
        yield from getSubsetIterator(S, m + 1)
        
def flatten(x):
    if isinstance(x, collections.Iterable):
        return [a for i in x for a in flatten(i)]
    else:
        return [x]

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'



BASE_DIR = os.path.dirname(
    os.path.dirname(
        os.path.dirname(
            os.path.dirname(
                os.path.abspath(__file__)))))


class Alias:
    
    clang = "%s/souper/third_party/llvm/Release/bin/clang"%(BASE_DIR,)
    opt = "%s/souper/third_party/llvm/Release/bin/opt"%(BASE_DIR,)
    llc = "%s/souper/third_party/llvm/Release/bin/llc"%(BASE_DIR,)
    lli = "%s/souper/third_party/llvm/Release/bin/lli"%(BASE_DIR,)
    llvm_as = "%s/souper/third_party/llvm/Release/bin/llvm-as"%(BASE_DIR,)    
    llc = "/usr/local/opt/llvm/bin/llc" #"%s/souper/third_party/llvm/Release/bin/llc"%(BASE_DIR,) # /usr/local/opt/llvm/bin/wasm-ld

    wasm_ld = "/usr/local/opt/llvm/bin/wasm-ld" # /usr/local/opt/llvm/bin/wasm-ld
    souper = "%s/souper/build/souper"%(BASE_DIR,)
    souper_check = "%s/souper/build/souper-check"%(BASE_DIR,)
    souper2llvm = "%s/souper/build/souper2llvm"%(BASE_DIR,)
    wasm2wat = "%s/wabt/bin/wasm2wat"%(BASE_DIR,)
    # libsouperPass_so = "../../souper/build/libsouperPass.so"
    z3 = "%s/souper/third_party/z3/build/z3"%(BASE_DIR,)