#!/bin/bash

# Download wabt releases

shopt -s expand_aliases
alias clang='../../souper/third_party/llvm/Release/bin/clang'
alias llc='../../souper/third_party/llvm/Release/bin/llc'
alias lli='../../souper/third_party/llvm/Release/bin/lli'
alias llvm-as='../../souper/third_party/llvm/Release/bin/llvm-as'
alias souper='../../souper/build/souper'
alias souper-check='../../souper/build/souper-check'
alias souper2llvm='../../souper/build/souper2llvm'
alias libsouperPass.so='../../souper/build/libsouperPass.so'


clang -Xclang -load -Xclang ../../souper/build/libsouperPass.so -mllvm -z3-path=z3  -S -emit-llvm  $1 -o $1.ll