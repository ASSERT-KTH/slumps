; ModuleID = '/home/jian/Desktop/popcnt.ll'
source_filename = "/home/jian/Desktop/popcnt.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind uwtable
define dso_local i32 @main(i32 %a) #0 {
entry:
  %0 = call i32 @llvm.ctpop.i32(i32 %a)
  %1 = call i32 @llvm.ctpop.i32(i32 %a)
  %add = add nsw i32 %0, %1
  ret i32 %add
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.ctpop.i32(i32) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @_Z5countj(i32 %x) #2 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %v.0 = phi i32 [ 0, %entry ], [ %inc, %while.body ]
  %x.addr.0 = phi i32 [ %x, %entry ], [ %and, %while.body ]
  %cmp = icmp ne i32 %x.addr.0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %sub = sub i32 %x.addr.0, 1
  %and = and i32 %x.addr.0, %sub
  %inc = add nsw i32 %v.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 %v.0
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final 375507)"}
