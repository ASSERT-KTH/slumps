
import json
import shutil

def process(logsFolder, root, cpTo):
    
    meta = json.loads(open(logsFolder, 'r').read())
    
    programs = [p[3] for p in meta["children"]["compiled"]["children"]["with_variants"]["variants"]]

    for p in programs:
        shutil.copy(f"{root}/{p}.c", f"{cpTo}/{p}.c")
    
    t = '''programs=(%s)

            for ((i=START; i<=steps; i++)); do
            idx=$((i))
            echo ${programs[idx]}
            docker run --rm -v $(pwd):/inputs -v $(pwd)/wasms:/slumps/crow/out --entrypoint python3.7 jacarte/slumps:app slumps.py /inputs/${programs[idx]}.c            
        done
'''%(" ".join(programs))
    f = open(f"{cpTo}/generate.sh", 'w')
    f.write(t)
    f.close()

    #plotTree(meta["count"], [p[0] for p in leafs], [p[1] for p in leafs], [p[2] for p in leafs])
process("data.json", 
"/Users/javierca/Documents/Develop/slumps/benchmark_programs/rossetta/valid/no_input",
"/Users/javierca/Documents/Develop/slumps/benchmark_programs/rossetta/the_sixties")