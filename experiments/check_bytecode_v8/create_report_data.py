import sys
import os
import json
from matplotlib import pyplot as plt
import base64
from scipy import stats
import numpy as np
from common import *
from mpl_toolkits.axes_grid1.inset_locator import zoomed_inset_axes
from mpl_toolkits.axes_grid1.inset_locator import mark_inset

ALIGNMENT_FOLDER = sys.argv[1]
WASMS_FOLDER = sys.argv[2]

# READ all alignment results
programs = set()
data = [ ]
for f in os.listdir(ALIGNMENT_FOLDER):
	program_name = f.split(".")[0]
	programs.add(program_name)
CHECK_FOR_ZERO_BYTECODE=False
SAVE_IN_DB=False
DO_PLOTS=True

FILTER = [

]

def get_distribution(data):
	
	result = []

	for f in data.keys():
		for k2 in data[f].keys():
			result.append(data[f][k2])
	return result

def get_distribution_iterator(data):
	for f in data.keys():
		for k2 in data[f].keys():
			yield f, k2, data[f][k2]

if SAVE_IN_DB:
	import pymongo

	myclient = pymongo.MongoClient("mongodb://localhost:27017/")

	dblist = myclient.list_database_names()

	if "crow3" in dblist:
		print("The database exists.")

	mydb = myclient["crow3"]

	collist = mydb.list_collection_names()
	mycol = mydb["variants"]
	alignmentsCol = mydb["alignments"]
	wasmsCol = mydb["wasms"]

	if "variants" in collist:
		print("The collection exists.")
		# remove old data
		#mycol.drop()
		#alignmentsCol.drop()
		#wasmsCol.drop()



record = {}

LOW_BOUND=1.73
HIGH_BOUND=0.38

d1 = []
d2 = []

REVERSED=dict(d1=[], d2=[])
LOW=dict(d1=[], d2=[])
HIGH=dict(d1=[], d2=[])
NORMAL=dict(d1=[], d2=[])

REVERSED_DATA = []
LOW_DATA  = []
HIGH_DATA = []
NORMAL_DATA = []

count = 0
for i,name in enumerate(programs):
	#if i > 10:
	
	#	break
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
	#EXPLORATION_DATA = json.loads(open(f"{ALIGNMENT_FOLDER}/{name}.exploration.json", 'r').read())



	if len(WAT_DATA["fileMap"]) != len(BYTECODE_DATA["fileMap"]):
		pass
		#print(F"WARNING program {name} has different comparison numbers for the bytecode types")

	count=len(WAT_DATA["fileMap"])
	if count == 0:
		continue

	print(f"Variants {name} {count} {i}/{len(programs)}")

	if SAVE_IN_DB:
		alignmentsV8 = BYTECODE_DATA["mapBackAligment"]
		alignmentsWat = WAT_DATA["mapBackAligment"]

		del BYTECODE_DATA["mapBackAligment"]
		del WAT_DATA["mapBackAligment"]

		def write_alignments(name, mp):
			r = []
			for k in mp.keys():
				for k1 in mp[k].keys():
					align = mp[k][k1]
					idx = f"{name}_{k}_{k1}"
					try:
						alignmentsCol.insert_one(dict(
							_id=idx,
							align=align
						))
						r.append(idx)
					except Exception as e:
						print(e)
			return r
			
		idsV8 = write_alignments(f"{name}_V8", alignmentsV8)
		idsWAT = write_alignments(f"{name}_WAT", alignmentsWat)


		watIds = []
		for watF in WAT_DATA["fileMap"].values():
			print(watF)
			wname = ".".join(watF.split("/")[-1].split(".")[:-1])
			print(wname)
			fContent = open(f"{WASMS_FOLDER}/{name}/{wname}", 'rb').read()
			#message_bytes = message.encode('ascii')
			fContent = base64.b64encode(fContent)
			fContent = fContent.decode('ascii')
			try:
				wasmsCol.insert_one(dict(name=wname, binary=fContent, original=name, _id=f"{name}_{wname}"))
				watIds.append(f"{name}_{wname}")
			except Exception as e:
				print(e)

		record = dict(name=name, 
			count=count, 
			machineCodeAlignment=BYTECODE_DATA, 
			watCodeAlignment=WAT_DATA,
			v8Alignments=idsV8,
			watAlignments=idsWAT,
			variants=watIds
		)
		x = mycol.insert_one(record)

	fileMap = WAT_DATA["fileMap"]

	for k1, k2, d1 in get_distribution_iterator(WAT_DATA["functionMap"]):
		d2 = BYTECODE_DATA["functionMap"][k1][k2]

		record = dict(
				file1="/".join(fileMap[k1].split("/")[-2:]),
				file2="/".join(fileMap[k2].split("/")[-2:]),
				watValue=d1,
				v8value=d2,
				#explorationFile=EXPLORATION_DATA,
				watAlignment=WAT_DATA["mapBackAligment"][k1][k2]
				#v8Alignment=BYTECODE_DATA["mapBackAligment"][k1][k2]
			)
		if d1 == 0: # Remove sanitization check
			print(record["file1"])
			continue

		if d2 == 0: # REVERSED
			REVERSED['d1'].append(d1)
			REVERSED['d2'].append(d2)
			REVERSED_DATA.append(record)
			continue

		ratio = d1/d2
		if ratio > LOW_BOUND: # LOW DIVERSIFICATION in MACHINE CODE
			LOW['d1'].append(d1)
			LOW['d2'].append(d2)
			LOW_DATA.append(record)

		elif HIGH_BOUND <= ratio <= LOW_BOUND: # NORMAL DIVERSIFICATION
			NORMAL['d1'].append(d1)
			NORMAL['d2'].append(d2)
			NORMAL_DATA.append(record)

		else: # HIGH
			HIGH['d1'].append(d1)
			HIGH['d2'].append(d2)
			HIGH_DATA.append(record)

		
		#print(f"FILTERED {name}")
	#break
	

#open("reversed.data.json", 'w').write(json.dumps(REVERSED_DATA))
#open("low.data.json", 'w').write(json.dumps(LOW_DATA))
#open("normal.data.json", 'w').write(json.dumps(NORMAL_DATA))
#open("high.data.json", 'w').write(json.dumps(HIGH_DATA))

#plt.hist(d1, bins=100,  histtype='step')
#plt.hist(d2, bins=100,  histtype='step')
if DO_PLOTS:
	latexify(fig_width=4, fig_height=3, font_size=8, tick_size=8)
	fig, ax = plt.subplots()
	format_axes(ax, hide=['top', 'right'], show=['left', 'bottom'])

	#plt.scatter(REVERSED['d1'], REVERSED['d2'], alpha=0.01)
	#plt.scatter(LOW['d1'], LOW['d2'], alpha=0.01)
	#plt.scatter(NORMAL['d1'], NORMAL['d2'], alpha=0.01)
	#plt.scatter(HIGH['d1'], HIGH['d2'], alpha=0.01)
	#plt.xlabel("WAT DTW")
	#plt.ylabel("Machine code DTW")

	#plt.show()

	# if d2[i] is zero then simulate infinite
	s1 = LOW['d1'] + NORMAL['d1'] + HIGH['d1'] + REVERSED['d1']

	s2 = LOW['d2'] + NORMAL['d2'] + HIGH['d2'] + REVERSED['d2']

	open("distrib.json", "w").write(json.dumps(dict(
		wat=s1,
		x86=s2
	)))

	#plt.ylim([0, max(max(s1), max(s2))])

	#plt.scatter(range(len(s)), s, alpha=0.2)
	s1 = [s for s in s1 if s > 0]

	hxs1, hys1, _ = ax.hist(s1, bins=np.arange(0,int(max(s1)),1),  density=1 )
	hxs2, hys2, _ = ax.hist(s2, bins=np.arange(0,int(max(s2)),1),  density=1)
	plt.savefig("histogram.pdf")

	plt.close()
	#fig, ax = plt.subplots()

	#ax.hist(s1, bins=10000,  density=1, histtype='step', alpha=0.8 )
	#ax.hist(s2, bins=10000,  density=1, histtype='step', alpha=0.8)

	#plt.show()

	fig, ax = plt.subplots()
	latexify(fig_width=4, fig_height=4, font_size=8, tick_size=8)
	format_axes(ax, hide=['top', 'right'], show=['left', 'bottom'])

	#print(hys1, hxs1)
	dx = hys1[1] - hys1[0]
	F1s1 = np.cumsum(hxs1)*dx*100
	a1=ax.plot(hys1[1:], F1s1, label="DTW(Wasm)", linewidth=0.6)

	dx2 = hys2[1] - hys2[0]
	F1s2 = np.cumsum(hxs2)*dx2*100
	a2=ax.plot(hys2[1:], F1s2, label="DTW(x86)", linewidth=0.6)

	axins = zoomed_inset_axes(ax,100,loc='lower right', bbox_to_anchor=(0.8,0.3), bbox_transform=ax.transAxes)
	
	# sub region of the original image
	print(min(s2), min(s1), min(F1s2), min(F1s1), len(list(filter(lambda x: x == 0, s2))))
	x1, x2, y1, y2 = min(s2), min(s2) + 8, 0, 1.2*max(min(F1s2), min(F1s1))
	LIMIT=5
	format_axes(axins,hide=[], show=['left', 'bottom', 'top', 'right'])

	axins.plot(hys1[1:(LIMIT + 1)], F1s1[:LIMIT], '-', linewidth=0.6)
	axins.plot(hys2[1:(LIMIT + 1)], F1s2[:LIMIT],  '-', linewidth=0.6)

	axins.set_xlim(x1, x2)
	axins.set_ylim(y1, y2)
	#axins.grid(True)
	#axins.set_xticks(range(0, 32, 2))
	ax.legend(bbox_to_anchor=(0.7, 1.2), loc='upper left', borderaxespad=0.)

	#ax.legend([a1, a2], )

	#plt.xticks(visible=False)
	#plt.yticks(visible=False)

	# draw a bbox of the region of the inset axes in the parent axes and
	# connecting lines between the bbox and the inset axes area
	mark_inset(ax, axins, loc1=2, loc2=3, ec='gray', linewidth=0.4)

	#plt.draw()
	plt.tight_layout()

	#plt.show()
	plt.savefig("histogram.better.pdf")

