#!/bin/bash

docker build -t wafl .

yes | docker system prune

set -a
source ./.env
set +a

docker run -d --env-file=./.env \
    -e STAGING=True \
    --name=staging_wafl \
    -v maven_data:/root/.cache/coursier/v1/https/repo1.maven.org/maven2 \
    -v compiled_sources:/home/server/src/out/ \
    -v ${PWD}/sample-testing-targets:/home/server/wasm/ \
    -v ${PWD}/wafl-temp/afl-out:/home/client/out/ \
    -v ${PWD}/wafl-temp/logs:/home/shared/logs/ \
    wafl:latest \
    branches2.wasm a 11

sleep 30s

CONTAINER_STATUS=$(docker container inspect -f '{{.State.Status}}' staging_wafl)
echo "CONTAINER_STATUS: $CONTAINER_STATUS"

if [ $CONTAINER_STATUS != "running" ]; then
    echo "staging_wafl container is not running anymore. It must have crashed."
    exit 1
else
    echo "staging_wafl container is still running. Nice!"
    docker stop staging_wafl
    exit 0
fi
