#!/usr/bin/env python3
"""
IMPORTANT -- Assumes the following directory structure:
    libsodium/ == root directory of libsodium
    crow_out/libsodium/<name>/*.bc == variants of each object

To call update_relink_cmd, libear (https://github.com/rizsotto/Bear/) is required.
"""
import argparse
import atexit
import json
import os
import random
import re
import shutil
from glob import glob
from itertools import islice
from pathlib import Path
from subprocess import run

from tqdm import tqdm

RELINK_CMD_FNAME = "relink-cmd.json"


def parse_args(args):
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--build",
        action="store_true",
        help=f"Build libsodium. Needed if you don't have the libsodium/{RELINK_CMD_FNAME} file.",
    )
    parser.add_argument(
        "--only-build",
        action="store_true",
        help="Like --build but stop after build is done.",
    )
    parser.add_argument(
        "--check", action="store_true", help="Run test suite (make check)"
    )
    parser.add_argument("--reps", type=int, help="How many combinations to try")

    args = parser.parse_args(args)
    if args.only_build:
        args.build = True

    return args


def main(args):
    # Build from scratch & find command used to link
    os.chdir("libsodium")
    if args.build:
        relink_cmd, relink_cwd = update_relink_cmd(check=args.check)
    else:
        relink_cmd, relink_cwd = load_relink_cmd()
    os.chdir("..")

    if args.only_build:
        return

    # Backup original build & restore it at the end
    _cp_r("libsodium", "libsodium.original")
    atexit.register(
        _cp_r,
        os.path.abspath("libsodium.original"),
        os.path.abspath("libsodium"),
        shutil.move,
    )

    for idx, combination in enumerate(
        tqdm(islice(randcartesian("crow_out/libsodium"), args.reps), total=args.reps)
    ):
        # Refer to generated object files with their absolute path because we are going
        # to change directory
        combination_abs = [os.path.abspath(x) for x in combination]

        os.chdir("libsodium")
        update_targets(combination_abs)
        run(relink_cmd, cwd=relink_cwd, check=True)
        if args.check:
            run(["make", "check"], check=True)
        os.chdir("..")

        shutil.copy(
            "libsodium/src/libsodium/.libs/libsodium.so",
            f"{idx}-libsodium.so",
            follow_symlinks=True,
        )
        with open("combinations.txt", "a") as f:
            print(combination, file=f)


def update_relink_cmd(*, check=False):
    _run("git clean -fdx . && autoreconf -fi && ./configure")
    _run(
        """export INTERCEPT_BUILD_TARGET_DIR="$(pwd)/.ear"
mkdir -p "$INTERCEPT_BUILD_TARGET_DIR"
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/bear/libear.so
make -j$(nproc)"""
        + (" check\n" if check else "\n")
    )

    for fname in glob(".ear/execution*"):
        with open(fname) as f:
            s = f.read()
        if "/usr/bin/ld" in s:
            cmd = json.loads(s)
            del cmd["pid"]
            cmd["cwd"] = os.path.relpath(cmd["cwd"])
            with open(RELINK_CMD_FNAME, "w") as f:
                json.dump(cmd, f)
            return cmd["cmd"], cmd["cwd"]
    return None


def load_relink_cmd():
    with open(RELINK_CMD_FNAME) as f:
        cmd = json.load(f)
    return cmd["cmd"], cmd["cwd"]


def update_targets(targets):
    originals = [x for x in rglob(".", "libsodium_la-*.o") if ".libs" in x]
    originals.sort()
    targets = sorted(targets)

    for target in targets:
        repl = [x for x in originals if _obj_cmp(x, slumps2obj(target))]
        if not repl:
            with open("../ignored.txt", "a") as f:
                print(target, file=f)
            continue
        assert len(repl) <= 1
        repl = repl[0]

        update(repl, target)


def update(dest, src, ext=None):
    if ext is None:
        _, ext = os.path.splitext(src)
    if ext == ".o":
        return shutil.copy2(src, dest)
    if ext == ".bc":
        return run(["clang", "-fPIC", "-DPIC", "-c", src, "-o", dest], check=True)
    raise ValueError("Unkown file extension")


def search_in_cmd(cmd, value):
    base, ext = os.path.splitext(value)
    if ext == ".bc":
        value = base + ".o"

    files_from_cmd = [x for x in cmd if not x.startswith("-")]
    equal = [idx for idx, x in enumerate(files_from_cmd) if _obj_cmp(x, value)]
    if not equal:
        raise ValueError(f"'{value}' not in cmd list")
    if len(equal) > 1:
        raise ValueError(f"More than one '{value}' found in cmd list")
    return files_from_cmd[equal[0]]


def randcartesian(path="."):
    d = {
        dirname: glob(os.path.join(dirname, "*.o"))
        for dirname in filter(
            os.path.isdir, (os.path.join(path, x) for x in os.listdir(path))
        )
    }

    unique = set()
    while True:
        combination = tuple(random.choice(v) for v in d.values())
        if combination in unique:
            continue
        unique.add(combination)
        yield combination


def slumps2obj(path):
    return re.sub(r"\[[\d_]+\]", "", os.path.basename(path))


def rglob(dirname, pattern="*.bc"):
    return list(map(str, Path(dirname).rglob(pattern)))


def _obj_cmp(obj, value):
    obj = os.path.basename(obj)
    if obj == value:
        return True

    PREFIX = "libsodium_la-"
    if obj.startswith(PREFIX):
        obj = obj[len(PREFIX) :]

    return obj == value


def _run(cmd):
    run(cmd, shell=True, check=True)


def _cp_r(from_path, to_path, copy_function=shutil.copytree):
    if os.path.exists(to_path):
        shutil.rmtree(to_path)
    copy_function(from_path, to_path)


if __name__ == "__main__":
    import sys

    main(parse_args(sys.argv[1:]))
