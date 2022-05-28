# -*- coding: utf-8 -*-

from email.policy import default
from subprocess import Popen, PIPE, check_output
from crow.settings import config
from crow.utils import  Alias, RUNTIME_CONFIG
from crow.monitor.logger import LOGGER
import time
import sys
import atexit
import re


definedre = re.compile(r"((%[0-9a-zA-Z]+):i(\d+))[ \t\r]*=")
usage = re.compile(r"((%[0-9a-zA-Z]+))")
comment = re.compile(r"[ \r\t];[\t\r 0-9a-zA-Z_]+")
# FIX of code and replacement
def get_defined(code):
    defined = []
    for l in code.split("\n"):
        found = definedre.findall(l)
        #print(found)
        if found and len(found[0]) > 1:
            defined.append(found[0][1])

    return defined

def fix_key(key):
    # Remove inline comments
    content = []
    for l in key.split("\n"):
        nl = l
        if '=' in l:
            if comment.findall(l):
                nl = l.replace(comment.findall(l)[0], "")
                #print(nl)
        content.append(f"{nl}")
    return "\n".join(content)
    


def fix_pair(key, value):
    defined_key = get_defined(key)
    defined_value = get_defined(value)

    if set(defined_key).intersection(defined_value):
        print("WARNING", "Defined key in replacement was defined first at code place")

    RED = {

    }
    CONTENT = []
    for l in value.split("\n"):

        if '=' in l:
            if "var" in l and config["DEFAULT"].getboolean("remove-var-from-repl"):
                # var comes from K, skip then
                continue
            # assignment
            found = definedre.findall(l)
            # Replace RHS, this is suppose to be SSA
            nl = l
            for k, v in RED.items():
                if k not in defined_key:
                    nl = l.replace(k, v)

            if found and len(found[0]) > 1:
                #print(found)
                # redefine with a new name
                RED[found[0][1]] = f"{found[0][1]}crow{len(defined_key)}"
                nl = nl.replace(found[0][1], f"{found[0][1]}crow{len(defined_key)}")
            
            CONTENT.append(f"{nl}\n")
        else:
            # comment or return
            for k, v in RED.items():
                nl = l.replace(k, v)
                CONTENT.append(f"{nl}\n")
        #print(found)
    return "\n".join(CONTENT)




class CallException(Exception):

    def __init__(self, message, stderr):
        self.stderr = stderr
        self.message = message
class TimeoutException(Exception):
    pass

class ExternalStage:

    DEBUG_LEVEL = config["DEFAULT"].getint("debug-level")
    non_explicit = True
    redirect=False

    def __init__(self, namespace):
        self.name = "unknown"
        self.path_to_executable = "unknown"
        self.debug = True
        self.namespace = namespace
        self.timeout = -1
        self.non_explicit = True

    def processInner(self, std, err):
        return std, err

    def check(self, args = []):
        return check_output(args)

    def __call__(self, args=[], stdin=None):  # stdin byte stream

        args = list(filter(lambda x: x != "", args))

        if config["DEFAULT"].getboolean("stages-to-stdout") or self.redirect:
            redirect = sys.stdout
            REDIRECT=True
        else:
            redirect = PIPE
            REDIRECT = False

        cmd = ["timeout", f"{self.timeout}"] + [self.path_to_executable] if self.timeout > -1 else [self.path_to_executable]
        
        if self.DEBUG_LEVEL > 0 and self.timeout > -1:
            LOGGER.info(self.namespace, f"Setting timeout {self.timeout} {cmd + args} ")

        p = Popen(cmd + args, stdout=redirect, stderr=redirect, stdin=PIPE)
        atexit.register(p.terminate)

        self.p = p
        if stdin is not None:
            p.stdin.write(stdin)

        start = time.time()

        if not REDIRECT:
            std, err = p.communicate()
        else:
            return
        delta = time.time() - start
        if self.debug:
            LOGGER.success(self.namespace, "Command -> %s (%.2f s)" % (self.name, delta))
            LOGGER.info(self.namespace, " ".join([self.path_to_executable] + args))

        rc = p.returncode
        if self.DEBUG_LEVEL > 1:
            LOGGER.error(self.namespace, "%s %s %s" % (err.decode( errors="ignore"), rc, std.decode( errors="ignore")))

        if rc != 0:

            if rc == 124:
                raise TimeoutException()

            if self.non_explicit:
                raise CallException("Error on stage: %s %s" % (self.name, f"{cmd + args} "), err)

        # Specific implementation process over the std out
        res = self.processInner(std, err)

        if self.debug and self.DEBUG_LEVEL > 0:
            LOGGER.debug(self.namespace, "============================= Command -> %s\n\n" % (self.name,), res)

            if err and self.DEBUG_LEVEL > 1:
                LOGGER.debug(self.namespace, "stderr \n\n %s \n\n" % (err.decode("utf-8"),))


        return res


class CCheck(ExternalStage):
    def __init__(self, namespace, debug=False):
        self.path_to_executable = Alias.clang
        self.name = "C check code"
        self.debug = debug
        self.namespace = namespace
        self.timeout = -1

    def __call__(self, args=[], std=None):
        new_inputs = (config["clang"]["check_code"]).split(" ")
        std, err = super(CCheck, self).__call__(args=new_inputs, stdin=std)
        if err:
            raise CallException("", err)


class CToLLStage(ExternalStage):

    def __init__(self, namespace):
        self.path_to_executable = Alias.clang
        self.name = "C to LLVM IR"
        self.debug = True
        self.timeout = -1

        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = (config["clang"]["command"] % (args,)).split(" ")
        return super(CToLLStage, self).__call__(new_inputs)

    def processInner(self, std, err):
        return std


class LLToBC(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.llvm_as
        self.name = "LLVM IR to LLVM bitcode"
        self.debug = debug

        self.namespace = namespace
        self.timeout = -1

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = (config["llvm-as"]["command"] % "- -o -").split(" ")
        return super(LLToBC, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        return std


class BCMem2Reg(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.opt
        self.name = "Bitcode mem2reg"
        self.debug = debug
        self.timeout = -1
        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = ("- -o -").split(" ")
        return super(BCMem2Reg, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        return std


class BCCountCandidates(ExternalStage):

    def __init__(self, namespace, level=1, souper_workers=4, timeout=-1, socket_port = 5678, socket_host="127.0.0.1", redirect=False, pref=""):
        self.path_to_executable = Alias.opt
        self.name = "LLVM BC to Souper IR candidates"
        self.debug = True
        self.level = level
        self.DEBUG_LEVEL = 1
        self.souper_workers = souper_workers
        self.timeout = timeout
        self.socket_port = socket_port
        self.socket_host = socket_host
        self.redirect = redirect
        self.pref = pref

        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs
        extra_commands = "%s -o %s.opt.bc" % (args[0], args[0])
        extra_commands += " --souper-crow-workers=%s --souper-crow-variant-prefix=%s.%s "%(self.souper_workers, self.pref, self.level)

        new_inputs = (config["souper"]["list-candidates"] % (
        config["souper"]["souper-level-%s" % self.level] if self.level > 0 else "", extra_commands)).split(" ")
        return super(BCCountCandidates, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        return std
    


class CountDeclarations(ExternalStage):

    def __init__(self, namespace, debug=False, timeout=-1):

        self.path_to_executable = Alias.opt
        self.name = "Count declared functions"
        self.debug = debug
        self.timeout = timeout



        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs
        extra_commands = "%s -o %s" % (args[0], args[1])

        #if RUNTIME_CONFIG["USE_REDIS"]:
        extra_commands += " --souper-crow-count --souper-crow-count-name "

        new_inputs = (config["souper"]["super-count-pass"] % (extra_commands, )).split(" ")
        return super(CountDeclarations, self).__call__(new_inputs, std)

    def processInner(self, std, err):

        meta = [l for l in err.decode().split("\n") if l]

        REDECLARED=re.compile(r"Declared (.+)")
        REDEFINED=re.compile(r"Defined (.+)")

        declared = []
        defined = []

        for l in meta:
            #if REDECLARED.match(l):
            declaredm = REDECLARED.findall(l)
            # print(declaredm)
            if len(declaredm) >= 1:
                declared.append(declaredm[0])


            definedm = REDEFINED.findall(l)
            # print(definedm)
            if len(definedm) >= 1:
                defined.append(definedm[0])

        #print(r)
        return declared, defined

class BCToSouper(ExternalStage):

    def __init__(self, namespace, job, debug=False, level=1, redisport = 6380, timeout=-1):

        self.path_to_executable = Alias.opt
        self.name = "LLVM BC supertoptimization pass"
        self.debug = debug
        self.level = level
        self.redisport = redisport
        self.timeout = timeout
        self.job = job



        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs

        extra_commands = config["souper"]["super-opt-pass"].split(" ")
        extra_commands += [args[0], "-o", args[1]]

        sanitizedk = [k for k in self.job.keys()]
        sanitizedv = [v for v in self.job.values()]

        # FIX value and keys
        if config['DEFAULT'].getboolean('sanitize-repl'):
            print("Fixing replacement")
            sanitizedv = [ fix_pair(k, v) for k, v in zip(sanitizedk, sanitizedv) ]
        sanitizedk = [fix_key(k) for k in sanitizedk]
        keys=[f"--souper-crow-cache-inlinek={k}" for k in sanitizedk]
        v=[f"--souper-crow-cache-inlinev={v}" for v in sanitizedv]

        #if RUNTIME_CONFIG["USE_REDIS"]:

        extra_commands += ["--souper-internal-cache","--souper-crow-inline-cache"]
        extra_commands += keys
        extra_commands += v

        #print(extra_commands)
        return super(BCToSouper, self).__call__(extra_commands, std)

    def processInner(self, std, err):
        return std


class ObjtoWASM(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.wasm_ld
        self.name = "LLVM obj to WASM"
        self.debug = debug
        self.timeout = -1

        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs

        linkOptions = config["wasm-ld"]["wasi-header"] if config["DEFAULT"].getboolean("link-wasi") else "--allow-undefined"
        new_inputs = (config["wasm-ld"]["command"] % (linkOptions, "%s %s" % (args[0], args[1]),)).split(" ")
        
        return super(ObjtoWASM, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        #print(std, err)
        return std


class WASM2WAT(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.wasm2wat
        self.name = "WASM to WAT text"
        self.debug = debug
        self.namespace = namespace
        self.timeout = -1

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = ['-o', args[1], args[0]]
        return super(WASM2WAT, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return std


class WASM2OBJ(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.wasmtime
        self.name = "WASM to native obj"
        self.debug = debug
        self.namespace = namespace
        self.timeout = -1

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = ['wasm2obj',  args[0], args[1]]
        return super(WASM2OBJ, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return std


class OBJ2DUMP(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.dump
        self.name = "OBJ dissasembly"
        self.debug = debug
        self.namespace = namespace
        self.timeout = -1

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = ['-D',  args[0]]
        return super(OBJ2DUMP, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return std



class LLVMSplit(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.llvm_split
        self.name = "llvm-split"
        self.debug = debug
        self.namespace = namespace
        self.timeout = -1
        self.non_explicit = False # exit code different of zero means nothing

    def __call__(self, args=[], std=None):  # f -> inputs

        self.oName = args[1]
        self.count = args[0]
        new_inputs = (config["split"]["options"] % (args[0], args[1], args[2])).split(" ")
        return super(LLVMSplit, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return [ f"{self.oName}{i}" for i in range(self.count) ]

class TextDIFF(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.diff
        self.name = "UNIX diff"
        self.debug = debug
        self.namespace = namespace
        self.timeout = -1
        self.non_explicit = False # exit code different of zero means nothing

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = [args[0],  args[1]]
        return super(TextDIFF, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return std

class LLVMExtract(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.llvm_extract
        self.name = "llvm-extract"
        self.debug = debug
        self.namespace = namespace
        self.timeout = -1
        self.non_explicit = True 
    def __call__(self, args=[], std=None):  # f -> inputs

        self.oName = args[1]
        self.function_name = args[0]

        new_inputs = (config["extract"]["options"] % (args[0], args[1], args[2])).split(" ")
        return super(LLVMExtract, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return self.oName


if __name__ == "__main__":

    K="""%0:i32 = var
    %1:i32 = mulnsw 2:i32, %0
    %2:i32 = addnsw %0, %1
    infer %2
    ; Block ID 1"""
    V="""%0:i32 = var ; in_0_1
    %1:i32 = mul 3:i32, %0
        result %1"""

    c = fix_key(V)
    print(c)