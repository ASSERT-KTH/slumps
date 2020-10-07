#! /bin/bash

PROGRAM=$2


SOURCE=$(dirname $(realpath $BASH_SOURCE))
PROGRAM_DIR=$(dirname $(realpath $PROGRAM))
PROGRAM_NAME=$(basename $(realpath $PROGRAM))



docker run -it --rm -v $PROGRAM_DIR:/inputs -v $(pwd)/crow/crow:/slumps/crow/crow -v $(pwd)/crow/headers/polybench:/slumps/headers/polybench  -v $(pwd)/crow_out:/slumps/crow/out  -v $(pwd)/logs:/slumps/crow/logs  --entrypoint /bin/bash slumps/crow:latest ./start_poly_bench.sh $1 %DEFAULT.timeout 120 %DEFAULT.generate-bc-only False %DEFAULT.exploration-timeout 30 %sanitizer.sanitize-redundant True %sanitizer.sanitize-non-wasm True %souper.workers 30 %DEFAULT.link-wasi True %DEFAULT.outfolder /slumps/crow/out $@ /inputs/$PROGRAM_NAME

rm $(pwd)/crow_out/CROW_TMP-*