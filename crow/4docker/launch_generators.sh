
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

pkill -f variantcreator


sleep 1
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

printf "$NC Updating settings $NC"
python3 -m crow.update_settings $@
printf "$GREEN Starting system $NC\n"





for i in $(seq 1 $1) # Increase the number of variant creators
do
  printf "$GREEN Variant generator $i $NC\n"
  redis-server --port 90$i 2>/dev/null 1>/dev/null &
  python3 -m crow.entrypoints.variantcreator 90$i &
done

control_c() {
    pkill -f variantcreator
    pkill -f redis-server
    exit
}

trap control_c SIGINT

wait