import json
import sys
import re

pattern = re.compile(r"var\ninfer")

def process(f):
	data = json.loads(open(f, 'r').read())

	candidates = len(data)
	diversified_count = 0
	var_infering = 0
	for c in data:
		if pattern.findall(c[0]):
			var_infering += 1
		if len(c[1]) > 1:
			diversified_count += 1

	name = f.split("/")[-1].split(".")[0]
	print(f"{name}, {candidates - var_infering: 08d}, {candidates}, {var_infering}")
if __name__ == "__main__":
	process(sys.argv[1])