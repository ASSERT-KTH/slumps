#!/bin/bash
# rm -rf /slumps/crow/out
export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2/build/:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
nohup redis-server &
python3 slumps.py $@