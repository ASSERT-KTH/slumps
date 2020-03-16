
import os
import sys


counter = 0
for root, subdirs, files in os.walk(sys.argv[1]):
    for f in files:
        if not f.startswith("[") and f.endswith(".wasm"):
            print(os.path.abspath(f"{root}/{f}"), end=" ")
            counter += 1

print()

print(counter)