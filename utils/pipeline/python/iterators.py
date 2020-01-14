# -*- coding: utf-8 -*-

import itertools
import collections


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
