## CROW experiments over Rosetta programs

## Folder content

- `crow_over_rosetta.csv`: CSV file with the names  of the prorams, the program identifier, identified code blocks, number of variable inferred code blocks, number of unique variants (following sha256 over the binaries), and the number of generated variants.
- `crow.7z`: MongoDB database that contains the analysis for the CROW diversified programs. The database is conformed by 3 main collections: *variants*, *wasms* and *alignments*: 

	- The variants collection contains for every program from the Rosetta corpus, the number of generated variants, and the static alignment heatmap for the pairwise comparison between the program variants in both representations, **WASM** and **x86 machine code**. 

	- The wasms collection contains the blob binary for every generated **WASM** variant. 

	- The alignments collection contains the alignments for each DTW comparison made during our experimentation. We generated the alignments for sake of illustration beyond the standard `diff` tool, to be able to detect interesting patterns in the transformations made by CROW and the machine code compilation. 

### Prerequisites
- Install `git lfs` to be able to download the mongodb database that contains the experiment results.

