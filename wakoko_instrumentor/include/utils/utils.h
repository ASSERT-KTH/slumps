
#ifndef UTILS
#define UTILS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLUE    "\x1b[34m"
#define ANSI_COLOR_MAGENTA "\x1b[35m"
#define ANSI_COLOR_CYAN    "\x1b[36m"
#define ANSI_COLOR_RESET   "\x1b[0m"


typedef unsigned long  uint32;
typedef unsigned int  uint16;

uint32 readUint32LE(char* buffer, int * offset);
uint16 readUint16LE(char* buffer, int * offset);
void writeUint32LE(char* out, int number, int * pointer);

char readInt8(char* buffer, int* offset);

void* allocate_and_register(int sz);

void free_all();

typedef struct {
  void * data;
  int count;
  int membersize;
  int size;
} Array;

typedef enum {
	INFO2STD,
	DEBUG2STDERR,
	ERROR2STDERR
} LOGTYPE;

void init_array(Array *a, int initialSize, int membersize);

void insert_array(Array *a, void * element);

void get_element(Array *a, unsigned int position, void * element);

void set_element(Array *a, unsigned int position, void * element);

void free_array(Array *a);


int get_encoding_size(unsigned int value, unsigned int padding);

void LOG_ERROR(char* msg);

void LOG_INFO(char* msg);



void _proxy_log(LOGTYPE log_type, const char *fmt, ...)
	__attribute__((format (printf, 2, 3)));

#define LOG(level, fmt,...) _proxy_log(level, fmt, ##__VA_ARGS__)

#define DEBUG(fmt,...) _proxy_log(DEBUG2STDERR, ANSI_COLOR_YELLOW fmt ANSI_COLOR_RESET, ##__VA_ARGS__) 


#ifdef WAKOKO_PRINT_OPCODE 
	#define DEBUG2(fmt,...) _proxy_log(DEBUG2STDERR, ANSI_COLOR_YELLOW fmt ANSI_COLOR_RESET, ##__VA_ARGS__) 
#else
	#define DEBUG2(fmt,...)  
#endif

#define INFO(fmt,...) _proxy_log(INFO2STD, fmt, ##__VA_ARGS__) 
#define ERROR(fmt,...) _proxy_log(ERROR2STDERR, ANSI_COLOR_RED fmt ANSI_COLOR_RESET, ##__VA_ARGS__)




#endif