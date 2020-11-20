WASMS_DIR=$1

echo "CHECKSUMS" > check.txt
echo "SUCCESS $f" > success.txt
mkdir -p logs
for f in $WASMS_DIR/*.wasm
do

	m51=$(md5sum $f | awk '{print $1}' )

	name="$(basename -- $f)"
	echo $name $f $m51
	./decoder.out "$f" "$name.wakoko.wasm"
    
	if [ -f "test.wasm" ]; then

		wasm2wat --enable-all $name.wakoko.wasm -o t.wat -v > logs/"$name.logs.txt"
		wasm-validate --enable-all  $name.wakoko.wasm

		rm t.wat
		rm $name.wakoko.wasm
	else
		echo "$f failed to parse" >> check.txt
		break 1
	fi

done