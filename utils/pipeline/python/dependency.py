from logger import LOGGER

class DependencyAnalyzer(object):
    

    # generate a dependency graph using LLVM IR basic block representation
    #%label ... %label1 %label2

    def parse(self, text):

        self.nodes = { }
        self.labels = []
        # sanitize text

        label = ''
        comment = False
        new_label = False
        breaks = [',', ' ', '\t', '\n', '\r', ")", "}", ";"]
        line = 0

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
                    if label not in self.nodes.keys():
                        self.nodes[label] = { "appear_in": index, "dependeers": [] }
                        self.labels.append(label)
                    else:
                        self.nodes[label]["dependeers"].append(index)
            
                label = ''
                new_label = False

                if c == '\n':
                    new_label = True
            if c == ':':
                # bblock label
                print(label)
                if label.rstrip().lstrip():
                    label = "%"+label
                    if label not in self.nodes.keys():
                        self.nodes[label] = { "appear_in": index, "dependeers": [] }
                        self.labels.append(label)
                    else:
                        self.nodes[label]["dependeers"].append(self.nodes[label]["appear_in"])
                        self.nodes[label]["appear_in"] = index
            
                label = ''
                new_label = False

            if new_label and c not in breaks:
                label += c

        for  label in self.nodes.keys():
            LOGGER.info([label, self.nodes[label]])

