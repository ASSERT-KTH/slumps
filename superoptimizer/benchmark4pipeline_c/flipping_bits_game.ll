; ModuleID = 'benchmark4pipeline_c/flipping_bits_game.c'
source_filename = "benchmark4pipeline_c/flipping_bits_game.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@i = hidden local_unnamed_addr global i32 0, align 4
@j = hidden local_unnamed_addr global i32 0, align 4
@.str.1 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"What to flip: \00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.8 = private unnamed_addr constant [36 x i8] c"Please specify r or c and an number\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"Moves Taken: %d\0A\00", align 1
@str = private unnamed_addr constant [9 x i8] c"Target: \00"
@str.11 = private unnamed_addr constant [8 x i8] c"Board: \00"
@str.12 = private unnamed_addr constant [9 x i8] c"You win!\00"

; Function Attrs: norecurse nounwind
define hidden void @fliprow(i32** nocapture readonly, i32, i32) local_unnamed_addr #0 {
  store i32 0, i32* @i, align 4, !tbaa !2
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %18

; <label>:5:                                      ; preds = %3
  %6 = add nsw i32 %2, 1
  %7 = getelementptr inbounds i32*, i32** %0, i32 %6
  %8 = load i32*, i32** %7, align 4, !tbaa !6
  br label %9

; <label>:9:                                      ; preds = %5, %9
  %10 = phi i32 [ 0, %5 ], [ %16, %9 ]
  %11 = getelementptr inbounds i32, i32* %8, i32 %10
  %12 = load i32, i32* %11, align 4, !tbaa !2
  %13 = icmp eq i32 %12, 0
  %14 = zext i1 %13 to i32
  store i32 %14, i32* %11, align 4, !tbaa !2
  %15 = load i32, i32* @i, align 4, !tbaa !2
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* @i, align 4, !tbaa !2
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %9, label %18

; <label>:18:                                     ; preds = %9, %3
  ret void
}

; Function Attrs: norecurse nounwind
define hidden void @flipcol(i32** nocapture readonly, i32, i32) local_unnamed_addr #0 {
  store i32 1, i32* @i, align 4, !tbaa !2
  %4 = icmp slt i32 %1, 1
  br i1 %4, label %17, label %5

; <label>:5:                                      ; preds = %3
  br label %6

; <label>:6:                                      ; preds = %5, %6
  %7 = phi i32 [ %15, %6 ], [ 1, %5 ]
  %8 = getelementptr inbounds i32*, i32** %0, i32 %7
  %9 = load i32*, i32** %8, align 4, !tbaa !6
  %10 = getelementptr inbounds i32, i32* %9, i32 %2
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %12 = icmp eq i32 %11, 0
  %13 = zext i1 %12 to i32
  store i32 %13, i32* %10, align 4, !tbaa !2
  %14 = load i32, i32* @i, align 4, !tbaa !2
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* @i, align 4, !tbaa !2
  %16 = icmp slt i32 %14, %1
  br i1 %16, label %6, label %17

; <label>:17:                                     ; preds = %6, %3
  ret void
}

; Function Attrs: nounwind
define hidden void @initt(i32** nocapture readonly, i32) local_unnamed_addr #1 {
  store i32 1, i32* @i, align 4, !tbaa !2
  %3 = icmp slt i32 %1, 1
  br i1 %3, label %21, label %4

; <label>:4:                                      ; preds = %2
  br label %5

; <label>:5:                                      ; preds = %4, %17
  store i32 0, i32* @j, align 4, !tbaa !2
  br label %6

; <label>:6:                                      ; preds = %5, %6
  %7 = tail call i32 @rand() #5
  %8 = srem i32 %7, 2
  %9 = load i32, i32* @i, align 4, !tbaa !2
  %10 = getelementptr inbounds i32*, i32** %0, i32 %9
  %11 = load i32*, i32** %10, align 4, !tbaa !6
  %12 = load i32, i32* @j, align 4, !tbaa !2
  %13 = getelementptr inbounds i32, i32* %11, i32 %12
  store i32 %8, i32* %13, align 4, !tbaa !2
  %14 = load i32, i32* @j, align 4, !tbaa !2
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* @j, align 4, !tbaa !2
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %6, label %17

; <label>:17:                                     ; preds = %6
  %18 = load i32, i32* @i, align 4, !tbaa !2
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* @i, align 4, !tbaa !2
  %20 = icmp slt i32 %18, %1
  br i1 %20, label %5, label %21

; <label>:21:                                     ; preds = %17, %2
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #2

; Function Attrs: nounwind
define hidden void @initb(i32** nocapture readonly, i32** nocapture readonly, i32) local_unnamed_addr #1 {
  store i32 1, i32* @i, align 4, !tbaa !2
  %4 = icmp slt i32 %2, 1
  br i1 %4, label %6, label %5

; <label>:5:                                      ; preds = %3
  br label %7

; <label>:6:                                      ; preds = %3
  store i32 1, i32* @i, align 4, !tbaa !2
  br label %42

; <label>:7:                                      ; preds = %5, %23
  %8 = phi i32 [ %24, %23 ], [ 1, %5 ]
  store i32 0, i32* @j, align 4, !tbaa !2
  br label %9

; <label>:9:                                      ; preds = %7, %9
  %10 = phi i32 [ %8, %7 ], [ %22, %9 ]
  %11 = phi i32 [ 0, %7 ], [ %20, %9 ]
  %12 = getelementptr inbounds i32*, i32** %0, i32 %10
  %13 = load i32*, i32** %12, align 4, !tbaa !6
  %14 = getelementptr inbounds i32, i32* %13, i32 %11
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %16 = getelementptr inbounds i32*, i32** %1, i32 %10
  %17 = load i32*, i32** %16, align 4, !tbaa !6
  %18 = getelementptr inbounds i32, i32* %17, i32 %11
  store i32 %15, i32* %18, align 4, !tbaa !2
  %19 = load i32, i32* @j, align 4, !tbaa !2
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* @j, align 4, !tbaa !2
  %21 = icmp slt i32 %20, %2
  %22 = load i32, i32* @i, align 4, !tbaa !2
  br i1 %21, label %9, label %23

; <label>:23:                                     ; preds = %9
  %24 = add nsw i32 %22, 1
  store i32 %24, i32* @i, align 4, !tbaa !2
  %25 = icmp slt i32 %22, %2
  br i1 %25, label %7, label %26

; <label>:26:                                     ; preds = %23
  store i32 1, i32* @i, align 4, !tbaa !2
  br i1 %4, label %42, label %27

; <label>:27:                                     ; preds = %26
  %28 = tail call i32 @rand() #5
  store i32 0, i32* @i, align 4, !tbaa !2
  %29 = srem i32 %28, %2
  %30 = add nsw i32 %29, 2
  %31 = getelementptr inbounds i32*, i32** %1, i32 %30
  %32 = load i32*, i32** %31, align 4, !tbaa !6
  br label %33

; <label>:33:                                     ; preds = %33, %27
  %34 = phi i32 [ 0, %27 ], [ %40, %33 ]
  %35 = getelementptr inbounds i32, i32* %32, i32 %34
  %36 = load i32, i32* %35, align 4, !tbaa !2
  %37 = icmp eq i32 %36, 0
  %38 = zext i1 %37 to i32
  store i32 %38, i32* %35, align 4, !tbaa !2
  %39 = load i32, i32* @i, align 4, !tbaa !2
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* @i, align 4, !tbaa !2
  %41 = icmp slt i32 %40, %2
  br i1 %41, label %33, label %43

; <label>:42:                                     ; preds = %6, %26
  store i32 0, i32* @i, align 4, !tbaa !2
  br label %63

; <label>:43:                                     ; preds = %33
  store i32 0, i32* @i, align 4, !tbaa !2
  %44 = icmp sgt i32 %2, 0
  br i1 %44, label %45, label %63

; <label>:45:                                     ; preds = %43
  br label %46

; <label>:46:                                     ; preds = %45, %60
  %47 = tail call i32 @rand() #5
  %48 = srem i32 %47, %2
  store i32 1, i32* @i, align 4, !tbaa !2
  br label %49

; <label>:49:                                     ; preds = %49, %46
  %50 = phi i32 [ 1, %46 ], [ %58, %49 ]
  %51 = getelementptr inbounds i32*, i32** %1, i32 %50
  %52 = load i32*, i32** %51, align 4, !tbaa !6
  %53 = getelementptr inbounds i32, i32* %52, i32 %48
  %54 = load i32, i32* %53, align 4, !tbaa !2
  %55 = icmp eq i32 %54, 0
  %56 = zext i1 %55 to i32
  store i32 %56, i32* %53, align 4, !tbaa !2
  %57 = load i32, i32* @i, align 4, !tbaa !2
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* @i, align 4, !tbaa !2
  %59 = icmp slt i32 %57, %2
  br i1 %59, label %49, label %60

; <label>:60:                                     ; preds = %49
  %61 = add nsw i32 %57, 2
  store i32 %61, i32* @i, align 4, !tbaa !2
  %62 = icmp slt i32 %61, %2
  br i1 %62, label %46, label %63

; <label>:63:                                     ; preds = %60, %42, %43
  ret void
}

; Function Attrs: nounwind
define hidden void @printb(i32** nocapture readonly, i32) local_unnamed_addr #1 {
  %3 = tail call i32 @putchar(i32 32)
  store i32 0, i32* @i, align 4, !tbaa !2
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %6

; <label>:5:                                      ; preds = %2
  br label %8

; <label>:6:                                      ; preds = %2
  %7 = tail call i32 @putchar(i32 10)
  store i32 1, i32* @i, align 4, !tbaa !2
  br label %38

; <label>:8:                                      ; preds = %5, %8
  %9 = phi i32 [ %12, %8 ], [ 0, %5 ]
  %10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %9)
  %11 = load i32, i32* @i, align 4, !tbaa !2
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* @i, align 4, !tbaa !2
  %13 = icmp slt i32 %12, %1
  br i1 %13, label %8, label %14

; <label>:14:                                     ; preds = %8
  %15 = tail call i32 @putchar(i32 10)
  store i32 1, i32* @i, align 4, !tbaa !2
  %16 = icmp slt i32 %1, 1
  br i1 %16, label %38, label %17

; <label>:17:                                     ; preds = %14
  br label %18

; <label>:18:                                     ; preds = %17, %33
  %19 = phi i32 [ %36, %33 ], [ 1, %17 ]
  %20 = add nsw i32 %19, -1
  %21 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32 %20)
  store i32 0, i32* @j, align 4, !tbaa !2
  br label %22

; <label>:22:                                     ; preds = %18, %22
  %23 = phi i32 [ 0, %18 ], [ %31, %22 ]
  %24 = load i32, i32* @i, align 4, !tbaa !2
  %25 = getelementptr inbounds i32*, i32** %0, i32 %24
  %26 = load i32*, i32** %25, align 4, !tbaa !6
  %27 = getelementptr inbounds i32, i32* %26, i32 %23
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %28)
  %30 = load i32, i32* @j, align 4, !tbaa !2
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* @j, align 4, !tbaa !2
  %32 = icmp slt i32 %31, %1
  br i1 %32, label %22, label %33

; <label>:33:                                     ; preds = %22
  %34 = tail call i32 @putchar(i32 10)
  %35 = load i32, i32* @i, align 4, !tbaa !2
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* @i, align 4, !tbaa !2
  %37 = icmp slt i32 %35, %1
  br i1 %37, label %18, label %38

; <label>:38:                                     ; preds = %33, %6, %14
  %39 = tail call i32 @putchar(i32 10)
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: norecurse nounwind
define hidden i32 @eq(i32** nocapture readonly, i32** nocapture readonly, i32) local_unnamed_addr #0 {
  store i32 1, i32* @i, align 4, !tbaa !2
  %4 = icmp slt i32 %2, 1
  br i1 %4, label %25, label %5

; <label>:5:                                      ; preds = %3
  br label %6

; <label>:6:                                      ; preds = %5, %22
  %7 = phi i32 [ %23, %22 ], [ 1, %5 ]
  store i32 0, i32* @j, align 4, !tbaa !2
  %8 = getelementptr inbounds i32*, i32** %1, i32 %7
  %9 = load i32*, i32** %8, align 4, !tbaa !6
  %10 = getelementptr inbounds i32*, i32** %0, i32 %7
  %11 = load i32*, i32** %10, align 4, !tbaa !6
  br label %14

; <label>:12:                                     ; preds = %14
  store i32 %21, i32* @j, align 4, !tbaa !2
  %13 = icmp slt i32 %21, %2
  br i1 %13, label %14, label %22

; <label>:14:                                     ; preds = %6, %12
  %15 = phi i32 [ 0, %6 ], [ %21, %12 ]
  %16 = getelementptr inbounds i32, i32* %9, i32 %15
  %17 = load i32, i32* %16, align 4, !tbaa !2
  %18 = getelementptr inbounds i32, i32* %11, i32 %15
  %19 = load i32, i32* %18, align 4, !tbaa !2
  %20 = icmp eq i32 %17, %19
  %21 = add nuw nsw i32 %15, 1
  br i1 %20, label %12, label %25

; <label>:22:                                     ; preds = %12
  %23 = add nuw nsw i32 %7, 1
  store i32 %23, i32* @i, align 4, !tbaa !2
  %24 = icmp slt i32 %7, %2
  br i1 %24, label %6, label %25

; <label>:25:                                     ; preds = %22, %14, %3
  %26 = phi i32 [ 1, %3 ], [ 0, %14 ], [ 1, %22 ]
  ret i32 %26
}

; Function Attrs: nounwind
define hidden void @main() local_unnamed_addr #1 {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %3 = tail call noalias i8* @malloc(i32 15) #5
  %4 = bitcast i8* %3 to i32**
  %5 = tail call noalias i8* @malloc(i32 12) #5
  %6 = getelementptr inbounds i8, i8* %3, i32 4
  %7 = bitcast i8* %6 to i8**
  store i8* %5, i8** %7, align 4, !tbaa !6
  %8 = tail call noalias i8* @malloc(i32 12) #5
  %9 = getelementptr inbounds i8, i8* %3, i32 8
  %10 = bitcast i8* %9 to i8**
  store i8* %8, i8** %10, align 4, !tbaa !6
  %11 = tail call noalias i8* @malloc(i32 12) #5
  %12 = getelementptr inbounds i8, i8* %3, i32 12
  %13 = bitcast i8* %12 to i8**
  store i8* %11, i8** %13, align 4, !tbaa !6
  %14 = tail call noalias i8* @malloc(i32 15) #5
  %15 = bitcast i8* %14 to i32**
  %16 = tail call noalias i8* @malloc(i32 12) #5
  %17 = getelementptr inbounds i8, i8* %14, i32 4
  %18 = bitcast i8* %17 to i8**
  store i8* %16, i8** %18, align 4, !tbaa !6
  %19 = tail call noalias i8* @malloc(i32 12) #5
  %20 = getelementptr inbounds i8, i8* %14, i32 8
  %21 = bitcast i8* %20 to i8**
  store i8* %19, i8** %21, align 4, !tbaa !6
  %22 = tail call noalias i8* @malloc(i32 12) #5
  %23 = getelementptr inbounds i8, i8* %14, i32 12
  %24 = bitcast i8* %23 to i8**
  store i8* %22, i8** %24, align 4, !tbaa !6
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %1) #5
  %25 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %25) #5
  store i32 1, i32* @i, align 4, !tbaa !2
  %26 = bitcast i8* %16 to i32*
  %27 = bitcast i8* %5 to i32*
  %28 = bitcast i8* %19 to i32*
  %29 = bitcast i8* %8 to i32*
  %30 = bitcast i8* %22 to i32*
  %31 = bitcast i8* %11 to i32*
  br label %32

; <label>:32:                                     ; preds = %44, %0
  store i32 0, i32* @j, align 4, !tbaa !2
  br label %33

; <label>:33:                                     ; preds = %33, %32
  %34 = tail call i32 @rand() #5
  %35 = srem i32 %34, 2
  %36 = load i32, i32* @i, align 4, !tbaa !2
  %37 = getelementptr inbounds i32*, i32** %4, i32 %36
  %38 = load i32*, i32** %37, align 4, !tbaa !6
  %39 = load i32, i32* @j, align 4, !tbaa !2
  %40 = getelementptr inbounds i32, i32* %38, i32 %39
  store i32 %35, i32* %40, align 4, !tbaa !2
  %41 = load i32, i32* @j, align 4, !tbaa !2
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* @j, align 4, !tbaa !2
  %43 = icmp slt i32 %41, 2
  br i1 %43, label %33, label %44

; <label>:44:                                     ; preds = %33
  %45 = load i32, i32* @i, align 4, !tbaa !2
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* @i, align 4, !tbaa !2
  %47 = icmp slt i32 %45, 3
  br i1 %47, label %32, label %48

; <label>:48:                                     ; preds = %44
  tail call void @initb(i32** nonnull %4, i32** %15, i32 3)
  %49 = getelementptr inbounds i8, i8* %16, i32 4
  %50 = bitcast i8* %49 to i32*
  %51 = getelementptr inbounds i8, i8* %5, i32 4
  %52 = bitcast i8* %51 to i32*
  %53 = getelementptr inbounds i8, i8* %16, i32 8
  %54 = bitcast i8* %53 to i32*
  %55 = getelementptr inbounds i8, i8* %5, i32 8
  %56 = bitcast i8* %55 to i32*
  %57 = getelementptr inbounds i8, i8* %19, i32 4
  %58 = bitcast i8* %57 to i32*
  %59 = getelementptr inbounds i8, i8* %8, i32 4
  %60 = bitcast i8* %59 to i32*
  %61 = getelementptr inbounds i8, i8* %19, i32 8
  %62 = bitcast i8* %61 to i32*
  %63 = getelementptr inbounds i8, i8* %8, i32 8
  %64 = bitcast i8* %63 to i32*
  %65 = getelementptr inbounds i8, i8* %22, i32 4
  %66 = bitcast i8* %65 to i32*
  %67 = getelementptr inbounds i8, i8* %11, i32 4
  %68 = bitcast i8* %67 to i32*
  %69 = getelementptr inbounds i8, i8* %22, i32 8
  %70 = bitcast i8* %69 to i32*
  %71 = getelementptr inbounds i8, i8* %11, i32 8
  %72 = bitcast i8* %71 to i32*
  store i32 1, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %73 = load i32, i32* %26, align 4, !tbaa !2
  %74 = load i32, i32* %27, align 4, !tbaa !2
  %75 = icmp eq i32 %73, %74
  br i1 %75, label %76, label %81

; <label>:76:                                     ; preds = %48
  br label %77

; <label>:77:                                     ; preds = %76, %216
  store i32 1, i32* @j, align 4, !tbaa !2
  %78 = load i32, i32* %50, align 4, !tbaa !2
  %79 = load i32, i32* %52, align 4, !tbaa !2
  %80 = icmp eq i32 %78, %79
  br i1 %80, label %188, label %81

; <label>:81:                                     ; preds = %216, %77, %188, %192, %196, %200, %204, %208, %212, %48
  %82 = getelementptr inbounds i8, i8* %16, i32 4
  %83 = bitcast i8* %82 to i32*
  %84 = getelementptr inbounds i8, i8* %5, i32 4
  %85 = bitcast i8* %84 to i32*
  %86 = getelementptr inbounds i8, i8* %16, i32 8
  %87 = bitcast i8* %86 to i32*
  %88 = getelementptr inbounds i8, i8* %5, i32 8
  %89 = bitcast i8* %88 to i32*
  %90 = getelementptr inbounds i8, i8* %19, i32 4
  %91 = bitcast i8* %90 to i32*
  %92 = getelementptr inbounds i8, i8* %8, i32 4
  %93 = bitcast i8* %92 to i32*
  %94 = getelementptr inbounds i8, i8* %19, i32 8
  %95 = bitcast i8* %94 to i32*
  %96 = getelementptr inbounds i8, i8* %8, i32 8
  %97 = bitcast i8* %96 to i32*
  %98 = getelementptr inbounds i8, i8* %22, i32 4
  %99 = bitcast i8* %98 to i32*
  %100 = getelementptr inbounds i8, i8* %11, i32 4
  %101 = bitcast i8* %100 to i32*
  %102 = getelementptr inbounds i8, i8* %22, i32 8
  %103 = bitcast i8* %102 to i32*
  %104 = getelementptr inbounds i8, i8* %11, i32 8
  %105 = bitcast i8* %104 to i32*
  br label %106

; <label>:106:                                    ; preds = %153, %81
  %107 = phi i32 [ 0, %81 ], [ %148, %153 ]
  %108 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str, i32 0, i32 0))
  call void @printb(i32** %4, i32 3)
  %109 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.11, i32 0, i32 0))
  call void @printb(i32** %15, i32 3)
  %110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0))
  %111 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i8* nonnull %1) #5
  %112 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %2) #5
  %113 = load i8, i8* %1, align 1, !tbaa !8
  %114 = sext i8 %113 to i32
  switch i32 %114, label %146 [
    i32 114, label %115
    i32 99, label %129
  ]

; <label>:115:                                    ; preds = %106
  %116 = load i32, i32* %2, align 4, !tbaa !2
  store i32 0, i32* @i, align 4, !tbaa !2
  %117 = add nsw i32 %116, 1
  %118 = getelementptr inbounds i32*, i32** %15, i32 %117
  %119 = load i32*, i32** %118, align 4, !tbaa !6
  br label %120

; <label>:120:                                    ; preds = %120, %115
  %121 = phi i32 [ 0, %115 ], [ %127, %120 ]
  %122 = getelementptr inbounds i32, i32* %119, i32 %121
  %123 = load i32, i32* %122, align 4, !tbaa !2
  %124 = icmp eq i32 %123, 0
  %125 = zext i1 %124 to i32
  store i32 %125, i32* %122, align 4, !tbaa !2
  %126 = load i32, i32* @i, align 4, !tbaa !2
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* @i, align 4, !tbaa !2
  %128 = icmp slt i32 %126, 2
  br i1 %128, label %120, label %147

; <label>:129:                                    ; preds = %106
  %130 = load i32, i32* %2, align 4, !tbaa !2
  store i32 1, i32* @i, align 4, !tbaa !2
  %131 = getelementptr inbounds i32, i32* %26, i32 %130
  %132 = load i32, i32* %131, align 4, !tbaa !2
  %133 = icmp eq i32 %132, 0
  %134 = zext i1 %133 to i32
  store i32 %134, i32* %131, align 4, !tbaa !2
  store i32 2, i32* @i, align 4, !tbaa !2
  br label %135

; <label>:135:                                    ; preds = %129, %135
  %136 = phi i32 [ 2, %129 ], [ %144, %135 ]
  %137 = getelementptr inbounds i32*, i32** %15, i32 %136
  %138 = load i32*, i32** %137, align 4, !tbaa !6
  %139 = getelementptr inbounds i32, i32* %138, i32 %130
  %140 = load i32, i32* %139, align 4, !tbaa !2
  %141 = icmp eq i32 %140, 0
  %142 = zext i1 %141 to i32
  store i32 %142, i32* %139, align 4, !tbaa !2
  %143 = load i32, i32* @i, align 4, !tbaa !2
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* @i, align 4, !tbaa !2
  %145 = icmp slt i32 %143, 3
  br i1 %145, label %135, label %147

; <label>:146:                                    ; preds = %106
  call void @perror(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i32 0, i32 0)) #6
  br label %147

; <label>:147:                                    ; preds = %135, %120, %146
  %148 = add nuw nsw i32 %107, 1
  %149 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i32 0, i32 0), i32 %148)
  store i32 1, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %150 = load i32, i32* %26, align 4, !tbaa !2
  %151 = load i32, i32* %27, align 4, !tbaa !2
  %152 = icmp eq i32 %150, %151
  br i1 %152, label %154, label %153

; <label>:153:                                    ; preds = %147, %154, %160, %164, %168, %172, %176, %180, %184
  br label %106

; <label>:154:                                    ; preds = %147
  store i32 1, i32* @j, align 4, !tbaa !2
  %155 = load i32, i32* %83, align 4, !tbaa !2
  %156 = load i32, i32* %85, align 4, !tbaa !2
  %157 = icmp eq i32 %155, %156
  br i1 %157, label %160, label %153

; <label>:158:                                    ; preds = %184
  store i32 3, i32* @j, align 4, !tbaa !2
  store i32 4, i32* @i, align 4, !tbaa !2
  %159 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.12, i32 0, i32 0))
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %25) #5
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %1) #5
  ret void

; <label>:160:                                    ; preds = %154
  store i32 2, i32* @j, align 4, !tbaa !2
  %161 = load i32, i32* %87, align 4, !tbaa !2
  %162 = load i32, i32* %89, align 4, !tbaa !2
  %163 = icmp eq i32 %161, %162
  br i1 %163, label %164, label %153

; <label>:164:                                    ; preds = %160
  store i32 2, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %165 = load i32, i32* %28, align 4, !tbaa !2
  %166 = load i32, i32* %29, align 4, !tbaa !2
  %167 = icmp eq i32 %165, %166
  br i1 %167, label %168, label %153

; <label>:168:                                    ; preds = %164
  store i32 1, i32* @j, align 4, !tbaa !2
  %169 = load i32, i32* %91, align 4, !tbaa !2
  %170 = load i32, i32* %93, align 4, !tbaa !2
  %171 = icmp eq i32 %169, %170
  br i1 %171, label %172, label %153

; <label>:172:                                    ; preds = %168
  store i32 2, i32* @j, align 4, !tbaa !2
  %173 = load i32, i32* %95, align 4, !tbaa !2
  %174 = load i32, i32* %97, align 4, !tbaa !2
  %175 = icmp eq i32 %173, %174
  br i1 %175, label %176, label %153

; <label>:176:                                    ; preds = %172
  store i32 3, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %177 = load i32, i32* %30, align 4, !tbaa !2
  %178 = load i32, i32* %31, align 4, !tbaa !2
  %179 = icmp eq i32 %177, %178
  br i1 %179, label %180, label %153

; <label>:180:                                    ; preds = %176
  store i32 1, i32* @j, align 4, !tbaa !2
  %181 = load i32, i32* %99, align 4, !tbaa !2
  %182 = load i32, i32* %101, align 4, !tbaa !2
  %183 = icmp eq i32 %181, %182
  br i1 %183, label %184, label %153

; <label>:184:                                    ; preds = %180
  store i32 2, i32* @j, align 4, !tbaa !2
  %185 = load i32, i32* %103, align 4, !tbaa !2
  %186 = load i32, i32* %105, align 4, !tbaa !2
  %187 = icmp eq i32 %185, %186
  br i1 %187, label %158, label %153

; <label>:188:                                    ; preds = %77
  store i32 2, i32* @j, align 4, !tbaa !2
  %189 = load i32, i32* %54, align 4, !tbaa !2
  %190 = load i32, i32* %56, align 4, !tbaa !2
  %191 = icmp eq i32 %189, %190
  br i1 %191, label %192, label %81

; <label>:192:                                    ; preds = %188
  store i32 2, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %193 = load i32, i32* %28, align 4, !tbaa !2
  %194 = load i32, i32* %29, align 4, !tbaa !2
  %195 = icmp eq i32 %193, %194
  br i1 %195, label %196, label %81

; <label>:196:                                    ; preds = %192
  store i32 1, i32* @j, align 4, !tbaa !2
  %197 = load i32, i32* %58, align 4, !tbaa !2
  %198 = load i32, i32* %60, align 4, !tbaa !2
  %199 = icmp eq i32 %197, %198
  br i1 %199, label %200, label %81

; <label>:200:                                    ; preds = %196
  store i32 2, i32* @j, align 4, !tbaa !2
  %201 = load i32, i32* %62, align 4, !tbaa !2
  %202 = load i32, i32* %64, align 4, !tbaa !2
  %203 = icmp eq i32 %201, %202
  br i1 %203, label %204, label %81

; <label>:204:                                    ; preds = %200
  store i32 3, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %205 = load i32, i32* %30, align 4, !tbaa !2
  %206 = load i32, i32* %31, align 4, !tbaa !2
  %207 = icmp eq i32 %205, %206
  br i1 %207, label %208, label %81

; <label>:208:                                    ; preds = %204
  store i32 1, i32* @j, align 4, !tbaa !2
  %209 = load i32, i32* %66, align 4, !tbaa !2
  %210 = load i32, i32* %68, align 4, !tbaa !2
  %211 = icmp eq i32 %209, %210
  br i1 %211, label %212, label %81

; <label>:212:                                    ; preds = %208
  store i32 2, i32* @j, align 4, !tbaa !2
  %213 = load i32, i32* %70, align 4, !tbaa !2
  %214 = load i32, i32* %72, align 4, !tbaa !2
  %215 = icmp eq i32 %213, %214
  br i1 %215, label %216, label %81

; <label>:216:                                    ; preds = %212
  store i32 3, i32* @j, align 4, !tbaa !2
  store i32 4, i32* @i, align 4, !tbaa !2
  tail call void @initb(i32** %4, i32** %15, i32 3)
  store i32 1, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %217 = load i32, i32* %26, align 4, !tbaa !2
  %218 = load i32, i32* %27, align 4, !tbaa !2
  %219 = icmp eq i32 %217, %218
  br i1 %219, label %77, label %81
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #2

declare i32 @__isoc99_scanf(i8*, ...) local_unnamed_addr #4

; Function Attrs: nounwind
declare void @perror(i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #5

attributes #0 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{!4, !4, i64 0}
