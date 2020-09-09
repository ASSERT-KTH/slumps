#! /bin/bash

PROGRAM=$2


SOURCE=$(dirname $(realpath $BASH_SOURCE))
PROGRAM_DIR=$(dirname $(realpath $PROGRAM))
PROGRAM_NAME=$(basename $(realpath $PROGRAM))



docker run -it --rm -v $PROGRAM_DIR:/inputs -v $(pwd)/crow/crow/settings:/slumps/crow/crow/settings -v $(pwd)/crow/crow:/slumps/crow/cro  -v $(pwd)/crow_out:/slumps/crow/out  -v $(pwd)/logs:/slumps/crow/logs  --entrypoint /bin/bash slumps/crow:latest ./start_poly_bench.sh $1 %DEFAULT.timeout 3600 %DEFAULT.exploration-timeout 2000 %souper.workers 30 %DEFAULT.link-wasi False %DEFAULT.outfolder /slumps/crow/out $@ /inputs/$PROGRAM_NAME

