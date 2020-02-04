#!/bin/bash
rm -rf /slumps/src/out
wget $1
nohup redis-server &
python3.7 slumps.py $1s