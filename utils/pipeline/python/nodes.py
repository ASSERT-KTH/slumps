class Node(object):

    def __init__(self):
        self.children = []
        self.is_leaf = True
        self.value = ''
    
    def infixVisit(self, Out):

        for ch in self.children:
            ch.infixVisit(Out)

class CandidateNode(object):
    pass

class ModuleNode(Node):
    pass

class TextBlock(Node):
    
    def __init__(self, text):
        self.value = text

    def split(self, fr, to, newNode):

        left  = TextBlock(self.value[:fr])
        right = TextBlock(self.value[to:])

        return [left, newNode, right]

    def infixVisit(self, Out):
        Out.write(self.value.encode("utf-8"))
