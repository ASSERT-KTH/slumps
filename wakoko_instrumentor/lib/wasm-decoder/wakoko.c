#include <include/wasm-decoder/wasm-decoder.h>
#include <include/wasm-decoder/wasm-encoder.h>
#include <include/wasm-decoder/wakoko.h>



void bypass_sencoding(int size, char* current_code, int* current_index, char* instrumented_code, int* instrumented_index){
	char byte = current_code[(*current_index)++];
	instrumented_code[(*instrumented_index)++] = byte;
	int mask = (-1 << (size - 1)) & 0x7f;

	//DEBUG("byte %02x %d %d\n", byte & 0x7f, size, mask);

	if(size >= 7 || (byte & mask) == 0 || (byte & mask) == mask ){
		if( byte & 0x80 ){
			bypass_sencoding(size - 7, current_code, current_index, instrumented_code, instrumented_index);
		}
	}
}


void bypass_fencoding(int size, char* current_code, int* current_index, char* instrumented_code, int* instrumented_index){
	
	size = size/8;
	while(size > 0){
		char byte = current_code[(*current_index)++];
		instrumented_code[(*instrumented_index)++] = byte;
		size--;
	}
}

void bypass_blocktype(char* instrumented_out, char* current_code, int *instrumented_index, int* current_index){
	char block_type = current_code[*(current_index)];

	if(block_type == 0x40 // empty
	|| block_type == 0x7f 
	|| block_type == 0x7d 
	|| block_type == 0x7c 
	|| block_type == 0x7e){
		DEBUG2("Regular block type one byte 0x%02x\n", block_type);
		instrumented_out[(*instrumented_index)++] = block_type;
		(*current_index)++;
	}else{
		DEBUG2("Custom block type %02x\n", block_type);
		bypass_sencoding(32, current_code, current_index, instrumented_out, instrumented_index);
		
	}

}

char* create_id(int id, int * size){
	char *idStr = (char*)allocate_and_register(NEW_ID_BUFFER_SIZE);
	int index = 1;
	idStr[NEW_ID_BUFFER_SIZE - 1] ='c';

	while(id){
		int remainder = id%10;

		idStr[NEW_ID_BUFFER_SIZE - index++] = '0' + remainder;
		id = id/10;
	}
	*(size) = index;

	idStr[NEW_ID_BUFFER_SIZE - index] ='c';
	return idStr + (NEW_ID_BUFFER_SIZE - index);
}


// TODO add one by size
int bypass_var_uint(char* original_buffer, int* original_offset, char* instrumented_buffer, int* instrumented_offset){

	unsigned shift = 0;
	int result = 0;
	while(1){
		char byte = original_buffer[(*original_offset)++];
		instrumented_buffer[(*instrumented_offset)++] = byte;

		result |= (byte & 0x7f) << shift;

		if((byte & 0x80) == 0)
			break;

		shift += 7;
	}

	return result;
}


char bypass_byte(char* original_buffer, int* original_offset, char* instrumented_buffer, int* instrumented_offset){

	char byte = original_buffer[(*original_offset)++];
	instrumented_buffer[(*instrumented_offset)++] = byte;

	return byte;
}
void instrument(char* instrumented_out, int* instrumentation_index, int pad, int* globals){
	
	instrumented_out[(*instrumentation_index)++] = GET_GLOBAL;
	encode_var_uint_leb128((*globals) + pad, 0, instrumented_out + *instrumentation_index, instrumentation_index);
	instrumented_out[(*instrumentation_index)++] = I32_CONST;
	encode_var_uint_leb128(1, 0, instrumented_out + *instrumentation_index, instrumentation_index);
	instrumented_out[(*instrumentation_index)++] = I32_ADD;
	instrumented_out[(*instrumentation_index)++] = SET_GLOBAL;
	encode_var_uint_leb128(pad + (*globals)++, 0, instrumented_out + *instrumentation_index, instrumentation_index);

}

void dump_function_body(char* code_body, int size){

	DEBUG("\n");

	for(int i =0; i < size ; i++){
		DEBUG("0x%02x ", code_body[i] & 0xff);
	}

	DEBUG("\n");
}

void make_coverage_instrumentation(WASMModule* module, int *global_pad, int* global_count, int threshold, float instrumentation_probability){
	// traverse code section injecting global callbacks
	
	FunctionBody body;

	char CODE_BUFFER[NEW_CODE_BUFFER_SIZE];
	int globals = 0;
	int pad = 50;	

	GlobalSection * global_section = module->globalSection;

	int previous_global_count = global_section->globals.count;

	if(pad <= previous_global_count)
		pad = previous_global_count + 1;

	if(module->codeSection == NULL){
		// NOTHING to instrument
		INFO("Nothing to instrument, check the size of the code section\n");
		return;
	}
	//INFO("INSTRUMENTING %d \n", module->codeSection->count);
	int injected = 0;
	for(int i = 0; i < module->codeSection->count; i++){
		get_element(&module->codeSection->functions, i, &body);
		int position = 0;

		// FUNCTION START
		// dump function Body
		instrument(CODE_BUFFER, &position, pad, &globals);

		int inject = 0;
		int previous_index = 0;
		for(int j = 0; j < body.code_size;){
			char OPCODE = body.code_chunk[j++] & 0xff;

			// INJECT CODE HERE
			if(inject && (j - previous_index) >= threshold){
				//INFO("PREVIOUS %d CURRENT %d \n", previous_index, j);
			
				DEBUG("INJECTING...%02x\n", OPCODE);
				instrument(CODE_BUFFER, &position, pad, &globals);
				inject = 0;

				previous_index = j;
			}
			CODE_BUFFER[position++] = OPCODE;

			switch (OPCODE)
			{
				// variable access
				case MIX_OPERATION:
				{
					char type = bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);

					if(type < 0x0 || type > 0x0e)
					{
						ERROR("Invalid float to int operation %02x\n", type);
						exit(1);
					}

					DEBUG("MIX_OPERATION %02x %02x\n", OPCODE & 0xff, type);
					switch (type)
					{
						case MEMORY_INIT:
							bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
 							bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);
							break;
						case DATA_DROP:
							bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
						break;
						case MEMORY_COPY:
							bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);
 							bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);
						break;
						case MEMORY_FILL:
							bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);
						break;
						case TABLE_INIT:
							bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
 							bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);
						break;
						case ELEM_DROP:
							bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
						break;
						case TABLE_COPY:
							bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);
 							bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);
							break;
						default:
						
							break;
					}
					break;
				}
				case GET_LOCAL:
				{
					DEBUG2("GET LOCAL\n");
					bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
				}
				break;
				case GET_GLOBAL:
				{
					DEBUG2("GET GLOBAL\n");
					bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
				}
				break;
				case SET_GLOBAL:
				{
					int index = bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
					DEBUG2("SET GLOBAL %d\n", index);
				}
				break;
				case SET_LOCAL:		
					{			
						int index = bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
						DEBUG2("SET LOCAL %d\n", index);
					}
				break;
				case TEE_LOCAL:
				{
					DEBUG2("LOCAL TEE\n");
					bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
				}
				break;

				// Constants
				case I32_CONST:
				{
					DEBUG2("I32 CONST\n");
					bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
				}
				break;
				case I64_CONST:
				{
					DEBUG2("I64 CONST\n");
					bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
				}
				break;
				case F32_CONST:
				{
					DEBUG2("F32 CONST\n");
					bypass_fencoding(32, body.code_chunk, &j, CODE_BUFFER, &position);
				}
				break;
				case F64_CONST:
				{
					DEBUG2("F64 CONST\n");
					bypass_fencoding(64, body.code_chunk, &j, CODE_BUFFER, &position);
				}
				break;
				// Operations
				case TRY:
				case CATCH:
				case THROW:
				case BrOnExn:
				case RETHROW:
				case I32_EQUAL_Z :
				case I32_EQUAL :
				case I32_NO_EQUAL :
				case I32_LESS_THAN_SIGNED :
				case I32_LESS_THAN :
				case I32_GREATER_THAN_SIGNED :
				case I32_GREATER_THAN :
				case I32_LESS_EQUAL_THAN_SIGNED :
				case I32_LESS_EQUAL_THAN :
				case I32_GREATAER_EQUAL_THAN_SIGNED :
				case I32_GREATER_EQUAL_THAN :
				// i64
				case I64_EQUAL_Z :
				case I64_EQUAL :
				case I64_NO_EQUAL :
				case I64_LESS_THAN_SIGNED :
				case I64_LESS_THAN :
				case I64_GREATER_THAN_SIGNED :
				case I64_GREATER_THAN :
				case I64_LESS_EQUAL_THAN_SIGNED :
				case I64_LESS_EQUAL_THAN :
				case I64_GREATER_EQUAL_THAN_SIGNED :
				case I64_GREATER_EQUAL_THAN :
				//f32
				case F32_EQUAL_Z :
				case F32_NO_EQUAL :
				case F32_LESS_THAN :
				case F32_GREATER_THAN :
				case F32_LESS_EQUAL_THAN :
				case F32_GREATER_EQUAL_THAN :
				//f64
				case F64_EQUAL_Z :
				case F64_NO_EQUAL :
				case F64_LESS_THAN :
				case F64_GREATER_THAN :
				case F64_LESS_EQUAL_THAN :
				case F64_GREATER_EQUAL_THAN :
				case I32_CLZ:
				case I32_CTZ:
				case I32_POP_CNT:
				case I32_ADD:
				case I32_SUB:
				case I32_MUL:
				case I32_DIV_SIGNED:
				case I32_DIV:
				case I32_REM_SIGNED:
				case I32_REM:
				case I32_AND:
				case I32_OR:
				case I32_XOR:
				case I32_SHL:
				case I32_SHR_SIGNED:
				case I32_SHR:
				case I32_ROTL:
				case I32_ROTR:
				case I64_CLZ:
				case I64_CTZ:
				case I64_POP_CNT:
				case I64_ADD:
				case I64_SUB:
				case I64_MUL:
				case I64_DIV_SIGNED:
				case I64_DIV:
				case I64_REM_SIGNED:
				case I64_REM:
				case I64_AND:
				case I64_OR:
				case I64_XOR:
				case I64_SHL:
				case I64_SHR_SIGNED:
				case I64_SHR:
				case I64_ROTL:
				case I64_ROTR:
				case F32_ABS:
				case F32_NEG:
				case F32_CEIL:
				case F32_FLOOR:
				case F32_TRUNC:
				case F32_NEAREST:
				case F32_SQRT:
				case F32_ADD:
				case F32_SUB:
				case F32_MUL:
				case F32_DIV:
				case F32_MIN:
				case F32_MAX:
				case F32_COPY_SIGN:
				case F64_ABS:
				case F64_NEG:
				case F64_CEIL:
				case F64_FLOOR:
				case F64_TRUNC:
				case F64_NEAREST:
				case F64_SQRT:
				case F64_ADD:
				case F64_SUB:
				case F64_MUL:
				case F64_DIV:
				case F64_MIN:
				case F64_MAX:
				case F64_COPY_SIGN:
				case WRAP_I32_I64:
				case TRUNC_CONV_I32_F32_SIGNED:
				case TRUNC_CONV_I32_F32:
				case TRUNC_CONV_I32_F64_SIGNED:
				case TRUNC_CONV_I32_F64:
				case EXTEND_I32_8S:
				case EXTEND_I32_I64_SIGNED:
				case EXTEND_I64_32S:
				case EXTEND_I32_16S:
				case EXTEND_I64_8S:
				case EXTEND_I64_16S:
				case EXTEND_I32_I64:
				case TRUNC_CONV_I64_F32_SIGNED:
				case TRUNC_CONV_I64_F32:
				case TRUNC_CONV_I64_F64_SIGNED:
				case TRUNC_CONV_I64_F64:
				case CONVERT_F32_F64_SIGNED:
				case CONVERT_F32_F64:
				case CONVERT_F32_I64_SIGNED:
				case CONVERT_F32_I64:
				case DEMOTE_F32_I64:
				case CONVERT_F64_I32_SIGNED:
				case CONVERT_F64_I32:
				case CONVERT_F64_I64_SIGNED:
				case CONVERT_F64_I64:
				case CONVERT_F64_F32:
				case REINTERPRET_I32_F32:
				case REINTERPRET_I64_F64:
				case REINTERPRET_F32_I32:
				case REINTERPRET_F64_I64:
				{
					DEBUG2("0x%02x\n", OPCODE & 0xff);
				}
					break;
				// MEMORY
				case  CURRENT_MEMORY:
				{
					DEBUG2("CURRENT MEMORY\n", OPCODE & 0xff);
				}
				break;
				case  GROW_MEMORY:
				{
					DEBUG2("GROW MEMORY\n", OPCODE & 0xff);
				}
				break;
				case I32_STORE8:
				case I32_STORE16:
				case I32_STORE:
				case F32_STORE:
				case F64_STORE:
				case I64_STORE16:
				case I64_STORE32:
				case I64_STORE8:
				case I64_STORE:
				{
					DEBUG2("MEMORY STORE\n");
					bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // address
					bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // offset
				}
				break;
				case ATOMIC_OPERATION:
				{
					DEBUG("ATOMIC %02x\n", OPCODE);
					char CODE = bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);

					switch (CODE)
					{
						case ATOMIC_FENCE:
						{
							char FENCE_CONST = bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);
						}
						break;
						default:
						{
							char MEMARG_TYPE = bypass_byte(body.code_chunk, &j, CODE_BUFFER, &position);
							bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // offset
						}
						break;
					}
				}
				break;
				case F32_MEMORY_LOAD:
				case F64_MEMORY_LOAD:
				case I32_MEMORY_LOAD:
				case I32_S16_MEMORY_LOAD:
				case I32_S8_MEMORY_LOAD:
				case I32_U16_MEMORY_LOAD:
				case I32_U8_MEMORY_LOAD:
				case I64_MEMORY_LOAD:
				case I64_S16_MEMORY_LOAD:
				case I64_S32_MEMORY_LOAD:
				case I64_S8_MEMORY_LOAD:
				case I64_U16_MEMORY_LOAD:
				case I64_U32_MEMORY_LOAD:
				case I64_U8_MEMORY_LOAD:
				{
					DEBUG2("MEMORY LOAD\n");
					bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // address
					bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // offset
				}
				break;
				case UNREACHABLE:
				{
					DEBUG2("UNRECHEABLE\n");
				}
					break;
				case NOP:
				{
					DEBUG2("NOP\n");
				}
					break;
				case IF:
				{
					DEBUG2("Entering IF \n");
					bypass_blocktype(CODE_BUFFER, body.code_chunk, &position, &j);
					inject = 1;
				}
				break;
					
				case ELSE:
					{
						DEBUG2("Entering IF else\n");
						inject = 1;
					}
					break;

				case BR:
					{
						DEBUG2("BR \n");
						bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // LBLIDX
					}
					break;

				case BR_IF:
					{
						DEBUG2("BR IF\n", position);
						bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // LBLIDX
						inject = 1;
					}
					break;
				case LOOP:
					{
						DEBUG2("Entering loop %d\n", position);
						bypass_blocktype(CODE_BUFFER, body.code_chunk, &position, &j);
						inject = 1;
					}
					break;
				case BLOCK:
					{
						DEBUG2("Entering block %d\n", position);
						bypass_blocktype(CODE_BUFFER, body.code_chunk, &position, &j);
						inject = 1;
					}
					break;
				case RETURN:
					{
						DEBUG2("RETURN\n");
					}
					break;
				case DROP:
					{
						DEBUG2("DROP\n");
					}
					break;
				case SELECT:
					{
						DEBUG2("SELECT\n");
					}
					break;
				case BR_TABLE:
					{
						DEBUG2("BR_TABLE\n\t");
						int size = bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // LBLIDX

						for(int i = 0; i < size; i++){
							int val =bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position);
							DEBUG2("%d ",  val);
						}
						DEBUG2("\n");
						bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // LBLIDX

					}
					break;
				case CALL:
				case CALL_INDIRECT:
					{
						DEBUG2("CALL 0x%02x\n", OPCODE);
						bypass_var_uint(body.code_chunk, &j, CODE_BUFFER, &position); // fidxIDX
						if(OPCODE == CALL_INDIRECT){
							CODE_BUFFER[position++] = 0x00;
							j++;
						}
					}
					break;
				case OPCODE_END:
					{
						DEBUG2("End %d\n", position);
						if(j != body.code_size)
							inject = 1; 
					}
					break;
				
				default:
					CODE_BUFFER[position++] = OPCODE;
					ERROR("UNKNOWN OPCODE %02x\n", OPCODE);
					dump_function_body(body.code_chunk, body.code_size);
					exit(1);
					break;
			}

		}

    	body.code_chunk = (char*)allocate_and_register(position);
		memcpy(body.code_chunk, CODE_BUFFER, position);
		

		body.size = body.size + (position - body.code_size);
		body.code_size = position;

		set_element(&module->codeSection->functions, i, &body);
		//memset(CODE_BUFFER, 0, NEW_CODE_BUFFER_SIZE);
	}
	module->codeSection->size = recalculate_code_section_size(module->codeSection);

	INFO("Probes inserted %d\n", globals);
	
	int count = 0;

	char PADD_GLOBAL_INIT[] = {I32_CONST,
			0,
			OPCODE_END};

	for(int i = 0; i < pad - previous_global_count; i++){
		GlobalImport * g = (GlobalImport*)allocate_and_register(sizeof(GlobalImport));
		g->content_type = 0x7f;
		g->is_mutable = 0x1;


		g->code_size = 3;
		g->init = PADD_GLOBAL_INIT;
		count++;
		insert_array(&global_section->globals, g);
	}


	char CV_GLOBAL_INIT[] = {I32_CONST,
			0,
			OPCODE_END};

	for(int i = 0; i < globals; i++){
		GlobalImport * g = (GlobalImport*)allocate_and_register(sizeof(GlobalImport));
		g->content_type = 0x7f;
		g->is_mutable = 0x1;


		g->code_size = 3;
		g->init = CV_GLOBAL_INIT;
		count++;
		insert_array(&global_section->globals, g);
	}


	global_section->count += count;
	
	INFO("Extra globals added %d %d %d\n", global_section->count + count, pad, previous_global_count);

	global_section->size = recalculate_global_section_size(global_section);
	

	
	ExportSection * exportSection = module->exportSection;
	
	INFO("Starting exporting\n");

	for(int i = 0; i < globals; i++){
		ExportEntry * cvEntry = (ExportEntry*)allocate_and_register(sizeof(ExportEntry));
		
		cvEntry->index = i + pad;
		cvEntry->kind = 0x03;
		cvEntry->field_str= create_id(i + pad, &cvEntry->field_len);

		DEBUG("Exported field name %s\n", cvEntry->field_str);


		insert_array(&exportSection->exports, cvEntry);
	}

	DEBUG("Recalculating section size\n");
	exportSection->count += globals;
	exportSection->size = recalculate_exports_section_size(exportSection);

	*global_pad = pad;
	*global_count = globals;

	INFO("Instrumentation done, %d  probes inserted\n", globals);
}