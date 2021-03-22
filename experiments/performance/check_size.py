import pymongo

import base64

#message = "Python is fun"
#message_bytes = message.encode('ascii')
#base64_bytes = base64.b64encode(message_bytes)
#base64_message = base64_bytes.decode('ascii')
myclient = pymongo.MongoClient("mongodb://localhost:27017/")

dblist = myclient.list_database_names()

if "crow3" in dblist:
    print("The database exists.")

mydb = myclient["crow3"]

collist = mydb.list_collection_names()

variants = mydb["variants"]
wasms = mydb["wasms"]

cursor = variants.find({})

PLOT_DISTRIBUTION=False

import matplotlib.pyplot as plt


overall = []
stats = []

for v in cursor:

    baseline = "%s.wasm"%(v["name"],)
    versions = []
    sizes = []
    for binary in v["variants"]:
        if "[" not in binary and "~" not in binary:
            #baseline = binary
            #print("Baseline", baseline)
            pass
        else:
            versions.append(binary)

        file_row = wasms.find_one({'_id': binary})

        if file_row:
            decoded_data = base64.decodebytes(file_row["binary"].encode())

            sizes.append(len(decoded_data))


    original_data = wasms.find_one({'name': baseline})
    original_size = None
    if original_data:
        decoded_original_data = base64.decodebytes(original_data["binary"].encode())
        original_size = len(decoded_original_data)
        #print("GOTCHA!")
    else:
        pass
        #original_s = sizes[0]
        #print(f"Original file not found {baseline}")

    if original_size is None:
        continue

    relation=[s/original_size for s in sizes]

    print(baseline, min(relation), max(relation), len(sizes))
    stats.append([baseline, min(relation), max(relation), len(sizes)])
    overall.append(sizes)

print(min([s[1] for s in stats]), max([s[2] for s in stats]))


if PLOT_DISTRIBUTION:
    plt.violinplot(overall)
    plt.show()
   # print(baseline, v["name"], len(versions), versions)