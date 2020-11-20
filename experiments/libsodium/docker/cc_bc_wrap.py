#!/usr/bin/env python3
import os
import re
import subprocess
import sys
from functools import partial
from glob import glob

# Also see Bear:
# https://github.com/rizsotto/Bear/blob/75ff7f561652509ec9b34095881fdb6c4a56c9e0/bear/bear.py#L61-L93
FLAGS_WITH_POSITIONAL = {
    "-MF",
    "-MT",
    "-MQ",
    "-l",
    "-L",
    "-u",
    "-z",
    "-T",
    "-Xlinker",
    "-o",  # XXX: if we need to keep output
}
# Hardcoded link to path with variants
BITCODES = os.environ.get("BITCODES", "/workdir/var")

err = partial(print, file=sys.stderr)


def main(args):
    assert len(args) > 0
    cwd = os.getcwd()
    err("Got:", args, cwd)

    # For -MT to work
    _clang(args)
    if "-c" not in args or "src/" not in cwd or not convert_args(args):
        return

    _clang(args)


def find_source_idx(args):
    iterator = enumerate(args)
    out = None
    ret = None
    for idx, arg in iterator:
        if arg in FLAGS_WITH_POSITIONAL:
            next(iterator)
        elif arg[0] != "-":
            assert ret is None
            ret = idx
    # raise ValueError("Could not find source in args")
    return (ret, out)


def convert_args(args):
    idx, out = find_source_idx(args)
    if idx is None:
        return False
    c = args[idx]

    bc = c_to_bc(c)
    if bc is None:
        return False

    args[idx] = bc
    if out is None:
        # The standard behaviour here seems to be to remove the ".c" extension,
        # add the ".o" extension and save to the current working directory.
        args.append("-o")
        args.append(_basename(c) + ".o")
        err("Appending -o", args[-1])

    return True


def c_to_bc(c):
    # if "src/" not in c:
    #     return c

    base = _basename(c)

    for bc in glob(os.path.join(BITCODES, "*")):
        # Clean variant path and name. Example:
        # /path/to/[15]crypto_secretbox_easy[0_1_2_3].bc -> crypto_secretbox_easy
        if re.sub(r"\[[\d|-]+\]", "", _basename(bc)) == base:
            err(f"Replacing {c} with {bc}")
            return bc
    err(f"No replacement found for {c}")
    # raise ValueError(f"Could not find {c} in {BITCODES}")
    return c


def _basename(x):
    """Remove path and expected (.c, .bc) extensions from filename

    Examples:
    - /path/to/a.c.bc -> a
    - /path/to/a.c -> a
    """
    return os.path.basename(_strip_suffix(_strip_suffix(x.strip(), ".bc"), ".c"))


def _strip_suffix(text, suffix):
    if text.endswith(suffix):
        return text[: len(text) - len(suffix)]
    return text


def _clang(args):
    err("clang args:", args)
    return subprocess.run(["clang"] + args, check=True)


def entry_point():
    main(sys.argv[1:])


if __name__ == "__main__":
    entry_point()
