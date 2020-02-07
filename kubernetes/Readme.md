In this folder you can find the argo workflow definition to run the whole benchmark (Rosetta C code) in SLUMPs. Argo provides the way to parallelize every program-SLUMPs execution. 

For more information about Argo workflows and experiments parallelization, go to [this](https://www.ovh.com/blog/simplify-your-research-experiments-with-kubernetes/) address.

### Settings:
- Ensure you have the minIO service deployed to collect the outputs.
- Set the number of concurrent threads in the ```parallelism``` setting in the yml file.
- Set the timeout per program in the evironment variable for the slumps:app container.

