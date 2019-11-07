
import itertools

def getSubsetIterator(S,m):
    if m == len(S):
        yield S
    else:
        yield from itertools.combinations(S, m)
        yield from getSubsetIterator(S, m + 1)
        
