import matplotlib.pyplot as plt
import json
import sys
from common import *


def generate_report_for_all(data):
    
    latexify(fig_width=5, fig_height=2)
    labels = ['G1', 'G1', 'G1']
    #unique_bc_means = [0, data['unique_bc_count'] - data['unique_wasm_count']]
    unique_wasm_means = [0, data['unique_wasm_count'], 0]
    unique_n_means = [0, data['unique_native_count'] - data['unique_wasm_count'], 0]
    #men_std = [2, 3, 4, 1, 2]
    #women_std = [3, 5, 2, 3, 3]

    width = 0.15       # the width of the bars: can also be len(x) sequence

    fig, ax = plt.subplots()
    format_axes(ax, hide=['left', 'right', 'top'],show=['bottom'])
    ax.barh(labels, unique_wasm_means, width, label="Unique Wasm binaries")
    #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
    ax.barh(labels, unique_n_means, width, left=unique_wasm_means, label="Unique native binaries")

    ax.set_xlabel('Number of unique variants')
    ax.set_yticks([])
    #ax.set_title('Scores by group and gender')
    ax.legend( bbox_to_anchor = (0.5, 1.7))
    fig.tight_layout()

    #plt.show()
    plt.savefig(f"plots/all_stats.all.pdf")


def generate_report_for_comparisons(data, percentage=False):
    
    latexify(fig_width=5, fig_height=2)
    labels = ['G1']
    if not percentage:
        non_reversed = [data['nonreversed_pairs']]
        reversed = [data['reversed_pairs']]
    else:
        non_reversed = [100*data['nonreversed_pairs']/data['compared_pairs']]
        reversed = [100*data['reversed_pairs']/data['compared_pairs']]

    #men_std = [2, 3, 4, 1, 2]
    #women_std = [3, 5, 2, 3, 3]

    width = 0.15       # the width of the bars: can also be len(x) sequence

    fig, ax = plt.subplots()
    format_axes(ax, hide=['left', 'right', 'top'],show=['bottom'])
    ax.barh(labels, non_reversed, width, label=f"Non-reversed pairs({non_reversed[0]:.2f})")
    #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
    ax.barh(labels, reversed, width, left=non_reversed, label=f"Reversed pairs({reversed[0]:.2f})")

    ax.set_xlabel('Number of pair comparisons')
    ax.set_yticks([])
    #ax.set_title('Scores by group and gender')
    ax.legend( bbox_to_anchor = (0.5, 1.8))
    fig.tight_layout()

    #plt.show()
    name = "p" if percentage else ""
    plt.savefig(f"plots/all_stats.comparisons_{name}.pdf")


def sorted_dict(d, key):
    
    sorted_keys = sorted(
        d, key = key
    )

    for k in sorted_keys:
        yield k, d[k]

def generate_report_for_modules(data, percentage=True):
    
    # TODO sort by percentages

    modulesd = data['modules']

    if percentage:
        modules = sorted(data['modules'], key=lambda x: data['modules'][x]['unique_native_count']/data['modules'][x]['unique_wasm_count'])
    else:
        modules = sorted(data['modules'], key=lambda x: data['modules'][x]['unique_wasm_count'])

    #  font_size=8, tick_size=8
    latexify(fig_width=6 if percentage else 7, fig_height=5,  tick_size=7)
    labels = [f'%s'%(k.replace("_", "\_").replace("$", ""), ) for k in modules]
    if percentage:
        unique_wasm_means = [100*modulesd[k]['unique_native_count']/modulesd[k]['unique_wasm_count'] for k in modules]
        unique_n_means = [100*modulesd[k]['unique_native_count']/modulesd[k]['unique_wasm_count'] for k in modules]
    else:
        unique_wasm_means = [modulesd[k]['unique_wasm_count'] for k in modules]
        unique_n_means = [modulesd[k]['unique_wasm_count'] - modulesd[k]['unique_native_count'] for k in modules]
    #men_std = [2, 3, 4, 1, 2]
    #women_std = [3, 5, 2, 3, 3]


    width = 0.45       # the width of the bars: can also be len(x) sequence

    fig, ax = plt.subplots()
    format_axes(ax, hide=[ 'right', 'top'],show=['left','bottom'])

    i = 0
    for name, d in data['modules'].items():
        #ax.text(0, i, f'{name}')
        i += 1

    if percentage:
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax.barh(labels, unique_n_means, width, label="Unique native binaries")
    else:
        ax.barh(labels, unique_wasm_means, width, label="Unique Native binaries")
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax.barh(labels, unique_n_means, width, left=unique_wasm_means, label="Unique Wasm binaries")

    if percentage:
        ax.set_xlabel('Percentage of unique packages')
    else:
        ax.set_xlabel('Number of unique packages')
    #ax.set_yticks([])
    #ax.set_title('Scores by group and gender')
    if percentage:
        pass
    else:
        ax.legend( bbox_to_anchor = (1, 1))
    fig.tight_layout()

    #plt.show()
    name = "p" if percentage else ""
    plt.savefig(f"plots/all_stats.modules_{name}.pdf")



def generate_report_for_modules_comparisons(data, percentage=True):
    
    # TODO sort by percentages

    modulesd = data['modules']

    if percentage:
        modules = sorted(data['modules'], key=lambda x: data['modules'][x]['compared_pairs'])
    else:
        modules = sorted(data['modules'], key=lambda x: data['modules'][x]['compared_pairs'])

    #  font_size=8, tick_size=8
    latexify(fig_width=6 if percentage else 7, fig_height=5,  tick_size=7)
    labels = [f'%s(%s)'%(k.replace("_", "\_").replace("$", ""), modulesd[k]["compared_pairs"]) for k in modules]
    if percentage:
        unique_wasm_means = [100*modulesd[k]['nonreversed_pairs']/modulesd[k]['compared_pairs'] for k in modules]
        unique_n_means = [100*modulesd[k]['nonreversed_pairs']/modulesd[k]['compared_pairs'] for k in modules]
    else:
        unique_wasm_means = [modulesd[k]['nonreversed_pairs'] for k in modules]
        unique_n_means = [modulesd[k]['nonreversed_pairs'] - modulesd[k]['compared_pairs'] for k in modules]
    #men_std = [2, 3, 4, 1, 2]
    #women_std = [3, 5, 2, 3, 3]


    width = 0.45       # the width of the bars: can also be len(x) sequence

    fig, ax = plt.subplots()
    format_axes(ax, hide=[ 'right', 'top'],show=['left','bottom'])

    i = 0
    for name, d in data['modules'].items():
        #ax.text(0, i, f'{name}')
        i += 1

    if percentage:
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax.barh(labels, unique_n_means, width, label="Unique native binaries")
    else:
        ax.barh(labels, unique_wasm_means, width, label="Unique Native binaries")
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax.barh(labels, unique_n_means, width, left=unique_wasm_means, label="Unique Wasm binaries")
        ax.set_xscale("log")

    if percentage:
        ax.set_xlabel('Percentage of preserved transformations')
    else:
        ax.set_xlabel('Number of preserved transformations')
    #ax.set_yticks([])
    #ax.set_title('Scores by group and gender')
    if percentage:
        pass
    else:
        ax.legend( bbox_to_anchor = (1, 1))
    fig.tight_layout()

    #plt.show()
    name = "p" if percentage else ""
    plt.savefig(f"plots/all_stats.modules.comparison_{name}.pdf")


def generate_report_for_functions(data, percentage=False):
    
    # TODO sort by percentages

    functions = {

    }
    
    for _, d in data['modules'].items():
        for function in d['functions']:
            functions[function['name']] = function

    if percentage:
        functionkeys = sorted(functions, key=lambda x: functions[x]['unique_native_count']/functions[x]['unique_wasm_count'])
    else:
        functionkeys = sorted(functions, key=lambda x: functions[x]['unique_wasm_count'])

    print(functionkeys)
    #  font_size=8, tick_size=8
    latexify(fig_width=6 if percentage else 5, fig_height=12,  tick_size=7)
    labels = [f'%s'%(k.replace("_", "\_").replace("$", ""), ) for k in functionkeys]
    if percentage:
        unique_wasm_means = [100*functions[k]['unique_native_count']/functions[k]['unique_wasm_count'] for k in functionkeys]
        unique_n_means = [100*functions[k]['unique_native_count']/functions[k]['unique_wasm_count'] for k in functionkeys]
    else:
        unique_wasm_means = [functions[k]['unique_wasm_count'] for k in functionkeys]
        unique_n_means = [functions[k]['unique_wasm_count'] - functions[k]['unique_native_count'] for k in functionkeys]
    #men_std = [2, 3, 4, 1, 2]
    #women_std = [3, 5, 2, 3, 3]


    width = 0.45       # the width of the bars: can also be len(x) sequence

    fig, ax = plt.subplots()
    format_axes(ax, hide=[ 'right', 'top'],show=['left','bottom'])

    i = 0
    for name, d in data['modules'].items():
        #ax.text(0, i, f'{name}')
        i += 1

    if percentage:
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax.barh(labels, unique_n_means, width, label="Unique native binaries")
    else:
        ax.barh(labels, unique_wasm_means, width, label="Unique Native binaries")
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax.barh(labels, unique_n_means, width, left=unique_wasm_means, label="Unique Wasm binaries")

    if percentage:
        ax.set_xlabel('Percentage of unique packages')
    else:
        ax.set_xlabel('Number of unique packages')
    #ax.set_yticks([])
    #ax.set_title('Scores by group and gender')
    if percentage:
        pass
    else:
        ax.legend( bbox_to_anchor = (1, 1))
    fig.tight_layout()

    #plt.show()
    name = "p" if percentage else ""
    plt.savefig(f"plots/all_stats.functions_{name}.pdf")


def wrapto(str, size=10):

    result = ""
    l = 0
    for s in str:
        result += s
        l += 1

        if l == size:
            result += "\n"
            l = 0

    return result


def generate_report_for_functions_cmp(data, percentage=False):
    
    # TODO sort by percentages

    functions = {

    }
    
    for _, d in data['modules'].items():
        for function in d['functions']:
            functions[function['name']] = function

    if percentage:
        functionkeys = sorted(functions, key=lambda x: functions[x]['compared_pairs'])
    else:
        functionkeys = sorted(functions, key=lambda x: functions[x]['compared_pairs'])

    print(functionkeys)
    #  font_size=8, tick_size=8
    latexify(fig_width=12 if percentage else 7, fig_height=7.5,  tick_size=12)
    
    labels = ['%s (%s)'%(k.replace("_", "\_").replace("$", ""), int(functions[k]['compared_pairs'])) for k in functionkeys]
    if percentage:
        unique_wasm_means = [100*functions[k]['nonreversed_pairs']/functions[k]['compared_pairs'] for k in functionkeys]
        unique_n_means = [100*functions[k]['nonreversed_pairs']/functions[k]['compared_pairs'] for k in functionkeys]
    else:
        unique_wasm_means = [functions[k]['nonreversed_pairs'] for k in functionkeys]
        unique_n_means = [functions[k]['nonreversed_pairs'] - functions[k]['compared_pairs'] for k in functionkeys]
    #men_std = [2, 3, 4, 1, 2]
    #women_std = [3, 5, 2, 3, 3]


    width = 0.5       # the width of the bars: can also be len(x) sequence

    fig, ax = plt.subplots(ncols=2)

    ax1, ax2 = ax
    format_axes(ax1, hide=[ 'right', 'top'],show=['left','bottom'])
    format_axes(ax2, hide=[ 'right', 'top'],show=['left','bottom'])


    i = 0
    for name, d in data['modules'].items():
        #ax.text(0, i, f'{name}')
        i += 1

    if percentage:
        hlf = int(len(labels)/2)
        print(hlf)
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax2.barh(labels[:hlf], unique_n_means[:hlf], width,align='center', label="Unique native binaries")
        ax1.barh(labels[hlf:], unique_n_means[hlf:], width,align='center', label="Unique native binaries")

    else:
        ax = ax1
        ax.barh(labels, unique_wasm_means, width, align='center',label="Unique Native binaries")
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax.barh(labels, unique_n_means, width, left=unique_wasm_means,align='center', label="Unique Wasm binaries")

    if percentage:
        ax1.set_xlabel('Percentage of preserved pairs')
        ax2.set_xlabel('Percentage of preserved pairs')
    else:
        ax.set_xlabel('Number of unique packages')
    #ax.set_yticks([])
    #ax.set_title('Scores by group and gender')
    if percentage:
        pass
    else:
        ax.legend( bbox_to_anchor = (1, 1))
    fig.tight_layout()

    #plt.show()
    name = "p" if percentage else ""
    plt.savefig(f"plots/all_stats.functions.comparison_{name}.pdf")


def generate_report_for_functions_cmp_unique(data, percentage=False):
    
    # TODO sort by percentages

    functions = {

    }
    
    for _, d in data['modules'].items():
        for function in d['functions']:
            functions[function['name']] = function

    if percentage:
        functionkeys = sorted(functions, key=lambda x: functions[x]['unique_wasm_count'])
    else:
        functionkeys = sorted(functions, key=lambda x: functions[x]['unique_wasm_count'])

    print(functionkeys)
    #  font_size=8, tick_size=8
    latexify(fig_width=12 if percentage else 7, fig_height=7.5,  tick_size=12)
    
    labels = ['%s (%s)'%(k.replace("_", "\_").replace("$", ""), int(functions[k]['unique_wasm_count'])) for k in functionkeys]
    if percentage:
        unique_wasm_means = [100*functions[k]['unique_native_count']/functions[k]['unique_wasm_count'] for k in functionkeys]
        unique_n_means = [100*functions[k]['unique_native_count']/functions[k]['unique_wasm_count'] for k in functionkeys]
        print(list(zip(unique_wasm_means, labels)))
        
    else:
        unique_wasm_means = [functions[k]['unique_wasm_count'] for k in functionkeys]
        unique_n_means = [functions[k]['unique_wasm_count'] - functions[k]['unique_native_count'] for k in functionkeys]
    #men_std = [2, 3, 4, 1, 2]
    #women_std = [3, 5, 2, 3, 3]


    width = 0.5       # the width of the bars: can also be len(x) sequence

    fig, ax = plt.subplots(ncols=2)

    ax1, ax2 = ax
    format_axes(ax1, hide=[ 'right', 'top'],show=['left','bottom'])
    format_axes(ax2, hide=[ 'right', 'top'],show=['left','bottom'])


    i = 0
    for name, d in data['modules'].items():
        #ax.text(0, i, f'{name}')
        i += 1

    if percentage:
        hlf = int(len(labels)/2)
        print(hlf)
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax2.barh(labels[:hlf], unique_n_means[:hlf], width,align='center', label="Unique native binaries")
        ax1.barh(labels[hlf:], unique_n_means[hlf:], width,align='center', label="Unique native binaries")

    else:
        ax = ax1
        ax.barh(labels, unique_wasm_means, width, align='center',label="Unique Native binaries")
        #ax.barh(labels, unique_bc_means, width, left=unique_wasm_means, label="a")
        ax.barh(labels, unique_n_means, width, left=unique_wasm_means,align='center', label="Unique Wasm binaries")

    if percentage:
        ax1.set_xlabel('Percentage of preserved pairs')
        ax2.set_xlabel('Percentage of preserved pairs')
    else:
        ax.set_xlabel('Number of unique packages')
    #ax.set_yticks([])
    #ax.set_title('Scores by group and gender')
    if percentage:
        pass
    else:
        ax.legend( bbox_to_anchor = (1, 1))
    fig.tight_layout()

    #plt.show()
    name = "p" if percentage else ""
    plt.savefig(f"plots/all_stats.functions.unique_{name}.pdf")


if __name__ == "__main__":
    data = json.loads(open(sys.argv[1], 'r').read())

    generate_report_for_all(data)

    generate_report_for_modules(data, True)
    generate_report_for_functions(data, True)
    generate_report_for_modules(data, False)
    generate_report_for_functions(data, False)
    generate_report_for_comparisons(data, True)
    generate_report_for_comparisons(data, False)
    generate_report_for_modules_comparisons(data, True)
    generate_report_for_modules_comparisons(data, False)
    generate_report_for_functions_cmp(data, True)
    generate_report_for_functions_cmp(data, False)
    generate_report_for_functions_cmp_unique(data, True)
    generate_report_for_functions_cmp_unique(data, False)