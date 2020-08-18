# -*- coding: utf-8 -*-

import itertools
import collections

def keysSubset(S):

    if len(S) == 0:
        return {}

    for k in S:
        S[k] = [None] + S[k]

    keys, values = zip(*S.items())

    for v in itertools.product(*values):
        yield dict(zip(keys, v))

def subset(S):
    def subsetAux(S, m):
        if m == len(S):
            yield S
        else:
            yield from itertools.combinations(S, m)
            yield from subsetAux(S, m + 1)

    return subsetAux(S, 1)


def onexone(S):
    yield from [[x] for x in S]


def all(S):
    yield S


def flatten(x):
    if isinstance(x, collections.Iterable):
        return [a for i in x for a in flatten(i)]
    else:
        return [x]
if __name__ == "__main__":
    for k in keysSubset({
        "a": list(range(2000)),
        "b": list(range(1000)),
        "c": list(range(10)),
        "d": list(range(46)),
        "e": list(range(100))
    }):
        print(k)