import sys
import json
import numpy as np

import matplotlib.pyplot as plt

def getValues(json):
	values = []

	for k1 in json["functionMap"].keys():
		for k2 in json["functionMap"][k1].keys():
			wat1 = json["fileMap"][k1].replace(".log.stack", "").replace(".log.mem", "")
			wat2 = json["fileMap"][k2].replace(".log.stack", "").replace(".log.mem", "")
			
			#print(json["functionMap"][k1][k2])
			values.append(json["functionMap"][k1][k2])
			#	cache[f"{wat1}-{wat2}"] = True
			#else:
		#		print("Error only wasi changes", wat1, wat2)

	# check is the change was done in WASI

	return [values, len(json["fileMap"].keys())]


def plotValues(values):
	
	fig, ax = plt.subplots()

	ax.violinplot([v[0] for v in values])

	minStackValues = []
	maxStackValues = []
	maxMemValues = []
	minMemValues = []
	meanMemValues = []
	meanStackValues = []

	for i, v in enumerate(values):
		minStack = min(values[i][0])
		maxStack = max(values[i][0])

		minStackValues.append(minStack)
		maxStackValues.append(maxStack)

		meanStack = np.mean(values[i][0])

		meanStackValues.append(meanStack)

		zeroCountStack = len([v for v in values[i][0] if v == 0])


		nonZeroCountStack = len([v for v in values[i][0] if v > 0])

		zeroPercentStack = 100.0*zeroCountStack/(zeroCountStack + nonZeroCountStack)
		nonZeroPercentStack = 100.0*nonZeroCountStack/(zeroCountStack + nonZeroCountStack)


	print(f"{minStackValues}, {maxStackValues}, {meanStackValues}, {zeroPercentStack}, {nonZeroPercentStack}")
	plt.show()

def process(model):

	val = getValues(model)
	vals = []
	if val:
		vals.append(val)
		#memTitles.append(f)
	plotValues(vals)


if __name__ == "__main__":
	

	j = open(sys.argv[1], 'r').read()
	j = json.loads(j)

	process(j)
