import sys
import redis
from multiprocessing import Pool
from neo4j import GraphDatabase

import subprocess

import json
import os
import time
import platform
import hashlib
import re
import base64 as b64
import functools

from multiprocessing import Pool


WHITE_LIST=[
"crypto_aead_chacha20poly1305_ietf_encrypt_detached",
"crypto_aead_chacha20poly1305_ietf_decrypt_detached",
"crypto_core_ed25519_scalar_invert",
#"crypto_core_ed25519_scalar_complement",
"crypto_core_ed25519_scalar_random",
"sodium_bin2base64"]


class Query:

    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def get_spanning(self, function_name):
        with self.driver.session() as session:
            greeting = session.write_transaction(self._get_static_spanning,function_name )
            return greeting
        
    
    @staticmethod
    def _get_static_spanning(tx, functionName,):
        
        result = tx.run(
            f"MATCH p=(start {{name: '{functionName}'}})-[r:ST*..]->(k) return p")

        paths = [r[0] for r in result]
        a = set()
        for relation in paths:
            for k in relation.nodes:
                #print(k)
                if "DISPATCHER" in k.labels:
                    a.add(k['name'])
        
        functions = [re.sub(r"\.\d+", "", k) for k in a]

        return [f for f in functions if f != functionName]
def involved_path_dispatchers(fname):
    host = os.getenv("NEO_HOST", "bolt://localhost:7687")
    user = os.getenv("NEO_USER", "neo4j")
    pass_ = os.getenv("NEO_PASS", "test")


    greeter = Query(host, user, pass_)
    r = greeter.get_spanning(fname)
    greeter.close()

    return r
    

def process(data):
    COUNTP = 0
    COUNTNONP = 0
    OVERALL = {

    }
    for k, v in data.items():
        if len(v['native_hashes']) > 1:

            #if v['functions'] in WHITE_LIST:
            
            PRESERVED = 0
            NON_PRESERVED = 0
            for variant, original in v["pairs"]:
                if original["wasm_hash"] != variant["wasm_hash"]:
                    if original["native_hash"] != variant["native_hash"]:
                        PRESERVED += 1
                        COUNTP += 1
                    else:
                        NON_PRESERVED += 1
                        COUNTNONP += 1
                        #print(variant['diff'])
                        #input()
            unique_wasm_hash = len(set(v['wasm_hashes'] + [v['wasm']['original_hash']]))
            unique_native_hash = len(set(v['native_hashes'] + [v['native']['original_hash']]))
            OVERALL["".join(v['functions'])] = [PRESERVED, NON_PRESERVED ,unique_wasm_hash, unique_native_hash]

            if "crypto_aead_chacha20poly1305_ietf_encrypt_detachedcrypto_aead_chacha20poly1305_ietf_keygen" in OVERALL:
                OVERALL["crypto_aead_chacha20poly1305_ietf_encrypt_detached"] = OVERALL["crypto_aead_chacha20poly1305_ietf_encrypt_detachedcrypto_aead_chacha20poly1305_ietf_keygen"]

            #sanitized = f"{v['functions']}".replace("_", "\_")
            #print(f"{sanitized} &  {(100*PRESERVED)/(NON_PRESERVED + PRESERVED):.2f}\\% & {unique_wasm_hash} & {unique_native_hash} & {100*unique_native_hash/unique_wasm_hash:.2f}\\% \\\\\n\\hline ")      
            #print(v["functions"], PRESERVED, NON_PRESERVED)
    
    INVOLDED_FUNCTIONS = set()
    # printing latex table

    FUNCTIONS_HIDE = {

    }
    def print_latex_row(fname, unique_wasm, unique_x86, preserved, non_preserved, end=" ", hide_functions = True, FI = 0):
        fname = fname.replace("_", "\_")
        
        if preserved is not None and non_preserved is not None:
            print(f"{fname} & {unique_wasm} & {unique_x86} & {unique_x86/unique_wasm:.2f}", end=end ) 
        else:
            print(f"{fname} & {unique_wasm} & {unique_x86} & {unique_x86/unique_wasm:.2f}", end=end ) 

    FI = 0

    #print(OVERALL)
    fMAP = {}
    for k, v in OVERALL.items():
        if k in WHITE_LIST:
            involved = involved_path_dispatchers(k)
            #print(k, "&", end=" ")
            SUM = [1, 1]
            nname = f"f{FI}"
            fMAP[nname] = k
            fMAP[k] = nname
            print_latex_row(f"\\textbf{{{k}}}", v[2], v[3], v[0], v[1], end="\\\\\n", FI=FI)
            FI += 1
            # #of unique wasm, #unique x86, # preserved Wasm pairs, # non preserved
            SUM[0] *= v[2]
            SUM[1] *= v[3]
            
            meta = [[m, OVERALL[m]] for m in involved if m in OVERALL]
            INVOLDED_FUNCTIONS.add(k)
            #print("\\\\")
            for name, m in meta:
                

                nname = f"f{FI}"
                fMAP[nname] = name

                fMAP[name] = nname
                print_latex_row(f"{name}", m[2], m[3], m[0], m[1], end="\\\\\n", FI=FI)
                FI += 1

                #print(name, "&", m[2], "&", m[3], "&", m[0], "&", m[1], "\\\\")
                SUM[0] *= m[2]
                SUM[1] *= m[3]
                INVOLDED_FUNCTIONS.add(name)
            
            print_latex_row("\\hline\n Unique paths", SUM[0], SUM[1], None, None, end="\\\\\n\\hline\\hline\n", hide_functions=False)

    open("fmap.json", 'w').write(json.dumps(fMAP, indent=4))
'''
crypto_aead_chacha20poly1305_ietf_encrypt_detached,
crypto_aead_chacha20poly1305_ietf_decrypt_detached,
crypto_core_ed25519_scalar_invert,
crypto_core_ed25519_scalar_complement,
crypto_core_ed25519_scalar_random,
bin2base64
'''
if __name__ == "__main__":

    programsFolder = sys.argv[1]

    process(json.loads(open(programsFolder, 'r').read()))
    #print(involved_path_dispatchers("sodium_bin2base64"))

