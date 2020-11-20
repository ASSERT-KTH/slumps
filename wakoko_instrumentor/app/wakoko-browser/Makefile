
OBJS = utils.o leb128.o wasm-decoder.o wasm-encoder.o wakoko.o
LINK := $(addprefix  $(L)/,$(OBJS))


generate_emcc: wakoko-client.c
	mkdir -p emcc
	emcc $(FLAGS) $(INC) $(SRC_DIR)/lib/wasm-decoder/wakoko.c \
	$(SRC_DIR)/lib/utils/utils.c \
	$(SRC_DIR)/lib/utils/leb128.c \
	$(SRC_DIR)/lib/wasm-decoder/wasm-decoder.c \
	$(SRC_DIR)/lib/wasm-decoder/wasm-encoder.c \
	 wakoko-client.c -o emcc/decoder.js -s MODULARIZE=1 -s ALLOW_MEMORY_GROWTH=1 -s EXPORT_NAME=\"'WAKOKO_INSTRUMENTOR'\" -s EXIT_RUNTIME=1 -s EXTRA_EXPORTED_RUNTIME_METHODS="['writeArrayToMemory', 'ccall']" -s ALLOW_MEMORY_GROWTH=1 -s TOTAL_MEMORY=1GB
	wasm2wat emcc/decoder.wasm  --generate-names  -o emcc/decoder.wat
	wc -c emcc/decoder.wasm

	#sed -i -e "s/Module/WAKOKO_INSTRUMENTOR/g" emcc/decoder.js
	#sed -i -e "s/HEAP/WAKOKO_HEAP/g" emcc/decoder.js
	cp emcc/decoder.js $(BUILD)
	cp emcc/decoder.wasm $(BUILD)
	cp emcc/decoder.wat $(BUILD)