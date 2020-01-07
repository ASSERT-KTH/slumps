; ModuleID = 'benchmark4pipeline_c/aliquot_sequence_classifications_2.c'
source_filename = "benchmark4pipeline_c/aliquot_sequence_classifications_2.c"
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
define hidden i64 @raiseTo(i64, i64) local_unnamed_addr #0 {
  %3 = icmp eq i64 %1, 0
  br i1 %3, label %11, label %4

; <label>:4:                                      ; preds = %2
  br label %5

; <label>:5:                                      ; preds = %4, %5
  %6 = phi i64 [ %9, %5 ], [ 0, %4 ]
  %7 = phi i64 [ %8, %5 ], [ 1, %4 ]
  %8 = mul i64 %7, %0
  %9 = add nuw i64 %6, 1
  %10 = icmp eq i64 %9, %1
  br i1 %10, label %11, label %5

; <label>:11:                                     ; preds = %5, %2
  %12 = phi i64 [ 1, %2 ], [ %8, %5 ]
  ret i64 %12
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind readnone
define hidden i64 @properDivisorSum(i64) local_unnamed_addr #0 {
  %2 = and i64 %0, 1
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %26

; <label>:4:                                      ; preds = %1
  br label %5

; <label>:5:                                      ; preds = %4, %5
  %6 = phi i64 [ %8, %5 ], [ 0, %4 ]
  %7 = phi i64 [ %9, %5 ], [ %0, %4 ]
  %8 = add i64 %6, 1
  %9 = lshr i64 %7, 1
  %10 = and i64 %7, 2
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %5, label %12

; <label>:12:                                     ; preds = %5
  %13 = icmp eq i64 %8, 0
  br i1 %13, label %26, label %14

; <label>:14:                                     ; preds = %12
  %15 = add i64 %6, 2
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %26, label %17

; <label>:17:                                     ; preds = %14
  br label %18

; <label>:18:                                     ; preds = %17, %18
  %19 = phi i64 [ %22, %18 ], [ 0, %17 ]
  %20 = phi i64 [ %21, %18 ], [ 1, %17 ]
  %21 = shl i64 %20, 1
  %22 = add nuw i64 %19, 1
  %23 = icmp eq i64 %22, %15
  br i1 %23, label %24, label %18

; <label>:24:                                     ; preds = %18
  %25 = add i64 %21, -1
  br label %26

; <label>:26:                                     ; preds = %1, %14, %24, %12
  %27 = phi i64 [ %9, %12 ], [ %9, %24 ], [ %9, %14 ], [ %0, %1 ]
  %28 = phi i64 [ 1, %12 ], [ %25, %24 ], [ 0, %14 ], [ 1, %1 ]
  %29 = icmp ult i64 %27, 9
  br i1 %29, label %71, label %30

; <label>:30:                                     ; preds = %26
  br label %31

; <label>:31:                                     ; preds = %30, %65
  %32 = phi i64 [ %68, %65 ], [ 3, %30 ]
  %33 = phi i64 [ %66, %65 ], [ %27, %30 ]
  %34 = phi i64 [ %67, %65 ], [ %28, %30 ]
  %35 = urem i64 %33, %32
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %37, label %65

; <label>:37:                                     ; preds = %31
  br label %38

; <label>:38:                                     ; preds = %37, %38
  %39 = phi i64 [ %41, %38 ], [ 0, %37 ]
  %40 = phi i64 [ %42, %38 ], [ %33, %37 ]
  %41 = add i64 %39, 1
  %42 = udiv i64 %40, %32
  %43 = urem i64 %42, %32
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %38, label %45

; <label>:45:                                     ; preds = %38
  switch i64 %39, label %49 [
    i64 0, label %46
    i64 -1, label %65
  ]

; <label>:46:                                     ; preds = %45
  %47 = add i64 %32, 1
  %48 = mul i64 %47, %34
  br label %65

; <label>:49:                                     ; preds = %45
  %50 = add i64 %39, 2
  %51 = icmp eq i64 %50, 0
  br i1 %51, label %59, label %52

; <label>:52:                                     ; preds = %49
  br label %53

; <label>:53:                                     ; preds = %52, %53
  %54 = phi i64 [ %57, %53 ], [ 0, %52 ]
  %55 = phi i64 [ %56, %53 ], [ 1, %52 ]
  %56 = mul i64 %55, %32
  %57 = add nuw i64 %54, 1
  %58 = icmp eq i64 %57, %50
  br i1 %58, label %59, label %53

; <label>:59:                                     ; preds = %53, %49
  %60 = phi i64 [ 1, %49 ], [ %56, %53 ]
  %61 = add i64 %60, -1
  %62 = add i64 %32, -1
  %63 = udiv i64 %61, %62
  %64 = mul i64 %63, %34
  br label %65

; <label>:65:                                     ; preds = %31, %45, %46, %59
  %66 = phi i64 [ %42, %46 ], [ %42, %59 ], [ %42, %45 ], [ %33, %31 ]
  %67 = phi i64 [ %48, %46 ], [ %64, %59 ], [ %34, %45 ], [ %34, %31 ]
  %68 = add i64 %32, 2
  %69 = mul i64 %68, %68
  %70 = icmp ugt i64 %69, %66
  br i1 %70, label %71, label %31

; <label>:71:                                     ; preds = %65, %26
  %72 = phi i64 [ %28, %26 ], [ %67, %65 ]
  %73 = phi i64 [ %27, %26 ], [ %66, %65 ]
  %74 = icmp ugt i64 %73, 2
  %75 = add i64 %73, 1
  %76 = select i1 %74, i64 %75, i64 1
  %77 = mul i64 %76, %72
  %78 = sub i64 %77, %0
  ret i64 %78
}

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

; <label>:5:                                      ; preds = %1, %141
  %6 = phi i64 [ %0, %1 ], [ %84, %141 ]
  %7 = phi i32 [ 1, %1 ], [ %142, %141 ]
  %8 = and i64 %6, 1
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %32

; <label>:10:                                     ; preds = %5
  br label %11

; <label>:11:                                     ; preds = %10, %11
  %12 = phi i64 [ %14, %11 ], [ 0, %10 ]
  %13 = phi i64 [ %15, %11 ], [ %6, %10 ]
  %14 = add i64 %12, 1
  %15 = lshr i64 %13, 1
  %16 = and i64 %13, 2
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %11, label %18

; <label>:18:                                     ; preds = %11
  %19 = icmp eq i64 %14, 0
  br i1 %19, label %32, label %20

; <label>:20:                                     ; preds = %18
  %21 = add i64 %12, 2
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %32, label %23

; <label>:23:                                     ; preds = %20
  br label %24

; <label>:24:                                     ; preds = %23, %24
  %25 = phi i64 [ %28, %24 ], [ 0, %23 ]
  %26 = phi i64 [ %27, %24 ], [ 1, %23 ]
  %27 = shl i64 %26, 1
  %28 = add nuw i64 %25, 1
  %29 = icmp eq i64 %28, %21
  br i1 %29, label %30, label %24

; <label>:30:                                     ; preds = %24
  %31 = add i64 %27, -1
  br label %32

; <label>:32:                                     ; preds = %30, %20, %18, %5
  %33 = phi i64 [ %15, %18 ], [ %15, %30 ], [ %15, %20 ], [ %6, %5 ]
  %34 = phi i64 [ 1, %18 ], [ %31, %30 ], [ 0, %20 ], [ 1, %5 ]
  %35 = icmp ult i64 %33, 9
  br i1 %35, label %77, label %36

; <label>:36:                                     ; preds = %32
  br label %37

; <label>:37:                                     ; preds = %36, %71
  %38 = phi i64 [ %74, %71 ], [ 3, %36 ]
  %39 = phi i64 [ %72, %71 ], [ %33, %36 ]
  %40 = phi i64 [ %73, %71 ], [ %34, %36 ]
  %41 = urem i64 %39, %38
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %43, label %71

; <label>:43:                                     ; preds = %37
  br label %44

; <label>:44:                                     ; preds = %43, %44
  %45 = phi i64 [ %47, %44 ], [ 0, %43 ]
  %46 = phi i64 [ %48, %44 ], [ %39, %43 ]
  %47 = add i64 %45, 1
  %48 = udiv i64 %46, %38
  %49 = urem i64 %48, %38
  %50 = icmp eq i64 %49, 0
  br i1 %50, label %44, label %51

; <label>:51:                                     ; preds = %44
  switch i64 %45, label %55 [
    i64 0, label %52
    i64 -1, label %71
  ]

; <label>:52:                                     ; preds = %51
  %53 = add i64 %38, 1
  %54 = mul i64 %40, %53
  br label %71

; <label>:55:                                     ; preds = %51
  %56 = add i64 %45, 2
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %65, label %58

; <label>:58:                                     ; preds = %55
  br label %59

; <label>:59:                                     ; preds = %58, %59
  %60 = phi i64 [ %63, %59 ], [ 0, %58 ]
  %61 = phi i64 [ %62, %59 ], [ 1, %58 ]
  %62 = mul i64 %61, %38
  %63 = add nuw i64 %60, 1
  %64 = icmp eq i64 %63, %56
  br i1 %64, label %65, label %59

; <label>:65:                                     ; preds = %59, %55
  %66 = phi i64 [ 1, %55 ], [ %62, %59 ]
  %67 = add i64 %66, -1
  %68 = add i64 %38, -1
  %69 = udiv i64 %67, %68
  %70 = mul i64 %69, %40
  br label %71

; <label>:71:                                     ; preds = %65, %52, %51, %37
  %72 = phi i64 [ %48, %52 ], [ %48, %65 ], [ %48, %51 ], [ %39, %37 ]
  %73 = phi i64 [ %54, %52 ], [ %70, %65 ], [ %40, %51 ], [ %40, %37 ]
  %74 = add i64 %38, 2
  %75 = mul i64 %74, %74
  %76 = icmp ugt i64 %75, %72
  br i1 %76, label %77, label %37

; <label>:77:                                     ; preds = %71, %32
  %78 = phi i64 [ %34, %32 ], [ %73, %71 ]
  %79 = phi i64 [ %33, %32 ], [ %72, %71 ]
  %80 = icmp ugt i64 %79, 2
  %81 = add i64 %79, 1
  %82 = select i1 %80, i64 %81, i64 1
  %83 = mul i64 %82, %78
  %84 = sub i64 %83, %6
  %85 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %7
  store i64 %84, i64* %85, align 8, !tbaa !2
  %86 = icmp eq i64 %84, 0
  %87 = icmp eq i64 %84, %0
  %88 = or i1 %86, %87
  %89 = xor i1 %88, true
  %90 = icmp ne i64 %84, %6
  %91 = and i1 %90, %89
  br i1 %91, label %117, label %92

; <label>:92:                                     ; preds = %77
  br i1 %86, label %103, label %93

; <label>:93:                                     ; preds = %92
  %94 = icmp eq i32 %7, 1
  %95 = and i1 %94, %87
  br i1 %95, label %103, label %96

; <label>:96:                                     ; preds = %93
  %97 = icmp eq i32 %7, 2
  %98 = and i1 %97, %87
  br i1 %98, label %103, label %99

; <label>:99:                                     ; preds = %96
  %100 = icmp eq i64 %84, %6
  %101 = select i1 %87, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0)
  %102 = select i1 %100, i8* %101, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0)
  br label %103

; <label>:103:                                    ; preds = %99, %93, %96, %92
  %104 = phi i8* [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), %92 ], [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), %93 ], [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0), %96 ], [ %102, %99 ]
  %105 = load i64, i64* %4, align 16, !tbaa !2
  %106 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %105, i8* %104) #5
  br label %107

; <label>:107:                                    ; preds = %107, %103
  %108 = phi i64 [ %105, %103 ], [ %113, %107 ]
  %109 = phi i32 [ 0, %103 ], [ %111, %107 ]
  %110 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %108) #5
  %111 = add nuw nsw i32 %109, 1
  %112 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %111
  %113 = load i64, i64* %112, align 8, !tbaa !2
  %114 = icmp eq i32 %111, %7
  br i1 %114, label %115, label %107

; <label>:115:                                    ; preds = %107
  %116 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %113) #5
  br label %157

; <label>:117:                                    ; preds = %77
  %118 = icmp ugt i32 %7, 1
  br i1 %118, label %119, label %141

; <label>:119:                                    ; preds = %117
  br label %122

; <label>:120:                                    ; preds = %122
  %121 = icmp ult i32 %127, %7
  br i1 %121, label %122, label %141

; <label>:122:                                    ; preds = %119, %120
  %123 = phi i32 [ %127, %120 ], [ 1, %119 ]
  %124 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %123
  %125 = load i64, i64* %124, align 8, !tbaa !2
  %126 = icmp eq i64 %125, %84
  %127 = add nuw nsw i32 %123, 1
  br i1 %126, label %128, label %120

; <label>:128:                                    ; preds = %122
  %129 = load i64, i64* %4, align 16, !tbaa !2
  %130 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %129, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0)) #5
  br label %131

; <label>:131:                                    ; preds = %131, %128
  %132 = phi i64 [ %129, %128 ], [ %137, %131 ]
  %133 = phi i32 [ 0, %128 ], [ %135, %131 ]
  %134 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %132) #5
  %135 = add nuw nsw i32 %133, 1
  %136 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %135
  %137 = load i64, i64* %136, align 8, !tbaa !2
  %138 = icmp eq i32 %135, %7
  br i1 %138, label %139, label %131

; <label>:139:                                    ; preds = %131
  %140 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %137) #5
  br label %157

; <label>:141:                                    ; preds = %120, %117
  %142 = add nuw nsw i32 %7, 1
  %143 = icmp ult i32 %142, 16
  br i1 %143, label %5, label %144

; <label>:144:                                    ; preds = %141
  %145 = load i64, i64* %4, align 16, !tbaa !2
  %146 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %145, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i32 0, i32 0)) #5
  br label %147

; <label>:147:                                    ; preds = %147, %144
  %148 = phi i64 [ %145, %144 ], [ %153, %147 ]
  %149 = phi i32 [ 0, %144 ], [ %151, %147 ]
  %150 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %148) #5
  %151 = add nuw nsw i32 %149, 1
  %152 = getelementptr inbounds [16 x i64], [16 x i64]* %2, i32 0, i32 %151
  %153 = load i64, i64* %152, align 8, !tbaa !2
  %154 = icmp eq i32 %151, %142
  br i1 %154, label %155, label %147

; <label>:155:                                    ; preds = %147
  %156 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %153) #5
  br label %157

; <label>:157:                                    ; preds = %155, %139, %115
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
