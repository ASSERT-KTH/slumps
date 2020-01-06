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


## Babbage problem candidates

```
; Function: main
;[ORIGIN]   %current.0 = phi i32 [ 0, %entry ], [ %inc, %while.cond ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %mul = mul nsw i32 %current.0, %current.0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0
infer %1

; Function: main
;[ORIGIN]   %rem = urem i32 %mul, 1000000
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i32 = urem %1, 1000000:i32
infer %2

; Function: main
;[ORIGIN]   %cmp = icmp eq i32 %rem, 269696
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i32 = urem %1, 1000000:i32
%3:i1 = eq 269696:i32, %2
infer %3

; Function: main
;[ORIGIN]   %cmp1 = icmp ne i32 %mul, 2147483647
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i1 = ne 2147483647:i32, %1
infer %2

; Function: main
;[ORIGIN]   %0 = select i1 %cmp, i1 false, i1 %cmp1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0
%2:i32 = urem %1, 1000000:i32
%3:i1 = eq 269696:i32, %2
%4:i1 = ne 2147483647:i32, %1
%5:i1 = select %3, 0:i1, %4
infer %5

; Function: main
;[ORIGIN]   %inc = add nuw nsw i32 %current.0, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

```