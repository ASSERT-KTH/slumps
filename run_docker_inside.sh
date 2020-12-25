#! /bin/bash

PROGRAM=$2


SOURCE=$(dirname $(realpath $BASH_SOURCE))
PROGRAM_DIR=$(dirname $(realpath $PROGRAM))
PROGRAM_NAME=$(basename $(realpath $PROGRAM))



docker run -it --rm -v $PROGRAM_DIR:/inputs -v $(pwd)/crow/crow:/slumps/crow/crow -v $(pwd)/crow/headers/polybench:/slumps/headers/polybench  -v $(pwd)/crow_out:/slumps/crow/out  -v $(pwd)/logs:/slumps/crow/logs  --entrypoint /bin/bash slumps/crow:latest

rm $(pwd)/crow_out/CROW_TMP-*