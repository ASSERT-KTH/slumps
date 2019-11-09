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
        self.executable = "unknown"
        self.params = None

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
        self.executable = Alias.clang
        self.params = [
            "-O0",
            "-Xclang",
            "-disable-O0-optnone",
            "-S",
            "-emit-llvm",
            filename + ".c",
            "-o",
            filename + ".ll"
        ]


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


class Mem2RegLLToBC(ExternalStage):
    def __init__(self, filename):
        super().__init__()
        self.name = "LLVM IR to LLVM bitcode"
        self.executable = Alias.llvm_as
        self.params = [
            filename + ".mem2reg.ll",
            "-o",
            filename + ".bc"
        ]


class BCToSouper(ExternalStage):
    def __init__(self, filename):
        super().__init__()
        self.name = "LLVM IR to LLVM bitcode"
        self.executable = Alias.souper
        self.params = [
            "-z3-path",
            Alias.z3,
            filename + ".bc",
            ">",
            filename + ".cand.opt"
        ]


class SouperToCandidates(ExternalStage):
    def __init__(self, filename):
        super().__init__()
        self.name = "Souper candidates to LHS and RHS"
        self.executable = Alias.souper_check
        self.params = [
            "-z3-path",
            Alias.z3,
            "-print-replacement-split",
            filename + ".cand.opt",
            ">",
            filename + ".opt"
        ]

    def check(self):
        # Saving candidate
        # self.candidates = cand.decode("utf-8")
        # Report if no candidates
        return True


class CandidatesToLHS(ExternalStage):
    def __init__(self, filename):
        super().__init__()
        self.name = "from Candidates to LHS"
        self.executable = "cat"
        self.params = [
            filename + ".opt",
            "|",
            "sed",
            "'/^result/d'",
            ">",
            filename + ".lhs.opt"
        ]

    def check(self):
        # candtosols = CandidatesToSouperParts()
        # sols = candtosols(std_in=cand)
        return True


class LHSToRHS(ExternalStage):
    def __init__(self, filename):
        super().__init__()
        self.name = "from LHS to RHS"
        self.executable = Alias.souper_check
        self.params = [
            "-z3-path",
            Alias.z3,
            "-infer-rhs",
            "-souper-infer-iN",
            filename + ".lhs.opt",
            ">",
            filename + ".rhs.opt"
        ]


class Pipeline(object):
    def __call__(self, file):
        filename = "infer"
        CToLLStage(filename)()
        LLToMem2RegLL(filename)()
        Mem2RegLLToBC(filename)()
        BCToSouper(filename)()
        SouperToCandidates(filename)()
        CandidatesToLHS(filename)()
        LHSToRHS(filename)()

        # map candidates to original code llvm ?
        # Map solutions to original optimization candidate?
        # Generate LLVM IR for solution?
        # Generate Overall LLVM IR output?


if __name__ == "__main__":
    pipeline = Pipeline()
    pipeline(sys.argv[1])
