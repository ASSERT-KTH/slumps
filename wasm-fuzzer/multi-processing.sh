#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source $CURRENT_DIR/logging_lib.sh

NUM_INSTANCES=$1
shift;  # Pop $1 from argument list to pass all arguments "$@" to slumps/wafl:latest

if [ -z "$NUM_INSTANCES" ]; then
    log_error "Specifiy the number of AFL instances as argument!"
    exit 1
fi

log_info "Running $NUM_INSTANCES AFL instance(s)."

set -a
source $CURRENT_DIR/.env
set +a

# Make sure we're starting a fresh test here
rm -R $CURRENT_DIR/wafl-temp

log_info "Running #1"
docker run --env-file=${CURRENT_DIR}/.env \
    -e MASTER_AFL_NODE=True \
    -e WAFL_INSTANCE_ID=1 \
    -v maven_data:/root/.cache/coursier/v1/https/repo1.maven.org/maven2 \
    -v compiled_sources:/home/server/src/out/ \
    -v ${LOCAL_WASM_DIR:?err}:/home/server/wasm/ \
    -v ${CURRENT_DIR}/wafl-temp/afl-out:/home/client/out/ \
    -v ${CURRENT_DIR}/wafl-temp/logs/1:/home/shared/logs/ \
    -d wafl:latest $@

if [ $NUM_INSTANCES -lt 2 ]; then
    exit 0
fi

for i in $(seq 2 $NUM_INSTANCES); do
    log_info "Waiting for previous mill server to compile..."
    sleep 30s
    log_info "Running #${i}"
    docker run --env-file=${CURRENT_DIR}/.env \
        -e MASTER_AFL_NODE=False \
        -e WAFL_INSTANCE_ID=${i} \
        -v maven_data:/root/.cache/coursier/v1/https/repo1.maven.org/maven2 \
        -v compiled_sources:/home/server/src/out/ \
        -v ${LOCAL_WASM_DIR:?err}:/home/server/wasm/ \
        -v ${CURRENT_DIR}/wafl-temp/afl-out:/home/client/out/ \
        -v ${CURRENT_DIR}/wafl-temp/logs/${i}:/home/shared/logs/ \
        -d wafl:latest $@
done
exit 0
