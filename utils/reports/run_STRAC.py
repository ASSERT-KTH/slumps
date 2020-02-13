import os
import sys
import json
from jinja2 import Template
import re
import webbrowser
import numpy as np
from subprocess import Popen
import shutil
import matplotlib.pyplot as plt

import io
import base64


markdown_header = """
## {{namespace}}
### STATIC DTW
![Hello World](data:image/png;base64,{{base64_static}})
"""



markdown_template = """
## [{{namespace}}](https://raw.githubusercontent.com/KTH/slumps/master/benchmark_programs/rossetta/valid/no_input/{{namespace}}.c) 


(Sanitization percent {{sanitization}})

| Program ({{count}})  | Instructions (Std {{ "%10.2f" | format(avg)}}, Mean {{ "%10.f" | format(mean)}}) | Memory trace size (Std {{ "%10.2f" | format(avg_mem)}}, Mean {{ "%10.f" | format(mean_mem)}})| Stack trace size (Std {{ "%10.2f" | format(avg_st)}}, Mean {{ "%10.f" | format(mean_st)}})| Opcode trace size (Std {{ "%10.2f" | format(avg_op)}}, Mean {{ "%10.f" | format(mean_op)}}) | Out (shown if different or original)
| -------- |:--------:|:------:|:------:|:------:|:--------:|
{% for item in summaries %}{{item.0}} | {{item.2}} {{item.7}} |  {{item.3}} {{item.8}}|  {{item.4}} {{item.9}} |  {{item.5}} {{item.10}} | ``` {{item.6}}```
{% endfor %}


"""

def getmetafromfilename(name, meta):
    r = re.compile(r"\[(\d+)\]")

    opt_level = [int(r) for r in r.findall(name)]

    if len(opt_level) < 1:
        return "**(original)** "+name.split("/")[-1] + "%s"%(" **timeout**" if meta["timeout"] else ""), []

    return name.split("/")[-1] + "%s"%(" **timeout**" if meta["timeout"] else ""), opt_level

def reportProgram(namespace, meta):

    template = Template(markdown_template)

    summaries = [[*getmetafromfilename(p, meta[p]),meta[p]["instruction_count"], meta[p]["mem_trace_count"], meta[p]["stack_trace_count"], meta[p]["opcode_count"], meta[p]["output"].replace("\n", ".")] for p in meta.keys() if p.endswith(".wasm")]
    summaries = sorted(summaries, key = lambda x: 0 if x[0].startswith("**(original)") else 1)

    baseline = summaries[0]

    summaries = [[*s, "↑" if s[2] > baseline[2] else ("↓" if s[2] < baseline[2] else "") ] for s in summaries]
    summaries = [[*s, "↑" if s[3] > baseline[3] else ("↓" if s[3] < baseline[3] else "") ] for s in summaries]
    summaries = [[*s, "↑" if s[4] > baseline[4] else ("↓" if s[4] < baseline[4] else "") ] for s in summaries]
    summaries = [[*s, "↑" if s[5] > baseline[5] else ("↓" if s[5] < baseline[5] else "") ] for s in summaries]

    s = set([s[6] for s in summaries])

    baseline_output = summaries[0][6]

    for s1 in summaries:
        if s1[6] == baseline_output:
            s1[6] = ''
    summaries[0][6] = baseline_output

    san = (1 - (len(s)/len(summaries))) if len(s) > 1 else 1

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
        avg_op = np.std([s[5] for s in summaries]),
        sanitization="%10.2f %%"%(san*100)
    )

    return content

def runSTRAC(f, jsonSTRAC, STRAC_JAR):
    #staticSTRACJsonPayloadFile = os.path.abspath(staticSTRACJsonPayloadFile)
    
    print("Calling STRAC for static...%s"%f)
    shutil.copy("log4j.properties", "%s/log4j.properties"%f)

    try:
        os.chdir(f)

        staticMetaJson = json.loads(open(jsonSTRAC, 'r').read())

        # change outputDir to external device to avoid out of space

        outputJson = "%s/%s"%(staticMetaJson["outputDir"],staticMetaJson["outputAlignmentMap"])

        if os.path.exists(outputJson):
            return  processSTRACResult(json.loads(open(outputJson, 'r').read()))

        
        if len(jsonSTRAC["files"]) > 100:
            return None

        print(outputJson)
        
        if not os.path.exists(jsonSTRAC):
            print("No static STRAC")
            os.chdir("../")

        #os.chdir(os.path.dirname(STRAC_JAR))
        p = Popen(args=["java", "-jar", STRAC_JAR, jsonSTRAC])

        s, r = p.communicate()

        jsonResult = json.loads(open(outputJson, 'r').read())

        print(jsonResult)
        return processSTRACResult(jsonResult)
    except Exception as e:
        print(e)
        return None
    finally:
        os.chdir("../")

def processSTRACResult(json):
    fig, ax = plt.subplots()

    NAMES = json["fileMap"]
    DTW_VALUES = json["functionMap"]

    vals = [[0 for _ in range(len(NAMES))] for _ in range(len(NAMES))]

    for index1, values in DTW_VALUES.items():
        i = int(index1)
        vals[i][i] = 0
        for index2, val in values.items():
            j = int(index2)
            
            vals[i][j] = val
            vals[j][i] = val

    im = ax.imshow(vals)
    NAMES = [NAMES[k].split(".")[0] for k in NAMES.keys()]
    ax.set_xticks(np.arange(len(NAMES)))
    ax.set_yticks(np.arange(len(NAMES)))

    ax.set_xticklabels(NAMES)
    ax.set_yticklabels(NAMES)

# Rotate the tick labels and set their alignment.
    plt.setp(ax.get_xticklabels(), rotation=45, ha="right",
         rotation_mode="anchor")

# Loop over data dimensions and create text annotations.
    for i in range(len(NAMES)):
        for j in range(len(NAMES)):
            text = ax.text(j, i, vals[i][j], ha="center", va="center", color="w")


    fig.tight_layout()

    memIO = io.BytesIO()
    plt.savefig(memIO, format='png')
    memIO.seek(0)
    jpegB64:bytes = base64.b64encode(memIO.read())

    return jpegB64.decode("utf-8")

def main(STRAC_JAR, REPORT_FOLDER):
    folders = [f for f in os.listdir(".") if os.path.isdir(f)]
    summ = open("SWAM_summary.md", 'w')

    #summ.write(markdown_header)
    overall = []
    errors = []
    for f in folders:
        metaJsonFileName = "%s/%s.meta.json"%(f, f)

        try:

            staticSTRACJsonPayloadFile = "%s.static.STRAC.json"%f
            base64Image = runSTRAC(f, staticSTRACJsonPayloadFile, STRAC_JAR)

            t = Template(markdown_header)
            overall.append(t.render(base64_static=base64Image, namespace=f))

        except Exception as e:
            #aise e
            print(e)

        try:
            metaJson = json.loads(open(metaJsonFileName, 'r').read())
            r = reportProgram(f, metaJson)

            overall.append(r)
            # RUN STRAC over the three channels

        except Exception as e:
            print(e)
            errors.append("""**{f}:** {e}\n\n""".format(e=e, f= f))




    summ.write("""### Fail ({fail})\n\n ### Success ({success})\n\n""".format(fail=len(errors), success=len(overall)))

    for e in errors:
        summ.write(e)
    for r in overall:
        summ.write(r)        
    summ.close()

    webbrowser.get("chrome").open("file://%s"%os.path.realpath("SWAM_summary.md"), new = 2)


if __name__ == "__main__":
    report_folder = os.path.dirname(__file__)
    os.chdir(sys.argv[1])

    strac_JAR = sys.argv[2]

    main(strac_JAR, report_folder)



"""
Total_circles_area.mem.STRAC.json
Total_circles_area.meta.json
Total_circles_area.opcode.STRAC.json
Total_circles_area.stack.STRAC.json
Total_circles_area.static.STRAC.json
"""