## Experiment 2

```bash
llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -solver-timeout=300 -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc

```

### STD

#### 2048.1.c

```
benchmark4pipeline_c/2048.1.c:194:33: warning: 'size' argument to memset is '0'; did you mean to transpose the last two arguments? [-Wmemset-transposed-args]
    memset(&game, sizeof(game), 0);
                                ^
benchmark4pipeline_c/2048.1.c:194:33: note: parenthesize the third argument to silence
1 warning generated.
[0;31mSouperifying benchmark4pipeline_c/2048.1...[0m

; Listing all replacements for do_draw
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for do_merge
; Using solver: Z3 + external cache + internal cache
LLVM ERROR: the model returned from second query evaluates to poison for LHS
[0;31mSouper pass finished[0m
wasm-ld-8: error: cannot open benchmark4pipeline_c/2048.1.opt1.bc: No such file or directory
stat failed: No such file or directory
wc: benchmark4pipeline_c/2048.1.opt1.wasm: No such file or directory
13621

Sat Dec 21 17:49:31 UTC 2019 Sat Dec 21 17:49:26 UTC 2019

real	0m4.492s
user	0m0.340s
sys	0m0.053s
```

#### 2048.c

```
benchmark4pipeline_c/2048.c:194:33: warning: 'size' argument to memset is '0'; did you mean to transpose the last two arguments? [-Wmemset-transposed-args]
    memset(&game, sizeof(game), 0);
                                ^
benchmark4pipeline_c/2048.c:194:33: note: parenthesize the third argument to silence
1 warning generated.
[0;31mSouperifying benchmark4pipeline_c/2048...[0m

; Listing all replacements for do_draw
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for do_merge
; Using solver: Z3 + external cache + internal cache
LLVM ERROR: the model returned from second query evaluates to poison for LHS
[0;31mSouper pass finished[0m
wasm-ld-8: error: cannot open benchmark4pipeline_c/2048.opt1.bc: No such file or directory
stat failed: No such file or directory
wc: benchmark4pipeline_c/2048.opt1.wasm: No such file or directory
13621

Sat Dec 21 17:49:31 UTC 2019 Sat Dec 21 17:49:31 UTC 2019

real	0m0.386s
user	0m0.323s
sys	0m0.044s
```

#### Banker's_algorithm.c

```
[0;31mSouperifying benchmark4pipeline_c/Banker's_algorithm...[0m

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
3021 3021

Sat Dec 21 17:49:31 UTC 2019 Sat Dec 21 17:49:31 UTC 2019

real	0m0.148s
user	0m0.117s
sys	0m0.033s
```

#### addition_chains.c

```
[0;31mSouperifying benchmark4pipeline_c/addition_chains...[0m

; Listing all replacements for reverse
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for checkSeq
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for tryPerm
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for initTryPerm
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for printArray
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for isBrauer
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for isAdditionChain
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for nextChains
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for findNonBrauer
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for findBrauer
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
5182 5182

Sat Dec 21 17:49:31 UTC 2019 Sat Dec 21 17:49:31 UTC 2019

real	0m0.258s
user	0m0.241s
sys	0m0.020s
```
#### aliquot_sequence_classifications_1,c

```
[0;31mSouperifying benchmark4pipeline_c/aliquot_sequence_classifications_1...[0m

; Listing all replacements for bruteForceProperDivisorSum
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for printSeries
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for aliquotClassifier
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for processFile
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
2051 2051

Sat Dec 21 17:49:32 UTC 2019 Sat Dec 21 17:49:31 UTC 2019

real	0m0.138s
user	0m0.108s
sys	0m0.031s
```
#### aliquot_sequence_classifications_2.c

```
[0;31mSouperifying benchmark4pipeline_c/aliquot_sequence_classifications_2...[0m

; Listing all replacements for raiseTo
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for properDivisorSum
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for printSeries
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for aliquotClassifier
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for processFile
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
2566 2566

Sat Dec 21 17:49:32 UTC 2019 Sat Dec 21 17:49:32 UTC 2019

real	0m0.180s
user	0m0.139s
sys	0m0.043s
```
#### babbage_problem.c

```
[0;31mSouperifying benchmark4pipeline_c/babbage_problem...[0m

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

; Replacing "  %cmp1 = icmp ne i32 %mul, 2147483647"
; from ""
; with "i1 true" in:
"%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i1 = ne 2147483647:i32, %1
cand %2 1:i1
"
; with "i1 true"

Total of 1 replacements done on this module
[0;31mSouper pass finished[0m
431 411

Sat Dec 21 17:49:32 UTC 2019 Sat Dec 21 17:49:32 UTC 2019

real	0m0.110s
user	0m0.072s
sys	0m0.019s

```
#### bitwise_IO.c

```
[0;31mSouperifying benchmark4pipeline_c/bitwise_IO...[0m

; Listing all replacements for b_attach
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for b_write
; Using solver: Z3 + external cache + internal cache

; Replacing "  %cmp852 = icmp slt i32 %bits.1.lcssa, 8"
; from ""
; with "i1 true" in:
"%0:i32 = var (range=[-2147483648,8))
%1:i1 = slt %0, 8:i32
cand %1 1:i1
"
; with "i1 true"

; Listing all replacements for b_read
; Using solver: Z3 + external cache + internal cache

; Replacing "  %tobool549 = icmp ne i32 %n_bits.addr.063, 0"
; from ""
; with "i1 true" in:
"%0:i32 = var (range=[1,0))
%1:i1 = ne 0:i32, %0
cand %1 1:i1
"
; with "i1 true"

; Listing all replacements for b_detach
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

; Replacing "  %cmp852.i = icmp slt i32 %bits.1.lcssa.i, 8"
; from ""
; with "i1 true" in:
"%0:i32 = var (range=[-2147483648,8))
%1:i1 = slt %0, 8:i32
cand %1 1:i1
"
; with "i1 true"

; Replacing "  %tobool549.i = icmp ne i32 %n_bits.addr.063.i, 0"
; from ""
; with "i1 true" in:
"%0:i32 = var (range=[1,0))
%1:i1 = ne 0:i32, %0
cand %1 1:i1
"
; with "i1 true"

Total of 4 replacements done on this module
[0;31mSouper pass finished[0m
2051 2142

Sat Dec 21 17:49:32 UTC 2019 Sat Dec 21 17:49:32 UTC 2019

real	0m0.169s
user	0m0.138s
sys	0m0.028s

```
#### eban_numbers.c

```


[0;31mSouperifying benchmark4pipeline_c/eban_numbers...[0m

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1198 1198

Sat Dec 21 17:49:32 UTC 2019 Sat Dec 21 17:49:32 UTC 2019

real	0m0.100s
user	0m0.059s
sys	0m0.044s
[0;31mSouperifying benchmark4pipeline_c/evolutionary_algorithm...[0m

; Listing all replacements for irand
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for unfitness
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for mutate
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1585 1585

Sat Dec 21 17:49:32 UTC 2019 Sat Dec 21 17:49:32 UTC 2019

real	0m0.155s
user	0m0.124s
sys	0m0.034s

```
#### flipping_bits_game.c

```
benchmark4pipeline_c/flipping_bits_game.c:64:1: warning: return type of 'main' is not 'int' [-Wmain-return-type]
void main()
^
benchmark4pipeline_c/flipping_bits_game.c:64:1: note: change return type to 'int'
void main()
^~~~
int
1 warning generated.
[0;31mSouperifying benchmark4pipeline_c/flipping_bits_game...[0m

; Listing all replacements for fliprow
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for flipcol
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for initt
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for initb
; Using solver: Z3 + external cache + internal cache

; Replacing "  %cmp17 = icmp slt i32 %inc22, %sz"
; from ""
; with "i1 false" in:
"%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i32 = addnsw 2:i32, %0 (hasExternalUses)
%4:i1 = slt %3, %1
cand %4 0:i1
"
; with "i1 false"

; Listing all replacements for printb
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for eq
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 1 replacements done on this module
[0;31mSouper pass finished[0m
3517 3449

Sat Dec 21 17:49:32 UTC 2019 Sat Dec 21 17:49:32 UTC 2019

real	0m0.173s
user	0m0.140s
sys	0m0.036s

```
#### heronian_triangles.c

```

In file included from benchmark4pipeline_c/heronian_triangles.c:3:
In file included from /usr/include/math.h:952:
/usr/include/bits/mathinline.h:614:9: error: invalid output constraint '=t' in asm
                    : "=t" (__value), "=&q" (__ignore), "=m" (__cwtmp),       \
                      ^
/usr/include/bits/mathinline.h:614:9: error: invalid output constraint '=t' in asm
/usr/include/bits/mathinline.h:614:9: error: invalid output constraint '=t' in asm
/usr/include/bits/mathinline.h:632:9: error: invalid output constraint '=t' in asm
                    : "=t" (__value), "=&q" (__ignore), "=m" (__cwtmp),       \
                      ^
/usr/include/bits/mathinline.h:632:9: error: invalid output constraint '=t' in asm
/usr/include/bits/mathinline.h:632:9: error: invalid output constraint '=t' in asm
/usr/include/bits/mathinline.h:739:3: error: invalid input constraint 't' in asm
  __lrint_code;
  ^
/usr/include/bits/mathinline.h:734:28: note: expanded from macro '__lrint_code'
     : "=m" (__lrintres) : "t" (__x) : "st");                                 \
                           ^
/usr/include/bits/mathinline.h:744:3: error: invalid input constraint 't' in asm
  __lrint_code;
  ^
/usr/include/bits/mathinline.h:734:28: note: expanded from macro '__lrint_code'
     : "=m" (__lrintres) : "t" (__x) : "st");                                 \
                           ^
/usr/include/bits/mathinline.h:749:3: error: invalid input constraint 't' in asm
  __lrint_code;
  ^
/usr/include/bits/mathinline.h:734:28: note: expanded from macro '__lrint_code'
     : "=m" (__lrintres) : "t" (__x) : "st");                                 \
                           ^
/usr/include/bits/mathinline.h:763:3: error: invalid input constraint 't' in asm
  __llrint_code;
  ^
/usr/include/bits/mathinline.h:757:29: note: expanded from macro '__llrint_code'
     : "=m" (__llrintres) : "t" (__x) : "st");                                \
                            ^
/usr/include/bits/mathinline.h:769:3: error: invalid input constraint 't' in asm
  __llrint_code;
  ^
/usr/include/bits/mathinline.h:757:29: note: expanded from macro '__llrint_code'
     : "=m" (__llrintres) : "t" (__x) : "st");                                \
                            ^
/usr/include/bits/mathinline.h:775:3: error: invalid input constraint 't' in asm
  __llrint_code;
  ^
/usr/include/bits/mathinline.h:757:29: note: expanded from macro '__llrint_code'
     : "=m" (__llrintres) : "t" (__x) : "st");                                \
                            ^
12 errors generated.
/home/slumps/slumps/souper/third_party/llvm/Release/bin/llvm-as: benchmark4pipeline_c/heronian_triangles.ll: error: Could not open input file: No such file or directory
wasm-ld-8: error: cannot open benchmark4pipeline_c/heronian_triangles.bc: No such file or directory
stat failed: No such file or directory
[0;31mSouperifying benchmark4pipeline_c/heronian_triangles...[0m
/home/slumps/slumps/souper/third_party/llvm/Release/bin/opt: benchmark4pipeline_c/heronian_triangles.bc: error: Could not open input file: No such file or directory
[0;31mSouper pass finished[0m
wasm-ld-8: error: cannot open benchmark4pipeline_c/heronian_triangles.opt1.bc: No such file or directory
stat failed: No such file or directory
wc: benchmark4pipeline_c/heronian_triangles.wasm: No such file or directory
wc: benchmark4pipeline_c/heronian_triangles.opt1.wasm: No such file or directory


Sat Dec 21 17:49:33 UTC 2019 Sat Dec 21 17:49:32 UTC 2019

real	0m0.088s
user	0m0.052s
sys	0m0.027s

```
#### knuth's_algorithm_S.c

```

[0;31mSouperifying benchmark4pipeline_c/knuth's_algorithm_S...[0m

; Listing all replacements for s_of_n_init
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for sample_set_i
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for s_of_n
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for test
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1642 1642

Sat Dec 21 17:49:33 UTC 2019 Sat Dec 21 17:49:33 UTC 2019

real	0m0.126s
user	0m0.100s
sys	0m0.029s

```
#### n-queens_problem.c

```
[0;31mSouperifying benchmark4pipeline_c/n-queens_problem...[0m

; Listing all replacements for solve
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1110 1110

Sat Dec 21 17:49:33 UTC 2019 Sat Dec 21 17:49:33 UTC 2019

real	0m0.113s
user	0m0.085s
sys	0m0.031s

```
#### nautical_bell.c

```
[0;31mSouperifying benchmark4pipeline_c/nautical_bell...[0m

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
674 674

Sat Dec 21 17:49:33 UTC 2019 Sat Dec 21 17:49:33 UTC 2019

real	0m0.083s
user	0m0.056s
sys	0m0.031s

```
#### paraffins.c

```
[0;31mSouperifying benchmark4pipeline_c/paraffins...[0m

; Listing all replacements for choose
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for tree
; Using solver: Z3 + external cache + internal cache

; Replacing "  %cmp.us = icmp ult i64 %b.0.us, 5"
; from ""
; with "i1 true" in:
"%0:i64 = var (range=[0,5))
%1:i1 = eq 4:i64, %0
pc %1 0:i1
%2:i64 = add 1:i64, %0 (hasExternalUses)
%3:i1 = ult %2, 5:i64
cand %3 1:i1
"
; with "i1 true"

; Listing all replacements for bicenter
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 1 replacements done on this module
[0;31mSouper pass finished[0m
1806 1797

Sat Dec 21 17:49:33 UTC 2019 Sat Dec 21 17:49:33 UTC 2019

real	0m0.124s
user	0m0.079s
sys	0m0.046s

```
#### pascal_matrix_generation.c

```

[0;31mSouperifying benchmark4pipeline_c/pascal_matrix_generation...[0m

; Listing all replacements for pascal_low
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for pascal_upp
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for pascal_sym
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
4983 4983

Sat Dec 21 17:49:33 UTC 2019 Sat Dec 21 17:49:33 UTC 2019

real	0m0.225s
user	0m0.191s
sys	0m0.037s

```
#### perfect_shuffle.c

```

[0;31mSouperifying benchmark4pipeline_c/perfect_shuffle...[0m

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for CreateDeck
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for InitDeck
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for ShuffleDeck
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for InitedDeck
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for FreeDeck
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for DuplicateDeck
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1470 1470

Sat Dec 21 17:49:33 UTC 2019 Sat Dec 21 17:49:33 UTC 2019

real	0m0.130s
user	0m0.078s
sys	0m0.055s

```
#### pythagorean_triples.c

```

[0;31mSouperifying benchmark4pipeline_c/pythagorean_triples...[0m

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
693 693

Sat Dec 21 17:49:33 UTC 2019 Sat Dec 21 17:49:33 UTC 2019

real	0m0.105s
user	0m0.072s
sys	0m0.036s

```

#### resistor_mesh.c

```
[0;31mSouperifying benchmark4pipeline_c/resistor_mesh...[0m

; Listing all replacements for alloc2
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for set_boundary
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for calc_diff
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for iter
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
2265 2265

Sat Dec 21 17:49:34 UTC 2019 Sat Dec 21 17:49:33 UTC 2019

real	0m0.158s
user	0m0.128s
sys	0m0.033s

```
#### run-length_encoding.c

```

[0;31mSouperifying benchmark4pipeline_c/run-length_encoding...[0m

; Listing all replacements for sget
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for sput
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for file_put
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for output
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for encode
; Using solver: Z3 + external cache + internal cache

; Replacing "  %cmp10.i = icmp sgt i32 %sub14, 0"
; from ""
; with "i1 true" in:
"%0:i32 = var
%1:i1 = slt 2:i32, %0
pc %1 1:i1
%2:i32 = addnsw 4294967294:i32, %0 (hasExternalUses)
%3:i1 = slt 0:i32, %2
cand %3 1:i1
"
; with "i1 true"

; Listing all replacements for decode
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 1 replacements done on this module
[0;31mSouper pass finished[0m
1741 1736

Sat Dec 21 17:49:34 UTC 2019 Sat Dec 21 17:49:34 UTC 2019

real	0m0.143s
user	0m0.117s
sys	0m0.027s

```
#### sattolo_cycle.c

```

[0;31mSouperifying benchmark4pipeline_c/sattolo_cycle...[0m

; Listing all replacements for sattoloCycle
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1895 1895

Sat Dec 21 17:49:34 UTC 2019 Sat Dec 21 17:49:34 UTC 2019

real	0m0.108s
user	0m0.081s
sys	0m0.030s

```
#### sexy_primes.c

```

[0;31mSouperifying benchmark4pipeline_c/sexy_primes...[0m

; Listing all replacements for sieve
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for printHelper
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for printArray
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
3608 3608

Sat Dec 21 17:49:34 UTC 2019 Sat Dec 21 17:49:34 UTC 2019

real	0m0.191s
user	0m0.156s
sys	0m0.035s

```
#### shortest_common_supersequence.c

```
[0;31mSouperifying benchmark4pipeline_c/shortest_common_supersequence...[0m

; Listing all replacements for scs
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1264 1264

Sat Dec 21 17:49:34 UTC 2019 Sat Dec 21 17:49:34 UTC 2019

real	0m0.120s
user	0m0.101s
sys	0m0.021s

```
#### smith_numbers.c

```
[0;31mSouperifying benchmark4pipeline_c/smith_numbers...[0m

; Listing all replacements for numPrimeFactors
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for primeFactors
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for sumDigits
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for sumFactors
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for listAllSmithNumbers
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1268 1268

Sat Dec 21 17:49:34 UTC 2019 Sat Dec 21 17:49:34 UTC 2019

real	0m0.126s
user	0m0.100s
sys	0m0.030s

```
#### validate_international_securities_identification_number.c

```

[0;31mSouperifying benchmark4pipeline_c/validate_international_securities_identification_number...[0m

; Listing all replacements for check_isin
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1200 1200

Sat Dec 21 17:49:34 UTC 2019 Sat Dec 21 17:49:34 UTC 2019

real	0m0.104s
user	0m0.093s
sys	0m0.013s


```
#### weird_numbers.c

```

[0;31mSouperifying benchmark4pipeline_c/weird_numbers...[0m

; Listing all replacements for divisors
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for abundant
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for semiperfect
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for sieve
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
1503 1503

Sat Dec 21 17:49:35 UTC 2019 Sat Dec 21 17:49:34 UTC 2019

real	0m0.134s
user	0m0.112s
sys	0m0.025s

```
#### zebra_puzzle.c

```

[0;31mSouperifying benchmark4pipeline_c/zebra_puzzle...[0m

; Listing all replacements for printHouses
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for checkHouses
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for bruteFill
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache

Total of 0 replacements done on this module
[0;31mSouper pass finished[0m
3119 3119

Sat Dec 21 17:49:35 UTC 2019 Sat Dec 21 17:49:35 UTC 2019

real	0m0.172s
user	0m0.141s
sys	0m0.032s
```

### Overall Result

```

benchmark4pipeline_c/2048.1.c T 1

13621
benchmark4pipeline_c/2048.c T 0

3021 3021
benchmark4pipeline_c/Banker's_algorithm.c T 0

5182 5182
benchmark4pipeline_c/addition_chains.c T 0

2051 2051
benchmark4pipeline_c/aliquot_sequence_classifications_1.c T 0

2566 2566
benchmark4pipeline_c/aliquot_sequence_classifications_2.c T 1

431 411
benchmark4pipeline_c/babbage_problem.c T 0

2051 2142
benchmark4pipeline_c/bitwise_IO.c T 0

1198 1198
benchmark4pipeline_c/eban_numbers.c T 0

1585 1585
benchmark4pipeline_c/evolutionary_algorithm.c T 0

3517 3449
benchmark4pipeline_c/flipping_bits_game.c T 0


benchmark4pipeline_c/heronian_triangles.c T 0

1642 1642
benchmark4pipeline_c/knuth's_algorithm_S.c T 1

1110 1110
benchmark4pipeline_c/n-queens_problem.c T 0

674 674
benchmark4pipeline_c/nautical_bell.c T 0

1806 1797
benchmark4pipeline_c/paraffins.c T 0

4983 4983
benchmark4pipeline_c/pascal_matrix_generation.c T 0

1470 1470
benchmark4pipeline_c/perfect_shuffle.c T 0

693 693
benchmark4pipeline_c/pythagorean_triples.c T 0

2265 2265
benchmark4pipeline_c/resistor_mesh.c T 1

1741 1736
benchmark4pipeline_c/run-length_encoding.c T 0

1895 1895
benchmark4pipeline_c/sattolo_cycle.c T 0

3608 3608
benchmark4pipeline_c/sexy_primes.c T 0

1264 1264
benchmark4pipeline_c/shortest_common_supersequence.c T 0

1268 1268
benchmark4pipeline_c/smith_numbers.c T 0

1200 1200
benchmark4pipeline_c/validate_international_securities_identification_number.c T 0

1503 1503
benchmark4pipeline_c/weird_numbers.c T 1


3119 3119
benchmark4pipeline_c/zebra_puzzle.c T 0

```
