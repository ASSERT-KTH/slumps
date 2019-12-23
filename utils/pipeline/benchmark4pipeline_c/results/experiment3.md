## Experiment 3

```bash
llvm-opt -load ${libsouperPass}  -souper -souper-external-cache -souper-infer-iN  -souper-infer-inst -solver-timeout=300 -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne -z3-path=${z3} -souper-debug-level=2 -o $name.opt$2.bc $name.bc

```

### Overall Result

```
[POISONED LHS]
benchmark4pipeline_c/2048.c T 0

3021 3021
benchmark4pipeline_c/Banker's_algorithm.c T 0

5182 5182
benchmark4pipeline_c/addition_chains.c T 1

2051 2051
benchmark4pipeline_c/aliquot_sequence_classifications_1.c T 0

2566 2566
benchmark4pipeline_c/aliquot_sequence_classifications_2.c T 0

431 411
benchmark4pipeline_c/babbage_problem.c T 0

2051 2142
benchmark4pipeline_c/bitwise_IO.c T 0

1198 1198
benchmark4pipeline_c/eban_numbers.c T 0

1585 1585
benchmark4pipeline_c/evolutionary_algorithm.c T 1

3517 3449
benchmark4pipeline_c/flipping_bits_game.c T 0

[Compilation error]
benchmark4pipeline_c/heronian_triangles.c T 0

1642 1642
benchmark4pipeline_c/knuth's_algorithm_S.c T 0

1110 1110
benchmark4pipeline_c/n-queens_problem.c T 0

674 674
benchmark4pipeline_c/nautical_bell.c T 0

1806 1797
benchmark4pipeline_c/paraffins.c T 0

4983 4983
benchmark4pipeline_c/pascal_matrix_generation.c T 0

1470 1470
benchmark4pipeline_c/perfect_shuffle.c T 1

693 693
benchmark4pipeline_c/pythagorean_triples.c T 0

2265 2265
benchmark4pipeline_c/resistor_mesh.c T 0

1741 1736
benchmark4pipeline_c/run-length_encoding.c T 0

1895 1895
benchmark4pipeline_c/sattolo_cycle.c T 0

3608 3608
benchmark4pipeline_c/sexy_primes.c T 0

1264 1264
benchmark4pipeline_c/shortest_common_supersequence.c T 0

1268 1268
benchmark4pipeline_c/smith_numbers.c T 1

1200 1200
benchmark4pipeline_c/validate_international_securities_identification_number.c T 0

1503 1503
benchmark4pipeline_c/weird_numbers.c T 0

3119 3119
benchmark4pipeline_c/zebra_puzzle.c T 0
```
