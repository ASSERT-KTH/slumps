#!/usr/bin/env python3
import os
import subprocess
import sys


def main(args):
    assert len(args) > 0
    print("Got:", args, file=sys.stderr)

    if "-c" not in args:
        _clang(args)
        return

    if "-o" not in args:
        target_idx = len(args) + 1
        # XXX: -1 is hackyyyy
        target = [x for x in args if not x.startswith("-")][-1]
        _clang(args + ["-o", target + ".bc", "-emit-llvm"])
    else:
        target_idx = args.index("-o") + 1
        args[target_idx] += ".bc"
        _clang(args + ["-emit-llvm"])

        args[target_idx] = args[target_idx].rstrip(".bc")

    # Normal workflow: just call clang with original arguments
    _clang(args)


def bc_target(target):
    reldir = os.path.abspath(os.path.dirname(target)).lstrip("/")
    target = os.path.join("/tmp/bitcodes", reldir)
    os.makedirs(os.path.dirname(target), exist_ok=True)
    return target


# XXX: can be done in background
def _clang(args):
    print("clang args:", args, file=sys.stderr)
    return subprocess.run(["clang"] + args, check=True)


def entry_point():
    main(sys.argv[1:])


if __name__ == "__main__":
    entry_point()
