import sys
import os
import json
from matplotlib import pyplot as plt
import base64
from scipy import stats

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



for i,name in enumerate(programs):
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

	for k1, k2, d1 in get_distribution_iterator(WAT_DATA["functionMap"]):
		d2 = BYTECODE_DATA["functionMap"][k1][k2]

		if d2 == 0: # REVERSED
			REVERSED['d1'].append(d1)
			REVERSED['d2'].append(d2)
			continue

		ratio = d1/d2
		if ratio > LOW_BOUND: # LOW DIVERSIFICATION in MACHINE CODE
			LOW['d1'].append(d1)
			LOW['d2'].append(d2)
		elif HIGH_BOUND <= ratio <= LOW_BOUND: # NORMAL DIVERSIFICATION
			NORMAL['d1'].append(d1)
			NORMAL['d2'].append(d2)
		else: # HIGH
			HIGH['d1'].append(d1)
			HIGH['d2'].append(d2)



		#print(f"FILTERED {name}")

	

#plt.hist(d1, bins=100,  histtype='step')
#plt.hist(d2, bins=100,  histtype='step')

plt.scatter(REVERSED['d1'], REVERSED['d2'], alpha=0.01)
plt.scatter(LOW['d1'], LOW['d2'], alpha=0.01)
plt.scatter(NORMAL['d1'], NORMAL['d2'], alpha=0.01)
plt.scatter(HIGH['d1'], HIGH['d2'], alpha=0.01)
plt.xlabel("WAT DTW")
plt.ylabel("Machine code DTW")

plt.show()

# if d2[i] is zero then simulate infinite
s1 = LOW['d1'] + NORMAL['d1'] + HIGH['d1']
s2 = LOW['d2'] + NORMAL['d2'] + HIGH['d2'] 
s = [s1[i]/s2[i] for i in range(len(s1))]
ss = set(s)

#plt.scatter(range(len(s)), s, alpha=0.2)
plt.hist(s, bins=int(len(ss)/2))
plt.xlabel("(WAT DTW)/(Machine Code DTW)")
plt.ylabel("Equivalence class count")

plt.show()


