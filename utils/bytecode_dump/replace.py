import sys


f = open(sys.argv[1], 'r').read()

c = f.replace("FILE_TEMPLATE", sys.argv[3])

open(sys.argv[2], 'w').write(c)