
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

pkill -f bc2wasm
pkill -f wasm2wat
pkill -f fromll


sleep 1
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

printf "$NC Updating settings $NC"
python3 -m crow.update_settings $@
printf "$GREEN Starting system $NC\n"


printf "$GREEN Launching wasm to wat service $NC\n"
python3 -m crow.entrypoints.wasm2wat &

printf "$GREEN Launching bitcode to wasm service $NC\n"
python3 -m crow.entrypoints.bc2wasm &


printf "$GREEN Launching from ll2bc service $NC\n"
python3 -m crow.entrypoints.fromll &



control_c() {
    pkill -f bc2wasm
    pkill -f wasm2wat
    pkill -f fromll
    exit
}

trap control_c SIGINT

wait