#! /bin/bash

SOURCE=$(dirname $BASH_SOURCE)

echo $SOURCE

docker run -it --rm -v $(pwd):/inputs -v $SOURCE/crow:/slumps/crow -v $(pwd)/crow_out:/slumps/crow/out  -v $(pwd)/logs:/slumps/crow/logs --entrypoint /bin/bash jacarte/slumps:crow ./start_docker_no_wget.sh /inputs/$1 
