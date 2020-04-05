start=`date +%s%N`
wasmtime $@
end=`date +%s%N`
echo Execution time was `expr $end - $start` nanoseconds.