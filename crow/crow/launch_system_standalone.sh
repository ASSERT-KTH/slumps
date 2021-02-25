pkill -f manager.py
pkill -f logger.py
pkill -f bc2candidates.py
pkill -f bc2wasm.py
pkill -f wasm2wat.py
pkill -f fromll.py
pkill -f monitor.py
pkill -f variantcreator.py
pkill -f redis-server

if [[ $RESTART_BROKER == 'True' ]]; then
  docker container rm some-rabbit --force
  docker run -d --hostname my-rabbit --name some-rabbit --restart always -p 5672:5672 -p 8080:15672 rabbitmq:3-management
fi

sleep 1
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

printf "$NC Updating settings $NC"
python3 update_settings.py $@
printf "$GREEN Starting system $NC\n"

printf "$GREEN Launching storage service $NC\n"
python3 storage/manager.py &

printf "$GREEN Launching logging service $NC\n"
python3 monitor/logger.py &

printf "$GREEN Launching monitor service $NC\n"
python3 monitor/monitor.py &

printf "$GREEN Launching wasm to wat service $NC\n"
python3 entrypoints/wasm2wat.py &


printf "$GREEN Launching bitcode to wasm service $NC\n"
python3 entrypoints/bc2wasm.py &


printf "$GREEN Launching bc exploration service $NC\n"
python3 entrypoints/bc2candidates.py &

printf "$GREEN Launching from ll2bc service $NC\n"
python3 entrypoints/fromll.py &


for i in $(seq 1 3) # Increase the number of variant creators
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
    pkill -f monitor.py
    pkill -f variantcreator.py
    pkill -f redis-server
    exit
}

trap control_c SIGINT

wait