import os
import sys
from subprocess import Popen, PIPE

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
    clang = "%s/souper/third_party/llvm/Release/bin/clang" % (BASE_DIR,)
    opt = "%s/souper/third_party/llvm/Release/bin/opt" % (BASE_DIR,)
    llc = "%s/souper/third_party/llvm/Release/bin/llc" % (BASE_DIR,)
    lli = "%s/souper/third_party/llvm/Release/bin/lli" % (BASE_DIR,)
    llvm_as = "%s/souper/third_party/llvm/Release/bin/llvm-as" % (BASE_DIR,)
    souper = "%s/souper/build/souper" % (BASE_DIR,)
    souper_check = "%s/souper/build/souper-check" % (BASE_DIR,)
    souper2llvm = "%s/souper/build/souper2llvm" % (BASE_DIR,)
    z3 = "%s/souper/third_party/z3/build/z3" % (BASE_DIR,)


class ExternalStage(object):
    def __init__(self):
        self.name = "unknown"
        self.path_to_executable = "unknown"

    def processInner(self, std):
        return b"Ops...Not implemented"

    def __call__(self,args=[], stdin = None): # stdin byte stream

    def __call__(self, std_in=None):
        p = Popen([self.executable] + self.params, stdin=PIPE, stdout=PIPE, stderr=PIPE)
        if std_in is not None:
            p.stdin.write(std_in)

        print("%sStage ->%s %s %s" % (bcolors.OKGREEN, bcolors.ENDC, self.executable, self.name))
        std_out, std_err = p.communicate()

        if p.returncode != 0 or std_err:
            raise Exception("Error on stage: %s. %s" % (self.name, str(std_err)))

        message = self.check()
        print("\t%s%s%s'" % (bcolors.WARNING, message, bcolors.ENDC))

    def check(self):
        # not implemented
        return True


class CToLLStage(ExternalStage):
    def __init__(self, filename):
        super().__init__()
        self.name = "C to LLVM IR"
    
    def __call__(self, args=[], std = None): # f -> inputs
        # in this case inputs is a string
        new_inputs = [ "-O0", "-Xclang", "-disable-O0-optnone", args, "-S", "-emit-llvm", "-o", "-"]

        return super(CToLLStage, self).__call__(new_inputs)

    def processInner(self, std):
        # return the std output LLVM IR
        return std

class LLToMem2RegLL(ExternalStage):
    def __init__(self, filename):
        super().__init__()
        self.name = "LLVM IR to -mem2reg optimized LLVM IR"
        self.executable = Alias.opt
        self.params = [
            "-mem2reg",
            filename + ".ll",
            "-S",
            "-o",
            filename + ".mem2reg.ll"
        ]

    def check(self):
        # Saving the ll file
        # original_llvm = ll.decode("utf-8")
        # sanitize ?
        return True

    def __call__(self, args=[], std = None): # f -> inputs
        # opt -mem2reg ${name}.ll -S -o ${name}.ll

        new_inputs = [ "-mem2reg", "-", "-S", "-o", "-"]

        return super(LLToMem2RegLL, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std

class LLToBC(ExternalStage):

class Mem2RegLLToBC(ExternalStage):
    def __init__(self, filename):
        super().__init__()
        self.name = "LLVM IR to LLVM bitcode"

    def __call__(self, args = [], std = None): # f -> inputs
        # llvm-as ${name}.ll -o ${name}.bc

        new_inputs = [ "-", "-o", "-"]

        return super(LLToBC, self).__call__(new_inputs, std)

    def processInner(self, std):
        # return the std output optimized LLVM IR
        return std


class BCToSouper(ExternalStage):
    def __init__(self, filename):
        super().__init__()
        self.name = "LLVM IR to LLVM bitcode"
        

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


class Pipeline(object):
    def process(self, file):
        
        ctoll = CToLLStage()
        ll1 = ctoll(file)

        lltoll = LLToMem2RegLL()
        ll2 = lltoll(std=ll1)

        # Saving the ll file
        self.original_llvm = ll2.decode("utf-8")
        # sanitize ?

        lltobc = LLToBC()
        bc = lltobc(std=ll2)

        bctocand = BCToSouper()
        cand = bctocand(std=bc)

        #Saving candidate
        self.candidates = cand.decode("utf-8")
        # Report if no candidates

        # map candidates to original code llvm ?

        candtosols = CandidatesToSouperParts()
        sols = candtosols(std=cand)

        # Map solutions to original optimization candidate

        # Generate LLVM IR for solution

        # Generate Overall LLVM IR output


if __name__ == "__main__":
    pipeline = Pipeline()
    pipeline(sys.argv[1])
