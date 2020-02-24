import os
import json
import numpy as np
from sklearn.decomposition import PCA
import matplotlib.pyplot as plt
import math

from common import *

def process(folder):

    variances_mem = []
    variances_stack= []
    variances_opcode = []
    variances_static = []
    overall = []
    

    names = []
    ps = []
    for namespace in os.listdir(folder):
        if namespace != ".DS_Store" and namespace != "variance.pdf":
            names.append(namespace)
            DTW_static = json.loads(open("%s/%s/%s_static_DTW.json"%(folder, namespace, namespace), 'r').read())           
            DTW_mem = json.loads(open("%s/%s/%s_mem_DTW.json"%(folder, namespace, namespace), 'r').read())
            DTW_stack = json.loads(open("%s/%s/%s_stack_DTW.json"%(folder, namespace, namespace), 'r').read())
            DTW_opcode = json.loads(open("%s/%s/%s_opcode_DTW.json"%(folder, namespace, namespace), 'r').read())

            Vs = []

            baseline_index = next(i for i,v in enumerate(DTW_static["NAMES"]) if not v.startswith("["))

            for i,n in enumerate(DTW_static["NAMES"]):
                v1 = DTW_static["DTWS"][baseline_index][i]
                v2 = DTW_mem["DTWS"][baseline_index][i]
                v3 = DTW_stack["DTWS"][baseline_index][i]
                v4 = DTW_opcode["DTWS"][baseline_index][i]

                Vs.append([v1, v2, v3, v4])

            # PCA
            X = np.array(Vs)
            # print(X.shape)
            pca = PCA(n_components=2)
            Y = pca.fit_transform(X)

            #print(DTW_static)
            n1 = DTW_static["DTWS"][baseline_index]
            n2 = DTW_opcode["DTWS"][baseline_index]
            n3 = DTW_stack["DTWS"][baseline_index]
            n4 = DTW_mem["DTWS"][baseline_index]

            # normalize
            n1 = [n/max(*n1, 1) for n in n1]
            n2 = [n/max(*n2, 1) for n in n2]
            n3 = [n/max(*n3, 1) for n in n3]
            n4 = [n/max(*n4, 1) for n in n4]

            n5 = [n3[i] + n2[i] + n4[i] for i in range(len(n1))]

            total = [n1[i] + n2[i] + n3[i] + n4[i] for i in range(len(n1))]


            if len(n1) > 2:
                from scipy.stats.stats import pearsonr   
                print(pearsonr(n1,n5), len(n1))


            l = len(Vs)

            print(namespace, "->", total)
            print(namespace, "->", np.std(total))
            print()

            variances_static.append(np.std(n1))
            variances_mem.append(np.std(n4))
            variances_opcode.append(np.std(n2))
            variances_stack.append(np.std(n3))
            overall.append(np.std(total))

            p1 = plt.scatter(n5, n1)
            plt.show()

            ps.append(p1)

    #plt.legend(ps, names)
    latexify(fig_width=9, fig_height=3, font_size=14, tick_size=14)

    
    cmp1 = [variances_mem[i] + variances_stack[i] + variances_opcode[i] for i in range(len(variances_opcode))]

    print(variances_stack)

    def plot_distribution():

        fix, axs = plt.subplots(ncols=2)
        
        ax1, ax2 = axs
        for ax in axs:
            format_axes(ax, hide=['top', 'right'], show=['bottom', 'left'])
        #ax.violinplot([overall])
        ax1.violinplot([variances_stack, variances_mem, variances_opcode])
        ax2.violinplot([variances_static])

        ax1.set_xticks([1, 2, 3])
        ax1.set_xticklabels(["Stack", "Memory", "Opcode"])
        ax2.set_xticks([1])
        ax2.set_xticklabels( ["Static"])
        ax2.set_ylim(0)

        #plt.show()
        plt.savefig("%s/variance.pdf"%folder)

    
    def plot_scatter():
        fix, ax = plt.subplots()
        format_axes(ax, hide=['top', 'right'], show=['bottom', 'left'])

        ax.scatter(cmp1, variances_static)
        plt.show()

    plot_distribution()
    #plot_scatter()
            
#            for i,y in enumerate(Y):

#                plt.scatter(y[0], y[1], color='r' if i != baseline_index else 'b')


            


if __name__ == "__main__":
    process("/programs/results")