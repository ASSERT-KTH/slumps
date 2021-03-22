BITCODE=$1
OPT="../../souper/third_party/llvm-Release-install/bin/opt"
PASS="../../souper/build/libsouperPass.dylib"
OPTIONS="--souper --souper-crow -souper-crow-check=true  --souper-debug-level=6"

shift
#echo $(basename $BITCODE)
while [ -n "$1" ]; do

    case "$1" in
        -c)             
            c=True 
        ;;
        -h) 
        
            echo "-c for only counting" 
            exit
        ;;
        -t) # test
        ;;
    esac
    shift
done




O=$($OPT -load $PASS $OPTIONS $BITCODE -o temp 2>&1)
#echo "$O" | grep -o "; entering Souper's runOnFunction() for" | uniq -c

#exit

COUNT=$(echo "$O" | grep "; Looking for a replacement for" | uniq -c | awk '{print $1}')

FUNCTIONS=$(echo "$O" | grep -o "entering Souper's runOnFunction() for" | uniq -c | awk '{print $1}')

INSTRUCTIONS=$(echo "$O" | grep -A 1 "For LLVM instruction" | sed 's/; For LLVM instruction://')
#entering Souper's runOnFunction() for crypto_sign_ed25519_open()

echo $(basename $BITCODE) $COUNT $FUNCTIONS

if [[ $c != "True" ]]
then
    echo "$INSTRUCTIONS"
    echo $FUNCTION_COUNT

fi