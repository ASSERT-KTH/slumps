#!/bin/bash

# pass script os as the first argument
python3 compile_and_verify $1

git add .

git commit -m "Atutomated compile and validate "