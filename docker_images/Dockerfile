# name jacarte/slumps:backend
FROM slumps/souper:latest as builder
# souper:deps
env DEBIAN_FRONTEND=noninteractive

RUN echo "Installing packages"

RUN apt-get update \
    && apt-get -y install tree  cmake re2c doxygen golang-go python python3 llvm git subversion curl build-essential gcc-multilib redis-server \
    && go get github.com/gomodule/redigo/redis && rm -rf /var/lib/apt/lists/*

RUN mkdir slumps
WORKDIR slumps

# Rebuild on KTH repo update

RUN git clone https://github.com/WebAssembly/wabt

RUN cd wabt \
    && git submodule update --init \
    && mkdir build && cd build \
    && cmake .. \
    && cmake --build . 

run git clone https://github.com/WebAssembly/wasi-libc \
    && cd wasi-libc \
    && make install INSTALL_DIR=/tmp/wasi-libc

FROM ubuntu:20.04

RUN apt-get update \
    && apt-get -y install tree 
    
WORKDIR slumps

COPY --from=builder /slumps/wabt/build/wasm2wat /slumps/wabt/build/wasm2wat
COPY --from=builder /usr/src/souper-build /slumps/souper/build

COPY --from=builder /usr/src/souper/third_party/alive2-build /slumps/souper/third_party/alive2-build
COPY --from=builder /usr/src/souper/third_party/hiredis-install /slumps/souper/third_party/hiredis-install
COPY --from=builder /usr/src/souper/third_party/z3-install/lib /slumps/souper/third_party/z3-install/lib
COPY --from=builder /usr/src/souper/third_party/z3-install/bin /slumps/souper/third_party/z3-install/bin
COPY --from=builder /usr/src/souper/third_party/z3-build/z3 /slumps/souper/third_party/z3-build/z3
# COPY --from=builder /usr/src/souper/third_party/klee /slumps/souper/third_party/klee

COPY --from=builder /usr/src/souper/third_party/llvm-Release-install/lib /slumps/souper/third_party/llvm-Release-install/lib
COPY --from=builder /usr/src/souper/third_party/llvm-Release-install/bin/clang /slumps/souper/third_party/llvm-Release-install/bin/clang
COPY --from=builder /usr/src/souper/third_party/llvm-Release-install/bin/wasm-ld /slumps/souper/third_party/llvm-Release-install/bin/wasm-ld
COPY --from=builder /usr/src/souper/third_party/llvm-Release-install/bin/opt /slumps/souper/third_party/llvm-Release-install/bin/opt
COPY --from=builder /usr/src/souper/third_party/llvm-Release-install/bin/llvm-as /slumps/souper/third_party/llvm-Release-install/bin/llvm-as

COPY --from=builder /tmp/wasi-libc /tmp/wasi-libc


# RUN find / -name "CMakeFiles" -exec echo {} \;
RUN rm -rf /slumps/souper/build/CMakeFiles
RUN rm -rf /slumps/souper/build/docs/CMakeFiles
RUN rm -rf /slumps/souper/third_party/alive2-build/CMakeFiles
RUN tree -h /slumps