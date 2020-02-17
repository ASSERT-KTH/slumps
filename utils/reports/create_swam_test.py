import os

for f in os.listdir("/Users/javierca/Documents/Develop/swam/slumps/test/resources/slumps"):
    print('test("slumps/test/resources/slumps/%s") {run("main")}'%f)
