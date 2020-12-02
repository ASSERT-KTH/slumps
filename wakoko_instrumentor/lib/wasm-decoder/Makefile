
OBJS = utils.o leb128.o
LINK := $(addprefix  $(L)/,$(OBJS))

all: wasm-decoder wasm-encoder wakoko-instrumentor

wasm-decoder: wasm-decoder.c
	$(CC) $(CCFLAGS) $(FLAGS) $(INC) $(LINK) wasm-decoder.c -c -Wall
	mv *.o $(BUILD)
	
wasm-encoder: wasm-encoder.c
	$(CC) $(CCFLAGS) $(FLAGS) $(INC) $(LINK) wasm-encoder.c -c -Wall
	mv *.o $(BUILD)


wakoko-instrumentor: wakoko.c
	$(CC) $(CCFLAGS) $(FLAGS) $(INC) $(LINK) wakoko.c -c -Wall
	mv *.o $(BUILD)
	
wasm: wasm-decoder.c
	emcc -d  -s EXPORT_ALL=1 $(INC)  wasm-decoder.c
	wasm2wat a.out.wasm  --generate-names  -o wasm-decoder.wat