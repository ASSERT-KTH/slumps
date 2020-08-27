#!/bin/bash

if [ -z "$1" ]; then
    echo "Specifiy the number of AFL instances as argument!"
    exit 1
fi

echo "Running $1 AFL instance(s)."

set -a
source ./.env
set +a

mkdir -p $LOCAL_WASM_DIR
mkdir -p $LOCAL_AFL_OUTPUT_DIR
mkdir -p $LOCAL_LOGS_DIR/1

echo "Running #1"
docker run --env-file=./.env \
    -e MASTER_AFL_NODE=True \
    -v maven_data:/root/.cache/coursier/v1/https/repo1.maven.org/maven2 \
    -v compiled_sources:/home/server/src/out/ \
    -v ${LOCAL_WASM_DIR:?err}:/home/server/wasm/ \
    -v ${LOCAL_AFL_OUTPUT_DIR:?err}:/home/client/out/ \
    -v ${LOCAL_LOGS_DIR:?err}/1:/home/shared/logs/ \
    -d slumps/wafl:latest $2 $3 $4

if [ $1 -lt 2 ]; then
    exit 0
fi

for i in $(seq 2 $1); do
    echo "Waiting for previous mill server to compile..."
    sleep 30s
    mkdir -p $LOCAL_LOGS_DIR/${i}
    echo "Running #${i}"
    docker run --env-file=./.env \
        -e MASTER_AFL_NODE=False \
        -v maven_data:/root/.cache/coursier/v1/https/repo1.maven.org/maven2 \
        -v compiled_sources:/home/server/src/out/ \
        -v ${LOCAL_WASM_DIR:?err}:/home/server/wasm/ \
        -v ${LOCAL_AFL_OUTPUT_DIR:?err}:/home/client/out/ \
        -v ${LOCAL_LOGS_DIR:?err}/${i}:/home/shared/logs/ \
        -d slumps/wafl:latest $2 $3 $4
done
exit 0
