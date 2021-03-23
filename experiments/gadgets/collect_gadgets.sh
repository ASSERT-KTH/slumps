
PROGRAM_NAME=$1
BC_FOLDER=$2
METADATA_FILE=$3

shift 3
CLANGO=clang
#echo $(basename $BITCODE)
while [ -n "$1" ]; do

    case "$1" in
        -t)             
            hist=True 
        ;;
        -v)             
            violinplot=True 
        ;;
        -b)             
            boxplot=True 
        ;;
        -s)             
            split=True 
        ;;

        --no-peephole-clang)           
            echo "Using no pephole clang from Souper deps"  
            CLANGO="../../souper/third_party/llvm-Release-install/bin/clang"
        ;;

        --superoptimize-and-compare)           
            echo "Superoptimize and compare the gadgets"  
            SUPEROPTIMIZE=True 
            OPT="../../souper/third_party/llvm-Release-build/bin/opt"
            LIB="../../souper/build/libsouperPass.dylib"
        ;;

        -n)             
            names=True 
        ;;

        -r)             
            find $BC_FOLDER -name "*" -print0 | xargs -0 cksum | sort -n > filelist
            old=""
            while read sum lines filename
            do
                if [[ "$sum" != "$old" ]] ; then
                    old="$sum"
                    continue
                fi
                rm -f "$filename"
            done < filelist
        ;;

        -l)             
            PRINT_COMPARE=True 
        ;;
        -h) 
        
            echo "bash collect_gadgets.sh <program_name> <bitcode_folder> [OPTIONS] "
            echo "THIS SCRIPT CHECKS FOR GADGETS IN x86 ARCH"
            echo "[OPTIONS]"
            echo "      -t for histogram plot of uniqueness" 
            echo "      -v for violinplot of uniqueness" 
            echo "      -n for scatter plot name vs rop count" 
            echo "      -s split gadgets in norop and nojop" 
            echo "      -b for boxplot" 
            echo "      -r remove duplicated files. Calculates and list the md5sum of the file, if its already in the folder, it is removed"
            echo "      --no-peephole-clang to use the disabled peephole llvm from Souper deps" 
            exit
        ;;
    esac
    shift
done




F=$(find $BC_FOLDER -name "*.bc" -depth 1)

COUNT_DIFF_BC=0
COUNT_EQ_BC=0

mkdir -p out/$PROGRAM_NAME
mkdir -p out/$PROGRAM_NAME/gadgets

ALLCOUNT=$(echo "$F" | wc -l)
echo $ALLCOUNT

COUNT=1

NAMES="["
UNIQUE_COUNTS="["
BASE_COUNT="0"


control_c() {
    break 1
    echo "Finishing..."
}

trap control_c SIGINT

NOW=$(date +%s)

echo "" > out/$PROGRAM_NAME/compare.txt

for f in $BC_FOLDER/*.bc
do
    #echo $f

    CURRENT=$(date +%s)
    ETA=$(bc <<< "($COUNT)/($CURRENT - $NOW + 1)*($ALLCOUNT - $COUNT)")
    #echo $ETA
    VARIANT1_NAME=$(basename $f | grep -Eo '\[\d+-\d+\]+')
    FNAME=$(basename $f)

    echo -ne "$COUNT/$ALLCOUNT (eta: $ETA s)\r"
    
    $CLANGO  $f -o t1 2> /dev/null
    
    # TODO use our backend-off clang

    # ROP first
    if [[ split == "True" ]]
    then
        ROPgadget --nojop --binary t1 > out/$PROGRAM_NAME/gadgets/$FNAME.rop.txt  &
        ROPgadget --norop --binary t1 > out/$PROGRAM_NAME/gadgets/$FNAME.jop.txt  &
    fi

    ROPgadget  --binary t1 > out/$PROGRAM_NAME/gadgets/$FNAME.gadgets.txt 


    out=$(ROPgadget --all --binary t1)
    GADGET_COUNT=$(echo "$out" | grep "Unique gadgets found" | awk '{print $4}')

    if [[ ! $VARIANT1_NAME ]] # Baseline bitcode
    then
        BASE_COUNT=$GADGET_COUNT
        llvm-dis $f -o out/$PROGRAM_NAME/$FNAME.ll
        echo "ORIGINAL $BASE_COUNT GADGETS"
        if [[ $SUPEROPTIMIZE == "True" ]]
        then
            $OPT -load $LIB --souper $f -o out/$PROGRAM_NAME/$FNAME.souper.bc

            $CLANGO out/$PROGRAM_NAME/$FNAME.souper.bc -o ts

            ROPgadget  --binary ts > out/$PROGRAM_NAME/gadgets/$FNAME.souper.gadgets.txt 
            OUT_TS=$(ROPgadget --all --binary ts)
            TS_COUNT=$(echo "$OUT_TS" | grep "Unique gadgets found" | awk '{print $4}')
            
            echo "SUPEROPTIMIZATION COUNT $TS_COUNT"
        fi
    fi
    
    if [[ $PRINT_COMPARE == "True" ]]
    then
        
        if [[ $BASE_COUNT && $VARIANT1_NAME ]]
        then
            
            if [[ $BASE_COUNT -gt $GADGET_COUNT ]]
            then
                echo $VARIANT1_NAME "Has less gadgets " $GADGET_COUNT
                python3 extract_metadata.py "$METADATA_FILE" "$VARIANT1_NAME" >> out/$PROGRAM_NAME/compare.txt

                llvm-dis $f -o out/$PROGRAM_NAME/$FNAME.ll
                cat out/$PROGRAM_NAME/gadgets/$FNAME.gadgets.txt 
                
            fi

        fi
    fi

    UNIQUE_COUNTS=$UNIQUE_COUNTS"$GADGET_COUNT, "
    NAMES=$NAMES"\"$FNAME\", "



    
    COUNT=$(bc <<< "$COUNT + 1")


done

echo "Ploting..."
UNIQUE_COUNTS=$UNIQUE_COUNTS"]"
NAMES=$NAMES"]"

# Save distribution plot

echo "uniques = "$UNIQUE_COUNTS > out/$PROGRAM_NAME/$PROGRAM_NAME.unique_count.py
echo "names = "$NAMES >> out/$PROGRAM_NAME/$PROGRAM_NAME.unique_count.py
echo "baseline = "$BASE_COUNT >> out/$PROGRAM_NAME/$PROGRAM_NAME.unique_count.py

if [[ $hist == "True" ]]; then
    python3 -c "import matplotlib.pyplot as plt;plt.figure(figsize=(14,14));plt.hist($UNIQUE_COUNTS, bins=list(set($UNIQUE_COUNTS)));plt.savefig('out/$PROGRAM_NAME/${PROGRAM_NAME}_distrib.histogram.png')"
fi


if [[ $violinplot == "True" ]]; then
    python3 -c "import matplotlib.pyplot as plt;plt.figure(figsize=(14,14)); plt.violinplot([$UNIQUE_COUNTS]);plt.hlines($BASE_COUNT, -1, 2, color='C1');plt.savefig('out/$PROGRAM_NAME/${PROGRAM_NAME}_distrib.violinplot.png')"
fi

if [[ $boxplot == "True" ]]; then
    python3 -c "import matplotlib.pyplot as plt;plt.figure(figsize=(14,14)); plt.boxplot([$UNIQUE_COUNTS]);plt.hlines($BASE_COUNT, -1, 2, color='C1');plt.savefig('out/$PROGRAM_NAME/${PROGRAM_NAME}_distrib.boxplot.png')"
fi



if [[ $names == "True" ]]; then

    python3 -c "import matplotlib.pyplot as plt;plt.figure(figsize=(14,14)); plt.scatter([1]*len($NAMES), $UNIQUE_COUNTS, alpha=0.1);plt.hlines($BASE_COUNT, -1, 2, color='C1');plt.tight_layout();plt.savefig('out/$PROGRAM_NAME/${PROGRAM_NAME}_distrib.scatter.png')"

    python3 -c "import matplotlib.pyplot as plt;plt.figure(figsize=(14,14)); plt.plot(range(len($NAMES)), $UNIQUE_COUNTS, 'o');plt.hlines($BASE_COUNT, -1, $ALLCOUNT);plt.xticks(range(len($NAMES)), $NAMES, rotation=45);plt.xlim(-1);plt.tight_layout();plt.savefig('out/$PROGRAM_NAME/${PROGRAM_NAME}_distrib.scatter2.png')"
fi