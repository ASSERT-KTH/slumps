#!/bin/bash
rm -rf /slumps/src/out
wget https://raw.githubusercontent.com/KTH/slumps/master/benchmark_programs/rossetta/valid/no_input/$1
nohup redis-server &
python3.7 slumps.py $1