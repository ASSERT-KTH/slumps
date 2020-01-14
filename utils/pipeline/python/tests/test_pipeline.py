
import os
os.chdir("..")

import stages

BASEDIR = os.path.dirname(__file__)

def test_ctoll():
    ctoll = stages.CToLLStage()

    result = ctoll("%s/benchmarks/babbage_problem.c"%(BASEDIR, )) # Send llvm IR to std

    open("%s/results/babbage_problem.ll"%(BASEDIR,), 'wb').write(result)



def test_lltobc():
    # Receive a LLVM IR in the std
    lltobc = stages.LLToBC()

    result = lltobc(std=open("%s/results/babbage_problem.ll"%(BASEDIR,), 'rb').read()) # Send llvm IR to std

    open("%s/results/babbage_problem.bc"%(BASEDIR,), 'wb').write(result)

def test_bctoSouperCandidates():
    # Receive a LLVM IR in the std
    bctoSouper = stages.BCListCandidates()
    content = open("%s/results/babbage_problem.bc"%(BASEDIR,), 'rb').read()

    lhs = bctoSouper( std=content) # Send llvm IR to std

    open("%s/results/babbage_problem.lhs"%(BASEDIR,), 'wb').write(lhs)


def test_bctoWasm():
    # Receive a LLVM IR in the std
    bt2wasm = stages.ObjtoWASM()

    bt2wasm( args=["%s/results/babbage_problem.bc"%(BASEDIR,),
                      "%s/results/babbage_problem.wasm"%(BASEDIR,)]) # Send llvm IR to std



def test_WASM2WAT():
    # Receive a LLVM IR in the std
    wasm2wat = stages.WASM2WAT()

    wasm2wat( args=["%s/results/babbage_problem.wasm"%(BASEDIR,),
                      "%s/results/babbage_problem.wat"%(BASEDIR,)]) # Send llvm IR to std



def test_partial():
    # Receive a LLVM IR in the std
    #lltobc = stages.LLToBC()
    #content = open("%s/benchmarks/babbage_problem.ll" % (BASEDIR,), 'rb').read()

    #bc = lltobc(std=content) # Send llvm IR to std

    #open()

    #bcToCand = stages.BCToSouper()
    #print(bcToCand(std=bc).decode("utf-8"))
    pass