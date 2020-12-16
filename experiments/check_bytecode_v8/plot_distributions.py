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

DO_PLOT=True
SHOW_HITS=False
SET_MIN=False

def plot(files, keys, legends):

	latexify(fig_width=4.4, fig_height=4.2, font_size=8, tick_size=8)
	fig, ax = plt.subplots()
	format_axes(ax, hide=['top', 'right'], show=['left', 'bottom'])

	minY = 0
	minX = 100000000000000
	axins = zoomed_inset_axes(ax,100,loc='lower right', bbox_to_anchor=(0.8,0.3), bbox_transform=ax.transAxes)

	for i in range(len(files)):
		f, k, l = files[i], keys[i], legends[i]
		data = json.loads(open(f, 'r').read())

		hxs1, hys1 = np.histogram(data[k], bins=np.arange(0,int(max(data[k])),1),  normed=True )
		
		print(len(data[k]))
		#print(hys1, hxs1)
		dx = hys1[1] - hys1[0]
		F1s1 = np.cumsum(hxs1)*dx*100
		a1=ax.plot(hys1[1:], F1s1, label=l, linewidth=1)
		
		minX = min(max(hys1[1:]), minX)
		minY = max(min(F1s1), minY)
#		
		
		# sub region of the original image
#		print(min(s2), min(s1), min(F1s2), min(F1s1), len(list(filter(lambda x: x == 0, s2))))
#		
#		LIMIT=5
#		format_axes(axins,hide=[], show=['left', 'bottom', 'top', 'right'])
		LIMIT=5
		axins.plot(hys1[1:(LIMIT + 1)], F1s1[:LIMIT], '-', linewidth=0.6)


		#plt.draw()
	x1, x2, y1, y2 = 0, 8, 0, 1.2*minY

	axins.set_xlim(x1, x2)
	axins.set_ylim(y1, y2)
	#axins.grid(True)
	#axins.set_xticks(range(0, 32, 2))
	#

	#ax.legend([a1, a2], )

	#plt.xticks(visible=False)
	#plt.yticks(visible=False)

	# draw a bbox of the region of the inset axes in the parent axes and
	# connecting lines between the bbox and the inset axes area
	mark_inset(ax, axins, loc1=2, loc2=3, ec='gray', linewidth=0.4)
	ax.legend(bbox_to_anchor=(0.7, 1.15), loc='upper left', borderaxespad=0.)
	fmt = '%.2f%%' # Format you want the ticks, e.g. '40%'
	yticks = mtick.FormatStrFormatter(fmt)
	ax.set_xlabel('DTW distance')

	ax.yaxis.set_major_formatter(mtick.PercentFormatter())	

	if(SET_MIN):
		print(minX)
		ax.set_xlim(0, minX)

	plt.tight_layout()

	#plt.show()
	plt.savefig("histogram.better.pdf")

#	plt.show()
if __name__ == "__main__":
	# file1, key1, legend1, file2, key2, legend2, ...
	files = sys.argv[1::3]
	keys = sys.argv[2::3]
	legends = sys.argv[3::3]
	plot(files, keys, legends)
	