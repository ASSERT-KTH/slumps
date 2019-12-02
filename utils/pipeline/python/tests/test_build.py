from nodes import SolutionNode
from dependency import DependencyAnalyzer
import stages



def test_merge1():
    
    LHS = '''
          %0:i4 = var
          %1:i4 = var
          %2:i4 = mul %0, 7:i4
          %3:i4 = mul %1, 7:i4
          %4:i4 = add %2, %3
          infer %4
          '''

    RHS = '''
    %5:i4 = add %0, %1
    %6:i4 = mul 7:i4, %5
    result %6
    '''
    
    merge = DependencyAnalyzer.merge(LHS, RHS).encode("utf-8")

    souperToLHS = stages.SouperToLLVM()

    LLVMIR = souperToLHS(std=merge)

    print(LLVMIR.decode("utf-8"))




def test_merge2():
    
    LHS = '''
          %0:i4 = var
          %1:i4 = var
          %2:i4 = mul %0, 7:i4
          %3:i4 = mul %1, 7:i4
          %4:i4 = add %2, %3
          infer %4
          '''

    RHS = '''
    %5:i4 = add %0, %1
    result 10:i32
    '''
    
    merge = DependencyAnalyzer.merge(LHS, RHS).encode("utf-8")

    souperToLHS = stages.SouperToLLVM()

    LLVMIR = souperToLHS(std=merge)

    print(LLVMIR.decode("utf-8"))