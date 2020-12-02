


all: utils

utils: leb128.c utils.c
	$(CC) $(CCFLAGS) $(INC) $(L) leb128.c -c
	$(CC) $(CCFLAGS) $(INC) $(L) utils.c -c
	mv *.o $(BUILD)


wasm: leb128.c utils.c
	emcc $(CCFLAGS) -d -s -s WASM=1 -s SIDE_MODULE=1 -shared -s EXPORT_ALL=1 $(INC) leb128.c -o leb128.wasm 
	wasm2wat leb128.wasm --generate-names -o leb128.wat
	mv *.wasm $(BUILD)
	mv *.wat $(BUILD)