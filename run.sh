#! /bin/bash

SOURCE=$BASH_SOURCE

docker run -it --rm -v $(pwd):/inputs -v $(pwd)/crow_out:/slumps/crow/out -v $BASH_SOURCE/crow:/slumps/crow -v $(pwd)/logs:/slumps/crow/logs --entrypoint /bin/bash jacarte/slumps:crow ./start_docker_no_wget.sh /inputs/$1 $@
