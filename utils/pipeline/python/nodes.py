from stages import SouperToLLVM
from utils import bcolors
from logger import LOGGER
import re

from dependency import DependencyAnalyzer

class Node(object):

    def __init__(self):
        self.children = []
        self.is_leaf = True
        self.value = ''
    
    def infixVisit(self, Out):

        for ch in self.children:
            ch.infixVisit(Out)

    def addChild(self, node):
        if not self.children:
            self.children = []

        node.parent = self
        self.children.append(node)

class CandidateNode(Node):
    
    def __init__(self, text, entry_llvm):
        super(CandidateNode, self).__init__()
        self.value = text
        self.entry_llvm = entry_llvm
        self.translate = False

    def toggleTranslation(self):
        self.translate = not self.translate

    def infixVisit(self, Out):

        if self.translate:
            Out.write(("[CANDIDATE %s"%(self.entry_llvm,)).encode('utf-8'))

            if self.children:
                self.children[0].infixVisit(Out) # Only one child... for now
            Out.write(b"]")
        else:
            Out.write(self.entry_llvm.encode("utf-8"))


class SolutionNode(Node):
    
    def __init__(self, text, original_llvm):
        self.value = text
        self.original_llvm = original_llvm

        self.parse()

    def infixVisit(self, Out):
        Out.write((" -> " + self.return_instruction).encode("utf-8"))

    def parseLLVMFunctionBlock(self):

        # Sanitize
        self.LLVM_IR = self.LLVM_IR.lstrip().rstrip()
        self.LLVM_IR = self.LLVM_IR.replace("\n\n", "\n")

        # Separate in by line instructions
        instructions = self.LLVM_IR.split("\n")

        # Sanitize instructions, removing unneeded instructions
        final = []
        retInstruction =  'None'
        for inst in instructions:
            inst = inst.rstrip().lstrip()
            if inst.startswith(";"): # comment
                continue
            if inst.startswith("source_filename"): # module name
                continue
            if inst.startswith("define"): # function declaration
                continue
            if inst.startswith("}"): # function declaration closings
                continue
            if re.compile('(.)+:').search(inst): # basic block start
                continue
            if inst.startswith("ret"): # return instruction
                inst = inst.replace("ret", "").rstrip().lstrip()
                retInstruction = inst

            final.append(inst)

        self.instructions = final[:-1]
        self.return_instruction = retInstruction

        parser = DependencyAnalyzer()

        LOGGER.info("Entrypoint instruction: %s"%(self.original_llvm,))
        nodes, labels = parser.parse(self.original_llvm)
        
        LOGGER.info(labels)
        for  label in nodes.keys():
            LOGGER.info([label, nodes[label]])

        LOGGER.enter()
        LOGGER.info("%s %s ret %s"%("Replacement instructions...", final[:-1], retInstruction))
        LOGGER.exit()

    def parse(self):
        # Find solution instruction
        instructions = self.value.split("\n")

        if not instructions[-1].startswith("result"):
            raise Exception("Result instruction not found")

        # Transform to LLVM IR

        self.LLVM_IR = SouperToLLVM()(std=instructions[-1].encode("utf-8"))

        LOGGER.enter()
        LOGGER.success("Getting entry function block...")
        

        self.LLVM_IR = self.LLVM_IR.decode("utf-8")

        LOGGER.enter()
        LOGGER.error(self.LLVM_IR)

        LOGGER.exit()
        LOGGER.exit()

        self.parseLLVMFunctionBlock()
        # Parse basic block and get ret instruction value


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
