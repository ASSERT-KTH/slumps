import sys
import os
import re

FUNC_START=r'wasm-function\[(\d+)\] "([\w\d_\.-]+)"'

FILTER = open("wasi_def/defined-symbols.txt", 'r').readlines()
FILTER += open("wasi_def/undefined-symbols.txt", 'r').readlines()
FILTER += open("wasi_def/custom.txt", 'r').readlines()
FILTER = [f.replace("\n", "") for f in FILTER]

content = sys.stdin.read()

fidxs=set()
for match in re.compile(FUNC_START).finditer(content):
	name=match.group(2)
	if not match.group(2) in FILTER:
		#print(f"-{match.group(2)}-", match.group(1))
		fidxs.add(match.group(1))

JOIN=" ".join(fidxs)
print(f" {JOIN} ")