
PROGRAMS_DIR=$1

ARGS=""

if [[ $TRACE_WASM == 'True' ]]; then
	ARGS=$ARGS" --trace-wasm-interpreter"
fi

if [[ $NO_LIFTOFF == 'True' ]]; then
	ARGS=$ARGS" --no-liftoff"
fi

if [[ $BLOCK_COVERAGE == 'True' ]]; then
	ARGS=$ARGS" --trace-block-coverage"
fi

if [[ $PRINT_CODE == 'True' ]]; then
	ARGS=$ARGS" --print-code"
fi

echo $ARGS
FOLDER_NAME="$(basename -- $PROGRAMS_DIR)"

mkdir -p bytecodes
MACHINE_CODE_ALIGNMENT_FILES=()


WAT_FUNCTIONS=()

concat(){
	ARR=($@)
	LEN=${#ARR[@]}

	R=${ARR[0]}
	

	for i in $(seq 1 $(echo $LEN - 1 | bc -l))
	do
		R="$R , ${ARR[$i]}"
	done

	echo $R
}

COUNT=0
for f in $PROGRAMS_DIR/*.wasm
do
	real_path=$(realpath $f)
	name="$(basename -- $real_path)"
	
	# CONVERT name in wat and filter out WASI FUNCTIONS
	wasm2wat --generate-names -o $real_path.wat $real_path

	if [[ $FILTER_WAT_WASI == 'True' ]]; then
		WAT_FILTERED="$(python3 filter_out_wasi.py $real_path.wat)"
		#echo "$WAT_FILTERED"
		echo "$WAT_FILTERED" > $real_path.wat
	fi

	WAT_FUNCTIONS+=("\"$real_path.wat\"")
	

	COUNT=$(echo $COUNT+1 | bc -l)
	if [[ $COMPARE_V8 == 'False' ]]; then
		echo $real_path $COUNT
		continue
	fi

	cp template.js render.js
	export NAME=$real_path
	perl  -pe  's/WASM_BINARY/$ENV{NAME}/g' -i render.js

	INCLUDE=$( $DEBUG_NODE_BIN --trace-wasm render.js | python3 filter_out_v8_function_index.py)
	echo "Include " $INCLUDE

	$DEBUG_NODE_BIN $ARGS render.js  > bytecodes/$name.bytecode.txt
	#csplit bytecodes/$name.bytecode.txt '/--- WebAssembly code ---/' '{1000}'
	echo -n "" > bytecodes/$name.filtered.bytecode.txt

	awk '/--- WebAssembly code ---/{close(filename);n++; }{}{filename=n".bytecode.split"; print > filename}' bytecodes/$name.bytecode.txt
	
	if [[ $REMOVE_ADDRESS == 'True' ]]; then
		perl -pe 's/0x(\w|\d)+( )+//g' bytecodes/$name.bytecode.txt > bytecodes/$name.no_memory.bytecode.txt # Remove the memory address of the program
	fi
	for i in ./*.bytecode.split
	do

		fidx=$(grep "index:" $i | awk '{print $2}')
		
		if [[ "$INCLUDE" == *" $fidx "* ]]; then
			echo "INCLUDED"
		else
			rm $i
			#echo "BYPASSING $fidx"
			continue
		fi

		if [[ $REMOVE_ADDRESS == 'True' ]]; then
			echo "Removing memory address $i"
			perl -pe 's/0x(\w|\d)+( )+//g' -i $i # Remove the memory address of the program
		fi

		if [[ $REMOVE_BYTECODE_OFFSET == 'True' ]]; then
			echo "Removing bytecode offset $i"
			perl -pe 's/((a|b|c|d|e|f|\d)+( )+){2}//g' -i $i # Remove the instruction offset (first two hex tokens)
		fi

		cat $i >> bytecodes/$name.filtered.bytecode.txt
		echo "" >> bytecodes/$name.filtered.bytecode.txt

		#cat $i

		mv $i bytecodes/$fidx.bytecode.split

	done
	
	#echo "$FILTERED_BYTECODE"
	#$MACHINE_CODE_ALIGNMENT_FILES[$fidx]+=(" \"$(realpath bytecodes/$fidx.bytecode.split.$name.txt)\"")
	MACHINE_CODE_ALIGNMENT_FILES+=(" \"$(realpath bytecodes/$name.filtered.bytecode.txt)\"")

	find bytecodes/ -name "*.bytecode.split" -exec bash -c "mv {} {}.$name.txt" \;
	#break 1
done

#echo ${MACHINE_CODE_ALIGNMENT_FILES[0]}

#: <<'END'

export FILES=$(concat ${MACHINE_CODE_ALIGNMENT_FILES[@]})
cp STRAC_machine_code.template.json STRAC_machine_code.json
perl  -pe  's/FILES/$ENV{FILES}/g' -i STRAC_machine_code.json

STRAC_BIN="/Users/javierca/Documents/IdeaProjects/STRAC/panama/dev/build/macosx-x86_64-server-release/jdk/bin/java -jar /Users/javierca/Documents/IdeaProjects/STRAC/STRACAlign/target/STRAC-align-0.1.jar"
$STRAC_BIN STRAC_machine_code.json

mkdir -p alignments
cp out/alignments.json  alignments/$FOLDER_NAME.bytecode.json


export FILES=$(concat ${WAT_FUNCTIONS[@]})
cp STRAC_machine_code.template.json STRAC_machine_code.json
perl  -pe  's/FILES/$ENV{FILES}/g' -i STRAC_machine_code.json

$STRAC_BIN STRAC_machine_code.json

cp out/alignments.json  alignments/$FOLDER_NAME.wat.json
cp $PROGRAMS_DIR/$FOLDER_NAME.exploration.json alignments/$FOLDER_NAME.exploration.json
# cleaning output folder
rm -rf out

#END