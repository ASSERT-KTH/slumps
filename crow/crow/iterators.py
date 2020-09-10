# -*- coding: utf-8 -*-

import itertools
import collections

def keysSubset(S):

    if len(S) == 0:
        return {}

    for k in S.keys():
        for v in S[k]:
            d = dict(zip(S.keys(), [None]*len(S.keys())))
            d[k] = v
            yield d

    #print("Combinations")

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
        "a": [0,1,7,8,9],
        "b": [2,3],
        "c": [4,5]
    }):
        print(k)