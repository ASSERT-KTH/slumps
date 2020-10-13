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

.ll files are without comments. From original data, run:
    find . -iname '*.bc' -exec llvm-dis {} \;
    sed -rni 's/\s*;.*$//' $(find . -iname '*.ll')
"""
import difflib
import json
import os
import re
from collections import Counter, defaultdict
from glob import glob
from math import log


def texttt(name):
    return r"\texttt{" + name.replace("_", r"\_\allowbreak{}") + "}"


def lstinline(name):
    # return r"{\lstinline[language=C,basicstyle=\ttfamily]!" + name + "!}"
    return r"{\texttt{" + name.replace("_", r"\_") + "}}"


FUNC_PATTERN = re.compile(r"\s*define .*?@(.+?)\(")
DESCRIPTIONS = {
    "argon2-core": r"Core functions for the implementation of the Argon2 key derivation (hash) function~\cite{biryukov2016argon2}",
    "argon2-encoding": r"Functions for encoding and decoding (including salting) Argon2~\cite{biryukov2016argon2} hash strings",
    "blake2b-ref": r"Reference implementation for the BLAKE2~\cite{aumasson2013blake2} hash function",
    "chacha20_ref": r"Reference implementation of the ChaCha20 stream cipher~\cite{bernstein2008chacha}",
    "codecs": r"Implementations of commonly used codecs for conversions between binary formats like Base64~\cite{josefsson2006base16}",
    "core_ed25519": r"Implementation of the Edwards-curve Digital Signature Algorithm~\cite{bernstein2012high}",
    "crypto_scrypt-common": r"Utility and low-level API functions for the scrypt key derivation (hash) function~\cite{percival2009stronger}",
    "pbkdf2-sha256": r"Implementation of the Password-Based Key Derivation Function 2 (PBKDF2)~\cite{RFC2898}",
    "pwhash_scryptsalsa208sha256": r"High-level API for the scrypt key derivation function~\cite{percival2009stronger}",
    "pwhash_scryptsalsa208sha256_nosse": r"Same as above, but does not use Streaming SIMD Extensions (SSE)",
    "randombytes": r"Pseudorandom number generators",
    "salsa20_ref": r"Contains a reference implementation of the Salsa20 stream cipher~\cite{bernstein2008salsa20}",
    "scalarmult_ristretto255_ref10": r"Implementation of the Ristretto255 prime order elliptic curve group~\cite{ristretto}",
    "stream_chacha20": r"High-level API for the ChaCha20 stream cipher~\cite{bernstein2012high}",
    "verify": r"Functions used to compare secrets in constant time to avoid timing attacks",
}
T2NFUNCS = {
    "argon2-core": 6,
    "argon2-encoding": 2,
    "blake2b-ref": 11,
    "chacha20_ref": 5,
    "codecs": 5,
    "core_ed25519": 19,
    "crypto_scrypt-common": 5,
    "pbkdf2-sha256": 1,
    "pwhash_scryptsalsa208sha256": 19,
    "pwhash_scryptsalsa208sha256_nosse": 3,
    "randombytes": 11,
    "salsa20_ref": 2,
    "scalarmult_ristretto255_ref10": 4,
    "stream_chacha20": 15,
    "verify": 6,
}
with open("../coverage/sum.json") as f:
    COVERAGE_CALLS = json.load(f)

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
T2F = defaultdict(list)
for fname in sorted(glob("../coverage/*.log")):
    with open(fname) as f:
        for func in json.load(f):
            T2F[func].append(os.path.basename(os.path.splitext(fname)[0]))


def main():
    basenames = sorted(
        os.path.basename(os.path.dirname(x)) for x in glob(os.path.join(".", "*", ""))
    )
    first = True
    for basename in basenames:
        original_fname = os.path.join(basename, basename + ".ll")
        assert os.path.isfile(original_fname)

        modified = sorted(
            fname
            for fname in glob(os.path.join(basename, "*.ll"))
            if not fname == original_fname
        )

        if not modified:
            continue
        # print(basename)

        c = Counter()
        original_lines = readf(original_fname)
        for fname in modified:
            modified_lines = readf(fname)

            func_name = None
            for line in difflib.ndiff(original_lines, modified_lines):
                if match := FUNC_PATTERN.match(line):
                    func_name = match[1]
                elif line[0] in ("+", "-"):
                    # assert func_name, 'Change is inside a function'
                    if func_name:
                        # print(" " * 4, func_name)
                        c.update([func_name])
                        func_name = None

        if first:
            first = False
        else:
            print(r"\hline")

        description = DESCRIPTIONS[basename].strip() + "."
        funcs = sorted(filter(bool, c))

        print(r"\textbf{" + texttt(basename) + r"}\newline " + description)

        # n = 1 + len(modified)
        # percent = 100 * log(n, 40)
        # print(
        #     r"&\colorbox{celadon!"
        #     + f"{percent:.2f}"
        #     + "}{"
        #     + f"${n}$" + r"} & " + f"${T2NFUNCS[basename]}$"
        # )
        print(f"& ${len(modified)}$ & ${T2NFUNCS[basename]}$")

        print(r"& \begin{tabular}[t]{@{}l}")
        print(r"\\".join(map(lstinline, funcs)))
        # print(r"\\".join(func_fmt(func) for func in funcs))
        print(r"\end{tabular}")

        print(r"& \begin{tabular}[t]{r@{}}")

        print(r"\\".join(notation(COVERAGE_CALLS.get(func, 0)) for func in funcs))
        print(r"\end{tabular}\\")


def readf(fname):
    with open(fname) as f:
        return [line.strip() for line in f]


def notation(n):
    if n == 0:
        return r"{$0$}"

    # s = f"{n:.2E}"
    # return color + lstinline(s)
    s = f"{n:.2E}".split("E")
    return "$" + s[0] + r"\mathrm{E}" + "{" + s[1] + "}$"


def func_fmt(func):
    tests = [test for test in T2F[func] if test in WHITELIST]
    if tests:
        after = ": " + lstinline(
            ", ".join(chr(97 + WHITELIST.index(test)).upper() for test in tests)
        )
    else:
        after = ""
    return lstinline(func) + after


main()
