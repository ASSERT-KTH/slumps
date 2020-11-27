#include <stdio.h>
#include <include/utils/utils.h>
#include <stdarg.h>


uint32 readUint32LE(char* buffer, int* offset){
	uint32 result = 0;

	result = (0xFF & buffer[*offset]);
	result |= ((0xFF & buffer[*offset + 1]) << 8);
	result |= ((0xFF & buffer[*offset + 2]) << 16);
	result |= ((0xFF & buffer[*offset + 3]) << 24);

	*offset = *offset + 4;
	return result;	
}

uint16 readUint16LE(char* buffer, int* offset){
	uint16 result = (0xFF & buffer[*offset]);
	result |= ((0xFF & buffer[*offset + 1]) << 8);

	*offset = *offset + 4;
	return result;	
}

void writeUint32LE(char* out, int number, int * pointer){
	out[3] = (number >>  24) & 0xFF;
	out[2] = (number >>  16) & 0xFF;
	out[1] = (number >>  8) & 0xFF;
	out[0] = (number) & 0xFF;
	
	(*pointer) += 4;
}


char readInt8(char* buffer, int* offset){
	char result = (0xff & buffer[*offset]);
	*offset = *offset + 1;
	return result;	
}


static int allocation_index = 0;

void* allocate_and_register(int sz){
	return (void*)malloc(sz);
}

void register_ptr(void * ptr){
	
}

void free_all(){
	
}


void init_array(Array *a, int initialSize, int membersize) {
  a->data = (void *) malloc(initialSize*membersize);
  a->count = 0;
  a->size = initialSize;
  a->membersize = membersize;
}


void insert_array(Array *a, void * element) {
  // a->used is the number of used entries, because a->array[a->used++] updates a->used only *after* the array has been accessed.
  // Therefore a->used can go up to a->size 
  if (a->count == a->size) {
	DEBUG("Increasing size %d\n", a->size);
    a->size *= 2;
    a->data = realloc(a->data, a->size*a->membersize);
  }

  void* target = (char*)a->data + (a->count*a->membersize);
  a->count++;
  memcpy(target, element, a->membersize);
}


void get_element(Array *a, unsigned int position, void * element) {
  void* target = (char*)a->data + (position*a->membersize);
  memcpy(element, target, a->membersize);
}

void set_element(Array *a, unsigned int position, void * element) {
  void* target = (char*)a->data + (position*a->membersize);
  memcpy(target,element, a->membersize);
}

void free_array(Array *a) {
  a->data = NULL;
  a->count = a->size = 0;
}
void _proxy_log(LOGTYPE level, const char *fmt, ...) {
    
	va_list arg;
    FILE *log_file = (level == ERROR2STDERR || level == DEBUG2STDERR) ? stderr : stdout;
	
	va_start(arg, fmt);
    vfprintf(log_file, fmt, arg);
    va_end(arg);

	//#ifndef __EMSCRIPTEN__
	//fflush(log_file);
	//fsync(fileno(log_file));
	//#endif
}

