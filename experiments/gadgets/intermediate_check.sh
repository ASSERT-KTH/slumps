
PROGRAM_NAME=$1
BC_FOLDER=$2

echo "THIS SCRIPT CHECKS FOR PAIRWISE comparison between bitcodes"

F=$(find $BC_FOLDER -name "*.bc" -depth 1)

COUNT_DIFF_BC=0
COUNT_EQ_BC=0

mkdir -p out/$PROGRAM_NAME
mkdir -p out/$PROGRAM_NAME/gadgets

ALLCOUNT=$(echo "$F" | wc -l)
ALLCOUNT=$(bc <<< "$ALLCOUNT*($ALLCOUNT + 1)/2")
echo $ALLCOUNT
COUNT=1

PREV=()

#value="f2.bc"
#if [[  " ${F[@]} " == " ${value} " ]]; then
#    echo "NOT"
#fi

#exit
for f in $F
do
    
    for f2 in $F
    do

        if [ $f != $f2 ]
        then
            p1="$f-$f2"
            p2="$f2-$f"

            if [[ ! " ${PREV[@]} " == " ${p1} " ]]; then
                if [[ ! " ${PREV[@]} " == " ${p2} " ]]; then
            
                    echo -ne "$COUNT/$ALLCOUNT\r"

                    MD5_BC_F=$(md5sum $f | awk '{print $1}')
                    MD5_BC_F2=$(md5sum $f2 | awk '{print $1}')

                    VARIANT1_NAME=$(basename $f | grep -Eo '\[\d+-\d+\]+')
                    VARIANT2_NAME=$(basename $f2 | grep -Eo '\[\d+-\d+\]+')

                    # echo $VARIANT1_NAME $VARIANT2_NAME

                    if [ $MD5_BC_F == $MD5_BC_F2 ]
                    then
                        echo $(basename $f) is equal to $(basename $f2)
                        COUNT_EQ_BC=$(bc <<< "$COUNT_EQ_BC + 1")

                    else
                        clang $f -o t1 2> /dev/null
                        clang $f2 -o t2 2> /dev/null

                        # ROP first
                        # gadgets for t1
                        #ROPgadget --dump --nojop --binary t1 > 
                        
                        # TODO compare the pair
                        #exit 1
                    fi


                    PREV+=($p1)
                    PREV+=($p2)

                    #echo $PREV

                    COUNT=$(bc <<< "$COUNT + 1")

                fi
            fi

        fi

    done

done

echo "DIFFERENT PAIRS" $COUNT_DIFF_BC
echo "EQ PAIRS" $COUNT_EQ_BC