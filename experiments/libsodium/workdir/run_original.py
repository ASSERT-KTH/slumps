#!/usr/bin/env python3
import json
import os
import subprocess
import sys
from shutil import copy, rmtree
from subprocess import DEVNULL

from tqdm import tqdm

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


def readf(fname):
    with open(fname) as f:
        return tuple(line.strip() for line in f)


def _listdir(*path):
    _path = os.path.join(*path)
    for fname in os.listdir(_path):
        yield os.path.join(_path, fname)


def proc_wait(procs):
    if not procs:
        return 0
    return max(abs(p.wait()) for p in procs)


def set_environ(*enable):
    for _key in ["WASMER", "COVERAGE", "RUN", "TRACE"]:
        key = "TEST_DO_" + _key
        if key in enable or _key in enable:
            os.environ[key] = "1"
        else:
            os.environ.pop(key, None)


enabled = list(WHITELIST)
print(f"Enabling {len(enabled)} tests:", enabled)
with open("/libsodium/test/default/whitelist.txt", "w") as f:
    print("\n".join(enabled), file=f)


def run(output_dir):
    rmtree(output_dir, ignore_errors=True)

    set_environ("TRACE")
    subprocess.run(
        ["make", "check", "-C", "/libsodium", "-j"], check=True, stderr=DEVNULL
    )

    os.makedirs(output_dir)
    for testname in enabled:
        abspath = os.path.join("/libsodium", "test", "default", testname + ".log")
        subprocess.run(
            f"grep -E '^s' {abspath} > {output_dir}/{testname}.log.s",
            shell=True,
            check=True,
        )
        subprocess.run(
            f"grep -E '^m' {abspath} > {output_dir}/{testname}.log.m",
            shell=True,
            check=True,
        )
        os.remove(abspath)


run("original-traces")
