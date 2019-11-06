; ModuleID = 'paper.c'
source_filename = "paper.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define i32 @g(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = urem i32 %3, 4
  switch i32 %4, label %14 [
    i32 0, label %5
    i32 1, label %8
    i32 2, label %11
  ]

; <label>:5:                                      ; preds = %1
  %6 = load i32, i32* %2, align 4
  %7 = add i32 %6, 3
  store i32 %7, i32* %2, align 4
  br label %14

; <label>:8:                                      ; preds = %1
  %9 = load i32, i32* %2, align 4
  %10 = add i32 %9, 2
  store i32 %10, i32* %2, align 4
  br label %14

; <label>:11:                                     ; preds = %1
  %12 = load i32, i32* %2, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %2, align 4
  br label %14

; <label>:14:                                     ; preds = %1, %11, %8, %5
  %15 = load i32, i32* %2, align 4
  %16 = and i32 %15, 3
  ret i32 %16
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
