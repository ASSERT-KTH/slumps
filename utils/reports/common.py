import matplotlib.pyplot as plt

import matplotlib
from math import sqrt
SPINE_COLOR = 'gray'

tick_y_size = 8
tick_x_size = 8
title_size = 12

def latexify(fig_width=None, fig_height=None, columns=1, font_size=8, tick_size=8):
    """Set up matplotlib's RC params for LaTeX plotting.
    Call this before plotting a figure.

    Parameters
    ----------
    fig_width : float, optional, inches
    fig_height : float,  optional, inches
    columns : {1, 2}
    """

    # code adapted from http://www.scipy.org/Cookbook/Matplotlib/LaTeX_Examples

    # Width and max height in inches for IEEE journals taken from
    # computer.org/cms/Computer.org/Journal%20templates/transactions_art_guide.pdf

    assert(columns in [1,2])

    if fig_width is None:
        fig_width = 3.7 if columns==1 else 6.9 # width in inches

    if fig_height is None:
        golden_mean = (sqrt(5)-1.0)/2.0    # Aesthetic ratio
        fig_height = fig_width*golden_mean + 1.2 # height in inches

    MAX_HEIGHT_INCHES = 18.0
    if fig_height > MAX_HEIGHT_INCHES:
        print("WARNING: fig_height too large:" + fig_height + 
              "so will reduce to" + MAX_HEIGHT_INCHES + "inches.")
        fig_height = MAX_HEIGHT_INCHES
    #print(matplotlib.rcParams.keys())
    pgf_with_latex = {                      # setup matplotlib to use latex for output
        "pgf.texsystem": "pdflatex",        # change this if using xetex or lautex
        "text.usetex": True,                # use LaTeX to write all text
        "font.family": "serif",
        "font.serif": [],                   # blank entries should cause plots 
        "font.monospace": [],
        "axes.labelsize": font_size,               # LaTeX default is 10pt font.
        "font.size": font_size,
        "legend.fontsize": font_size,               # Make the legend/label fonts 
        "xtick.labelsize": tick_size,               # a little smaller
        "ytick.labelsize": tick_size,
        "figure.figsize": [fig_width, fig_height],     # default fig size of 0.9 textwidth
        "pgf.preamble": [
            r"\\usepackage[utf8x]{inputenc}",    # use utf8 fonts 
            r"\\usepackage[T1]{fontenc}",        # plots will be generated
            r"\\usepackage[detect-all,locale=DE]{siunitx}",
            ]                                   # using this preamble
        }

    matplotlib.rcParams.update(pgf_with_latex)


def format_axes(ax, hide = ['top', 'right'], show= ['left', 'bottom']):

    for spine in hide:
        ax.spines[spine].set_visible(False)

    for spine in show:
        ax.spines[spine].set_color(SPINE_COLOR)
        ax.spines[spine].set_linewidth(0.5)

    ax.xaxis.set_ticks_position('bottom')
    ax.yaxis.set_ticks_position('left')

    for axis in [ax.xaxis, ax.yaxis]:
        axis.set_tick_params(direction='out', color=SPINE_COLOR)

    return ax
