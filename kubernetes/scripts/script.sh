
#!/bin/bash

wait
# Collecting traces to a STRAC json

mkdir -p results/Mt
python3 collect.py results/Mt Mt 


cp /Users/javierca/Documents/IdeaProjects/STRAC/STRACAlign/target/../log4j.properties Mt

cd Mt

mkdir -p Mt/results

#java -jar /Users/javierca/Documents/IdeaProjects/STRAC/STRACAlign/target/STRAC-align-0.1.jar "memSTRAC.json" 
java -Xmx8g  -jar /Users/javierca/Documents/IdeaProjects/STRAC/STRACAlign/target/STRAC-align-0.1.jar "opcodeSTRAC.json" 
#java -jar /Users/javierca/Documents/IdeaProjects/STRAC/STRACAlign/target/STRAC-align-0.1.jar "staticSTRAC.json" 
java -Xmx8g  -jar /Users/javierca/Documents/IdeaProjects/STRAC/STRACAlign/target/STRAC-align-0.1.jar "stackSTRAC.json" 

wait

python3 ../plot.py Mt/results/Mt.stack.json Mt stack_DTW Mt/results
python3 ../plot.py Mt/results/Mt.mem.json Mt mem_DTW Mt/results
python3 ../plot.py Mt/results/Mt.opcode.json Mt opcode_DTW Mt/results
python3 ../plot.py Mt/results/Mt.static.json Mt static_DTW Mt/results
