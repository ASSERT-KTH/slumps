
bin_folders=/slumps/souper/third_party/llvm-Release-install/bin
libFolder=/slumps/souper/build

export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2-build:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH

export PATH=$bin_folders:$PATH
export PATH=/inputs:$PATH
export PATH=/slumps/souper/third_party/z3-install/bin:$PATH
export PATH=$PATH:$libFolder
mkdir -p /usr/src/souper/third_party
ls /slumps/souper/third_party/z3-install
chmod +x /usr/src/souper/third_party/z3-install/bin/z3


pkill -f wasm2obj
pkill -f objdump

sleep 1
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

WORKERS_WASM2OBJ=$1
WORKERS_OBJDUMP=$2
shift 2

printf "$NC Updating settings $NC"
python3 -m crow.update_settings $@
printf "$GREEN Starting system $NC\n"

for i in $(seq 1 $WORKERS_WASM2OBJ)
do
  printf "$GREEN Launching WASM 2 NATIVE OBJ $NC\n"
  python3 -m crow.experiments.wasm2obj &
done


for i in $(seq 1 $WORKERS_OBJDUMP)
do
  printf "$GREEN Launching NATIVE OBJ DUMPING $NC\n"
  python3 -m crow.experiments.objdump &
done

control_c() {
    pkill -f wasm2obj
    pkill -f objdump
    exit
}

trap control_c SIGINT

wait