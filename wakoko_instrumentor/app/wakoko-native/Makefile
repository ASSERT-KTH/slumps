
OBJS = utils.o leb128.o wasm-decoder.o wasm-encoder.o wakoko.o
LINK := $(addprefix  $(L)/,$(OBJS))


all:  check_wakoko

generate_emcc: decoder.c
	mkdir -p emcc
	emcc $(FLAGS) $(INC) $(SRC_DIR)/lib/wasm-decoder/wakoko.c \
	$(SRC_DIR)/lib/utils/utils.c \
	$(SRC_DIR)/lib/utils/leb128.c \
	$(SRC_DIR)/lib/wasm-decoder/wasm-decoder.c \
	$(SRC_DIR)/lib/wasm-decoder/wasm-encoder.c \
	 decoder.c -o emcc/decoder.html -s FILESYSTEM=1 -s EXIT_RUNTIME=1 -s ALLOW_MEMORY_GROWTH=1


check_all: program
	$(CC) $(CCFLAGS) -DIDEM  $(LINK) decoder.o -o decoder.out

	#./decoder.out $(RESOURCES)/wasms/Chinese_zodiac.orig.wasm 
	#cp $(RESOURCES)/wasms/Chinese_zodiac.orig.wasm  orig.wasm
	#wasm2wat orig.wasm -o t2.wat -v > logs.orig.txt
	#wasm2wat test.wasm -o t.wat -v > logs.txt
	bash validate_all.sh $(RESOURCES)/wasms

check_wakoko: program_instrument
	$(CC) $(CCFLAGS) -DWAKOKO_PRINT $(LINK) decoder.o -o decoder.out

	./decoder.out $(RESOURCES)/huge_wasms/ffmpeg-core.wasm ffmpeg.wak.wasm
	#cp $(RESOURCES)/huge_wasms/ffmpeg-core.wasm  orig.wasm
	wasm2wat --enable-all ffmpeg.wak.wasm -o t2.wat -v > logs.orig.txt
	#wasm2wat --enable-all ffmpeg.wak.wasm -o t.wat -v > logs.txt
	#bash validate_wakoko.sh $(RESOURCES)/wasms


program: decoder.c
	$(CC) -c $(FLAGS) -DIDEM -DWAKOKO_PRINT -DDEBUG $(INC) decoder.c



program_instrument: decoder.c
	$(CC) -c $(FLAGS)  -DWAKOKO_PRINT $(INC) decoder.c