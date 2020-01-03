#!/bin/bash

name=$(echo $1 | sed 's/\.[^.]*$//')
ext=$(echo $1 | sed 's/^.*\.//')

# alias
shopt -s expand_aliases
alias clang='~/souper/third_party/llvm/Release/bin/clang'
alias llc='~/souper/third_party/llvm/Release/bin/llc'
alias llvm-as='~/souper/third_party/llvm/Release/bin/llvm-as'
alias opt='~/souper/third_party/llvm/Release/bin/opt'
alias souper='~/souper/build/souper'
alias souper-check='~/souper/build/souper-check'
alias wasm2c='~/wabt/bin/wasm2c'
alias wasm2wat='~/wabt/bin/wasm2wat'
alias wasm-ld='/usr/bin/wasm-ld-8'

# vars
z3=${SRC_DIR}'/souper/third_party/z3/build/z3'
libsouperPass=${SRC_DIR}'/souper/build/libsouperPass.so'

RED='\033[0;31m'
NC='\033[0m' # No Color


if [ "${ext}" == "c" ]; then
  clang --target=wasm32-unknown-unknown -O3 $1 -S -emit-llvm -o  $name.ll
  llvm-as -o $name.bc $name.ll 
fi

$WASM_LD --no-entry --export-all --allow-undefined -o $name.wasm $name.bc # $name.orig.obj
wasm2wat -o $name.wat $name.wasm

#llvm-as $name.reg.ll -o $name.bc
printf "${RED}Souperifying...${NC}\n"

# "-souper-enumerative-synthesis", "-souper-enumerative-synthesis-num-instructions=%s"%(self.MAX_INST,) souper-infer-inst
# -souper-infer-inst -souper-synthesis-comps=add,const
llvm-opt -load ${libsouperPass}  -souper -souper-enumerative-synthesis -souper-infer-inst -souper-use-alive -souper-synthesis-const-with-cegis -souper-synthesis-comps=add,const,and,or,lshr,eq,ne  -z3-path=${z3} -souper-debug-level=2 -o $name.opt.bc $name.bc

printf "${RED}Souper pass finished${NC}\n"

$WASM_LD --no-entry --export-all -O0 --allow-undefined -o $name.opt.wasm $name.opt.bc
wasm2wat -o $name.opt.wat $name.opt.wasm

echo $(wc -c "$name.wat" | awk '{print $1}') $(wc -c "$name.opt.wat" | awk '{print $1}')
