# -*- coding: utf-8 -*-

from stages import SouperToLLVM
from utils import bcolors
from logger import LOGGER
import re

from dependency import DependencyAnalyzer
from io import StringIO

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
            if self.children:
                self.children[0].infixVisit(Out) # Only one child... for now
        else:
            Out.write(self.entry_llvm.encode("utf-8"))


class SolutionNode(Node):
    
    def __init__(self, text, original_llvm):
        self.value = text
        self.original_llvm = original_llvm

        self.parse()

    def infixVisit(self, Out):
        Out.write(self.ASSIGN.encode("utf-8"))

    def parseLLVMFunctionBlock(self):

        # Sanitize
        self.LLVM_IR = self.LLVM_IR.lstrip().rstrip()
        self.LLVM_IR = self.LLVM_IR.replace("\n\n", "\n")

        # Separate in by line instructions
        instructions = self.LLVM_IR.split("\n")

        # Sanitize instructions, removing unneeded instructions
        block = []
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
            
            block.append(inst)

        root = DependencyAnalyzer.Root()
        originalRoot =  DependencyAnalyzer.Root()

        block = DependencyAnalyzer.parse(block, root)
        
        original_instruction = DependencyAnalyzer.Instruction(self.original_llvm, originalRoot)

        if root.first_instruction.is_constant:
            self.ASSIGN = '%s = add %s, 0'%(original_instruction.inner.variable_name,
                " ".join(root.first_instruction.children)
             )
        else:
            out = StringIO()
            initial = root.first_instruction.dependencies[0]
            entry = original_instruction.inner.variable_name


            #root.first_instruction = DependencyAnalyzer.Declaration(original_instruction.inner.variable_name)
            if initial not in root.instructions:
                self.ASSIGN = self.original_llvm
                LOGGER.error("Undefined entry var...")
            else:
                root.first_instruction = root.instructions[initial]
                root.write(out)
                out = out.getvalue()

                out = out.replace(initial, "[SLUMPS]")
                out += "\n;%s\n"%(self.original_llvm, )
                print(out, initial)

                # out.write("\n;%s -> %s\n"%(initial, original_instruction.inner.variable_name))
                # out.write("\n;%s\n"%(self.original_llvm))

                out = root.transform(out, entry, "[SLUMPS]")

                print(out)
                self.ASSIGN = out

    def parse(self):
        # Find solution instruction
        instructions = self.value.split("\n")[:-1]
        

        # Transform to LLVM IR

        self.LLVM_IR = SouperToLLVM()(std=self.value.encode("utf-8"))

        LOGGER.enter()
        LOGGER.warning(self.LLVM_IR.decode("utf-8"))

        self.LLVM_IR = self.LLVM_IR.decode("utf-8")

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
