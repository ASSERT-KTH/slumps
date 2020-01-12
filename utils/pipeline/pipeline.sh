

#!/bin/bash

name=$(echo $1 | sed 's/\.[^.]*$//')
ext=$(echo $1 | sed 's/^.*\.//')

clo(){
   echo "CLO on $1 $2"

   clang  -cc1 -triple wasm32-unknown-unknown -S -O3 -emit-llvm -emit-llvm-uselists -disable-free -disable-llvm-verifier  -main-file-name $1 -mrelocation-model static -mthread-model posix -mdisable-fp-elim -no-integrated-as -mconstructor-aliases -fuse-init-array -nostdsysteminc -nobuiltininc -resource-dir /usr/lib/llvm-8.0/lib/clang/8.0.0   -U __native_client__ -U __pnacl__ -U __ELF__ -D __IEEE_LITTLE_ENDIAN -Werror=implicit-function-declaration -fno-dwarf-directory-asm -fno-math-builtin -fobjc-runtime=gcc  -nobuiltininc -nostdsysteminc -isystem/usr/share/emscripten/system/local/include -isystem/usr/share/emscripten/system/include/compat -isystem/usr/share/emscripten/system/include -isystem/usr/share/emscripten/system/include/emscripten -isystem/usr/share/emscripten/system/include/libc -isystem/usr/share/emscripten/system/lib/libc/musl/arch/js -isystem/usr/share/emscripten/system/include/gfx -isystem/usr/share/emscripten/system/include/SDL -isystem/usr/share/emscripten/system/include/libcxx -o $2 -x c $1
}



# alias
shopt -s expand_aliases
#alias clang='~/slumps/souper/third_party/llvm/Release/bin/clang'
alias llc='~/slumps/souper/third_party/llvm/Release/bin/llc'
alias llvm-as='~/slumps/souper/third_party/llvm/Release/bin/llvm-as'
alias llvm-opt='~/slumps/souper/third_party/llvm/Release/bin/opt'
alias souper='~/slumps/souper/build/souper'
alias souper-check='~/slumps/souper/build/souper-check'
alias wasm2c='~/slumps/wabt/bin/wasm2c'
alias wasm2wat='~/slumps/wabt/bin/wasm2wat'
alias wasm-ld='/usr/bin/wasm-ld-8'

# vars
z3='/home/slumps/slumps/souper/third_party/z3/build/z3'
libsouperPass='/home/slumps/slumps/souper/build/libsouperPass.so'

RED='\033[0;31m'
NC='\033[0m' # No Color

start=$(date)

if [ "${ext}" == "c" ]; then
#  clang --target=wasm32-unknown-unknown -O3 $1 -S -emit-llvm -o  $name.ll
 clo $1 $name.ll 
 echo "CLO exit"
 llvm-as -o $name.bc $name.ll
fi

wasm-ld --no-entry --export-all --allow-undefined -o $name.wasm $name.bc # $name.orig.obj
wasm2wat -o $name.wat $name.wasm

#llvm-as $name.reg.ll -o $name.bc
echo "Souperifying ${name}..."

# "-souper-enumerative-synthesis", "-souper-enumerative-synthesis-num-instructions=%s"%(self.MAX_INST,) souper-infer-inst
#llvm-opt -load ${libsouperPass} -souper -souper-enumerative-synthesis -souper-enumerative-synthesis-num-instructions=3 -solver-timeout=20   -z3-path=${z3} -souper-debug-level=4 -o $name.opt.bc $name.bc
#llvm-opt -load ${libsouperPass}  -souper -souper-enumerative-synthesis -souper-infer-inst -souper-use-alive -souper-synthesis-const-with-cegis -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -solver-timeout=40  -z3-path=${z3} -souper-debug-level=0 -o $name.opt.bc $name.bc
#llvm-opt -load ${libsouperPass} -souper -souper-infer-inst -solver-timeout=3600 -souper-external-cache -z3-path=${z3} -souper-debug-level=4 -o $name.opt.bc $name.bc 
    if [ "$2" = "5" ];
    then
    echo "option 5"
    llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne  -z3-path=${z3} -souper-debug-level=4 -o $name.opt$2.bc $name.bc
    fi
    if [ "$2" = "1" ]; 
    then
       echo "option 1"
        llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=300 -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc
    fi

    if [ "$2" = "2" ]; 
    then
       echo "option 2"
        llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN=false -souper-infer-inst  -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=4 -o $name.opt$2.bc $name.bc
    fi

    if [ "$2" = "3" ]; 
    then
       echo "option 3"
        llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -souper-infer-inst -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=4 -o $name.opt$2.bc $name.bc
    fi

    if [ "$2" = "4" ]; 
    then
        echo "option 4"
        llvm-opt -load ${libsouperPass}  -souper  -souper-external-cache  -souper-enumerative-synthesis -souper-infer-inst -souper-use-alive -souper-synthesis-const-with-cegis -solver-timeout=300  -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=4 -o $name.opt$2.bc $name.bc 
    fi

echo  "Souper pass finished"

wasm-ld --no-entry --export-all -O0 --allow-undefined -o $name.opt$2.wasm $name.opt$2.bc
wasm2wat -o $name.opt$2.wat $name.opt$2.wasm

echo "$name" #>> report.$2.txt
echo $(wc -c "$name.wasm" | awk '{print $1}') $(wc -c "$name.opt$2.wasm" | awk '{print $1}') #>> report.$2.txt
printf "\n" # >> report.$2.txt

echo $(date) $start