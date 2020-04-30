#!/usr/bin/env python3

import json
import os
import sys
from collections import defaultdict
from glob import glob
from subprocess import check_output, run

CC = os.environ.get("CC", "clang-10")

if len(sys.argv) > 1:
    inputs = sys.argv[1:]
else:
    inputs = ["74657374746573747465737474657374"]

results = defaultdict(list)

for inp in inputs:
    for fname in glob("*.bc"):
        executable = "./" + os.path.splitext(fname)[0] + ".out"
        run([CC, fname, "-o", executable], check=True)
        output = check_output([executable, inp]).decode()
        results[output].append(fname)

print(json.dumps(results, indent=2))
