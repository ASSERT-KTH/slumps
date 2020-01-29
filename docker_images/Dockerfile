# slumps backend
FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -y install cmake re2c doxygen golang-go python python3 llvm git subversion curl build-essential lld-9 gcc-multilib redis-server emscripten \
    && go get github.com/gomodule/redigo/redis

RUN mkdir slumps
WORKDIR slumps

# Rebuild on KTH repo update
ADD https://api.github.com/repos/KTH/binaryen/git/refs/heads/master version.json
ADD https://api.github.com/repos/KTH/souper/git/refs/heads/master version.json

RUN git clone https://github.com/KTH/souper \
    && git clone https://github.com/WebAssembly/wabt

RUN cd wabt \
    && git submodule update --init \
    && mkdir build && cd build \
    && cmake .. \
    && cmake --build .

RUN cd souper \
    && bash ./build_deps.sh

RUN cd souper \
    && mkdir build && cd build \
    && cmake ../ \
    && make -j8
