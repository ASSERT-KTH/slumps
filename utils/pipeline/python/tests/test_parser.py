from nodes import SolutionNode
from dependency import DependencyAnalyzer


def test_DependencyGraphAnalyze():
    parser = DependencyAnalyzer()
    
    text = '''
define i32 @nonCall() #0 {
entry:
  %add = add nsw i32 10, 20
  ret i32 %add
}

; Function Attrs: noinline nounwind ssp uwtable
define i32 @a(i32 %t) #0 {
entry:
  %call = call i32 @nonCall()
  %tobool = icmp ne i32 %t, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %add = add nsw i32 20, 20
  %mul = mul nsw i32 %add, 2
  %add1 = add nsw i32 20, %mul
  br label %return

if.end:                                           ; preds = %entry
  %add2 = add nsw i32 10, 20
  %add3 = add nsw i32 %add2, %call
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ %add1, %if.then ], [ %add3, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: noinline nounwind ssp uwtable
define i32 @main() #0 {
entry:
  %call = call i32 @a(i32 10)
  %call1 = call i32 @nonCall()
  %add = add nsw i32 %call, %call1
  ret i32 %add
}
'''

    r = parser.parse(text)

    add = r[0]["%add"]

    print(r[0]["%mul"])
    print(r[0]["%add3"])

    for dp in add["references"]:
        assert text[dp[0]:dp[0] + len("%add")] == "%add"



def test_DependencyGraphAnalyze2():
    parser = DependencyAnalyzer()
    
    text = '''
if.then:                                          
  %add = add nsw i32 20, 20
  %mul = mul nsw i32 %add, 2
  %add1 = add nsw i32 20, %mul
  br label %return
return:                                           
  ret i32 20
}
'''

    r = parser.parse(text)


    print(r[0])
