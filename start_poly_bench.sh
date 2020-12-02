#!/bin/bash
# rm -rf /slumps/crow/out
SOURCE=$(dirname $BASH_SOURCE)

bin_folders=/slumps/souper/third_party/llvm-Release-install/binexport 
libFolder=/slumps/souper/build

export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2-build:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH

export PATH=$bin_folders:$PATH
export PATH=/inputs:$PATH
export PATH=/slumps/souper/third_party/z3-install/bin:$PATH
export PATH=$PATH:$libFolder
mkdir -p /usr/src/souper/third_party
ls /slumps/souper/third_party/z3-install
chmod +x /usr/src/souper/third_party/z3-install/bin/z3


PORTS=''

for port in $(seq 1 1 $1)
do
	nohup redis-server --port $((15535 + $port)) &
	PORTS=$PORTS","$((15535 + $port))
done

echo "Opening redis servers in" $PORTS
# launch x redis servers

python3.8 $SOURCE/crow/crow/crow.py $PORTS $@