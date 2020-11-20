#include <include/utils/leb128.h>
#include <include/utils/utils.h>
#include <stdio.h>


void  _assert(char * current, int position, int expected_positive, int expected_negative){
	
	unsigned int b1 = decode_var_uint32(current, position);
	if(b1 != expected_positive){
		printf(ANSI_COLOR_RED "decode_var_uint32 Error expected %d, current %d\n" ANSI_COLOR_RESET, expected_positive, b1 );
		exit(1);
	}
	int b2 = decode_var_int32(current, position, 32); // int 32 bits
	if(b2 != expected_negative){
		printf(ANSI_COLOR_RED "decode_var_int32 Error expected %x, current %x\n" ANSI_COLOR_RESET, expected_negative, b2 );
		exit(1);
	}
}

int main(){

	char * bytes = malloc(21);
	bytes[0] = 0x00;
	bytes[1] = 0x01;
	bytes[2] = 0x10;
	bytes[3] = 0x45;
	bytes[4] = 0x8e;
	bytes[5] = 0x32;
	bytes[6] = 0xc1;
	bytes[7] = 0x57;
	bytes[8] = 0x80;
	bytes[9] = 0x80;
	bytes[10] = 0x80;
	bytes[11] = 0x3f;
	bytes[12] = 0x80;
	bytes[13] = 0x80;
	bytes[14] = 0x80;
	bytes[15] = 0x4f;
	bytes[16] = 0x7f;
	bytes[17] = 0x80;
	bytes[18] = 0x7f;

	_assert(bytes, 0, 0, 0);
	_assert(bytes, 1, 0x01, 0x01);
	_assert(bytes, 2, 0x10, 0x10);
	_assert(bytes, 3, 0x45, -0x3b);
	_assert(bytes, 4, 0x190e, 0x190e);
	_assert(bytes, 6, 0x2bc1, -0x143f);
	_assert(bytes, 8, 0x7e00000, 0x7e00000);
	_assert(bytes, 12, 0x9e00000, -0x6200000);
	_assert(bytes, 16, 127, -1);
	_assert(bytes, 17, 16256, -128);
		
	free(bytes);
	return 0;
}
