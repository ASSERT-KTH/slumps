#!/bin/bash

# pass script os as the first argument
python3 utils/compile_and_verify/compile_and_verify.py $1 benchmark_programs &&

git add .

git commit -m "Compiling and validating all wast files in the benchmark folder "