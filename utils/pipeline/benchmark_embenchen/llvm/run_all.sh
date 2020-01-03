
#!/bin/bash


#name=$(echo $1 | sed 's/\.[^.]*$//')
#ext=$(echo $1 | sed 's/^.*\.//')

# 1 for only const
# 2 for no const and inst
# 3 for inst and consts
# 4 for enumerative

printf "New session\n\n" >> report.$2.txt

dirlist=(`ls $1*.bc`)

for var in "${dirlist[@]}"
do
  #echo $var
    
    echo "Improving " $var $2

    wasm-ld --no-entry --export-all --allow-undefined -o $var.wasm $var # $name.orig.obj
    wasm2wat -o $var.wat $var.wasm

    #llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=3600 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,n$


    if [ "$2" = "1" ]; 
    then
        llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=300 -z3-path=${z3} -souper-debug-level=2 -o $name.opt.bc $name.bc
    fi

    if [ "$2" = "2" ]; 
    then
        llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN=false -souper-infer-inst  -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt.bc $name.bc
    fi

    if [ "$2" = "3" ]; 
    then
        llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -souper-infer-inst -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt.bc $name.bc
    fi

    if [ "$2" = "4" ]; 
    then
        llvm-opt -load ${libsouperPass}  -souper  -souper-external-cache  -souper-enumerative-synthesis -souper-infer-inst -souper-use-alive -souper-synthesis-const-with-cegis -solver-timeout=300  -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt.bc $name.bc 
    fi



    if [ -f "$var.soup$2" ]; then
        
        wasm-ld --no-entry --export-all --allow-undefined -o $var.soup$2.wasm $var.soup$2 # $name.orig.obj
        wasm2wat -o $var.wat $var.soup$2.wasm

        echo $var $(wc -c "$var" | awk '{print $1}') $(wc -c "$var.soup$2" | awk '{print $1}') >> report.$2.txt
    else
        echo $var " Fail" >> report.$2.txt
    fi


  # do something on $var
done
