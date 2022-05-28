features = [
    ["--souper-infer-inst", [10,9,8,7,6], [1, 2]], # 0
    ["--souper-infer-inst=false --souper-synthesis-const-with-cegis --souper-enumerative-synthesis-ignore-cost", [], [2]], # 1
    ["--souper-infer-inst=false --souper-synthesis-const-with-cegis", [], [1]], # 2
    ["--souper-enumerative-synthesis-max-instructions=3", [1, 2], [4, 5]], # 3
    ["--souper-enumerative-synthesis-max-instructions=10", [1, 2], [3, 5]], # 4 
    ["--souper-enumerative-synthesis-max-instructions=1", [1, 2], [3, 4]], # 5
    ["--souper-synthesis-comps=mul,select,const,const,shl,lshr,ashr,and,or,xor,add,sub,slt,ult,sle,ule,eq,ne", [0, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], []], # 6
    ["--crow-shuflle-seed=0", [], [8, 9, 10]], # 7 
    ["--crow-shuflle-seed=1000", [], [7, 9, 10]],# 8
    ["--crow-shuflle-seed=2000", [], [7, 8, 10]], # 9
    ["--crow-shuflle-seed=42", [], [7,8,9]],# 10
    ["--souper-dataflow-pruning=true", [], []], #11
    ["--souper-crow-prune-unary-operator-on-constant=true", [], []], # 12
    ["--souper-crow-prune-select=true",  [], []], #13
    ["--souper-crow-prune-binary-commutative=true", [], []], # 14
    ["--souper-crow-prune-2const-operation=true", [], []], #15
    ["--souper-crow-prune-sub=true", [], []], # 16
    ["--souper-crow-prune-constant-select=true", [], []], # 17

]

def superset(options, rem, index, cb):

    if len(options) == 0:
        if len(rem) > 0:
            cb(rem)
    else:
        t = [r for r in rem]
        first_opt, compt, exclude = options[0]
        previous_indexes = set([c[1] for c in t])
        exclude = set(exclude)

        intersect = exclude.intersection(previous_indexes)
        intersect_compt = set(compt).intersection(previous_indexes)

        if (not compt or index in compt) and not intersect:
            superset(options[1:], t + [(first_opt, index)], index + 1, cb)
        superset(options[1:], t, index+ 1, cb)

if __name__ == "__main__":
    options  = []
    def cb(t):
        options.append(t)
    superset(features, [], 0, cb)

    print(len(options))
    print(options[0])

    print("Copy and paste the following in the config.ini\n\n")

    order = []
    for i, opt in enumerate(options):
        j = " ".join(o[0] for o in opt)
        print(f"souper-level-{i} = {j}")
        order.append(i)
    order = ','.join([str(o) for o in order])
    print(f"order={order}")