import matplotlib.pyplot as plt
import json
import numpy as np
import sys

def processSTRACResult(F, name):
    meta = json.loads(open(F, 'r').read())
    fig, ax = plt.subplots()

    NAMES = meta["fileMap"]
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
    NAMES = [NAMES[k].split(".")[0] for k in NAMES.keys()]
    ax.set_xticks(np.arange(len(NAMES)))
    ax.set_yticks(np.arange(len(NAMES)))

    ax.set_xticklabels(NAMES)
    ax.set_yticklabels(NAMES)
    plt.setp(ax.get_xticklabels(), rotation=45, ha="right", rotation_mode="anchor")

    for i in range(len(NAMES)):
        for j in range(len(NAMES)):
            text = ax.text(j, i, vals[i][j], ha="center", va="center", color="w")


    analysis_output["DTWS"] = [[d for d in a] for a in vals]
    analysis_output["MAX_DTW"] = np.max(vals)
    analysis_output["NORMALIZED"] = [[d for d in a ] for a in vals/np.max(vals)]

    print(analysis_output)
    fig.tight_layout()
    plt.savefig("%s.png"%name)

    open("/programs/results/{{inputs.parameters.namespace}}%s.json"%name, 'w').write(json.dumps(analysis_output))


if __name__ == "__main__":
    processSTRACResult(sys.argv[1], "test")