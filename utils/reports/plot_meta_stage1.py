import sys
import json
import matplotlib.pyplot as plt
import numpy as np
from common import *

def process(meta):
    model = json.loads(open(meta, 'r').read())["children"]["compiled"]["children"]["with_variants"]["variants"]
    
    model = list(sorted(model, key = lambda x: x[0], reverse=True))

    print(len(model))
    print(model)
    
    latexify(fig_width=14, fig_height=10, font_size=10, tick_size=10)

    fix, ax = plt.subplots()
    
    format_axes(ax, hide=['top', 'right'], show=['bottom', 'left'])

    marginLeft=0.05
    marginRight=0.05
    marginBottom = 0.25
    marginTop = 0.05
    plt.tight_layout(rect=(0 + marginLeft,marginBottom,1 - marginRight,1 - marginTop), w_pad=1.0)
    
    pad = 2.0
    ind = [2*p + pad*p for p in list(range(len(model)))]
    ind2 = [(2*p + 1) + pad*p for p in list(range(0,len(model)))]

    print(ind, ind2)



    total = [100.0*s[1]/s[0] for s in model]
    diff = [s[2] for s in model]

    width = 1
    padding = 0.1

    #p2 = ax.bar(ind, [100 for v in range(len(model))], width=width, alpha=0.1)
    p1 = ax.bar(ind, total, width=width)
    #plt.legend((p1[0], p2[0]), ('Program variants count', 'Unique variants count $|U(P)|$'), loc='best', bbox_to_anchor=(0.5,1.1))

    #x.set_yscale('log')

    plt.ylabel('Percent of unique variants')
    plt.xlabel('Programs, sorted by number of variants')
    plt.xticks([])

    plt.xticks(ind, [m[3].replace("_", " ").replace("$", "") for m in model], rotation=45,ha='right')
    #plt.xticks(ind, ["p%s"%m for m in range(1,len(model) + 1)], rotation=45,ha='right')

    ticks = list(set(total))

    ticks = filter(lambda x: x >= 0, ticks)
    ticks = list(ticks) + [100]
    ticks = list(sorted(ticks))

    delta = 1.5

    finalTicks = []
    prev = 0
    for t in ticks:
        if t - prev > delta:
            finalTicks.append(t)
            prev = t


    ax.tick_params(axis='y', which='major', pad=10)
    #plt.yticks(finalTicks)

    rects = ax.patches

    # Make some labels.
    labels = ["%d" % i for i in [v[0] for v in model]]

    #ax.grid(color='grey', ls = '-.', lw = 0.25)

    for rect, label in zip(rects, labels):
        height = rect.get_height()
        ax.text(rect.get_x() + rect.get_width() / 2, height + 2, label,
                ha='center', va='bottom', rotation=45, fontsize=9)

    #plt.show()
    #plt.savefig("/Users/javierca/Documents/Develop/CROW-paper/plots/stage1.pdf")\
    plt.savefig("stage1.pdf")


if __name__ == "__main__":
    process(sys.argv[1])