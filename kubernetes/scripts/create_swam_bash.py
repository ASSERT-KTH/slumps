import os
from jinja2 import Template
import sys
import argparse
import stat

head='''

programs=({{programs}})

steps=$((${{'{#'}}programs[@]}))  
QUEUE_SIZE={{job_size}}
START=0

for ((i=START; i<steps; i++)); do
    idx=$((i))
    echo "P: " ${programs[idx]}

    if ! ((idx % $QUEUE_SIZE)); then
        wait
        {{command}} ${programs[idx]} {{args}} &
    else
        {{command}} ${programs[idx]} {{args}} &
            # echo "work" $idx
    fi
done

'''

bash =  '''
#!/bin/bash

wait
# Collecting traces to a STRAC json

mkdir -p results/{{namespace}}
python3 collect.py  {{namespace}} results/{{namespace}} {{namespace}}  --minimum {{k}}


cp {{STRAC_COMMAND}}/../log4j.properties {{args}}

cd {{args}}

mkdir -p {{namespace}}/results

java -Xmx6g -jar {{STRAC_COMMAND}}/STRAC-align-0.1.jar "memSTRAC.json"
java -Xmx6g -jar {{STRAC_COMMAND}}/STRAC-align-0.1.jar "opcodeSTRAC.json"
java -Xmx6g -jar {{STRAC_COMMAND}}/STRAC-align-0.1.jar "staticSTRAC.json"
java -Xmx6g -jar {{STRAC_COMMAND}}/STRAC-align-0.1.jar "stackSTRAC.json"


python3 ../plot.py {{namespace}}/results/{{namespace}}.stack.json {{namespace}} stack_DTW {{namespace}}/results
python3 ../plot.py {{namespace}}/results/{{namespace}}.mem.json {{namespace}} mem_DTW {{namespace}}/results
python3 ../plot.py {{namespace}}/results/{{namespace}}.opcode.json {{namespace}} opcode_DTW {{namespace}}/results
python3 ../plot.py {{namespace}}/results/{{namespace}}.static.json {{namespace}} static_DTW {{namespace}}/results

'''

def process(folder, namespace, include_execution=False, number_of_executions =100, k = 10, name="script", command='', STRAC=''):

    programs = [os.path.abspath("%s/%s/%s"%(folder, namespace, i)) for i in os.listdir("%s/%s"%(folder, namespace))]

    template = Template(head + bash if include_execution else bash)

    content = template.render(
        programs = " ".join(programs),
        job_size=number_of_executions,
        command = command,
        args=namespace,
        namespace=namespace,
        STRAC_COMMAND=STRAC,
        k = k
    )

    if os.path.exists("%s.sh"%name):
        os.remove("%s.sh"%name)
    open("%s.sh"%name, 'w').write(content)


if __name__ == "__main__":

    # "../../benchmark_programs/variants", "mt2" True 100
    

    parser = argparse.ArgumentParser(description="Generate a script bash to execute program variants in parallel")

    parser.add_argument("folder", metavar='f', type=str, help="Folder that contains the tracess")
    parser.add_argument("namespace", metavar='n', type=str, help="Program name. It should be equal to the baseline")
    
    parser.add_argument("--include_head", metavar='i', type=bool, help="Include the execution header",  default=True)
    parser.add_argument("--concurrent_jobs", metavar='c', type=int,help="Number of concurrent jobs",  default=100)
    parser.add_argument("--minimum", metavar='m', type=int, help="Minimum number of comparissons per program",  default=10000)
    parser.add_argument("--script", metavar='s', type=str, help="Script name",  default='script')
    parser.add_argument("--swam", metavar='w', type=str, help="Swam command",  default='java -jar /Users/javierca/Documents/Develop/swam/out/slumps/assembly/dest/out.jar ')
    parser.add_argument("--strac", metavar='r', type=str, help="STRAC command",  default="/Users/javierca/Documents/IdeaProjects/STRAC/STRACAlign/target")


    args = parser.parse_args()
    
    process(args.folder, args.namespace, args.include_head, args.concurrent_jobs, args.minimum, args.script, args.swam, args.strac)
