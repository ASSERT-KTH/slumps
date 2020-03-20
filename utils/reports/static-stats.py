

import re
import json
import matplotlib.pyplot as plt
import squarify
from common import *
import numpy as np

def plotTree(total, percents, labels, colors):

    assert(total == sum(percents))
    latexify(fig_width=9, fig_height=2, font_size=13, tick_size=9)

    f, ax = plt.subplots()

    percents = zip(percents, labels, colors)
    percents = list(sorted(percents, key= lambda x: x[1]))
    percents = [p for p in percents if p[0] > 0]

    squarify.plot(norm_y=100, sizes=[p[0] for p in percents], alpha=.7, label=["%s \\textbf{%s}"%(p[1], p[0]) for p in percents], color=[p[2] for p in percents] )
    plt.axis('off')
    plt.show()

def validateTree(tree):

    if "children" in tree:
        total = tree["count"]

        items = [p[1]["count"] for p in tree["children"].items()]
        assert(total == sum(items))
        for ch in tree["children"].items():
            validateTree(ch[1])

def getLeafs(tree):
    leafs = []
    def simpleLeafs(t):
        if "children" in t:
            for ch in t["children"].values():
                simpleLeafs(ch)
        else:
            leafs.append(t)
    simpleLeafs(tree)
    return leafs

def plotPie(ax, nodes, rad, total):
    
    print(nodes)
    cmap = plt.get_cmap("tab20c")

    size = 0.3
    
    ps = [p["count"] for p in nodes]
    ps.append(total - sum(ps))

    ax.pie(ps, radius=rad, wedgeprops=dict(width=size, edgecolor='w'))

def getNodesByLevel(tree):
    
    result = []
    stack = [tree]

    while len(stack) > 0:
        level = []

        for node in stack:
            if "children" in node:
                for ch in node["children"].values():
                    level.append(ch)
        result.append(stack)
        stack = level
    return result
 
def plotBar(leafs):
    latexify(fig_width=9, fig_height=3, font_size=13, tick_size=9)
    f, ax = plt.subplots()
    format_axes(ax, hide=['top', 'right', 'left'], show=['bottom'])


    cumul = 0
    leafs = sorted(leafs, key=lambda x: x["count"])
    ps = []
    ticks = []
    margin = 2
    for l in leafs:
        p = ax.hlines(0, cumul , cumul + l["count"] - margin,color = l["color"], alpha=0.6, linewidth=15)
        cumul += l["count"]
        ticks.append(cumul)
        ps.append(p)
    
    ax.legend(ps, [p["title"] for p in leafs])
    ax.set_xticks(ticks)
    ax.set_yticks([])
    ax.set_ylim(0, 2)


    marginLeft=0.05
    marginRight=0.05
    marginBottom = 0.05
    marginTop = 0.05
    plt.tight_layout(rect=(0 + marginLeft,marginBottom,1 - marginRight,1 - marginTop), w_pad=1.0)
    
    plt.savefig("/Users/javierca/Documents/Develop/CROW-paper/plots/bar.pdf")


def plotFullPie(leafs):

    latexify(fig_width=9, fig_height=4, font_size=12, tick_size=9)
    fig, ax = plt.subplots()
    format_axes(ax, hide=['top', 'right', 'left'], show=['bottom'])

    recipe = ["%s \\textbf{%s}"%(p["title"], p["count"]) for p in leafs]

    data = [p["count"] for p in leafs]
    explode = [0.02 for _ in leafs]
    wedges, texts = ax.pie(data, wedgeprops=dict(width=0.5), startangle=-40, explode = explode, colors=[p["color"] for p in leafs])

    bbox_props = dict(boxstyle="square,pad=0.3", fc="w", ec="k", lw=0.72)
    kw = dict(arrowprops=dict(arrowstyle="-"),
            bbox=bbox_props, zorder=0, va="center")

    margin = 0.1
    for i, p in enumerate(wedges):
        ang = (p.theta2 - p.theta1)/2. + p.theta1
        y = np.sin(np.deg2rad(ang))
        x = np.cos(np.deg2rad(ang))
        horizontalalignment = {-1: "right", 1: "left"}[int(np.sign(x))]
        connectionstyle = "angle,angleA=0,angleB={}".format(ang)
        kw["arrowprops"].update({"connectionstyle": connectionstyle})
        ax.annotate(recipe[i], xy=(x, y), xytext=(1.35*np.sign(x), 1.4*y),
                    horizontalalignment=horizontalalignment, **kw)

    marginLeft=0.02
    marginRight=0.02
    marginBottom = 0.02
    marginTop = 0.02
    plt.tight_layout(rect=(0 + marginLeft,marginBottom,1 - marginRight,1 - marginTop), w_pad=1.0)
    
    #ax.set_title("Matplotlib bakery: A donut")

    plt.savefig("/Users/javierca/Documents/Develop/CROW-paper/plots/pie.pdf")

def process(logsFolder):
    
    meta = json.loads(open(logsFolder, 'r').read())
    leafs = getLeafs(meta)
    
    def pie():
        latexify(fig_width=9, fig_height=3, font_size=13, tick_size=9)
        f, ax = plt.subplots()
        format_axes(ax, hide=['top', 'right', 'left'], show=['bottom'])

        for i,nodes in enumerate(getNodesByLevel(meta)[1:]):
            plotPie(ax, nodes, 1 - i/10, meta["count"])
        plt.show()
    #pie()
    #plotPie(ax, meta["children"], 1)
    #plotBar(leafs)
    plotFullPie(leafs)
    #plotTree(meta["count"], [p[0] for p in leafs], [p[1] for p in leafs], [p[2] for p in leafs])
process("data.json")