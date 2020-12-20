import sys
import os
import re

FUNC_START=r'\n[\t\r ]+\(func '
FUNC_NAME=r'\(func \$?([\w\d\._-]+)'

wat_content = open(sys.argv[1], 'r').read()

FILTER = open("wasi_def/defined-symbols.txt", 'r').readlines()
FILTER += open("wasi_def/undefined-symbols.txt", 'r').readlines()
FILTER += open("wasi_def/custom.txt", 'r').readlines()

FILTER = [f.replace("\n", "") for f in FILTER]

functions = []
names = []

def get_function_from(content, start_at):
	result = ''
	OPENED = 1
	for c in content[start_at:]:
		result += c
		if c == '(':
			OPENED += 1
		if c == ')':
			OPENED -= 1

		if OPENED == 0:
			return '('+result

#print(wat_content)
for match in re.compile(FUNC_START).finditer(wat_content):

	c = wat_content[match.span()[0]]
	index = match.span()[0]
	start = index
	while c != '(':
		index += 1
		c = wat_content[index]

	current_func = get_function_from(wat_content, index + 1)

	name_match = re.compile(FUNC_NAME).search(current_func)
	#print(current_func)

	if name_match:
		name = name_match.group(1)
		if not name in FILTER:
			names.append(name)
			functions.append(current_func)
	#if len(functions) == 2:
	#	break
for f in functions:
	print(f)