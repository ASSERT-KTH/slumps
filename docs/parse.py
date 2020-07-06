content = open("paper_example_variants_stage1.txt", 'r').read()

r = content.split("\n\n\n")

c1 = 0
c2 = 0 

c1Set = set()
c2Set = set()

for l in r:
	if len(l.split("\n")) <= 2:
		c1 += 1
		c1Set.add(l)
	else:
		c2 += 1
		c2Set.add(l)
print(len(r), c1, c2, len(c1Set), len(c2Set))