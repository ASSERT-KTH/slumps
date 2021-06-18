
import re
import json

class Sanitizer(object):

	INVALID_WASM = ['fshl', 'freeze']

	def __init__(self, sanitize_redundant = True, sanitize_no_wasm = True, report_overlapping = True, 
	remove_negation_pattern = False, remove_idempotent_operations=True):

		self.sanitize_redundant = sanitize_redundant
		self.sanitize_no_wasm = sanitize_no_wasm
		self.report_overlapping = report_overlapping
		self.remove_negation = remove_negation_pattern
		self.remove_idempotent_operations = remove_idempotent_operations


	def sanitize_replacement(self, key, v):
		resultMatch = re.compile(r"result %(\d+)")
		result = v

		lines = [l for l in v.split("\n") if l]

		if len(lines) == 1:
			if resultMatch.match(lines[0]): # The inferring its only the same value
				print(f"Variant discarded\n{k}\n{v}")
				return None

		if self.remove_idempotent_operations:
			inferMatch = re.compile(r"infer %(\d+)\n")
			operatorMatch = re.compile(r"((%\d+):i\d+) = ([\w\d\.]+)(( (%\d+),*)*)$")

			inferVarName = inferMatch.search(key)
			#print(inferVarName)
			if inferVarName:
				inferVarName = inferVarName.group(1)
				redo = []
				replace = {}

				for l in v.split("\n"):
					operator = operatorMatch.search(l)
					if operator:
						instruction = operator.group(3)
						operators = operator.group(4)
						operator_id = operator.group(6)
						assignment_id = operator.group(2)
						count = operators.count(operator_id)

						#print(f"====={instruction}")
						if instruction in ['and', 'or']:
							# it is an idempotent operation, it will be removed by V8 JIT for example
							# REMOVE and replace the assignment variable to the idempotent one
							replace[assignment_id] = operator_id
							redo.append(f";{l}")  # comment out the instruction for debuging reasons
							continue
					redo.append(l)

				# replacing unused ids
				final = ""
				for l in redo:
					l1 = l
					if not l.startswith(";"):  # if it is not a comment
						for kr in replace.keys():
							# print(kr)
							l1 = l1.replace(kr, replace[kr])
					final += l1 + "\n"
				result = final
				#print("Idempontent", result)

		if self.sanitize_redundant:
			resultMatch = re.compile(r"result %(\d+)\n")
			inferMatch = re.compile(r"infer %(\d+)\n")
			inferVarName = inferMatch.search(key)

			if inferVarName:
				inferVarName = inferVarName.group(1)

				# Remove redundant operations
				r = v.replace("sadd.sat", "add")
				r = r.replace("ssub.sat", "sub")
				r = r.replace("uadd.sat", "add")
				r = r.replace("usub.sat", "sub")
				r = r.replace("mulnsw", "mul")
				r = r.replace("addnsw", "add")
				scan = resultMatch.search(v)

				if scan:
					result = r


		return result

	def sanitize(self, overall_replacements):
		cumul = {}
		if self.remove_idempotent_operations:
			resultMatch = re.compile(r"result %(\d+)\n")
			inferMatch = re.compile(r"infer %(\d+)\n")
			operatorMatch = re.compile(r"((%\d+):i\d+) = ([\w\d\.]+)(( (%\d+),*)*)$")

			for k in overall_replacements:
				inferVarName = inferMatch.search(k)

				if inferVarName:
					inferVarName = inferVarName.group(1)
					cumul[k] = []

					replacements = overall_replacements[k]

					# Remove redundant operations

					for v in replacements:
						
						redo = [ ]
						replace = {  }
						for l in v.split("\n"):
							operator = operatorMatch.search(l)
							if operator:
								instruction = operator.group(3)
								operators = operator.group(4)
								operator_id = operator.group(6)
								assignment_id = operator.group(2)
								count = operators.count(operator_id)

								#print(f"====={instruction}")
								if instruction in ['and', 'or']:
									# it is an idempotent operation, it will be removed by V8 JIT for example
									# REMOVE and replace the assignment variable to the idempotent one
									replace[assignment_id] = operator_id
									redo.append(f";{l}") # comment out the instruction for debuging reasons
									continue
							redo.append(l)
						
						# replacing unused ids
						final = ""
						for l in redo:
							l1 = l
							if not l.startswith(";"): # if it is not a comment
								for kr in replace.keys():
									#print(kr)
									l1 = l1.replace(kr, replace[kr])
							final += l1 + "\n"
						cumul[k].append(final)

						#print(redo, final)
						#exit(1)
						#print(final)

			overall_replacements = cumul
		cumul = {}

		if self.sanitize_redundant:
			resultMatch = re.compile(r"result %(\d+)\n")
			inferMatch = re.compile(r"infer %(\d+)\n")

			for k in overall_replacements:
				inferVarName = inferMatch.search(k)

				if inferVarName:
					inferVarName = inferVarName.group(1)
					cumul[k] = []

					replacements = overall_replacements[k]

					# Remove redundant operations
					for v in replacements:
						r = v.replace("sadd.sat", "add")
						r = r.replace("ssub.sat", "sub")
						r = r.replace("uadd.sat", "add")
						r = r.replace("usub.sat", "sub")
						r = r.replace("mulnsw", "mul")
						r = r.replace("addnsw", "add")
						scan = resultMatch.search(v)

						if scan:
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

		

			overall_replacements = cumul
		return overall_replacements
if __name__ == "__main__":

	s = Sanitizer()
	a = s.sanitize_replacement(
		'''%0:i32 = var
			%1:i32 = mulnsw 2:i32, %0
			infer %1
			''',
		'''
		%2:i32 = or %0, %0
		%3:i32 = addnsw %0, %2
		result %3
		'''
	)

	print(a)
	exit(0)
	import json
	s = Sanitizer()

	a = s.sanitize(json.loads('''
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

	for k in a.keys():
		print(k)
		for v in a[k]:
			print(v)
		print()
