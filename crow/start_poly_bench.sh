#!/bin/bash
# rm -rf /slumps/crow/out
bin_folders=/slumps/souper/third_party/llvm-Release-install/bin
export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2-build:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
export PATH=$bin_folders:$PATH
export PATH=/inputs:$PATH
export PATH=/slumps/souper/third_party/z3-install/bin:$PATH

mkdir -p /usr/src/souper/third_party
cp -r /slumps/souper/third_party/z3-install /usr/src/souper/third_party
ls /usr/src/souper/third_party/z3-install
chmod +x /usr/src/souper/third_party/z3-install/bin/z3

ls /slumps/souper/third_party
ls /slumps/souper/third_party/z3-build
ls /slumps/souper/third_party/z3-install
ls /slumps/souper/third_party/z3
ls /slumps/souper/build

echo "Building polybench object"

$bin_folders/clang -c --target=wasm32-unknown-wasi --sysroot=/tmp/wasi-libc /inputs/polybench.c || 1

PORTS=''

for port in $(seq 1 1 20)
do
	nohup redis-server --port $((6379 + $port)) &
	PORTS=$PORTS","$((6379 + $port))
done

echo "Opening redis servers in" $PORTS
# launch x redis servers

python3.8 crow.py $PORTS $@