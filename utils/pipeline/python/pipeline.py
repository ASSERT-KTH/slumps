import argparse
import os
import sys
import re
from nodes import TextBlock, ModuleNode, CandidateNode, SolutionNode
from stages import CandidatesToSouperParts, CToLLStage, LLToBC, LLToMem2RegLL, BCToSouper, LLVMCompile, LLVMTOWasm, ObjtoWASM, WASM2WAT
from utils import bcolors, DEBUG_FILE, flatten, OUT_FOLDER
from logger import LOGGER
import shutil
from dependency import DependencyAnalyzer
import hashlib
import json

import collections


class Pipeline(object):
    def process(self, file):
        
        # checking output directory

        if os.path.exists(OUT_FOLDER):
            LOGGER.warning("Removing out folder content...%s"%(OUT_FOLDER, ))
            shutil.rmtree(OUT_FOLDER)

        os.mkdir(OUT_FOLDER)

        ctoll = CToLLStage()
        ll1 = ctoll(file)

        lltoll = LLToMem2RegLL()
        ll2 = lltoll(std=ll1)

        self.generateOriginalWASM(ll2, OUT_FOLDER, file)

        # Saving the ll file
        self.original_llvm = ll2.decode("utf-8")

        lltobc = LLToBC()
        bc = lltobc(std=ll2)

        LOGGER.success("Initial BC size %s bytes"%(len(bc), ))

        bctocand = BCToSouper()
        cand = bctocand(std=bc)
        # Infer candidates one by one

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
            candidateNodes[i].addChild(SolutionNode(solution, candidateNodes[i].entry_llvm))


        #for k in nodes.keys():
        #    for k1 in nodes[k]["depends_on"]:
        #        print('%s -> %s;'%(k.replace("%", "_").replace(".", "_"), k1[0].replace("%", "_").replace(".", "_")))

        self.generateSuperLL(OUT_FOLDER, candidateNodes, file)
        #self.generetaAllCandidates(OUT_FOLDER, candidateNodes, file)

        #print(len(sols.split("\n\n")))

        # Map solutions to original optimization candidate

        # Generate LLVM IR for solution

        # Generate Overall LLVM IR output

    def generateOriginalWASM(self, ll, OUT_FOLDER, file):
        llFileName = "%s/%s.all.ll"%(OUT_FOLDER, file.split("/")[-1])

        finalObjCreator = LLVMTOWasm()
        finalobj = finalObjCreator(std=ll)

        open("%s.orig.obj"%(llFileName, ), 'wb').write(finalobj)

        toWASM = ObjtoWASM()
        toWASM(std=None, args=[
            "%s.orig.obj"%(llFileName, ),
            "%s.orig.wasm"%(llFileName, )
        ])

        wat = WASM2WAT()
        wat(std=None, args=[
            "%s.orig.wasm"%(llFileName, ),
            "%s.orig.wat"%(llFileName, )]
        )


        LOGGER.warning("WASM SIZE %s"%(len(open("%s.orig.wasm"%(llFileName,), 'rb').read()), ))

    def generateSuperLL(self,OUT_FOLDER, candidateNodes, file):
        llFileName = "%s/%s.all.ll"%(OUT_FOLDER, file.split("/")[-1])
        OUT_FILE_IR = open(llFileName, 'wb')
            

        for i, cand in enumerate(candidateNodes):

            OUT_FILE_IR.write(("\n; Replacing %s -> %s\n"%(cand.entry_llvm, cand.children[-1].return_instruction)).encode("utf-8"))

            cand.toggleTranslation()
            
        self.root.infixVisit(OUT_FILE_IR)

            # cand.toggleTranslation()

        #print(json.dumps(self.root))

        OUT_FILE_IR.close()

        finalObjCreator = LLVMTOWasm()
        finalobj = finalObjCreator(std=open(llFileName, 'rb').read())

        open("%s.obj"%(llFileName, ), 'wb').write(finalobj)

        toWASM = ObjtoWASM()
        toWASM(std=None, args=[
            "%s.obj"%(llFileName, ),
            "%s.wasm"%(llFileName, )
        ])

        wat = WASM2WAT()
        wat(std=None, args=[
            "%s.wasm"%(llFileName,),
            "%s.wat"%(llFileName,)]
        )

        finalWASM = open("%s.wasm"%(llFileName,), 'rb').read()

        LOGGER.warning("WASM SIZE %s SHA %s"%(len(finalWASM), hashlib.sha256(finalWASM).hexdigest()))

    def generetaAllCandidates(self,OUT_FOLDER, candidateNodes, file):
            

        for i, cand in enumerate(candidateNodes):
            llFileName = "%s/%s.%s.ll"%(OUT_FOLDER, file.split("/")[-1], i)
            OUT_FILE_IR = open(llFileName, 'wb')
        
            OUT_FILE_IR.write(("\n; Replacing %s -> %s\n"%(cand.entry_llvm, cand.children[-1].return_instruction)).encode("utf-8"))

            cand.toggleTranslation()
            
            self.root.infixVisit(OUT_FILE_IR)

            cand.toggleTranslation()

        #print(json.dumps(self.root))

            OUT_FILE_IR.close()

            # Write bc

            finalObjCreator = LLVMTOWasm()
            finalobj = finalObjCreator(std=open(llFileName, 'rb').read())

            open("%s.%s.obj"%(llFileName, i), 'wb').write(finalobj)

            toWASM = ObjtoWASM()
            toWASM(std=None, args=[
                "%s.%s.obj"%(llFileName, i),
                "%s.%s.wasm"%(llFileName, i)
            ])

            wat = WASM2WAT()
            wat(std=None, args=[
                "%s.%s.wasm"%(llFileName, i),
                "%s.%s.wat"%(llFileName, i)]
            )

            finalWASM = open("%s.%s.wasm"%(llFileName, i), 'rb').read()

            LOGGER.warning("WASM SIZE %s SHA %s"%(len(finalWASM), hashlib.sha256(finalWASM).hexdigest()))


if __name__ == "__main__":
    
    pipeline = Pipeline()

    pipeline.process(sys.argv[1])

