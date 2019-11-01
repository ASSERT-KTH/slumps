#!/bin/bash

name=$(echo $1 | sed 's/\.[^.]*$//')
ext=$(echo $1 | sed 's/^.*\.//')

if [ "${ext}" == "wast" ]; then
  echo "### step wast2wasm \c"
  ../../wabt/bin/wat2wasm ${name}.wast -o ${name}.wasm
  ext='wasm'
  echo "okay"
fi

# wasm2ll / wasm2c / wasm2rs

if [ "${ext}" == "c" ]; then
  echo "### step c2ll \c"
  clang -S -emit-llvm ${name}.c -o ${name}.ll
  ext='ll'
  echo "okay"
fi

if [ "${ext}" == "rs" ]; then
  echo "### step rs2ll \c"
  rustc -S -emit-llvm ${name}.rs -o ${name}.ll
  ext='ll'
  echo "okay"
fi

if [ "${ext}" == "ll" ]; then
  echo "### step ll2bc \c"
  llvm-as ${name}.ll
  ext='bc'
  echo "okay"
fi

if [ "${ext}" == "bc" ]; then
  echo "### step bc2candopt \c"
  ../../souper/build/souper -z3-path=/usr/bin/z3 ${name}.bc > ${name}.candopt
  ext='candopt'
  echo "okay"
fi

# bc2lhsopt / bc2rhsopt / candopt2lhsopt / candopt2rhsopt

if [ "${ext}" == "lhsopt" ]; then
  echo "### step lhsopt2rhsopt \c"
  ../../souper/build/souper-check -z3-path=/usr/bin/z3 -infer-rhs -souper-infer-iN ${name}.lhsopt > ${name}.rhsopt
  ext='rhsopt'
  echo "okay"
fi

if [ "${ext}" == "rhsopt" ]; then
  echo "### step rhsopt2ll \c"
  # python souper2llvm.py ${name}.rhsopt > ${name}.ll
  ../../souper/build/souper2llvm ${name}.rhsopt > ${name}.ll
  ext='ll'
  echo "okay"
fi

if [ "${ext}" == "candopt" ]; then
  echo "### step check candopt \c"
  ../../souper/build/souper-check -z3-path=/usr/bin/z3 ${name}.candopt
  ext='candopt'
  echo "okay"
fi

# echo "### extra ll2s \c"
# llc -march=wasm32 -filetype=asm ${name}.ll
# echo "okay"

# echo "### extra ll2o \c"
# llc -march=wasm32 -filetype=obj ${name}.ll
# echo "okay"

