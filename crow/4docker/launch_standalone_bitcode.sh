
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

pkill -f manager
pkill -f logger
pkill -f bc2candidates
pkill -f bc2wasm
pkill -f wasm2wat
pkill -f fromll
pkill -f variantcreator
pkill -f redis-server
pkill -f rabbitmq

# REDIS CACHE SERVER
redis-server --port 9898 &
sleep 2
redis-cli  -p 9898 config set requirepass $REDIS_PASS
# START RABBITMQ SERVER

service rabbitmq-server start || exit 1
sleep 1



rabbitmqctl add_user $BROKER_USER $BROKER_PASS 
rabbitmqctl set_user_tags $BROKER_USER administrator
rabbitmqctl set_permissions -p / $BROKER_USER ".*" ".*" ".*"

rabbitmq-plugins enable rabbitmq_management
chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/

sleep 1
echo "RABBITMQ UP AND RUNNING"

sleep 1
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

ENTRY=$1
shift

printf "$NC Updating settings $NC"
python3 -m crow.update_settings $@
printf "$GREEN Starting system $NC\n"

printf "$GREEN Launching storage service $NC\n"
python3 -m crow.storage.manager &

printf "$GREEN Launching logging service $NC\n"
python3 -m crow.monitor.logger &

printf "$GREEN Launching wasm to wat service $NC\n"
python3 -m crow.entrypoints.wasm2wat &


printf "$GREEN Launching bitcode to wasm service $NC\n"
python3 -m crow.entrypoints.bc2wasm &


printf "$GREEN Launching bc exploration service $NC\n"
python3 -m crow.entrypoints.bc2candidates &

printf "$GREEN Launching from ll2bc service $NC\n"
python3 -m crow.entrypoints.fromll &

printf "$GREEN Launching logging $NC\n"
python3 -m crow.monitor.logger &

printf "$GREEN Launching splitter $NC\n"
python3 -m crow.entrypoints.split &

for i in $(seq 1 2) # Increase the number of variant creators
do
  printf "$GREEN Variant generator $i $NC\n"
  redis-server --port 90$i 2>/dev/null 1>/dev/null &
  python3 -m crow.entrypoints.variantcreator &
done

control_c() {
    pkill -f manager
    pkill -f logger
    pkill -f bc2candidates
    pkill -f bc2wasm
    pkill -f wasm2wat
    pkill -f fromll
    pkill -f variantcreator
    pkill -f redis-server
    exit
}

trap control_c SIGINT

sleep 2
python3 -m crow.entrypoints.bc2wasm $(basename $ENTRY) $ENTRY

wait