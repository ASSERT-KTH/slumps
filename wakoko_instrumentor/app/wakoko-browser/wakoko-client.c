
#include <stdio.h>
#include <stdlib.h>
#include <include/utils/utils.h>
#include <include/wasm-decoder/wasm-decoder.h>
#include <include/wasm-decoder/wakoko.h>
#include <include/wasm-decoder/wasm-encoder.h>
#include <emscripten.h>

char* EMSCRIPTEN_KEEPALIVE instrument_wasm(char* byte_char, int size, int * instrumented_size, int* global_pad, int*global_count, int threshold, float instrumentation_probability){
	

	//char bytes[size];
	//memcpy(bytes, byte_char, size);
	WASMModule* module = parse_wasm(byte_char, size);	
	INFO("CORRECT DECODING %d\n", module->size);


	INFO("INSTRUMENTING %d FUNCTIONS\n", module->codeSection->count);
	make_coverage_instrumentation(module, global_pad, global_count,  threshold,  instrumentation_probability);

	char*  out = malloc(MAX_OUT_SIZE);

	int toWrite = encode_wasm(module, out);
	INFO("CORRECT ENCODING %d\n", toWrite);

	//char* dst = malloc(toWrite);
	(*instrumented_size) = toWrite;
	//memcpy(dst, out, toWrite);

	// deallocate all arrays in module
	//free_generic_arrays(module);
	//free_all();

	return out;
}