
PROGRAM_NAME=$1
PORT=$2

function get_wasm_count(){

    K="$PROGRAM_NAME:wasm:*"
    redis-cli --no-auth-warning -h 137.135.162.78 -a "$REDIS_PASS" -p $PORT  keys "$K" | wc -l
}


KEY="$PROGRAM_NAME:case2:eq:*:*"
KS=$(redis-cli --no-auth-warning -h 137.135.162.78 -a "$REDIS_PASS" -p $PORT  scan 0 match "$KEY" count 100000000)

KEY_COUNT="$PROGRAM_NAME:stability:result:TOTAL"
COUNT=$(redis-cli --no-auth-warning -h 137.135.162.78 -a "$REDIS_PASS" -p $PORT  get $KEY_COUNT || 0)


KEY_EQ="$PROGRAM_NAME:stability:result:EQ"
COUNT_EQ=$(redis-cli --no-auth-warning -h 137.135.162.78 -a "$REDIS_PASS" -p $PORT  get $KEY_EQ || 0)

if [[ ! $COUNT || $COUNT == '0' ]]; then exit 1; fi

PERCENT=$(bc -l <<< "100*$COUNT/($COUNT + $COUNT_EQ)" 2> /dev/null || ERROR)


# latex table
echo $(echo $PROGRAM_NAME | sed -e 's/\_/\\_/g') "&" $(get_wasm_count) "&" $COUNT "&" $COUNT_EQ "&" $(printf "%0.2f"  $PERCENT )\\% \\\\
echo "\\hline"

function clean() {
    S=$1

    S=$(echo "$S" | perl -pe s/\d+://g)
    S=$(echo "$S" | sed s/\"//g)
    S=$(echo "$S" | perl -pe s/\n/\;/g)
    #S1=$(echo "$S1" | perl -pe s/\\\;/\;/g)
    S=$(tr \; '\n' <<< "$S")
    
    tr \\ ' ' <<< "$S"
}

for k in $KS
do
    echo $k

    S1=$(redis-cli --no-auth-warning  -h 137.135.162.78 -a "$REDIS_PASS" -p $PORT  get $k | jq '.S1')
    S2=$(redis-cli --no-auth-warning -h 137.135.162.78 -a "$REDIS_PASS" -p $PORT  get $k | jq '.S2')

    #echo "$S1"

    S1=$(clean "$S1")

    S2=$(clean "$S2")
    
    echo "$S1"
    echo "$S2"

    echo


    #read  -n 1 -p "Press enter to continue" 
done
