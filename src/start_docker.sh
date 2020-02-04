#!/bin/bash
rm -rf /slumps/src/out
nohup redis-server &
wget $1
python3.7 slumps.py $2