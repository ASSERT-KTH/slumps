### Links to the source of Benchmark Programs
- [Chemical_Calculator](http://rosettacode.org/wiki/Chemical_Calculator#C.2B.2B)
- [Eban_numbers](http://rosettacode.org/wiki/Eban_numbers#C.2B.2B)
- [Elementary_cellular_automaton](http://rosettacode.org/wiki/Elementary_cellular_automaton#C.2B.2B)
- [Geometric_algebra](http://rosettacode.org/wiki/Geometric_algebra#C.2B.2B)
- [Kolakoski_sequence](http://rosettacode.org/wiki/Kolakoski_sequence#C.2B.2B)
- [Latin_Squares_in_reduced_form](http://rosettacode.org/wiki/Latin_Squares_in_reduced_form#C.2B.2B)
- [N-queens_problem](http://rosettacode.org/wiki/N-queens_problem#C.2B.2B)
- [Nim_Game](http://rosettacode.org/wiki/Nim_Game#C.2B.2B)
- [Ramer-Douglas-Peucker_line_simplification](http://rosettacode.org/wiki/Ramer-Douglas-Peucker_line_simplification#C.2B.2B)
- [Resistor_mesh](http://rosettacode.org/wiki/Resistor_mesh#C.2B.2B)
- [Sattolo_cycle](http://rosettacode.org/wiki/Sattolo_cycle#C.2B.2B)
- [Smith_numbers](http://rosettacode.org/wiki/Smith_numbers#C.2B.2B)
- [Zebra_puzzle](http://rosettacode.org/wiki/Zebra_puzzle#C.2B.2B)

### How do we select these benchmark programs?
We explore [the catalog of C++ pages in Rosetta Code](http://rosettacode.org/wiki/Category:C%2B%2B), and pick up programs which:
1. have no specific header files (such as `windows.h`) or external libs (such as `Boost`)
2. can be compiled correctly (no error messages when compiling to LLVM IR)
3. take shorter time to generate optimized candidates by Souper, as compared to other programs
4. can generate valid optimization of RHS results by Google/Souper
5. The programs are self-contained

These benchmark datasets are small-medium sized programs whose lines are between 30 and 200.

