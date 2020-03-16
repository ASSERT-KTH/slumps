

dirlist=(`ls $1*.c`)

check(){
    input=$1

    if gcc -c -fsyntax-only "$input" >/dev/null 2>&1; then
        cp $input valid/$input
        #echo "$input is valid C code"
    else
        cp $input sinvalid/$input

        echo "$input is invalid"
    fi
}



for var in "${dirlist[@]}"
do
    check $var
done