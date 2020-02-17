import os

for f in os.listdir("../../benchmark_programs/variants"):
    print("# %s"%f)
    print("java -jar out.jar %s . "%os.path.abspath("../../benchmark_programs/variants/%s/%s.wasm"%(f, f)))
    print("")