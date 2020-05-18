#!/bin/bash
# rm -rf /slumps/crow/out
nohup redis-server &
wget $1
name=${1##*/}
shift;
python3.7 slumps.py $@ $name

ls -la out  | wc -l