import matplotlib.pyplot as plt
import json
import numpy as np
import sys
import os

def processSTRACResult(F, namespace, name, out):

    if not os.path.exists(F):
        print("The file %s does not exist"%F)
        return

    meta = json.loads(open(F, 'r').read())
    NAMES = meta["fileMap"]

    NAMES = [NAMES[k].split(".")[0] for k in NAMES.keys()]
    fig, ax = plt.subplots(figsize=(7 + 0.5*len(NAMES),7 + 0.5*len(NAMES)))

    DTW_VALUES = meta["functionMap"]

    analysis_output = {}

    vals = [[0 for _ in range(len(NAMES))] for _ in range(len(NAMES))]

    for index1, values in DTW_VALUES.items():
        i = int(index1)
        vals[i][i] = 0
        for index2, val in values.items():
            j = int(index2)
            
            vals[i][j] = val
            vals[j][i] = val

    im = ax.imshow(vals)
    ax.set_xticks(np.arange(len(NAMES)))
    ax.set_yticks(np.arange(len(NAMES)))

    ax.set_xticklabels(NAMES)
    ax.set_yticklabels(NAMES)
    plt.setp(ax.get_xticklabels(), rotation=45, ha="right", rotation_mode="anchor")

    for i in range(len(NAMES)):
        for j in range(len(NAMES)):
            text = ax.text(j, i, vals[i][j], ha="center", va="center", color="r", fontsize=40/len(NAMES))


    analysis_output["DTWS"] = [[d for d in a] for a in vals]
    analysis_output["MAX_DTW"] = np.max(vals)
    analysis_output["NAMES"] = NAMES
    analysis_output["NORMALIZED"] = [[d for d in a ] for a in vals/np.max(vals)]

    print(analysis_output)
    fig.tight_layout()
    plt.savefig("%s/%s_%s.pdf"%(out, namespace, name))

    open("%s/%s_%s.json"%(out, namespace, name), 'w').write(json.dumps(analysis_output))

if __name__ == "__main__":
    processSTRACResult(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
