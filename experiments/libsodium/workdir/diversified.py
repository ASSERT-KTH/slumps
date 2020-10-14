import os
import sys
from glob import glob
from itertools import tee
from multiprocessing import Pool, cpu_count
from pathlib import Path

import numpy as np

from fastdtw import fastdtw

RADIUS = int(os.environ.get("RADIUS", 1))
N_PARALLEL = int(os.environ.get("N_PARALLEL", cpu_count()))
print("Settings:", RADIUS, N_PARALLEL, file=sys.stderr)


def parse(fname):
    return np.fromiter(_parse(fname), dtype="float")


def _parse(fname):
    d = {}
    with open(fname) as f:
        for line in f:
            value = d.get(line)
            if value is None:
                d[line] = value = len(d)
            yield value


def rglob(dirname, pattern="*.bc"):
    return list(map(str, Path(dirname).rglob(pattern)))


def run(logbase):
    res = []
    radius = RADIUS
    for tpe in ("m", "s"):
        a = f"originals/{logbase}.log.{tpe}"
        arr1 = parse(a)
        args = [(arr1, a, b, radius) for b in _div_logs(logbase, tpe)]
        with Pool(_pool_size(tpe)) as p:
            res += list(p.map(_fastdtw, args))
        radius = min(1, radius // 2)  # for 's'
    return res


def _fastdtw(args):
    arr1, a, b, radius = args
    arr2 = parse(b)
    return (
        a,
        b,
        fastdtw(
            arr1,
            arr2,
            # dist=lambda x, y: (int(x) != int(y)),  # When not using https://github.com/orestisfl/fastdtw/
            radius=radius,
        )[0],
    )


def _div_logs(logbase, tpe):
    return sorted(
        filter(
            lambda x: "original-traces" not in x,
            rglob("workdir", f"{logbase}.log.{tpe}"),
        )
    )


def _pool_size(tpe):
    if RADIUS == 1:
        x = int(cpu_count() // (1 + 2 * (tpe == "s")))
        print(x, file=sys.stderr)
        return x
    assert RADIUS == 10
    if tpe == "m":
        return 20
    return 10


LOGS = [
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


def main():
    radius = RADIUS
    for tpe in ("m", "s"):
        args = []
        for logbase in LOGS:
            a = f"workdir/original-traces/{logbase}.log.{tpe}"
            arr1 = parse(a)
            args += [(arr1, a, b, radius) for b in _div_logs(logbase, tpe)]
        with Pool(_pool_size(tpe)) as p:
            for res in p.imap_unordered(_fastdtw, args):
                print(*res)
        radius = min(1, radius // 2)  # for "s"


if __name__ == "__main__":
    main()
