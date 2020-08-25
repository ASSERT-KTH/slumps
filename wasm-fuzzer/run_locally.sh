currentID=$$

echo "wafl ID $currentID"

export DOCKER_INTERFACE_SRC=$(pwd)/wafl
export DOCKER_AFL_INPUT=$DOCKER_INTERFACE_SRC/in-$currentID

export SWAM_SOCKET_PORT=9999
export SWAM_SOCKET_HOST=0.0.0.0
export DOCKER_AFL_OUTPUT=out-$currentID

export REQUIRED_BYTES=4

export WASM_ARG_TYPES_LIST=Int32 # Read from signature retriever
export WASM_ARG_LIST=11 # Read from signature retriever, maybe none

export DOCKER_LOGS=$DOCKER_INTERFACE_SRC/out

export DUMMY_TESTING_AFL=False


export AFL="$(pwd)/aflpp/afl-fuzz"
export LOCAL_AFL="True"
export WASI_FILTER="True"
export WASI=True
export WITH_TIMEOUT="True"
export TIMEOUT=60 # 60 seconds

mkdir -p $DOCKER_AFL_INPUT

## Replace env variables
set -a
source .env
set +x

if [[ $1 == *.wat ]]; then WAT_ARG="--wat"; fi
if [[ $WASI == "True" ]]; then WASI_ARG="--wasi"; fi
if [[ $WASI_FILTER == "True" ]]; then WASI_ARG="$WASI_ARG -r"; fi
if [[ $WITH_TIMEOUT == "True" ]]; then TIMEOUT="timeout --foreground $TIMEOUT"; fi

echo "Running Swam"

mkdir -p $DOCKER_INTERFACE_SRC/logs-$currentID

java -jar fuzzing-server-swam/out/cli/assembly/dest/out.jar run_server $1 --main $2 --argType Int32 $WASI_ARG 1> $DOCKER_INTERFACE_SRC/logs-$currentID/swam.std.txt 2> $DOCKER_INTERFACE_SRC/logs-$currentID/swam.err.txt &

swamPid=$!

sleep 2
echo "Running AFL fuzzing client"

$TIMEOUT bash fuzzing-client-afl/entrypoint_afl.sh 

pkill -f $swamPid
echo "Killing swam server pid $swamPid"
