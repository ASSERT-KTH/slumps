#!/bin/bash

name=$(echo $1 | sed 's/\.[^.]*$//')
ext=$(echo $1 | sed 's/^.*\.//')

# alias
shopt -s expand_aliases
alias clang='$SRC_DIR/souper/third_party/llvm/Release/bin/clang'
alias llc='$SRC_DIR/souper/third_party/llvm/Release/bin/llc'
alias lli='$SRC_DIR/souper/third_party/llvm/Release/bin/lli'
alias llvm-as='$SRC_DIR/souper/third_party/llvm/Release/bin/llvm-as'
alias opt='$SRC_DIR/souper/third_party/llvm/Release/bin/opt'
alias souper='$SRC_DIR/souper/build/souper'
alias souper-check='$SRC_DIR/souper/build/souper-check'
alias souper2llvm='$SRC_DIR/souper/build/souper2llvm'
alias lld='$SRC_DIR/souper/build/souper2llvm'
alias wasm2wat='$SRC_DIR/wabt/bin/wasm2wat'
alias wasm2c='$SRC_DIR/wabt/bin/wasm2c'

# vars
z3=${SRC_DIR}'/souper/third_party/z3/build/z3'
libsouperPass=${SRC_DIR}'/souper/build/libsouperPass.so'

RED='\033[0;31m'
NC='\033[0m' # No Color

clang --target=wasm32-unknown-unknown -Xclang -disable-O0-optnone $1 -S -emit-llvm -o  $name.ll
printf "${RED}LLVM IR Generated${NC}\n"

opt -mem2reg -S $name.ll -o $name.reg.ll
printf "${RED}LLVM IR -mem2reg${NC}\n"

llc -march=wasm32 -O0 -filetype=obj $name.reg.ll -o  $name.orig.obj
printf "${RED}LLC obj${NC}\n"

$WASM_LD --no-entry --export-all -O0 --allow-undefined -o $name.wasm $name.orig.obj
wasm2wat -o $name.wat $name.wasm

llvm-as $name.reg.ll -o $name.opt.bc
printf "${RED}Souperifying...${NC}\n"
opt -load ${libsouperPass}  -souper -z3-path=${z3} -souper-enumerative-synthesis -souper-debug-level=0 -souper-enumerative-synthesis-num-instructions=2 -o $name.orig.obj $name.opt.bc
printf "${RED}Souper pass finished${NC}\n"

$WASM_LD --no-entry --export-all -O0 --allow-undefined -o $name.opt.wasm $name.opt.bc
wasm2wat -o $name.opt.wat $name.opt.wasm
