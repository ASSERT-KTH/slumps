; ModuleID = 'benchmark4pipeline_c/paraffins.c'
source_filename = "benchmark4pipeline_c/paraffins.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@rooted = hidden local_unnamed_addr global [33 x i64] [i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0], align 16
@unrooted = hidden local_unnamed_addr global [33 x i64] [i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0], align 16
@.str = private unnamed_addr constant [12 x i8] c"%llu: %llu\0A\00", align 1

; Function Attrs: norecurse nounwind readnone
define hidden i64 @choose(i64, i64) local_unnamed_addr #0 {
  %3 = icmp ugt i64 %1, 1
  br i1 %3, label %4, label %13

; <label>:4:                                      ; preds = %2
  br label %5

; <label>:5:                                      ; preds = %4, %5
  %6 = phi i64 [ %11, %5 ], [ %0, %4 ]
  %7 = phi i64 [ %10, %5 ], [ 1, %4 ]
  %8 = add i64 %7, %0
  %9 = mul i64 %6, %8
  %10 = add nuw i64 %7, 1
  %11 = udiv i64 %9, %10
  %12 = icmp eq i64 %10, %1
  br i1 %12, label %13, label %5

; <label>:13:                                     ; preds = %5, %2
  %14 = phi i64 [ %0, %2 ], [ %11, %5 ]
  ret i64 %14
}

; Function Attrs: nounwind
define hidden void @tree(i64, i64, i64, i64, i64) local_unnamed_addr #1 {
  %6 = add i64 %0, 1
  %7 = icmp ult i64 %6, 5
  br i1 %7, label %8, label %93

; <label>:8:                                      ; preds = %5
  %9 = trunc i64 %1 to i32
  %10 = getelementptr inbounds [33 x i64], [33 x i64]* @rooted, i32 0, i32 %9
  %11 = shl i64 %4, 1
  %12 = add i64 %1, -1
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %15, label %14

; <label>:14:                                     ; preds = %8
  br label %52

; <label>:15:                                     ; preds = %8
  br label %16

; <label>:16:                                     ; preds = %15, %45
  %17 = phi i64 [ %50, %45 ], [ %6, %15 ]
  %18 = sub i64 %17, %0
  %19 = mul i64 %18, %1
  %20 = add i64 %19, %3
  %21 = icmp ugt i64 %20, 32
  br i1 %21, label %93, label %22

; <label>:22:                                     ; preds = %16
  %23 = load i64, i64* %10, align 8, !tbaa !2
  %24 = icmp ugt i64 %18, 1
  br i1 %24, label %25, label %34

; <label>:25:                                     ; preds = %22
  br label %26

; <label>:26:                                     ; preds = %25, %26
  %27 = phi i64 [ %32, %26 ], [ %23, %25 ]
  %28 = phi i64 [ %31, %26 ], [ 1, %25 ]
  %29 = add i64 %28, %23
  %30 = mul i64 %29, %27
  %31 = add nuw nsw i64 %28, 1
  %32 = udiv i64 %30, %31
  %33 = icmp eq i64 %31, %18
  br i1 %33, label %34, label %26

; <label>:34:                                     ; preds = %26, %22
  %35 = phi i64 [ %23, %22 ], [ %32, %26 ]
  %36 = mul i64 %35, %2
  %37 = icmp ult i64 %11, %20
  br i1 %37, label %38, label %43

; <label>:38:                                     ; preds = %34
  %39 = trunc i64 %20 to i32
  %40 = getelementptr inbounds [33 x i64], [33 x i64]* @unrooted, i32 0, i32 %39
  %41 = load i64, i64* %40, align 8, !tbaa !2
  %42 = add i64 %41, %36
  store i64 %42, i64* %40, align 8, !tbaa !2
  br label %43

; <label>:43:                                     ; preds = %38, %34
  %44 = icmp eq i64 %17, 4
  br i1 %44, label %93, label %45

; <label>:45:                                     ; preds = %43
  %46 = trunc i64 %20 to i32
  %47 = getelementptr inbounds [33 x i64], [33 x i64]* @rooted, i32 0, i32 %46
  %48 = load i64, i64* %47, align 8, !tbaa !2
  %49 = add i64 %48, %36
  store i64 %49, i64* %47, align 8, !tbaa !2
  %50 = add i64 %17, 1
  %51 = icmp ult i64 %50, 5
  br i1 %51, label %16, label %93

; <label>:52:                                     ; preds = %14, %90
  %53 = phi i64 [ %91, %90 ], [ %6, %14 ]
  %54 = sub i64 %53, %0
  %55 = mul i64 %54, %1
  %56 = add i64 %55, %3
  %57 = icmp ugt i64 %56, 32
  br i1 %57, label %93, label %58

; <label>:58:                                     ; preds = %52
  %59 = load i64, i64* %10, align 8, !tbaa !2
  %60 = icmp ugt i64 %54, 1
  br i1 %60, label %61, label %70

; <label>:61:                                     ; preds = %58
  br label %62

; <label>:62:                                     ; preds = %61, %62
  %63 = phi i64 [ %68, %62 ], [ %59, %61 ]
  %64 = phi i64 [ %67, %62 ], [ 1, %61 ]
  %65 = add i64 %64, %59
  %66 = mul i64 %65, %63
  %67 = add nuw nsw i64 %64, 1
  %68 = udiv i64 %66, %67
  %69 = icmp eq i64 %67, %54
  br i1 %69, label %70, label %62

; <label>:70:                                     ; preds = %62, %58
  %71 = phi i64 [ %59, %58 ], [ %68, %62 ]
  %72 = mul i64 %71, %2
  %73 = icmp ult i64 %11, %56
  br i1 %73, label %74, label %79

; <label>:74:                                     ; preds = %70
  %75 = trunc i64 %56 to i32
  %76 = getelementptr inbounds [33 x i64], [33 x i64]* @unrooted, i32 0, i32 %75
  %77 = load i64, i64* %76, align 8, !tbaa !2
  %78 = add i64 %77, %72
  store i64 %78, i64* %76, align 8, !tbaa !2
  br label %79

; <label>:79:                                     ; preds = %74, %70
  %80 = icmp eq i64 %53, 4
  br i1 %80, label %93, label %81

; <label>:81:                                     ; preds = %79
  %82 = trunc i64 %56 to i32
  %83 = getelementptr inbounds [33 x i64], [33 x i64]* @rooted, i32 0, i32 %82
  %84 = load i64, i64* %83, align 8, !tbaa !2
  %85 = add i64 %84, %72
  store i64 %85, i64* %83, align 8, !tbaa !2
  br label %86

; <label>:86:                                     ; preds = %81, %86
  %87 = phi i64 [ %12, %81 ], [ %88, %86 ]
  tail call void @tree(i64 %53, i64 %87, i64 %72, i64 %56, i64 %4)
  %88 = add i64 %87, -1
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %90, label %86

; <label>:90:                                     ; preds = %86
  %91 = add i64 %53, 1
  %92 = icmp ult i64 %91, 5
  br i1 %92, label %52, label %93

; <label>:93:                                     ; preds = %52, %79, %90, %16, %43, %45, %5
  ret void
}

; Function Attrs: norecurse nounwind
define hidden void @bicenter(i32) local_unnamed_addr #2 {
  %2 = and i32 %0, 1
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %14

; <label>:4:                                      ; preds = %1
  %5 = sdiv i32 %0, 2
  %6 = getelementptr inbounds [33 x i64], [33 x i64]* @rooted, i32 0, i32 %5
  %7 = load i64, i64* %6, align 8, !tbaa !2
  %8 = add i64 %7, 1
  %9 = mul i64 %8, %7
  %10 = lshr i64 %9, 1
  %11 = getelementptr inbounds [33 x i64], [33 x i64]* @unrooted, i32 0, i32 %0
  %12 = load i64, i64* %11, align 8, !tbaa !2
  %13 = add i64 %10, %12
  store i64 %13, i64* %11, align 8, !tbaa !2
  br label %14

; <label>:14:                                     ; preds = %1, %4
  ret void
}

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #1 {
  br label %1

; <label>:1:                                      ; preds = %19, %0
  %2 = phi i64 [ 1, %0 ], [ %22, %19 ]
  tail call void @tree(i64 0, i64 %2, i64 1, i64 1, i64 %2)
  %3 = trunc i64 %2 to i32
  %4 = and i32 %3, 1
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6:                                      ; preds = %1
  %7 = getelementptr inbounds [33 x i64], [33 x i64]* @unrooted, i32 0, i32 %3
  %8 = load i64, i64* %7, align 8, !tbaa !2
  br label %19

; <label>:9:                                      ; preds = %1
  %10 = lshr i32 %3, 1
  %11 = getelementptr inbounds [33 x i64], [33 x i64]* @rooted, i32 0, i32 %10
  %12 = load i64, i64* %11, align 8, !tbaa !2
  %13 = add i64 %12, 1
  %14 = mul i64 %13, %12
  %15 = lshr i64 %14, 1
  %16 = getelementptr inbounds [33 x i64], [33 x i64]* @unrooted, i32 0, i32 %3
  %17 = load i64, i64* %16, align 8, !tbaa !2
  %18 = add i64 %15, %17
  store i64 %18, i64* %16, align 8, !tbaa !2
  br label %19

; <label>:19:                                     ; preds = %6, %9
  %20 = phi i64 [ %8, %6 ], [ %18, %9 ]
  %21 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 %2, i64 %20)
  %22 = add nuw nsw i64 %2, 1
  %23 = icmp eq i64 %22, 33
  br i1 %23, label %24, label %1

; <label>:24:                                     ; preds = %19
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
