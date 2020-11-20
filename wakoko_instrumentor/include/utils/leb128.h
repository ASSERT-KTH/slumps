#define MAX_LEB_SIZE 10

unsigned int decode_var_int32(char *buffer, int* offset, int size);

unsigned int decode_var_uint32(char* buffer, int* offset);

void encode_var_uint_leb128(unsigned int value, unsigned int padding, char* output, int* size);

