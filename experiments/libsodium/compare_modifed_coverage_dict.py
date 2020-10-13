#!/usr/bin/env python
import json
import os
from collections import defaultdict
from glob import glob

blacklist = (
    "aead_chacha20poly13052",
    "auth5",
    "auth7",
    "box7",
    "box8",
    "box_easy2",
    "box_seal",
    "chacha20",
    "codecs",
    "core3",
    "core_ed25519",
    "core_ristretto255",
    "ed25519_convert",
    "generichash",
    "kx",
    "metamorphic",
    "onetimeauth7",
    "pwhash_argon2i",
    "pwhash_argon2id",
    "pwhash_scrypt",
    "pwhash_scrypt_ll",
    "randombytes",
    "scalarmult2",
    "scalarmult8",
    "scalarmult_ed25519",
    "scalarmult_ristretto255",
    "secretbox7",
    "secretbox8",
    "secretbox_easy2",
    "sign",
    "sodium_utils",
    "sodium_utils2",
    "stream",
    "stream2",
    "verify1",
    "xchacha20",
)


def strip_end(text, suffix):
    if text.endswith(suffix):
        return text[: len(text) - len(suffix)]
    return text


def readmd(fname):
    started = False
    for line in readf(fname):
        if line.startswith("```"):
            if started:
                return
            started = True
        elif started:
            yield line


def readjson(fname):
    with open(fname) as f:
        return json.load(f)


def readf(fname):
    with open(fname) as f:
        return [line.strip() for line in f]


def basename(x):
    return os.path.basename(strip_end(x.strip(), ".log"))


coverage = [
    (basename(fname), readjson(fname)) for fname in sorted(glob("coverage/*.log"))
]
assert len(coverage) == 77

f2t = defaultdict(list)
t2f = defaultdict(list)

for function in sorted(readmd("crow_out/README.md")):
    for test_name, calls in coverage:
        if function in calls:
            f2t[function].append(test_name)
            t2f[test_name].append(function)

n_only_blacklist = 0
for function, tests in f2t.items():
    print("-", function)
    is_only_blacklisted = 1
    for test_name in tests:
        if test_name in blacklist:
            test_name = f"~~ {test_name} ~~"
        else:
            is_only_blacklisted = 0
        print("  -", test_name)
    n_only_blacklist += is_only_blacklisted

print(
    n_only_blacklist,
    "functions covered only by blacklisted tests.",
    len(f2t),
    "total functions modified.",
    end="\n\n",
)

covered_functions = set()
cnt = 0
for test_name, functions in t2f.items():
    if test_name in blacklist:
        continue
    cnt += 1
    covered_functions.update(functions)
    print("-", test_name)
    for function in functions:
        print("  -", function)
print(
    len(covered_functions),
    "total covered functions.",
    cnt,
    "Total tests which cover functions.",
)
