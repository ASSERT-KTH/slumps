import os
import shutil

for f in os.listdir("../../benchmark_programs/variants"):
    if f != ".DS_Store":
        shutil.copy(os.path.abspath("../../benchmark_programs/variants/%s/%s.wasm"%(f, f)), "/Users/javierca/Documents/Develop/swam/slumps/test/resources/slumps/%s.wasm"%f )
        print('test("slumps/test/resources/slumps/%s.wasm") {run("main")}'%f)
