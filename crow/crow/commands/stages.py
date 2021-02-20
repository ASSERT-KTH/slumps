# -*- coding: utf-8 -*-

from subprocess import Popen, PIPE
from crow.settings import config
from crow.utils import  Alias, RUNTIME_CONFIG
from crow.monitor.logger import LOGGER
import time


class CallException(Exception):

    def __init__(self, message, stderr):
        self.stderr = stderr
        self.message = message
class TimeoutException(Exception):
    pass

class ExternalStage(object):

    DEBUG_LEVEL = 1

    def __init__(self, namespace):
        self.name = "unknown"
        self.path_to_executable = "unknown"
        self.debug = True
        self.namespace = namespace
        self.timeout = -1
        self.DEBUG_LEVEL = 1

    def processInner(self, std, err):
        return std, err

    def __call__(self, args=[], stdin=None):  # stdin byte stream

        args = list(filter(lambda x: x != "", args))

        if self.DEBUG_LEVEL > 0 and self.timeout > -1:
            LOGGER.info(self.namespace, f"Setting timeout {self.timeout} {self.path_to_executable} ")

        cmd = ["timeout", f"{self.timeout}"] + [self.path_to_executable] if self.timeout > -1 else [self.path_to_executable]
        p = Popen(cmd + args, stdout=PIPE, stderr=PIPE, stdin=PIPE)


        if stdin is not None:
            p.stdin.write(stdin)

        start = time.time()
        std, err = p.communicate()

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

            raise CallException("Error on stage: %s" % (self.name,), err)

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

    def __init__(self, namespace, level=1, souper_workers=4, timeout=-1, socket_port = 5678, socket_host="127.0.0.1"):
        self.path_to_executable = Alias.opt
        self.name = "LLVM BC to Souper IR candidates"
        self.debug = True
        self.level = level
        self.DEBUG_LEVEL = 1
        self.souper_workers = souper_workers
        self.timeout = timeout
        self.socket_port = socket_port
        self.socket_host = socket_host

        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs
        extra_commands = "%s -o %s" % (args[0], args[0])

        

        #if RUNTIME_CONFIG["USE_REDIS"]:
        extra_commands += " --souper-crow-port=%s --souper-crow-workers=%s --souper-crow-host=%s "%(self.socket_port, self.souper_workers, self.socket_host )

        new_inputs = (config["souper"]["list-candidates"] % (
        config["souper"]["souper-level-%s" % self.level], extra_commands)).split(" ")
        return super(BCCountCandidates, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        return std
    



class BCToSouper(ExternalStage):

    def __init__(self, namespace, candidates=[], debug=False, level=1, redisport = 6380, timeout=-1):

        self.path_to_executable = Alias.opt
        self.name = "LLVM BC supertoptimization pass"
        self.debug = debug
        self.candidates = candidates
        self.level = level
        self.redisport = redisport
        self.timeout = timeout



        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs
        extra_commands = "%s -o %s" % (args[0], args[1])

        if RUNTIME_CONFIG["USE_REDIS"]:
            extra_commands += " --souper-external-cache --souper-redis-port=%s"%(self.redisport, )

        new_inputs = (config["souper"]["super-opt-pass"] % ("", extra_commands)).split(" ")
        return super(BCToSouper, self).__call__(new_inputs, std)

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
