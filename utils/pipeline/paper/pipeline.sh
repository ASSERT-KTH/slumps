#!/bin/bash

name=$(echo $1 | sed 's/\.[^.]*$//')
ext=$(echo $1 | sed 's/^.*\.//')

shopt -s expand_aliases
alias clang='../../souper/third_party/llvm/Release/bin/clang'
alias llc='../../souper/third_party/llvm/Release/bin/llc'
alias lli='../../souper/third_party/llvm/Release/bin/lli'
alias llvm-as='../../souper/third_party/llvm/Release/bin/llvm-as'
alias opt='../../souper/third_party/llvm/Release/bin/opt'
alias souper='../../souper/build/souper'
alias souper-check='../../souper/build/souper-check'
alias souper2llvm='../../souper/build/souper2llvm'
alias libsouperPass.so='../../souper/build/libsouperPass.so'

z3='../../souper/third_party/z3/build/z3'

if [ "${ext}" == "c" ]; then
  echo "### step c2ll \c"
  clang -O0 -Xclang -disable-O0-optnone -S -emit-llvm ${name}.c -o ${name}.ll 
  ext='ll'
  echo "okay"
fi

if [ "${ext}" == "rs" ]; then
  echo "### step rs2ll \c"
  rustc --emit=llvm-ir ${name}.rs -o ${name}.ll
  ext='ll'
  echo "okay"
fi

if [ "${ext}" == "ll" ]; then
  echo "### step ll2bc \c"
  opt -mem2reg ${name}.ll -S -o ${name}.ll
  echo "### ll2bc \c"  
  llvm-as ${name}.ll -o ${name}.bc
  ext='bc'
  echo "okay"
fi


if [ "${ext}" == "bc" ]; then
  echo "### step bc optimization candidates \c"
  souper -z3-path=${z3} ${name}.bc --souper-infer-inst -souper-synthesis-comps=add,sub,and,xor,shl,ashr,lshr,const,const --souper-exploit-blockpcs > ${name}.candopt
  ext='candopt'
  echo "okay" 
fi

if [ "${ext}" == "candopt" ]; then
  echo "### step optimization candidates to LHS/RHS optimization step \c"
  souper-check -z3-path=${z3} -print-replacement-split ${name}.candopt > ${name}.opt
  ext='opt' # This file contains both LHS and RHS solution
  echo "okay"
fi

<<END
if [ "${ext}" == "opt" ]; then
  echo "### step separating LHS and RHS from opt file \c"
  # This command expect LHS, remove "result" instruction from it
  cat ${name}.opt | sed '/^result/d' > ${name}.lhsopt
  souper-check -z3-path=${z3} -infer-rhs -souper-infer-iN ${name}.lhsopt > ${name}.rhsopt
  ext='rhsopt' # save rhs but keep working with the other one
  echo "okay"
fi

if [ "${ext}" == "rhsopt" ]; then
  echo "### step rhsopt->ll2 \c"
  # python souper2llvm.py ${name}.rhsopt > ${name}.ll2
  souper2llvm ${name}.rhsopt > ${name}.ll2
  ext='ll2'
  echo "okay"
fi

if [ "${ext}" == "ll2" ]; then
  echo "### step ll2->bc2 \c"
  llvm-as ${name}.ll2 -o ${name}.bc2
  # llc -filetype=obj ${name}.bc2 -o ${name}.o2 # lli ${name}.o2
  # llc -march=wasm32 -filetype=asm ${name}.ll2 -o ${name}.s2
  # llc -march=wasm32 -filetype=obj ${name}.ll2 -o ${name}.o2
  ext='bc2'
  echo "okay"
fi
END
