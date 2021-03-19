import sys
import redis
from multiprocessing import Pool
import ray
import subprocess

import json
import os
import time
import platform
import hashlib

ray.init(address='192.168.10.168:6379', _redis_password='5241590000000000')


print('''This cluster consists of
    {} nodes in total
    {} CPU resources in total
'''.format(len(ray.nodes()), ray.cluster_resources()['CPU']))



@ray.remote
def compare(program, w1, w2):
    def get_path():

        PATH = "/mnt/nfs_share"

        if not os.path.exists(PATH):
            PATH = "/Users/javierca/a"

        return PATH

    w1name = w1.split("/")[-1]
    w2name = w2.split("/")[-1]
    PATH = get_path()

    if not os.path.exists(f"{PATH}/{program}/native"):
        try:
            os.mkdir(f"{PATH}/{program}/native")
        except:
            pass

    NATIVE_FOLDER=f"{PATH}/{program}/native"
    archs = ['x86_64', 'aarch64']

    for arch in archs:
        if not os.path.exists(f"{NATIVE_FOLDER}/{w1name}.native.{arch}.dump"):
            open(f"{NATIVE_FOLDER}/{w1name}.native.{arch}.dump", 'w').write("TEST")
        if not os.path.exists(f"{NATIVE_FOLDER}/{w2name}.native.{arch}.dump"):
            open(f"{NATIVE_FOLDER}/{w2name}.native.{arch}.dump", 'w').write("TEST")
    return 0

@ray.remote
def process(program):
    def get_path():

        PATH = "/mnt/nfs_share"

        if not os.path.exists(PATH):
            PATH = "/Users/javierca/a"

        return PATH
    PATH = get_path()
    # list wasm
    r = dict(
        total=0,
        unique=0,
        name=program,
        uniques=[]
    )
    hashes = set()

    if not os.path.exists(PATH):
        return

    if os.path.exists(f"{PATH}/{program}/wasm"):
        for wfile in os.listdir(f"{PATH}/{program}/wasm"):

            content = open(f"{PATH}/{program}/wasm/{wfile}", 'rb').read()
            hsh = hashlib.sha512(content).hexdigest()

            if hsh not in hashes:
                hashes.add(hsh)
                r['uniques'].append(f"{program}/wasm/{wfile}")
            r['total'] += 1

    r['unique'] = len(hashes)

    if r['unique'] != r['total']:
        print(f"WARNING {program} {r['unique']} {r['total']}")

    # Pairwise
    comparisons = []
    for i in range(len(r['uniques'])):
        for j in range(i + 1,len(r['uniques'])):
            w1 = r['uniques'][i]
            w2 = r['uniques'][j]
            comparisons.append(compare.remote( program, w1, w2))

    for c in ray.get(comparisons):
        print(c)

    return  r


if __name__ == "__main__":

    programlist = sys.argv[1:]

    ids = []
    for p in programlist:
        i = process.remote(p)
        ids.append(i)


    for r in ray.get(ids):
        print(r)

