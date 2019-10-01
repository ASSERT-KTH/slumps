# Copyright 2014 The Souper Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import copy
import fileinput

widths = dict()
pcmap, argmap = dict(), dict()
cand = None
needsResult = False
intrdecl = dict()
printedblocks = []
labels = ["entry"]
cnt1 = 0
cnt2 = 0
cnt3 = 0

# souper IR -> LLVM inst map
instmap = {
    "addnsw": "add nsw",
    "addnuw": "add nuw",
    "addnw": "add nsw nuw",
    "subnsw": "sub nsw",
    "subnuw": "sub nuw",
    "subnw": "sub nsw nuw",
    "mulnsw": "mul nsw",
    "mulnuw": "mul nuw",
    "mulnw": "mul nsw nuw",
    "udivexact": "udiv exact",
    "sdivexact": "sdiv exact",
    "shlnsw": "shl nsw",
    "shlnuw": "shl nuw",
    "shlnw": "shl nsw nuw",
    "lshrexact": "lshr exact",
    "ashrexact": "ashr exact",
    "eq": "icmp eq",
    "ne": "icmp ne",
    "ult": "icmp ult",
    "slt": "icmp slt",
    "ule": "icmp ule",
    "sle": "icmp sle",
}

# special inst handling
nestedinsts = ["add", "mul", "and", "or", "xor"]
boolinsts = ["eq", "ne", "ugt", "uge", "ult", "ule", "sgt", "sge", "slt", "sle"]
towidthinsts = ["sext", "trunc", "zext"]
intrinsts = ["bswap", "ctpop", "cttz", "ctlz", "fshl", "fshr",
             "sadd.sat", "uadd.sat", "ssub.sat", "usub.sat",
             "sadd.with.overflow", "uadd.with.overflow", "ssub.with.overflow",
             "usub.with.overflow", "smul.with.overflow", "umul.with.overflow"]
specialinsts = ["block", "pc", "cand", "infer", "result"]


def parseConst(c):
    assert ":" in c, f"wrong constant format {c}"
    tmp = c.split(':')
    constant = tmp[0]
    width = tmp[1]
    assert width[0] == "i", f"wrong type format {width}"
    return [constant, width]


def parseOps(ops):
    r = []
    for op in ops:
        op = op.strip().strip(",")
        if op[0] == "%":
            r.append([op, widths[op]])
        else:
            r.append(parseConst(op))
    return r


def parseInst(i):
    reg, width, inst, ops = None, None, None, []
    assert len(i) >= 2, f"wrong inst format {i}"
    if i[0] == "infer":
        assert len(i) == 2, f"wrong infer inst length {len(i)}, {i}"
        inst = i[0]
        reg = i[1]
        width = widths[reg]
        ops = []
    elif i[0] == "result":
        assert len(i) == 2, f"wrong result inst length {len(i)}, {i}"
        inst = i[0]
        ops = parseOps([i[1]])
    elif i[2] == "block":
        assert len(i) == 4, f"wrong block inst length {len(i)}, {i}"
        reg = i[0]
        inst = i[2]
        if reg not in widths:
            widths[reg] = None
        ops = [i[3]]
    elif i[0] == "cand":
        assert len(i) == 3, f"wrong cand inst length {len(i)}, {i}"
        inst = i[0]
        reg = i[1]
        ops = parseOps([i[2]])
    elif i[0] == "pc":
        assert len(i) == 3, f"wrong instruction length {len(i)}, {i}"
        inst = i[0]
        reg = i[1]
        ops = [parseConst(i[2])]
    elif i[0][0] == "%":
        assert len(i) >= 3, f"wrong instruction length {len(i)}, {i}"
        tmp = i[0].split(":")
        # assert len(tmp) == 2, f"wrong reg length {len(tmp)}, {tmp}"
        assert i[1] == "=", f"expecting '=', got {i[1]}"
        reg = tmp[0]
        # FIXME (this is one quick patch)
        width = tmp[1] if len(tmp) == 2 else "i32"
        inst = i[2]
        if "overflow" in i[2]:
            width = f"i{int(width[1:]) - 1}"
        widths[reg] = width
        ops = parseOps(i[3:])
    else:
        assert 0, f"unknown LHS: {i[0]}"
    # print(reg, width, inst, ops)
    return [reg, width, inst, ops]


def translateInstToLLVM(i):
    reg, width, inst, ops = i
    s = ""
    if inst == "phi":
        block = ops[0][0]
        philabel = f"philabel{block[1:]}"
        if block not in printedblocks:
            printedblocks.append(block)
            global cnt3
            if cnt3 == 0:
                s += f"  br label %{philabel}\n"
            else:
                s += f"  br label %foo{cnt3}\n"
            for k in range(len(ops[1:])):
                # don't print the first label of the func
                if cnt3 == 0:
                    cnt3 += 1
                    continue
                label = f"foo{cnt3}"
                cnt3 += 1
                labels.append(label)
                s += f"{label}:\n"
                s += f"  br label %{philabel}\n"
            s += f"{philabel}:\n"
        s += f"  {reg} = phi {width} "
        # grab the necessary number of predecessor labels
        blocklabels = labels[-len(ops[1:]):]
        for k, op in enumerate(ops[1:]):
            s += f"[{op[0]}, %{blocklabels[k]}]"
            if k < len(ops[1:]) - 1:
                s += ", "
    else:
        s = f"  {reg} = "
        if inst in instmap:
            s += instmap[inst]
        elif inst not in intrinsts:
            s += inst
        # special cases
        if inst in boolinsts:
            assert len(ops) >= 1, f"must have at least one op {inst}"
            s += f" {ops[0][1]}"
        elif inst in towidthinsts:
            assert len(ops) == 1, f"must have exactly one op {inst}"
            s += f" {ops[0][1]} {ops[0][0]} to {width}"
        elif inst == "extractvalue":
            # extracting i1s only
            s += f" {{{ops[0][1]}, i1}}"
        elif inst in intrinsts:
            if "overflow" in inst:
                s += f"call {{{width}, i1}} @llvm.{inst}.{width}({ops[0][1]} {ops[0][0]}, {ops[1][1]} {ops[1][0]})"
            else:
                s += f"call {width} @llvm.{inst}.{width}({ops[0][1]} {ops[0][0]})"
        elif inst == "select":
            pass
        else:
            s += f" {width}"
        # write ops
        if inst not in towidthinsts and inst not in intrinsts:
            for op in ops:
                if inst == "select":
                    s += f" {op[1]} {op[0]},"
                else:
                    s += f" {op[0]},"
    return s.strip(",")


def readOpt():
    res = []
    file_path = ''
    for line in fileinput.input():
        file_path = fileinput.filename()
        if not line.strip():
            continue
        elif line.strip()[0] == ";":
            continue
        res.append(line.split())
    assert len(res), "empty file"
    dir_name = os.path.dirname(file_path)
    base_name = os.path.basename(file_path)
    file_name, file_ext = os.path.splitext(base_name)
    return res, dir_name, file_name


def parseInsts(lines):
    res = []
    for line in lines:
        res.append(parseInst(line))
    return res


def propagateArgNames(insts):
    res = []
    counter = 1
    for i in insts:
        reg, width, inst, ops = i
        if inst == "var":
            newreg = f"%x{counter}"
            argmap[reg] = newreg
            widths[newreg] = width
            counter += 1
            continue
        for k, op in enumerate(ops):
            if op[0] in argmap:
                ops[k][0] = argmap[op[0]]
        res.append(i)
    return res


def groupPhis(insts):
    blocks = dict()
    regmap = getRegMap(insts)
    # scan for blocks and phis
    for k in range(len(insts)):
        i = insts[k]
        reg, width, inst, ops = i
        if inst == "block":
            assert reg not in blocks, f"block {reg} already parsed"
            blocks[reg] = []
            # move block def to front
            insts.insert(0, insts.pop(k))
        # skip pc/cand/infer/result insts
        elif inst in specialinsts:
            pass
        elif inst == "phi":
            block = ops[0][0]
            assert block in blocks, f"unknown block {block}"
            blocks[block].append(i)
    # group phis (incl. deps) of the same block together
    res = []
    for i in insts:
        reg, width, inst, ops = i
        if i in res:
            continue
        if inst == "phi":
            block = ops[0][0]
            for phi in blocks[block]:
                if phi == i:
                    continue
                deps = getInstDeps(regmap, phi)
                deps.reverse()
                # first, print dependent insts
                for dep in deps:
                    if dep not in res:
                        res.append(dep)
            # second, print phis
            for phi in blocks[block]:
                res.append(phi)
        else:
            # all other insts
            res.append(i)
    return res


def getRegMap(insts):
    res = dict()
    for i in insts:
        reg, width, inst, ops = i
        if inst in specialinsts:
            continue
        if reg not in res:
            res[reg] = i
    return res


def getInstDeps(regmap, i):
    res = []
    queue = [i]
    while len(queue):
        reg, width, inst, ops = queue.pop()
        assert inst not in specialinsts
        for k, op in enumerate(ops):
            if inst == "phi" and k == 0:
                continue
            dep = op[0]
            if dep[0] == "%" and dep in regmap:
                res.append(regmap[dep])
                queue.append(regmap[dep])
    return res


def rewriteRegs(insts):
    counter = 0
    res = []
    newregs = copy.deepcopy(argmap)
    global cand
    global needsResult
    for i in insts:
        reg, width, inst, ops = i
        if inst == "block":
            continue
        elif inst == "cand":
            assert not cand, "cand must be empty"
            assert reg in newregs, f"unknown reg {reg} for {i}"
            rewriteOps(inst, newregs, ops)
            cand = [newregs[reg], width, inst, ops]
            continue
        elif inst == "infer":
            assert not cand, "cand must be empty"
            cand = [newregs[reg], width, inst, ops]
            needsResult = True
            break
        elif inst == "result":
            assert needsResult, "infer inst not found"
            assert cand, "cand must not be empty"
            rewriteOps(inst, newregs, ops)
            cand[3] = ops
            needsResult = False
            continue
        elif inst == "pc":
            assert reg in newregs, f"unknown reg {reg} for {i}"
            newreg = newregs[reg]
            pc = [newreg, width, inst, ops]
            if newreg in pcmap:
                pcmap[newreg].append(pc)
            else:
                pcmap[newreg] = [pc]
            continue
        # give regs new names
        newreg = f"%{counter}"
        counter += 1
        newregs[reg] = newreg
        widths[newreg] = width
        rewriteOps(inst, newregs, ops)
        # special case: unroll nested insts
        if inst in nestedinsts and len(ops) > 2:
            res.append([newreg, width, inst, [ops[0], ops[1]]])
            for op in ops[2:]:
                newreg = f"%{counter}"
                counter += 1
                widths[newreg] = width
                lastreg = res[len(res) - 1][0]
                res.append([newreg, width, inst, [[lastreg, width], op]])
            newregs[reg] = newreg
        else:
            newinst = [newreg, width, inst, ops]
            # store intrinsic func decls
            if inst in intrinsts:
                if (inst + width) not in intrdecl:
                    if "overflow" in inst:
                        decl = f"declare {{{width}, i1}} @llvm.{inst}.{width}({width}, {width} #{len(intrdecl)}"
                    else:
                        decl = f"declare {width} @llvm.{inst}.{width}({width}) #{len(intrdecl)}"
                    intrdecl[inst + width] = decl
            res.append(newinst)
    return res


def rewriteOps(inst, newregs, ops):
    for j, op in enumerate(ops):
        # don't change phi's first op, namely the block ref
        if inst == "phi" and j == 0:
            continue
        elif op[0][0] == "%" and "%x" not in op[0]:
            assert op[0] in newregs, f"unknown reg {op[0]}, reordering bug in {j}"
            ops[j][0] = newregs[op[0]]


def genFuncHeader():
    res = list()
    # global declarations: dummy store, intrinsics
    res.append("target datalayout = \"e-m:e-i64:64-f80:128-n8:16:32:64-S128\"\n")
    for decl in intrdecl.values():
        res.append(decl)
    tmp = f"\ndefine {cand[1]} @foo("
    # print args
    for i, reg in enumerate(argmap.values()):
        tmp += f"{widths[reg]} {reg}"
        if i < len(argmap) - 1:
            tmp += ", "
    tmp += ") {"
    res.append(tmp)
    # first label
    res.append(f"{labels[0]}:")
    return res


def genFuncBody(insts):
    res = list()
    for i in insts:
        res.append(translateInstToLLVM(i))
    return res


def genPCs():
    res = list()
    for reg, pcs in pcmap.items():
        global cnt1
        global cnt2
        s = ""
        for k, pc in enumerate(pcs):
            s += f"  %tmp{cnt1} = icmp eq {widths[pc[0]]} {pc[3][0][0]}, {pc[0]}\n"
            s += f"  br i1 %tmp{cnt1}, label %cont{cnt2}, label %out\n"
            s += f"cont{cnt2}:"
            if k < len(pcs) - 1:
                s += "\n"
            cnt1 += 1
            cnt2 += 1
        res.append(s)
    return res


def genFuncFooter():
    res = list()
    assert cand, "there must be a candidate"
    res.append(f"  %cand = icmp eq {cand[3][0][1]} {cand[3][0][0]}, {cand[0]}")
    res.append("  br i1 %cand, label %return, label %dead")
    res.append("return:")
    res.append("  %dummy1w = atomicrmw add i32* @dummy1, i32 1 monotonic")
    res.append("  ret void")
    # dummy global variable modifications
    res.append("dead:")
    res.append("  %dummy2w = atomicrmw add i32* @dummy2, i32 1 monotonic")
    res.append("  ret void")
    if len(pcmap):
        res.append("out:")
        res.append("  %dummy3w = atomicrmw add i32* @dummy3, i32 1 monotonic")
        res.append("  ret void")
    res.append("}")
    return res


def genLHSFuncFooter():
    res = list()
    res.append(f"  ret {cand[1]} {cand[0]}")
    res.append("}")
    return res


def main():
    lines, dir_name, file_name = readOpt()
    insts = parseInsts(lines)
    insts = propagateArgNames(insts)
    insts = groupPhis(insts)
    insts = rewriteRegs(insts)

    assert cand, "cand inst not found"

    res = list()
    res.extend(genFuncHeader())
    res.extend(genFuncBody(insts))
    res.extend(genPCs())
    res.extend(genLHSFuncFooter())

    with open(f'{dir_name}/{file_name}.ll', 'w') as f:
        f.write('\n'.join(res))


main()

# based on souper/utils/souper2llvm.in (Sep 13, 2019)
# todo sync latest version
# todo fix compatibility issue with llc (like negate.opt)
