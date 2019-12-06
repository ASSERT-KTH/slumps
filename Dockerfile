# slumps backend
# slumps:back
FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install cmake re2c doxygen golang-go python python3 llvm git subversion curl build-essential lld-8 gcc-multilib
RUN go get github.com/gomodule/redigo/redis

RUN mkdir slumps
WORKDIR slumps


RUN git clone https://github.com/KTH/binaryen
RUN git clone https://github.com/KTH/souper
RUN git clone https://github.com/WebAssembly/wabt

WORKDIR wabt
RUN mkdir build
    RUN git submodule init
    RUN git submodule update
    WORKDIR build
        RUN cmake ..
        RUN cmake --build .
    WORKDIR ..
WORKDIR ..

WORKDIR binaryen
RUN cmake . && make
WORKDIR ..

WORKDIR souper
    RUN bash ./build_deps.sh
    RUN mkdir build
    WORKDIR build
        RUN cmake ../
        RUN make
    WORKDIR ..
WORKDIR .. 

# Aliases


# Aliases

RUN echo -e '#!/bin/bash\n/slumps/souper/third_party/llvm/Release/bin/clang "$@"' > /usr/bin/clang && chmod +x /usr/bin/clang
RUN echo -e '#!/bin/bash\n/slumps/souper/third_party/llvm/Release/bin/llc "$@"' > /usr/bin/llc && chmod +x /usr/bin/llc
RUN echo -e '#!/bin/bash\n/slumps/souper/third_party/llvm/Release/bin/llvm-as "$@"' > /usr/bin/llvm-as && chmod +x /usr/bin/llvm-as
RUN echo -e '#!/bin/bash\n/slumps/souper/third_party/llvm/Release/bin/opt "$@"' > /usr/bin/opt && chmod +x /usr/bin/opt
RUN echo -e '#!/bin/bash\n/slumps/souper/build/souper "$@"' > /usr/bin/souper && chmod +x /usr/bin/souper
RUN echo -e '#!/bin/bash\n/slumps/souper/build/souper-check "$@"' > /usr/bin/souper-check && chmod +x /usr/bin/souper-check

RUN echo -e '#!/bin/bash\n/slumps/wabt/bin/wasm2wat "$@"' > /usr/bin/wasm2wat && chmod +x /usr/bin/wasm2wat
RUN echo -e '#!/bin/bash\n/slumps/wabt/bin/wasm2c "$@"' > /usr/bin/wasm2c && chmod +x /usr/bin/wasm2c
#
RUN echo -e '#!/bin/bash\n/usr/bin/wasm-ld-8 "$@"' > /usr/bin/wasm-ld && chmod +x /usr/bin/wasm-ld


