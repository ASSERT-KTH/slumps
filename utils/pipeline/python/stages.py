from subprocess import Popen, PIPE
from .utils import bcolors, DEBUG_FILE, Alias

class ExternalStage(object):
    
    def __init__(self):
        self.name = "unknown"
        self.path_to_executable = "unknown"

    def processInner(self, std):
        return b"Ops...Not implemented"

    def __call__(self,args=[], stdin = None): # stdin byte stream

        p = Popen([self.path_to_executable] + args, stdout=PIPE, stderr=PIPE, stdin=PIPE)
        

        if stdin is not None:
            p.stdin.write(stdin)

        print("%sStage -> %s %s"%(bcolors.OKGREEN, bcolors.ENDC, self.name))
        std,err = p.communicate()

        rc = p.returncode

        if rc != 0 or err:
            raise Exception("Error on stage: %s. %s"%(self.name, str(err)))

        # Specific implementation process over the std out
        res = self.processInner(std)

        DEBUG_FILE.write(("\n%s ================================================\n\n"%(self.name,)).encode("utf-8"))
        DEBUG_FILE.write(res)
        # print("\t%s%s%s'"%(bcolors.WARNING, res, bcolors.ENDC))

        return res

class CToLLStage(ExternalStage):


    def __init__(self):
        self.path_to_executable = Alias.clang
        self.name = "C to LLVM IR"
    
    def __call__(self, args=[], std = None): # f -> inputs
        # in this case inputs is a string
        new_inputs = [ "-O0", "-Xclang", "-disable-O0-optnone", args, "-S", "-emit-llvm", "-o", "-"]

        return super(CToLLStage, self).__call__(new_inputs)

    def processInner(self, std):
        # return the std output LLVM IR
        return std

class LLToMem2RegLL(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.opt
        self.name = "LLVM IR to -mem2reg optimized LLVM IR"

    def __call__(self, args=[], std = None): # f -> inputs
        # opt -mem2reg ${name}.ll -S -o ${name}.ll

        new_inputs = [ "-mem2reg", "-", "-S", "-o", "-"]

        return super(LLToMem2RegLL, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std

class LLToBC(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.llvm_as
        self.name = "LLVM IR to LLVM bitcode"

    def __call__(self, args = [], std = None): # f -> inputs
        # llvm-as ${name}.ll -o ${name}.bc

        new_inputs = [ "-", "-o", "-"]

        return super(LLToBC, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std


class BCToSouper(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.souper
        self.name = "LLVM BC to Souper IR candidates"
        

    def __call__(self, args = [], std = None): # f -> inputs
        #    souper -z3-path=${z3} ${name}.bc > ${name}.candopt

        new_inputs = [ "-z3-path", Alias.z3, "-"]

        return super(BCToSouper, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR

        # Process the candidates, raise error if none and interrupt the pipeline

        return std


class CandidatesToSouperParts(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.souper_check
        self.name = "Souper candidates to LHS and RHS"
        

    def __call__(self, args = [], std = None): # f -> inputs
        #    souper-check -z3-path=${z3} -print-replacement-split ${name}.candopt > ${name}.opt

        new_inputs = [ "-z3-path", Alias.z3, "-print-replacement-split", "-"]

        return super(CandidatesToSouperParts, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std



class SouperToLLVM(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.souper2llvm
        self.name = "Souper IR result to LLVM IR"
        


    def __call__(self, args = [], std = None): # f -> inputs
        #   souper2llvm ${name}.rhsopt > ${name}.ll2
        return super(SouperToLLVM, self).__call__([], std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std
