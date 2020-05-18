import os
import json
import numpy as np
from sklearn.decomposition import PCA
from scipy.stats import pearsonr
import matplotlib.pyplot as plt
import math
from scipy.interpolate import interp1d
import csv
from sklearn import manifold

from common import *

def process(folder, out):

    values_mem = []
    values_stack = []
    values_opcode = []
    values_static = []

    opcode_matrices = []
    mem_matrices = []
    names_matrices = []

    overall = []
    
    values_mem_normalized = []
    values_stack_normalized = []
    values_opcode_normalized = []
    values_static_normalized = []


    names = []
    ps = []

    def getDifferentComparisons(matrix):
        result = []
        for i in range(1,len(matrix)):
            for j in range(i):
                result.append(matrix[i][j])
        return result

    def normalize(arr):
        return [a/max(max(arr), 1) for a in arr]


    def flat(l):
        flat_list = []
        for sublist in l:
            for item in sublist:
                flat_list.append(item)
        return flat_list

    for namespace in os.listdir(folder):
        if namespace != ".DS_Store" and namespace != "variance.pdf" and not namespace.endswith(".pdf") and not namespace.endswith(".png"):
            print(namespace)
            names.append(namespace)
            #DTW_static = json.loads(open("%s/%s/%s_static_DTW.json"%(folder, namespace, namespace), 'r').read())           
            try:
                DTW_mem = json.loads(open("%s/%s/%s_mem_DTW.json"%(folder, namespace, namespace), 'r').read())
                mem_matrices.append(DTW_mem["DTWS"])
            except:
                mem_matrices.append([[]])
            
            try:
            #DTW_stack = json.loads(open("%s/%s/%s_stack_DTW.json"%(folder, namespace, namespace), 'r').read())
                DTW_opcode = json.loads(open("%s/%s/%s_stack_DTW.json"%(folder, namespace, namespace), 'r').read())
                opcode_matrices.append(DTW_opcode["DTWS"])
            except:
                opcode_matrices.append([[]])

            names_matrices.append(DTW_opcode["NAMES"])

            #static = getDifferentComparisons(DTW_static["DTWS"])
            #stack = getDifferentComparisons(DTW_stack["DTWS"])
            #mem = getDifferentComparisons(DTW_mem["DTWS"])
            #opcode = getDifferentComparisons(DTW_opcode["DTWS"])

            #mem_matrices.append(DTW_mem["DTWS"])

            #values_mem.append(mem)
            #values_opcode.append(opcode)
            #values_stack.append(stack)
            #values_static.append(static)

            #values_static_normalized.append(normalize(static))
            #values_stack_normalized.append(normalize(stack))
            #values_mem_normalized.append(normalize(mem))
            #values_opcode_normalized.append(normalize(opcode))
        
    #print(pearsonr(flat(values_opcode), flat(values_stack)))

    #plt.legend(ps, names)
    latexify(fig_width=9, fig_height=8, font_size=10, tick_size=10)

    marginLeft=0.02
    marginRight=0.02
    marginBottom = 0.10
    marginTop = 0.2
    #plt.tight_layout(rect=(0 + marginLeft,marginBottom,1 - marginRight,1 - marginTop), w_pad=1.0)
    #plt.subplots_adjust(0.5, 0.1, 0.9, 0.9, 0.1, 0.1)
    def plot_distribution():

        fix, axs = plt.subplots(ncols=3)
        
        ax1, ax2, ax3 = axs
        for ax in axs:
            format_axes(ax, hide=['top', 'right'], show=['bottom', 'left'])
        #ax.violinplot([overall])
#        ax1.violinplot([variances_stack, variances_mem, variances_opcode])
#        ax2.violinplot([variances_static])


        ax1.hist(flat(values_stack_normalized))
        ax2.hist(flat(values_opcode_normalized))
        ax3.hist(flat(values_mem_normalized))
        #ax1.set_xticks([1, 2, 3])
        ax1.set_ylabel("Class count")
        ax1.set_xlabel("Stack")
        ax2.set_xlabel("Opcode")
        ax3.set_xlabel("Memory")
        #ax2.set_xticks([1])
        #ax2.set_xticklabels( ["Static"])
        #ax2.set_ylim(0)

        #plt.show()
        #plt.savefig("%s/variance.pdf"%out)


    def plot_custom():
        fix, axs = plt.subplots(ncols=2)
        

        ax1, ax2 = axs
        #
        
        for ax in axs:
            format_axes(ax, hide=['top', 'right'], show=['bottom', 'left'])

        def plotSimple(ax, values, label=""):
            #ax.set_yscale('log')

            nm = list(sorted(enumerate(names), key = lambda x: len(values[x[0]]), reverse=True))
            values = list(sorted(values, key = lambda x: len(x), reverse=True))
            limits = [min(flat(values)), max(flat(values)) + [1000]] # + padding

            for index, l in enumerate(values):
                #print(index, min(l), max(l))
                ax.axvline(index, linewidth = 2, color=(0.2,0.2,0.2,0.05))
                #print(len(l), len([index for _ in range(len(l))]))
                ax.plot([index for _ in l], l, 'o', color='orange')
                #ax.axvline(index, min(l)/limits[1], max(l)/limits[1])

            #ax.set_xticks(np.arange(len(names)), )
            ax.set_xticklabels([n[1] for n in nm], rotation=45)
            ax.set_xticks(range(len(values)))
            #ax.set_xticks([])
            #

            ax.set_xlabel(label)

        plotSimple(ax1, opcode_matrices, "Stack")
        #plotSimple(ax2, values_stack, "Stack")
        #plotSimple(ax2, opcode_matrices, "Memory")
        #plt.show()
        plt.savefig("%s/variance.pdf"%out)
    def plot_horizontal(names, valuesStack, valuesMem):
        
        # Sorting values
        names = list(sorted(enumerate(names), key= lambda x: len(valuesStack[x[0]])))
        valuesStack = list(sorted(valuesStack, key = lambda x: len(x)))
        valuesMem = list(sorted(valuesMem, key = lambda x: len(x)))
        names = [n[1] for n in names]

        # flatten and removing redundant comparisons
        valuesStack = [getDifferentComparisons(v) for v in valuesStack]
        valuesMem = [getDifferentComparisons(v) for v in valuesMem]

        fig, axs = plt.subplots(ncols=2, sharey=True)

        ax1, ax2 = axs
        for ax in axs:
            format_axes(ax, hide=['top', 'right'], show=['bottom', 'left'])

        legends = [None, None]

        def plotSimple(index, ax, v):
            mx = max(v + [1])

            normalized = [x/mx for x in v]

            bins, edges = np.histogram(normalized, 200)
            mx = max(bins)

            print(names[index])
            print(bins, edges)
            center = (edges[:-1] + edges[1:]) / 2
            #X = np.array([left,right]).T.flatten()
            #Y = np.array([bins,bins]).T.flatten()
            #std = np.std(normalized)
            #mean = np.mean(normalized)
            
            #f2 = interp1d(center, [h/mx for h in hist])

            #
            i = index - 1
            #dots = zip(center, [e/mx + i for e in bins])
            #dots = list(filter(lambda x: x[1] > i, dots))
            #ax.plot(center, [e/mx + i for e in bins],'-', linewidth=1, color='royalblue')

            #ax.scatter([d[0] for d in dots],[d[1] + 0.1 for d in dots], s=3, color='royalblue')
            #ax1.fill_between(center, index, [e/mx for e in bins])
        #for i,v in enumerate(valuesStack):
            #plotSimple(i, ax1, v)
            #p1 = ax1.fill_between(center, i, f2(center), color='royalblue')
            #p1 = ax1.scatter(mean, i, color='red', s=1.5 + 2*math.log(len(normalized) + 1))
            
            #legends[0] = p1

        valuesMem[0] = [1]
        for i, v in enumerate(valuesStack):
            
            ax2.scatter(valuesMem[i], [i]*len(valuesMem[i]), alpha=0.1, color='orange', s=1)
            ax1.scatter(v, [i]*len(v), alpha=0.1, color='orange', s=1)
            #print(heatmap)
        #ax1.violinplot(valuesStack, range(len(names)), vert=False, widths=1.5, points=1000)
        
        #for pc in partsS1["bodies"]:
        #    pc.set_linestyle("--")
        #    pc.set_linewidth(0.6)
            
        
        ax1.grid(True, alpha=0.4)

        print(legends)

        #for i,v in enumerate(valuesMem):
            #plotSimple(i, ax2, v)

            #ax1.plot(newBins, f2(newBins), color='blue', linewidth=1)
            #p1 = ax2.fill_between(newBins, i, f2(newBins), color='royalblue')
        
        # HACK
        #ax2.violinplot(valuesMem, range(len(names)), vert=False, widths=1.5)


        #for pc in partsS1["bodies"]:
        #    pc.set_linestyle("--")
        #    pc.set_linewidth(0.6)

        ax2.grid(True, linestyle='--', alpha=0.4)
        
        tuple_names = ["%s (%s CMPs)"%(n.replace("_", " ").replace("Mt", "Multiplication tables"), len(valuesStack[i])) for i, n in enumerate(names)]

        ax1.set_yticklabels(tuple_names)
        ax1.set_yticks(range(len(names)))
        ax2.set_yticks(range(len(names)))
        ax2.axes.get_yaxis().set_visible(False)
        #ax3.axes.get_yaxis().set_visible(False)
        # Limits
        ax1.set_xlim(0)
        ax2.set_xlim(0)
        #ax2.set_xlim(limx1 - 0.1, limX1 + 0.2)
        
        ax1.set_ylabel('Program name')
        ax1.set_xlabel('Stack')
        ax2.set_xlabel('Memory')
        #ax3.set_xlabel('$\delta$')

        top = 0.04
       # ax1.legend(legends, ('Mean value', 'Standard deviation interval'),loc='best', bbox_to_anchor=(0,1.1))

        box1 = ax1.get_position()
        box2 = ax2.get_position()
       # box3 = ax2.get_position()
        pos = 0.2
        pos2 = 0.1
        pos3 = 0.07
        pos4 = 0.2
        ax1.set_position([box1.x0 + pos, box1.y0, box1.width - pos2, box1.height - top])
        ax2.set_position([box2.x0 + pos3, box2.y0, box2.width - pos3, box2.height - top])
        #ax3.set_position([box3.x0 + pos3 + pos, box3.y0, box3.width - pos4, box3.height - top])
        #
        #plt.show()
        #plt.subplots_adjust(hspace=0.05) s
        #plt.savefig("%s/variance_distribution.pdf"%out)
        plt.savefig("variance.png")
    def plot_manifold():

        for i,namespace in enumerate(opcode_matrices):
            
            dists = namespace
            cities = [n.replace("_", " ") for n in names_matrices[i]]
            
            adist = np.array(dists)
            amax = max(1, np.amax(adist))
            adist /= amax

            mds = manifold.MDS(n_components=2, dissimilarity="precomputed", random_state=6)
            results = mds.fit(adist)

            coords = results.embedding_

            plt.subplots_adjust(bottom = 0.1)
            plt.scatter(
                coords[:, 0], coords[:, 1], marker = 'o'
                )
            for label, x, y in zip(cities, coords[:, 0], coords[:, 1]):
                plt.annotate(
                label,
                xy = (x, y), xytext = (-20, 20),
                textcoords = 'offset points', ha = 'right', va = 'bottom',
                bbox = dict(boxstyle = 'round,pad=0.5', fc = 'yellow', alpha = 0.5),
                arrowprops = dict(arrowstyle = '->', connectionstyle = 'arc3,rad=0'))

            plt.savefig("%s/%s.pdf"%(folder, names[i]))
            plt.clf()

    #plot_distribution()
    #plot_custom()
    # plot_manifold()
    plot_horizontal(names, opcode_matrices, mem_matrices)
    

            


if __name__ == "__main__":
    process("/programs/results", "/programs/results")