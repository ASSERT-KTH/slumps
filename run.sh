#! /bin/bash
redis-server &

SOURCE=$(dirname $BASH_SOURCE)

echo $SOURCE
export DYLD_LIBRARY_PATH=$SOURCE/souper/third_party/z3-install/lib

MAX=$1
=''

for port in $(seq 1 1 $MAX)
do
	redis-server --port $((6790 + $port)) &
	PORTS=$PORTS","$((6790 + $port))
done

echo "Opening redis servers in" $PORTS

python3.7 $SOURCE/crow/crow/crow.py $PORTS $@
