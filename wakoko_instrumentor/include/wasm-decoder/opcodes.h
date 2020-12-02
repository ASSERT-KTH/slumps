
#ifndef OPCODES
#define OPCODES

#define OPCODE_END (char)0x0b

// Constants
#define I32_CONST (char)0x41
#define I64_CONST (char)0x42
#define F32_CONST (char)0x43
#define F64_CONST (char)0x44

// Control flow operators
#define UNREACHABLE (char)0x00
#define NOP (char)0x01
#define BLOCK (char)0x02
#define LOOP (char)0x03
#define IF (char)0x04
#define ELSE (char)0x05
#define END (char)0x0b
#define BR (char)0x0c
#define BR_IF (char)0x0d
#define BR_TABLE (char)0x0e
#define RETURN (char)0x0f

// Call operators
#define CALL (char)0x10
#define CALL_INDIRECT (char)0x11


// Variable access
#define GET_LOCAL (char)0x20
#define SET_LOCAL (char)0x21
#define TEE_LOCAL (char)0x22
#define GET_GLOBAL (char)0x23
#define SET_GLOBAL (char)0x24



// Memory access
#define I32_MEMORY_LOAD (char)0x28
#define I64_MEMORY_LOAD (char)0x29
#define F32_MEMORY_LOAD (char)0x2a
#define F64_MEMORY_LOAD (char)0x2b
#define I32_S8_MEMORY_LOAD (char)0x2c
#define I32_U8_MEMORY_LOAD (char)0x2d
#define I32_S16_MEMORY_LOAD (char)0x2e
#define I32_U16_MEMORY_LOAD (char)0x2f
#define I64_S8_MEMORY_LOAD (char)0x30
#define I64_U8_MEMORY_LOAD (char)0x31
#define I64_S16_MEMORY_LOAD (char)0x32
#define I64_U16_MEMORY_LOAD (char)0x33
#define I64_S32_MEMORY_LOAD (char)0x34
#define I64_U32_MEMORY_LOAD (char)0x35
#define I32_STORE (char)0x36
#define I64_STORE (char)0x37
#define F32_STORE (char)0x38
#define F64_STORE (char)0x39
#define I32_STORE8 (char)0x3a
#define I32_STORE16 (char)0x3b
#define I64_STORE8 (char)0x3c
#define I64_STORE16 (char)0x3d
#define I64_STORE32 (char)0x3e
#define CURRENT_MEMORY (char)0x3f
#define GROW_MEMORY (char)0x40


// Comparison operations
// I32
#define I32_EQUAL_Z (char)0x45
#define I32_EQUAL (char)0x46
#define I32_NO_EQUAL (char)0x47
#define I32_LESS_THAN_SIGNED (char)0x48
#define I32_LESS_THAN (char)0x49
#define I32_GREATER_THAN_SIGNED (char)0x4a
#define I32_GREATER_THAN (char)0x4b
#define I32_LESS_EQUAL_THAN_SIGNED (char)0x4c
#define I32_LESS_EQUAL_THAN (char)0x4d
#define I32_GREATAER_EQUAL_THAN_SIGNED (char)0x4e
#define I32_GREATER_EQUAL_THAN (char)0x4f
// i64
#define I64_EQUAL_Z (char)0x50
#define I64_EQUAL (char)0x51
#define I64_NO_EQUAL (char)0x52
#define I64_LESS_THAN_SIGNED (char)0x53
#define I64_LESS_THAN (char)0x54
#define I64_GREATER_THAN_SIGNED (char)0x55
#define I64_GREATER_THAN (char)0x56
#define I64_LESS_EQUAL_THAN_SIGNED (char)0x57
#define I64_LESS_EQUAL_THAN (char)0x58
#define I64_GREATER_EQUAL_THAN_SIGNED (char)0x59
#define I64_GREATER_EQUAL_THAN (char)0x5a
//f32
#define F32_EQUAL_Z (char)0x5b
#define F32_NO_EQUAL (char)0x5c
#define F32_LESS_THAN (char)0x5d
#define F32_GREATER_THAN (char)0x5e
#define F32_LESS_EQUAL_THAN (char)0x5f
#define F32_GREATER_EQUAL_THAN (char)0x60
//f64
#define F64_EQUAL_Z (char)0x61
#define F64_NO_EQUAL (char)0x62
#define F64_LESS_THAN (char)0x63
#define F64_GREATER_THAN (char)0x64
#define F64_LESS_EQUAL_THAN (char)0x65
#define F64_GREATER_EQUAL_THAN (char)0x66

// NUMERIC
#define I32_CLZ (char)0x67
#define I32_CTZ (char)0x68
#define I32_POP_CNT (char)0x69
#define I32_ADD (char)0x6a
#define I32_SUB (char)0x6b
#define I32_MUL (char)0x6c
#define I32_DIV_SIGNED (char)0x6d
#define I32_DIV (char)0x6e
#define I32_REM_SIGNED (char)0x6f
#define I32_REM (char)0x70
#define I32_AND (char)0x71
#define I32_OR (char)0x72
#define I32_XOR (char)0x73
#define I32_SHL (char)0x74
#define I32_SHR_SIGNED (char)0x75
#define I32_SHR (char)0x76
#define I32_ROTL (char)0x77
#define I32_ROTR (char)0x78
// i64
#define I64_CLZ (char)0x79
#define I64_CTZ (char)0x7a
#define I64_POP_CNT (char)0x7b
#define I64_ADD (char)0x7c
#define I64_SUB (char)0x7d
#define I64_MUL (char)0x7e
#define I64_DIV_SIGNED (char)0x7f
#define I64_DIV (char)0x80
#define I64_REM_SIGNED (char)0x81
#define I64_REM (char)0x82
#define I64_AND (char)0x83
#define I64_OR (char)0x84
#define I64_XOR (char)0x85
#define I64_SHL (char)0x86
#define I64_SHR_SIGNED (char)0x87
#define I64_SHR (char)0x88
#define I64_ROTL (char)0x89
#define I64_ROTR (char)0x8a
// f32
#define F32_ABS (char)0x8b
#define F32_NEG (char)0x8c
#define F32_CEIL (char)0x8d
#define F32_FLOOR (char)0x8e
#define F32_TRUNC (char)0x8f
#define F32_NEAREST (char)0x90
#define F32_SQRT (char)0x91
#define F32_ADD (char)0x92
#define F32_SUB (char)0x93
#define F32_MUL (char)0x94
#define F32_DIV (char)0x95
#define F32_MIN (char)0x96
#define F32_MAX (char)0x97
#define F32_COPY_SIGN (char)0x98
// f64
#define F64_ABS (char)0x99
#define F64_NEG (char)0x9a
#define F64_CEIL (char)0x9b
#define F64_FLOOR (char)0x9c
#define F64_TRUNC (char)0x9d
#define F64_NEAREST (char)0x9e
#define F64_SQRT (char)0x9f
#define F64_ADD (char)0xa0
#define F64_SUB (char)0xa1
#define F64_MUL (char)0xa2
#define F64_DIV (char)0xa3
#define F64_MIN (char)0xa4
#define F64_MAX (char)0xa5
#define F64_COPY_SIGN (char)0xa6

//Conversions
#define WRAP_I32_I64 (char)0xa7
#define TRUNC_CONV_I32_F32_SIGNED (char)0xa8
#define TRUNC_CONV_I32_F32 (char)0xa9
#define TRUNC_CONV_I32_F64_SIGNED (char)0xaa
#define TRUNC_CONV_I32_F64 (char)0xab

#define EXTEND_I32_I64_SIGNED (char)0xac
#define EXTEND_I32_I64 (char)0xad

#define TRUNC_CONV_I64_F32_SIGNED (char)0xae
#define TRUNC_CONV_I64_F32 (char)0xaf

// FLOAT TO INT PROPOSAL
// https://github.com/WebAssembly/threads/blob/master/proposals/nontrapping-float-to-int-conversion/Overview.md
// https://github.com/WebAssembly/bulk-memory-operations/blob/master/proposals/bulk-memory-operations/Overview.md
#define MIX_OPERATION (char)0xfc
// BULK MEMORY

/*
memory.copy	0xfc 0x0a	memory_dst:0x00 memory_src:0x00	copy from one region of linear memory to another region
memory.fill	0xfc 0x0b	memory:0x00	fill a region of linear memory with a given byte value
table.init	0xfc 0x0c	segment:varuint32, table:0x00	copy from a passive element segment to a table
elem.drop	0xfc 0x0d	segment:varuint32	prevent further use of a passive element segment
table.copy	0xfc 0x0e	table_dst:0x00 table_src:0x00	copy from one region of a table to another region
*/
#define MEMORY_INIT (char)0x08
#define DATA_DROP (char)0x09
#define MEMORY_COPY (char)0x0a
#define MEMORY_FILL (char)0x0b
#define TABLE_INIT (char)0x0c
#define ELEM_DROP (char)0x0d
#define TABLE_COPY (char)0x0e


#define TRUNC_CONV_I64_F64_SIGNED (char)0xb0
#define TRUNC_CONV_I64_F64 (char)0xb1

#define CONVERT_F32_F64_SIGNED (char)0xb2
#define CONVERT_F32_F64 (char)0xb3
#define CONVERT_F32_I64_SIGNED (char)0xb4
#define CONVERT_F32_I64 (char)0xb5

#define DEMOTE_F32_I64 (char)0xb6
#define CONVERT_F64_I32_SIGNED (char)0xb7
#define CONVERT_F64_I32 (char)0xb8
#define CONVERT_F64_I64_SIGNED (char)0xb9
#define CONVERT_F64_I64 (char)0xba
#define CONVERT_F64_F32 (char)0xbb

// REINTRERPRETATION
#define REINTERPRET_I32_F32 (char)0xbc
#define REINTERPRET_I64_F64 (char)0xbd
#define REINTERPRET_F32_I32 (char)0xbe
#define REINTERPRET_F64_I64 (char)0xbf


#define DROP (char)0x1a
#define SELECT (char)0x1b

// USING V8 implementation as reference
// https://github.com/WebAssembly/threads/blob/master/proposals/threads/Overview.md
#define ATOMIC_OPERATION (char)0xfe
#define ATOMIC_FENCE 0x03



// 
/* Sign-extension opcodes (--enable-sign-extension) */
#define EXTEND_I32_8S (char)0xc0
#define EXTEND_I32_16S (char)0xc1
#define EXTEND_I64_8S (char)0xc2
#define EXTEND_I64_16S (char)0xc3
#define EXTEND_I64_32S (char)0xc4

// TARY CATCH
#define TRY (char)0x06
#define CATCH (char)0x07
#define THROW (char)0x08
#define RETHROW (char)0x09
#define BrOnExn (char)0x0a
#endif