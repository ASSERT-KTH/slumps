import argparse
import subprocess
import os

BASE_DIR = os.path.dirname(
    os.path.dirname(
        os.path.dirname(
            os.path.dirname(
                os.path.abspath(__file__)))))


class Alias:
    
    clang = "%s/souper/third_party/llvm/Release/bin/clang"%(BASE_DIR,)
    llc = "%s/souper/third_party/llvm/Release/bin/llc"%(BASE_DIR,)
    lli = "%s/souper/third_party/llvm/Release/bin/lli"%(BASE_DIR,)
    llvm_as = "%s/souper/third_party/llvm/Release/bin/llvm-as"%(BASE_DIR,)
    souper = "%s/souper/build/souper"%(BASE_DIR,)
    souper_check = "%s/souper/build/souper-check"%(BASE_DIR,)
    souper2llvm = "%s/souper/build/souper2llvm"%(BASE_DIR,)
    # libsouperPass_so = "../../souper/build/libsouperPass.so"
    z3 = "%s/souper/third_party/z3/build/z3"%(BASE_DIR,)


class Pipeline:
    def __init__(self, file: str):
        idx = file.find(".")
        self.name = file[:idx]
        self.ext = file[idx + 1:]

    def run(self):
        commands = list()
        # prepare commands
        while True:
            if self.ext == "c":
                self.ext = "ll"
                commands.extend([
                    f"{Alias.clang} -S -emit-llvm {self.name}.c -o {self.name}.ll",
                    "echo c2ll okay"
                ])
            elif self.ext == "rs":
                self.ext = "ll"
                commands.extend([
                    f"rustc --emit=llvm-ir {self.name}.rs -o {self.name}.ll",
                    "echo rs2ll okay"
                ])
            elif self.ext == "ll":
                self.ext = "bc"
                commands.extend([
                    f"{Alias.llvm_as} {self.name}.ll -o {self.name}.bc",
                    "echo ll2bc okay"
                ])
            elif self.ext == "bc":
                self.ext = "cand.opt"
                commands.extend([
                    f"{Alias.souper} -z3-path={Alias.z3} {self.name}.bc > {self.name}.cand.opt",
                    "echo bc2cand.opt okay"
                ])
            elif self.ext == "cand.opt":
                self.ext = "lhs.opt"
                commands.extend([
                    f"{Alias.souper_check} -z3-path={Alias.z3} -print-replacement-split {self.name}.cand.opt > {self.name}.opt",
                    f"cat {self.name}.opt | sed \'/^result/d\' > {self.name}.lhs.opt",
                    f"rm {self.name}.opt",
                    "echo cand.opt2lhs.opt okay"
                ])
            elif self.ext == "lhs.opt":
                self.ext = "rhs.opt"
                commands.extend([
                    f"{Alias.souper_check} -z3-path={Alias.z3} -infer-rhs -souper-infer-iN {self.name}.lhs.opt > {self.name}.rhs.opt",
                    "echo lhs.opt2rhs.opt okay"
                ])
            elif self.ext == "rhs.opt":
                self.ext = "new.ll"
                commands.extend([
                    f"{Alias.souper2llvm} {self.name}.rhs.opt > {self.name}.new.ll",
                    "echo rhs.opt2new.ll okay"
                ])
            elif self.ext == "new.ll":
                self.ext = "new.bc"
                commands.extend([
                    f"{Alias.llvm_as} {self.name}.new.ll -o {self.name}.new.bc",
                    "echo new.ll2new.bc okay"
                ])
            else:
                break
        # execute commands
        command = " && ".join(commands)
        subprocess.call(command, shell=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("file", type=str, help="specify file name")
    args = parser.parse_args()
    pipeline = Pipeline(args.file)
    pipeline.run()

    # llc -filetype=obj ${name}.bc -o ${name}.o # lli ${name}.o
    # llc -march=wasm32 -filetype=asm ${name}.ll -o ${name}.s
    # llc -march=wasm32 -filetype=obj ${name}.ll -o ${name}.o
