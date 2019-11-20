; ModuleID = 'f2.ll'
source_filename = "f2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f(i32 %cond, i32 %z) #0 {
entry:
  %tobool = icmp ne i32 %cond, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %mul = mul nsw i32 3, %z
  br label %if.end

if.else:                                          ; preds = %entry
  %mul1 = mul nsw i32 2, %z
  %mul2 = mul nsw i32 2, %z
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %x.0 = phi i32 [ %mul, %if.then ], [ %mul1, %if.else ]
  %y.0 = phi i32 [ %z, %if.then ], [ %mul2, %if.else ]
  %add = add nsw i32 %x.0, %y.0
  ret i32 %add
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final 375507)"}
