; ModuleID = 'benchmark4pipeline_c/pascal_matrix_generation.c'
source_filename = "benchmark4pipeline_c/pascal_matrix_generation.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@.str.1 = private unnamed_addr constant [6 x i8] c"%4d%c\00", align 1
@str = private unnamed_addr constant [28 x i8] c"=== Pascal upper matrix ===\00"
@str.4 = private unnamed_addr constant [28 x i8] c"=== Pascal lower matrix ===\00"
@str.5 = private unnamed_addr constant [32 x i8] c"=== Pascal symmetric matrix ===\00"

; Function Attrs: norecurse nounwind
define hidden void @pascal_low(i32** nocapture readonly, i32) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %34

; <label>:4:                                      ; preds = %2
  br label %5

; <label>:5:                                      ; preds = %4, %31
  %6 = phi i32 [ %32, %31 ], [ 0, %4 ]
  %7 = getelementptr inbounds i32*, i32** %0, i32 %6
  %8 = add nsw i32 %6, -1
  %9 = getelementptr inbounds i32*, i32** %0, i32 %8
  %10 = load i32*, i32** %7, align 4, !tbaa !2
  br label %11

; <label>:11:                                     ; preds = %26, %5
  %12 = phi i32 [ 0, %5 ], [ %29, %26 ]
  %13 = icmp ult i32 %6, %12
  br i1 %13, label %26, label %14

; <label>:14:                                     ; preds = %11
  %15 = icmp eq i32 %6, %12
  %16 = icmp eq i32 %12, 0
  %17 = or i1 %15, %16
  br i1 %17, label %26, label %18

; <label>:18:                                     ; preds = %14
  %19 = load i32*, i32** %9, align 4, !tbaa !2
  %20 = add nsw i32 %12, -1
  %21 = getelementptr inbounds i32, i32* %19, i32 %20
  %22 = load i32, i32* %21, align 4, !tbaa !6
  %23 = getelementptr inbounds i32, i32* %19, i32 %12
  %24 = load i32, i32* %23, align 4, !tbaa !6
  %25 = add nsw i32 %24, %22
  br label %26

; <label>:26:                                     ; preds = %11, %14, %18
  %27 = phi i32 [ %25, %18 ], [ 1, %14 ], [ 0, %11 ]
  %28 = getelementptr inbounds i32, i32* %10, i32 %12
  store i32 %27, i32* %28, align 4, !tbaa !6
  %29 = add nuw nsw i32 %12, 1
  %30 = icmp eq i32 %29, %1
  br i1 %30, label %31, label %11

; <label>:31:                                     ; preds = %26
  %32 = add nuw nsw i32 %6, 1
  %33 = icmp eq i32 %32, %1
  br i1 %33, label %34, label %5

; <label>:34:                                     ; preds = %31, %2
  ret void
}

; Function Attrs: norecurse nounwind
define hidden void @pascal_upp(i32** nocapture readonly, i32) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %48

; <label>:4:                                      ; preds = %2
  br label %5

; <label>:5:                                      ; preds = %4, %38
  %6 = phi i32 [ %39, %38 ], [ 0, %4 ]
  %7 = getelementptr inbounds i32*, i32** %0, i32 %6
  %8 = icmp eq i32 %6, 0
  %9 = add nsw i32 %6, -1
  %10 = getelementptr inbounds i32*, i32** %0, i32 %9
  br i1 %8, label %46, label %11

; <label>:11:                                     ; preds = %5
  br label %12

; <label>:12:                                     ; preds = %11, %33
  %13 = phi i32 [ %36, %33 ], [ 0, %11 ]
  %14 = icmp ugt i32 %6, %13
  br i1 %14, label %30, label %15

; <label>:15:                                     ; preds = %12
  %16 = icmp eq i32 %6, %13
  br i1 %16, label %27, label %17

; <label>:17:                                     ; preds = %15
  %18 = load i32*, i32** %10, align 4, !tbaa !2
  %19 = add nsw i32 %13, -1
  %20 = getelementptr inbounds i32, i32* %18, i32 %19
  %21 = load i32, i32* %20, align 4, !tbaa !6
  %22 = load i32*, i32** %7, align 4, !tbaa !2
  %23 = getelementptr inbounds i32, i32* %22, i32 %19
  %24 = load i32, i32* %23, align 4, !tbaa !6
  %25 = add nsw i32 %24, %21
  %26 = getelementptr inbounds i32, i32* %22, i32 %13
  br label %33

; <label>:27:                                     ; preds = %15
  %28 = load i32*, i32** %7, align 4, !tbaa !2
  %29 = getelementptr inbounds i32, i32* %28, i32 %6
  br label %33

; <label>:30:                                     ; preds = %12
  %31 = load i32*, i32** %7, align 4, !tbaa !2
  %32 = getelementptr inbounds i32, i32* %31, i32 %13
  br label %33

; <label>:33:                                     ; preds = %30, %27, %17
  %34 = phi i32* [ %32, %30 ], [ %29, %27 ], [ %26, %17 ]
  %35 = phi i32 [ 0, %30 ], [ 1, %27 ], [ %25, %17 ]
  store i32 %35, i32* %34, align 4, !tbaa !6
  %36 = add nuw nsw i32 %13, 1
  %37 = icmp eq i32 %36, %1
  br i1 %37, label %38, label %12

; <label>:38:                                     ; preds = %33, %41
  %39 = add nuw nsw i32 %6, 1
  %40 = icmp eq i32 %39, %1
  br i1 %40, label %48, label %5

; <label>:41:                                     ; preds = %41, %46
  %42 = phi i32 [ 0, %46 ], [ %44, %41 ]
  %43 = getelementptr inbounds i32, i32* %47, i32 %42
  store i32 1, i32* %43, align 4, !tbaa !6
  %44 = add nuw nsw i32 %42, 1
  %45 = icmp eq i32 %44, %1
  br i1 %45, label %38, label %41

; <label>:46:                                     ; preds = %5
  %47 = load i32*, i32** %7, align 4, !tbaa !2
  br label %41

; <label>:48:                                     ; preds = %38, %2
  ret void
}

; Function Attrs: norecurse nounwind
define hidden void @pascal_sym(i32** nocapture readonly, i32) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %40

; <label>:4:                                      ; preds = %2
  br label %5

; <label>:5:                                      ; preds = %4, %30
  %6 = phi i32 [ %31, %30 ], [ 0, %4 ]
  %7 = icmp eq i32 %6, 0
  %8 = getelementptr inbounds i32*, i32** %0, i32 %6
  %9 = add nsw i32 %6, -1
  %10 = getelementptr inbounds i32*, i32** %0, i32 %9
  br i1 %7, label %38, label %11

; <label>:11:                                     ; preds = %5
  br label %12

; <label>:12:                                     ; preds = %11, %27
  %13 = phi i32 [ %28, %27 ], [ 0, %11 ]
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %25, label %15

; <label>:15:                                     ; preds = %12
  %16 = load i32*, i32** %10, align 4, !tbaa !2
  %17 = getelementptr inbounds i32, i32* %16, i32 %13
  %18 = load i32, i32* %17, align 4, !tbaa !6
  %19 = load i32*, i32** %8, align 4, !tbaa !2
  %20 = add nsw i32 %13, -1
  %21 = getelementptr inbounds i32, i32* %19, i32 %20
  %22 = load i32, i32* %21, align 4, !tbaa !6
  %23 = add nsw i32 %22, %18
  %24 = getelementptr inbounds i32, i32* %19, i32 %13
  store i32 %23, i32* %24, align 4, !tbaa !6
  br label %27

; <label>:25:                                     ; preds = %12
  %26 = load i32*, i32** %8, align 4, !tbaa !2
  store i32 1, i32* %26, align 4, !tbaa !6
  br label %27

; <label>:27:                                     ; preds = %25, %15
  %28 = add nuw nsw i32 %13, 1
  %29 = icmp eq i32 %28, %1
  br i1 %29, label %30, label %12

; <label>:30:                                     ; preds = %27, %33
  %31 = add nuw nsw i32 %6, 1
  %32 = icmp eq i32 %31, %1
  br i1 %32, label %40, label %5

; <label>:33:                                     ; preds = %33, %38
  %34 = phi i32 [ 0, %38 ], [ %36, %33 ]
  %35 = getelementptr inbounds i32, i32* %39, i32 %34
  store i32 1, i32* %35, align 4, !tbaa !6
  %36 = add nuw nsw i32 %34, 1
  %37 = icmp eq i32 %36, %1
  br i1 %37, label %30, label %33

; <label>:38:                                     ; preds = %5
  %39 = load i32*, i32** %8, align 4, !tbaa !2
  br label %33

; <label>:40:                                     ; preds = %30, %2
  ret void
}

; Function Attrs: nounwind
define hidden i32 @main(i32, i8** nocapture readnone) local_unnamed_addr #1 {
  %3 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %4 = bitcast i8* %3 to i32**
  %5 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %6 = bitcast i8* %3 to i8**
  store i8* %5, i8** %6, align 4, !tbaa !2
  %7 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %8 = getelementptr inbounds i8, i8* %3, i32 4
  %9 = bitcast i8* %8 to i32**
  %10 = bitcast i8* %8 to i8**
  store i8* %7, i8** %10, align 4, !tbaa !2
  %11 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %12 = getelementptr inbounds i8, i8* %3, i32 8
  %13 = bitcast i8* %12 to i32**
  %14 = bitcast i8* %12 to i8**
  store i8* %11, i8** %14, align 4, !tbaa !2
  %15 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %16 = getelementptr inbounds i8, i8* %3, i32 12
  %17 = bitcast i8* %16 to i32**
  %18 = bitcast i8* %16 to i8**
  store i8* %15, i8** %18, align 4, !tbaa !2
  %19 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %20 = getelementptr inbounds i8, i8* %3, i32 16
  %21 = bitcast i8* %20 to i32**
  %22 = bitcast i8* %20 to i8**
  store i8* %19, i8** %22, align 4, !tbaa !2
  %23 = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @str, i32 0, i32 0))
  %24 = load i32*, i32** %4, align 4, !tbaa !2
  store i32 1, i32* %24, align 4, !tbaa !6
  %25 = getelementptr inbounds i32, i32* %24, i32 1
  store i32 1, i32* %25, align 4, !tbaa !6
  %26 = getelementptr inbounds i32, i32* %24, i32 2
  store i32 1, i32* %26, align 4, !tbaa !6
  %27 = getelementptr inbounds i32, i32* %24, i32 3
  store i32 1, i32* %27, align 4, !tbaa !6
  %28 = getelementptr inbounds i32, i32* %24, i32 4
  store i32 1, i32* %28, align 4, !tbaa !6
  %29 = load i32*, i32** %9, align 4, !tbaa !2
  store i32 0, i32* %29, align 4, !tbaa !6
  %30 = getelementptr inbounds i32, i32* %29, i32 1
  store i32 1, i32* %30, align 4, !tbaa !6
  %31 = getelementptr inbounds i32, i32* %24, i32 1
  %32 = load i32, i32* %31, align 4, !tbaa !6
  %33 = add nsw i32 %32, 1
  %34 = getelementptr inbounds i32, i32* %29, i32 2
  store i32 %33, i32* %34, align 4, !tbaa !6
  %35 = getelementptr inbounds i32, i32* %24, i32 2
  %36 = load i32, i32* %35, align 4, !tbaa !6
  %37 = add nsw i32 %33, %36
  %38 = getelementptr inbounds i32, i32* %29, i32 3
  store i32 %37, i32* %38, align 4, !tbaa !6
  %39 = getelementptr inbounds i32, i32* %24, i32 3
  %40 = load i32, i32* %39, align 4, !tbaa !6
  %41 = add nsw i32 %37, %40
  %42 = getelementptr inbounds i32, i32* %29, i32 4
  store i32 %41, i32* %42, align 4, !tbaa !6
  %43 = load i32*, i32** %13, align 4, !tbaa !2
  store i32 0, i32* %43, align 4, !tbaa !6
  %44 = getelementptr inbounds i32, i32* %43, i32 1
  store i32 0, i32* %44, align 4, !tbaa !6
  %45 = getelementptr inbounds i32, i32* %43, i32 2
  store i32 1, i32* %45, align 4, !tbaa !6
  %46 = getelementptr inbounds i32, i32* %29, i32 2
  %47 = load i32, i32* %46, align 4, !tbaa !6
  %48 = add nsw i32 %47, 1
  %49 = getelementptr inbounds i32, i32* %43, i32 3
  store i32 %48, i32* %49, align 4, !tbaa !6
  %50 = getelementptr inbounds i32, i32* %29, i32 3
  %51 = load i32, i32* %50, align 4, !tbaa !6
  %52 = add nsw i32 %48, %51
  %53 = getelementptr inbounds i32, i32* %43, i32 4
  store i32 %52, i32* %53, align 4, !tbaa !6
  %54 = load i32*, i32** %17, align 4, !tbaa !2
  store i32 0, i32* %54, align 4, !tbaa !6
  %55 = getelementptr inbounds i32, i32* %54, i32 1
  store i32 0, i32* %55, align 4, !tbaa !6
  %56 = getelementptr inbounds i32, i32* %54, i32 2
  store i32 0, i32* %56, align 4, !tbaa !6
  %57 = getelementptr inbounds i32, i32* %54, i32 3
  store i32 1, i32* %57, align 4, !tbaa !6
  %58 = getelementptr inbounds i32, i32* %43, i32 3
  %59 = load i32, i32* %58, align 4, !tbaa !6
  %60 = add nsw i32 %59, 1
  %61 = getelementptr inbounds i32, i32* %54, i32 4
  store i32 %60, i32* %61, align 4, !tbaa !6
  %62 = load i32*, i32** %21, align 4, !tbaa !2
  store i32 0, i32* %62, align 4, !tbaa !6
  %63 = getelementptr inbounds i32, i32* %62, i32 1
  store i32 0, i32* %63, align 4, !tbaa !6
  %64 = getelementptr inbounds i32, i32* %62, i32 2
  store i32 0, i32* %64, align 4, !tbaa !6
  %65 = getelementptr inbounds i32, i32* %62, i32 3
  store i32 0, i32* %65, align 4, !tbaa !6
  %66 = getelementptr inbounds i32, i32* %62, i32 4
  store i32 1, i32* %66, align 4, !tbaa !6
  %67 = load i32, i32* %24, align 4, !tbaa !6
  %68 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %67, i32 32)
  %69 = load i32*, i32** %4, align 4, !tbaa !2
  %70 = getelementptr inbounds i32, i32* %69, i32 1
  %71 = load i32, i32* %70, align 4, !tbaa !6
  %72 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %71, i32 32)
  %73 = getelementptr inbounds i32, i32* %69, i32 2
  %74 = load i32, i32* %73, align 4, !tbaa !6
  %75 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %74, i32 32)
  %76 = load i32*, i32** %4, align 4, !tbaa !2
  %77 = getelementptr inbounds i32, i32* %76, i32 3
  %78 = load i32, i32* %77, align 4, !tbaa !6
  %79 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %78, i32 32)
  %80 = getelementptr inbounds i32, i32* %76, i32 4
  %81 = load i32, i32* %80, align 4, !tbaa !6
  %82 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %81, i32 10)
  %83 = load i32*, i32** %9, align 4, !tbaa !2
  %84 = load i32, i32* %83, align 4, !tbaa !6
  %85 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %84, i32 32)
  %86 = getelementptr inbounds i32, i32* %83, i32 1
  %87 = load i32, i32* %86, align 4, !tbaa !6
  %88 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %87, i32 32)
  %89 = getelementptr inbounds i32, i32* %83, i32 2
  %90 = load i32, i32* %89, align 4, !tbaa !6
  %91 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %90, i32 32)
  %92 = load i32*, i32** %9, align 4, !tbaa !2
  %93 = getelementptr inbounds i32, i32* %92, i32 3
  %94 = load i32, i32* %93, align 4, !tbaa !6
  %95 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %94, i32 32)
  %96 = getelementptr inbounds i32, i32* %92, i32 4
  %97 = load i32, i32* %96, align 4, !tbaa !6
  %98 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %97, i32 10)
  %99 = load i32*, i32** %13, align 4, !tbaa !2
  %100 = load i32, i32* %99, align 4, !tbaa !6
  %101 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %100, i32 32)
  %102 = getelementptr inbounds i32, i32* %99, i32 1
  %103 = load i32, i32* %102, align 4, !tbaa !6
  %104 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %103, i32 32)
  %105 = getelementptr inbounds i32, i32* %99, i32 2
  %106 = load i32, i32* %105, align 4, !tbaa !6
  %107 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %106, i32 32)
  %108 = load i32*, i32** %13, align 4, !tbaa !2
  %109 = getelementptr inbounds i32, i32* %108, i32 3
  %110 = load i32, i32* %109, align 4, !tbaa !6
  %111 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %110, i32 32)
  %112 = getelementptr inbounds i32, i32* %108, i32 4
  %113 = load i32, i32* %112, align 4, !tbaa !6
  %114 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %113, i32 10)
  %115 = load i32*, i32** %17, align 4, !tbaa !2
  %116 = load i32, i32* %115, align 4, !tbaa !6
  %117 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %116, i32 32)
  %118 = getelementptr inbounds i32, i32* %115, i32 1
  %119 = load i32, i32* %118, align 4, !tbaa !6
  %120 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %119, i32 32)
  %121 = getelementptr inbounds i32, i32* %115, i32 2
  %122 = load i32, i32* %121, align 4, !tbaa !6
  %123 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %122, i32 32)
  %124 = load i32*, i32** %17, align 4, !tbaa !2
  %125 = getelementptr inbounds i32, i32* %124, i32 3
  %126 = load i32, i32* %125, align 4, !tbaa !6
  %127 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %126, i32 32)
  %128 = getelementptr inbounds i32, i32* %124, i32 4
  %129 = load i32, i32* %128, align 4, !tbaa !6
  %130 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %129, i32 10)
  %131 = load i32*, i32** %21, align 4, !tbaa !2
  %132 = load i32, i32* %131, align 4, !tbaa !6
  %133 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %132, i32 32)
  %134 = getelementptr inbounds i32, i32* %131, i32 1
  %135 = load i32, i32* %134, align 4, !tbaa !6
  %136 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %135, i32 32)
  %137 = getelementptr inbounds i32, i32* %131, i32 2
  %138 = load i32, i32* %137, align 4, !tbaa !6
  %139 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %138, i32 32)
  %140 = load i32*, i32** %21, align 4, !tbaa !2
  %141 = getelementptr inbounds i32, i32* %140, i32 3
  %142 = load i32, i32* %141, align 4, !tbaa !6
  %143 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %142, i32 32)
  %144 = getelementptr inbounds i32, i32* %140, i32 4
  %145 = load i32, i32* %144, align 4, !tbaa !6
  %146 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %145, i32 10)
  %147 = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @str.4, i32 0, i32 0))
  %148 = load i32*, i32** %4, align 4, !tbaa !2
  store i32 1, i32* %148, align 4, !tbaa !6
  %149 = getelementptr inbounds i32, i32* %148, i32 1
  store i32 0, i32* %149, align 4, !tbaa !6
  %150 = getelementptr inbounds i32, i32* %148, i32 2
  store i32 0, i32* %150, align 4, !tbaa !6
  %151 = getelementptr inbounds i32, i32* %148, i32 3
  store i32 0, i32* %151, align 4, !tbaa !6
  %152 = getelementptr inbounds i32, i32* %148, i32 4
  store i32 0, i32* %152, align 4, !tbaa !6
  %153 = load i32*, i32** %9, align 4, !tbaa !2
  store i32 1, i32* %153, align 4, !tbaa !6
  %154 = getelementptr inbounds i32, i32* %153, i32 1
  store i32 1, i32* %154, align 4, !tbaa !6
  %155 = getelementptr inbounds i32, i32* %153, i32 2
  store i32 0, i32* %155, align 4, !tbaa !6
  %156 = getelementptr inbounds i32, i32* %153, i32 3
  store i32 0, i32* %156, align 4, !tbaa !6
  %157 = getelementptr inbounds i32, i32* %153, i32 4
  store i32 0, i32* %157, align 4, !tbaa !6
  %158 = load i32*, i32** %13, align 4, !tbaa !2
  store i32 1, i32* %158, align 4, !tbaa !6
  %159 = load i32, i32* %153, align 4, !tbaa !6
  %160 = getelementptr inbounds i32, i32* %153, i32 1
  %161 = load i32, i32* %160, align 4, !tbaa !6
  %162 = add nsw i32 %161, %159
  %163 = getelementptr inbounds i32, i32* %158, i32 1
  store i32 %162, i32* %163, align 4, !tbaa !6
  %164 = getelementptr inbounds i32, i32* %158, i32 2
  store i32 1, i32* %164, align 4, !tbaa !6
  %165 = getelementptr inbounds i32, i32* %158, i32 3
  store i32 0, i32* %165, align 4, !tbaa !6
  %166 = getelementptr inbounds i32, i32* %158, i32 4
  store i32 0, i32* %166, align 4, !tbaa !6
  %167 = load i32*, i32** %17, align 4, !tbaa !2
  store i32 1, i32* %167, align 4, !tbaa !6
  %168 = load i32, i32* %158, align 4, !tbaa !6
  %169 = getelementptr inbounds i32, i32* %158, i32 1
  %170 = load i32, i32* %169, align 4, !tbaa !6
  %171 = add nsw i32 %170, %168
  %172 = getelementptr inbounds i32, i32* %167, i32 1
  store i32 %171, i32* %172, align 4, !tbaa !6
  %173 = getelementptr inbounds i32, i32* %158, i32 1
  %174 = load i32, i32* %173, align 4, !tbaa !6
  %175 = getelementptr inbounds i32, i32* %158, i32 2
  %176 = load i32, i32* %175, align 4, !tbaa !6
  %177 = add nsw i32 %176, %174
  %178 = getelementptr inbounds i32, i32* %167, i32 2
  store i32 %177, i32* %178, align 4, !tbaa !6
  %179 = getelementptr inbounds i32, i32* %167, i32 3
  store i32 1, i32* %179, align 4, !tbaa !6
  %180 = getelementptr inbounds i32, i32* %167, i32 4
  store i32 0, i32* %180, align 4, !tbaa !6
  %181 = load i32*, i32** %21, align 4, !tbaa !2
  store i32 1, i32* %181, align 4, !tbaa !6
  %182 = load i32, i32* %167, align 4, !tbaa !6
  %183 = getelementptr inbounds i32, i32* %167, i32 1
  %184 = load i32, i32* %183, align 4, !tbaa !6
  %185 = add nsw i32 %184, %182
  %186 = getelementptr inbounds i32, i32* %181, i32 1
  store i32 %185, i32* %186, align 4, !tbaa !6
  %187 = getelementptr inbounds i32, i32* %167, i32 1
  %188 = load i32, i32* %187, align 4, !tbaa !6
  %189 = getelementptr inbounds i32, i32* %167, i32 2
  %190 = load i32, i32* %189, align 4, !tbaa !6
  %191 = add nsw i32 %190, %188
  %192 = getelementptr inbounds i32, i32* %181, i32 2
  store i32 %191, i32* %192, align 4, !tbaa !6
  %193 = getelementptr inbounds i32, i32* %167, i32 2
  %194 = load i32, i32* %193, align 4, !tbaa !6
  %195 = getelementptr inbounds i32, i32* %167, i32 3
  %196 = load i32, i32* %195, align 4, !tbaa !6
  %197 = add nsw i32 %196, %194
  %198 = getelementptr inbounds i32, i32* %181, i32 3
  store i32 %197, i32* %198, align 4, !tbaa !6
  %199 = getelementptr inbounds i32, i32* %181, i32 4
  store i32 1, i32* %199, align 4, !tbaa !6
  %200 = load i32, i32* %148, align 4, !tbaa !6
  %201 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %200, i32 32)
  %202 = load i32*, i32** %4, align 4, !tbaa !2
  %203 = getelementptr inbounds i32, i32* %202, i32 1
  %204 = load i32, i32* %203, align 4, !tbaa !6
  %205 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %204, i32 32)
  %206 = getelementptr inbounds i32, i32* %202, i32 2
  %207 = load i32, i32* %206, align 4, !tbaa !6
  %208 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %207, i32 32)
  %209 = load i32*, i32** %4, align 4, !tbaa !2
  %210 = getelementptr inbounds i32, i32* %209, i32 3
  %211 = load i32, i32* %210, align 4, !tbaa !6
  %212 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %211, i32 32)
  %213 = getelementptr inbounds i32, i32* %209, i32 4
  %214 = load i32, i32* %213, align 4, !tbaa !6
  %215 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %214, i32 10)
  %216 = load i32*, i32** %9, align 4, !tbaa !2
  %217 = load i32, i32* %216, align 4, !tbaa !6
  %218 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %217, i32 32)
  %219 = getelementptr inbounds i32, i32* %216, i32 1
  %220 = load i32, i32* %219, align 4, !tbaa !6
  %221 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %220, i32 32)
  %222 = getelementptr inbounds i32, i32* %216, i32 2
  %223 = load i32, i32* %222, align 4, !tbaa !6
  %224 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %223, i32 32)
  %225 = load i32*, i32** %9, align 4, !tbaa !2
  %226 = getelementptr inbounds i32, i32* %225, i32 3
  %227 = load i32, i32* %226, align 4, !tbaa !6
  %228 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %227, i32 32)
  %229 = getelementptr inbounds i32, i32* %225, i32 4
  %230 = load i32, i32* %229, align 4, !tbaa !6
  %231 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %230, i32 10)
  %232 = load i32*, i32** %13, align 4, !tbaa !2
  %233 = load i32, i32* %232, align 4, !tbaa !6
  %234 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %233, i32 32)
  %235 = getelementptr inbounds i32, i32* %232, i32 1
  %236 = load i32, i32* %235, align 4, !tbaa !6
  %237 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %236, i32 32)
  %238 = getelementptr inbounds i32, i32* %232, i32 2
  %239 = load i32, i32* %238, align 4, !tbaa !6
  %240 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %239, i32 32)
  %241 = load i32*, i32** %13, align 4, !tbaa !2
  %242 = getelementptr inbounds i32, i32* %241, i32 3
  %243 = load i32, i32* %242, align 4, !tbaa !6
  %244 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %243, i32 32)
  %245 = getelementptr inbounds i32, i32* %241, i32 4
  %246 = load i32, i32* %245, align 4, !tbaa !6
  %247 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %246, i32 10)
  %248 = load i32*, i32** %17, align 4, !tbaa !2
  %249 = load i32, i32* %248, align 4, !tbaa !6
  %250 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %249, i32 32)
  %251 = getelementptr inbounds i32, i32* %248, i32 1
  %252 = load i32, i32* %251, align 4, !tbaa !6
  %253 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %252, i32 32)
  %254 = getelementptr inbounds i32, i32* %248, i32 2
  %255 = load i32, i32* %254, align 4, !tbaa !6
  %256 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %255, i32 32)
  %257 = load i32*, i32** %17, align 4, !tbaa !2
  %258 = getelementptr inbounds i32, i32* %257, i32 3
  %259 = load i32, i32* %258, align 4, !tbaa !6
  %260 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %259, i32 32)
  %261 = getelementptr inbounds i32, i32* %257, i32 4
  %262 = load i32, i32* %261, align 4, !tbaa !6
  %263 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %262, i32 10)
  %264 = load i32*, i32** %21, align 4, !tbaa !2
  %265 = load i32, i32* %264, align 4, !tbaa !6
  %266 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %265, i32 32)
  %267 = getelementptr inbounds i32, i32* %264, i32 1
  %268 = load i32, i32* %267, align 4, !tbaa !6
  %269 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %268, i32 32)
  %270 = getelementptr inbounds i32, i32* %264, i32 2
  %271 = load i32, i32* %270, align 4, !tbaa !6
  %272 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %271, i32 32)
  %273 = load i32*, i32** %21, align 4, !tbaa !2
  %274 = getelementptr inbounds i32, i32* %273, i32 3
  %275 = load i32, i32* %274, align 4, !tbaa !6
  %276 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %275, i32 32)
  %277 = getelementptr inbounds i32, i32* %273, i32 4
  %278 = load i32, i32* %277, align 4, !tbaa !6
  %279 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %278, i32 10)
  %280 = tail call i32 @puts(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @str.5, i32 0, i32 0))
  %281 = load i32*, i32** %4, align 4, !tbaa !2
  store i32 1, i32* %281, align 4, !tbaa !6
  %282 = getelementptr inbounds i32, i32* %281, i32 1
  store i32 1, i32* %282, align 4, !tbaa !6
  %283 = getelementptr inbounds i32, i32* %281, i32 2
  store i32 1, i32* %283, align 4, !tbaa !6
  %284 = getelementptr inbounds i32, i32* %281, i32 3
  store i32 1, i32* %284, align 4, !tbaa !6
  %285 = getelementptr inbounds i32, i32* %281, i32 4
  store i32 1, i32* %285, align 4, !tbaa !6
  %286 = load i32*, i32** %9, align 4, !tbaa !2
  store i32 1, i32* %286, align 4, !tbaa !6
  %287 = getelementptr inbounds i32, i32* %281, i32 1
  %288 = load i32, i32* %287, align 4, !tbaa !6
  %289 = add nsw i32 %288, 1
  %290 = getelementptr inbounds i32, i32* %286, i32 1
  store i32 %289, i32* %290, align 4, !tbaa !6
  %291 = getelementptr inbounds i32, i32* %281, i32 2
  %292 = load i32, i32* %291, align 4, !tbaa !6
  %293 = add nsw i32 %289, %292
  %294 = getelementptr inbounds i32, i32* %286, i32 2
  store i32 %293, i32* %294, align 4, !tbaa !6
  %295 = getelementptr inbounds i32, i32* %281, i32 3
  %296 = load i32, i32* %295, align 4, !tbaa !6
  %297 = add nsw i32 %293, %296
  %298 = getelementptr inbounds i32, i32* %286, i32 3
  store i32 %297, i32* %298, align 4, !tbaa !6
  %299 = getelementptr inbounds i32, i32* %281, i32 4
  %300 = load i32, i32* %299, align 4, !tbaa !6
  %301 = add nsw i32 %297, %300
  %302 = getelementptr inbounds i32, i32* %286, i32 4
  store i32 %301, i32* %302, align 4, !tbaa !6
  %303 = load i32*, i32** %13, align 4, !tbaa !2
  store i32 1, i32* %303, align 4, !tbaa !6
  %304 = getelementptr inbounds i32, i32* %286, i32 1
  %305 = load i32, i32* %304, align 4, !tbaa !6
  %306 = add nsw i32 %305, 1
  %307 = getelementptr inbounds i32, i32* %303, i32 1
  store i32 %306, i32* %307, align 4, !tbaa !6
  %308 = getelementptr inbounds i32, i32* %286, i32 2
  %309 = load i32, i32* %308, align 4, !tbaa !6
  %310 = add nsw i32 %306, %309
  %311 = getelementptr inbounds i32, i32* %303, i32 2
  store i32 %310, i32* %311, align 4, !tbaa !6
  %312 = getelementptr inbounds i32, i32* %286, i32 3
  %313 = load i32, i32* %312, align 4, !tbaa !6
  %314 = add nsw i32 %310, %313
  %315 = getelementptr inbounds i32, i32* %303, i32 3
  store i32 %314, i32* %315, align 4, !tbaa !6
  %316 = getelementptr inbounds i32, i32* %286, i32 4
  %317 = load i32, i32* %316, align 4, !tbaa !6
  %318 = add nsw i32 %314, %317
  %319 = getelementptr inbounds i32, i32* %303, i32 4
  store i32 %318, i32* %319, align 4, !tbaa !6
  %320 = load i32*, i32** %17, align 4, !tbaa !2
  store i32 1, i32* %320, align 4, !tbaa !6
  %321 = getelementptr inbounds i32, i32* %303, i32 1
  %322 = load i32, i32* %321, align 4, !tbaa !6
  %323 = add nsw i32 %322, 1
  %324 = getelementptr inbounds i32, i32* %320, i32 1
  store i32 %323, i32* %324, align 4, !tbaa !6
  %325 = getelementptr inbounds i32, i32* %303, i32 2
  %326 = load i32, i32* %325, align 4, !tbaa !6
  %327 = add nsw i32 %323, %326
  %328 = getelementptr inbounds i32, i32* %320, i32 2
  store i32 %327, i32* %328, align 4, !tbaa !6
  %329 = getelementptr inbounds i32, i32* %303, i32 3
  %330 = load i32, i32* %329, align 4, !tbaa !6
  %331 = add nsw i32 %327, %330
  %332 = getelementptr inbounds i32, i32* %320, i32 3
  store i32 %331, i32* %332, align 4, !tbaa !6
  %333 = getelementptr inbounds i32, i32* %303, i32 4
  %334 = load i32, i32* %333, align 4, !tbaa !6
  %335 = add nsw i32 %331, %334
  %336 = getelementptr inbounds i32, i32* %320, i32 4
  store i32 %335, i32* %336, align 4, !tbaa !6
  %337 = load i32*, i32** %21, align 4, !tbaa !2
  store i32 1, i32* %337, align 4, !tbaa !6
  %338 = getelementptr inbounds i32, i32* %320, i32 1
  %339 = load i32, i32* %338, align 4, !tbaa !6
  %340 = add nsw i32 %339, 1
  %341 = getelementptr inbounds i32, i32* %337, i32 1
  store i32 %340, i32* %341, align 4, !tbaa !6
  %342 = getelementptr inbounds i32, i32* %320, i32 2
  %343 = load i32, i32* %342, align 4, !tbaa !6
  %344 = add nsw i32 %340, %343
  %345 = getelementptr inbounds i32, i32* %337, i32 2
  store i32 %344, i32* %345, align 4, !tbaa !6
  %346 = getelementptr inbounds i32, i32* %320, i32 3
  %347 = load i32, i32* %346, align 4, !tbaa !6
  %348 = add nsw i32 %344, %347
  %349 = getelementptr inbounds i32, i32* %337, i32 3
  store i32 %348, i32* %349, align 4, !tbaa !6
  %350 = getelementptr inbounds i32, i32* %320, i32 4
  %351 = load i32, i32* %350, align 4, !tbaa !6
  %352 = add nsw i32 %348, %351
  %353 = getelementptr inbounds i32, i32* %337, i32 4
  store i32 %352, i32* %353, align 4, !tbaa !6
  %354 = load i32, i32* %281, align 4, !tbaa !6
  %355 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %354, i32 32)
  %356 = load i32*, i32** %4, align 4, !tbaa !2
  %357 = getelementptr inbounds i32, i32* %356, i32 1
  %358 = load i32, i32* %357, align 4, !tbaa !6
  %359 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %358, i32 32)
  %360 = getelementptr inbounds i32, i32* %356, i32 2
  %361 = load i32, i32* %360, align 4, !tbaa !6
  %362 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %361, i32 32)
  %363 = load i32*, i32** %4, align 4, !tbaa !2
  %364 = getelementptr inbounds i32, i32* %363, i32 3
  %365 = load i32, i32* %364, align 4, !tbaa !6
  %366 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %365, i32 32)
  %367 = getelementptr inbounds i32, i32* %363, i32 4
  %368 = load i32, i32* %367, align 4, !tbaa !6
  %369 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %368, i32 10)
  %370 = load i32*, i32** %9, align 4, !tbaa !2
  %371 = load i32, i32* %370, align 4, !tbaa !6
  %372 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %371, i32 32)
  %373 = getelementptr inbounds i32, i32* %370, i32 1
  %374 = load i32, i32* %373, align 4, !tbaa !6
  %375 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %374, i32 32)
  %376 = getelementptr inbounds i32, i32* %370, i32 2
  %377 = load i32, i32* %376, align 4, !tbaa !6
  %378 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %377, i32 32)
  %379 = load i32*, i32** %9, align 4, !tbaa !2
  %380 = getelementptr inbounds i32, i32* %379, i32 3
  %381 = load i32, i32* %380, align 4, !tbaa !6
  %382 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %381, i32 32)
  %383 = getelementptr inbounds i32, i32* %379, i32 4
  %384 = load i32, i32* %383, align 4, !tbaa !6
  %385 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %384, i32 10)
  %386 = load i32*, i32** %13, align 4, !tbaa !2
  %387 = load i32, i32* %386, align 4, !tbaa !6
  %388 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %387, i32 32)
  %389 = getelementptr inbounds i32, i32* %386, i32 1
  %390 = load i32, i32* %389, align 4, !tbaa !6
  %391 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %390, i32 32)
  %392 = getelementptr inbounds i32, i32* %386, i32 2
  %393 = load i32, i32* %392, align 4, !tbaa !6
  %394 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %393, i32 32)
  %395 = load i32*, i32** %13, align 4, !tbaa !2
  %396 = getelementptr inbounds i32, i32* %395, i32 3
  %397 = load i32, i32* %396, align 4, !tbaa !6
  %398 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %397, i32 32)
  %399 = getelementptr inbounds i32, i32* %395, i32 4
  %400 = load i32, i32* %399, align 4, !tbaa !6
  %401 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %400, i32 10)
  %402 = load i32*, i32** %17, align 4, !tbaa !2
  %403 = load i32, i32* %402, align 4, !tbaa !6
  %404 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %403, i32 32)
  %405 = getelementptr inbounds i32, i32* %402, i32 1
  %406 = load i32, i32* %405, align 4, !tbaa !6
  %407 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %406, i32 32)
  %408 = getelementptr inbounds i32, i32* %402, i32 2
  %409 = load i32, i32* %408, align 4, !tbaa !6
  %410 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %409, i32 32)
  %411 = load i32*, i32** %17, align 4, !tbaa !2
  %412 = getelementptr inbounds i32, i32* %411, i32 3
  %413 = load i32, i32* %412, align 4, !tbaa !6
  %414 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %413, i32 32)
  %415 = getelementptr inbounds i32, i32* %411, i32 4
  %416 = load i32, i32* %415, align 4, !tbaa !6
  %417 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %416, i32 10)
  %418 = load i32*, i32** %21, align 4, !tbaa !2
  %419 = load i32, i32* %418, align 4, !tbaa !6
  %420 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %419, i32 32)
  %421 = getelementptr inbounds i32, i32* %418, i32 1
  %422 = load i32, i32* %421, align 4, !tbaa !6
  %423 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %422, i32 32)
  %424 = getelementptr inbounds i32, i32* %418, i32 2
  %425 = load i32, i32* %424, align 4, !tbaa !6
  %426 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %425, i32 32)
  %427 = load i32*, i32** %21, align 4, !tbaa !2
  %428 = getelementptr inbounds i32, i32* %427, i32 3
  %429 = load i32, i32* %428, align 4, !tbaa !6
  %430 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %429, i32 32)
  %431 = getelementptr inbounds i32, i32* %427, i32 4
  %432 = load i32, i32* %431, align 4, !tbaa !6
  %433 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %432, i32 10)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i32, i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #3

attributes #0 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
