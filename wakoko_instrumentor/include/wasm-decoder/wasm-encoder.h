
#ifndef WASM_ENCODING
#define WASM_ENCODING
#include <include/wasm-decoder/wasm-decoder.h>
#define MAX_OUT_SIZE (1 << 28) 

int encode_wasm(WASMModule* module, char* out);


int recalculate_code_section_size(CodeSection* section);
int recalculate_global_section_size(GlobalSection* section);
int recalculate_exports_section_size(ExportSection* section);

// TODO add the same for all the sections

#endif