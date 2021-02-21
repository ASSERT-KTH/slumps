pkill -f variantcreator.py
pkill -f redis-server

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

printf "$NC Updating settings $NC"
python3 update_settings.py $@
printf "$GREEN Starting system $NC\n"


for i in $(seq 1 $1) # Increase the number of variant creators. Use the first argument in the bash script
do
  printf "$GREEN Variant generator $i $NC\n"
  redis-server --port 909$i 2>/dev/null 1>/dev/null &
  python3 entrypoints/variantcreator.py 909$i &
done

control_c() {
    pkill -f manager.py
    pkill -f logger.py
    pkill -f bc2candidates.py
    pkill -f bc2wasm.py
    pkill -f wasm2wat.py
    pkill -f fromll.py
    pkill -f variantcreator.py
    pkill -f redis-server
    pkill -f monitor.py
    exit
}

trap control_c SIGINT

wait