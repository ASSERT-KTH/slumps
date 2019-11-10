from .. import pipeline
import os


BASEDIR = os.path.dirname(__file__)

def test_ctoll():
    ctoll = pipeline.CToLLStage()

    ctoll("%s/_dummy/dummy.c"%(BASEDIR, )) # Send llvm IR to std


def test_lltoll():
    # Receive a LLVM IR in the std
    lltoll = pipeline.LLToMem2RegLL()

    lltoll(std=b'''; ModuleID = './python/tests/_dummy/dummy.ll'
                    source_filename = "./python/tests/_dummy/dummy.c"
                    target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
                    target triple = "x86_64-apple-macosx10.14.0"

                    ; Function Attrs: noinline nounwind ssp uwtable
                    define i32 @a(i32 %t) #0 {
                    entry:
                    %tobool = icmp ne i32 %t, 0
                    br i1 %tobool, label %if.then, label %if.end

                    if.then:                                          ; preds = %entry
                    %add = add nsw i32 20, 20
                    %mul = mul nsw i32 %add, 2
                    %add1 = add nsw i32 20, %mul
                    br label %return

                    if.end:                                           ; preds = %entry
                    br label %return

                    return:                                           ; preds = %if.end, %if.then
                    %retval.0 = phi i32 [ %add1, %if.then ], [ 25, %if.end ]
                    ret i32 %retval.0
                    }

                    attributes #0 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

                    !llvm.module.flags = !{!0, !1}
                    !llvm.ident = !{!2}

                    !0 = !{i32 1, !"wchar_size", i32 4}
                    !1 = !{i32 7, !"PIC Level", i32 2}
                    !2 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
                    ''') # Send llvm IR to std



def test_lltobc():
    # Receive a LLVM IR in the std
    lltobc = pipeline.LLToBC()

    lltobc(std=b'''; ModuleID = './python/tests/_dummy/dummy.ll'
                        source_filename = "./python/tests/_dummy/dummy.c"
                        target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
                        target triple = "x86_64-apple-macosx10.14.0"

                        ; Function Attrs: noinline nounwind ssp uwtable
                        define i32 @a(i32 %t) #0 {
                        entry:
                        %tobool = icmp ne i32 %t, 0
                        br i1 %tobool, label %if.then, label %if.end

                        if.then:                                          ; preds = %entry
                        %add = add nsw i32 20, 20
                        %mul = mul nsw i32 %add, 2
                        %add1 = add nsw i32 20, %mul
                        br label %return

                        if.end:                                           ; preds = %entry
                        br label %return

                        return:                                           ; preds = %if.end, %if.then
                        %retval.0 = phi i32 [ %add1, %if.then ], [ 25, %if.end ]
                        ret i32 %retval.0
                        }

                        attributes #0 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

                        !llvm.module.flags = !{!0, !1}
                        !llvm.ident = !{!2}

                        !0 = !{i32 1, !"wchar_size", i32 4}
                        !1 = !{i32 7, !"PIC Level", i32 2}
                        !2 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}

                    ''') # Send llvm IR to std

def test_bctoSouper():
    # Receive a LLVM IR in the std
    bctoSouper = pipeline.BCToSouper()
    content = open("%s/_dummy/dummy_test.bc"%(BASEDIR,), 'rb').read()
    
    bctoSouper(std=content) # Send llvm IR to std


def test_souperCandidates():
    # Receive a LLVM IR in the std
    souperToLHS = pipeline.CandidatesToSouperParts()
    
    
    souperToLHS(std=b'''; Listing valid replacements.
                            ; Using solver: Z3 + internal cache

                            ; Static profile 1
                            ; Function: a
                            %0:i32 = addnsw 20:i32, 20:i32
                            cand %0 40:i32

                            ; Static profile 1
                            ; Function: a
                            %0:i32 = addnsw 20:i32, 20:i32
                            %1:i32 = mulnsw 2:i32, %0
                            cand %1 80:i32

                            ; Static profile 1
                            ; Function: a
                            %0:i32 = addnsw 20:i32, 20:i32
                            %1:i32 = mulnsw 2:i32, %0
                            %2:i32 = addnsw 20:i32, %1
                            cand %2 100:i32
                        ''') # Send llvm IR to std