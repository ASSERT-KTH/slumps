import os
import sys
import json
import shutil



baseString = '''{
	"files": [
	],
	"pairs": [] ,
	"method": {
	  "name": "PureDTW",
	  "params": []
	},
	"outputAlignment": false,
	"exportImage": false,
	"outputAlignmentMap": true,
	"distanceFunctionName": "dBin",
	"separator": "[\\r\\n]",
	"threadPoolCount": 20,
	"comparison": {
	  "eq": 0,
	  "diff":5,
	  "gap": 1
	}
  
  }'''

# split in CWD

if __name__ == "__main__":
	

	filesMem = [ m for m in os.listdir(".") if m.endswith(".mem")]
	filesStack = [ m for m in os.listdir(".") if m.endswith(".stack")]

	base = json.loads(baseString)
	base["files"] = filesMem
	base["outputAlignmentMap"] = "mem.json"
	open("payload.mem.json", 'w').write(json.dumps(base, indent = 4))

	base["files"] = filesStack
	base["outputAlignmentMap"] = "stack.json"
	open("payload.stack.json", 'w').write(json.dumps(base, indent = 4))

	bashFile = open("run.sh", "w")

	bashFile.write("/Users/javierca/Documents/IdeaProjects/STRAC/panama/dev/build/macosx-x86_64-server-release/jdk/bin/java -Xmx6g  -jar /Users/javierca/Documents/IdeaProjects/STRAC/STRACAlign/target/STRAC-align-0.1.jar payload.mem.json & \n")
	bashFile.write("/Users/javierca/Documents/IdeaProjects/STRAC/panama/dev/build/macosx-x86_64-server-release/jdk/bin/java -Xmx6g -jar /Users/javierca/Documents/IdeaProjects/STRAC/STRACAlign/target/STRAC-align-0.1.jar payload.stack.json & \n")
	bashFile.write("wait\n")

	bashFile.close()

	shutil.copy(f"{os.path.dirname(__file__)}/log4j.properties", "./log4j.properties")