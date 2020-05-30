#!/bin/bash
# rm -rf /slumps/crow/out
nohup redis-server &
export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2/build/:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
wget $1
name=${1##*/}
shift;
python3 slumps.py $@ $name


