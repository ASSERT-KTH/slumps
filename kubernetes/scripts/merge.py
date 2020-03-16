import os
import json
import numpy as np
from sklearn.decomposition import PCA
from scipy.stats import pearsonr
import matplotlib.pyplot as plt
import math

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
            #DTW_mem = json.loads(open("%s/%s/%s_mem_DTW.json"%(folder, namespace, namespace), 'r').read())
            #DTW_stack = json.loads(open("%s/%s/%s_stack_DTW.json"%(folder, namespace, namespace), 'r').read())
            DTW_opcode = json.loads(open("%s/%s/%s_opcode_DTW.json"%(folder, namespace, namespace), 'r').read())

            names_matrices.append(DTW_opcode["NAMES"])

            #static = getDifferentComparisons(DTW_static["DTWS"])
            #stack = getDifferentComparisons(DTW_stack["DTWS"])
            #mem = getDifferentComparisons(DTW_mem["DTWS"])
            #opcode = getDifferentComparisons(DTW_opcode["DTWS"])

            opcode_matrices.append(DTW_opcode["DTWS"])
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
    latexify(fig_width=9, fig_height=6, font_size=14, tick_size=14)

    marginLeft=0.2
    marginRight=0.2
    marginBottom = 0.10
    marginTop = 0.2
    plt.tight_layout(rect=(0 + marginLeft,marginBottom,1 - marginRight,1 - marginTop), w_pad=1.0)
    
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
            ax.set_yscale('log')

            values = list(sorted(values, key = lambda x: len(x), reverse=True))
            limits = [min(flat(values)), max(flat(values)) + 1000] # + padding

            for index, l in enumerate(values):
                #print(index, min(l), max(l))
                ax.axvline(index, linewidth = 2, color=(0.2,0.2,0.2,0.05))
                ax.scatter([index]*len(l), l, color='orange')
                #ax.axvline(index, min(l)/limits[1], max(l)/limits[1])

            #ax.set_xticks(range(len(values)))
            ax.set_xticks([])
            ax.set_ylim(*limits)

            ax.set_xlabel(label)

        plotSimple(ax1, values_opcode, "Opcode")
        #plotSimple(ax2, values_stack, "Stack")
        plotSimple(ax2, values_mem, "Memory")
        plt.show()
        #plt.savefig("%s/variance.pdf"%out)
    
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
    plot_manifold()
    

            


if __name__ == "__main__":
    process("/programs/results", "/programs/results")