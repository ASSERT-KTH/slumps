; ModuleID = '[24]Multiplication_tables[0_1_2_3_4].bc'
source_filename = "/inputs/Multiplication_tables.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-wasi"

@.str = private unnamed_addr constant [6 x i8] c"%3d%c\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"----\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"+\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"    \00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"%3d \00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"| %d\0A\00", align 1
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @__main_void to i8*)], section "llvm.metadata"

@__main_void = alias i32 (), i32 ()* @main

; Function Attrs: noinline nounwind optnone
define hidden i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 12, i32* %4, align 4
  store i32 1, i32* %3, align 4
  br label %5

5:                                                ; preds = %16, %0
  %6 = load i32, i32* %3, align 4
  %7 = load i32, i32* %4, align 4
  %8 = icmp sle i32 %6, %7
  br i1 %8, label %9, label %19

9:                                                ; preds = %5
  %10 = load i32, i32* %3, align 4
  %11 = load i32, i32* %3, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp ne i32 %11, %12
  %14 = select i1 %13, i32 32, i32 10
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 %10, i32 %14)
  br label %16

16:                                               ; preds = %9
  %17 = load i32, i32* %3, align 4
  %18 = add i32 1, %17
  store i32 %18, i32* %3, align 4
  br label %5

19:                                               ; preds = %5
  store i32 0, i32* %3, align 4
  br label %20

20:                                               ; preds = %30, %19
  %21 = load i32, i32* %3, align 4
  %22 = load i32, i32* %4, align 4
  %23 = icmp sle i32 %21, %22
  br i1 %23, label %24, label %33

24:                                               ; preds = %20
  %25 = load i32, i32* %3, align 4
  %26 = load i32, i32* %4, align 4
  %27 = icmp ne i32 %25, %26
  %28 = select i1 %27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0)
  %29 = call i32 (i8*, ...) @printf(i8* %28)
  br label %30

30:                                               ; preds = %24
  %31 = load i32, i32* %3, align 4
  %32 = add i32 1, %31
  store i32 %32, i32* %3, align 4
  br label %20

33:                                               ; preds = %20
  store i32 1, i32* %2, align 4
  br label %34

34:                                               ; preds = %58, %33
  %35 = load i32, i32* %2, align 4
  %36 = load i32, i32* %4, align 4
  %37 = icmp sle i32 %35, %36
  br i1 %37, label %38, label %61

38:                                               ; preds = %34
  store i32 1, i32* %3, align 4
  br label %39

39:                                               ; preds = %52, %38
  %40 = load i32, i32* %3, align 4
  %41 = load i32, i32* %4, align 4
  %42 = icmp sle i32 %40, %41
  br i1 %42, label %43, label %55

43:                                               ; preds = %39
  %44 = load i32, i32* %3, align 4
  %45 = load i32, i32* %2, align 4
  %46 = icmp slt i32 %44, %45
  %47 = select i1 %46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)
  %48 = load i32, i32* %2, align 4
  %49 = load i32, i32* %3, align 4
  %50 = mul i32 %48, %49
  %51 = call i32 (i8*, ...) @printf(i8* %47, i32 %50)
  br label %52

52:                                               ; preds = %43
  %53 = load i32, i32* %3, align 4
  %54 = add i32 1, %53
  store i32 %54, i32* %3, align 4
  br label %39

55:                                               ; preds = %39
  %56 = load i32, i32* %2, align 4
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i32 %56)
  br label %58

58:                                               ; preds = %55
  %59 = load i32, i32* %2, align 4
  %60 = add i32 1, %59
  store i32 %60, i32* %2, align 4
  br label %34

61:                                               ; preds = %34
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (https://github.com/regehr/llvm-project.git 3e3168fa742a8f4682e79e43c89515fa031d59b6)"}
