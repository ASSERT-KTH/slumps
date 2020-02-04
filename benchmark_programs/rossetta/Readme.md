### Rosetta code C code

We crawled the C programs from Rosetta corpus: From 998 programs, we collected **990** programs ([here](https://github.com/KTH/slumps/tree/master/src/crawl_rosetta.py) is the crawling script). We checked all the programs compiling them (with clang), getting: **880** successfully compiled programs and **109** invalid-to-compile codes.


#### Folder structure

- rosetta
    - **fail** (8 files): Fail to crawl the C code
    - **invalid** (109 files): We tried to compile the code targeting ```wasm32-unknown-unknown``` triple with clang. Compilation error is added as a C block comment in the file end ([for example](invalid/Bitmap.c)).
    - **valid** (880 files): We classify this files in two categories: Input expecting code (looking for functions like scanf) and self-contained programs (no input expected from user)
        - **no_input** (789 files)
        - **input expected** (91 files)


### SLUMPs output

- [Experiment 1hour timeout per program](Experiment_report1.md)