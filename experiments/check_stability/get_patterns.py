import sys
import redis
from multiprocessing import Pool
import subprocess

import json
import os
import re
import hashlib



MODULE_NAME=re.compile(r"(.*)_(\d+)$")
FUNCTION_NAME=re.compile(r"\n[ \t]+\(func (\$\w+) \(type \d\)")

BLACK_LIST=["$__wasm_call_ctors"]
PRINT_TABLE=False
INCLUDE_EQ_PAIRS=True


def process(program):
    print(program)

    r = redis.Redis(
        host=os.getenv("REDIS_HOST", "localhost"),
        port=int(os.getenv("REDIS_PORT", "6380")),
        db=0,
        password=os.getenv("REDIS_PASS", None)
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

    return (program, program, unique_wasm, count)

def get_unique(program):

    if not os.path.exists(f"out/{program}/diff_wasm"):
        return 0
    return len(os.listdir(f"out/{program}/diff_wasm"))

def get_unique_bc(program):

    if not os.path.exists(f"out/{program}/diff_bc"):
        return 0
    return len(os.listdir(f"out/{program}/diff_bc"))

def get_unique_native(program):

    if not os.path.exists(f"out/{program}/native"):
        raise Exception("Not found")

    r = set()

    for f in os.listdir(f"out/{program}/native"):
        content = open(f"out/{program}/native/{f}", 'rb').read()
        hsh = hashlib.sha512(content).hexdigest()
        r.add(hsh)
    return len(r)


def get_function_name(program, variant):
    c = open(f"programs7/{program}/wat/{variant}.bc.wat", 'r').read()

    for f in FUNCTION_NAME.findall(c):
        if f not in BLACK_LIST:
            return f
    return variant

def get_programs(folder):
    return [f for f in os.listdir(folder) if f not in [] and not os.path.isfile(f"{folder}/{f}")]

def get_eq_pairs(folder, program):
    r = dict(
        pair = [],
        raw_diff = [],
        diff = []
    )

    def process_diff(out):
        
        result  = []
        lines = out.split("\n")

        for line in lines:
            try:
                left, right = line.split("|\t")
                result.append([left.strip(), right.strip()])
            except:
                try:
                    left, right = line.split(">\t")
                    result.append([left.strip(), right.strip()])
                except:
                    try:
                        left, right = line.split("<\t")
                        result.append([left.strip(), right.strip()])
                    except:
                        result.append([line, ""])

        return result
    for f in os.listdir(f"{folder}/{program}/wasm"):

        pair = []
        files = []
        for w in os.listdir(f"{folder}/{program}/wasm/{f}"):
            if w.endswith(".wat"):

                content = open(f"{folder}/{program}/wasm/{f}/{w}", 'r').read()
                pair.append(
                    content
                )
                files.append(f"{folder}/{program}/wasm/{f}/{w}")
        assert len(pair) == 2
        r['pair'].append(pair)
        #r['files'] = files
        out = ''
        try:
            p = subprocess.Popen([
            'diff',
            '-y',
            '--text',
            #'--suppress-common-lines',
            files[0],
            files[1]
            ], stdout=subprocess.PIPE)

            out, err = p.communicate()
        except:
            pass
        
        r['raw_diff'].append(out.decode())
        r['diff'].append(process_diff(out.decode()))


    return r


if __name__ == "__main__":


    #print(get_function_name("sodium8_auth_hmacsha256_81", "sodium8_auth_hmacsha256_81"))
    #exit(1)
    programlist = get_programs(sys.argv[1])

    ids = []
    with Pool(30) as p:
        ids = p.map(process, programlist)

    # print latex

    #ray.wait(ids)
    print(len(ids))

    #table = [r for r in ray.get(ids)]
    table = sorted(ids, key = lambda x: x[0], reverse=True)

    print("Module & Function & Unique Wasm & Compared pairs & Metric 1")
    sums = [0, 0, 0, 0]
    lastname = ""

    groups = {}
    OVERALL = {}
    
    OVERALL['unique_bc_count'] = 0
    OVERALL['unique_wasm_count'] = 0
    OVERALL['compared_pairs'] = 0
    OVERALL['reversed_pairs'] = 0
    OVERALL['nonreversed_pairs'] = 0
    OVERALL['unique_native_count'] = 0

    for r in table:

        u = get_unique(r[0])
        ubc = get_unique_bc(r[0])
        un = get_unique_native(r[0])


        if u > 0 and MODULE_NAME.match(r[0]) and r[3][-1] > -1:


            module_name = MODULE_NAME.match(r[0]).group(1)
            module_name = module_name.replace("sodium8_", "")
            if PRINT_TABLE:
                module_name = module_name.replace('_', '\_').replace("$", "\$")

            if module_name not in groups:
                groups[module_name] = dict(
                    functions = []
                )
            
            
            sanitized = get_function_name(r[0], r[0])

            if PRINT_TABLE:
                sanitized = sanitized.replace('_', '\_').replace("$", "")


            print(sanitized, r[1])
            if ubc < u: # hard hacking, this will prevent unsound graphs, If the WASM is different it comes from a different bitcode, this is for sure
                ubc = u # comparing ubc against u is just a sanity check


            OVERALL['unique_bc_count'] += ubc
            OVERALL['unique_wasm_count'] += u
            OVERALL['reversed_pairs'] += r[-1][0]
            OVERALL['nonreversed_pairs'] += r[-1][1]
            OVERALL['unique_native_count'] += un

            d = dict(
                    name=sanitized,
                    unique_wasm_count=u,
                    unique_bc_count=ubc,
                    unique_native_count=un,
                    compared_pairs=u*(u - 1)/2,
                    reversed_pairs=r[-1][0],
                    nonreversed_pairs=r[-1][1],
                    eq_pairs =[ ],
                    chunk=r[1]

                )

            OVERALL['compared_pairs'] += r[-1][0] + r[-1][1]
            if INCLUDE_EQ_PAIRS:
                d['eq_pairs'] = get_eq_pairs(sys.argv[1], r[1])
            groups[module_name]['functions'].append(d)
                #[, u, t, p, r[2][1], ubc]) # last parameter is non-reversed
        else:
            pass
    
    if PRINT_TABLE:
        rows = [[module, data['functions']] for module, data in groups.items()]
        # Sort functions
        for r in rows:
            r[1] = sorted(r[1], key=lambda x: x[1], reverse=True)

        # Sort modules
        rows = sorted(rows, key = lambda x: sum([ f[1] for f in x[1] ]), reverse=True)

        for module_name, functions in rows:
            print(f"{module_name} & & & & \\\\")
            for fname, unique, total, percent, maintained in functions:
                print(f" & {fname} & {unique} & {total} & {percent*100:.2f} \\%\\\\")
            
            print("\\hline")

        total_maintained = sum([sum([f[-1] for f in r[1]]) for r in rows])
        total = sum([sum([f[2] for f in r[1]]) for r in rows])

        if total > 0:
            print(f" &  & & {total} & {(total_maintained/total)*100:.2f} \\%\\\\")

    OVERALL['modules_count'] = len(groups)
    OVERALL['functions_count'] = 0

    for module, functions in groups.items():
        OVERALL_BC_COUNT = 0
        OVERALL_WASM_COUNT = 0
        OVERALL_NATIVE_COUNT = 0
        OVERALL_COMPARED_PAIRS = 0
        OVERALL_REVERSED = 0
        OVERALL_NONREVERSED = 0
        FUNCTIONS_COUNT = 0

        for _, functions in functions.items():
            for function in functions:
                #print(function)
                OVERALL_BC_COUNT += function['unique_bc_count']
                OVERALL_WASM_COUNT += function['unique_wasm_count']
                OVERALL_COMPARED_PAIRS += function['compared_pairs']
                OVERALL_REVERSED += function['reversed_pairs']
                OVERALL_NONREVERSED += function['nonreversed_pairs']
                OVERALL_NATIVE_COUNT += function['unique_native_count']
                
            FUNCTIONS_COUNT = len(functions)
            OVERALL['functions_count'] += len(functions)

        groups[module]['unique_bc_count'] = OVERALL_BC_COUNT
        groups[module]['unique_wasm_count'] = OVERALL_WASM_COUNT
        groups[module]['compared_pairs'] = OVERALL_COMPARED_PAIRS
        groups[module]['reversed_pairs'] = OVERALL_REVERSED
        groups[module]['nonreversed_pairs'] = OVERALL_NONREVERSED
        groups[module]['functions_count'] = FUNCTIONS_COUNT
        groups[module]['unique_native_count'] = OVERALL_NATIVE_COUNT

    
    OVERALL['modules'] = groups
    # Group stats as overall
    # Group stats by module
    # Group stats by function
    
    # Save report in a json file
    open("results.rq1.stability.wasmtime.json", 'w').write(
        json.dumps(OVERALL, indent=4)
    )
    