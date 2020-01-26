# -*- coding: utf-8 -*-

from subprocess import Popen, PIPE
from utils import bcolors, Alias, config, createTmpFile, RUNTIME_CONFIG
from logger import LOGGER
import re
import time

import sys, os

class CallException(Exception):

    def __init__(self, message, stderr):
        self.stderr = stderr
        self.message = message

class ExternalStage(object):

    def __init__(self, namespace):
        self.name = "unknown"
        self.path_to_executable = "unknown"
        self.debug = True
        self.namespace = namespace

    def processInner(self, std, err):
        return std, err

    def __call__(self, args=[], stdin=None):  # stdin byte stream

        args = list(filter(lambda x: x != "", args))
        p = Popen([self.path_to_executable] + args, stdout=PIPE, stderr=PIPE, stdin=PIPE)

        if stdin is not None:
            p.stdin.write(stdin)

        start = time.time_ns()
        std, err = p.communicate()
        delta = time.time_ns() - start
        #delta = 'not implemented'
        if self.debug:
            LOGGER.success("Stage -> %s (%.2f)" % (self.name, delta))
            LOGGER.info(" ".join([self.path_to_executable] + args))

        rc = p.returncode

        if rc != 0:
            LOGGER.error(err.decode("utf-8"))
            raise CallException("Error on stage: %s" % (self.name,), err)

        # Specific implementation process over the std out
        res = self.processInner(std, err)

        if self.debug:
            LOGGER.debug(self.namespace,"============================= Stage -> %s\n\n" % (self.name,), res)
            LOGGER.debug(self.namespace,"stderr \n\n %s \n\n" % (err.decode("utf-8"),))

        # print("\t%s%s%s'"%(bcolors.WARNING, res, bcolors.ENDC))

        return res


class CCheck(ExternalStage):
    def __init__(self, namespace, debug=False):
        self.path_to_executable  = Alias.clang
        self.name = "C check code"
        self.debug = debug
        self.namespace = namespace


    
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

        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = (config["clang"]["command"] % (args,)).split(" ")
        return super(CToLLStage, self).__call__(new_inputs)

    def processInner(self, std, err):
        return std

class LLToBC(ExternalStage):

    def __init__(self, namespace):
        self.path_to_executable = Alias.llvm_as
        self.name = "LLVM IR to LLVM bitcode"
        self.debug = True

        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = (config["llvm-as"]["command"] % "- -o -").split(" ")
        return super(LLToBC, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        return std


class BCCountCandidates(ExternalStage):

    def __init__(self,namespace, level=1):
        self.path_to_executable = Alias.opt
        self.name = "LLVM BC to Souper IR candidates"
        self.debug = True
        self.level = level

        self.namespace = namespace
    def __call__(self, args=[], std=None):  # f -> inputs
        extra_commands = "%s -o %s" % (args[0], args[0])

        if RUNTIME_CONFIG["USE_REDIS"]:
            extra_commands += " -souper-external-cache"

        new_inputs = (config["souper"]["list-candidates"] % (config["souper"]["souper-level-%s"%self.level],extra_commands)).split(" ")
        return super(BCCountCandidates, self).__call__(new_inputs, std)

    def processInner(self, std, err):

        meta = re.compile(r'\[(\d+)/(\d+)\]')
        match = meta.match(err.decode("utf-8"))
        return [int(match.group(1)), int(match.group(2))]


class BCToSouper(ExternalStage):

    def __init__(self,namespace,candidates=[], debug=False, level=1):
        self.path_to_executable = Alias.opt
        self.name = "LLVM BC supertoptimization pass"
        self.debug = debug
        self.candidates = candidates
        self.level = level

        self.namespace = namespace

    def __call__(self, args=[], std=None):  # f -> inputs

        extra_commands = "-souper-subset=%s %s -o %s" % (",".join(map(lambda x: x.__str__(), self.candidates)), args[0], args[1])

        if RUNTIME_CONFIG["USE_REDIS"]:
            extra_commands += " -souper-external-cache"

        new_inputs = (config["souper"]["super-opt-pass"] % (config["souper"]["souper-level-%s"%self.level],extra_commands)).split(" ")
        return super(BCToSouper, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        return std


class ObjtoWASM(ExternalStage):

    def __init__(self,namespace, debug=True):
        self.path_to_executable = Alias.wasm_ld
        self.name = "LLVM obj to WASM"
        self.debug = debug

        self.namespace = namespace
    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = (config["wasm-ld"]["command"] % ("%s %s" % (args[0], args[1]),)).split(" ")
        return super(ObjtoWASM, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return std


class WASM2WAT(ExternalStage):

    def __init__(self, namespace, debug=True):
        self.path_to_executable = Alias.wasm2wat
        self.name = "WASM to WAT text"
        self.debug = debug
        self.namespace = namespace


    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = ['-o', args[1], args[0]]
        return super(WASM2WAT, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return std
