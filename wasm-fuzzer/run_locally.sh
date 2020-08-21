export DOCKER_INTERFACE_SRC=$(pwd)/wafl
export DOCKER_AFL_INPUT=$(pwd)/wafl/in
export SWAM_SOCKET_PORT=9999
export SWAM_SOCKET_HOST=0.0.0.0

export DOCKER_AFL_OUTPUT=out
export REQUIRED_BYTES=4

export WASM_ARG_TYPES_LIST=Int32
export WASM_ARG_LIST=15
export DOCKER_LOGS=$(pwd)/wafl/out
export DUMMY_TESTING_AFL=False


export AFL="$(pwd)/aflpp/afl-fuzz"
export LOCAL_AFL="True"
export WASI_FILTER="True"
export WASI=True

mkdir -p $DOCKER_AFL_INPUT

set -a
source .env
set +x

if [[ $1 == *.wat ]]; then WAT_ARG="--wat"; fi
if [[ $WASI == "True" ]]; then WASI_ARG="--wasi"; fi
if [[ $WASI_FILTER == "True" ]]; then WASI_ARG="$WASI_ARG -r"; fi

echo "Running Swam"
pkill -f out.jar

mkdir -p $DOCKER_AFL_OUTPUT/logs

java -jar fuzzing-server-swam/out/cli/assembly/dest/out.jar run_server $1 -m $2 --argType Int32 $WASI_ARG 1> $DOCKER_AFL_OUTPUT/logs/swam.std.txt 2> $DOCKER_AFL_OUTPUT/logs/swam.err.txt &

sleep 2
echo "Running AFL fuzzing client"
bash fuzzing-client-afl/entrypoint_afl.sh