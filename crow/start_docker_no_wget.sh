#!/bin/bash
# rm -rf /slumps/crow/out
export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2/build/:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
export PATH=/slumps/souper/third_party/llvm/Release/bin:$PATH
nohup redis-server &
python3.8 slumps.py $@