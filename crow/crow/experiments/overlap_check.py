
import sys
import json
from crow.sanitzers.overlap import SouperParser
import re

combination = re.compile(r"(\[\d+-\d+])+")
keycombination = re.compile(r"(\[\d+])+")
kvpair = re.compile(r"(\d+)-(\d+)")

def overlap(exploration_result, combination, parser: SouperParser):
    # exploration result[key-rep]
    # combination [key-rep]+

    pieces = []
    for k, r in combination:
        pieces.append(exploration_result[k][0])

    r = parser.is_there_overlap(pieces)

    if not r:
        print(f"Combination {combination} provides equal but there is not overlap between the keys")

    return r

def get_preffix(str1: str, str2: str, onlykeys=False):

    p = ''

    for c in str1:
        if str2.startswith(c):
            p += c
            str2 = str2[1:]

    r = ""
    s = 0
    tokenizer = combination

    if onlykeys:
        r = keycombination
    for m in tokenizer.finditer(p):
        r += m.group(0)
        s += 1 #

    return r, s

def check_file(file, merging, parser: SouperParser):
    i = 0
    with open(file) as infile:
        for l in infile:
            if "LLVM pair" in l:
                v1, v2 = None, None
                for m in combination.finditer(l):
                    kpieces = []
                    for kv in kvpair.finditer(m.group(0)):
                        k = int(kv.group(1))
                        v = kv.group(2)
                        kpieces.append(merging[k][0])
                    r = parser.is_there_overlap(kpieces)

                    if not v1:
                        v1 = m.group(0)
                        continue
                    if not v2 and v1:
                        v2 = m.group(0)
                    if not r:
                        print("Not overlap", m.group(0))
                        raise Exception(f"Not overlap but still the combination is here {l}")

                if v1 == v2:
                    print(l)
                    raise Exception("Not possible")
                prefix, s = get_preffix(v1, v2)
                if s > 0: # at least the frst key
                    print(f"{i:010d}",prefix, v1, v2)
                else:
                    raise Exception(f"Not common prefix but still the combination is here {v1} {v2}")

                i += 1
if __name__ == '__main__':
    p = SouperParser()
    merging = json.loads(open(sys.argv[1], 'r').read())

    check_file(sys.argv[2], merging, p)

    #overlap(merging, [(0,0), (1,0)], p)