
#include <stdio.h>
#include <stdlib.h>
#include <include/utils/utils.h>
#include <include/wasm-decoder/wasm-decoder.h>
#include <include/wasm-decoder/wakoko.h>
#include <include/wasm-decoder/wasm-encoder.h>

int main(int argc, char * argv[]){
	if(argc > 2){
		FILE* in_file = fopen(argv[1], "rb");
		if (in_file == NULL) 
		{   
			ERROR("Error! Could not open file\n"); 
			exit(-1); // must include stdlib.h 
		} 
        fseek(in_file, 0L, SEEK_END);
		size_t sz = ftell(in_file);
		rewind(in_file);
		
		char bytes[sz];
		fread(bytes, sz, 1, in_file);
		fclose(in_file);

		WASMModule* module = parse_wasm(bytes, sz);	
		ERROR("CORRECT DECODING %d\n", module->size);

		#ifndef IDEM
		ERROR("INSTRUMENTING\n");
		int pad;
		int globals;
		int instruction_count;

		make_coverage_instrumentation(module, &pad, &globals, 0, 1.0, &instruction_count);
		#endif

		char*  out = (char*)allocate_and_register(MAX_OUT_SIZE);

		int toWrite = encode_wasm(module, out);
		ERROR("CORRECT ENCODING\n");

		FILE* outFile = fopen(argv[2], "w");

		if(outFile == NULL){
			ERROR("Error! Could not open file\n"); 
			exit(-1); // must include stdlib.h 
		}

		fwrite(out, toWrite, 1, outFile);
		fclose(outFile);

		// deallocate all arrays in module
		free_generic_arrays(module);

		free_all();

		// write JSON INFO to stdout

		INFO("{\n");

		INFO("\t\"totalInstructions\": %d,\n", instruction_count);
		INFO("\t\"totalBasicBlocks\": %d,\n", globals);
		INFO("\t\"pad\": %d,\n", pad);

		INFO("\n}\n");

	}
	return 0;
}