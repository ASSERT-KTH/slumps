# -*- coding: utf-8 -*-

from logger import LOGGER
import re
import sys
from io import StringIO
from utils import globalCounter

class DependencyAnalyzer(object):
    

    # generate a dependency graph using LLVM IR basic block representation
    #%label ... %label1 %label2

    ASSIGN = r'='
    DECLARATION = r'%(\w)+(:\w+)?'
    _ID =  r'%(\w)+'
    _TYPE = r':\w+'
    INFER = r'infer'
    RESULT = r'result'
    RET = r'ret'

    class Root(object):

        def __init__(self):
            self.instructions = {}
            self.entry_point = None
            self.first_instruction = None

        def inner_write(self, instruction, out):
            
            for dep in instruction.dependencies:
                if dep in self.instructions:
                    self.inner_write(self.instructions[dep], out)

            out.write("%s\n"%(instruction.expression,))

        def write(self, out):
            self.inner_write(self.first_instruction, out)

        def transform(self, initial, final, entry_name):
            final = final.replace(initial, entry_name)

            for k in self.instructions.keys():
                final = final.replace(k, k.replace("%", "%%_%s"%(globalCounter(), )))

            return final

    class Declaration(object):
        
        def __init__(self, variable_name, children, typ):
            self.variable_name = variable_name
            self.children = children
            self.typ = typ
    
    class Instruction(object):
        def __init__(self, expression, root):

            self.expression = expression
            self.dependencies = []
            self.is_declaration = False
            self.inner = None

            self.tokens = list(filter( lambda x: x, re.split(r"[\r\t ]", self.expression)))

            index = 0

            if re.match(DependencyAnalyzer.DECLARATION, self.tokens[index]): # declaration
                dec = self.declaration(index, self.tokens, root)

                root.instructions[dec.variable_name] = self

                self.inner = dec

            if re.match(DependencyAnalyzer.INFER, self.tokens[index]): # infer
                self.infer(index, self.tokens, root)
            
            if re.match(DependencyAnalyzer.RESULT, self.tokens[index]) or re.match(DependencyAnalyzer.RET, self.tokens[index]): # infer
                print(self.tokens)
                self.children = self.result(index, self.tokens, root)
                root.first_instruction = self

                print(self.children)

        @property
        def is_constant(self):
            return len(self.dependencies) == 0

        def result(self, index, tokens, root):
            
            return self.wathever(index + 1, tokens, root)

        def infer(self, index, tokens, root):
            what = tokens[index+1]
            root.entry_point = what
                
        def declaration(self, index, tokens, root):
            
            name = re.match(DependencyAnalyzer._ID, tokens[index]).group(0)

            if re.search(DependencyAnalyzer._TYPE, tokens[index]):
                typ = re.search(DependencyAnalyzer._TYPE, tokens[index]).group(0)
            else:
                typ = 'unk'

            self.is_declaration = True

            dec = DependencyAnalyzer.Declaration(name, typ,
                self.wathever(index + 1, tokens, root)
             )
            
            return dec
            # register declaration

        def wathever(self, index, tokens, root):

            result = []
            while index < len(tokens):
                current = tokens[index]

                if re.match(DependencyAnalyzer._ID, tokens[index]): # reference
                    self.dependencies.append(re.match(DependencyAnalyzer._ID, tokens[index]).group(0))
                
                result.append(current)
                index += 1

            return result

        def __str__(self):
            return self.expression

    @staticmethod
    def merge(LHS, RHS):
        instructionsLHS = filter(lambda x: x, LHS.split("\n")[:-1])
        instructionsRHS = filter(lambda x: x, RHS.split("\n")[:-1])

        root = DependencyAnalyzer.Root()
        
        instructionsLHS = DependencyAnalyzer.parse(instructionsLHS, root)     
        instructionsRHS = DependencyAnalyzer.parse(instructionsRHS, root)

        result = StringIO()

        root.write(result)

        return result.getvalue()

    @staticmethod
    def parse(lines, root):

        return list(map(lambda x: DependencyAnalyzer.Instruction(expression = x,root=root), lines))