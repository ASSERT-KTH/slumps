# This requires Souper and wabt to be built locally and

import utils
from multiprocessing.pool import Pool
import slumps
import stages
import os
os.chdir("..")


BASEDIR = os.path.dirname(__file__)


def test_ctoll():
    ctoll = stages.CToLLStage("test")
    # Send llvm IR to std
    result = ctoll(f"{BASEDIR}/benchmarks/babbage_problem.c")
    open("%s/results/babbage_problem.ll" % (BASEDIR,), 'wb').write(result)


def test_lltobc():
    # Receive a LLVM IR in the std
    lltobc = stages.LLToBC("test")
    # Send llvm IR to std
    result = lltobc(
        std=open(f"{BASEDIR}/results/babbage_problem.ll", 'rb').read())
    open("%s/results/babbage_problem.bc" % (BASEDIR,), 'wb').write(result)


def test_bctoSouperCandidates():
    # Receive a LLVM IR in the std
    bctoSouper = stages.BCCountCandidates("test")
    content = open(f"{BASEDIR}/results/babbage_problem.bc", 'rb').read()
    bctoSouper(args=["%s/results/babbage_problem.bc" % (BASEDIR,)],
               std=None)  # Send llvm IR to std

    # open("%s/results/babbage_problem.opt.bc"%(BASEDIR,), 'wb').write(opt)


def test_BCSouperPass():
    # Receive a LLVM IR in the std
    bctoSouper = stages.BCToSouper("test", candidates=[1, 3])
    content = open(f"{BASEDIR}/results/babbage_problem.bc", 'rb').read()
    # Send llvm IR to std
    bctoSouper(args=[f"{BASEDIR}/results/babbage_problem.bc",
                     f"{BASEDIR}/results/babbage_problem.opt.bc"], std=None)

    # open("%s/results/babbage_problem.opt.bc"%(BASEDIR,), 'wb').write(opt)


def test_bctoWasm():
    # Receive a LLVM IR in the std
    bt2wasm = stages.ObjtoWASM("test")
    # Send llvm IR to std
    bt2wasm(args=[f"{BASEDIR}/results/babbage_problem.wasm",
                  f"{BASEDIR}/results/babbage_problem.bc"])


def test_WASM2WAT():
    # Receive a LLVM IR in the std
    wasm2wat = stages.WASM2WAT("test")
    # Send llvm IR to std
    wasm2wat(args=[f"{BASEDIR}/results/babbage_problem.wasm",
                   f"{BASEDIR}/results/babbage_problem.wat"])  


def test_pipeline():
    # Receive a LLVM IR in the std
    utils.RUNTIME_CONFIG["USE_REDIS"] = False
    utils.config["DEFAULT"]["candidates-threshold"] = "1"
    utils.config["DEFAULT"]["timeout"] = "100"
    slumps.main(f"{BASEDIR}/benchmarks/babbage_problem.c")


def test_pipeline2():
    # Receive a LLVM IR in the std
    utils.RUNTIME_CONFIG["USE_REDIS"] = False
    utils.config["DEFAULT"]["candidates-threshold"] = "1"
    utils.config["DEFAULT"]["timeout"] = "3600"
    slumps.main(f"{BASEDIR}/benchmarks/nautic.c")


def test_multi_thread():
    # Receive a LLVM IR in the std
    utils.config["DEFAULT"]["candidates-threshold"] = "1"
    utils.config["DEFAULT"]["timeout"] = "1"
    slumps.main(f"{BASEDIR}/multi")
