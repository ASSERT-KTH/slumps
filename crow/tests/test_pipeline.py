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

    result = ctoll("%s/benchmarks/babbage_problem.c" %
                   (BASEDIR, ))  # Send llvm IR to std

    open("%s/results/babbage_problem.ll" % (BASEDIR,), 'wb').write(result)


def test_lltobc():
    # Receive a LLVM IR in the std
    lltobc = stages.LLToBC("test")

    result = lltobc(std=open("%s/results/babbage_problem.ll" %
                             (BASEDIR,), 'rb').read())  # Send llvm IR to std

    open("%s/results/babbage_problem.bc" % (BASEDIR,), 'wb').write(result)


def test_bctoSouperCandidates():
    # Receive a LLVM IR in the std
    bctoSouper = stages.BCCountCandidates("test")
    content = open("%s/results/babbage_problem.bc" % (BASEDIR,), 'rb').read()

    bctoSouper(args=["%s/results/babbage_problem.bc" % (BASEDIR,)],
               std=None)  # Send llvm IR to std

    # open("%s/results/babbage_problem.opt.bc"%(BASEDIR,), 'wb').write(opt)


def test_BCSouperPass():
    # Receive a LLVM IR in the std
    bctoSouper = stages.BCToSouper("test", candidates=[1, 3])
    content = open("%s/results/babbage_problem.bc" % (BASEDIR,), 'rb').read()

    bctoSouper(args=["%s/results/babbage_problem.bc" % (BASEDIR,),
                     "%s/results/babbage_problem.opt.bc" % (BASEDIR,)], std=None)  # Send llvm IR to std

    # open("%s/results/babbage_problem.opt.bc"%(BASEDIR,), 'wb').write(opt)


def test_bctoWasm():
    # Receive a LLVM IR in the std
    bt2wasm = stages.ObjtoWASM("test")

    bt2wasm(args=["%s/results/babbage_problem.wasm" % (BASEDIR,),
                  "%s/results/babbage_problem.bc" % (BASEDIR,)])  # Send llvm IR to std


def test_WASM2WAT():
    # Receive a LLVM IR in the std
    wasm2wat = stages.WASM2WAT("test")

    wasm2wat(args=["%s/results/babbage_problem.wasm" % (BASEDIR,),
                   "%s/results/babbage_problem.wat" % (BASEDIR,)])  # Send llvm IR to std



def test_pipeline():
    # Receive a LLVM IR in the std
    utils.RUNTIME_CONFIG["USE_REDIS"] = False
    utils.config["DEFAULT"]["candidates-threshold"] = "1"
    utils.config["DEFAULT"]["timeout"] = "100"

    import slumps
    slumps.main("%s/benchmarks/babbage_problem.c" % (BASEDIR, ))


def test_pipeline2():
    # Receive a LLVM IR in the std
    utils.RUNTIME_CONFIG["USE_REDIS"] = False
    utils.config["DEFAULT"]["candidates-threshold"] = "1"
    utils.config["DEFAULT"]["timeout"] = "3600"

    import slumps
    slumps.main("%s/benchmarks/nautic.c" % (BASEDIR, ))


def test_multi_thread():
    # Receive a LLVM IR in the std
    utils.config["DEFAULT"]["candidates-threshold"] = "1"
    utils.config["DEFAULT"]["timeout"] = "1"

    import slumps
    slumps.main("%s/multi" % BASEDIR)

