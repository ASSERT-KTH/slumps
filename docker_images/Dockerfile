# slumps backend
FROM ubuntu:18.04
# souper:deps

RUN apt-get update \
    && apt-get -y install tree  cmake re2c doxygen golang-go python python3 llvm git subversion curl build-essential gcc-multilib redis-server \
    && go get github.com/gomodule/redigo/redis && rm -rf /var/lib/apt/lists/*

RUN mkdir slumps
WORKDIR slumps

# Rebuild on KTH repo update
ADD https://api.github.com/repos/KTH/souper/git/refs/heads/master version.json

RUN git clone https://github.com/KTH/souper \
    && git clone https://github.com/WebAssembly/wabt

RUN cd wabt \
    && git submodule update --init \
    && mkdir build && cd build \
    && cmake .. \
    && cmake --build . 
RUN cd wabt && find . -mindepth 1 ! -regex '^./build\(/.*\)?' -delete && tree .

RUN cd souper \
    && bash ./build_deps.sh


