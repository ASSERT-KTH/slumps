import argparse
from subprocess import Popen, PIPE
import os
import sys

BASE_DIR = os.path.dirname(
    os.path.dirname(
        os.path.dirname(
            os.path.dirname(
                os.path.abspath(__file__)))))

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
    
    clang = "%s/souper/third_party/llvm/Release/bin/clang"%(BASE_DIR,)
    opt = "%s/souper/third_party/llvm/Release/bin/opt"%(BASE_DIR,)
    llc = "%s/souper/third_party/llvm/Release/bin/llc"%(BASE_DIR,)
    lli = "%s/souper/third_party/llvm/Release/bin/lli"%(BASE_DIR,)
    llvm_as = "%s/souper/third_party/llvm/Release/bin/llvm-as"%(BASE_DIR,)
    souper = "%s/souper/build/souper"%(BASE_DIR,)
    souper_check = "%s/souper/build/souper-check"%(BASE_DIR,)
    souper2llvm = "%s/souper/build/souper2llvm"%(BASE_DIR,)
    # libsouperPass_so = "../../souper/build/libsouperPass.so"
    z3 = "%s/souper/third_party/z3/build/z3"%(BASE_DIR,)

class ExternalStage(object):
    
    def __init__(self):
        self.name = "unknown"
        self.path_to_executable = "unknown"

    def processInner(self, std):
        return b"Ops...Not implemented"

    def do(self,args=[], stdin = None): # stdin byte stream

        p = Popen([self.path_to_executable] + args, stdout=PIPE, stderr=PIPE, stdin=PIPE)
        

        if stdin is not None:
            p.stdin.write(stdin)

        print("%sStage ->%s %s %s"%(bcolors.OKGREEN, bcolors.ENDC, self.path_to_executable, self.name))
        std,err = p.communicate()

        rc = p.returncode

        if rc != 0 or err:
            raise Exception("Error on stage: %s. %s"%(self.name, str(err)))

        # Specific implementation process over the std out
        res = self.processInner(std)

        return res

class CToLLStage(ExternalStage):


    def __init__(self):
        self.path_to_executable = Alias.clang
        self.name = "C to LLVM IR"
    
    def do(self, args=[], std = None): # f -> inputs
        # in this case inputs is a string
        new_inputs = [ "-O0", "-Xclang", "-disable-O0-optnone", args, "-S", "-emit-llvm", "-o", "-"]

        return super(CToLLStage, self).do(new_inputs)

    def processInner(self, std):
        # return the std output LLVM IR
        return std

class LLToMem2RegLL(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.opt
        self.name = "LLVM IR to -mem2reg optimized LLVM IR"

    def do(self, args=[], std = None): # f -> inputs
        # opt -mem2reg ${name}.ll -S -o ${name}.ll

        new_inputs = [ "-mem2reg", "-", "-S", "-o", "-"]

        return super(LLToMem2RegLL, self).do(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std

class LLToBC(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.llvm_as
        self.name = "LLVM IR to LLVM bitcode"

    def do(self, args = [], std = None): # f -> inputs
        # llvm-as ${name}.ll -o ${name}.bc

        new_inputs = [ "-", "-o", "-"]

        return super(LLToBC, self).do(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std


class BCToSouper(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.souper
        self.name = "LLVM IR to LLVM bitcode"
        

    def do(self, args = [], std = None): # f -> inputs
        #    souper -z3-path=${z3} ${name}.bc > ${name}.candopt

        new_inputs = [ "-z3-path", Alias.z3, "-"]

        return super(BCToSouper, self).do(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR

        # Process the candidates, raise error if none and interrupt the pipeline

        return std


class CandidatesToSouperParts(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.souper_check
        self.name = "Souper candidates to LHS and RHS"
        

    def do(self, args = [], std = None): # f -> inputs
        #    souper-check -z3-path=${z3} -print-replacement-split ${name}.candopt > ${name}.opt

        new_inputs = [ "-z3-path", Alias.z3, "-print-replacement-split", "-"]

        return super(CandidatesToSouperParts, self).do(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std

class Pipeline(object):
    pass

if __name__ == "__main__":
    ctoll = CToLLStage()
    lltoll = LLToMem2RegLL()
    lltobc = LLToBC()
    bctocand = BCToSouper()
    candtosols = CandidatesToSouperParts()

    candtosols.do(std=bctocand.do(std=lltobc.do(std=lltoll.do(std=ctoll.do(args=sys.argv[1])))))
