# slumps backend
FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -y install cmake re2c doxygen golang-go python python3 llvm git subversion curl build-essential lld-8 gcc-multilib redis-server \
    && go get github.com/gomodule/redigo/redis

RUN mkdir slumps
WORKDIR slumps

# Rebuild on KTH repo update
ADD https://api.github.com/repos/KTH/binaryen/git/refs/heads/master version.json
ADD https://api.github.com/repos/KTH/souper/git/refs/heads/master version.json

RUN git clone https://github.com/KTH/binaryen \
    && git clone https://github.com/KTH/souper \
    && git clone https://github.com/WebAssembly/wabt

RUN cd wabt \
    && git submodule update --init \
    && mkdir build && cd build \
    && cmake .. \
    && cmake --build .

RUN cd binaryen \
    && cmake . \
    && make -j8

RUN cd souper \
    && bash ./build_deps.sh

RUN cd souper \
    && mkdir build && cd build \
    && cmake ../ \
    && make -j8

# Aliases
RUN echo -e '#!/bin/bash\n/slumps/souper/third_party/llvm/Release/bin/clang "$@"' > /usr/bin/clang && chmod +x /usr/bin/clang
RUN echo -e '#!/bin/bash\n/slumps/souper/third_party/llvm/Release/bin/llc "$@"' > /usr/bin/llc && chmod +x /usr/bin/llc
RUN echo -e '#!/bin/bash\n/slumps/souper/third_party/llvm/Release/bin/llvm-as "$@"' > /usr/bin/llvm-as && chmod +x /usr/bin/llvm-as
RUN echo -e '#!/bin/bash\n/slumps/souper/third_party/llvm/Release/bin/opt "$@"' > /usr/bin/opt && chmod +x /usr/bin/opt
RUN echo -e '#!/bin/bash\n/slumps/souper/build/souper "$@"' > /usr/bin/souper && chmod +x /usr/bin/souper
RUN echo -e '#!/bin/bash\n/slumps/souper/build/souper-check "$@"' > /usr/bin/souper-check && chmod +x /usr/bin/souper-check

RUN echo -e '#!/bin/bash\n/slumps/wabt/bin/wasm2wat "$@"' > /usr/bin/wasm2wat && chmod +x /usr/bin/wasm2wat
RUN echo -e '#!/bin/bash\n/slumps/wabt/bin/wasm2c "$@"' > /usr/bin/wasm2c && chmod +x /usr/bin/wasm2c

RUN echo -e '#!/bin/bash\n/usr/bin/wasm-ld-8 "$@"' > /usr/bin/wasm-ld && chmod +x /usr/bin/wasm-ld
