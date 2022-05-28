
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

pkill -f monitor


sleep 1
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

REDIS_HOST=$1
REDIS_PORT=$2
OUT_FOLDER=$3
shift 3

printf "$NC Updating settings $NC"
python3 -m crow.update_settings $@
printf "$GREEN Starting system $NC\n"

printf "$GREEN Launching monitor service $NC\n"
python3 -m crow.monitor.life_status &
sleep 2
python3 -m crow.monitor.dashboard $REDIS_HOST $REDIS_PORT $REDIS_DB $REDIS_PASS $OUT_FOLDER &

control_c() {
    pkill -f dashboard
    exit
}

trap control_c SIGINT

wait