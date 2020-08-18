#! /bin/bash

PROGRAM=$1


SOURCE=$(dirname $(realpath $BASH_SOURCE))
PROGRAM_DIR=$(dirname $(realpath $PROGRAM))
PROGRAM_NAME=$(basename $(realpath $PROGRAM))

echo docker run -it --rm -v $PROGRAM_DIR:/inputs -v $SOURCE/crow:/slumps/crow -v $(pwd)/crow_out:/slumps/crow/out  -v $(pwd)/logs:/slumps/crow/logs --entrypoint /bin/bash jacarte/slumps:crow ./start_docker_no_wget.sh /inputs/$PROGRAM_NAME 


docker run --rm -v $PROGRAM_DIR:/inputs -v $(pwd)/crow_out:/slumps/crow/out  -v $(pwd)/logs:/slumps/crow/logs  --entrypoint /bin/bash jacarte/slumps:crow ./start_poly_bench.sh %DEFAULT.timeout 3000 %DEFAULT.outfolder /slumps/crow/out   %DEFAULT.exploration-timeout 1   /inputs/$PROGRAM_NAME
