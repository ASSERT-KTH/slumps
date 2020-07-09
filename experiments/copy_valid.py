

import shutil
import os


programs = open("valid.txt", 'r').readlines()

for pp in programs:
	name = pp.split(".")[0]
	sanitization = name.replace("'", "").replace(".", "_")
	try:
		shutil.copy(f"../benchmark_programs/rossetta/valid/no_input/{name}.c", f"../benchmark_programs/valid_crow/{sanitization}.c")
	except Exception as e:
		print(e)