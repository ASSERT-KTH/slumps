#!/bin/bash

# Download wabt releases
<<END
if [ ! -d "../../souper/build/souper" ]; then
  cd ../../souper
  if [ ! -d "./third_party" ]; then
    ./build_deps.sh $buildtype $extra_cmake_flags
  fi

  mkdir build
  cd build
  echo "Building..."
  cmake  ../
  make
  cd ../../utils/pipeline
fi
END

name=$(echo $1 | sed 's/\.[^.]*$//')
ext=$(echo $1 | sed 's/^.*\.//')

if [ "${ext}" == "c" ]; then
  echo "### step c2ll \c"
  clang -S -emit-llvm ${name}.c -o ${name}.ll
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
  llvm-as ${name}.ll -o ${name}.bc
  # llc -filetype=obj ${name}.bc -o ${name}.o # lli ${name}.o
  # llc -march=wasm32 -filetype=asm ${name}.ll -o ${name}.s
  # llc -march=wasm32 -filetype=obj ${name}.ll -o ${name}.o
  ext='bc'
  echo "okay"
fi

if [ "${ext}" == "bc" ]; then
  echo "### step bc optimization candidates \c"
  ../../souper/build/souper -z3-path='../../souper/third_party/z3/build/z3'  ${name}.bc > ${name}.candopt
  ext='candopt'
  echo "okay"
fi

if [ "${ext}" == "candopt" ]; then
  echo "### step optimization candidates to LHS/RHS optimization step \c"
  ../../souper/build/souper-check -z3-path='../../souper/third_party/z3/build/z3' -print-replacement-split ${name}.candopt > ${name}.opt
  ext='opt' # This file contains both LHS and RHS solution
  echo "okay"
fi

if [ "${ext}" == "opt" ]; then
  echo "### step separating LHS and RHS from opt file \c"
  # This command expect LHS, remove "result" instruction from it
  cat ${name}.opt | sed '/^result/d' > ${name}.lhsopt
  ../../souper/build/souper-check -z3-path='../../souper/third_party/z3/build/z3' -infer-rhs -souper-infer-iN ${name}.lhsopt > ${name}.rhsopt
  ext='rhsopt' # save rhs but keep working with the other one
  echo "okay"
fi

if [ "${ext}" == "rhsopt" ]; then
  echo "### step rhsopt->ll2 \c"
  # python souper2llvm.py ${name}.rhsopt > ${name}.ll2
  ../../souper/build/souper2llvm ${name}.rhsopt > ${name}.ll2
  ext='ll2'
  echo "okay"
fi

if [ "${ext}" == "ll2" ]; then
  echo "### step ll2->bc2 \c"
  llvm-as ${name}.ll -o ${name}.bc2
  # llc -filetype=obj ${name}.bc2 -o ${name}.o2 # lli ${name}.o2
  # llc -march=wasm32 -filetype=asm ${name}.ll2 -o ${name}.s2
  # llc -march=wasm32 -filetype=obj ${name}.ll2 -o ${name}.o2
  ext='bc2'
  echo "okay"
fi

