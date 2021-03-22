
PROGRAM_NAME=$1
WASM_FOLDER=$2

shift 2

echo "$PROGRAM_NAME"
MAX_THREADS=1
while [ -n "$1" ]; do

    case "$1" in
        -d)             
            ONLY_DIFF=True 
        ;;
        -c)      
            #CLEAN       
            CLEAN=True 
        ;;

        -a)      
            #CLEAN       
            AUTH="-a $REDIS_PASS" 
        ;;

        -w)      
            #CLEAN       
            STOPAT_WARNING=True 
        ;;
        -s)      
            #CLEAN       
            STOP_AT_ERROR=True 
        ;;
        -intel)
            OBJDUMP_ARGS="--x86-asm-syntax=intel"
        ;;

        --save-different)
            SAVE_DIFF=True
        ;;

        -t)
            MAX_THREADS=$2
            shift
        ;;
        -h) 
        
            echo "help TODO "
        ;;
    esac
    shift
done


ARCH="x86_64"
#ARCH="aarch64"

# Patch original file name

mv "$WASM_FOLDER/$PROGRAM_NAME.bc.wasm" "$WASM_FOLDER/$PROGRAM_NAME.wasm"

F=$(find "$WASM_FOLDER" -name "*.wasm" -depth 1)



COUNT_DIFF_BC=0
COUNT_EQ_BC=0

COUNT_DIFF_WS=0
COUNT_EQ_WS=0

COUNT_CASE1=0
COUNT_CASE2=0
NON_COUNT_CASE2=0

mkdir -p out/$PROGRAM_NAME
mkdir -p out/$PROGRAM_NAME/wasm
mkdir -p out/$PROGRAM_NAME/native
mkdir -p out/$PROGRAM_NAME/dump
mkdir -p out/$PROGRAM_NAME/diff
mkdir -p out/$PROGRAM_NAME/diff_wasm
mkdir -p out/$PROGRAM_NAME/diff_bc

FILES=($F)

echo "============STARTING================="
DIFF_COUNT=0
ALLCOUNT=$(echo "$F" | wc -l)
echo "wasms" $ALLCOUNT
ALLCOUNT=$(bc <<< "$ALLCOUNT*($ALLCOUNT + 1)/2")
COUNT=1

ARGS=""

if [[ $ONLY_DIFF == "True" ]]
then
    ARGS="$ARGS --suppress-common-lines"
fi

function get_replacement_SouperIR () {

    # Read SOUPER IR replacement from the redis cache

    PORT=$1
    NAME=$2

    KEY="$PROGRAM_NAME:variants:$NAME"

    redis-cli --no-auth-warning"$AUTH" -p $PORT get "$KEY" 
}


CASE1="Two llvm bitcodes are different but the Wasm compilation returns the same"
CASE2="Two wasm bytecodes are different but the Lucet compilation returns the same"

json_escape () {
    printf '%s' "$1" | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))'
}

function notify () {
    MESSAGE=$(echo "$1" | sed 's/\_/ /g')
    MESSAGE=$(echo "$MESSAGE" | sed 's/#/ /g')
    MESSAGE=$(echo "$MESSAGE" | sed 's/*/ /g')
    MESSAGE=$(echo "$MESSAGE" | sed 's/\n/\\n/g')

    #echo $MESSAGE
    curl -s --data parse_mode=Markdown --data chat_id="665043934" --data "text=$MESSAGE" "https://api.telegram.org/bot$BOT_API_TOKEN/sendMessage" 2>&1 1> /dev/null
}


function notify_file () {
    curl -s -F document=@"$1" "https://api.telegram.org/bot$BOT_API_TOKEN/sendDocument?chat_id=665043934"  2>&1 1> /dev/null
}



function set_comparison () {
    PORT=$1
    NAME=$2
    COUNT=$3

    #echo $PORT $NAME $COUNT

    KEY="$NAME:pairwise"
    redis-cli --no-auth-warning$AUTH -p $PORT  set "$KEY" "$COUNT"
}

function set_result() {
    PORT=$1
    NAME=$2
    COUNT=$3
    REVERSED=$4
    ARCHS=$5

    #echo $PORT $NAME $COUNT

    KEY="$NAME:stability:result:$ARCHS:NON_REVERSED"
    redis-cli --no-auth-warning$AUTH -p $PORT  set "$KEY" "$COUNT"

    KEY="$NAME:stability:result:$ARCHS:REVERSED"
    redis-cli --no-auth-warning$AUTH -p $PORT  set "$KEY" "$REVERSED"
}


function set_case2 () {
    echo $CASE2
    PORT=$1
    NAME=$2
    VV1=$3
    VV2=$4
    R1=$(json_escape "$5")
    R2=$(json_escape "$6")
    S1=$(json_escape "$7")
    S2=$(json_escape "$8")

    echo "$S1" "$S2"

    KEY="$NAME:case2:eq:$VV1:$VV2"
    redis-cli --no-auth-warning$AUTH -p $PORT  set $KEY "{\"description\": \"$CASE2\", \"v1\": \"$VV1\", \"v2\": \"$VV2\", \"R1\": $R1, \"R2\": $R2, \"S1\": $S1, \"S2\": $S2}"
}


function set_case1 () {
    echo $CASE1
    PORT=$1
    NAME=$2
    V1=$3
    V2=$3
    

    # Get SouperIR replacement
    # Get Wat diff

    KEY="$NAME:case1:eq:$V1:$V2"
    redis-cli --no-auth-warning$AUTH -p $PORT  set $KEY "$CASE1"
}



function compare() {

    f="$1"
    f2="$2"

    tmpName=$3

    #echo $MD5_BC_F $MD5_BC_F2

    
    #WASM1=$PROGRAM_NAME$VARIANT1_NAME.bc.wasm
    #WASM2=$PROGRAM_NAME$VARIANT2_NAME.bc.wasm
    WASM1="$f"
    WASM2="$f2"
    VARIANT1_NAME=$(basename "$WASM1")
    VARIANT2_NAME=$(basename "$WASM2")

    #echo $WASM1
    #echo $WASM2


    if test -f "$WASM1"; then

        if test -f "$WASM2"; then
            
            #echo "$WASM_FOLDER/$WASM1"
            #echo "$WASM_FOLDER/$WASM2"
            MD5_WASM1=$(md5sum "$WASM1" | awk '{print $1}')
            MD5_WASM2=$(md5sum "$WASM2" | awk '{print $1}')

            #echo $MD5_WASM1 $MD5_WASM2

            if [ $MD5_WASM1 == $MD5_WASM2 ]
            then

                COUNT_EQ_WS=$(bc <<< "$COUNT_EQ_WS + 1")
               
                # Copy the variants to the out folder
                cp $WASM1 out/$PROGRAM_NAME/wasm
                cp $WASM2 out/$PROGRAM_NAME/wasm

                # Get the textual representation to check after
                wasm2wat $WASM1 -o out/$PROGRAM_NAME/wasm/$VARIANT1_NAME.wat
                wasm2wat $WASM2 -o out/$PROGRAM_NAME/wasm/$VARIANT2_NAME.wat

                # TODO, load the variants from the metadata JSON file

            else

                # Build native with wasmtime
                COUNT_DIFF_WS=$(bc <<< "$COUNT_DIFF_WS + 1")
                for arch in $ARCH
                do
                    
                    ERROR=0

                    n1=$VARIANT1_NAME.bc.wasm.$arch.native
                    n2=$VARIANT2_NAME.bc.wasm.$arch.native

                    #echo "$WASM1"
                    #$WASMTIME wasm2obj --target=$arch $WASM1 out/$PROGRAM_NAME/native/$n1
                    ERR1=$($WASMTIME wasm2obj --target=$arch $WASM1 out/$PROGRAM_NAME/native/$n1 2>&1) || ERROR=1

                    ERR2=$($WASMTIME wasm2obj --target=$arch $WASM2 out/$PROGRAM_NAME/native/$n2 2<&1) || ERROR=1


                    if [[ $ERROR == 1 ]]
                    then
                        notify "$arch"
                        notify "$ERR1" &
                        notify "$ERR2" &
                        echo "Fail to compile $n1 $n2"

                        if [[ $STOP_AT_ERROR == "True" ]]
                        then
                            echo "$ERR1"
                            echo "$ERR2"
                            echo "$arch"
                            read  -n 1 -p "Press enter to continue" 
                        fi

                        continue
                    fi


                    strip -N "out/$PROGRAM_NAME/native/$n1" -o $tmpName 2> /dev/null
                    MD5_NATIVE1=$(md5sum $tmpName | awk '{print $1}')
                    DUMP1=$(objdump -D $OBJDUMP_ARGS $tmpName)



                    strip -N "out/$PROGRAM_NAME/native/$n2" -o $tmpName 2> /dev/null
                    MD5_NATIVE2=$(md5sum $tmpName | awk '{print $1}')
                    DUMP2=$(objdump -D  $OBJDUMP_ARGS $tmpName)


                    if [[ $CLEAN == "True" ]]
                    then
                        DUMP1=$(echo "$DUMP1" | perl -pe 's/^[ \t\r]+[\dabcdef]+:( [\dabcdef]+)+[ \t]+//g')
                        DUMP2=$(echo "$DUMP2" | perl -pe 's/^[ \t\r]+[\dabcdef]+:( [\dabcdef]+)+[ \t]+//g')
                    fi


                    echo "$DUMP1" > out/$PROGRAM_NAME/dump/$VARIANT1_NAME.dump.$arch.txt
                    echo "$DUMP2" > out/$PROGRAM_NAME/dump/$VARIANT2_NAME.dump.$arch.txt


                    if [ $MD5_NATIVE1 != $MD5_NATIVE2 ]
                        then
                            diff -y $ARGS out/$PROGRAM_NAME/dump/$VARIANT1_NAME.dump.$arch.txt out/$PROGRAM_NAME/dump/$VARIANT2_NAME.dump.$arch.txt > out/$PROGRAM_NAME/diff/$VARIANT1_NAME-$VARIANT2_NAME.diff.$arch.txt

                            NON_COUNT_CASE2=$(bc <<< "$NON_COUNT_CASE2 + 1")

                            if [[ $SAVE_DIFF == "True" ]]
                            then
                                cp $WASM1 out/$PROGRAM_NAME/diff_wasm &
                                cp $WASM2 out/$PROGRAM_NAME/diff_wasm &
                                cp $f2 out/$PROGRAM_NAME/diff_bc &
                                cp $f out/$PROGRAM_NAME/diff_bc &

                            fi
                        else

                            # Get the textual representation to check after
                            mkdir -p out/$PROGRAM_NAME/wasm/$DIFF_COUNT/

                            
                            wasm2wat $WASM1 -o out/$PROGRAM_NAME/wasm/$DIFF_COUNT/$VARIANT1_NAME.wat
                            wasm2wat $WASM2 -o out/$PROGRAM_NAME/wasm/$DIFF_COUNT/$VARIANT2_NAME.wat


                            DIFF_COUNT=$(bc <<< "$DIFF_COUNT + 1")
                            D=$(diff -y --suppress-common-lines out/$PROGRAM_NAME/wasm/$WASM1.wat out/$PROGRAM_NAME/wasm/$WASM2.wat)

                            if [[ $STOP_AT_ERROR == "True" ]]
                            then
                                echo $PROGRAM_NAME $VARIANT1 $VARIANT2
                                echo "$D"
                                read  -n 1 -p "Press enter to continue" ß
                            fi
                        fi

                done
            fi
        
        else
            echo "NOT FOUND $WASM2"
        fi

    else
        echo "NOT FOUND $WASM1"
    fi

            #echo $COUNT_DIFF_BC


}

PREV=()

L=${#FILES[@]}
notify "$PROGRAM_NAME  $ALLCOUNT pairs"

set_comparison "8789" "$PROGRAM_NAME" "$ALLCOUNT"
COUNT=0

THREADS_COUNT=0

COUNT_CASE1=0
COUNT_CASE2=0
NON_COUNT_CASE2=0

for i in $(seq 0 $L)
do
    
    for j in $(seq $(bc <<< "$i + 1") $L)
    do


        f="${FILES[$i]}"
        f2="${FILES[$j]}"

        if [[ ! $f ]]; then continue; fi
        if [[ ! $f2 ]]; then continue; fi
        if [[ $f == $f2 ]]; then continue; fi
                        
        echo -ne "$i-$j $COUNT/$ALLCOUNT                                      \r"
        
        compare "$f" "$f2" "tmp"

        COUNT=$(bc <<< "$COUNT + 1")

    done

done


notify "$PROGRAM_NAME non-reversed $NON_COUNT_CASE2 reversed $COUNT_CASE2"

echo "DIFF  WS $COUNT_DIFF_WS, EQ WS $COUNT_EQ_WS"
echo $PROGRAM_NAME "NOT REVERSED" $NON_COUNT_CASE2
echo $PROGRAM_NAME "REVERSED" $COUNT_CASE2

set_result "8789" "$PROGRAM_NAME" "$NON_COUNT_CASE2" "$COUNT_CASE2" "$ARCH"