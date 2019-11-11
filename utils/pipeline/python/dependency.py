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

        PATTERN = re.compile('(%(?P<reference>\w+)( )*(?P<assign>=?))|(\n(?P<block>\w+):)(?P<endl>\n+)')
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
                        nodes[label]["position"] = i.span()
                        continue
                    
                    IS_BLOCK = True
                
                if "assign" in groupdict.keys() and groupdict["assign"]:
                    ASSIGN = label
                
                if label not in nodes.keys():
                    
                    labels.append(label)
                    nodes[label] = dict(label=label, position=i.span(), references=[], isBlock=IS_BLOCK, depends_on=[])
                else:
                    nodes[label]["references"].append(i.span())
                
                nodes[label]["isBlock"] = IS_BLOCK

                if ASSIGN != label and ASSIGN is not None and groupdict["endl"] is None:
                    if not nodes[label]["isBlock"]: # Not a dependency, jump instead
                        nodes[ASSIGN]["depends_on"].append([label, i.span()])



                    
        return nodes, labels
