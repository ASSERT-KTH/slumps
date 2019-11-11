from logger import LOGGER
import re

class DependencyAnalyzer(object):
    

    # generate a dependency graph using LLVM IR basic block representation
    #%label ... %label1 %label2

    @staticmethod
    def parse(text):

        nodes = { }
        labels = []
        # sanitize text

        PATTERN = re.compile('(%(\w+))|(\n(\w+):)')

        for i in PATTERN.finditer(text):

            if i:
                if i.group(1): # label variable reference
                    label = "%"+i.group(2)
                if i.group(3): # block label reference
                    label = "%"+i.group(4)

                    if label in nodes.keys():
                        nodes[label]["dependeers"].append(nodes[label]["position"])
                        nodes[label]["position"] = i.span()
                        continue
                if label not in nodes.keys():
                    labels.append(label)
                    nodes[label] = dict(label=label, position=i.span(), dependeers=[])
                else:
                    nodes[label]["dependeers"].append(i.span())

        

        return nodes, labels
