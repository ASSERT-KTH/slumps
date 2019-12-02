from subprocess import Popen, PIPE
from utils import bcolors, DEBUG_FILE, Alias, BASE_DIR
from logger import LOGGER

import sys, os

class ExternalStage(object):
    
    def __init__(self):
        self.name = "unknown"
        self.path_to_executable = "unknown"
        self.debug = True

    def processInner(self, std):
        return b"Ops...Not implemented"

    def __call__(self,args=[], stdin = None): # stdin byte stream

        p = Popen([self.path_to_executable] + args, stdout=PIPE, stderr=PIPE, stdin=PIPE)
        

        if stdin is not None:
            p.stdin.write(stdin)

        if self.debug:
            LOGGER.success("Stage -> %s"%(self.name, ))

        std,err = p.communicate()

        rc = p.returncode

        if rc != 0:
            LOGGER.error(err.decode("utf-8"))
            raise Exception("Error on stage: %s"%(self.name,))

        # Specific implementation process over the std out
        res = self.processInner(std)

        if self.debug:
            LOGGER.debug("============================= Stage -> %s\n\n"%(self.name, ), res)
        
        # print("\t%s%s%s'"%(bcolors.WARNING, res, bcolors.ENDC))

        return res

class CToLLStage(ExternalStage):


    def __init__(self):
        self.path_to_executable = Alias.clang
        self.name = "C to LLVM IR"
        self.debug = True

    
    def __call__(self, args=[], std = None): # f -> inputs
        # in this case inputs is a string

        # Including sources for compilation

        sources = os.path.dirname(os.path.abspath(Alias.clang))
        sources = os.path.dirname(sources)
        sources = os.path.join(sources, "include/c++/v1")

        sys.path.append(sources)

        # -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1 -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/include

        # Load from external file
        
        new_inputs = ["-I%s"%(sources,)]
        new_inputs += [ "-O0", "--target=wasm32-unknown-unknown" , "-Xclang", "-disable-O0-optnone", args, "-S",  "-emit-llvm", "-o", "-"]

        return super(CToLLStage, self).__call__(new_inputs)

    def processInner(self, std):
        # return the std output LLVM IR
        return std

class LLToMem2RegLL(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.opt
        self.name = "LLVM IR to -mem2reg optimized LLVM IR"
        self.debug = True


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
        self.debug = True


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
        self.debug = True

        

    def __call__(self, args = [], std = None): # f -> inputs
        #    souper -z3-path=${z3} ${name}.bc > ${name}.candopt

        new_inputs = ["-souper-enumerative-synthesis", "-souper-enumerative-synthesis-num-instructions=2",  "-"]

        return super(BCToSouper, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR

        # Process the candidates, raise error if none and interrupt the pipeline

        
        return std


class CandidatesToSouperParts(ExternalStage):

    def __init__(self, MAX_INST = 1):
        self.path_to_executable = Alias.souper_check
        self.name = "Souper candidates to LHS and RHS"
        self.MAX_INST = MAX_INST
        self.debug = True

        

    def __call__(self, args = [], std = None): # f -> inputs
        #    souper-check -z3-path=${z3} -print-replacement-split ${name}.candopt > ${name}.opt

        # -souper-infer-iN -print-replacement-split -souper-infer-inst -souper-external-cache
        # -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
        # souper-enumerative-synthesis-ignore-cost
        new_inputs = [ "-z3-path", Alias.z3, "-infer-rhs", "-souper-enumerative-synthesis", "-souper-enumerative-synthesis-num-instructions=%s"%(self.MAX_INST,), "-"]

        return super(CandidatesToSouperParts, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std



class SouperToLLVM(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.souper2llvm
        self.name = "Souper IR result to LLVM IR"
        self.debug = True

        


    def __call__(self, args = [], std = None): # f -> inputs
        #   souper2llvm ${name}.rhsopt > ${name}.ll2
        return super(SouperToLLVM, self).__call__([], std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std




class LLVMCompile(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.llvm_as
        self.name = "LLVM IR to BC"
        self.debug = True

        


    def __call__(self, args = [], std = None): # f -> inputs

        new_inputs = [ "-", '-o', '-']
        return super(LLVMCompile, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std


class LLVMTOWasm(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.llc
        self.name = "LLVM IR to Object"
        self.debug = True

        


    def __call__(self, args = [], std = None): # f -> inputs

        new_inputs = ["-march=wasm32", "-filetype=obj", "-O0", "-", '-o', '-']
        return super(LLVMTOWasm, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std


class ObjtoWASM(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.wasm_ld
        self.name = "LLVM obj to WASM"
        self.debug = True

        


    def __call__(self, args = [], std = None): # f -> inputs

        new_inputs = ["--no-entry", "--export-all","-O0", "--allow-undefined",  '-o', args[1], args[0]]
        return super(ObjtoWASM, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std


class WASM2WAT(ExternalStage):

    def __init__(self):
        self.path_to_executable = Alias.wasm2wat
        self.name = "WASM to WAT text"
        self.debug = True

        


    def __call__(self, args = [], std = None): # f -> inputs

        new_inputs = ['-o', args[1], args[0]]
        return super(WASM2WAT, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std