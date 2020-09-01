
#!/bin/bash


#name=$(echo $1 | sed 's/\.[^.]*$//')
#ext=$(echo $1 | sed 's/^.*\.//')

printf "New session\n\n" >> report.txt

alias validate=../../wabt/bin/wasm-validate

dirlist=(`ls $1*.c`)

for var in "${dirlist[@]}"
do
  #echo $var
        name=$(echo $var | sed 's/\.[^.]*$//')
        ext=$(echo $var | sed 's/^.*\.//')

 	emcc $name.c -O0 -s WASM=1 -s SIDE_MODULE=1 -o ${name}.emcc_0.wasm

	emcc $name.c -O3 -s WASM=1 -s SIDE_MODULE=1 -o ${name}.emcc_3.wasm
  emcc $name.c -Os -s WASM=1 -s SIDE_MODULE=1 -o ${name}.emcc_s.wasm
  emcc $name.c -O2 -s WASM=1 -s SIDE_MODULE=1 -o ${name}.emcc_2.wasm  
  emcc $name.c -O1 -s WASM=1 -s SIDE_MODULE=1 -o ${name}.emcc_1.wasm  
  emcc $name.c -Oz -s WASM=1 -s SIDE_MODULE=1 -o ${name}.emcc_z.wasm

  validate ${name}.emcc_z.wasm


	../../wabt/bin/wasm2wat -o $name.emcc.wat $name.emcc.wasm
	echo $name $(wc -c "$name.emcc_0.wasm" | awk '{print $1}') $(wc -c "$name.emcc_1.wasm" | awk '{print $1}') $(wc -c "$name.emcc_2.wasm" | awk '{print $1}')  $(wc -c "$name.emcc_3.wasm" | awk '{print $1}') $(wc -c "$name.emcc_s.wasm" | awk '{print $1}') $(wc -c "$name.emcc_z.wasm" | awk '{print $1}')   >> report.txt

  # do something on $var
done


"/home/slumps/slumps/souper/third_party/llvm/Release/bin/clang" -cc1 -triple wasm32-unknown-unknown -emit-llvm -emit-llvm-uselists -disable-free -disable-llvm-verifier -discard-value-names -main-file-name gzlib.c -mrelocation-model static -mthread-model posix -mdisable-fp-elim -no-integrated-as -mconstructor-aliases -fuse-init-array -dwarf-column-info -debugger-tuning=gdb -v -coverage-notes-file /home/slumps/bld/t.gcno -nostdsysteminc -nobuiltininc -resource-dir /home/slumps/slumps/souper/third_party/llvm/Release/lib/llvm-6.0/lib/clang/6.0.0 -D __EMSCRIPTEN_major__=1 -D __EMSCRIPTEN_minor__=22 -D __EMSCRIPTEN_tiny__=1 -D EMSCRIPTEN -D __EMSCRIPTEN__ -U __native_client__ -U __pnacl__ -U __ELF__ -D __IEEE_LITTLE_ENDIAN -Werror=implicit-function-declaration -fno-dwarf-directory-asm -fdebug-compilation-dir /home/slumps/bld -ferror-limit 19 -fmessage-length 204 -fno-math-builtin -fobjc-runtime=gcc -fdiagnostics-show-option -fcolor-diagnostics -nobuiltininc -nostdsysteminc -isystem/usr/share/emscripten/system/local/include -isystem/usr/share/emscripten/system/include/compat -isystem/usr/share/emscripten/system/include -isystem/usr/share/emscripten/system/include/emscripten -isystem/usr/share/emscripten/system/include/libc -isystem/usr/share/emscripten/system/lib/libc/musl/arch/js -isystem/usr/share/emscripten/system/include/gfx -isystem/usr/share/emscripten/system/include/SDL -isystem/usr/share/emscripten/system/include/libcxx -o t.ll -x c gzlib.c

 "/home/slumps/slumps/souper/third_party/llvm/Release/bin/clang" -cc1 -triple wasm32-unknown-unknown -emit-llvm -emit-llvm-uselists -disable-free -disable-llvm-verifier -discard-value-names -main-file-name lua.c -mrelocation-model static -mthread-model posix -mdisable-fp-elim -no-integrated-as -mconstructor-aliases -fuse-init-array -dwarf-column-info -debugger-tuning=gdb -v -coverage-notes-file /home/slumps/lua/t.gcno -nostdsysteminc -nobuiltininc -resource-dir /home/slumps/slumps/souper/third_party/llvm/Release/lib/clang/8.0.0 -D __EMSCRIPTEN_major__=1 -D __EMSCRIPTEN_minor__=22 -D __EMSCRIPTEN_tiny__=1 -D EMSCRIPTEN -D __EMSCRIPTEN__ -U __native_client__ -U __pnacl__ -U __ELF__ -D __IEEE_LITTLE_ENDIAN -Werror=implicit-function-declaration -fno-dwarf-directory-asm -fdebug-compilation-dir /home/slumps/lua -ferror-limit 19 -fmessage-length 204 -fno-math-builtin -fobjc-runtime=gcc -fdiagnostics-show-option -fcolor-diagnostics -nobuiltininc -nostdsysteminc -isystem/usr/share/emscripten/system/local/include -isystem/usr/share/emscripten/system/include/compat -isystem/usr/share/emscripten/system/include -isystem/usr/share/emscripten/system/include/emscripten -isystem/usr/share/emscripten/system/include/libc -isystem/usr/share/emscripten/system/lib/libc/musl/arch/js -isystem/usr/share/emscripten/system/include/gfx -isystem/usr/share/emscripten/system/include/SDL -isystem/usr/share/emscripten/system/include/libcxx -o t.ll -x c lua.c


  "/home/slumps/slumps/souper/third_party/llvm/Release/bin/clang" -cc1 -triple wasm32-unknown-unknown -emit-llvm -emit-llvm-uselists -disable-free -disable-llvm-verifier -discard-value-names -main-file-name mjs.c -mrelocation-model static -mthread-model posix -mdisable-fp-elim -no-integrated-as -mconstructor-aliases -fuse-init-array -dwarf-column-info -debugger-tuning=gdb -v -coverage-notes-file /home/slumps/mjs/t.gcno -nostdsysteminc -nobuiltininc -resource-dir /home/slumps/slumps/souper/third_party/llvm/Release/lib/clang/8.0.0 -D __EMSCRIPTEN_major__=1 -D __EMSCRIPTEN_minor__=22 -D __EMSCRIPTEN_tiny__=1 -D EMSCRIPTEN -D __EMSCRIPTEN__ -U __native_client__ -U __pnacl__ -U __ELF__ -D __IEEE_LITTLE_ENDIAN -Werror=implicit-function-declaration -fno-dwarf-directory-asm -fdebug-compilation-dir /home/slumps/mjs -ferror-limit 19 -fmessage-length 204 -fno-math-builtin -fobjc-runtime=gcc -fdiagnostics-show-option -fcolor-diagnostics -nobuiltininc -nostdsysteminc -isystem/usr/share/emscripten/system/local/include -isystem/usr/share/emscripten/system/include/compat -isystem/usr/share/emscripten/system/include -isystem/usr/share/emscripten/system/include/emscripten -isystem/usr/share/emscripten/system/include/libc -isystem/usr/share/emscripten/system/lib/libc/musl/arch/js -isystem/usr/share/emscripten/system/include/gfx -isystem/usr/share/emscripten/system/include/SDL -isystem/usr/share/emscripten/system/include/libcxx -o t.ll -x c mjs.c