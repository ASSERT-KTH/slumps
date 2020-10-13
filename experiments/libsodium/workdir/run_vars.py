#!/usr/bin/env python3
import json
import os
import subprocess
import sys
from multiprocessing import Pool, cpu_count
from shutil import copy, rmtree
from subprocess import DEVNULL

from tqdm import tqdm

# These will eventually change with compiler updates, etc. However, for our
# experiment they are always the same.
WHITELIST = {
    "aead_chacha20poly1305": "84f4617fdfa2f0d48105d502c6cf5d9f",
    "aead_xchacha20poly1305": "3c9c7edd3f17b6e624aae8a83c8d05af",
    "auth3": "0bbaeb399515cc75a50249d0fa024169",
    "box": "4b71006cf1f4f0137d401bbe5c0cd2df",
    "box2": "f9f91d026c1e004dc1bebd183eb1d5b7",
    "box_easy": "bf31fb7c8ded2a63767385221e9c0597",
    "generichash2": "2cdfbe6b294d9675bef40147c2172b47",
    "generichash3": "50f126c3f2ba1b5f0f3baef6a95f0372",
    "kdf": "b0bb3c7152a815ee8b158a184f30ef0c",
    "onetimeauth2": "d4c6f9cd7e64ee2439560b8c1cf7d37d",
    "scalarmult": "a0ca33e038fcd2180ba8b49e53cc3e6c",
    "scalarmult5": "3e7665eb8fe59131b8075804cf1d7b93",
    "secretbox2": "ebccccc2004f7735d6c42ef8b0eef0dd",
    "secretbox": "938a48dab130ce7799ffab632d7df650",
    "secretbox_easy": "ae7192bf19b2425e1b6878a442198dba",
    "secretstream": "b08ff25f6416fb81940bfc1ec5d1a320",
    "sodium_utils3": "defc9fa80024767259b8d71b6ca40312",
    "stream3": "56ceecbdd8609a36e8eb972275217998",
    "stream4": "2819f04e8d969dbce59981732b3ff9b9",
}


def readf(fname):
    with open(fname) as f:
        return tuple(line.strip() for line in f)


def check_test(testname):
    expected = WHITELIST.get(os.path.basename(testname))
    return expected and md5sum(testname) != expected


def _listdir(*path):
    _path = os.path.join(*path)
    for fname in os.listdir(_path):
        yield os.path.join(_path, fname)


def md5sum(fname):
    return subprocess.check_output(["md5sum", fname]).decode().split(maxsplit=1)[0]


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


ok = True
for name, expected in WHITELIST.items():
    actual = md5sum("/libsodium/test/default/" + name)
    if actual != expected:
        ok = False
        print(name, actual)
        WHITELIST[name] = actual
print(json.dumps(WHITELIST, indent=2))
assert ok


variants = readf("variants.txt")
root_dir = os.getcwd()

exec_type = ""
if len(sys.argv) > 2:
    exec_type = sys.argv[1].strip()
if not exec_type:
    exec_type = "TRACE"


# Start in /workdir
# Compile /libsodium
# Copy ./libsodium to <new workdir>
# Execute
def run(_args):
    idx, var = _args

    workdir = f"libsodium{idx}"
    var_dir = f"/workdir/var{idx}"

    rmtree(workdir, ignore_errors=True)
    rmtree(var_dir, ignore_errors=True)
    rmtree(str(idx), ignore_errors=True)

    subprocess.run(["cp", "--preserve", "-r", "/libsodium", workdir], check=True)
    # Copy variants to /workdir/var%d where /cc_bc_wrap.py searches for
    subprocess.run(["cp", "--preserve", "-r", "/workdir/bitcodes", var_dir], check=True)

    for bitcode in var.split(" "):
        # Example format: argon2-encoding/[7-9].bc
        parts = bitcode.split("/")
        assert len(parts) == 2
        os.remove(os.path.join(var_dir, parts[0] + ".c.bc"))
        copy(
            os.path.join("crow_out", bitcode),
            os.path.join(var_dir, parts[0] + parts[1]),
        )

    # Re-compile with bitcodes. 'make check' is needed to re-compile the tests
    # to detect static differences.
    os.chdir(workdir)
    os.environ["BITCODES"] = var_dir
    subprocess.run(
        "dist-build/wasm32-wasi.sh", check=True, stdout=DEVNULL, stderr=DEVNULL
    )
    set_environ()
    subprocess.run(
        ["make", "check", "-j4"], check=False, stdout=DEVNULL, stderr=DEVNULL
    )

    enabled = sorted(
        os.path.basename(testname)
        for testname in _listdir("test", "default")
        if check_test(testname)
    )
    if not enabled:
        print(idx, "No test diversified!")
        return

    print(idx, f"Enabling {len(enabled)} tests:", enabled)
    with open("test/default/whitelist.txt", "w") as f:
        print("\n".join(enabled), file=f)

    os.chdir(root_dir)

    set_environ(exec_type)
    subprocess.run(["make", "check", "-C", workdir, "-j4"], check=True, stderr=DEVNULL)

    os.makedirs(str(idx))
    for testname in enabled:
        abspath = os.path.join(workdir, "test", "default", testname + ".log")
        subprocess.run(
            f"grep -E '^s' {abspath} > {idx}/{testname}.log.s", shell=True, check=True
        )
        subprocess.run(
            f"grep -E '^m' {abspath} > {idx}/{testname}.log.m", shell=True, check=True
        )


with Pool(cpu_count()) as p:
    list(tqdm(p.imap_unordered(run, enumerate(variants)), total=len(variants)))
