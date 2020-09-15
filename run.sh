#! /bin/bash
#pkill -f redis-server
redis-server &

SOURCE=$(dirname $BASH_SOURCE)

mkdir -p crow_out

echo $SOURCE
export DYLD_LIBRARY_PATH=$SOURCE/souper/third_party/z3-install/lib

MAX=$1
PORTS=''

for port in $(seq 1 $MAX)
do
	redis-server --port $((15535 + $port)) &
	PORTS=$PORTS","$((15535 + $port))
done

echo "Opening redis servers in" $PORTS

python3.7 $SOURCE/crow/crow/crow.py $PORTS %DEFAULT.outfolder $(pwd)/crow_out $@
pkill -f redis-server
pkill -f libsouperPass