#!/bin/bash
# rm -rf /slumps/crow/out
export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2-build/:/slumps/souper/build:/slumps/souper/third_party/z3-build::$LD_LIBRARY_PATH
export PATH=/slumps/souper/third_party/llvm/Release/bin:$PATH
export PATH=/inputs:$PATH

MAX=$1
PORTS=''

for port in $(seq 1 1 $MAX)
do
	nohup redis-server --port $((6379 + $port)) &
	PORTS=$PORTS","$((6379 + $port))
done

echo "Opening redis servers in" $PORTS
# launch x redis servers

python3.8 crow.py $PORTS $@