from crow.events import BC2Candidates_MESSAGE, BC_EXPLORATION_QUEUE, STORE_MESSAGE, GENERATE_VARIANT_MESSAGE, \
    EXPLORATION_RESULT, GENERATED_WASM_VARIANT, WASMTIME_QUEUE, NATIVE_WASMTIME_GENERATED, OBJDUMP_QUEUE, \
    MACHINE_CODE_DUMPED, GENERATED_WAT_FILE, DIFF_QUEUE, GENERATED_BC_VARIANT
from crow.events.event_manager import Subscriber, subscriber_function, Publisher,Listener, listener, function_discrimator
from crow.sanitizer import Sanitizer
from crow.settings import config
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED
from crow.commands.stages import BCCountCandidates, TimeoutException, WASM2OBJ, OBJ2DUMP, TextDIFF
from crow.socket_server import listen

from crow.utils import ContentToTmpFile, getIteratorByName, printProgressBar
import threading, queue
import hashlib
import json
import redis
from concurrent.futures import ThreadPoolExecutor, wait, ALL_COMPLETED

import sys
import traceback
from crow.monitor.monitor import log_system_exception
import time
import operator

from functools import reduce
from crow.monitor.logger import LOGGER

publisher = Publisher()

def sanitize(content):

    result = []

    for line in content.split("\n")[3:]:# Remove first two lines that contains the file name
        result.append(line)


    return "\n".join(result)


class DiffDict(object):

    def __init__(self):
        self.d = { }
        self.names_llvm = []
        self.names_wasms = []
        self.names_native = []

    def set_cmp(self,program_name, k1, k2, rep, val):

        if program_name not in self.d:
            self.d[program_name] = {}

        if k1 not in self.d[program_name]:
            self.d[program_name][k1] = {}

        if k2 not in self.d[program_name][k1]:
            self.d[program_name][k1][k2] = {}

        self.d[program_name][k1][k2][rep] = val

@listener
class UnixDiffComparer(Listener):

    def __init__(self, cb = None):
        self.texts = { }
        self.wat_texts = { }
        self.diffs = DiffDict()
        self.cb = cb
    def print_stats(self):

        for program_name in self.diffs.d.keys():
            #print(f"{program_name}")
            total_pairs = 0
            diff_llvm_pairs = 0
            diff_wasm_pairs = 0
            diff_native_pairs = 0

            for i, t in enumerate(self.diffs.names_llvm):
                _, name1, _ = t
                for j in range(i + 1, len(self.diffs.names_llvm)):
                    _, name2, _ = self.diffs.names_llvm[j]

                    if name2 in self.diffs.d[program_name][name1]:
                        reps = self.diffs.d[program_name][name1][name2]
                        isLLVMDiff = False
                        isWasmDiff = False
                        if name1 != name2:
                            if "bc" in reps:
                                total_pairs += 1
                                if reps["bc"] == 0:
                                    # Report two variants that are equal under LLVM rep
                                    print(f"Same LLVM pair {name1} {name2}")
                                else:
                                    diff_llvm_pairs += 1
                                    isLLVMDiff = True

                            if "wasm" in reps:
                                if reps["wasm"] == 0:
                                    if isLLVMDiff:
                                        # The LLVM represenattions are different but not under WASM
                                        # LLVM1 != LLVM2 => W1 != W2
                                        print(f"Same WASM pair {name1} {name2}")
                                else:
                                    diff_wasm_pairs += 1
                                    isWasmDiff = True

                            if "x86" in reps:
                                if reps["x86"] == 0:
                                    if isWasmDiff:
                                        print(f"Same x86 pair {name1} {name2}")
                                else:
                                    diff_native_pairs += 1

            print(f"{program_name} {len(self.diffs.names_llvm)} {total_pairs}")
            if total_pairs != 0 and not self.cb:
                print(f"{program_name} Pairs: {total_pairs} LLVM {diff_llvm_pairs} WASM {diff_wasm_pairs} NATIVE {diff_native_pairs}")

            if self.cb and total_pairs != 0:
                self.cb(program_name, total_pairs, diff_llvm_pairs, diff_wasm_pairs, diff_native_pairs)
            #printProgressBar(0, 1, suffix=f"{program_name} Pairs: {total_pairs} LLVM {diff_llvm_pairs} WASM {diff_wasm_pairs} NATIVE {diff_native_pairs}")

    @log_system_exception()
    def compare(self, t1, t2, program_name, name1, name2, path, cb =None):

        #print(f"Comparing {program_name} {name1} {name2}")
        print("Comparing")
        try:
            with ContentToTmpFile(content=t1, LOG_LEVEL=2) as C1:
                tmpIn = C1.file

                with ContentToTmpFile(content=t2, LOG_LEVEL=2) as C2:
                    tmp2 = C2.file

                    diffTool = TextDIFF(program_name, True)
                    out = diffTool(args=[tmpIn, tmp2])

                    publisher.publish(message=dict(
                        event_type=STORE_MESSAGE,
                        stream=out,
                        program_name=f"{program_name}",
                        file_name=f"{name1}-{name2}.diff.txt",
                        path=path
                    ), routing_key="")

                    if not out.decode():
                        # WARNING, two variants that are different
                        print(f"Variants {name1} {name2} are equal")
                        LOGGER.warning(program_name, f"Variants {name1} {name2} are equal")
                        return 0
        except Exception as e:
            print(f"{e} {traceback.format_exc()}")
            raise e

        return 1 # diff unix tool, TODO

    @function_discrimator(event_type=MACHINE_CODE_DUMPED)
    def on_receive(self, data):

        newContent = data["stream"]
        file1 = data["file_name"]
        program_name = data["program_name"]
        variant_name = data["variant_name"]

        newhsh = hashlib.sha256(newContent).hexdigest()

        for hsh, name, _ in self.diffs.names_native:
            if hsh != newhsh:
                # REPORT diff and emit new WSM comparison for these two
                self.diffs.set_cmp(program_name, variant_name, name, "x86", 1)
                # [program_name][variant_name][name]["bc"] = 1 # mark if they are diff
            else:
                self.diffs.set_cmp(program_name, variant_name, name, "x86", 0)
        self.diffs.names_native.append((newhsh, variant_name, file1))
        self.print_stats()

    @function_discrimator(event_type=GENERATED_WASM_VARIANT)
    def on_receive_wasm(self, data):

        newContent = data["stream"]
        file1 = data["file_name"]
        program_name = data["program_name"]
        variant_name = data["variant_name"]

        newhsh = hashlib.sha256(newContent).hexdigest()

        for hsh, name, _ in self.diffs.names_wasms:
            if hsh != newhsh:
                # REPORT diff and emit new WSM comparison for these two
                self.diffs.set_cmp(program_name, variant_name, name, "wasm", 1)
                #[program_name][variant_name][name]["bc"] = 1 # mark if they are diff
            else:
                self.diffs.set_cmp(program_name, variant_name, name, "wasm", 0)

        self.diffs.names_wasms.append((newhsh, variant_name, file1))
        self.print_stats()

    @function_discrimator(event_type=GENERATED_BC_VARIANT)
    @log_system_exception()
    def on_receive_bc(self, data):

        #print("Saving variant")

        newContent = data["bc"]
        file1 = data["file_name"]
        program_name = data["program_name"]
        variant_name = data["variant_name"]

        newhsh = hashlib.sha256(newContent).hexdigest()

        for hsh, name, _ in self.diffs.names_llvm:
            if hsh != newhsh:
                # REPORT diff and emit new WSM comparison for these two
                self.diffs.set_cmp(program_name, variant_name, name, "bc", 1)
                self.diffs.set_cmp(program_name, name, variant_name, "bc", 1)
                #[program_name][variant_name][name]["bc"] = 1 # mark if they are diff
            else:
                self.diffs.set_cmp(program_name, variant_name, name, "bc", 0)
                self.diffs.set_cmp(program_name, name, variant_name, "bc", 0)

        self.diffs.names_llvm.append((newhsh, variant_name, file1))
        self.print_stats()

if __name__ == "__main__":

    l = UnixDiffComparer()

    if len(sys.argv) == 1:
        subscriber = Subscriber(1, DIFF_QUEUE, config["event"].getint("port"), l)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        program_name = program_name.split("/")[-1].split(".")[0]
        d = dict(
            stream = open(sys.argv[2], 'rb').read(),
            file_name = program_name,
            program_name = program_name
        )

        l.on_receive(d)