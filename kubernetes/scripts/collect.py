import os
import json
import sys

def main(namespace, out):

    stracMem = dict(
        pairs=[],
        method=dict(
        name="FastDTW",
        params=[30000]
        ),
        outputAlignment=True,
        outputDir=out,
        outputAlignmentMap=namespace,
        exportImage=True,
        separator="[\r\n]",
        clean=[],
        include=None,
        comparison=dict(
        eq=0,
        diff=5,
        gap=1
        )
    )

    files = os.listdir(out)
    print(files)

    memFiles = list(filter(lambda x: x.endswith("mem.strac.log"), files))
    stackFiles = list(filter(lambda x: x.endswith("stack.strac.log"), files))
    staticFiles = list(filter(lambda x: x.endswith("instructions.strac.log"), files))
    opcodeFiles = list(filter(lambda x: x.endswith("strace.strac.log"), files))

    stracMem["files"] = memFiles
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
    main(sys.argv[1], sys.argv[2])