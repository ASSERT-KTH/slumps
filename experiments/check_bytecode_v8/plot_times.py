import sys
import os
import json
from matplotlib import pyplot as plt
import base64
import numpy as np
import re
from common import *
from itertools import combinations,product 
from mpl_toolkits.axes_grid1.inset_locator import zoomed_inset_axes
from mpl_toolkits.axes_grid1.inset_locator import mark_inset
import matplotlib.ticker as mtick
import csv

def iqr_filter(q75, q25, val, iqrange=1.5):
	iqr = q75 - q25
	cut_off = iqr*iqrange
	lower, upper = q25 - cut_off, q75 + cut_off
	return lower <= val <= upper

def get_data_to_draw(values, low=25, high=75, iqrange=1.5):
	quantile75 = np.percentile(values, high)
	quantile25 = np.percentile(values, low)
	median = np.median(values)

	iqr = quantile75 - quantile25
	cut_off = iqr*iqrange
	lower, upper = quantile25 - cut_off, quantile75 + cut_off
	data = [ m for m in values if lower <= m <= upper ]

	return median, quantile25, quantile75, lower, upper, data, min(data), max(data)

def plot(csvFile, title="", name="plot"):

	times = { }

	LINEWIDTH=1.2
	SCATTER_SIZE=7
	SCALE=10
	DIST_ALPHA=0.5

	with open(csvFile, newline="\n") as rows:
		spamreader = csv.reader(rows, delimiter=',')
		for row in spamreader:
			key=row[0]
			times[key] = dict()
			values = [float(v)  for v in row[1:]]
			times[key]["values"] = values
			times[key]["filtered"] = get_data_to_draw(values, low=25, high=80)
			times[key]["mean"] = np.mean(values)
			times[key]["median"] = np.median(values)
			times[key]["name"] = key
			times[key]["is_baseline"] =  False if "[" in key else True
	
	latexify(fig_width=11, fig_height=2, font_size=8, tick_size=8)
	fig, ax = plt.subplots()
	format_axes(ax, hide=['top', 'right', 'bottom'], show=['left'])

	KEY_SORT="median"
	all_values = sorted(times.values(), key=lambda x: -x[KEY_SORT])


	for i,v in enumerate(all_values):

		COLOR = 'C0' if not v["is_baseline"] else 'C3'
		if not v["is_baseline"]:
			print(v["name"])
			COLOR3 = 'gray'
			COLOR2 = 'C6'
			median, quantile25, quantile75, lowe, upper, data, m, M = v["filtered"]
			KEY = v[KEY_SORT]

			ax.plot([SCALE*(i + 1), SCALE*(i + 1)], [quantile75, M], color=COLOR3, linewidth=LINEWIDTH, alpha=0.6*DIST_ALPHA)
			ax.plot([SCALE*(i + 1), SCALE*(i + 1)], [quantile75, quantile25], color=COLOR3, linewidth=2.2*LINEWIDTH, alpha=1.2*DIST_ALPHA)
			ax.plot([SCALE*(i + 1), SCALE*(i + 1)], [m, quantile25], color=COLOR3, linewidth=LINEWIDTH, alpha=0.6*DIST_ALPHA)
			ax.scatter([SCALE*(i + 1)], [KEY], color=COLOR, s = SCATTER_SIZE, zorder=10)
		else:

			print("Baseline " + v["name"])
			ax.plot([0, 0], [quantile75, M], color=COLOR3, linewidth=LINEWIDTH, alpha=0.6*DIST_ALPHA)
			ax.plot([0, 0], [quantile75, quantile25], color=COLOR3, linewidth=2.2*LINEWIDTH, alpha=1.2*DIST_ALPHA)
			ax.plot([0, 0], [m, quantile25], color=COLOR3, linewidth=LINEWIDTH, alpha=0.6*DIST_ALPHA)
			ax.scatter([0], [KEY], color=COLOR, s = SCATTER_SIZE, zorder=10)

			ax.hlines(KEY,colors="C3",  xmin=0, xmax=SCALE*len(times.values()) + 1, linestyle='dashed', linewidth=LINEWIDTH, zorder=400)
	ax.set_title(title)
	ax.set_xticks([])
	plt.ylabel('Time (ms)')

	plt.savefig(f"{name}.pdf")
	#plt.show()


#	plt.show()
if __name__ == "__main__":
	# csv file with the times as argument
	plot(sys.argv[1], sys.argv[2], sys.argv[3])
	