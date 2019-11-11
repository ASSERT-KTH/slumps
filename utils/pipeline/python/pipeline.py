import argparse
import os
import sys
import re
from nodes import TextBlock, ModuleNode, CandidateNode, SolutionNode
from stages import CandidatesToSouperParts, CToLLStage, LLToBC, LLToMem2RegLL, BCToSouper
from utils import bcolors, DEBUG_FILE, flatten
from logger import LOGGER

import json

import collections


class Pipeline(object):
    def process(self, file):
        
        ctoll = CToLLStage()
        ll1 = ctoll(file)

        lltoll = LLToMem2RegLL()
        ll2 = lltoll(std=ll1)

        # Saving the ll file
        self.original_llvm = ll2.decode("utf-8")

        lltobc = LLToBC()
        bc = lltobc(std=ll2)

        bctocand = BCToSouper()
        cand = bctocand(std=bc)

        #Saving candidate
        candidates = cand.decode("utf-8").split(";[CANDIDATE]\n")[:-1] # Avoid the last separator
        candidates = map(lambda x: x.lstrip().rstrip(), candidates) # Getting only unique candidates
        candidates = list(candidates)

        LOGGER.success("Found %s candidates"%(len(candidates),))
        ORIGIN__RE = re.compile(r";\[ORIGIN\] (.*)\n")

        rootNode = TextBlock(self.original_llvm)
        
        # Sort by appearing index in the original LLVM IR

        children = [rootNode]
        candidateNodes = []
        
        for cand_text in candidates:
            search = ORIGIN__RE.search(cand_text)
            original_llvm_ir = search.group(1).lstrip().rstrip()

            index = -1

            for i, node in enumerate(children):
                if type(node.value) == type(""):
                    index = node.value.find(original_llvm_ir)

                    if index != -1:
                        candidateNodes.append(CandidateNode(cand_text, original_llvm_ir))
                        left, middle, right = node.split(index, index + len(original_llvm_ir), candidateNodes[-1])
                        children[i] = [left, middle, right]
                        children = flatten(children)
                        break
                    

        self.root = ModuleNode()
        self.root.children = children


        # Detect origin entrypoints

        # Report if no candidates

        # map candidates to original code llvm ?

        candtosols = CandidatesToSouperParts()
        sols = candtosols(std=cand).decode("utf-8")

        solutions_candidates = sols.split("\n\n")[:-1] # Remove last blank space

        if len(solutions_candidates) != len(candidateNodes):
            LOGGER.success("Candidates and solutions sets are different, %s/%s"%(len(solutions_candidates),
             len(candidateNodes)))

        for i, solution in enumerate(solutions_candidates):
            candidateNodes[i].addChild(SolutionNode(solution))

        self.root.infixVisit(DEBUG_FILE)

        #print(len(sols.split("\n\n")))

        # Map solutions to original optimization candidate

        # Generate LLVM IR for solution

        # Generate Overall LLVM IR output


if __name__ == "__main__":
    
    pipeline = Pipeline()

    pipeline.process(sys.argv[1])

