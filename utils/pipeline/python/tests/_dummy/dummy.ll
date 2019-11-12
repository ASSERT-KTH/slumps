; ModuleID = 'python/tests/_dummy/dummy.ll'
source_filename = "python/tests/_dummy/dummy.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

; Function Attrs: noinline nounwind ssp uwtable
define i32 @a(i32 %t) #0 {
entry:
  %tobool = icmp ne i32 %t, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul = mul nsw i32 20, 2
  %add = add nsw i32 20, %mul
  %mul1 = mul nsw i32 %add, 2
  %add2 = add nsw i32 20, %mul1
  br label %return

if.end:                                           ; preds = %entry
  %add3 = add nsw i32 10, 20
  %call = call i32 @k()
  %add4 = add nsw i32 %add3, %call
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ %add2, %if.then ], [ %add4, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: noinline nounwind ssp uwtable
define i32 @k() #0 {
entry:
  %call = call i32 @a(i32 20)
  %call1 = call i32 @a(i32 20)
  %add = add nsw i32 %call1, 900
  ret i32 %add
}

attributes #0 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
