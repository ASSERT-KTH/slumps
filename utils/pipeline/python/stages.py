# -*- coding: utf-8 -*-

from subprocess import Popen, PIPE
from utils import bcolors, DEBUG_FILE, Alias, config
from logger import LOGGER
import re

import sys, os


class ExternalStage(object):

    def __init__(self):
        self.name = "unknown"
        self.path_to_executable = "unknown"
        self.debug = True

    def processInner(self, std, err):
        return b"Ops...Not implemented"

    def __call__(self, args=[], stdin=None):  # stdin byte stream

        args = list(filter(lambda x: x != "", args))
        p = Popen([self.path_to_executable] + args, stdout=PIPE, stderr=PIPE, stdin=PIPE)

        if stdin is not None:
            p.stdin.write(stdin)

        if self.debug:
            LOGGER.success("Stage -> %s" % (self.name,))
            LOGGER.info(" ".join([self.path_to_executable] + args))
        std, err = p.communicate()

        rc = p.returncode

        if rc != 0:
            LOGGER.error(err.decode("utf-8"))
            raise Exception("Error on stage: %s" % (self.name,))

        # Specific implementation process over the std out
        res = self.processInner(std, err)

        if self.debug:
            LOGGER.debug("============================= Stage -> %s\n\n" % (self.name,), res)
            LOGGER.debug("stderr \n\n %s \n\n" % (err.decode("utf-8"),))

        # print("\t%s%s%s'"%(bcolors.WARNING, res, bcolors.ENDC))

        return res


class CToLLStage(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.clang
        self.name = "C to LLVM IR"
        self.debug = True

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = (config["clang"]["command"] % (args,)).split(" ")
        return super(CToLLStage, self).__call__(new_inputs)

    def processInner(self, std, err):
        return std

class LLToBC(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.llvm_as
        self.name = "LLVM IR to LLVM bitcode"
        self.debug = True

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = (config["llvm-as"]["command"] % "- -o -").split(" ")
        return super(LLToBC, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        return std


class BCCountCandidates(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.opt
        self.name = "LLVM BC to Souper IR candidates"
        self.debug = True

    def __call__(self, args=[], std=None):  # f -> inputs
        extra_commands = "%s -o %s" % (args[0], args[0])

        new_inputs = (config["souper"]["list-candidates"] % extra_commands).split(" ")
        return super(BCCountCandidates, self).__call__(new_inputs, std)

    def processInner(self, std, err):

        meta = re.compile(r'\[(\d+)/(\d+)\]')
        match = meta.match(err.decode("utf-8"))
        return [int(match.group(1)), int(match.group(2))]


class BCToSouper(ExternalStage):

    def __init__(self, candidates=[]):
        self.path_to_executable = Alias.opt
        self.name = "LLVM BC supertoptimization pass"
        self.debug = True
        self.candidates = candidates

    def __call__(self, args=[], std=None):  # f -> inputs

        extra_commands = "-souper-subset=%s %s -o %s" % (",".join(map(lambda x: x.__str__(), self.candidates)), args[0], args[1])
        new_inputs = (config["souper"]["super-opt-pass"] % extra_commands).split(" ")
        return super(BCToSouper, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        return std


class ObjtoWASM(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.wasm_ld
        self.name = "LLVM obj to WASM"
        self.debug = True

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = (config["wasm-ld"]["command"] % ("%s %s" % (args[1], args[0]),)).split(" ")
        return super(ObjtoWASM, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return std


class WASM2WAT(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.wasm2wat
        self.name = "WASM to WAT text"
        self.debug = True

    def __call__(self, args=[], std=None):  # f -> inputs

        new_inputs = ['-o', args[1], args[0]]
        return super(WASM2WAT, self).__call__(new_inputs, std)

    def processInner(self, std, err):
        # return the std output optimized LLVM IR
        return std
