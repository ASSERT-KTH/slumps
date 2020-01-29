#!/bin/bash
nohup redis-server &
python3.7 slumps.py /input