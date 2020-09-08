#!/bin/bash
# rm -rf /slumps/crow/out
SOURCE=$(dirname $BASH_SOURCE)

bin_folders=/slumps/souper/third_party/llvm-Release-install/bin
export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2-build:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
export PATH=$bin_folders:$PATH
export PATH=/inputs:$PATH
export PATH=/slumps/souper/third_party/z3-install/bin:$PATH

mkdir -p /usr/src/souper/third_party
cp -r /slumps/souper/third_party/z3-install /usr/src/souper/third_party
ls /usr/src/souper/third_party/z3-install
chmod +x /usr/src/souper/third_party/z3-install/bin/z3

echo "Building polybench object"

$bin_folders/clang -c --target=wasm32-unknown-wasi --sysroot=/tmp/wasi-libc /inputs/polybench.c || 1

PORTS=''

for port in $(seq 1 1 $1)
do
	nohup redis-server --port $((15535 + $port)) &
	PORTS=$PORTS","$((15535 + $port))
done

echo "Opening redis servers in" $PORTS
# launch x redis servers

python3.8 $SOURCE/crow/crow/crow.py $PORTS $@