; ModuleID = 't.bc'
source_filename = "f2.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "wasm32-unknown-unknown"

; Function Attrs: norecurse nounwind readnone ssp uwtable
define i32 @f(i32 %0) local_unnamed_addr #0 {
  %2 = mul i32 3, %0
  ret i32 %2
}

; Function Attrs: norecurse nounwind readnone ssp uwtable
define i32 @main() local_unnamed_addr #0 {
  %1 = tail call i32 @f(i32 10)
  ret i32 %1
}

attributes #0 = { norecurse nounwind readnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Apple LLVM version 10.0.1 (clang-1001.0.46.4)"}
