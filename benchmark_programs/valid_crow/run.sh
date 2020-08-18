/slumps/souper/third_party/llvm-Release-install/bin/clang -c -emit-llvm --target=wasm32-unknown-wasi --sysroot=/tmp/wasi-libc $1 -o $1.bc
/slumps/souper/third_party/llvm-Release-install/bin/opt -load /slumps/souper/build/libsouperPass.so -souper -solver-timeout=1 --souper-debug-level=6 $1.bc -o tmp.bc 2> $1.logs
cat $1.logs | grep "For LLVM instruction:" | wc -l