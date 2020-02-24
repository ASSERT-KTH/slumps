import sys
import json
import matplotlib.pyplot as plt
import numpy as np
from common import *

def process(meta):
    model = json.loads(open(meta, 'r').read())[:60]
    


    latexify(fig_width=9, fig_height=4, font_size=13, tick_size=9)

    fix, ax = plt.subplots()
    
    format_axes(ax, hide=['top', 'right'], show=['bottom', 'left'])

    marginLeft=0.05
    marginRight=0.05
    marginBottom = 0.10
    marginTop = 0.05
    plt.tight_layout(rect=(0 + marginLeft,marginBottom,1 - marginRight,1 - marginTop), w_pad=1.0)
    
    ind = range(len(model))

    total = [s[1] for s in model]
    diff = [s[2] for s in model]

    width = 2
    padding = 0.1

    p1 = ax.bar(ind, total)
    p2 = ax.bar(ind, diff)

    plt.legend((p1[0], p2[0]), ('Program variant', 'Different program variants'))

    ax.set_yscale('log')

    plt.ylabel('Number of programs (logarithmic scale)')
    plt.xlabel('Programs, sorted by number of different variants')
    plt.xticks([])
    #plt.xticks(ind, [m[0].replace("_", "").replace("$", "") for m in model], rotation=45,ha='right')
    #plt.yticks(np.arange(0, 81, 10))

    #plt.show()
    plt.savefig("stage1.pdf")


if __name__ == "__main__":
    process(sys.argv[1])