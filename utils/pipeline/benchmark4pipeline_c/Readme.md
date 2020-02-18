## Legend

**<project_name>.c** Program code written in C

**<project_name>.wasm** Compiled project to WebAssembly using the LLVM backend

**<project_name>.opt<config>.wasm** Optimized programs using Souper. <config> refers to one of the Souper options listed below

## Souper options

1 - llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=300 -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc

2 - llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN=false -souper-infer-inst  -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc

3 - llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -souper-infer-inst -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc

4 - llvm-opt -load ${libsouperPass}  -souper  -souper-external-cache  -souper-enumerative-synthesis -souper-infer-inst -souper-use-alive -souper-synthesis-const-with-cegis -solver-timeout=300  -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc 




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
; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

; *****
; For LLVM instruction:
;  %2 = phi i32 [ 0, %0 ], [ %8, %1 ]
; Generating replacement:
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; *****
; For LLVM instruction:
;  %3 = mul nsw i32 %2, %2
; Generating replacement:
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0
infer %1

; *****
; For LLVM instruction:
;  %4 = urem i32 %3, 1000000
; Generating replacement:
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i32 = urem %1, 1000000:i32
infer %2

; *****
; For LLVM instruction:
;  %5 = icmp ne i32 %4, 269696
; Generating replacement:
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i32 = urem %1, 1000000:i32
%3:i1 = ne 269696:i32, %2
infer %3

; *****
; For LLVM instruction:
;  %6 = icmp ne i32 %3, 2147483647
; Generating replacement:
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i1 = ne 2147483647:i32, %1
infer %2

; *****
; For LLVM instruction:
;  %7 = and i1 %6, %5
; Generating replacement:
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0
%2:i32 = urem %1, 1000000:i32
%3:i1 = ne 269696:i32, %2
%4:i1 = ne 2147483647:i32, %1
%5:i1 = and %3, %4
infer %5

; *****
; For LLVM instruction:
;  %8 = add nuw nsw i32 %2, 1
; Generating replacement:
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

Function before replacement:

; Function Attrs: nounwind uwtable
define i32 @main() local_unnamed_addr #0 {
  br label %1

; <label>:1:                                      ; preds = %1, %0
  %2 = phi i32 [ 0, %0 ], [ %9, %1 ]
  %3 = mul nsw i32 %2, %2
  %4 = urem i32 %3, 1000000
  %5 = icmp ne i32 %2, 25264
  %6 = icmp ne i32 %4, 269696
  %7 = icmp ne i32 %3, 2147483647
  %8 = and i1 %7, %6
  %9 = add nuw nsw i32 %2, 1
  br i1 %8, label %1, label %10

; <label>:10:                                     ; preds = %1
  %11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.1, i64 0, i64 0), i32 %2)
  ret i32 0
}

; Replacing "  %6 = icmp ne i32 %4, 269696"
; from ""
; with "  %5 = icmp ne i32 %2, 25264" in:
"%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i32 = urem %1, 1000000:i32
%3:i1 = ne 269696:i32, %2
%4:i1 = ne 25264:i32, %0
cand %3 %4
"
; with "  %5 = icmp ne i32 %2, 25264"

Function before replacement:

; Function Attrs: nounwind uwtable
define i32 @main() local_unnamed_addr #0 {
  br label %1

; <label>:1:                                      ; preds = %1, %0
  %2 = phi i32 [ 0, %0 ], [ %9, %1 ]
  %3 = mul nsw i32 %2, %2
  %4 = urem i32 %3, 1000000
  %5 = icmp ne i32 %2, 25264
  %6 = icmp ne i32 %4, 269696
  %7 = icmp ne i32 %3, 2147483647
  %8 = and i1 %7, %5
  %9 = add nuw nsw i32 %2, 1
  br i1 %8, label %1, label %10

; <label>:10:                                     ; preds = %1
  %11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.1, i64 0, i64 0), i32 %2)
  ret i32 0
}

; Replacing "  %7 = icmp ne i32 %3, 2147483647"
; from ""
; with "i1 true" in:
"%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i1 = ne 2147483647:i32, %1
cand %2 1:i1
"
; with "i1 true"

Function before replacement:

; Function Attrs: nounwind uwtable
define i32 @main() local_unnamed_addr #0 {
  br label %1

; <label>:1:                                      ; preds = %1, %0
  %2 = phi i32 [ 0, %0 ], [ %10, %1 ]
  %3 = mul nsw i32 %2, %2
  %4 = urem i32 %3, 1000000
  %5 = icmp ne i32 %2, 25264
  %6 = icmp ne i32 %4, 269696
  %7 = icmp ne i32 %3, 2147483647
  %8 = icmp ne i32 %2, 25264
  %9 = and i1 true, %5
  %10 = add nuw nsw i32 %2, 1
  br i1 %9, label %1, label %11

; <label>:11:                                     ; preds = %1
  %12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.1, i64 0, i64 0), i32 %2)
  ret i32 0
}

; Replacing "  %9 = and i1 true, %5"
; from ""
; with "  %8 = icmp ne i32 %2, 25264" in:
"%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0
%2:i32 = urem %1, 1000000:i32
%3:i1 = ne 269696:i32, %2
%4:i1 = ne 2147483647:i32, %1
%5:i1 = and %3, %4
%6:i1 = ne 25264:i32, %0
cand %5 %6
"
; with "  %8 = icmp ne i32 %2, 25264"

Function after replacement:


; Function Attrs: nounwind uwtable
define i32 @main() local_unnamed_addr #0 {
  br label %1

; <label>:1:                                      ; preds = %1, %0
  %2 = phi i32 [ 0, %0 ], [ %10, %1 ]
  %3 = mul nsw i32 %2, %2
  %4 = urem i32 %3, 1000000
  %5 = icmp ne i32 %2, 25264
  %6 = icmp ne i32 %4, 269696
  %7 = icmp ne i32 %3, 2147483647
  %8 = icmp ne i32 %2, 25264
  %9 = and i1 true, %5
  %10 = add nuw nsw i32 %2, 1
  br i1 %8, label %1, label %11

; <label>:11:                                     ; preds = %1
  %12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.1, i64 0, i64 0), i32 %2)
  ret i32 0
}

```
### Babbage optimized llvm IR

```llvm
; ModuleID = 'babbage_problem.opt3.bc'
source_filename = "benchmark4pipeline_c/babbage_problem.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@.str.1 = private unnamed_addr constant [55 x i8] c"The smallest number whose square ends in 269696 is %d\0A\00", align 1

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %current.0 = phi i32 [ 0, %entry ], [ %inc, %while.cond ]
  %mul = mul nsw i32 %current.0, %current.0
  %rem = urem i32 %mul, 1000000
  %cmp = icmp eq i32 %rem, 269696
  %cmp1 = icmp ne i32 %mul, 2147483647
  %0 = select i1 %cmp, i1 false, i1 true
  %inc = add nuw nsw i32 %current.0, 1
  br i1 %0, label %while.cond, label %if.else

if.else:                                          ; preds = %while.cond
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.1, i32 0, i32 0), i32 %current.0)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-$
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-$

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
```

### Babbage original llvm IR

```llvm
; ModuleID = 'benchmark4pipeline_c/babbage_problem.c'
source_filename = "benchmark4pipeline_c/babbage_problem.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@.str.1 = private unnamed_addr constant [55 x i8] c"The smallest number whose square ends in 269696 is %d\0A\00", align 1

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %current.0 = phi i32 [ 0, %entry ], [ %inc, %while.cond ]
  %mul = mul nsw i32 %current.0, %current.0
  %rem = urem i32 %mul, 1000000
  %cmp = icmp eq i32 %rem, 269696
  %cmp1 = icmp ne i32 %mul, 2147483647
  %0 = select i1 %cmp, i1 false, i1 %cmp1
  %inc = add nuw nsw i32 %current.0, 1
  br i1 %0, label %while.cond, label %if.else

if.else:                                          ; preds = %while.cond
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.1, i32 0, i32 0), i32 %current.0)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
```

## Bitwise IO candidates

```

; Function: b_write
;[ORIGIN]   %0 = load i32, i32* %accu1, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %1 = load i32, i32* %bits2, align 4, !tbaa !8
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %tobool64 = icmp eq i32 %n_bits, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %cmp65 = icmp sgt i32 %1, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %2 = select i1 %tobool64, i1 %cmp65, i1 true
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = select %1, %3, 1:i1
infer %4

; Function: b_write
;[ORIGIN]   %rem = and i32 %shift, 7
%0:i32 = var
%1:i32 = and 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %div = lshr i32 %shift, 3
%0:i32 = var
%1:i32 = lshr %0, 3:i32
infer %1

; Function: b_write
;[ORIGIN]   %n_bits.addr.1.lcssa = phi i32 [ %n_bits.addr.066, %while.cond7.preheader ], [ %dec, %while.body10 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %shift.addr.1.lcssa = phi i32 [ %shift.addr.067, %while.cond7.preheader ], [ %spec.select, %while.body10 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %accu.2.lcssa = phi i32 [ %accu.1.lcssa, %while.cond7.preheader ], [ %or, %while.body10 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %bits.2.lcssa = phi i32 [ %bits.1.lcssa, %while.cond7.preheader ], [ %inc, %while.body10 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %tobool = icmp eq i32 %n_bits.addr.1.lcssa, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %cmp = icmp sgt i32 %bits.2.lcssa, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %3 = select i1 %tobool, i1 %cmp, i1 true
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = select %1, %3, 1:i1
infer %4

; Function: b_write
;[ORIGIN]   %bits.070 = phi i32 [ %1, %while.cond3.preheader.lr.ph ], [ %bits.2.lcssa, %while.cond.loopexit ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %accu.069 = phi i32 [ %0, %while.cond3.preheader.lr.ph ], [ %accu.2.lcssa, %while.cond.loopexit ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %shift.addr.067 = phi i32 [ %rem, %while.cond3.preheader.lr.ph ], [ %shift.addr.1.lcssa, %while.cond.loopexit ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %n_bits.addr.066 = phi i32 [ %n_bits, %while.cond3.preheader.lr.ph ], [ %n_bits.addr.1.lcssa, %while.cond.loopexit ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %cmp448 = icmp sgt i32 %bits.070, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %accu.1.lcssa = phi i32 [ %accu.069, %while.cond3.preheader ], [ %and, %while.body5 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %bits.1.lcssa = phi i32 [ %bits.070, %while.cond3.preheader ], [ %sub, %while.body5 ]
%0:i32 = var (range=[-2147483648,8))
infer %0

; Function: b_write
;[ORIGIN]   %cmp852 = icmp slt i32 %bits.1.lcssa, 8
%0:i32 = var (range=[-2147483648,8))
%1:i1 = slt %0, 8:i32
infer %1

; Function: b_write
;[ORIGIN]   %tobool953 = icmp ne i32 %n_bits.addr.066, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %4 = select i1 %cmp852, i1 %tobool953, i1 false
%0:i32 = var (range=[-2147483648,8))
%1:i1 = slt %0, 8:i32
%2:i32 = var
%3:i1 = ne 0:i32, %2
%4:i1 = select %1, %3, 0:i1
infer %4

; Function: b_write
;[ORIGIN]   %bits.150 = phi i32 [ %sub, %while.body5 ], [ %bits.070, %while.cond3.preheader ]
%0:i32 = var (range=[8,-2147483648))
infer %0

; Function: b_write
;[ORIGIN]   %accu.149 = phi i32 [ %and, %while.body5 ], [ %accu.069, %while.cond3.preheader ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %sub = add nsw i32 %bits.150, -8
%0:i32 = var (range=[8,-2147483648))
%1:i32 = addnsw 4294967288:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %shr = lshr i32 %accu.149, %sub
%0:i32 = var
%1:i32 = var (range=[8,-2147483648))
%2:i32 = addnsw 4294967288:i32, %1 (hasExternalUses)
%3:i32 = lshr %0, %2
infer %3

; Function: b_write
;[ORIGIN]   %notmask = shl nsw i32 -1, %sub
%0:i32 = var (range=[8,-2147483648))
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i32 = shlnsw 4294967295:i32, %1
infer %2

; Function: b_write
;[ORIGIN]   %sub6 = xor i32 %notmask, -1
%0:i32 = var (range=[8,-2147483648))
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i32 = shlnsw 4294967295:i32, %1
%3:i32 = xor 4294967295:i32, %2
infer %3

; Function: b_write
;[ORIGIN]   %and = and i32 %accu.149, %sub6
%0:i32 = var
%1:i32 = var (range=[8,-2147483648))
%2:i32 = addnsw 4294967288:i32, %1 (hasExternalUses)
%3:i32 = shlnsw 4294967295:i32, %2
%4:i32 = xor 4294967295:i32, %3
%5:i32 = and %0, %4
infer %5

; Function: b_write
;[ORIGIN]   %cmp4 = icmp sgt i32 %sub, 7
%0:i32 = var (range=[8,-2147483648))
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i1 = slt 7:i32, %1
infer %2

; Function: b_write
;[ORIGIN]   %bits.258 = phi i32 [ %inc, %while.body10 ], [ %bits.1.lcssa, %while.cond7.preheader ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %accu.257 = phi i32 [ %or, %while.body10 ], [ %accu.1.lcssa, %while.cond7.preheader ]
%0:i32 = var
infer %0 (demandedBits=01111111111111111111111111111111)

; Function: b_write
;[ORIGIN]   %shift.addr.155 = phi i32 [ %spec.select, %while.body10 ], [ %shift.addr.067, %while.cond7.preheader ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %n_bits.addr.154 = phi i32 [ %dec, %while.body10 ], [ %n_bits.addr.066, %while.cond7.preheader ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %shl11 = shl i32 %accu.257, 1
%0:i32 = var
%1:i32 = shl %0, 1:i32
infer %1

; Function: b_write
;[ORIGIN]   %shr12 = lshr i32 128, %shift.addr.155
%0:i32 = var
%1:i32 = lshr 128:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: b_write
;[ORIGIN]   %6 = load i8, i8* %buf.addr.156, align 1, !tbaa !10
%0:i8 = var
infer %0

; Function: b_write
;[ORIGIN]   %conv = zext i8 %6 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1

; Function: b_write
;[ORIGIN]   %and13 = and i32 %shr12, %conv
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
infer %4

; Function: b_write
;[ORIGIN]   %sub14 = sub i32 7, %shift.addr.155
%0:i32 = var
%1:i32 = sub 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %shr15 = lshr i32 %and13, %sub14
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
%5:i32 = sub 7:i32, %0
%6:i32 = lshr %4, %5
infer %6

; Function: b_write
;[ORIGIN]   %or = or i32 %shr15, %shl11
%0:i32 = var
%1:i32 = shl %0, 1:i32
%2:i32 = var
%3:i32 = lshr 128:i32, %2
%4:i8 = var
%5:i32 = zext %4
%6:i32 = and %3, %5
%7:i32 = sub 7:i32, %2
%8:i32 = lshr %6, %7
%9:i32 = or %1, %8
infer %9

; Function: b_write
;[ORIGIN]   %dec = add i32 %n_bits.addr.154, -1
%0:i32 = var
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %inc = add nsw i32 %bits.258, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %inc16 = add i32 %shift.addr.155, 1
%0:i32 = var
%1:i32 = add 1:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %cmp17 = icmp eq i32 %inc16, 8
%0:i32 = var
%1:i32 = add 1:i32, %0 (hasExternalUses)
%2:i1 = eq 8:i32, %1
infer %2

; Function: b_write
;[ORIGIN]   %spec.select = select i1 %cmp17, i32 0, i32 %inc16
%0:i32 = var
%1:i32 = add 1:i32, %0
%2:i1 = eq 8:i32, %1 (hasExternalUses)
%3:i32 = select %2, 0:i32, %1
infer %3

; Function: b_write
;[ORIGIN]   %cmp8 = icmp slt i32 %inc, 8
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i1 = slt %1, 8:i32
infer %2

; Function: b_write
;[ORIGIN]   %tobool9 = icmp ne i32 %dec, 0
%0:i32 = var
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: b_write
;[ORIGIN]   %7 = select i1 %cmp8, i1 %tobool9, i1 false
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i1 = slt %1, 8:i32
%3:i32 = var
%4:i32 = add 4294967295:i32, %3 (hasExternalUses)
%5:i1 = ne 0:i32, %4
%6:i1 = select %2, %5, 0:i1
infer %6

; Function: b_write
;[ORIGIN]   %accu.0.lcssa = phi i32 [ %0, %entry ], [ %accu.2.lcssa, %while.cond.loopexit ]
%0 = block 2
%1:i32 = var
%2:i32 = var
%3:i32 = phi %0, %1, %2
infer %3

; Function: b_write
;[ORIGIN]   %bits.0.lcssa = phi i32 [ %1, %entry ], [ %bits.2.lcssa, %while.cond.loopexit ]
%0 = block 2
%1:i32 = var
%2:i32 = var
%3:i32 = phi %0, %1, %2
infer %3

; Function: b_read
;[ORIGIN]   %0 = load i32, i32* %accu1, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %1 = load i32, i32* %bits2, align 4, !tbaa !8
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %tobool59 = icmp eq i32 %n_bits, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %rem = and i32 %shift, 7
%0:i32 = var
%1:i32 = and 7:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %div = lshr i32 %shift, 3
%0:i32 = var
%1:i32 = lshr %0, 3:i32
infer %1

; Function: b_read
;[ORIGIN]   %n_bits.addr.063 = phi i32 [ %n_bits, %while.cond3.preheader.lr.ph ], [ %n_bits.addr.1.lcssa, %if.end18 ]
%0:i32 = var (range=[1,0))
infer %0

; Function: b_read
;[ORIGIN]   %bits.062 = phi i32 [ %1, %while.cond3.preheader.lr.ph ], [ %add, %if.end18 ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %accu.061 = phi i32 [ %0, %while.cond3.preheader.lr.ph ], [ %or20, %if.end18 ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %shift.addr.060 = phi i32 [ %rem, %while.cond3.preheader.lr.ph ], [ %shift.addr.1.lcssa, %if.end18 ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %tobool448 = icmp eq i32 %bits.062, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %tobool549 = icmp ne i32 %n_bits.addr.063, 0
%0:i32 = var (range=[1,0))
%1:i1 = ne 0:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %2 = select i1 %tobool448, i1 false, i1 %tobool549
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = var (range=[1,0))
%3:i1 = ne 0:i32, %2 (hasExternalUses)
%4:i1 = select %1, 0:i1, %3
infer %4

; Function: b_read
;[ORIGIN]   %n_bits.addr.153 = phi i32 [ %dec, %if.end ], [ %n_bits.addr.063, %while.cond3.preheader ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %bits.152 = phi i32 [ %sub, %if.end ], [ %bits.062, %while.cond3.preheader ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %shift.addr.150 = phi i32 [ %spec.select, %if.end ], [ %shift.addr.060, %while.cond3.preheader ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %sub = add nsw i32 %bits.152, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %shl = shl i32 1, %sub
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i32 = shl 1:i32, %1
infer %2

; Function: b_read
;[ORIGIN]   %and = and i32 %shl, %accu.061
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 4294967295:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = and %0, %3
infer %4

; Function: b_read
;[ORIGIN]   %tobool7 = icmp eq i32 %and, 0
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 4294967295:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = and %0, %3
%5:i1 = eq 0:i32, %4
infer %5

; Function: b_read
;[ORIGIN]   %shr = lshr i32 128, %shift.addr.150
%0:i32 = var
%1:i32 = lshr 128:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: b_read
;[ORIGIN]   %3 = load i8, i8* %buf.addr.154, align 1, !tbaa !9
%0:i8 = var
infer %0

; Function: b_read
;[ORIGIN]   %4 = trunc i32 %shr to i8
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = trunc %1
infer %2

; Function: b_read
;[ORIGIN]   %conv8 = or i8 %3, %4
%0:i8 = var
%1:i32 = var
%2:i32 = lshr 128:i32, %1
%3:i8 = trunc %2
%4:i8 = or %0, %3
infer %4

; Function: b_read
;[ORIGIN]   %neg = ashr i32 -129, %shift.addr.150
%0:i32 = var
%1:i32 = ashr 4294967167:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: b_read
;[ORIGIN]   %5 = load i8, i8* %buf.addr.154, align 1, !tbaa !9
%0:i8 = var
infer %0

; Function: b_read
;[ORIGIN]   %6 = trunc i32 %neg to i8
%0:i32 = var
%1:i32 = ashr 4294967167:i32, %0
%2:i8 = trunc %1
infer %2

; Function: b_read
;[ORIGIN]   %conv11 = and i8 %5, %6
%0:i8 = var
%1:i32 = var
%2:i32 = ashr 4294967167:i32, %1
%3:i8 = trunc %2
%4:i8 = and %0, %3
infer %4

; Function: b_read
;[ORIGIN]   %storemerge = phi i8 [ %conv11, %if.else ], [ %conv8, %if.then ]
%0:i8 = var
infer %0

; Function: b_read
;[ORIGIN]   %dec = add i32 %n_bits.addr.153, -1
%0:i32 = var
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %inc = add i32 %shift.addr.150, 1
%0:i32 = var
%1:i32 = add 1:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %cmp = icmp ugt i32 %inc, 7
%0:i32 = var
%1:i32 = add 1:i32, %0 (hasExternalUses)
%2:i1 = ult 7:i32, %1
infer %2

; Function: b_read
;[ORIGIN]   %spec.select = select i1 %cmp, i32 0, i32 %inc
%0:i32 = var
%1:i32 = add 1:i32, %0
%2:i1 = ult 7:i32, %1 (hasExternalUses)
%3:i32 = select %2, 0:i32, %1
infer %3

; Function: b_read
;[ORIGIN]   %tobool4 = icmp eq i32 %sub, 0
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i1 = eq 0:i32, %1
infer %2

; Function: b_read
;[ORIGIN]   %tobool5 = icmp ne i32 %dec, 0
%0:i32 = var
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: b_read
;[ORIGIN]   %7 = select i1 %tobool4, i1 false, i1 %tobool5
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i1 = eq 0:i32, %1
%3:i32 = var
%4:i32 = add 4294967295:i32, %3 (hasExternalUses)
%5:i1 = ne 0:i32, %4 (hasExternalUses)
%6:i1 = select %2, 0:i1, %5
infer %6

; Function: b_read
;[ORIGIN]   %shift.addr.1.lcssa = phi i32 [ %shift.addr.060, %while.cond3.preheader ], [ %spec.select, %if.end ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %bits.1.lcssa = phi i32 [ %bits.062, %while.cond3.preheader ], [ %sub, %if.end ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %n_bits.addr.1.lcssa = phi i32 [ %n_bits.addr.063, %while.cond3.preheader ], [ %dec, %if.end ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %tobool5.lcssa = phi i1 [ %tobool549, %while.cond3.preheader ], [ %tobool5, %if.end ]
%0:i1 = var
infer %0

; Function: b_read
;[ORIGIN]   %shl19 = shl i32 %accu.061, 8
%0:i32 = var
%1:i32 = shl %0, 8:i32
infer %1

; Function: b_read
;[ORIGIN]   %call = tail call i32 @fgetc(%struct._IO_FILE* %8)
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %or20 = or i32 %call, %shl19
%0:i32 = var
%1:i32 = var
%2:i32 = shl %1, 8:i32
%3:i32 = or %0, %2
infer %3

; Function: b_read
;[ORIGIN]   %add = add nsw i32 %bits.1.lcssa, 8
%0:i32 = var
%1:i32 = addnsw 8:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %tobool = icmp eq i32 %n_bits.addr.1.lcssa, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %accu.0.lcssa = phi i32 [ %0, %entry ], [ %or20, %if.end18 ], [ %accu.061, %while.end ]
%0 = block 3
%1:i32 = var
%2:i32 = var
%3:i32 = var
%4:i32 = shl %3, 8:i32
%5:i32 = or %2, %4 (hasExternalUses)
%6:i32 = phi %0, %1, %5, %3
infer %6

; Function: b_read
;[ORIGIN]   %bits.2 = phi i32 [ %1, %entry ], [ %add, %if.end18 ], [ %bits.1.lcssa, %while.end ]
%0 = block 3
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw 8:i32, %2 (hasExternalUses)
%4:i32 = phi %0, %1, %3, %2
infer %4

; Function: b_detach
;[ORIGIN]   %0 = load i32, i32* %bits, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: b_detach
;[ORIGIN]   %tobool = icmp eq i32 %0, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: b_detach
;[ORIGIN]   %sub = sub nsw i32 8, %0
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = subnsw 8:i32, %0
infer %2

; Function: b_detach
;[ORIGIN]   %1 = load i32, i32* %accu, align 4, !tbaa !8
%0:i32 = var
infer %0

; Function: b_detach
;[ORIGIN]   %shl = shl i32 %1, %sub
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = var
%3:i32 = subnsw 8:i32, %0
%4:i32 = shl %2, %3
infer %4

; Function: main
;[ORIGIN]   %2 = phi i32 [ 0, %entry ], [ %5, %b_write.exit ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %3 = phi i32 [ 0, %entry ], [ %4, %b_write.exit ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %i.075 = phi i32 [ 0, %entry ], [ %inc, %b_write.exit ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
infer %0

; Function: main
;[ORIGIN]   %n_bits.addr.1.lcssa.i = phi i32 [ %n_bits.addr.066.i, %while.cond7.preheader.i ], [ %dec.i, %while.body10.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %shift.addr.1.lcssa.i = phi i32 [ %shift.addr.067.i, %while.cond7.preheader.i ], [ %spec.select.i, %while.body10.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %4 = phi i32 [ %accu.1.lcssa.i, %while.cond7.preheader.i ], [ %or.i, %while.body10.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %5 = phi i32 [ %bits.1.lcssa.i, %while.cond7.preheader.i ], [ %inc.i, %while.body10.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool.i = icmp eq i32 %n_bits.addr.1.lcssa.i, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp.i = icmp sgt i32 %5, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: main
;[ORIGIN]   %6 = select i1 %tobool.i, i1 %cmp.i, i1 true
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = select %1, %3, 1:i1
infer %4

; Function: main
;[ORIGIN]   %bits.070.i = phi i32 [ %2, %for.body ], [ %5, %while.cond.loopexit.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %accu.069.i = phi i32 [ %3, %for.body ], [ %4, %while.cond.loopexit.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %shift.addr.067.i = phi i32 [ 1, %for.body ], [ %shift.addr.1.lcssa.i, %while.cond.loopexit.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %n_bits.addr.066.i = phi i32 [ 7, %for.body ], [ %n_bits.addr.1.lcssa.i, %while.cond.loopexit.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp448.i = icmp sgt i32 %bits.070.i, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: main
;[ORIGIN]   %accu.1.lcssa.i = phi i32 [ %accu.069.i, %while.cond3.preheader.i ], [ %and.i, %while.body5.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %bits.1.lcssa.i = phi i32 [ %bits.070.i, %while.cond3.preheader.i ], [ %sub.i, %while.body5.i ]
%0:i32 = var (range=[-2147483648,8))
infer %0

; Function: main
;[ORIGIN]   %cmp852.i = icmp slt i32 %bits.1.lcssa.i, 8
%0:i32 = var (range=[-2147483648,8))
%1:i1 = slt %0, 8:i32
infer %1

; Function: main
;[ORIGIN]   %tobool953.i = icmp ne i32 %n_bits.addr.066.i, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %7 = select i1 %cmp852.i, i1 %tobool953.i, i1 false
%0:i32 = var (range=[-2147483648,8))
%1:i1 = slt %0, 8:i32
%2:i32 = var
%3:i1 = ne 0:i32, %2
%4:i1 = select %1, %3, 0:i1
infer %4

; Function: main
;[ORIGIN]   %bits.150.i = phi i32 [ %sub.i, %while.body5.i ], [ %bits.070.i, %while.cond3.preheader.i ]
%0:i32 = var (range=[8,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %accu.149.i = phi i32 [ %and.i, %while.body5.i ], [ %accu.069.i, %while.cond3.preheader.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %sub.i = add nsw i32 %bits.150.i, -8
%0:i32 = var (range=[8,-2147483648))
%1:i32 = addnsw 4294967288:i32, %0
infer %1

; Function: main
;[ORIGIN]   %shr.i = lshr i32 %accu.149.i, %sub.i
%0:i32 = var
%1:i32 = var (range=[8,-2147483648))
%2:i32 = addnsw 4294967288:i32, %1 (hasExternalUses)
%3:i32 = lshr %0, %2
infer %3

; Function: main
;[ORIGIN]   %notmask.i = shl nsw i32 -1, %sub.i
%0:i32 = var (range=[8,-2147483648))
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i32 = shlnsw 4294967295:i32, %1
infer %2

; Function: main
;[ORIGIN]   %sub6.i = xor i32 %notmask.i, -1
%0:i32 = var (range=[8,-2147483648))
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i32 = shlnsw 4294967295:i32, %1
%3:i32 = xor 4294967295:i32, %2
infer %3

; Function: main
;[ORIGIN]   %and.i = and i32 %accu.149.i, %sub6.i
%0:i32 = var
%1:i32 = var (range=[8,-2147483648))
%2:i32 = addnsw 4294967288:i32, %1 (hasExternalUses)
%3:i32 = shlnsw 4294967295:i32, %2
%4:i32 = xor 4294967295:i32, %3
%5:i32 = and %0, %4
infer %5

; Function: main
;[ORIGIN]   %cmp4.i = icmp sgt i32 %sub.i, 7
%0:i32 = var (range=[8,-2147483648))
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i1 = slt 7:i32, %1
infer %2

; Function: main
;[ORIGIN]   %bits.258.i = phi i32 [ %inc.i, %while.body10.i ], [ %bits.1.lcssa.i, %while.cond7.preheader.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %accu.257.i = phi i32 [ %or.i, %while.body10.i ], [ %accu.1.lcssa.i, %while.cond7.preheader.i ]
%0:i32 = var
infer %0 (demandedBits=01111111111111111111111111111111)

; Function: main
;[ORIGIN]   %shift.addr.155.i = phi i32 [ %spec.select.i, %while.body10.i ], [ %shift.addr.067.i, %while.cond7.preheader.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %n_bits.addr.154.i = phi i32 [ %dec.i, %while.body10.i ], [ %n_bits.addr.066.i, %while.cond7.preheader.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %shl11.i = shl i32 %accu.257.i, 1
%0:i32 = var
%1:i32 = shl %0, 1:i32
infer %1

; Function: main
;[ORIGIN]   %shr12.i = lshr i32 128, %shift.addr.155.i
%0:i32 = var
%1:i32 = lshr 128:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %8 = load i8, i8* %buf.addr.156.i, align 1, !tbaa !2
%0:i8 = var
infer %0

; Function: main
;[ORIGIN]   %conv.i = zext i8 %8 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1

; Function: main
;[ORIGIN]   %and13.i = and i32 %shr12.i, %conv.i
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
infer %4

; Function: main
;[ORIGIN]   %sub14.i = sub i32 7, %shift.addr.155.i
%0:i32 = var
%1:i32 = sub 7:i32, %0
infer %1

; Function: main
;[ORIGIN]   %shr15.i = lshr i32 %and13.i, %sub14.i
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
%5:i32 = sub 7:i32, %0
%6:i32 = lshr %4, %5
infer %6

; Function: main
;[ORIGIN]   %or.i = or i32 %shr15.i, %shl11.i
%0:i32 = var
%1:i32 = shl %0, 1:i32
%2:i32 = var
%3:i32 = lshr 128:i32, %2
%4:i8 = var
%5:i32 = zext %4
%6:i32 = and %3, %5
%7:i32 = sub 7:i32, %2
%8:i32 = lshr %6, %7
%9:i32 = or %1, %8
infer %9

; Function: main
;[ORIGIN]   %dec.i = add i32 %n_bits.addr.154.i, -1
%0:i32 = var
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: main
;[ORIGIN]   %inc.i = add nsw i32 %bits.258.i, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %inc16.i = add i32 %shift.addr.155.i, 1
%0:i32 = var
%1:i32 = add 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp17.i = icmp eq i32 %inc16.i, 8
%0:i32 = var
%1:i32 = add 1:i32, %0 (hasExternalUses)
%2:i1 = eq 8:i32, %1
infer %2

; Function: main
;[ORIGIN]   %spec.select.i = select i1 %cmp17.i, i32 0, i32 %inc16.i
%0:i32 = var
%1:i32 = add 1:i32, %0
%2:i1 = eq 8:i32, %1 (hasExternalUses)
%3:i32 = select %2, 0:i32, %1
infer %3

; Function: main
;[ORIGIN]   %cmp8.i = icmp slt i32 %inc.i, 8
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i1 = slt %1, 8:i32
infer %2

; Function: main
;[ORIGIN]   %tobool9.i = icmp ne i32 %dec.i, 0
%0:i32 = var
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: main
;[ORIGIN]   %9 = select i1 %cmp8.i, i1 %tobool9.i, i1 false
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i1 = slt %1, 8:i32
%3:i32 = var
%4:i32 = add 4294967295:i32, %3 (hasExternalUses)
%5:i1 = ne 0:i32, %4
%6:i1 = select %2, %5, 0:i1
infer %6

; Function: main
;[ORIGIN]   %inc = add nuw nsw i32 %i.075, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond76 = icmp eq i32 %inc, 10
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i1 = eq 10:i32, %1
infer %2

; Function: main
;[ORIGIN]   %tobool.i34 = icmp eq i32 %5, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = select %1, %3, 1:i1
pc %4 0:i1
%5:i1 = eq 0:i32, %2
infer %5

; Function: main
;[ORIGIN]   %sub.i35 = sub nsw i32 8, %5
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = select %1, %3, 1:i1
pc %4 0:i1
%5:i1 = eq 0:i32, %2
pc %5 0:i1
%6:i32 = subnsw 8:i32, %2
infer %6

; Function: main
;[ORIGIN]   %shl.i = shl i32 %4, %sub.i35
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = select %1, %3, 1:i1
pc %4 0:i1
%5:i1 = eq 0:i32, %2
pc %5 0:i1
%6:i32 = var
%7:i32 = subnsw 8:i32, %2
%8:i32 = shl %6, %7
infer %8

; Function: main
;[ORIGIN]   %12 = phi i32 [ 0, %b_detach.exit ], [ %22, %b_read.exit ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %13 = phi i32 [ 0, %b_detach.exit ], [ %21, %b_read.exit ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %i.174 = phi i32 [ 0, %b_detach.exit ], [ %inc12, %b_read.exit ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
infer %0

; Function: main
;[ORIGIN]   %n_bits.addr.063.i = phi i32 [ 7, %for.body7 ], [ %n_bits.addr.1.lcssa.i60, %if.end18.i ]
%0:i32 = var (range=[1,0))
infer %0

; Function: main
;[ORIGIN]   %bits.062.i = phi i32 [ %12, %for.body7 ], [ %add.i, %if.end18.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %accu.061.i = phi i32 [ %13, %for.body7 ], [ %or20.i, %if.end18.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %shift.addr.060.i = phi i32 [ 1, %for.body7 ], [ %shift.addr.1.lcssa.i58, %if.end18.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool448.i = icmp eq i32 %bits.062.i, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %tobool549.i = icmp ne i32 %n_bits.addr.063.i, 0
%0:i32 = var (range=[1,0))
%1:i1 = ne 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %14 = select i1 %tobool448.i, i1 false, i1 %tobool549.i
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = var (range=[1,0))
%3:i1 = ne 0:i32, %2 (hasExternalUses)
%4:i1 = select %1, 0:i1, %3
infer %4

; Function: main
;[ORIGIN]   %n_bits.addr.153.i = phi i32 [ %dec.i52, %if.end.i ], [ %n_bits.addr.063.i, %while.cond3.preheader.i46 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %bits.152.i = phi i32 [ %sub.i47, %if.end.i ], [ %bits.062.i, %while.cond3.preheader.i46 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %shift.addr.150.i = phi i32 [ %spec.select.i56, %if.end.i ], [ %shift.addr.060.i, %while.cond3.preheader.i46 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %sub.i47 = add nsw i32 %bits.152.i, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: main
;[ORIGIN]   %shl.i48 = shl i32 1, %sub.i47
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i32 = shl 1:i32, %1
infer %2

; Function: main
;[ORIGIN]   %and.i49 = and i32 %shl.i48, %accu.061.i
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 4294967295:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = and %0, %3
infer %4

; Function: main
;[ORIGIN]   %tobool7.i = icmp eq i32 %and.i49, 0
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 4294967295:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = and %0, %3
%5:i1 = eq 0:i32, %4
infer %5

; Function: main
;[ORIGIN]   %shr.i50 = lshr i32 128, %shift.addr.150.i
%0:i32 = var
%1:i32 = lshr 128:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %15 = load i8, i8* %buf.addr.154.i, align 1, !tbaa !2
%0:i8 = var
infer %0

; Function: main
;[ORIGIN]   %16 = trunc i32 %shr.i50 to i8
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = trunc %1
infer %2

; Function: main
;[ORIGIN]   %conv8.i = or i8 %15, %16
%0:i8 = var
%1:i32 = var
%2:i32 = lshr 128:i32, %1
%3:i8 = trunc %2
%4:i8 = or %0, %3
infer %4

; Function: main
;[ORIGIN]   %neg.i = ashr i32 -129, %shift.addr.150.i
%0:i32 = var
%1:i32 = ashr 4294967167:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %17 = load i8, i8* %buf.addr.154.i, align 1, !tbaa !2
%0:i8 = var
infer %0

; Function: main
;[ORIGIN]   %18 = trunc i32 %neg.i to i8
%0:i32 = var
%1:i32 = ashr 4294967167:i32, %0
%2:i8 = trunc %1
infer %2

; Function: main
;[ORIGIN]   %conv11.i = and i8 %17, %18
%0:i8 = var
%1:i32 = var
%2:i32 = ashr 4294967167:i32, %1
%3:i8 = trunc %2
%4:i8 = and %0, %3
infer %4

; Function: main
;[ORIGIN]   %storemerge.i = phi i8 [ %conv11.i, %if.else.i ], [ %conv8.i, %if.then.i51 ]
%0:i8 = var
infer %0

; Function: main
;[ORIGIN]   %dec.i52 = add i32 %n_bits.addr.153.i, -1
%0:i32 = var
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: main
;[ORIGIN]   %inc.i53 = add i32 %shift.addr.150.i, 1
%0:i32 = var
%1:i32 = add 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp.i54 = icmp ugt i32 %inc.i53, 7
%0:i32 = var
%1:i32 = add 1:i32, %0 (hasExternalUses)
%2:i1 = ult 7:i32, %1
infer %2

; Function: main
;[ORIGIN]   %spec.select.i56 = select i1 %cmp.i54, i32 0, i32 %inc.i53
%0:i32 = var
%1:i32 = add 1:i32, %0
%2:i1 = ult 7:i32, %1 (hasExternalUses)
%3:i32 = select %2, 0:i32, %1
infer %3

; Function: main
;[ORIGIN]   %tobool4.i = icmp eq i32 %sub.i47, 0
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i1 = eq 0:i32, %1
infer %2

; Function: main
;[ORIGIN]   %tobool5.i = icmp ne i32 %dec.i52, 0
%0:i32 = var
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: main
;[ORIGIN]   %19 = select i1 %tobool4.i, i1 false, i1 %tobool5.i
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i1 = eq 0:i32, %1
%3:i32 = var
%4:i32 = add 4294967295:i32, %3 (hasExternalUses)
%5:i1 = ne 0:i32, %4 (hasExternalUses)
%6:i1 = select %2, 0:i1, %5
infer %6

; Function: main
;[ORIGIN]   %shift.addr.1.lcssa.i58 = phi i32 [ %shift.addr.060.i, %while.cond3.preheader.i46 ], [ %spec.select.i56, %if.end.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %bits.1.lcssa.i59 = phi i32 [ %bits.062.i, %while.cond3.preheader.i46 ], [ %sub.i47, %if.end.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %n_bits.addr.1.lcssa.i60 = phi i32 [ %n_bits.addr.063.i, %while.cond3.preheader.i46 ], [ %dec.i52, %if.end.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool5.lcssa.i = phi i1 [ %tobool549.i, %while.cond3.preheader.i46 ], [ %tobool5.i, %if.end.i ]
%0:i1 = var
infer %0

; Function: main
;[ORIGIN]   %shl19.i = shl i32 %accu.061.i, 8
%0:i32 = var
%1:i32 = shl %0, 8:i32
infer %1

; Function: main
;[ORIGIN]   %call.i62 = tail call i32 @fgetc(%struct._IO_FILE* %20) #3
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %or20.i = or i32 %call.i62, %shl19.i
%0:i32 = var
%1:i32 = var
%2:i32 = shl %1, 8:i32
%3:i32 = or %0, %2
infer %3

; Function: main
;[ORIGIN]   %add.i = add nsw i32 %bits.1.lcssa.i59, 8
%0:i32 = var
%1:i32 = addnsw 8:i32, %0
infer %1

; Function: main
;[ORIGIN]   %tobool.i63 = icmp eq i32 %n_bits.addr.1.lcssa.i60, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %21 = phi i32 [ %or20.i, %if.end18.i ], [ %accu.061.i, %while.end.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %22 = phi i32 [ %add.i, %if.end18.i ], [ %bits.1.lcssa.i59, %while.end.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc12 = add nuw nsw i32 %i.174, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond = icmp eq i32 %inc12, 10
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i1 = eq 10:i32, %1
infer %2

; Function: main
;[ORIGIN]   %tobool.i65 = icmp eq i32 %22, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %sub.i66 = sub nsw i32 8, %22
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = subnsw 8:i32, %0
infer %2

; Function: main
;[ORIGIN]   %shl.i68 = shl i32 %21, %sub.i66
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = var
%3:i32 = subnsw 8:i32, %0
%4:i32 = shl %2, %3
infer %4

```
