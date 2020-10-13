#!/usr/bin/env python
"""
Assumes folowing directory structure:
.
├── aead_aes256gcm_aesni
│   ├── aead_aes256gcm_aesni.bc
│   ├── aead_aes256gcm_aesni.ll
│   ├── aead_aes256gcm_aesni.wasm
│   └── aead_aes256gcm_aesni.wat
…
├── argon2-core
│   ├── [14-11].bc
│   ├── [14-11].ll
│   ├── [14-11].wasm
│   ├── [14-11].wat
│   ├── [14-12].bc
│   ├── [14-12].ll
│   ├── [14-12].wasm
│   ├── [14-12].wat
│   ├── [14-14].bc
│   ├── [14-14].ll
│   ├── [14-15].bc
│   ├── [14-15].ll
…
"""
import difflib
import json
import os
import re
import sys
from decimal import Decimal
from functools import lru_cache, partial
from glob import glob
from operator import itemgetter

FUNC_PATTERN = re.compile(r"\s*define .*?@(.+?)\(")

N_VARS = 100


def main():
    cartesian_count = 1
    d = {}
    for basename in map(
        os.path.basename, map(os.path.dirname, glob(os.path.join(".", "*", "")))
    ):
        original_fname = os.path.join(basename, basename + ".bc")
        assert os.path.isfile(original_fname)

        modified = [
            fname
            for fname in glob(os.path.join(basename, "*.bc"))
            if ll_diff(original_fname, fname)
        ]
        if not modified:
            continue

        cartesian_count *= len(modified) + 1

        modified = [
            (fname, cmp(fname, original_fname), fname.count("[")) for fname in modified
        ]
        modified.sort(key=itemgetter(1), reverse=True)

        d[basename] = modified

        log(len(modified), basename)
        # max_modified_count = max(modified_count)
        # count_eq_max = sum(x == max_modified_count for x in modified_count)
        # print(count_eq_max, "x", max_modified_count, sep="")
    log(f"{Decimal(cartesian_count):.2E}")

    for _ in range(N_VARS):
        has = False
        for basename, modified in d.items():
            if not modified:
                continue
            has = True
            print(modified.pop(0)[0], end=" ")
        if not has:
            break
        print()

    # Alternative algorithm:
    # indices = {k: 0 for k in d}
    # for _ in range(2, N_VARS):
    #     best = (None, -float("inf"))
    #     for basename, modified in d.items():
    #         idx = indices[basename]
    #         if idx + 1 >= len(modified):
    #             continue
    #         diff = modified[idx + 1][1] - modified[idx][1]
    #         if diff > best[1]:
    #             best = (basename, diff)
    #     indices[best[0]] += 1

    #     # print(f"{n}:")
    #     for (basename, modified), idx in zip(d.items(), indices):
    #         # print(" " * 4, basename, modified[indices[basename]][0])
    #         print(modified[indices[basename]][0], end=' ')
    #     print()


@lru_cache
def cmp(variant, original):
    cnt = 0
    for line in difflib.ndiff(bc_read(variant), bc_read(original)):
        cnt += line[0] in ("+", "-")
    return cnt


def ll_diff(a, b):
    if a == b:
        return False

    a = bc_read(a)
    b = bc_read(b)
    assert a != b
    return True


@lru_cache
def bc_read(x):
    return readf(strip_end(x, ".bc") + ".ll")


def strip_end(text, suffix):
    if text.endswith(suffix):
        return text[: len(text) - len(suffix)]
    return text


def readf(fname):
    with open(fname) as f:
        return tuple(line.strip() for line in f)


def log(*args):
    print(*args, file=sys.stderr)


main()
