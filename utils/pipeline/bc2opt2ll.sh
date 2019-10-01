#!/bin/sh

name=$(echo $1 | sed 's/\.[^.]*$//')
# ext=$(echo $1 | sed 's/^.*\.//')
souper=$2

# echo "invoke souper ..."
if [ "$(uname)"=="Darwin" ]; then
	# for macOS
	${souper} ${name}.bc -z3-path=/usr/local/Cellar/z3/4.8.6/bin/z3 > ${name}.candidates
else
	# for ubuntu
	${souper} ${name}.bc -z3-path=/usr/bin/z3 > ${name}.candidates
fi

# echo "handle results ..."
python3 bc2opt2ll.py ${name}.candidates

rm ${name}.candidates
