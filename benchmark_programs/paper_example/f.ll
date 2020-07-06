; ModuleID = 'f.bc'
source_filename = "f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f(i32 %cond, i32 %z) #0 {
entry:
  %cond.addr = alloca i32, align 4
  %z.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %cond, i32* %cond.addr, align 4
  store i32 %z, i32* %z.addr, align 4
  %0 = load i32, i32* %cond.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %z.addr, align 4
  %mul = mul nsw i32 2, %1
  store i32 %mul, i32* %x, align 4
  %2 = load i32, i32* %z.addr, align 4
  %3 = load i32, i32* %x, align 4
  %add = add nsw i32 %3, %2
  store i32 %add, i32* %x, align 4
  %4 = load i32, i32* %z.addr, align 4
  store i32 %4, i32* %y, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %z.addr, align 4
  %mul1 = mul nsw i32 2, %5
  store i32 %mul1, i32* %x, align 4
  %6 = load i32, i32* %z.addr, align 4
  %mul2 = mul nsw i32 2, %6
  store i32 %mul2, i32* %y, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load i32, i32* %x, align 4
  store i32 %7, i32* %k, align 4
  %8 = load i32, i32* %k, align 4
  %9 = load i32, i32* %y, align 4
  %add3 = add nsw i32 %8, %9
  store i32 %add3, i32* %k, align 4
  %10 = load i32, i32* %k, align 4
  ret i32 %10
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (https://github.com/regehr/llvm-project.git 3e3168fa742a8f4682e79e43c89515fa031d59b6)"}
