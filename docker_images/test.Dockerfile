# slumps backend
FROM ubuntu:18.04
# souper:deps

RUN apt-get update \
    && apt-get -y install tree  cmake re2c doxygen golang-go python python3 llvm git subversion curl build-essential gcc-multilib redis-server \
    && go get github.com/gomodule/redigo/redis && rm -rf /var/lib/apt/lists/*

RUN mkdir slumps
WORKDIR slumps


