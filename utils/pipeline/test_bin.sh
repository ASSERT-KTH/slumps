# !/bin/bash

export PATH="/Users/javier/Documents/Develop/slumps/souper/third_party/llvm:$PATH"

cd ../../souper
if [ ! -d "./third_party" ]; then
./build_deps.sh Release -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly
fi

mkdir build
cd build
echo "Building..."
cmake  ../
make
cd ../../utils/pipeline


cd ../../binaryen
cmake . & make
cd ../utils/pipeline

RED='\033[0;31m'
NC='\033[0m' # No Color


ROOT="../../benchmark_programs/wasm/mathfunctions/"

shopt -s nullglob
array3=(${ROOT}*.wasm)


for value in ${array3[@]}
do
    echo ${value}
    ../../binaryen/bin/wasm-opt --flatten --souperify ${value} -o test.wasm > ${value}.lhs

    printf "${RED}Running souper check...${NC}\n"

    ../../souper/build/souper-check  -z3-path="/Users/javier/Documents/Develop/slumps/souper/third_party/z3/build/z3" -infer-rhs ${value}.lhs

done



This is the one

"/usr/lib/llvm-6.0/bin/clang" -cc1 -triple wasm32-unknown-unknown -emit-llvm -emit-llvm-uselists -disable-free -disable-llvm-verifier -discard-value-names -main-file-name sqlite3.c -mrelocation-model static -mthread-model posix -mdisable-fp-elim -no-integrated-as -mconstructor-aliases -fuse-init-array -dwarf-column-info -debugger-tuning=gdb -v -coverage-notes-file /home/slumps/bld/t.gcno -nostdsysteminc -nobuiltininc -resource-dir /usr/lib/llvm-6.0/lib/clang/6.0.0 -D __EMSCRIPTEN_major__=1 -D __EMSCRIPTEN_minor__=22 -D __EMSCRIPTEN_tiny__=1 -D EMSCRIPTEN -D __EMSCRIPTEN__ -U __native_client__ -U __pnacl__ -U __ELF__ -D __IEEE_LITTLE_ENDIAN -Werror=implicit-function-declaration -fno-dwarf-directory-asm -fdebug-compilation-dir /home/slumps/bld -ferror-limit 19 -fmessage-length 204 -fno-math-builtin -fobjc-runtime=gcc -fdiagnostics-show-option -fcolor-diagnostics -nobuiltininc -nostdsysteminc -isystem/usr/share/emscripten/system/local/include -isystem/usr/share/emscripten/system/include/compat -isystem/usr/share/emscripten/system/include -isystem/usr/share/emscripten/system/include/emscripten -isystem/usr/share/emscripten/system/include/libc -isystem/usr/share/emscripten/system/lib/libc/musl/arch/js -isystem/usr/share/emscripten/system/include/gfx -isystem/usr/share/emscripten/system/include/SDL -isystem/usr/share/emscripten/system/include/libcxx -o t.wasm -x c sqlite3.c
