# -*- coding: utf-8 -*-

import itertools
import collections

def keysSubset(S):

    for k in S:
        S[k].append(None)

    keys, values = zip(*S.items())
    permutations_dicts = [dict(zip(keys, v)) for v in itertools.product(*values)]

    return permutations_dicts

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
    keysSubset({
        "a": ["a1","a2","b2","b3"],
        "b": ["b1", "c4"]
    })