currentID=$$

echo "wafl ID $currentID"

export DOCKER_INTERFACE_SRC=$(pwd)/wafl
export DOCKER_AFL_INPUT=$DOCKER_INTERFACE_SRC/in-$currentID

export SWAM_SOCKET_PORT=9999
export SWAM_SOCKET_HOST=0.0.0.0
export DOCKER_AFL_OUTPUT=out-$currentID

export REQUIRED_BYTES=4


export DOCKER_LOGS=$DOCKER_INTERFACE_SRC/out

export DUMMY_TESTING_AFL=False


export AFL="$(pwd)/aflpp/afl-fuzz"
export LOCAL_AFL="True"
export WASI_FILTER="True"
export WASI=True
export WITH_TIMEOUT="False"
export INFER_INIT_VALUES="True"
export INIT_VALUES_SEED="0"
export TIMEOUT=60 # 60 seconds

mkdir -p $DOCKER_AFL_INPUT

## Replace env variables
set -a
source .env
set +x

if [[ $1 == *.wat ]]; then WAT_ARG="--wat"; fi
if [[ $WASI == "True" ]]; then WASI_ARG="--wasi"; fi
if [[ $WASI_FILTER == "True" ]]; then WASI_ARG="$WASI_ARG -r"; fi
if [[ $WITH_TIMEOUT == "True" ]]; then TIMEOUT="timeout --foreground $TIMEOUT"; else TIMEOUT=""; fi

echo "Infering signature for wasm"

echo "java -jar fuzzing-server-swam/out/cli/assembly/dest/out.jar infer $WAT_ARG $1 $2"


export WASM_ARG_TYPES_LIST=$(java -jar fuzzing-server-swam/out/cli/assembly/dest/out.jar infer $WAT_ARG $1 $2) # Read from signature retriever

echo "Running Swam"

ALL_ARG_TYPES=""
ALL_ARG_VALUES=""
IFS=',' read -r -a array <<< "$WASM_ARG_TYPES_LIST"
for element in "${array[@]}"
do
    ALL_ARG_TYPES="$ALL_ARG_TYPES --argType $element";
	# TODO init values should be provided

	if [[ $INFER_INIT_VALUES == "True" ]] 
		then
		ALL_ARG_VALUES="$ALL_ARG_VALUES,$INIT_VALUES_SEED"; 
	fi

done
ALL_ARG_VALUES=${ALL_ARG_VALUES:1}
echo "ALL_ARG_TYPES: $ALL_ARG_TYPES"
echo "ALL_ARG_INIT_VALUES: $ALL_ARG_VALUES"

export WASM_ARG_LIST=$ALL_ARG_VALUES

mkdir -p $DOCKER_INTERFACE_SRC/logs-$currentID

pkill -f out.jar
java -jar fuzzing-server-swam/out/cli/assembly/dest/out.jar run_server $1 --main $2 $ALL_ARG_TYPES $WASI_ARG 1> $DOCKER_INTERFACE_SRC/logs-$currentID/swam.std.txt 2> $DOCKER_INTERFACE_SRC/logs-$currentID/swam.err.txt &

swamPid=$!

sleep 2
echo "Running AFL fuzzing client"

$TIMEOUT bash fuzzing-client-afl/entrypoint_afl.sh 

pkill -f $swamPid
echo "Killing swam server pid $swamPid"
