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

        PATTERN = re.compile('(%(?P<reference>\w+)( )*(?P<assign>=?))|(\n(?P<block>\w+):)')
        ASSIGN = None

        for i in PATTERN.finditer(text):

            if i:
                groupdict = i.groupdict()

                print(groupdict)
                
                if "reference" in groupdict.keys() and i.group("reference"): # label variable reference
                    label = "%"+i.group("reference")

                if "block" in groupdict.keys() and i.group("block"): # block label reference
                    label = "%"+i.group("block")

                    if label in nodes.keys():
                        nodes[label]["references"].append(nodes[label]["position"])
                        nodes[label]["position"] = i.span()
                        nodes[label]["isBlock"] = True
                        continue
                if label not in nodes.keys():
                    labels.append(label)
                    nodes[label] = dict(label=label, position=i.span(), references=[], isBlock=False, depends_on=[])

                    if "assign" in groupdict.keys():
                        ASSIGN = label

                else:
                    nodes[label]["references"].append(i.span())
                    nodes[ASSIGN]["depends_on"].append([label, i.span()])
                    
        return nodes, labels
