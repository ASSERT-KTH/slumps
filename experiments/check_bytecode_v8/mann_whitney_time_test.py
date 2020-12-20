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
import scipy.stats

def do_test(csvFile):

	#print(csvFile)
	times = { }
	baseline = None

	with open(csvFile, newline="\n") as rows:
		spamreader = csv.reader(rows, delimiter=',')
		for row in spamreader:
			key=row[0]
			times[key] = dict()
			values = [float(v)  for v in row[1:]]
			times[key]["values"] = values
			times[key]["name"] = key
			times[key]["is_baseline"] =  False if "[" in key else True

			if baseline is None:
				baseline = times[key]
				del times[key]
	COUNT_PZERO=0
	COUNT_NONPZERO=0
	for variant in times.values():
		r = scipy.stats.mannwhitneyu(baseline["values"], variant["values"])
		if r[1] < 0.01:
			COUNT_PZERO += 1
		else:
			COUNT_NONPZERO += 1
	#print(f"{csvFile} {COUNT_PZERO + COUNT_NONPZERO}  P < 0.01 : {COUNT_PZERO}.\n Not enough {COUNT_NONPZERO}")
	#plt.show()

	return times, baseline, COUNT_PZERO, COUNT_NONPZERO

def do_for_folder(folder):

	latexify(fig_width=3, fig_height=13, font_size=8, tick_size=8)
	fig, ax = plt.subplots()
	format_axes(ax, hide=['top', 'right', 'left'], show=['bottom'])

	SCALE=100
	vals = []

	ALL_ZERO = 0
	AT_LEAST_ONE = 0
	for i, f in enumerate(os.listdir(folder)):
		values, baseline, ZERO_COUNT, NONZ_COUNT = do_test(f"{folder}/{f}")
		vals.append([ZERO_COUNT, NONZ_COUNT])

		if NONZ_COUNT == 0:
			ALL_ZERO += 1
		else:
			AT_LEAST_ONE += 1
		print(f"{f} {ZERO_COUNT} {NONZ_COUNT}")
	TOTAL = ALL_ZERO + AT_LEAST_ONE
	print(f"{ALL_ZERO} {AT_LEAST_ONE} / {TOTAL} / {ALL_ZERO/TOTAL} {AT_LEAST_ONE/TOTAL}")
	vals = list(sorted(vals, key=lambda x: x[0] + x[1]))

	for i, val in enumerate(vals):
		ZERO_COUNT, NONZ_COUNT = val
		TOTAL=ZERO_COUNT + NONZ_COUNT
		if TOTAL == 0:
			continue

		ax.plot([0, ZERO_COUNT/TOTAL], [i*SCALE, i*SCALE], color='C0')

	ax.set_yticks([])
	plt.show()
#	plt.show()
if __name__ == "__main__":
	# csv file with the times as argument
	#do_test(sys.argv[1])
	do_for_folder(sys.argv[1])
	