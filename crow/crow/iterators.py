# -*- coding: utf-8 -*-

import itertools
import collections
from settings import config

def keysSubset(S):

    if len(S) == 0:
        return {}
    if config["sanitizer"].getboolean("sort-replacements-by-length"):
            
        for k in S.keys():
            v1 = sorted(S[k], key= lambda x: -len(x))
            S[k] = v1


    #for k in S:
    #    S[k] = [None] + S[k]

    keys, values = zip(*S.items())

    print(f"Combinations of {len(keys)}")
    #print(keys)
    #print(values)
    COUNT = 0
    SKIP=config["DEFAULT"].getint("skip-every-x-replacement")

    # sort-replacements-by-length


    print(SKIP)
    for i in range(min(len(keys), config["DEFAULT"].getint("combination-min-limit")), 
    min(config["DEFAULT"].getint("combination-max-limit"),len(keys) + 1)): ## minimun number of keys to apply at onceß
        for v in itertools.combinations(keys, i): # for each applied combinations of keys get the product of values
            for p in itertools.product(*[S[k] for k in v]):
                COUNT+=1
                if COUNT % SKIP == 0:
                    # skip every X
                    continue
                yield dict(zip(v, p))

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
        "a": ['a0', 'a1', 'a2123123123'],
        "b": ['b1', 'b2'],
        "c": ['c1','c2']
    }):
        print(k)