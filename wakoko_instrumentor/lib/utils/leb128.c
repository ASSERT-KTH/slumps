#include <include/utils/leb128.h>
#include <stdlib.h>

#ifdef DEBUG
	#include <stdio.h>
#endif

// TODO avoid the usage of stdlib, no malloc, no free, etc

unsigned int decode_var_int32(char *buffer, int * offset, int size){

	unsigned result = 0;
	unsigned shift = 0;
	char byte;
	
	do{
		byte = buffer[(*offset)++];
		result |= (byte & 0x7f) << shift;
		shift += 7;

	}while((byte & 0x80) != 0);


	//#ifdef DEBUG
	//	printf("%d %d\n",shift, result);
	//#endif
    /* sign bit of byte is second high order bit (0x40) */
    if ((shift < size) && (byte & 0x40)){
	    result |= (~0 << shift);
	}

	return result;
}

unsigned int decode_var_uint32(char* buffer, int* offset){

	unsigned result = 0;
	unsigned shift = 0;

	while(1){
		char byte = buffer[(*offset)++];

		result |= (byte & 0x7f) << shift;

		if((byte & 0x80) == 0)
			break;


		shift += 7;
	}
	return result;
}


// Return the size of the LEB128 buffer
void encode_var_uint_leb128(unsigned int value, unsigned int padding, char* output, int* size){

	unsigned int b = 0;
	int index = 0;

	do{
		b = value & 127;
		value = value >> 7;
		if(value !=0)
		{
			b =  b | 0x80;
		}
		output[index++] = b;
		padding--;

	}while(value != 0 || padding > -1);


	(*size) += index;
}

// Return the size of the LEB128 buffer
int get_encoding_size(unsigned int value, unsigned int padding){

	unsigned int b = 0;
	int index = 0;

	do{
		b = value & 127;
		value = value >> 7;
		if(value !=0)
		{
			b =  b | 0x80;
		}
		//output[index++] = b;
		index++;
		padding--;

	}while(value != 0 || padding > -1);


	return index;
}



/*

function signedLEB128 (value) {
    var v = [],
        // log2 is expensive, could be replace by a lookup table
        size = Math.ceil(Math.log2(Math.abs(value))),
        more = true,
        isNegative = (value < 0),
        b = 0;

    while (more) {

        // get 7 least significant bits
        b = value & 127;
        // left shift value 7 bits
        value = value >> 7;

        if (isNegative) {
            // extend sign
            value = value | (- (1 << (size - 7)));
        }

        // sign bit of byte is second high order bit
        if ((value == 0 && ((b & 0x40) == 0)) || ((value == -1 && ((b & 0x40) == 0x40)))) {
            // calculation is complete
            more = false;
        }
        else {
            b = b | 128;
        }

        v.push(b);
    }

    return v;
}

*/