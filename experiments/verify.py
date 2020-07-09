import sys
import os

folder = sys.argv[1]

binaries = os.listdir(folder)

count = 1

scriptfile = open("validate.sh", 'w')

for b in binaries:
	scriptfile.write(f"echo \"{b}\" \n\n timeout -k 5 -v 5 java -jar /Users/javierca/Documents/Develop/swam/out/cli/assembly/dest/swam.jar run --wasi \"{folder}/{b}\" && echo \"{b}\" >> valid.txt \n\n")

