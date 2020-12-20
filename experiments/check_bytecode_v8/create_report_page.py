import sys
import os
import json
import shutil

ALIGNMENT_FOLDER = sys.argv[1]

DATA_JSON = json.loads(open(f"{ALIGNMENT_FOLDER}/data_report.json", 'r').read())

for f in os.listdir("report_template"):
	if f == 'index.html':
		# REPLACE PLACEHOLDERS
		indexContent = open(f"report_template/{f}", "r").read()
		indexContent = indexContent.replace("JSON_DATA", json.dumps(DATA_JSON))

		open(f"{ALIGNMENT_FOLDER}/{f}", 'w').write(indexContent)
		continue
	if os.path.isdir(f"report_template/{f}"):
		print(f)
		try:
			shutil.rmtree(f"{ALIGNMENT_FOLDER}/{f}")
		except:
			pass
		print(shutil.copytree(f"report_template/{f}", f"{ALIGNMENT_FOLDER}/{f}"))
	else:
		shutil.copy(f"report_template/{f}", f"{ALIGNMENT_FOLDER}")
