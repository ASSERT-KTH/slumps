; ModuleID = 'f2.c'
source_filename = "f2.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @__main_void to i8*)], section "llvm.metadata"

@__main_void = alias i32 (), i32 ()* @main

; Function Attrs: norecurse nounwind readnone
define hidden i32 @f(i32 %x) local_unnamed_addr #0 {
entry:
  %add = mul nsw i32 %x, 2
  %tmp = add nsw i32 %add, %x
  ret i32 %tmp
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @main() #0 {
entry:
  %call = call i32 @f(i32 10)
  ret i32 %call
}

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (https://github.com/regehr/llvm-project.git cbd3118ced344b1c1d7b7023a13abdbc68ba5624)"}
