#!/bin/bash

cd $DOCKER_INTERFACE_SRC

PREPARED_INPUT_PATH="$DOCKER_AFL_INPUT/prepared_input.dat"
./prepare_wasm_input.out $PREPARED_INPUT_PATH

# TODO: Remove everything related to REQUIRED_BYTES
REQUIRED_BYTES=$(./getFileSize.out $PREPARED_INPUT_PATH)

# Parallel fuzzing: https://github.com/mirrorer/afl/blob/master/docs/parallel_fuzzing.txt
if [[ ! -z "$MASTER_AFL_NODE" ]]; then
    DOCKER_CONTAINER_ID=$(</etc/hostname)
    if [[ $MASTER_AFL_NODE == "True" ]]; then
        RANK="-M $DOCKER_CONTAINER_ID"
    elif [[ $MASTER_AFL_NODE == "False" ]]; then
        RANK="-S $DOCKER_CONTAINER_ID"
    fi
fi

# AFL Docs on re-starting:
# If you need to stop and re-start the fuzzing, use the same command line
# options (or even change them by selecting a different power schedule
# or another mutation mode!) and switch the input directory with a
# dash (-): afl-fuzz -i - -o output -- bin/target -d @@

# Check if AFL has already produced results
if ! [ "$(ls -A $DOCKER_AFL_OUTPUT)" ]; then
    echo "$DOCKER_AFL_OUTPUT is empty - starting fresh run!"
elif [ $REUSE_DATA_AFL ]; then
    echo "$DOCKER_AFL_OUTPUT is not empty & REUSE_DATA_AFL=$REUSE_DATA_AFL, so continuing where we left off!"
    DOCKER_AFL_INPUT="-"
else
    echo "$DOCKER_AFL_OUTPUT is not empty & REUSE_DATA_AFL=$REUSE_DATA_AFL, so deleting old data!"
fi

./wait_for_server.out

if [ $? != 0 ]; then
    exit 1
fi

# AFL Docs:
# afl-fuzz starts by performing an array of deterministic fuzzing steps,
# which can take several days, but tend to produce neat test cases.
# If you want quick & dirty results right away - akin to zzuf and other
# traditional fuzzers - add the -d option to the command line.

echo "afl-fuzz -i $DOCKER_AFL_INPUT -o $DOCKER_AFL_OUTPUT $RANK -d -- ${DOCKER_INTERFACE_SRC}/interface.out @@ $REQUIRED_BYTES"
exec afl-fuzz -i $DOCKER_AFL_INPUT -o $DOCKER_AFL_OUTPUT $RANK -d -- "${DOCKER_INTERFACE_SRC}/interface.out" @@ $REQUIRED_BYTES
