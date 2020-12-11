import sys
import os
import json
from matplotlib import pyplot as plt

ALIGNMENT_FOLDER = sys.argv[1]

# READ all alignment results
programs = set()
data = [ ]
for f in os.listdir(ALIGNMENT_FOLDER):
	program_name = f.split(".")[0]
	programs.add(program_name)
d1 = []
d2 = []

CHECK_FOR_ZERO_BYTECODE=True

FILTER = [
	"Display_a_linear_combination",
	"Non-continuous_subsequences",
	"Find_the_intersection_of_two_lines",
	"Magic_squares_of_singly_even_order",
	"Diversity_prediction_theorem",
	"Magic_squares_of_doubly_even_order"
]

for name in programs:
	datas = [f for f in os.listdir(ALIGNMENT_FOLDER) if f.split(".")[0] == name]
	
	if not f"{name}.exploration.json" in datas:
		pass
		#print(F"WARNING program {name} wont be included due to miss of exploration")
		
	if len(datas) != 3 or name in FILTER:
		print(f"WARNING {name} with {len(datas)} data")
		continue

	# check the same number of comparison for aboth types, v8 and wat
	#print(f"Loading data {name}", end=" ")
	WAT_DATA = json.loads(open(f"{ALIGNMENT_FOLDER}/{name}.wat.json", 'r').read())
	BYTECODE_DATA = json.loads(open(f"{ALIGNMENT_FOLDER}/{name}.bytecode.json", 'r').read())

	if len(WAT_DATA["fileMap"]) != len(BYTECODE_DATA["fileMap"]):
		pass
		#print(F"WARNING program {name} has different comparison numbers for the bytecode types")

	count=len(WAT_DATA["fileMap"])
	if count > 0:
		data.append(dict(name=name, count=len(WAT_DATA["fileMap"])))
	else:
		continue
	#print(f"variants {count}")

	def get_distribution(data):
		
		result = []

		for f in data.keys():
			for k2 in data[f].keys():
				result.append(data[f][k2])
		return result
	d11 = get_distribution(WAT_DATA["functionMap"])

	if not any(map(lambda x: x == 0,filter(lambda x:x == 0, d11))):
		d1 += d11
		d22 = get_distribution(BYTECODE_DATA["functionMap"])
		if any(map(lambda x: x == 0,filter(lambda x:x == 0, d22))):
			print(f"Check machine code of {name}")
		d2 += d22
	else:
		pass
		#print(f"FILTERED {name}")

plt.hist(d1, bins=100,  histtype='step')
plt.hist(d2, bins=100,  histtype='step')
plt.show()

data = sorted(data, key= lambda x: x["count"], reverse=True)
print(len(data), data[0])

open(f"{ALIGNMENT_FOLDER}/data_report.json", 'w').write(json.dumps(data))