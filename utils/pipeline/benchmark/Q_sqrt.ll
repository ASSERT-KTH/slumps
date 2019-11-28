; ModuleID = '/home/jian/Desktop/Q_sqrt.ll'
source_filename = "/home/jian/Desktop/Q_sqrt.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local float @_Z7Q_rsqrtf(float %number) #0 {
entry:
  %i = alloca i64, align 8
  %y = alloca float, align 4
  %mul = fmul float %number, 5.000000e-01
  store float %number, float* %y, align 4
  %0 = bitcast float* %y to i64*
  %1 = load i64, i64* %0, align 4
  store i64 %1, i64* %i, align 8
  %2 = load i64, i64* %i, align 8
  %shr = ashr i64 %2, 1
  %sub = sub nsw i64 1597463007, %shr
  store i64 %sub, i64* %i, align 8
  %3 = bitcast i64* %i to float*
  %4 = load float, float* %3, align 8
  store float %4, float* %y, align 4
  %5 = load float, float* %y, align 4
  %6 = load float, float* %y, align 4
  %mul1 = fmul float %mul, %6
  %7 = load float, float* %y, align 4
  %mul2 = fmul float %mul1, %7
  %sub3 = fsub float 1.500000e+00, %mul2
  %mul4 = fmul float %5, %sub3
  store float %mul4, float* %y, align 4
  %8 = load float, float* %y, align 4
  %9 = load float, float* %y, align 4
  %mul5 = fmul float %mul, %9
  %10 = load float, float* %y, align 4
  %mul6 = fmul float %mul5, %10
  %sub7 = fsub float 1.500000e+00, %mul6
  %mul8 = fmul float %8, %sub7
  store float %mul8, float* %y, align 4
  %11 = load float, float* %y, align 4
  ret float %11
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final 375507)"}
