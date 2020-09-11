
import re
import json

class Sanitizer(object):

	INVALID_WASM = ['fshl', 'freeze']

	def __init__(self, sanitize_redundant = True, sanitize_no_wasm = True, report_overlapping = True):

		self.sanitize_redundant = sanitize_redundant
		self.sanitize_no_wasm = sanitize_no_wasm
		self.report_overlapping = report_overlapping

	def sanitize(self, overall_replacements):
		
		cumul = {}

		if self.sanitize_redundant:
			resultMatch = re.compile(r"result %(\d+)\n")
			inferMatch = re.compile(r"infer %(\d+)\n")

			for k in overall_replacements:
				inferVarName = inferMatch.search(k).group(1)
				cumul[k] = []

				replacements = overall_replacements[k]

				# Remove redundant operations
				for v in replacements:
					r = v.replace("sadd.sat", "add")
					r = r.replace("ssub.sat", "sub")
					scan = resultMatch.search(v)

					varName = scan.group(1)
					if r not in cumul[k] and varName != inferVarName:
						cumul[k].append(r)


			overall_replacements = cumul
		
		cumul = {}

		if self.sanitize_no_wasm:
			for k in overall_replacements:
				cumul[k] = []
				replacements = overall_replacements[k]
				for v in replacements:
					if not any([r in v for r in self.INVALID_WASM]):
						cumul[k].append(v)

			overall_replacements = cumul
		# TODO overlaping

		#print(json.dumps(cumul, indent=4))
		#print(json.dumps(overall_replacements, indent=4))
		return overall_replacements
if __name__ == "__main__":

	import json
	s = Sanitizer()

	s.sanitize(json.loads('''
		{
			"%0:i32 = var\\n%1:i32 = mulnsw 2:i32, %0\\ninfer %1\\n": 
				["%2:i32 = freeze %1\\nresult %2\\n", 
				"%2:i32 = and %1, %1\\nresult %2\\n",
				 "result %1\\n", 
				 "%2:i32 = shl %0, 1:i32\\nresult %2\\n",
				"%2:i32 = fshl %0, 0:i32, 1:i32\\nresult %2\\n", 
				"%2:i32 = or %1, %1\\nresult %2\\n", 
				"%2:i32 = mul 2:i32, %0\\nresult %2\\n", 
				"%2:i32 = add %0, %0\\nresult %2\\n", 
				"%2:i32 = sadd.sat %0, %0\\nresult %2\\n"], 
			"%0:i32 = var\\n%1:i32 = mulnsw 2:i32, %0\\n%2:i32 = addnsw %0, %1\\ninfer %2\\n": [
				"%3:i32 = and %2, %2\\nresult %3\\n", 
				"%3:i32 = or %2, %2\\nresult %3\\n", 
				"%3:i32 = add %0, %1\\nresult %3\\n", 
				"%3:i32 = freeze %2\\nresult %3\\n", 
				"%3:i32 = sadd.sat %0, %1\\nresult %3\\n", 
				"result %2\\n", 
				"%3:i32 = mul 3:i32, %0\\nresult %3\\n"]}'''))