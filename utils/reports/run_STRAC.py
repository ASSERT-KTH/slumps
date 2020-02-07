import os
import sys
import json
from jinja2 import Template
import re
import webbrowser
import numpy as np

markdown_header = """
- [1] -souper-infer-iN
- [2] -souper-infer-iN -souper-synthesis-const-with-cegis -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
- [3] -souper-infer-iN -souper-enumerative-synthesis-num-instructions=2 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-4 = -souper-infer-iN -souper-enumerative-synthesis-num-instructions=5 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-5 = -souper-enumerative-synthesis-ignore-cost -souper-infer-iN -souper-enumerative-synthesis-num-instructions=2 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-6 = -souper-enumerative-synthesis-ignore-cost -souper-infer-iN -souper-enumerative-synthesis-num-instructions=5 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-7 = -souper-enumerative-synthesis-ignore-cost -souper-infer-iN -souper-enumerative-synthesis-num-instructions=10 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-8 = -souper-enumerative-synthesis-ignore-cost -souper-infer-iN -souper-enumerative-synthesis-num-instructions=20 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-9 = -souper-enumerative-synthesis -souper-infer-iN  -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-10 = -souper-enumerative-synthesis -souper-infer-iN -souper-enumerative-synthesis-num-instructions=2 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-11 = -souper-enumerative-synthesis -souper-infer-iN -souper-enumerative-synthesis-num-instructions=5 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-12 = -souper-enumerative-synthesis -souper-infer-iN -souper-enumerative-synthesis-num-instructions=10 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-13 = -souper-enumerative-synthesis -souper-infer-iN -souper-enumerative-synthesis-num-instructions=20 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-14 = -souper-enumerative-synthesis -souper-enumerative-synthesis-ignore-cost  -souper-infer-iN -souper-enumerative-synthesis-num-instructions=2 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-15 = -souper-enumerative-synthesis -souper-enumerative-synthesis-ignore-cost -souper-infer-iN -souper-enumerative-synthesis-num-instructions=5 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-16 = -souper-enumerative-synthesis -souper-enumerative-synthesis-ignore-cost -souper-infer-iN -souper-enumerative-synthesis-num-instructions=8 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne
souper-level-17 = -souper-enumerative-synthesis -souper-enumerative-synthesis-ignore-cost -souper-infer-iN -souper-enumerative-synthesis-num-instructions=15 -souper-infer-inst -souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne

"""

markdown_template = """
## {{namespace}}
| Program ({{count}})  | Instructions (Std {{ "%10.2f" | format(avg)}}, Mean {{ "%10.f" | format(mean)}}) | Memory trace size (Std {{ "%10.2f" | format(avg_mem)}}, Mean {{ "%10.f" | format(mean_mem)}})| Stack trace size (Std {{ "%10.2f" | format(avg_st)}}, Mean {{ "%10.f" | format(mean_st)}})| Opcode trace size (Std {{ "%10.2f" | format(avg_op)}}, Mean {{ "%10.f" | format(mean_op)}})
| -------- |:--------:|:------:|:------:|:------:|
{% for item in summaries %}{{item.0}} | {{item.2}} {{item.6}} |  {{item.3}} {{item.7}}|  {{item.4}} {{item.8}} |  {{item.5}} {{item.9}}
{% endfor %}


"""

def getmetafromfilename(name):
    r = re.compile(r"\[(\d+)\]")

    opt_level = [int(r) for r in r.findall(name)]

    if len(opt_level) < 1:
        return "**(original)** "+name.split("/")[-1], []

    return name.split("/")[-1], opt_level

def reportProgram(namespace, meta, summaryfd):

    template = Template(markdown_template)

    summaries = [[*getmetafromfilename(p),meta[p]["instruction_count"], meta[p]["mem_trace_count"], meta[p]["stack_trace_count"], meta[p]["opcode_count"]] for p in meta.keys() if p.endswith(".wasm")]
    summaries = sorted(summaries, key = lambda x: 0 if x[0].startswith("**(original)") else 1)

    baseline = summaries[0]

    summaries = [[*s, "↑" if s[2] > baseline[2] else ("↓" if s[2] < baseline[2] else "") ] for s in summaries]
    summaries = [[*s, "↑" if s[3] > baseline[3] else ("↓" if s[3] < baseline[3] else "") ] for s in summaries]
    summaries = [[*s, "↑" if s[4] > baseline[4] else ("↓" if s[4] < baseline[4] else "") ] for s in summaries]
    summaries = [[*s, "↑" if s[5] > baseline[5] else ("↓" if s[5] < baseline[5] else "") ] for s in summaries]

    content = template.render(
        count = len(summaries),
        summaries = summaries,
        namespace = namespace,
        mean = np.mean([s[2] for s in summaries]),
        avg = np.std([s[2] for s in summaries]),
        mean_mem = np.mean([s[3] for s in summaries]),
        avg_mem = np.std([s[3] for s in summaries]),
        mean_st = np.mean([s[4] for s in summaries]),
        avg_st = np.std([s[4] for s in summaries]),
        mean_op = np.mean([s[5] for s in summaries]),
        avg_op = np.std([s[5] for s in summaries])
    )

    summaryfd.write(content)

def main(STRAC_JAR, REPORT_FOLDER):
    folders = [f for f in os.listdir(".") if os.path.isdir(f)]
    summ = open("SWAM_summary.md", 'w')

    #summ.write(markdown_header)
    
    for f in folders:
        metaJsonFileName = "%s/%s.meta.json"%(f, f)

        try:
            metaJson = json.loads(open(metaJsonFileName, 'r').read())
            reportProgram(f, metaJson, summ)

        except Exception as e:
            print(e)
    summ.close()

    webbrowser.get("chrome").open("file://%s"%os.path.realpath("SWAM_summary.md"), new = 2)


if __name__ == "__main__":
    report_folder = os.path.dirname(__file__)
    os.chdir(sys.argv[1])

    strac_JAR = sys.argv[2]

    main(strac_JAR, report_folder)

