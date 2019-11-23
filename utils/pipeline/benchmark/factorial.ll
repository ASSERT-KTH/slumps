; ModuleID = '/home/jian/Desktop/factorial.ll'
source_filename = "/home/jian/Desktop/factorial.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local double @_Z4facti(i32 %i) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %n.0 = phi i64 [ 1, %entry ], [ %mul, %for.inc ]
  %i.addr.0 = phi i32 [ %i, %entry ], [ %dec, %for.inc ]
  %cmp = icmp sgt i32 %i.addr.0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %conv = sext i32 %i.addr.0 to i64
  %mul = mul nsw i64 %n.0, %conv
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %dec = add nsw i32 %i.addr.0, -1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %conv1 = sitofp i64 %n.0 to double
  ret double %conv1
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final 375507)"}
