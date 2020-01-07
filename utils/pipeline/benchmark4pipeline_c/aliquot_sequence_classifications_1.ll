; ModuleID = 'benchmark4pipeline_c/aliquot_sequence_classifications_1.c'
source_filename = "benchmark4pipeline_c/aliquot_sequence_classifications_1.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [38 x i8] c"\0AInteger : %llu, Type : %s, Series : \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"%llu, \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%llu\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"Terminating\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"Perfect\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"Amicable\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Aspiring\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"Sociable\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"Cyclic\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"Non-Terminating\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"Usage : %s <positive integer>\00", align 1

; Function Attrs: norecurse nounwind readnone
define hidden i64 @bruteForceProperDivisorSum(i64) local_unnamed_addr #0 {
  %2 = add i64 %0, 1
  %3 = lshr i64 %2, 1
  %4 = icmp ugt i64 %2, 3
  br i1 %4, label %5, label %17

; <label>:5:                                      ; preds = %1
  br label %6

; <label>:6:                                      ; preds = %5, %6
  %7 = phi i64 [ %14, %6 ], [ 0, %5 ]
  %8 = phi i64 [ %15, %6 ], [ 1, %5 ]
  %9 = urem i64 %0, %8
  %10 = icmp ne i64 %9, 0
  %11 = icmp eq i64 %8, %0
  %12 = or i1 %11, %10
  %13 = select i1 %12, i64 0, i64 %8
  %14 = add i64 %13, %7
  %15 = add nuw nsw i64 %8, 1
  %16 = icmp ult i64 %15, %3
  br i1 %16, label %6, label %17

; <label>:17:                                     ; preds = %6, %1
  %18 = phi i64 [ 0, %1 ], [ %14, %6 ]
  ret i64 %18
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
define hidden void @printSeries(i64* nocapture readonly, i32, i8*) local_unnamed_addr #2 {
  %4 = load i64, i64* %0, align 8, !tbaa !2
  %5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %4, i8* %2)
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %1, 1
  %8 = load i64, i64* %0, align 8, !tbaa !2
  br i1 %7, label %9, label %18

; <label>:9:                                      ; preds = %3
  br label %10

; <label>:10:                                     ; preds = %9, %10
  %11 = phi i64 [ %16, %10 ], [ %8, %9 ]
  %12 = phi i32 [ %14, %10 ], [ 0, %9 ]
  %13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %11)
  %14 = add nuw nsw i32 %12, 1
  %15 = getelementptr inbounds i64, i64* %0, i32 %14
  %16 = load i64, i64* %15, align 8, !tbaa !2
  %17 = icmp eq i32 %14, %6
  br i1 %17, label %18, label %10

; <label>:18:                                     ; preds = %10, %3
  %19 = phi i64 [ %8, %3 ], [ %16, %10 ]
  %20 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %19)
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden void @aliquotClassifier(i64) local_unnamed_addr #2 {
  %2 = alloca [16 x i64], align 16
  %3 = bitcast [16 x i64]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %3) #5
  %4 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 0
  store i64 %0, i64* %4, align 16, !tbaa !2
  br label %5

; <label>:5:                                      ; preds = %1, %83
  %6 = phi i64 [ %0, %1 ], [ %22, %83 ]
  %7 = phi i32 [ 1, %1 ], [ %84, %83 ]
  %8 = add i64 %6, 1
  %9 = lshr i64 %8, 1
  %10 = icmp ugt i64 %8, 3
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %5
  br label %14

; <label>:12:                                     ; preds = %5
  %13 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %7
  store i64 0, i64* %13, align 8, !tbaa !2
  br label %44

; <label>:14:                                     ; preds = %11, %14
  %15 = phi i64 [ %22, %14 ], [ 0, %11 ]
  %16 = phi i64 [ %23, %14 ], [ 1, %11 ]
  %17 = urem i64 %6, %16
  %18 = icmp ne i64 %17, 0
  %19 = icmp eq i64 %16, %6
  %20 = or i1 %19, %18
  %21 = select i1 %20, i64 0, i64 %16
  %22 = add i64 %21, %15
  %23 = add nuw nsw i64 %16, 1
  %24 = icmp ult i64 %23, %9
  br i1 %24, label %14, label %25

; <label>:25:                                     ; preds = %14
  %26 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %7
  store i64 %22, i64* %26, align 8, !tbaa !2
  %27 = icmp eq i64 %22, 0
  %28 = icmp eq i64 %22, %0
  %29 = or i1 %27, %28
  %30 = xor i1 %29, true
  %31 = icmp ne i64 %22, %6
  %32 = and i1 %31, %30
  br i1 %32, label %59, label %33

; <label>:33:                                     ; preds = %25
  br i1 %27, label %44, label %34

; <label>:34:                                     ; preds = %33
  %35 = icmp eq i32 %7, 1
  %36 = and i1 %35, %28
  br i1 %36, label %44, label %37

; <label>:37:                                     ; preds = %34
  %38 = icmp eq i32 %7, 2
  %39 = and i1 %38, %28
  br i1 %39, label %44, label %40

; <label>:40:                                     ; preds = %37
  %41 = icmp eq i64 %22, %6
  %42 = select i1 %28, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0)
  %43 = select i1 %41, i8* %42, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0)
  br label %44

; <label>:44:                                     ; preds = %12, %40, %34, %37, %33
  %45 = phi i32 [ %7, %33 ], [ 1, %34 ], [ 2, %37 ], [ %7, %40 ], [ %7, %12 ]
  %46 = phi i8* [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), %33 ], [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), %34 ], [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0), %37 ], [ %43, %40 ], [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), %12 ]
  %47 = load i64, i64* %4, align 16, !tbaa !2
  %48 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %47, i8* %46) #5
  br label %49

; <label>:49:                                     ; preds = %49, %44
  %50 = phi i64 [ %47, %44 ], [ %55, %49 ]
  %51 = phi i32 [ 0, %44 ], [ %53, %49 ]
  %52 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %50) #5
  %53 = add nuw nsw i32 %51, 1
  %54 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %53
  %55 = load i64, i64* %54, align 8, !tbaa !2
  %56 = icmp eq i32 %53, %45
  br i1 %56, label %57, label %49

; <label>:57:                                     ; preds = %49
  %58 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %55) #5
  br label %99

; <label>:59:                                     ; preds = %25
  %60 = icmp ugt i32 %7, 1
  br i1 %60, label %61, label %83

; <label>:61:                                     ; preds = %59
  br label %64

; <label>:62:                                     ; preds = %64
  %63 = icmp ult i32 %69, %7
  br i1 %63, label %64, label %83

; <label>:64:                                     ; preds = %61, %62
  %65 = phi i32 [ %69, %62 ], [ 1, %61 ]
  %66 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %65
  %67 = load i64, i64* %66, align 8, !tbaa !2
  %68 = icmp eq i64 %67, %22
  %69 = add nuw nsw i32 %65, 1
  br i1 %68, label %70, label %62

; <label>:70:                                     ; preds = %64
  %71 = load i64, i64* %4, align 16, !tbaa !2
  %72 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %71, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0)) #5
  br label %73

; <label>:73:                                     ; preds = %73, %70
  %74 = phi i64 [ %71, %70 ], [ %79, %73 ]
  %75 = phi i32 [ 0, %70 ], [ %77, %73 ]
  %76 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %74) #5
  %77 = add nuw nsw i32 %75, 1
  %78 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %77
  %79 = load i64, i64* %78, align 8, !tbaa !2
  %80 = icmp eq i32 %77, %7
  br i1 %80, label %81, label %73

; <label>:81:                                     ; preds = %73
  %82 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %79) #5
  br label %99

; <label>:83:                                     ; preds = %62, %59
  %84 = add nuw nsw i32 %7, 1
  %85 = icmp ult i32 %84, 16
  br i1 %85, label %5, label %86

; <label>:86:                                     ; preds = %83
  %87 = load i64, i64* %4, align 16, !tbaa !2
  %88 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %87, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i32 0, i32 0)) #5
  br label %89

; <label>:89:                                     ; preds = %89, %86
  %90 = phi i64 [ %87, %86 ], [ %95, %89 ]
  %91 = phi i32 [ 0, %86 ], [ %93, %89 ]
  %92 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %90) #5
  %93 = add nuw nsw i32 %91, 1
  %94 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %93
  %95 = load i64, i64* %94, align 8, !tbaa !2
  %96 = icmp eq i32 %93, %84
  br i1 %96, label %97, label %89

; <label>:97:                                     ; preds = %89
  %98 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %95) #5
  br label %99

; <label>:99:                                     ; preds = %97, %81, %57
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %3) #5
  ret void
}

; Function Attrs: nounwind
define hidden void @processFile(i8* nocapture readonly) local_unnamed_addr #2 {
  %2 = alloca [21 x i8], align 16
  %3 = tail call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  %4 = getelementptr inbounds [21 x i8], [21 x i8]* %2, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %4) #5
  %5 = call i8* @fgets(i8* nonnull %4, i32 21, %struct._IO_FILE* %3)
  %6 = icmp eq i8* %5, null
  br i1 %6, label %12, label %7

; <label>:7:                                      ; preds = %1
  br label %8

; <label>:8:                                      ; preds = %7, %8
  %9 = call i64 @strtoull(i8* nocapture nonnull %4, i8** null, i32 10) #5
  call void @aliquotClassifier(i64 %9)
  %10 = call i8* @fgets(i8* nonnull %4, i32 21, %struct._IO_FILE* %3)
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %8

; <label>:12:                                     ; preds = %8, %1
  %13 = call i32 @fclose(%struct._IO_FILE* %3)
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %4) #5
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind
declare i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @strtoull(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #2 {
  %3 = alloca [21 x i8], align 16
  %4 = icmp eq i32 %0, 2
  br i1 %4, label %8, label %5

; <label>:5:                                      ; preds = %2
  %6 = load i8*, i8** %1, align 4, !tbaa !6
  %7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i32 0, i32 0), i8* %6)
  br label %27

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds i8*, i8** %1, i32 1
  %10 = load i8*, i8** %9, align 4, !tbaa !6
  %11 = tail call i8* @strchr(i8* %10, i32 46) #6
  %12 = icmp eq i8* %11, null
  br i1 %12, label %25, label %13

; <label>:13:                                     ; preds = %8
  %14 = tail call %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0)) #5
  %15 = getelementptr inbounds [21 x i8], [21 x i8]* %3, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %15) #5
  %16 = call i8* @fgets(i8* nonnull %15, i32 21, %struct._IO_FILE* %14) #5
  %17 = icmp eq i8* %16, null
  br i1 %17, label %23, label %18

; <label>:18:                                     ; preds = %13
  br label %19

; <label>:19:                                     ; preds = %18, %19
  %20 = call i64 @strtoull(i8* nocapture nonnull %15, i8** null, i32 10) #5
  call void @aliquotClassifier(i64 %20) #5
  %21 = call i8* @fgets(i8* nonnull %15, i32 21, %struct._IO_FILE* %14) #5
  %22 = icmp eq i8* %21, null
  br i1 %22, label %23, label %19

; <label>:23:                                     ; preds = %19, %13
  %24 = call i32 @fclose(%struct._IO_FILE* %14) #5
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %15) #5
  br label %27

; <label>:25:                                     ; preds = %8
  %26 = tail call i64 @strtoull(i8* nocapture %10, i8** null, i32 10) #5
  tail call void @aliquotClassifier(i64 %26)
  br label %27

; <label>:27:                                     ; preds = %23, %25, %5
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) local_unnamed_addr #4

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
