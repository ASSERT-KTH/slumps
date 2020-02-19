from plot import plot
import json
import matplotlib.pyplot as plt

meta = json.loads("""{"distanceMap":{"0":{"1":0.8309859154929577}},"functionMap":{"0":{"1":12.0}},"fileMap":{"0":"[14]Sorting_algorithms-Gnome_sort[1_2].wasm.instructions.strac.log","1":"Sorting_algorithms-Gnome_sort.wasm.instructions.strac.log"},"results":[0.8309859154929577],"method":{"name":"FastDTW","params":[3000.0]}}""")
plot(meta, "test", "test", "out")
plt.show()