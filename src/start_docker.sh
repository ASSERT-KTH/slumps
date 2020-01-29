#!/bin/bash
nohup redis-server &
python3 slumps.py /input