#!/usr/bin/env python
import json
import logging
import os
import string
import subprocess
import sys
from glob import glob

import pexpect

logging.basicConfig(
    level=logging.DEBUG, format="%(asctime)s - %(levelname)s:%(message)s"
)
logger = logging.getLogger("main")

BLACKLIST = ("lua", "sqlite")
INPUTS = {
    "aliquot_sequence_classifications_1": {"args": ["10"]},
    "Banker's_algorithm": {
        "stdin": [
            "4",
            "5",
            "8 5 9 7",
            "2 0 1 1 0 1 2 1 4 0 0 3 0 2 1 0 1 0 3 0",
            "3 2 1 4 0 2 5 2 5 1 0 5 1 5 3 0 3 0 3 3",
        ]
    },
    "flipping_bits_game": {"stdin": ["r2", "c2"]},
}


def main():
    os.chdir("benchmark4pipeline_c")
    os.makedirs("output", exist_ok=True)

    results = {}
    for fname in glob("*.c"):
        key = os.path.basename(fname).split(".", 1)[0]
        if any(key.startswith(item) for item in BLACKLIST):  # Program not testable
            continue
        assert key not in results

        out = filter_filename(f"output/{key}")
        run(["clang", "-O3", "-o", out, fname])
        results[key] = {fname: run_from_key(key, out)}

    for key, postfix, fname in iter_unique_targets():
        logger.debug("%s .%s (%s)", key, postfix, fname)

        out = filter_filename(f"output/{key}.{postfix}.run")
        run(["clang", "-Wno-override-module", fname, "-o", out])
        results[key][fname] = run_from_key(key, out)

    print(json.dumps(results, indent=2, sort_keys=True))

    for d in results.values():
        gold = None
        for fname, res in d.items():
            if fname.endswith(".c"):
                gold = res
                break
        else:
            logger.error("%s: No ground truth found!", d.keys())
            continue

        for fname, res in d.items():
            if res != gold:
                logger.error("Differ: %s", fname)


def iter_unique_targets():
    targets = {}
    for line in sorted(
        subprocess.check_output(["md5sum"] + glob("*.bc")).decode().strip().split("\n")
    ):
        md5sum, fname = line.split()
        existing = targets.get(md5sum)
        if existing:
            logger.warning("%s = %s", fname, existing)
        else:
            targets[md5sum] = fname
            key, postfix = os.path.basename(fname).split(".", 1)
            if not any(key.startswith(item) for item in BLACKLIST):
                yield key, postfix, fname


def run_from_key(key, args):
    config = INPUTS.get(key, {})
    extra_args = config.get("args", [])

    logger.debug("Executing: %s %s", args, extra_args)
    p = pexpect.spawn(args, extra_args, timeout=200)

    for line in config.get("stdin", []):
        p.sendline(line)
    out = p.read().decode()
    return out, p.status


def run(cmd, **kwargs):
    logger.debug("Executing: %s", " ".join(map(str, cmd)))
    return subprocess.run(cmd, **kwargs, check=kwargs.pop("check", True))


def write_if_nonempty(s, fname):
    if s:
        with open(fname, "w") as f:
            print(s, file=f)


def filter_filename(s):
    return "".join(c for c in s if c in string.ascii_letters + string.digits + r"/_-.")


if __name__ == "__main__":
    sys.exit(main())
