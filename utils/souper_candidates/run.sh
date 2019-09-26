#!/bin/sh

# we use infer.ll as one example
echo "preparing \c"
llvm-as demo/infer.ll -o demo/infer.bc
echo "okay"

# $ /path/to/souper -z3-path=/usr/bin/z3 /path/to/file.bc
echo "souper ... \c"
if [ "$(uname)"=="Darwin" ]; then
	# for macOS
	./souper demo/infer.bc -z3-path=/usr/local/Cellar/z3/4.8.6/bin/z3 > demo/infer.candidates
else
	# for ubuntu
	./souper demo/infer.bc -z3-path=/usr/bin/z3 > demo/infer.candidates
fi
echo "okay"

echo "py ... \c"
python3 split.py demo/infer.candidates
echo "okay"
