import sys
import json
import re


key = re.compile(r"\[(\d+)-(\d+)\]")

if __name__ == "__main__":
    data = json.loads(open(sys.argv[1], 'r').read())

    # split keys
    print(sys.argv[2])
    for m in key.finditer(sys.argv[2]):
        k = int(m.group(1))
        v = int(m.group(2))

        print("ORIGINAL")
        print(data[k][0])

        print("REPLACEMENT")
        print(data[k][1][v])
