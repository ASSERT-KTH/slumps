

#!/bin/bash

name=$(echo $1 | sed 's/\.[^.]*$//')
ext=$(echo $1 | sed 's/^.*\.//')

# alias
shopt -s expand_aliases
alias clang='~/slumps/souper/third_party/llvm/Release/bin/clang'
alias llc='~/slumps/souper/third_party/llvm/Release/bin/llc'
alias llvm-as='~/slumps/souper/third_party/llvm/Release/bin/llvm-as'
alias llvm-opt='~/slumps/souper/third_party/llvm/Release/bin/opt'
alias souper='~/slumps/souper/build/souper'
alias souper-check='~/slumps/souper/build/souper-check'
alias wasm2c='~/slumps/wabt/bin/wasm2c'
alias wasm2wat='~/slumps/wabt/bin/wasm2wat'
alias wasm-ld='/usr/bin/wasm-ld-8'

# vars
z3='/home/slumps/slumps/souper/third_party/z3/build/z3'
libsouperPass='/home/slumps/slumps/souper/build/libsouperPass.so'

RED='\033[0;31m'
NC='\033[0m' # No Color

start=$(date)

if [ "${ext}" == "c" ]; then
  clang --target=wasm32-unknown-unknown -O3 $1 -S -emit-llvm -o  $name.ll ## Replace with large one from emscriptenba
  llvm-as -o $name.bc $name.ll
fi

wasm-ld --no-entry --export-all --allow-undefined -o $name.wasm $name.bc # $name.orig.obj
wasm2wat -o $name.wat $name.wasm

#llvm-as $name.reg.ll -o $name.bc
printf "${RED}Souperifying ${name}...${NC}\n"
  
  if [ "$2" = "1" ]; 
  then
      llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=300 -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc
  fi

  if [ "$2" = "2" ]; 
  then
      llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN=false -souper-infer-inst  -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc
  fi

  if [ "$2" = "3" ]; 
  then
      llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -souper-infer-inst -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc
  fi

  if [ "$2" = "4" ]; 
  then
      llvm-opt -load ${libsouperPass}  -souper  -souper-external-cache  -souper-enumerative-synthesis -souper-infer-inst -souper-use-alive -souper-synthesis-const-with-cegis -solver-timeout=300  -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc 
  fi
  if [ "$2" = "5" ];
  then
      llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne  -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc
  fi

printf "${RED}Souper pass finished${NC}\n"

wasm-ld --no-entry --export-all -O0 --allow-undefined -o $name.opt$2.wasm $name.opt$2.bc
wasm2wat -o $name.opt$2.wat $name.opt$2.wasm

echo $(wc -c "$name.wasm" | awk '{print $1}') $(wc -c "$name.opt$2.wasm" | awk '{print $1}') >> report.$2.txt
printf "\n" >> report.$2.txt

echo $(date) $start