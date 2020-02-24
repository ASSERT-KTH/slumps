import os
import json
import sys
import numpy as np
import argparse

def getSamples(size, k):
    pairs = []

    space = [[False for i in range(size)] for j in range(size) ]

    def getMarked(row):

        return [ i for i in range(size) if space[row][i] and i != row ], [i for i in range(size) if not space[row][i] and i != row]

    for i in range(size):
        trues, falses = getMarked(i)
        k1 = k - len(trues)

        if (k1 > 0 and k1 <= len(falses)):
            selected = np.random.choice(falses, size=k1, replace=False)

            for s in selected:
                space[i][s] = True
                space[s][i] = True

                pairs.append([int(i), int(s)])

    return pairs



def main(folder, out, namespace, k = 10000, dtw = 30000, thread=1):

    print(namespace, out)
    stracMem = dict(
        pairs=[],
        method=dict(
        name="FastDTW",
        params=[dtw]
        ),
        outputAlignment=False,
        outputDir=out,
        outputAlignmentMap=namespace,
        exportImage=False,
        separator="[\r\n]",
        clean=[],
        threadPoolCount=thread,
        include=None,
        comparison=dict(
        eq=0,
        diff=5,
        gap=1
        )
    )

    files = os.listdir(folder)
    print(files) 

    memFiles = list(filter(lambda x: x.endswith("mem.strac.log"), files))
    stackFiles = list(filter(lambda x: x.endswith("stack.strac.log"), files))
    staticFiles = list(filter(lambda x: x.endswith("instructions.strac.log"), files))
    opcodeFiles = list(filter(lambda x: x.endswith("strace.strac.log"), files))


    stracMem["files"] = memFiles
    stracMem["pairs"] = getSamples(len(memFiles), k)

    stracMem["outputAlignmentMap"]="%s.mem.json"%namespace
    open("%s/memSTRAC.json"%out, 'w').write(json.dumps(stracMem))


    stracMem["files"] = stackFiles
    stracMem["outputAlignmentMap"]="%s.stack.json"%namespace
    open("%s/stackSTRAC.json"%out, 'w').write(json.dumps(stracMem))


    stracMem["files"] = staticFiles
    stracMem["outputAlignmentMap"]="%s.static.json"%namespace
    open("%s/staticSTRAC.json"%out, 'w').write(json.dumps(stracMem))
    print(stracMem)


    stracMem["files"] = opcodeFiles
    stracMem["outputAlignmentMap"]="%s.opcode.json"%namespace
    open("%s/opcodeSTRAC.json"%out, 'w').write(json.dumps(stracMem))

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description="Collect traces by channle and create STRAC payloads")

    parser.add_argument("folder", metavar='f', type=str, help="Folder that contains the tracess")
    parser.add_argument("namespace", metavar='n', type=str, help="Program name. It should be equal to the baseline")
    parser.add_argument("out", metavar='o', type=str, help="Output file")

    parser.add_argument("--thread_count", metavar='t', type=int, help="thread pool size for STRAC",  default=10)
    parser.add_argument("--minimum", metavar='m', type=int, help="Minimum number of comparissons per program",  default=10000)
    parser.add_argument("--FastDTW", metavar='d', type=int, help="FastDTW parameter",  default=30000)


    args = parser.parse_args()

    main(args.folder, args.out, args.namespace, args.minimum, args.FastDTW, args.thread_count)