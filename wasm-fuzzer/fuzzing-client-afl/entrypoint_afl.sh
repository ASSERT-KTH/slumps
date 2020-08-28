#!/bin/bash

cd $SRC_INTERFACE_DIR

$OUT_INTERFACE_DIR/prepare_wasm_input.out "$INPUT_AFL_DIR/prepared_input.dat"

# TODO: Remove everything related to REQUIRED_BYTES
REQUIRED_BYTES=$($OUT_INTERFACE_DIR/getFileSize.out $INPUT_AFL_DIR/prepared_input.dat)

# Parallel fuzzing: https://github.com/mirrorer/afl/blob/master/docs/parallel_fuzzing.txt
# TODO: Refactor this to work in non-Docker environment as well
if [[ ! -z "$MASTER_AFL_NODE" ]]
then
    DOCKER_CONTAINER_ID=$(</etc/hostname)
    if [[ $MASTER_AFL_NODE == "True" ]]
    then
        RANK="-M $DOCKER_CONTAINER_ID"
    elif [[ $MASTER_AFL_NODE == "False" ]]
    then
        RANK="-S $DOCKER_CONTAINER_ID"
    fi
fi

# AFL Docs on re-starting:
# If you need to stop and re-start the fuzzing, use the same command line
# options (or even change them by selecting a different power schedule
# or another mutation mode!) and switch the input directory with a
# dash (-): afl-fuzz -i - -o output -- bin/target -d @@

# Check if AFL has already produced results
if ! [ "$(ls -A $OUTPUT_AFL_DIR)" ]; then
    echo "$OUTPUT_AFL_DIR is empty - starting fresh run!"
elif [ $REUSE_DATA_AFL ]; then
    echo "$OUTPUT_AFL_DIR is not empty & REUSE_DATA_AFL=$REUSE_DATA_AFL, so continuing where we left off!"
    INPUT_AFL_DIR="-"
else
    echo "$OUTPUT_AFL_DIR is not empty & REUSE_DATA_AFL=$REUSE_DATA_AFL, so deleting old data!"
fi

$OUT_INTERFACE_DIR/wait_for_server.out

if [ $? != 0 ]; then
    exit 1
fi

if ! [[ $BIN_AFL ]]; then
    BIN_AFL='afl-fuzz'
fi

# AFL Docs:
# afl-fuzz starts by performing an array of deterministic fuzzing steps,
# which can take several days, but tend to produce neat test cases.
# If you want quick & dirty results right away - akin to zzuf and other
# traditional fuzzers - add the -d option to the command line.


echo "$BIN_AFL -i $INPUT_AFL_DIR -o $OUTPUT_AFL_DIR $RANK -d -- ${OUT_INTERFACE_DIR}/interface.out @@ $REQUIRED_BYTES"
exec $BIN_AFL -i "$INPUT_AFL_DIR" -o $OUTPUT_AFL_DIR $RANK -d -- "${OUT_INTERFACE_DIR}/interface.out" @@ $REQUIRED_BYTES
