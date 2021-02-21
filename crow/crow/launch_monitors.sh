source setup.sh

pkill -f logger
pkill -f monitor

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

printf "$NC Updating settings $NC"
python3 update_settings.py $@
printf "$GREEN Starting system $NC\n"


printf "$GREEN Launching logging service $NC\n"
python3 monitor/logger.py &

printf "$GREEN Launching monitor service $NC\n"
python3 monitor/monitor.py &


control_c() {
    pkill -f manager.py
    pkill -f logger.py
    pkill -f bc2candidates.py
    pkill -f bc2wasm.py
    pkill -f wasm2wat.py
    pkill -f fromll.py
    pkill -f variantcreator.py
    pkill -f redis-server
    exit
}

trap control_c SIGINT

wait