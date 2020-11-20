#include <include/wasm-decoder/wasm-decoder.h>


int recalculate_code_section_size(CodeSection* section){
	
	int total = 0;

	FunctionBody s;
	for(int i = 0; i < section->count; i++){
		get_element(&section->functions, i, &s);
		total += s.code_size;

		LocalDef ld;
		for(int j = 0; j < s.local_count; j++){
			get_element(&s.locals, j, &ld);
			total += get_encoding_size(ld.valtype, 0);; // ld -> valtype
			total += get_encoding_size(ld.n, 0);
		}

		total += get_encoding_size(s.local_count, 0);
		total += get_encoding_size(s.size, 0);
	}

	int size = get_encoding_size(/*section type*/section->count, 0);

	return total + size;
}


int recalculate_global_section_size(GlobalSection* section){
	
	int total = 0;

	GlobalImport s;
	for(int i = 0; i < section->count; i++){
		get_element(&section->globals, i, &s);
		total += s.code_size;
		total += get_encoding_size(s.content_type, 0);
		total += get_encoding_size(s.is_mutable, 0);
	}

	int size = get_encoding_size(/*section type*/section->count, 0);

	return total + size;
}


int recalculate_exports_section_size(ExportSection* section){
	
	int total = 0;

	ExportEntry s;
	for(int i = 0; i < section->count; i++){
		get_element(&section->exports, i, &s);

		total += s.field_len;
		total += get_encoding_size(s.field_len, 0);
		total += get_encoding_size(s.index, 0);
		total += 1; // kind
	}

	int size = get_encoding_size(/*section type*/section->count, 0);

	DEBUG("NEW EXPORT SECTION SIZE %d %d\n", section->size, total +  size);
	return total + size;
}


void encode_section_header(Section * section, char* out, int* position){

	encode_var_uint_leb128(section->type, 0, out + *position, position);
}

void encode_types_section(TypeSection* typesSection, char* out, WASMModule* module, int* position){

	DEBUG("Encoding types section %d size %d\n", typesSection->count, typesSection->size);

	encode_var_uint_leb128(typesSection->size, 0, out + *position, position);
	// Section payload
	encode_var_uint_leb128(/*section type*/typesSection->count, 0, out + *position, position);

	
	FuncTypeSection s;
	for(int i = 0; i < typesSection->count; i++){
		get_element(&typesSection->types, i, &s);

		// write form

		(out + *position)[0] = 0x60;
		(*position)+=1;	

		encode_var_uint_leb128(s.param_count, 0, out + *position, position);

		DEBUG("%d: ", i);
		// write param types
		memcpy((out + *position), s.param_types.data, s.param_count);
		(*position)+=s.param_count;
		char ctpe;
		for(int j = 0; j < s.param_count; j++){
			get_element(&s.param_types, j, &ctpe);

			if(ctpe != 0x7f && ctpe != 0x7e && ctpe != 0x7d && ctpe != 0x7c){
				ERROR("Invalid numberic type %02x\n", ctpe);
				//exit(1);
			}
			DEBUG(" %02x ", ctpe);
		}

		DEBUG(" Params %d\n", s.param_count);
		// return_count
		encode_var_uint_leb128(s.ret_count, 0, out + *position, position);

		// write return types
		//for(int j = 0; j < s.ret_count; j++)
		//	(out + *position)[j] = s.return_types[j];

		memcpy((out + *position), s.return_types.data, s.ret_count);
		(*position)+=s.ret_count;
	}

}


void encode_table_section(TableSection* typesSection, char* out, WASMModule* module, int* position){
	DEBUG("Encoding table section %d size %d\n", typesSection->count, typesSection->size);

	encode_var_uint_leb128(typesSection->size, 0, out + *position, position);

	// Section payload
	encode_var_uint_leb128(/*section type*/typesSection->count, 0, out + *position, position);

	TableImport s;
	for(int i = 0; i < typesSection->count; i++){
		get_element(&typesSection->tables, i, &s);

		(out + *position)[0] = s.elem_type;
		(*position)+=1;

		encode_var_uint_leb128(s.limit, 0, out + *position, position);
		encode_var_uint_leb128(s.limit_initial, 0, out + *position, position);

		if(s.limit)
			encode_var_uint_leb128(s.limit_maximum, 0, out + *position, position);

	}

}

void encode_custom_section(CustomSection* custom_section, char* out, WASMModule* module, int* position){
	DEBUG("Encoding custom section size %d\n", custom_section->size);

	encode_var_uint_leb128(custom_section->size, 0, out + *position, position);

	// Section payload
	encode_var_uint_leb128(/*section type*/custom_section->name_len, 0, out + *position, position);
	memcpy(out + *position, custom_section->name, custom_section->name_len);
	(*position)+=custom_section->name_len;

	memcpy(out + *position, custom_section->data, custom_section->data_size);
	(*position)+= custom_section->data_size;
}


void encode_memory_section(MemorySection* section, char* out, WASMModule* module, int* position){

	encode_var_uint_leb128(section->size, 0, out + *position, position);

	// Section payload
	encode_var_uint_leb128(/*section type*/section->count, 0, out + *position, position);

	MemoryImport s;
	for(int i = 0; i < section->count; i++){
		get_element(&section->memories, i, &s);

		encode_var_uint_leb128(s.limit, 0, out + *position, position);
		encode_var_uint_leb128(s.limit_initial, 0, out + *position, position);

		if(s.limit)
			encode_var_uint_leb128(s.limit_maximum, 0, out + *position, position);

	}

}


void encode_global_section(GlobalSection* section, char* out, WASMModule* module, int* position){
	DEBUG("Encoding global section %d size %d\n", section->count, section->size);

	encode_var_uint_leb128(section->size, 0, out + *position, position);

	// Section payload
	encode_var_uint_leb128(/*section type*/section->count, 0, out + *position, position);

	GlobalImport s;
	for(int i = 0; i < section->count; i++){
		get_element(&section->globals, i, &s);

		(out + *position)[0] = s.content_type;
		(*position)+=1;

		(out + *position)[0] = s.is_mutable;
		(*position)+=1;
		
		memcpy(out + *position, s.init, s.code_size);
		(*position) += s.code_size;
	}

}


void encode_export_section(ExportSection* section, char* out, WASMModule* module, int* position){
	DEBUG("Encoding export section %d size %d\n", section->count, section->size);

	encode_var_uint_leb128(section->size, 0, out + *position, position);

	// Section payload
	encode_var_uint_leb128(/*section type*/section->count, 0, out + *position, position);

	ExportEntry s;
	for(int i = 0; i < section->count; i++){
		get_element(&section->exports, i, &s);

		// write module name
		encode_var_uint_leb128(s.field_len, 0, out + *position, position);
		memcpy(out + *position, s.field_str, s.field_len);
		(*position) += s.field_len;

		
		(out + *position)[0] = s.kind;
		(*position)+=1;
		encode_var_uint_leb128(s.index, 0, out + *position, position);
	}

}


void encode_start_section(StartSection* section, char* out, WASMModule* module, int* position){
	// Section payload
	DEBUG("Encoding start section %d size %d\n", section->index, section->size);

	encode_var_uint_leb128(section->size, 0, out + *position, position);
	encode_var_uint_leb128(/*section type*/section->index, 0, out + *position, position);
}


void encode_code_section(CodeSection* section, char* out, WASMModule* module, int* position){

	DEBUG("Encoding code section %d size %d\n", section->count, section->size);

	encode_var_uint_leb128(
		section->size, 
		0, 
		out + *position, 
		position);
	// Section payload
	encode_var_uint_leb128(section->count, 0, out + *position, position);

	FunctionBody s;
	for(int i = 0; i < section->count; i++){
		get_element(&section->functions, i, &s);

		// write module name
		encode_var_uint_leb128(s.size, 0, out + *position, position);
		encode_var_uint_leb128(s.local_count, 0, out + *position, position);

		LocalDef local;
		for(int j = 0; j < s.local_count; j++){
			get_element(&s.locals, j, &local);
			encode_var_uint_leb128(local.n, 0, out + *position, position);
			(out + *position)[0] = local.valtype;
			(*position)+=1;
		}

		memcpy(out + *position, s.code_chunk, s.code_size);
		(*position)+=s.code_size;
	}

}


void encode_element_section(ElementSection* section, char* out, WASMModule* module, int* position){
	DEBUG("Encoding element section %d size %d\n", section->count, section->size);

	encode_var_uint_leb128(section->size, 0, out + *position, position);

	// Section payload
	encode_var_uint_leb128(/*section type*/section->count, 0, out + *position, position);

	ElementEntry s;
	for(int i = 0; i < section->count; i++){
		get_element(&section->elements, i, &s);

		encode_var_uint_leb128(s.flag, 0, out + *position, position);

		if ((s.flag & (SEG_PASSIVE | SEG_EXPLICIT_INDEX)) == SEG_EXPLICIT_INDEX) {
			encode_var_uint_leb128(s.index, 0, out + *position, position);
		}

		if(!(s.flag & SEG_PASSIVE)){
			memcpy(out + *position, s.init_code_chunk, s.code_size);
			(*position)+=s.code_size;
		}

		if (s.flag & (SEG_PASSIVE | SEG_EXPLICIT_INDEX)) {
			DEBUG("Parsing elem type %d\n", s.flag); 
			if (s.flag & SEG_USE_EXPRS) {
				ERROR("NIT IMPLEMENTED\n");
				exit(1);
				// decode_var_int32(module->payload, &module->position, 32);
			} else {
				(out + *position)[0] = s.kind;
				(*position)++;
			}
		}


		encode_var_uint_leb128(s.fcount, 0, out + *position, position);
		for(int j = 0; j < s.fcount; j++){
			int fidx = s.findexes[j];
			encode_var_uint_leb128(fidx,0, out + *position, position);
		}
	}

}


void encode_data_section(DataSection* section, char* out, WASMModule* module, int* position){
	DEBUG("Encoding data section %d size %d\n", section->count, section->size);

	encode_var_uint_leb128(section->size, 0, out + *position, position);
	// Section payload
	encode_var_uint_leb128(/*section type*/section->count, 0, out + *position, position);

	DataSegment s;
	for(int i = 0; i < section->count; i++){
		get_element(&section->segments, i, &s);
		DEBUG2("encoding data flag(%d) segment\n", s.flag);

		encode_var_uint_leb128(s.flag, 0, out + *position, position);

		if(s.flag & SEG_EXPLICIT_INDEX){
			encode_var_uint_leb128(s.index, 0, out + *position, position);

			DEBUG2("encoding data index(%d) segment\n", s.index);
		}
		if(!(s.flag & SEG_PASSIVE)){

			DEBUG2("encoding data init size(%d) segment\n", s.code_size);
			memcpy(out + *position, s.init_chunk_code, s.code_size);
			(*position)+=s.code_size;
		}

		encode_var_uint_leb128(s.size, 0, out + *position, position);

		DEBUG2("encoding data size(%d) segment\n", s.size);
		memcpy(out + *position, s.data, s.size);
		(*position)+=s.size;
	}

}


void encode_data_count_section(DataCountSection* section, char* out, WASMModule* module, int* position){
	DEBUG("Encoding data count section %d size %d\n", section->count, section->size);

	encode_var_uint_leb128(section->size, 0, out + *position, position);
	encode_var_uint_leb128(section->count, 0, out + *position, position);
}


void encode_function_section(FunctionSection* section, char* out, WASMModule* module, int* position){
	DEBUG("Encoding function count %d section size %d\n", section->count, section->size);

	encode_var_uint_leb128(section->size, 0, out + *position, position);
	// Section payload
	encode_var_uint_leb128(/*section type*/section->count, 0, out + *position, position);

	for(int i = 0; i < section->count; i++){
		// write form
		encode_var_uint_leb128(section->types[i], 0, out + *position, position);
	}

}

void encode_import_section(ImportSection* typesSection, char* out, WASMModule* module, int* position){
	DEBUG("Encoding import count %d section size %d\n", typesSection->count, typesSection->size);

	encode_var_uint_leb128(typesSection->size, 0, out + *position, position);
	// Section payload
	encode_var_uint_leb128(/*section type*/typesSection->count, 0, out + *position, position);


	ImportType s;
	for(int i = 0; i < typesSection->count; i++){
		get_element(&typesSection->imports, i, &s);

		// write module name
		encode_var_uint_leb128(s.module_name_len, 0, out + *position, position);
		memcpy(out + *position, s.module_name, s.module_name_len);
		(*position) += s.module_name_len;


		/// write field name
		encode_var_uint_leb128(s.field_name_len, 0, out + *position, position);
		memcpy(out + *position, s.field_name, s.field_name_len + 1);
		(*position) += s.field_name_len;

		(out + *position)[0] = s.kind;
		(*position)++;
		
		switch (s.kind)
		{
			case 0: // Function
				{
					FunctionImport* fImport = (FunctionImport*)s.import_kind;
					encode_var_uint_leb128(fImport->index,0, out + *position , position);
				}
				break;
			case 1: // Table
				{
					TableImport* tImport = (TableImport*)s.import_kind;

					(out + *position)[0] = tImport->elem_type;
					(*position)++;
					encode_var_uint_leb128(tImport->limit,0, out + *position , position);
					encode_var_uint_leb128(tImport->limit_initial,0, out + *position , position);

					if(tImport->limit)
						encode_var_uint_leb128(tImport->limit_maximum,0, out + *position , position);

				}
				break;
			case 2: // Memory
				{
					MemoryImport* mImport = (MemoryImport*)s.import_kind;

					encode_var_uint_leb128(mImport->limit,0, out + *position , position);
					encode_var_uint_leb128(mImport->limit_initial,0, out + *position , position);

					if(mImport->limit)
						encode_var_uint_leb128(mImport->limit_maximum,0, out + *position , position);

				}
				break;
			case 3: // Global
				{

					GlobalImport* gImport = (GlobalImport*)s.import_kind;

					(out + *position)[0] = gImport->content_type;
					(*position)++;

					(out + *position)[0] = gImport->is_mutable;
					(*position)++;

					// check if this global has initial code
				}
				break;
			
			default:
				break;
		}

	}

}

int encode_wasm(WASMModule* module, char* out){

	INFO("ENCODING WASM BINARY\n");
	int position = 0;

	// WRITE MAGIC
	writeUint32LE(out,0x6d736100, &position);

	// WRITE VERSION  1
	writeUint32LE( out + position, module->version,  &position);

	Section s;
	for(int i = 0; i < module->count; i++){
		
		get_element(&module->sections, i, &s);
		encode_section_header(&s, out, &position);
		DEBUG("Encoding type %d size\n", s.type);

		int previous = position;
		switch (s.type)
		{

		case 0:
			{
				CustomSection * customSection = (CustomSection *) s.instance;
				encode_custom_section(customSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(customSection->size, 0) != customSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, customSection->size);
					exit(1);
				}
				#endif
			}
			
		break;
		case 1: // types
			{
				TypeSection * typeS = (TypeSection *) s.instance;
				encode_types_section(typeS, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(typeS->size, 0) != typeS->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, typeS->size);
					exit(1);
				}
				#endif
			}
			break;
		case 2:
			{
				ImportSection * importS = (ImportSection *) s.instance;
				encode_import_section(importS, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(importS->size, 0) != importS->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, importS->size);
					exit(1);
				}
				#endif
			}
			break;
		case 3:
			{
				FunctionSection * funcSection = (FunctionSection *) s.instance;
				encode_function_section(funcSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(funcSection->size, 0) != funcSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, funcSection->size);
					exit(1);
				}
				#endif
			}
			break;
		case 4:
			{
				TableSection * tableSection = (TableSection *) s.instance;
				encode_table_section(tableSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(tableSection->size, 0) != tableSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, tableSection->size);
					exit(1);
				}
				#endif
			}
		break;
		case 5:
			{
				MemorySection * memSection = (MemorySection *) s.instance;
				encode_memory_section(memSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(memSection->size, 0) != memSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, memSection->size);
					exit(1);
				}
				#endif
			}
		break;
		
		case 6:
			{
				GlobalSection * globalSection = (GlobalSection *) s.instance;
				globalSection->size = recalculate_global_section_size(globalSection);
				encode_global_section(globalSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(globalSection->size, 0) != globalSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, globalSection->size);
					exit(1);
				}
				#endif
			}
			break;
		case 7:
			{
				ExportSection * exportSection = (ExportSection *) s.instance;
				exportSection->size = recalculate_exports_section_size(exportSection);
				encode_export_section(exportSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(exportSection->size, 0)!= exportSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, exportSection->size);
					exit(1);
				}
				#endif

			}
		break;
		case 8:
			{
				StartSection * startSection = (StartSection *) s.instance;
				encode_start_section(startSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(startSection->size, 0) != startSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, startSection->size);
					exit(1);
				}
				#endif
			}
		break;
		case 9:
			{
				ElementSection * elemSection = (ElementSection *) s.instance;
				encode_element_section(elemSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(elemSection->size, 0)  != elemSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, elemSection->size);
					exit(1);
				}
				#endif
			}
			
		break;
		case 10:
			{
				CodeSection * codeSection = (CodeSection *) s.instance;
				codeSection->size = recalculate_code_section_size(codeSection);
				encode_code_section(codeSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(codeSection->size, 0) != codeSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, codeSection->size);
					exit(1);
				}
				#endif

			}
			
		break;
		
		case 11:
			{
				DataSection * dataSection = (DataSection *) s.instance;
				encode_data_section(dataSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(dataSection->size, 0) != dataSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, dataSection->size);
					exit(1);
				}
				#endif
			}
			break;
		case 12:
			{
				DataCountSection * dataCSection = (DataCountSection *) s.instance;
				encode_data_count_section(dataCSection, out, module, &position);
				#ifdef IDEM
				if(position - previous - get_encoding_size(dataCSection->size, 0) != dataCSection->size){
					ERROR("INCORRENT ENCODING %d %d\n", position-previous, dataCSection->size);
					exit(1);
				}
				#endif
			}
		break;
		
		
		default:
			ERROR("UNKNNOWN bad parsing\n");
			exit(1);
			break;
		}

	}

	INFO("ENCODED COUNT %d\n", position);

	return position;
}