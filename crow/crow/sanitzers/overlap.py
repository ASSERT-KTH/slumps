import re


ASSIGN = '='
RESULT = 'result'
INFER = 'infer'
DOTS = ':'

ID = re.compile(r"%\w+")

class Node:
    varId = ""

    def __init__(self, id):
        self.varId = id
        self.deps = {}
        self.is_entry = False
        self.sentence = ""
        self.cc = -1
        self.parents = {}
        self.code = "NOT"


    def pr(self):
        if len(self.deps) == 0:
            return

        for n in self.deps.values():
            n.pr()

        if self.is_entry:
            print(f"->", end=" ")
        print(f"{self.varId} ({self.sentence})", end=" -> ")
        for n in self.deps.values():
            print(n.varId, end=" ")

        print()


class SouperParser(object):

    def __init__(self):
        pass

    def parse(self, code, nodes):


        lines = code.split("\n")
        lines = [l for l in lines if l] # Remove empty lines

        root = None

        for l in lines:
            try:
                if ASSIGN in l: # it is an assignment:
                    left, right = l.split(ASSIGN)

                    left = left.strip()
                    right = right.strip()

                    left, tpe = left.split(DOTS)
                    right_ids = []

                    for m in ID.finditer(right):
                        right_ids.append(m.group(0))

                    leftNode = Node(left)
                    for id in right_ids:
                        dep = nodes[id] if id in nodes else Node(id)
                        leftNode.deps[id] = dep
                        dep.parents[left] = leftNode

                    nodes[left] = leftNode
                    leftNode.sentence = right
                    continue
                if RESULT in l : # it is the result
                    id = l.split(RESULT)[-1].strip()
                    root = nodes[id]
                    root.is_entry = True
                    continue
                if INFER in l : # it is the result
                    id = l.split(INFER)[-1].strip()
                    root = nodes[id]
                    root.is_entry = True
                    continue

                print(f"WARNING Unknonw line {l}")
            except Exception as e:
                print(f"{e} {l}")
        #root.pr()
        root.code = code
        return root, nodes

    def getCC(self, nodes):
        visited = { }

        cc = 0
        for n in nodes:
            if n.varId not in visited:
                self.DFSUtil(n, cc, visited)
                cc += 1
        return cc, visited

    def DFSUtil(self, root, cc, visited: dict):

        visited[root.varId] = cc
        root.cc = cc

        parent = list(root.parents.values()) if len(root.parents) > 0 else []
        for n in list(root.deps.values()) + parent:
            if n.varId not in visited:
                self.DFSUtil(n, cc, visited)
    def set_cc(self, graph_pieces):
        nodes = {}
        entries = [self.parse(d, nodes)[0] for d in graph_pieces]
        cc, assignent = self.getCC(list(nodes.values()))

        return entries, nodes, assignent

    def is_there_overlap(self, graph_pieces):
        nodes = { }
        entries = [ self.parse(d, nodes)[0] for d  in  graph_pieces]
        cc, assignent = self.getCC(list(nodes.values()))

        #nEntries = [assignent[n.varId] for n in entries]
        ids  = [n.varId for n in entries]

        return cc != len(set(ids))

if __name__ == '__main__':
    parser = SouperParser()

    s = parser.is_there_overlap([
        "%0:i32 = var\n%1:i32 = mulnsw 2:i32, %0\ninfer %1\n",
        "%0:i32 = var\n%1:i32 = mulnsw 2:i32, %0\n%2:i32 = addnsw %0, %1\ninfer %2\n",
        "%4:i32 = mulnsw 2:i32, %7\n%5:i32 = addnsw %4, %4\ninfer %5\n"
    ])
    #save = nodes

    #replacement1 , _ = parser.parse("%2:i32 = xor %0, %0\n%3:i32 = add %0, %2\n%4:i32 = add %0, %3\nresult %4\n", nodes)
    #print()
    #replacement2, _ = parser.parse("%0:i32 = var ; in_0_1\n%1:i32 = mul 3:i32, %0\nresult %1\n", save)

    #replacement2, _ = parser.parse("%3:i32 = mul 4294967256:i32, %0\n%4:i32 = add %0, %3\n%5:i32 = add %0, %4\n%6:i32 = add %0, %5\n%7:i32 = add %0, %6\n%8:i32 = add %0, %7\n%9:i32 = add %0, %8\n%10:i32 = add %0, %9\n%11:i32 = add %0, %10\n%12:i32 = add %0, %11\n%13:i32 = add %0, %12\n%14:i32 = add %0, %13\n%15:i32 = add %0, %14\n%16:i32 = add %0, %15\n%17:i32 = add %0, %16\n%18:i32 = add %0, %17\n%19:i32 = add %0, %18\n%20:i32 = add %0, %19\n%21:i32 = add %0, %20\n%22:i32 = add %0, %21\n%23:i32 = add %0, %22\n%24:i32 = add %0, %23\n%25:i32 = add %0, %24\n%26:i32 = add %0, %25\n%27:i32 = add %0, %26\n%28:i32 = add %0, %27\n%29:i32 = add %0, %28\n%30:i32 = add %0, %29\n%31:i32 = add %0, %30\n%32:i32 = add %0, %31\n%33:i32 = add %0, %32\n%34:i32 = add %0, %33\n%35:i32 = add %0, %34\n%36:i32 = add %0, %35\n%37:i32 = add %0, %36\n%38:i32 = add %0, %37\n%39:i32 = add %0, %38\n%40:i32 = add %0, %39\n%41:i32 = add %0, %40\n%42:i32 = add %0, %41\n%43:i32 = add %0, %42\n%44:i32 = add %0, %43\n%45:i32 = add %0, %44\n%46:i32 = add %0, %45\nresult %46\n", nodes)
    print(s)
    print

    #replacement2.pr()


    #replacement1 = parser.parse("%2:i32 = xor %0, %0\n%3:i32 = add %0, %2\n%4:i32 = add %0, %3\nresult %4\n", save)
    #print()
    #replacement2, _ = parser.parse("%0:i32 = var ; in_0_1\n%1:i32 = mul 3:i32, %0\nresult %1\n", save)

    #print()

    #replacement2.pr()
