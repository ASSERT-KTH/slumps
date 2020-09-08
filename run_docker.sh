#! /bin/bash

PROGRAM=$2


SOURCE=$(dirname $(realpath $BASH_SOURCE))
PROGRAM_DIR=$(dirname $(realpath $PROGRAM))
PROGRAM_NAME=$(basename $(realpath $PROGRAM))



docker run -it --rm -v $PROGRAM_DIR:/inputs -v $(pwd)/crow/crow/settings:/slumps/crow/settings  -v $(pwd)/crow_out:/slumps/crow/out  -v $(pwd)/logs:/slumps/crow/logs  --entrypoint /bin/bash slumps/crow:latest ./start_poly_bench.sh $1 %DEFAULT.timeout 3600 %DEFAULT.exploration-timeout 30 %souper.workers 10 %DEFAULT.link-wasi False %DEFAULT.outfolder /slumps/crow/out $@ /inputs/$PROGRAM_NAME



#docker run -it --rm -v $PROGRAM_DIR:/inputs -v $(pwd)/crow/crow/settings:/slumps/crow/settings  -v $(pwd)/crow_out:/slumps/crow/out  -v $(pwd)/logs:/slumps/crow/logs  --entrypoint /bin/bash jacarte/slumps:crow ./start_poly_bench.sh %DEFAULT.timeout 86400 %souper.souper-common --solver-timeout=1600 %DEFAULT.link-wasi False %DEFAULT.outfolder /slumps/crow/out $@ /inputs/$PROGRAM_NAME