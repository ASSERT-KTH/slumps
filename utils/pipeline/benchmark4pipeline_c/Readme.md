## Legend

**<project_name>.c** Program code written in C

**<project_name>.wasm** Compiled project to WebAssembly using the LLVM backend

**<project_name>.opt<config>.wasm** Optimized programs using Souper. <config> refers to one of the Souper options listed below

## Souper options

1 - llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=300 -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc

2 - llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN=false -souper-infer-inst  -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc

3 - llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -souper-infer-inst -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc

4 - llvm-opt -load ${libsouperPass}  -souper  -souper-external-cache  -souper-enumerative-synthesis -souper-infer-inst -souper-use-alive -souper-synthesis-const-with-cegis -solver-timeout=300  -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc 

5 - llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne  -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc



## Programs from Rosetta corpus

- Bankers Algorithm
- Baggage problem
- Addition chains
- Aliquot Sequence Classes
- Flipping Bits Game
- Bitwise IO
- Eban Numbers Paraffins
- Pascal Matrix Generation
- Resistor mesh
- Run length encoding
- Zebra puzzle

## Influential projects
- SQLite
- ZLib
- Lua
