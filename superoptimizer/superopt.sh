

#!/bin/bash

# Run it inside the SLUMPS docker container


ROOT=$(dirname $(realpath $BASH_SOURCE))
SLUMPS=$(dirname $ROOT)
#SLUMPS=$(dirname $SLUMPS)

name=$(echo $1 | sed 's/\.[^.]*$//')
ext=$(echo $1 | sed 's/^.*\.//')

  # Change this to your project root
clang="$SLUMPS/souper/third_party/llvm-Release-install/bin/clang"
wasmld="$SLUMPS/souper/third_party/llvm-Release-install/bin/wasm-ld"
llc="$SLUMPS/souper/third_party/llvm-Release-install/bin/llc"
llvmas="$SLUMPS/souper/third_party/llvm-Release-install/bin/llvm-as"
llvmopt="$SLUMPS/souper/third_party/llvm-Release-install/bin/opt"
souper="$SLUMPS/souper/build/souper"
soupercheck="$SLUMPS/souper/build/souper-check"
wasm2c="$SLUMPS/wabt/bin/wasm2c"
wasm2wat="$SLUMPS/wabt/build/wasm2wat"

WASI_ROOT=$ROOT/wasi-sdk-11.0
if [[ ! -d $(dirname $BASH_SOURCE)/wasi-sdk-11.0 ]]
then
    echo "WASI does not exists on your filesystem."
    

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-11/wasi-sdk-11.0-linux.tar.gz -O sdk.tar.gz
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-11/wasi-sdk-11.0-macos.tar.gz -O sdk.tar.gz
    elif [[ "$OSTYPE" == "win32" ]]; then
        wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-11/wasi-sdk-11.0-mingw.tar.gz -O sdk.tar.gz
    else
        echo "WASI SDK cannot be downloaded"
        exit 1
    fi

    tar -xf sdk.tar.gz
fi

# alias

clo(){
    
    c="$clang -O3 -emit-llvm -o $2 --target=wasm32-wasi -S --sysroot=$WASI_ROOT/share/wasi-sysroot  $1"
    echo $c
    $c
}



# vars
#z3="$ROOT/souper/third_party/z3/build/z3"


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    libsouperPass=$SLUMPS/souper/build/libsouperPass.so
elif [[ "$OSTYPE" == "darwin"* ]]; then
     libsouperPass=$SLUMPS/souper/build/libsouperPass.dylib
elif [[ "$OSTYPE" == "win32" ]]; then
     libsouperPass=$SLUMPS/souper/build/libsouperPass.dll
else
    exit 1
fi

RED='\033[0;31m'
NC='\033[0m' # No Color

start=$(date)

if [ "${ext}" == "c" ]; then

 err=0
 trap 'err=1' ERR

 clo $1 $name.ll 
 if [ $err != 0 ]; then
    echo "Failed to compile $1"
    exit 1
 fi

 echo "CLO exit"
 $llvmas -o $name.bc $name.ll
fi

$wasmld --no-entry --export-all --allow-undefined -o $name.wasm $name.bc # $name.orig.obj
$wasm2wat -o $name.wat $name.wasm
LOG_LEVEL=0
#llvm-as $name.reg.ll -o $name.bc

bin_folders=$SLUMPS/souper/third_party/llvm-Release-install/binexport 
libFolder=$SLUMPS/souper/build

export LD_LIBRARY_PATH=$SLUMPS/souper/third_party/alive2-build:$SLUMPS/souper/build:$SLUMPS/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
export PATH=$SLUMPS/souper/third_party/z3-install/bin:$PATH


echo "Souperifying ${name}..."

    if [ "$2" = "1" ]; 
    then
       echo "option 1"
        $llvmopt -load ${libsouperPass}  --souper  --souper-infer-inst  --souper-debug-level=$LOG_LEVEL --solver-timeout=1 -o $name.opt$2.bc $name.bc
    fi

    if [ "$2" = "2" ]; 
    then
       echo "option 2"
        $llvmopt -load ${libsouperPass}  --souper --souper-infer-inst   --solver-timeout=300 --souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne --souper-debug-level=$LOG_LEVEL -o $name.opt$2.bc $name.bc
    fi

    if [ "$2" = "3" ]; 
    then
       echo "option 3"
        $llvmopt -load ${libsouperPass}  --souper --souper-infer-inst=false --solver-timeout=300 --souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne  --souper-debug-level=$LOG_LEVEL -o $name.opt$2.bc $name.bc
    fi

    if [ "$2" = "4" ]; 
    then
        echo "option 4"
        $llvmopt -load ${libsouperPass}  -souper  --souper-infer-inst=false --souper-use-alive --souper-synthesis-const-with-cegis -solver-timeout=300  --souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne --souper-debug-level=$LOG_LEVEL -o $name.opt$2.bc $name.bc 
    fi

echo  "Souper pass finished"

$wasmld --no-entry --export-all -O0 --allow-undefined -o $name.opt$2.wasm $name.opt$2.bc
$wasm2wat -o $name.opt$2.wat $name.opt$2.wasm

echo "$name" #>> report.$2.txt
echo $(wc -c "$name.wasm" | awk '{print $1}') $(wc -c "$name.opt$2.wasm" | awk '{print $1}') #>> report.$2.txt
printf "\n" # >> report.$2.txt

echo $(date) $start
