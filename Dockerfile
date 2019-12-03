# slumps backend
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

