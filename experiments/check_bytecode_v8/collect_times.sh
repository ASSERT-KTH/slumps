
PROGRAMS_DIR=$1

FOLDER_NAME="$(basename -- $PROGRAMS_DIR)"

mkdir -p "times"
TIMES=50
WARM_UP=10

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
echo $PROGRAMS_DIR


TIMES_FILE="times/$FOLDER_NAME.txt"
echo -n "" > $TIMES_FILE
for f in $PROGRAMS_DIR/*.wasm
do

	echo $f

	real_path=$(realpath $f)
	name="$(basename -- $real_path)"
	echo -n $name >> $TIMES_FILE


	cp template.time.js timer.js
	export NAME=$real_path
	perl  -pe  's/WASM_BINARY/$ENV{NAME}/g' -i timer.js 

	for i in $(seq 1 $WARM_UP)
	do
		A=$($DEBUG_NODE_BIN timer.js /dev/null)
	done

	for i in $(seq 1 $TIMES)
	do
		$DEBUG_NODE_BIN timer.js times/$FOLDER_NAME.txt
	done
	echo "" >> $TIMES_FILE
	#echo "Include " $INCLUDE $COUNT
	#$DEBUG_NODE_BIN $ARGS render.js  > bytecodes_$FOLDER_NAME/$name.bytecode.txt
done

#echo ${MACHINE_CODE_ALIGNMENT_FILES[0]}

#: <<'END'

#export FILES=$(concat ${MACHINE_CODE_ALIGNMENT_FILES[@]})
