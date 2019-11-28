from logger import LOGGER
import re

class DependencyAnalyzer(object):
    

    # generate a dependency graph using LLVM IR basic block representation
    #%label ... %label1 %label2

    @staticmethod
    def parse(text, candidates_to_replace):

        def isIn(chunk, candidates):
            return any(map(lambda x: chunk.startswith(x), candidates))

        nodes = { }
        labels = []
        # sanitize text

        PATTERN = re.compile(r'(%(?P<reference>(\w|\.)+)( )*(?P<assign>=?))')
        ASSIGN = None

        for i in PATTERN.finditer(text):
            IS_BLOCK = False

            if i:
                groupdict = i.groupdict()

                if "reference" in groupdict.keys() and i.group("reference"): # label variable reference
                    label = "%"+i.group("reference")

                if "block" in groupdict.keys() and i.group("block"): # block label reference
                    label = "%"+i.group("block")

                    if label in nodes.keys():
                        nodes[label]["references"].append(nodes[label]["position"])
                        nodes[label]["position"] = i.span()[0]
                        continue
                    
                    IS_BLOCK = True
                
                if "assign" in groupdict.keys() and groupdict["assign"]:
                    ASSIGN = label
                
                if label not in nodes.keys() and "assign" in groupdict.keys() and groupdict["assign"]:
                    
                    labels.append(label)
                    nodes[label] = dict(label=label, position=i.span()[0], references=[], isBlock=IS_BLOCK, depends_on=[])
                elif label in nodes:
                    nodes[label]["references"].append(i.span()[0])
                
                if label in nodes:
                    nodes[label]["isBlock"] = IS_BLOCK

                    if ASSIGN != label and ASSIGN is not None:
                        if not nodes[label]["isBlock"]: # Not a dependency, jump instead
                            print(i.span()[0], nodes[ASSIGN]["position"], label, ASSIGN)
                            nodes[ASSIGN]["depends_on"].append([label, i.span()[0]])




                    
        return nodes, labels
