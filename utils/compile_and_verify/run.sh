#!/bin/bash

# pass script os as the first argument
python3 utils/compile_and_verify/compile_and_verify.py $1 &&

git add .

git commit -m "Automated compile and validate "