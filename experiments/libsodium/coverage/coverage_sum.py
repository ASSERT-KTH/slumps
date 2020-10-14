#!/usr/bin/env python
import json
import os
from collections import defaultdict
from glob import glob
from operator import itemgetter

WHITELIST = [
    "aead_chacha20poly1305",
    "aead_xchacha20poly1305",
    "auth3",
    "box",
    "box2",
    "box_easy",
    "generichash2",
    "generichash3",
    "kdf",
    "onetimeauth2",
    "scalarmult",
    "scalarmult5",
    "secretbox",
    "secretbox2",
    "secretbox_easy",
    "secretstream",
    "sodium_utils3",
    "stream3",
    "stream4",
]

if False:
    d = defaultdict(list)
    for fname in glob("*.log"):
        if os.path.splitext(os.path.basename(fname))[0] not in WHITELIST:
            continue
        with open(fname) as f:
            for k, v in json.load(f).items():
                # d[k] += v
                d[k].append(fname)
else:
    d = defaultdict(lambda *_: 0)
    for fname in glob("*.log"):
        with open(fname) as f:
            for k, v in json.load(f).items():
                d[k] += v


print(json.dumps(d, indent=2))
