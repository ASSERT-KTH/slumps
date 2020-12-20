import sys
import os
import json
from matplotlib import pyplot as plt
import base64
import numpy as np
import re
from common import *
from itertools import combinations,product 

DO_PLOT=True
SHOW_HITS=False

def load_instructions(ngramsize=1):
	content = open('instructions_dict.txt', 'r').read().split("\n")

	DICT = {}
	REVERSE = { }
	index = 0
	for i in product(content, repeat=ngramsize):
		# remove comments

		clean = [line.split(" ")[0] for line in i if line.split(" ")[0]] # first token always, remaining is for debugging
		clean = "\n".join(clean)	
		if clean:
			#print(f"-{clean}-")
			DICT[clean] = index
			REVERSE[index] = clean
			index += 1
	
	return DICT, REVERSE


def create_symbol_table(classDict):

	return [ [ 0 for _ in range(len(classDict.keys())) ] for _ in range(len(classDict.keys())) ]

def get_instructions(symbol, key="s1", remove=True):

	r = []

	for i in symbol:
		token=i[key]
		
		if remove:
			token=token.split(" ")[0].replace(")", "").replace("(", "")
		
		#print(token)
		r.append(token)
	
	return "\n".join(r)

def equal(match):
	#print(match)
	for s in match:
		if s["s1"] != s["s2"]:
			return False

	return True


def process_class_no_dict(file, ngramsize):
	data = json.loads(open(file, 'r').read())
	heatMap = { }
	c = 0
	for alignment in data:
		symbols = alignment["watAlignment"]
		if alignment["watValue"] != 0:
			c += 1
			for i,match in enumerate(symbols[::ngramsize]):
				
				ss = symbols[i:i + ngramsize]
				#print(ss)
				if not equal(ss):
					try:
						token1 = get_instructions(ss,"s1")
						token2 = get_instructions(ss, "s2")

						#print(token1, token2)

						if not token1 in heatMap:
							heatMap[token1] = { }

						if not token2 in heatMap[token1]:
							heatMap[token1][token2] = dict(
								value= 0,
								example1=get_instructions(ss, "s1", False),
								example2=get_instructions(ss, "s2", False),
								file=alignment["file1"]
							)

						heatMap[token1][token2]["value"] += 1

						#print(token1, token2)
					except Exception as e:
						#print(s1, s2)
						
						raise e

	print(f"SHOWING REVERSE {c}")

	count = 0
	for k1 in heatMap.keys():
		for k2 in heatMap[k1].keys():
			if heatMap[k1][k2]["value"] > 0 and k1 != k2:
				print()
				print("===========")
				print(k1)
				print("# By")
				print(k2)
				print("===========")
				fName = heatMap[k1][k2]["file"]
				print(f"==Example {fName}==")
				print(heatMap[k1][k2]["example1"])
				print("# By")
				print(heatMap[k1][k2]["example2"])
				print("===========")
				count += 1
	print(count)
	

def process_class(file, ngramsize, name=""):
	print(name)
	data = json.loads(open(file, 'r').read())
	CLASS_DICT, REVERSE = load_instructions(ngramsize=ngramsize)
	heatMap = create_symbol_table(CLASS_DICT)

	print(len(CLASS_DICT))
	print("CREATING HEATMAP")
	latexify(fig_width=0.4*len(CLASS_DICT.keys()) + 20, fig_height=0.4*len(CLASS_DICT.keys()) + 1, font_size=8, tick_size=8)

	for alignment in data:
		symbols = alignment["watAlignment"]
		if alignment["watValue"] != 0:
			for i,match in enumerate(symbols[::ngramsize]):
				
				ss = symbols[i:i + ngramsize]
				#print(ss)
				if not equal(ss):
					try:
						token1 = get_instructions(ss,"s1")
						token2 = get_instructions(ss, "s2")

						#print(token1, token2)

						heatMap[CLASS_DICT[token1]][CLASS_DICT[token2]] += 1
						heatMap[CLASS_DICT[token2]][CLASS_DICT[token1]] += 1

						#print(token1, token2)
					except Exception as e:
						#print(s1, s2)
						
						raise e

	if SHOW_HITS:
		print("SHOWING REVERSE")
		for i in range(len(heatMap)):
			for j in range(len(heatMap[0])):
				if heatMap[i][j] > 0 and REVERSE[i] != REVERSE[j]:
					print(REVERSE[i])
					print("# By")
					print(REVERSE[j])
					print("===========")
	if DO_PLOT:
		vegetables = [f.replace("_", "\_") for f in CLASS_DICT.keys()]
		farmers = [f.replace("_", "\_") for f in CLASS_DICT.keys()]

		harvest = np.array(heatMap)


		fig, ax = plt.subplots()
		im = ax.imshow(harvest)	
		ax.set_xticks(np.arange(len(farmers)))
		ax.set_yticks(np.arange(len(vegetables)))
		# ... and label them with the respective list entries
		ax.set_xticklabels(farmers)
		ax.set_yticklabels(vegetables)

		# Rotate the tick labels and set their alignment.
		plt.setp(ax.get_xticklabels(), rotation=45, ha="right",
				rotation_mode="anchor")

		# Loop over data dimensions and create text annotations.
		for i in range(len(vegetables)):
			for j in range(len(farmers)):
				text = ax.text(j, i, harvest[i, j],
							ha="center", va="center", color="w", fontsize=3)

		cbar = ax.figure.colorbar(im, ax=ax)
		cbar.ax.set_ylabel("", rotation=-90, va="bottom")

		fig.tight_layout()
		plt.savefig(f"{name}heatmap.pdf", format='pdf', bbox_inches = 'tight')

#	plt.show()
if __name__ == "__main__":
	process_class_no_dict(sys.argv[1], int(sys.argv[2]))
	#for f in sys.argv[1:]:
	#	process_class(f, 1, f.split("/")[-1])