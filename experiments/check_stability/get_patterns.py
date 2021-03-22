import sys
import redis
from multiprocessing import Pool
import ray

import json
import os

ray.init()


print('''This cluster consists of
    {} nodes in total
    {} CPU resources in total
'''.format(len(ray.nodes()), ray.cluster_resources()['CPU']))

@ray.remote
def process(program):
    print(program)

    r = redis.Redis(
        host=os.getenv("REDIS_HOST", "localhost"),
        port=int(os.getenv("REDIS_PORT", "8789")),
        db=0
    )

    def get_unique_wasm(program):
        k = f"{program}:wasm:*"

        return len(r.keys(k))

    def compress_replacement(S):
        pass

    def get_patterns(program):
        k = f"{program}:case2:eq:*:*"
        MAX = 100
        equality = []
        for ki in r.scan_iter(k, count=10000000):
            replacement = r.get(ki.decode()).decode()
            replacement = json.loads(replacement)
            S1 = replacement['S1']
            S2 = replacement['S2']

            equality.append((S1, S2))

            if MAX <= 0:
                break
            MAX -= 1

        return equality

    def get_counts_pairs(program):
        k = f"{program}:stability:result:x86_64:REVERSED"
       # print(k)
        eq_pairs = -1
        diff_pairs = -1
        if r.get(k):
            eq_pairs = int(r.get(k))
        k = f"{program}:stability:result:x86_64:NON_REVERSED"
        if r.get(k):
            diff_pairs = int(r.get(k))

        #print(eq_pairs, diff_pairs)
        return (eq_pairs, diff_pairs)

    unique_wasm = get_unique_wasm(program)

    count = get_counts_pairs(program)

    #equality = get_patterns(program)

    return (program, unique_wasm, count)

def get_unique(program):

    if not os.path.exists(f"/Volumes/Samsung Portable/Results/1h/out/{program}/diff_wasm"):
        return 0
    return len(os.listdir(f"/Volumes/Samsung Portable/Results/1h/out/{program}/diff_wasm"))

if __name__ == "__main__":

    programlist = sys.argv[1:]

    ids = []
    for p in programlist:
        ids.append(process.remote(p))

    # print latex

    ray.wait(ids)

    table = [r for r in ray.get(ids)]
    table = sorted(table, key = lambda x: x[1], reverse=True)

    print("Name & Unique Wasm & EQ count & DIFF count")
    sums = [0, 0, 0, 0]
    for r in table:
        sanitized = r[0].replace('_', '\_')

        u = get_unique(r[0])
        if u > 0:
            p = (r[2][1]/(r[2][0] + r[2][1]))
            t = r[2][0] + r[2][-1]
            #print(u*(u + 1)/2)
            print(f"{sanitized} & {u} & {t} & {r[2][0]} & {p*100:.2f}\\% \\\\\n\\hline")
            sums[0] += u
            sums[1] += t
            sums[2] += r[2][0]
            sums[3] += r[2][1]

    print(f" & {sums[0]} & {sums[1]} & {sums[2]} & {sums[3]/sums[1]*100:.2f}\\%")
    #input()
