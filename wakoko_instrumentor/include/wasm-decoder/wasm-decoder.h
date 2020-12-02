#ifndef WASM_DECODER
#define WASM_DECODER
#include <stdio.h>
#include <string.h>
#include <include/utils/utils.h>
#include <include/utils/leb128.h>
#include <include/wasm-decoder/opcodes.h>

typedef struct {
	int size;
	int form;
	int param_count;
	Array param_types;
	int ret_count;
	Array return_types;
} FuncTypeSection;


typedef struct {
	unsigned int index;
} FunctionImport;

typedef struct {
	int elem_type;
	int limit;
	unsigned int limit_initial;
	int limit_maximum;
} TableImport;


typedef struct {
	int limit;
	unsigned int limit_initial;
	int limit_maximum;
} MemoryImport;


typedef struct  {
	char content_type;
	char is_mutable;
	int code_size;
	char* init;
} GlobalImport;

typedef struct {
	char content_type;
	char is_mutable;
	int code_size;
	char* init;
} Global;


typedef struct {
	int module_name_len;
	char*  module_name;

	int field_name_len;
	char* field_name;

	int kind;
	void * import_kind; // 

} ImportType;

typedef struct {
	int size;
	int count;
	Array types;
} TypeSection;

typedef struct {
	int size;
	int count;
	Array imports;
} ImportSection;

typedef struct {
	int size;
	unsigned int count;
	int* types;
} FunctionSection;

typedef struct {
	int size;
	unsigned int count;
	Array tables;	
} TableSection;


typedef struct {
	int size;
	int count;	
} DataCountSection;

typedef struct {
	int size;
	unsigned int count;
	Array memories;	
} MemorySection;

typedef struct {
	int size;
	unsigned int count;
	Array globals;	// Global *
} GlobalSection;

typedef struct {
	unsigned int field_len;
	char* field_str;
	char kind;
	unsigned int index;
} ExportEntry;

typedef struct {
	int size;
	unsigned int count;
	Array exports;	
} ExportSection;

typedef struct {
  int size;
  unsigned int index;
} StartSection;


typedef struct {
  unsigned int flag;
  unsigned int index;
  int code_size;
  int elem_type;
  char kind;
  char* init_code_chunk;
  unsigned int fcount;
  int * findexes;
} ElementEntry;


typedef struct {
  int size;
  unsigned int count;
  Array  elements;	
} ElementSection;


typedef struct {
	unsigned int n;
	char valtype;
}  LocalDef;

typedef struct {
	unsigned int size;
	unsigned int local_count;
	Array locals;
	int code_size;
	char* code_chunk;
} FunctionBody;

typedef struct {
  int size;
  unsigned int count;
  Array functions;	
} CodeSection;

#define SEG_PASSIVE 1        // bit 0: Is passive
#define	SEG_EXPLICIT_INDEX 2  // bit 1: Has explict index (Implies table 0 if absent)
#define	SEG_DECLARAED  3       // Only used for declared segments
#define SEG_USE_EXPRS  4
typedef struct {
  unsigned int index;
  unsigned int size;
  unsigned int flag;
  int code_size;
  char* init_chunk_code;
  char* data;
} DataSegment;

typedef struct {
  int size;
  unsigned int count;
  Array segments;	
} DataSection;

typedef struct {
  int size;
  unsigned int name_len;
  char* name;	
  int data_size;
  char* data;
} CustomSection;


typedef struct {
	unsigned int size;
	unsigned int section_offset;
	unsigned int type;
	void* instance; // ImportSectionPtr, TypeSectionPtr
} Section;


typedef struct{

	char* payload;
	int position;
	int count;
	int size;
	int version;

	Array sections;

	// DIRECT ACCESS FOR LATER USAGE
	char has_global_section;
	char has_code_section;
	char has_export_section;

	GlobalSection *  globalSection;  
	CodeSection * codeSection;
	ExportSection * exportSection;
} WASMModule;

#define READ_AND_CONSUME_BUFFER_PIECE(buffer, offset, size, dst) memcpy(dst, buffer + offset, size); BYTE_OFFSET += size;

Section* parse_section(WASMModule* module);

WASMModule* parse_wasm(char* bytes, unsigned int size);

void free_generic_arrays(WASMModule* module);

#endif