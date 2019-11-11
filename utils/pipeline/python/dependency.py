from logger import LOGGER

class DependencyAnalyzer(object):
    

    # generate a dependency graph using LLVM IR basic block representation
    #%label ... %label1 %label2

    @staticmethod
    def parse(text):

        nodes = { }
        labels = []
        # sanitize text

        label = ''
        comment = False
        new_label = False
        breaks = [',', ' ', '\t', '\n', '\r', ")", "}", ";"]
        avoid = [' ', ',']
        line = 1

        for index, c in enumerate(text):
            if c == ';': # start comment
                comment = True
            if c == '\n' and comment:
                comment = False
                line += 1

            if c == '%': # start label
                new_label = True
            
                
            if c in breaks and new_label:
                if label.rstrip().lstrip():
                    if label not in nodes.keys():
                        nodes[label] = { "appear_in": index, "dependeers": [], "line": line }
                        labels.append(label)
                    else:
                        nodes[label]["dependeers"].append(index)
            
                label = ''
                new_label = False

                if c == '\n':
                    new_label = True
                continue
            if c == ':':
                # bblock label
                print(label)
                if label.rstrip().lstrip():
                    label = "%"+label
                    if label not in nodes.keys():
                        nodes[label] = { "appear_in": index, "dependeers": [], "line": line }
                        labels.append(label)
                    else:
                        nodes[label]["dependeers"].append(nodes[label]["appear_in"])
                        nodes[label]["appear_in"] = index
                        nodes[label]["line"] = line
            
                label = ''
                new_label = False

            if new_label and c not in breaks:
                label += c


        return nodes, labels
