; ModuleID = 'benchmark4pipeline_c/babbage_problem.c'
source_filename = "benchmark4pipeline_c/babbage_problem.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@.str.1 = private unnamed_addr constant [55 x i8] c"The smallest number whose square ends in 269696 is %d\0A\00", align 1

; Function Attrs: nounwind
define i32 @main() local_unnamed_addr #0 {
  br label %1

; <label>:1:                                      ; preds = %1, %0
  %current.0 = phi i32 [ 0, %0 ], [ %inc, %1 ]
  %mul = mul nsw i32 %current.0, %current.0
  %rem = urem i32 %mul, 1000000
  %cmp = icmp ne i32 %rem, 269696
  %cmp1 = icmp ne i32 %mul, 2147483647
  %2 = and i1 %cmp1, %cmp
  %inc = add nuw nsw i32 %current.0, 1
  br i1 %2, label %1, label %3

; <label>:3:                                      ; preds = %1
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.1, i32 0, i32 0), i32 %current.0)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
