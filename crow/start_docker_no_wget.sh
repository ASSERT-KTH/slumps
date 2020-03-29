#!/bin/bash
# rm -rf /slumps/crow/out
nohup redis-server &
python3.7 slumps.py $@