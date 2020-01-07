; ModuleID = 'benchmark4pipeline_c/eban_numbers.c'
source_filename = "benchmark4pipeline_c/eban_numbers.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.Interval = type { i32, i32, i8 }

@main.intervals = private unnamed_addr constant [8 x %struct.Interval] [%struct.Interval { i32 2, i32 1000, i8 1 }, %struct.Interval { i32 1000, i32 4000, i8 1 }, %struct.Interval { i32 2, i32 10000, i8 0 }, %struct.Interval { i32 2, i32 100000, i8 0 }, %struct.Interval { i32 2, i32 1000000, i8 0 }, %struct.Interval { i32 2, i32 10000000, i8 0 }, %struct.Interval { i32 2, i32 100000000, i8 0 }, %struct.Interval { i32 2, i32 1000000000, i8 0 }], align 16
@.str = private unnamed_addr constant [38 x i8] c"eban numbers up to and including %d:\0A\00", align 1
@.str.1 = private unnamed_addr constant [44 x i8] c"eban numbers between %d and %d (inclusive:)\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"count = %d\0A\0A\00", align 1

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
  br label %1

; <label>:1:                                      ; preds = %92, %0
  %2 = phi i32 [ 0, %0 ], [ %94, %92 ]
  %3 = getelementptr inbounds [8 x %struct.Interval], [8 x %struct.Interval]* @main.intervals, i32 0, i32 %2, i32 0
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds [8 x %struct.Interval], [8 x %struct.Interval]* @main.intervals, i32 0, i32 %2, i32 1
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %2, 1
  br i1 %7, label %10, label %8

; <label>:8:                                      ; preds = %1
  %9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i32 %6)
  br label %12

; <label>:10:                                     ; preds = %1
  %11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i32 0, i32 0), i32 %4, i32 %6)
  br label %12

; <label>:12:                                     ; preds = %10, %8
  %13 = icmp sgt i32 %4, %6
  br i1 %13, label %87, label %14

; <label>:14:                                     ; preds = %12
  %15 = icmp ult i32 %2, 2
  br i1 %15, label %17, label %16

; <label>:16:                                     ; preds = %14
  br label %53

; <label>:17:                                     ; preds = %14
  br label %18

; <label>:18:                                     ; preds = %17, %49
  %19 = phi i32 [ %51, %49 ], [ %4, %17 ]
  %20 = phi i32 [ %50, %49 ], [ 0, %17 ]
  %21 = srem i32 %19, 1000000000
  %22 = sdiv i32 %21, 1000000
  %23 = srem i32 %19, 1000000
  %24 = sdiv i32 %23, 1000
  %25 = mul i32 %24, 1000
  %26 = sub i32 %23, %25
  %27 = add nsw i32 %23, -30000
  %28 = icmp ult i32 %27, 37000
  %29 = srem i32 %24, 10
  %30 = select i1 %28, i32 %29, i32 %24
  %31 = add nsw i32 %26, -30
  %32 = icmp ult i32 %31, 37
  %33 = srem i32 %26, 10
  %34 = select i1 %32, i32 %33, i32 %26
  %35 = add i32 %19, 999999999
  %36 = icmp ult i32 %35, 1999999999
  %37 = icmp sgt i32 %19, 1999999999
  %38 = or i1 %37, %36
  br i1 %38, label %39, label %49

; <label>:39:                                     ; preds = %18
  %40 = add nsw i32 %21, -30000000
  %41 = icmp ult i32 %40, 37000000
  %42 = srem i32 %22, 10
  %43 = select i1 %41, i32 %42, i32 %22
  switch i32 %43, label %49 [
    i32 6, label %44
    i32 4, label %44
    i32 2, label %44
    i32 0, label %44
  ]

; <label>:44:                                     ; preds = %39, %39, %39, %39
  switch i32 %30, label %49 [
    i32 6, label %45
    i32 4, label %45
    i32 2, label %45
    i32 0, label %45
  ]

; <label>:45:                                     ; preds = %44, %44, %44, %44
  switch i32 %34, label %49 [
    i32 6, label %46
    i32 4, label %46
    i32 2, label %46
    i32 0, label %46
  ]

; <label>:46:                                     ; preds = %45, %45, %45, %45
  %47 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %19)
  %48 = add nsw i32 %20, 1
  br label %49

; <label>:49:                                     ; preds = %46, %45, %44, %39, %18
  %50 = phi i32 [ %48, %46 ], [ %20, %45 ], [ %20, %44 ], [ %20, %39 ], [ %20, %18 ]
  %51 = add nsw i32 %19, 2
  %52 = icmp sgt i32 %51, %6
  br i1 %52, label %87, label %18

; <label>:53:                                     ; preds = %16, %83
  %54 = phi i32 [ %85, %83 ], [ %4, %16 ]
  %55 = phi i32 [ %84, %83 ], [ 0, %16 ]
  %56 = srem i32 %54, 1000000000
  %57 = sdiv i32 %56, 1000000
  %58 = srem i32 %54, 1000000
  %59 = sdiv i32 %58, 1000
  %60 = mul i32 %59, 1000
  %61 = sub i32 %58, %60
  %62 = add nsw i32 %58, -30000
  %63 = icmp ult i32 %62, 37000
  %64 = srem i32 %59, 10
  %65 = select i1 %63, i32 %64, i32 %59
  %66 = add nsw i32 %61, -30
  %67 = icmp ult i32 %66, 37
  %68 = srem i32 %61, 10
  %69 = select i1 %67, i32 %68, i32 %61
  %70 = add i32 %54, 999999999
  %71 = icmp ult i32 %70, 1999999999
  %72 = icmp sgt i32 %54, 1999999999
  %73 = or i1 %72, %71
  br i1 %73, label %74, label %83

; <label>:74:                                     ; preds = %53
  %75 = add nsw i32 %56, -30000000
  %76 = icmp ult i32 %75, 37000000
  %77 = srem i32 %57, 10
  %78 = select i1 %76, i32 %77, i32 %57
  switch i32 %78, label %83 [
    i32 6, label %79
    i32 4, label %79
    i32 2, label %79
    i32 0, label %79
  ]

; <label>:79:                                     ; preds = %74, %74, %74, %74
  switch i32 %65, label %83 [
    i32 6, label %80
    i32 4, label %80
    i32 2, label %80
    i32 0, label %80
  ]

; <label>:80:                                     ; preds = %79, %79, %79, %79
  switch i32 %69, label %83 [
    i32 6, label %81
    i32 4, label %81
    i32 2, label %81
    i32 0, label %81
  ]

; <label>:81:                                     ; preds = %80, %80, %80, %80
  %82 = add nsw i32 %55, 1
  br label %83

; <label>:83:                                     ; preds = %80, %79, %74, %81, %53
  %84 = phi i32 [ %82, %81 ], [ %55, %80 ], [ %55, %79 ], [ %55, %74 ], [ %55, %53 ]
  %85 = add nsw i32 %54, 2
  %86 = icmp sgt i32 %85, %6
  br i1 %86, label %87, label %53

; <label>:87:                                     ; preds = %83, %49, %12
  %88 = phi i32 [ 0, %12 ], [ %50, %49 ], [ %84, %83 ]
  %89 = icmp ult i32 %2, 2
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %87
  %91 = tail call i32 @putchar(i32 10)
  br label %92

; <label>:92:                                     ; preds = %90, %87
  %93 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0), i32 %88)
  %94 = add nuw nsw i32 %2, 1
  %95 = icmp eq i32 %94, 8
  br i1 %95, label %96, label %1

; <label>:96:                                     ; preds = %92
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
