
import itertools
import collections
import os

DEBUG_FILE = open("debug.slumps.log", 'wb')

OUT_FOLDER = "out"
MAX_INST = 3

GLOBAL_COUNTER = 1


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

def printProgressBar (iteration, total, prefix = '', suffix = '', decimals = 1, length = 100, fill = '█', printEnd = "\r"):
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
    print('\r%s |%s| %s%% %s' % (prefix, bar, percent, suffix), end = printEnd)
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
    #llc = "/usr/local/opt/llvm/bin/llc" #"%s/souper/third_party/llvm/Release/bin/llc"%(BASE_DIR,) # /usr/local/opt/llvm/bin/wasm-ld

    wasm_ld = "/usr/bin/wasm-ld-8" # /usr/local/opt/llvm/bin/wasm-ld
    souper = "%s/souper/build/souper"%(BASE_DIR,)
    souper_check = "%s/souper/build/souper-check"%(BASE_DIR,)
    souper2llvm = "%s/souper/build/souper2llvm"%(BASE_DIR,)
    wasm2wat = "%s/wabt/bin/wasm2wat"%(BASE_DIR,)
    # libsouperPass_so = "../../souper/build/libsouperPass.so"
    z3 = "%s/souper/third_party/z3/build/z3"%(BASE_DIR,)