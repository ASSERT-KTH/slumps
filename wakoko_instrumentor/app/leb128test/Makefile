
OBJS = utils.o leb128.o
LINK := $(addprefix  $(L)/,$(OBJS))


all: program
	$(CC) $(INC) $(CCFLAGS) -o leb128test.out $(LINK) leb128test.o
	./leb128test.out
	mv *.o $(BUILD)
	mv *.out $(BIN)

program: leb128test.c
	$(CC) -c $(FLAGS) $(INC) leb128test.c

