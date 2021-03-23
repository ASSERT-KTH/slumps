which python

export PATH=$(pwd)/crow:$PATH


control_c() {
    echo "Killing all"
    pkill -f manager
    pkill -f logger
    pkill -f bc2candidates
    pkill -f bc2wasm
    pkill -f wasm2wat
    pkill -f fromll
    pkill -f variantcreator
    pkill -f redis-server
    pkill -f opt
    pkill -f dashboard


    if [[ $1 == "exit" ]]
    then
      exit 0
    fi
}

control_c

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

printf "$NC Updating settings $NC"
python3 -m crow.update_settings $@
printf "$GREEN Starting system $NC\n"

printf "$GREEN Launching storage service $NC\n"
printf "$GREEN Collect the generated files at crow/storage/out $NC\n"
redis-server --port 1010 2>/dev/null 1>/dev/null &
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


printf "$GREEN Launching dashboard $NC\n"
python3 -m crow.monitor.dashboard localhost 1010 0 "" crow/storage/out &

for i in $(seq 1 3) # Increase the number of variant creators
do
  printf "$GREEN Variant generator $i $NC\n"
  redis-server --port 909$i 2>/dev/null 1>/dev/null &
  python3 -m crow.entrypoints.variantcreator "909$i" &
done

trap control_c "exit" SIGINT

wait