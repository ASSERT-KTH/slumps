#!/bin/bash

mkdir /slumps/src/out
nohup redis-server &
wget https://raw.githubusercontent.com/KTH/slumps/master/benchmark_programs/rossetta/valid/no_input/$1
python3.7 slumps.py $1