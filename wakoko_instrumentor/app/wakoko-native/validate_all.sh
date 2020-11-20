WASMS_DIR=$1

echo "CHECKSUMS" > check.txt
echo "SUCCESS $f" > success.txt
mkdir -p logs
for f in $WASMS_DIR/*.wasm
do

	m51=$(md5sum $f | awk '{print $1}' )

	name="$(basename -- $f)"
	echo $name $f $m51
	./decoder.out "$f" $name.wakoko.wasm
    

	if [ -f $name.wakoko.wasm ]; then

		wasm2wat --enable-all $name.wakoko.wasm -o $name.wakoko.wat -v > logs/"$name.logs.txt"

		m52=$(md5sum $name.wakoko.wasm | awk '{print $1}' )


		if [ $m51 != $m52 ]; then
			echo $m51 $m52 >> check.txt
			printf "\t$f not the same checksum\n" >> check.txt

			# getting wasm2wat output

			wasm2wat --enable-all $f -o $f.wat -v > $f.logs
			wasm2wat --enable-all $name.wakoko.wasm -o $name.wakoko.wat -v  2> $name.wakoko.err.logs > $name.wakoko.logs

			wasm-validate --enable-all $name.wakoko.wasm > validation.txt

			DIFF=$(diff $f.logs $name.wakoko.logs)
			ERRORS=$(cat $name.wakoko.err.logs)
			VALIDATION=$(cat validation.txt)
			printf "\t\n\nERROR: $ERRORS\n" >> check.txt
			printf "\t\n\VALIDATION: $VALIDATION\n" >> check.txt
			printf "\t\n\n$DIFF\n" >> check.txt
			
			cp $f.wat  logs/$name.orig.wat 
			cp $name.wakoko.wat logs/$name.wakoko.wat

			rm *.wat *.logs

			#exit 1
 
		else
			echo "SUCCESS $f" >> success.txt
		fi


		rm $name.wakoko.wat
		rm $name.wakoko.wasm
	else
		echo "$f failed to parse" >> check.txt
		exit 1
	fi

done