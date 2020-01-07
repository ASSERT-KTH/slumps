; ModuleID = 'benchmark4pipeline_c/addition_chains.c'
source_filename = "benchmark4pipeline_c/addition_chains.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.pair = type { i32, i32 }

@example = hidden local_unnamed_addr global i32* null, align 4
@exampleLen = hidden local_unnamed_addr global i32 0, align 4
@.str.2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"\0AN = %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [39 x i8] c"Minimum length of chains : L(%d) = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [45 x i8] c"Number of minimum length Brauer chains : %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [18 x i8] c"Brauer example : \00", align 1
@.str.8 = private unnamed_addr constant [49 x i8] c"Number of minimum length non-Brauer chains : %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"Non-Brauer example : \00", align 1
@str = private unnamed_addr constant [17 x i8] c"Error in tryPerm\00"
@str.12 = private unnamed_addr constant [3 x i8] c"\08]\00"
@str.13 = private unnamed_addr constant [31 x i8] c"Non-Brauer analysis suppressed\00"
@str.14 = private unnamed_addr constant [58 x i8] c"Searching for Brauer chains up to a minimum length of 12:\00"

; Function Attrs: norecurse nounwind
define hidden void @reverse(i32* nocapture, i32) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 1
  br i1 %3, label %4, label %16

; <label>:4:                                      ; preds = %2
  %5 = add nsw i32 %1, -1
  br label %6

; <label>:6:                                      ; preds = %4, %6
  %7 = phi i32 [ %5, %4 ], [ %14, %6 ]
  %8 = phi i32 [ 0, %4 ], [ %13, %6 ]
  %9 = getelementptr inbounds i32, i32* %0, i32 %8
  %10 = load i32, i32* %9, align 4, !tbaa !2
  %11 = getelementptr inbounds i32, i32* %0, i32 %7
  %12 = load i32, i32* %11, align 4, !tbaa !2
  store i32 %12, i32* %9, align 4, !tbaa !2
  store i32 %10, i32* %11, align 4, !tbaa !2
  %13 = add nuw nsw i32 %8, 1
  %14 = add nsw i32 %7, -1
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %6, label %16

; <label>:16:                                     ; preds = %6, %2
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
define hidden void @checkSeq(%struct.pair* noalias nocapture sret, i32, i32*, i32, i32, i32) local_unnamed_addr #2 {
  %7 = icmp sgt i32 %1, %5
  br i1 %7, label %11, label %8

; <label>:8:                                      ; preds = %6
  %9 = load i32, i32* %2, align 4, !tbaa !2
  %10 = icmp sgt i32 %9, %3
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %8, %6
  %12 = getelementptr inbounds %struct.pair, %struct.pair* %0, i32 0, i32 0
  store i32 %5, i32* %12, align 4
  %13 = getelementptr inbounds %struct.pair, %struct.pair* %0, i32 0, i32 1
  store i32 0, i32* %13, align 4
  br label %28

; <label>:14:                                     ; preds = %8
  %15 = icmp eq i32 %9, %3
  br i1 %15, label %16, label %22

; <label>:16:                                     ; preds = %14
  %17 = shl i32 %4, 2
  %18 = tail call noalias i8* @malloc(i32 %17) #5
  store i8* %18, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  %19 = bitcast i32* %2 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %18, i8* %19, i32 %17, i32 4, i1 false)
  store i32 %4, i32* @exampleLen, align 4, !tbaa !2
  %20 = getelementptr inbounds %struct.pair, %struct.pair* %0, i32 0, i32 0
  store i32 %1, i32* %20, align 4
  %21 = getelementptr inbounds %struct.pair, %struct.pair* %0, i32 0, i32 1
  store i32 1, i32* %21, align 4
  br label %28

; <label>:22:                                     ; preds = %14
  %23 = icmp slt i32 %1, %5
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %22
  tail call void @tryPerm(%struct.pair* sret %0, i32 0, i32 %1, i32* nonnull %2, i32 %3, i32 %4, i32 %5)
  br label %28

; <label>:25:                                     ; preds = %22
  %26 = getelementptr inbounds %struct.pair, %struct.pair* %0, i32 0, i32 0
  store i32 %5, i32* %26, align 4
  %27 = getelementptr inbounds %struct.pair, %struct.pair* %0, i32 0, i32 1
  store i32 0, i32* %27, align 4
  br label %28

; <label>:28:                                     ; preds = %25, %24, %16, %11
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden void @tryPerm(%struct.pair* noalias nocapture sret, i32, i32, i32* nocapture readonly, i32, i32, i32) local_unnamed_addr #2 {
  %8 = alloca %struct.pair, align 4
  %9 = alloca %struct.pair, align 4
  %10 = icmp sgt i32 %1, %2
  br i1 %10, label %61, label %11

; <label>:11:                                     ; preds = %7
  %12 = add nsw i32 %5, 1
  %13 = shl i32 %12, 2
  %14 = tail call noalias i8* @malloc(i32 %13) #5
  %15 = bitcast i8* %14 to i32*
  %16 = getelementptr inbounds i8, i8* %14, i32 4
  %17 = bitcast i32* %3 to i8*
  %18 = shl i32 %5, 2
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull %16, i8* %17, i32 %18, i32 4, i1 false)
  %19 = load i32, i32* %3, align 4, !tbaa !2
  %20 = getelementptr inbounds i32, i32* %3, i32 %1
  %21 = load i32, i32* %20, align 4, !tbaa !2
  %22 = add nsw i32 %21, %19
  store i32 %22, i32* %15, align 4, !tbaa !2
  %23 = add nsw i32 %2, 1
  %24 = icmp sge i32 %2, %6
  %25 = icmp sgt i32 %22, %4
  %26 = or i1 %24, %25
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %11
  %28 = getelementptr inbounds %struct.pair, %struct.pair* %8, i32 0, i32 0
  store i32 %6, i32* %28, align 4, !alias.scope !8
  %29 = getelementptr inbounds %struct.pair, %struct.pair* %8, i32 0, i32 1
  store i32 0, i32* %29, align 4, !alias.scope !8
  br label %46

; <label>:30:                                     ; preds = %11
  %31 = icmp eq i32 %22, %4
  br i1 %31, label %32, label %36

; <label>:32:                                     ; preds = %30
  %33 = tail call noalias i8* @malloc(i32 %13) #5
  store i8* %33, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %33, i8* %14, i32 %13, i32 4, i1 false) #5, !noalias !8
  store i32 %12, i32* @exampleLen, align 4, !tbaa !2
  %34 = getelementptr inbounds %struct.pair, %struct.pair* %8, i32 0, i32 0
  store i32 %23, i32* %34, align 4, !alias.scope !8
  %35 = getelementptr inbounds %struct.pair, %struct.pair* %8, i32 0, i32 1
  store i32 1, i32* %35, align 4, !alias.scope !8
  br label %46

; <label>:36:                                     ; preds = %30
  %37 = icmp slt i32 %23, %6
  br i1 %37, label %38, label %43

; <label>:38:                                     ; preds = %36
  call void @tryPerm(%struct.pair* nonnull sret %8, i32 0, i32 %23, i32* %15, i32 %4, i32 %12, i32 %6) #5
  %39 = getelementptr inbounds %struct.pair, %struct.pair* %8, i32 0, i32 0
  %40 = load i32, i32* %39, align 4
  %41 = getelementptr inbounds %struct.pair, %struct.pair* %8, i32 0, i32 1
  %42 = load i32, i32* %41, align 4
  br label %46

; <label>:43:                                     ; preds = %36
  %44 = getelementptr inbounds %struct.pair, %struct.pair* %8, i32 0, i32 0
  store i32 %6, i32* %44, align 4, !alias.scope !8
  %45 = getelementptr inbounds %struct.pair, %struct.pair* %8, i32 0, i32 1
  store i32 0, i32* %45, align 4, !alias.scope !8
  br label %46

; <label>:46:                                     ; preds = %27, %32, %38, %43
  %47 = phi i32 [ 0, %27 ], [ 1, %32 ], [ %42, %38 ], [ 0, %43 ]
  %48 = phi i32 [ %6, %27 ], [ %23, %32 ], [ %40, %38 ], [ %6, %43 ]
  %49 = add nsw i32 %1, 1
  call void @tryPerm(%struct.pair* nonnull sret %9, i32 %49, i32 %2, i32* nonnull %3, i32 %4, i32 %5, i32 %48)
  %50 = getelementptr inbounds %struct.pair, %struct.pair* %9, i32 0, i32 0
  %51 = load i32, i32* %50, align 4
  %52 = getelementptr inbounds %struct.pair, %struct.pair* %9, i32 0, i32 1
  %53 = load i32, i32* %52, align 4
  tail call void @free(i8* %14) #5
  %54 = icmp slt i32 %51, %48
  br i1 %54, label %61, label %55

; <label>:55:                                     ; preds = %46
  %56 = icmp eq i32 %51, %48
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %55
  %58 = add nsw i32 %53, %47
  br label %61

; <label>:59:                                     ; preds = %55
  %60 = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @str, i32 0, i32 0))
  br label %61

; <label>:61:                                     ; preds = %46, %7, %59, %57
  %62 = phi i32 [ 0, %59 ], [ %48, %57 ], [ %6, %7 ], [ %51, %46 ]
  %63 = phi i32 [ 0, %59 ], [ %58, %57 ], [ 0, %7 ], [ %53, %46 ]
  %64 = getelementptr inbounds %struct.pair, %struct.pair* %0, i32 0, i32 0
  store i32 %62, i32* %64, align 4
  %65 = getelementptr inbounds %struct.pair, %struct.pair* %0, i32 0, i32 1
  store i32 %63, i32* %65, align 4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden void @initTryPerm(%struct.pair* noalias nocapture sret, i32, i32) local_unnamed_addr #2 {
  %4 = alloca [1 x i32], align 4
  %5 = bitcast [1 x i32]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #5
  %6 = getelementptr inbounds [1 x i32], [1 x i32]* %4, i32 0, i32 0
  store i32 1, i32* %6, align 4
  call void @tryPerm(%struct.pair* sret %0, i32 0, i32 0, i32* nonnull %6, i32 %1, i32 1, i32 %2)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #5
  ret void
}

; Function Attrs: nounwind
define hidden void @printArray(i32* nocapture readonly, i32) local_unnamed_addr #2 {
  %3 = tail call i32 @putchar(i32 91)
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %13

; <label>:5:                                      ; preds = %2
  br label %6

; <label>:6:                                      ; preds = %5, %6
  %7 = phi i32 [ %11, %6 ], [ 0, %5 ]
  %8 = getelementptr inbounds i32, i32* %0, i32 %7
  %9 = load i32, i32* %8, align 4, !tbaa !2
  %10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %9)
  %11 = add nuw nsw i32 %7, 1
  %12 = icmp eq i32 %11, %1
  br i1 %12, label %13, label %6

; <label>:13:                                     ; preds = %6, %2
  %14 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.12, i32 0, i32 0))
  ret void
}

; Function Attrs: norecurse nounwind readonly
define hidden i32 @isBrauer(i32* nocapture readonly, i32) local_unnamed_addr #4 {
  %3 = icmp sgt i32 %1, 2
  br i1 %3, label %4, label %24

; <label>:4:                                      ; preds = %2
  %5 = getelementptr inbounds i32, i32* %0, i32 1
  %6 = load i32, i32* %5, align 4, !tbaa !2
  br label %7

; <label>:7:                                      ; preds = %4, %21
  %8 = phi i32 [ %6, %4 ], [ %11, %21 ]
  %9 = phi i32 [ 2, %4 ], [ %22, %21 ]
  %10 = getelementptr inbounds i32, i32* %0, i32 %9
  %11 = load i32, i32* %10, align 4, !tbaa !2
  br label %14

; <label>:12:                                     ; preds = %14
  %13 = icmp sgt i32 %15, 1
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %7, %12
  %15 = phi i32 [ %9, %7 ], [ %16, %12 ]
  %16 = add nsw i32 %15, -1
  %17 = getelementptr inbounds i32, i32* %0, i32 %16
  %18 = load i32, i32* %17, align 4, !tbaa !2
  %19 = add nsw i32 %18, %8
  %20 = icmp eq i32 %19, %11
  br i1 %20, label %21, label %12

; <label>:21:                                     ; preds = %14
  %22 = add nuw nsw i32 %9, 1
  %23 = icmp slt i32 %22, %1
  br i1 %23, label %7, label %24

; <label>:24:                                     ; preds = %21, %12, %2
  %25 = phi i32 [ 1, %2 ], [ 0, %12 ], [ 1, %21 ]
  ret i32 %25
}

; Function Attrs: nounwind
define hidden i32 @isAdditionChain(i32* nocapture readonly, i32) local_unnamed_addr #2 {
  %3 = icmp sgt i32 %1, 2
  br i1 %3, label %4, label %67

; <label>:4:                                      ; preds = %2
  %5 = getelementptr inbounds i32, i32* %0, i32 1
  %6 = load i32, i32* %5, align 4, !tbaa !2
  br label %7

; <label>:7:                                      ; preds = %4, %36
  %8 = phi i32 [ %6, %4 ], [ %11, %36 ]
  %9 = phi i32 [ 2, %4 ], [ %37, %36 ]
  %10 = getelementptr inbounds i32, i32* %0, i32 %9
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %12 = shl nsw i32 %8, 1
  %13 = icmp sgt i32 %11, %12
  br i1 %13, label %67, label %14

; <label>:14:                                     ; preds = %7
  br label %15

; <label>:15:                                     ; preds = %14, %34
  %16 = phi i32 [ %17, %34 ], [ %9, %14 ]
  %17 = add nsw i32 %16, -1
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %67

; <label>:19:                                     ; preds = %15
  %20 = getelementptr inbounds i32, i32* %0, i32 %17
  %21 = load i32, i32* %20, align 4, !tbaa !2
  %22 = shl nsw i32 %21, 1
  %23 = icmp eq i32 %22, %11
  br i1 %23, label %36, label %24

; <label>:24:                                     ; preds = %19
  br label %25

; <label>:25:                                     ; preds = %24, %29
  %26 = phi i32 [ %27, %29 ], [ %17, %24 ]
  %27 = add nsw i32 %26, -1
  %28 = icmp sgt i32 %26, 0
  br i1 %28, label %29, label %34

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds i32, i32* %0, i32 %27
  %31 = load i32, i32* %30, align 4, !tbaa !2
  %32 = add nsw i32 %31, %21
  %33 = icmp eq i32 %32, %11
  br i1 %33, label %36, label %25

; <label>:34:                                     ; preds = %25
  %35 = icmp sgt i32 %16, 1
  br i1 %35, label %15, label %67

; <label>:36:                                     ; preds = %19, %29
  %37 = add nuw nsw i32 %9, 1
  %38 = icmp slt i32 %37, %1
  br i1 %38, label %7, label %39

; <label>:39:                                     ; preds = %36
  %40 = load i32*, i32** @example, align 4, !tbaa !6
  %41 = icmp eq i32* %40, null
  %42 = and i1 %3, %41
  br i1 %42, label %43, label %67

; <label>:43:                                     ; preds = %39
  %44 = getelementptr inbounds i32, i32* %0, i32 1
  %45 = load i32, i32* %44, align 4, !tbaa !2
  br label %46

; <label>:46:                                     ; preds = %60, %43
  %47 = phi i32 [ %45, %43 ], [ %50, %60 ]
  %48 = phi i32 [ 2, %43 ], [ %61, %60 ]
  %49 = getelementptr inbounds i32, i32* %0, i32 %48
  %50 = load i32, i32* %49, align 4, !tbaa !2
  br label %53

; <label>:51:                                     ; preds = %53
  %52 = icmp sgt i32 %54, 1
  br i1 %52, label %53, label %63

; <label>:53:                                     ; preds = %51, %46
  %54 = phi i32 [ %48, %46 ], [ %55, %51 ]
  %55 = add nsw i32 %54, -1
  %56 = getelementptr inbounds i32, i32* %0, i32 %55
  %57 = load i32, i32* %56, align 4, !tbaa !2
  %58 = add nsw i32 %57, %47
  %59 = icmp eq i32 %58, %50
  br i1 %59, label %60, label %51

; <label>:60:                                     ; preds = %53
  %61 = add nuw nsw i32 %48, 1
  %62 = icmp slt i32 %61, %1
  br i1 %62, label %46, label %67

; <label>:63:                                     ; preds = %51
  %64 = shl i32 %1, 2
  %65 = tail call noalias i8* @malloc(i32 %64) #5
  store i8* %65, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  %66 = bitcast i32* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %65, i8* %66, i32 %64, i32 4, i1 false)
  store i32 %1, i32* @exampleLen, align 4, !tbaa !2
  br label %67

; <label>:67:                                     ; preds = %7, %15, %34, %60, %2, %39, %63
  %68 = phi i32 [ 1, %63 ], [ 1, %39 ], [ 1, %2 ], [ 1, %60 ], [ 0, %34 ], [ 0, %15 ], [ 0, %7 ]
  ret i32 %68
}

; Function Attrs: nounwind
define hidden void @nextChains(i32, i32, i32* nocapture, i32* nocapture) local_unnamed_addr #2 {
  %5 = add i32 %1, -1
  %6 = icmp sgt i32 %5, %0
  %7 = add nsw i32 %0, 1
  %8 = getelementptr inbounds i32, i32* %2, i32 %0
  %9 = sub i32 %5, %0
  %10 = getelementptr inbounds i32, i32* %2, i32 %5
  %11 = icmp slt i32 %7, %5
  %12 = icmp sgt i32 %1, 2
  %13 = getelementptr inbounds i32, i32* %2, i32 1
  %14 = shl i32 %1, 2
  %15 = bitcast i32* %2 to i8*
  br i1 %6, label %16, label %99

; <label>:16:                                     ; preds = %4
  tail call void @nextChains(i32 %7, i32 %1, i32* %2, i32* %3)
  %17 = load i32, i32* %8, align 4, !tbaa !2
  %18 = add i32 %9, %17
  %19 = load i32, i32* %10, align 4, !tbaa !2
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %182

; <label>:21:                                     ; preds = %16
  br label %22

; <label>:22:                                     ; preds = %21, %87
  %23 = phi i32 [ %88, %87 ], [ %17, %21 ]
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %8, align 4, !tbaa !2
  br i1 %11, label %25, label %26

; <label>:25:                                     ; preds = %22
  br label %92

; <label>:26:                                     ; preds = %92, %22
  br i1 %12, label %27, label %84

; <label>:27:                                     ; preds = %26
  %28 = load i32, i32* %13, align 4, !tbaa !2
  br label %29

; <label>:29:                                     ; preds = %58, %27
  %30 = phi i32 [ %28, %27 ], [ %33, %58 ]
  %31 = phi i32 [ 2, %27 ], [ %59, %58 ]
  %32 = getelementptr inbounds i32, i32* %2, i32 %31
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %34 = shl nsw i32 %30, 1
  %35 = icmp sgt i32 %33, %34
  br i1 %35, label %87, label %36

; <label>:36:                                     ; preds = %29
  br label %37

; <label>:37:                                     ; preds = %36, %51
  %38 = phi i32 [ %39, %51 ], [ %31, %36 ]
  %39 = add nsw i32 %38, -1
  %40 = icmp sgt i32 %38, 0
  br i1 %40, label %41, label %87

; <label>:41:                                     ; preds = %37
  %42 = getelementptr inbounds i32, i32* %2, i32 %39
  %43 = load i32, i32* %42, align 4, !tbaa !2
  %44 = shl nsw i32 %43, 1
  %45 = icmp eq i32 %44, %33
  br i1 %45, label %58, label %46

; <label>:46:                                     ; preds = %41
  br label %47

; <label>:47:                                     ; preds = %46, %53
  %48 = phi i32 [ %49, %53 ], [ %39, %46 ]
  %49 = add nsw i32 %48, -1
  %50 = icmp sgt i32 %48, 0
  br i1 %50, label %53, label %51

; <label>:51:                                     ; preds = %47
  %52 = icmp sgt i32 %38, 1
  br i1 %52, label %37, label %87

; <label>:53:                                     ; preds = %47
  %54 = getelementptr inbounds i32, i32* %2, i32 %49
  %55 = load i32, i32* %54, align 4, !tbaa !2
  %56 = add nsw i32 %55, %43
  %57 = icmp eq i32 %56, %33
  br i1 %57, label %58, label %47

; <label>:58:                                     ; preds = %41, %53
  %59 = add nuw nsw i32 %31, 1
  %60 = icmp slt i32 %59, %1
  br i1 %60, label %29, label %61

; <label>:61:                                     ; preds = %58
  %62 = load i32*, i32** @example, align 4, !tbaa !6
  %63 = icmp eq i32* %62, null
  br i1 %63, label %64, label %84

; <label>:64:                                     ; preds = %61
  br label %65

; <label>:65:                                     ; preds = %64, %81
  %66 = phi i32 [ %69, %81 ], [ %28, %64 ]
  %67 = phi i32 [ %82, %81 ], [ 2, %64 ]
  %68 = getelementptr inbounds i32, i32* %2, i32 %67
  %69 = load i32, i32* %68, align 4, !tbaa !2
  br label %70

; <label>:70:                                     ; preds = %77, %65
  %71 = phi i32 [ %67, %65 ], [ %72, %77 ]
  %72 = add nsw i32 %71, -1
  %73 = getelementptr inbounds i32, i32* %2, i32 %72
  %74 = load i32, i32* %73, align 4, !tbaa !2
  %75 = add nsw i32 %74, %66
  %76 = icmp eq i32 %75, %69
  br i1 %76, label %81, label %77

; <label>:77:                                     ; preds = %70
  %78 = icmp sgt i32 %71, 1
  br i1 %78, label %70, label %79

; <label>:79:                                     ; preds = %77
  %80 = tail call noalias i8* @malloc(i32 %14) #5
  store i8* %80, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %80, i8* nonnull %15, i32 %14, i32 4, i1 false) #5
  store i32 %1, i32* @exampleLen, align 4, !tbaa !2
  br label %84

; <label>:81:                                     ; preds = %70
  %82 = add nuw nsw i32 %67, 1
  %83 = icmp slt i32 %82, %1
  br i1 %83, label %65, label %84

; <label>:84:                                     ; preds = %81, %79, %61, %26
  %85 = load i32, i32* %3, align 4, !tbaa !2
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %3, align 4, !tbaa !2
  br label %87

; <label>:87:                                     ; preds = %29, %37, %51, %84
  tail call void @nextChains(i32 %7, i32 %1, i32* %2, i32* %3)
  %88 = load i32, i32* %8, align 4, !tbaa !2
  %89 = add i32 %9, %88
  %90 = load i32, i32* %10, align 4, !tbaa !2
  %91 = icmp slt i32 %89, %90
  br i1 %91, label %22, label %182

; <label>:92:                                     ; preds = %25, %92
  %93 = phi i32 [ %95, %92 ], [ %24, %25 ]
  %94 = phi i32 [ %97, %92 ], [ %7, %25 ]
  %95 = add nsw i32 %93, 1
  %96 = getelementptr inbounds i32, i32* %2, i32 %94
  store i32 %95, i32* %96, align 4, !tbaa !2
  %97 = add nsw i32 %94, 1
  %98 = icmp eq i32 %97, %5
  br i1 %98, label %26, label %92

; <label>:99:                                     ; preds = %4
  %100 = load i32, i32* %8, align 4, !tbaa !2
  %101 = add i32 %9, %100
  %102 = load i32, i32* %10, align 4, !tbaa !2
  %103 = icmp slt i32 %101, %102
  br i1 %103, label %104, label %182

; <label>:104:                                    ; preds = %99
  br label %105

; <label>:105:                                    ; preds = %104, %177
  %106 = phi i32 [ %178, %177 ], [ %100, %104 ]
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %8, align 4, !tbaa !2
  br i1 %11, label %108, label %116

; <label>:108:                                    ; preds = %105
  br label %109

; <label>:109:                                    ; preds = %108, %109
  %110 = phi i32 [ %112, %109 ], [ %107, %108 ]
  %111 = phi i32 [ %114, %109 ], [ %7, %108 ]
  %112 = add nsw i32 %110, 1
  %113 = getelementptr inbounds i32, i32* %2, i32 %111
  store i32 %112, i32* %113, align 4, !tbaa !2
  %114 = add nsw i32 %111, 1
  %115 = icmp eq i32 %114, %5
  br i1 %115, label %116, label %109

; <label>:116:                                    ; preds = %109, %105
  br i1 %12, label %117, label %174

; <label>:117:                                    ; preds = %116
  %118 = load i32, i32* %13, align 4, !tbaa !2
  br label %119

; <label>:119:                                    ; preds = %148, %117
  %120 = phi i32 [ %118, %117 ], [ %123, %148 ]
  %121 = phi i32 [ 2, %117 ], [ %149, %148 ]
  %122 = getelementptr inbounds i32, i32* %2, i32 %121
  %123 = load i32, i32* %122, align 4, !tbaa !2
  %124 = shl nsw i32 %120, 1
  %125 = icmp sgt i32 %123, %124
  br i1 %125, label %177, label %126

; <label>:126:                                    ; preds = %119
  br label %127

; <label>:127:                                    ; preds = %126, %146
  %128 = phi i32 [ %129, %146 ], [ %121, %126 ]
  %129 = add nsw i32 %128, -1
  %130 = icmp sgt i32 %128, 0
  br i1 %130, label %131, label %177

; <label>:131:                                    ; preds = %127
  %132 = getelementptr inbounds i32, i32* %2, i32 %129
  %133 = load i32, i32* %132, align 4, !tbaa !2
  %134 = shl nsw i32 %133, 1
  %135 = icmp eq i32 %134, %123
  br i1 %135, label %148, label %136

; <label>:136:                                    ; preds = %131
  br label %137

; <label>:137:                                    ; preds = %136, %141
  %138 = phi i32 [ %139, %141 ], [ %129, %136 ]
  %139 = add nsw i32 %138, -1
  %140 = icmp sgt i32 %138, 0
  br i1 %140, label %141, label %146

; <label>:141:                                    ; preds = %137
  %142 = getelementptr inbounds i32, i32* %2, i32 %139
  %143 = load i32, i32* %142, align 4, !tbaa !2
  %144 = add nsw i32 %143, %133
  %145 = icmp eq i32 %144, %123
  br i1 %145, label %148, label %137

; <label>:146:                                    ; preds = %137
  %147 = icmp sgt i32 %128, 1
  br i1 %147, label %127, label %177

; <label>:148:                                    ; preds = %131, %141
  %149 = add nuw nsw i32 %121, 1
  %150 = icmp slt i32 %149, %1
  br i1 %150, label %119, label %151

; <label>:151:                                    ; preds = %148
  %152 = load i32*, i32** @example, align 4, !tbaa !6
  %153 = icmp eq i32* %152, null
  br i1 %153, label %154, label %174

; <label>:154:                                    ; preds = %151
  br label %155

; <label>:155:                                    ; preds = %154, %169
  %156 = phi i32 [ %159, %169 ], [ %118, %154 ]
  %157 = phi i32 [ %170, %169 ], [ 2, %154 ]
  %158 = getelementptr inbounds i32, i32* %2, i32 %157
  %159 = load i32, i32* %158, align 4, !tbaa !2
  br label %162

; <label>:160:                                    ; preds = %162
  %161 = icmp sgt i32 %163, 1
  br i1 %161, label %162, label %172

; <label>:162:                                    ; preds = %160, %155
  %163 = phi i32 [ %157, %155 ], [ %164, %160 ]
  %164 = add nsw i32 %163, -1
  %165 = getelementptr inbounds i32, i32* %2, i32 %164
  %166 = load i32, i32* %165, align 4, !tbaa !2
  %167 = add nsw i32 %166, %156
  %168 = icmp eq i32 %167, %159
  br i1 %168, label %169, label %160

; <label>:169:                                    ; preds = %162
  %170 = add nuw nsw i32 %157, 1
  %171 = icmp slt i32 %170, %1
  br i1 %171, label %155, label %174

; <label>:172:                                    ; preds = %160
  %173 = tail call noalias i8* @malloc(i32 %14) #5
  store i8* %173, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %173, i8* nonnull %15, i32 %14, i32 4, i1 false) #5
  store i32 %1, i32* @exampleLen, align 4, !tbaa !2
  br label %174

; <label>:174:                                    ; preds = %169, %172, %151, %116
  %175 = load i32, i32* %3, align 4, !tbaa !2
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %3, align 4, !tbaa !2
  br label %177

; <label>:177:                                    ; preds = %119, %146, %127, %174
  %178 = load i32, i32* %8, align 4, !tbaa !2
  %179 = add i32 %9, %178
  %180 = load i32, i32* %10, align 4, !tbaa !2
  %181 = icmp slt i32 %179, %180
  br i1 %181, label %105, label %182

; <label>:182:                                    ; preds = %177, %87, %99, %16
  ret void
}

; Function Attrs: nounwind
define hidden i32 @findNonBrauer(i32, i32, i32) local_unnamed_addr #2 {
  %4 = alloca i32, align 4
  %5 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #5
  store i32 0, i32* %4, align 4, !tbaa !2
  %6 = shl i32 %1, 2
  %7 = tail call noalias i8* @malloc(i32 %6) #5
  %8 = bitcast i8* %7 to i32*
  store i32 1, i32* %8, align 4, !tbaa !2
  %9 = add nsw i32 %1, -1
  %10 = getelementptr inbounds i32, i32* %8, i32 %9
  store i32 %0, i32* %10, align 4, !tbaa !2
  %11 = icmp sgt i32 %1, 2
  br i1 %11, label %12, label %81

; <label>:12:                                     ; preds = %3
  %13 = load i32, i32* %8, align 4, !tbaa !2
  br label %14

; <label>:14:                                     ; preds = %14, %12
  %15 = phi i32 [ %13, %12 ], [ %17, %14 ]
  %16 = phi i32 [ 1, %12 ], [ %19, %14 ]
  %17 = add nsw i32 %15, 1
  %18 = getelementptr inbounds i32, i32* %8, i32 %16
  store i32 %17, i32* %18, align 4, !tbaa !2
  %19 = add nuw nsw i32 %16, 1
  %20 = icmp eq i32 %19, %9
  br i1 %20, label %21, label %14

; <label>:21:                                     ; preds = %14
  br i1 %11, label %22, label %81

; <label>:22:                                     ; preds = %21
  %23 = getelementptr inbounds i8, i8* %7, i32 4
  %24 = bitcast i8* %23 to i32*
  %25 = load i32, i32* %24, align 4, !tbaa !2
  br label %26

; <label>:26:                                     ; preds = %55, %22
  %27 = phi i32 [ %25, %22 ], [ %30, %55 ]
  %28 = phi i32 [ 2, %22 ], [ %56, %55 ]
  %29 = getelementptr inbounds i32, i32* %8, i32 %28
  %30 = load i32, i32* %29, align 4, !tbaa !2
  %31 = shl nsw i32 %27, 1
  %32 = icmp sgt i32 %30, %31
  br i1 %32, label %82, label %33

; <label>:33:                                     ; preds = %26
  br label %34

; <label>:34:                                     ; preds = %33, %53
  %35 = phi i32 [ %36, %53 ], [ %28, %33 ]
  %36 = add nsw i32 %35, -1
  %37 = icmp sgt i32 %35, 0
  br i1 %37, label %38, label %82

; <label>:38:                                     ; preds = %34
  %39 = getelementptr inbounds i32, i32* %8, i32 %36
  %40 = load i32, i32* %39, align 4, !tbaa !2
  %41 = shl nsw i32 %40, 1
  %42 = icmp eq i32 %41, %30
  br i1 %42, label %55, label %43

; <label>:43:                                     ; preds = %38
  br label %44

; <label>:44:                                     ; preds = %43, %48
  %45 = phi i32 [ %46, %48 ], [ %36, %43 ]
  %46 = add nsw i32 %45, -1
  %47 = icmp sgt i32 %45, 0
  br i1 %47, label %48, label %53

; <label>:48:                                     ; preds = %44
  %49 = getelementptr inbounds i32, i32* %8, i32 %46
  %50 = load i32, i32* %49, align 4, !tbaa !2
  %51 = add nsw i32 %50, %40
  %52 = icmp eq i32 %51, %30
  br i1 %52, label %55, label %44

; <label>:53:                                     ; preds = %44
  %54 = icmp sgt i32 %35, 1
  br i1 %54, label %34, label %82

; <label>:55:                                     ; preds = %38, %48
  %56 = add nuw nsw i32 %28, 1
  %57 = icmp slt i32 %56, %1
  br i1 %57, label %26, label %58

; <label>:58:                                     ; preds = %55
  %59 = load i32*, i32** @example, align 4, !tbaa !6
  %60 = icmp eq i32* %59, null
  br i1 %60, label %61, label %81

; <label>:61:                                     ; preds = %58
  br label %62

; <label>:62:                                     ; preds = %61, %76
  %63 = phi i32 [ %66, %76 ], [ %25, %61 ]
  %64 = phi i32 [ %77, %76 ], [ 2, %61 ]
  %65 = getelementptr inbounds i32, i32* %8, i32 %64
  %66 = load i32, i32* %65, align 4, !tbaa !2
  br label %69

; <label>:67:                                     ; preds = %69
  %68 = icmp sgt i32 %70, 1
  br i1 %68, label %69, label %79

; <label>:69:                                     ; preds = %67, %62
  %70 = phi i32 [ %64, %62 ], [ %71, %67 ]
  %71 = add nsw i32 %70, -1
  %72 = getelementptr inbounds i32, i32* %8, i32 %71
  %73 = load i32, i32* %72, align 4, !tbaa !2
  %74 = add nsw i32 %73, %63
  %75 = icmp eq i32 %74, %66
  br i1 %75, label %76, label %67

; <label>:76:                                     ; preds = %69
  %77 = add nuw nsw i32 %64, 1
  %78 = icmp slt i32 %77, %1
  br i1 %78, label %62, label %81

; <label>:79:                                     ; preds = %67
  %80 = tail call noalias i8* @malloc(i32 %6) #5
  store i8* %80, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %80, i8* nonnull %7, i32 %6, i32 4, i1 false) #5
  store i32 %1, i32* @exampleLen, align 4, !tbaa !2
  br label %81

; <label>:81:                                     ; preds = %76, %3, %79, %58, %21
  store i32 1, i32* %4, align 4, !tbaa !2
  br label %82

; <label>:82:                                     ; preds = %26, %53, %34, %81
  call void @nextChains(i32 2, i32 %1, i32* %8, i32* nonnull %4)
  tail call void @free(i8* %7) #5
  %83 = load i32, i32* %4, align 4, !tbaa !2
  %84 = sub nsw i32 %83, %2
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #5
  ret i32 %84
}

; Function Attrs: nounwind
define hidden void @findBrauer(i32, i32, i32) local_unnamed_addr #2 {
  %4 = alloca [1 x i32], align 4
  %5 = alloca %struct.pair, align 4
  %6 = bitcast %struct.pair* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #5
  %7 = bitcast [1 x i32]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #5, !noalias !11
  %8 = getelementptr inbounds [1 x i32], [1 x i32]* %4, i32 0, i32 0
  store i32 1, i32* %8, align 4, !noalias !11
  call void @tryPerm(%struct.pair* nonnull sret %5, i32 0, i32 0, i32* nonnull %8, i32 %0, i32 1, i32 %1) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #5, !noalias !11
  %9 = getelementptr inbounds %struct.pair, %struct.pair* %5, i32 0, i32 0
  %10 = load i32, i32* %9, align 4, !tbaa !14
  %11 = getelementptr inbounds %struct.pair, %struct.pair* %5, i32 0, i32 1
  %12 = load i32, i32* %11, align 4, !tbaa !16
  %13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0), i32 %0)
  %14 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.5, i32 0, i32 0), i32 %0, i32 %10)
  %15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.6, i32 0, i32 0), i32 %12)
  %16 = icmp sgt i32 %12, 0
  br i1 %16, label %17, label %50

; <label>:17:                                     ; preds = %3
  %18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.7, i32 0, i32 0))
  %19 = load i32*, i32** @example, align 4, !tbaa !6
  %20 = load i32, i32* @exampleLen, align 4, !tbaa !2
  %21 = icmp sgt i32 %20, 1
  br i1 %21, label %22, label %36

; <label>:22:                                     ; preds = %17
  %23 = add nsw i32 %20, -1
  br label %24

; <label>:24:                                     ; preds = %24, %22
  %25 = phi i32 [ %23, %22 ], [ %32, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %31, %24 ]
  %27 = getelementptr inbounds i32, i32* %19, i32 %26
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = getelementptr inbounds i32, i32* %19, i32 %25
  %30 = load i32, i32* %29, align 4, !tbaa !2
  store i32 %30, i32* %27, align 4, !tbaa !2
  store i32 %28, i32* %29, align 4, !tbaa !2
  %31 = add nuw nsw i32 %26, 1
  %32 = add nsw i32 %25, -1
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %24, label %34

; <label>:34:                                     ; preds = %24
  %35 = load i32, i32* @exampleLen, align 4, !tbaa !2
  br label %36

; <label>:36:                                     ; preds = %34, %17
  %37 = phi i32 [ %35, %34 ], [ %20, %17 ]
  %38 = tail call i32 @putchar(i32 91) #5
  %39 = icmp sgt i32 %37, 0
  br i1 %39, label %40, label %48

; <label>:40:                                     ; preds = %36
  br label %41

; <label>:41:                                     ; preds = %40, %41
  %42 = phi i32 [ %46, %41 ], [ 0, %40 ]
  %43 = getelementptr inbounds i32, i32* %19, i32 %42
  %44 = load i32, i32* %43, align 4, !tbaa !2
  %45 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %44) #5
  %46 = add nuw nsw i32 %42, 1
  %47 = icmp eq i32 %46, %37
  br i1 %47, label %48, label %41

; <label>:48:                                     ; preds = %41, %36
  %49 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.12, i32 0, i32 0)) #5
  br label %50

; <label>:50:                                     ; preds = %48, %3
  %51 = load i32*, i32** @example, align 4, !tbaa !6
  %52 = icmp eq i32* %51, null
  br i1 %52, label %55, label %53

; <label>:53:                                     ; preds = %50
  %54 = bitcast i32* %51 to i8*
  tail call void @free(i8* %54) #5
  store i32* null, i32** @example, align 4, !tbaa !6
  store i32 0, i32* @exampleLen, align 4, !tbaa !2
  br label %55

; <label>:55:                                     ; preds = %50, %53
  %56 = icmp sgt i32 %0, %2
  br i1 %56, label %83, label %57

; <label>:57:                                     ; preds = %55
  %58 = add nsw i32 %10, 1
  %59 = tail call i32 @findNonBrauer(i32 %0, i32 %58, i32 %12)
  %60 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i32 0, i32 0), i32 %59)
  %61 = icmp sgt i32 %59, 0
  br i1 %61, label %62, label %78

; <label>:62:                                     ; preds = %57
  %63 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i32 0, i32 0))
  %64 = load i32*, i32** @example, align 4, !tbaa !6
  %65 = load i32, i32* @exampleLen, align 4, !tbaa !2
  %66 = tail call i32 @putchar(i32 91) #5
  %67 = icmp sgt i32 %65, 0
  br i1 %67, label %68, label %76

; <label>:68:                                     ; preds = %62
  br label %69

; <label>:69:                                     ; preds = %68, %69
  %70 = phi i32 [ %74, %69 ], [ 0, %68 ]
  %71 = getelementptr inbounds i32, i32* %64, i32 %70
  %72 = load i32, i32* %71, align 4, !tbaa !2
  %73 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %72) #5
  %74 = add nuw nsw i32 %70, 1
  %75 = icmp eq i32 %74, %65
  br i1 %75, label %76, label %69

; <label>:76:                                     ; preds = %69, %62
  %77 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.12, i32 0, i32 0)) #5
  br label %78

; <label>:78:                                     ; preds = %76, %57
  %79 = load i32*, i32** @example, align 4, !tbaa !6
  %80 = icmp eq i32* %79, null
  br i1 %80, label %85, label %81

; <label>:81:                                     ; preds = %78
  %82 = bitcast i32* %79 to i8*
  tail call void @free(i8* %82) #5
  store i32* null, i32** @example, align 4, !tbaa !6
  store i32 0, i32* @exampleLen, align 4, !tbaa !2
  br label %85

; <label>:83:                                     ; preds = %55
  %84 = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @str.13, i32 0, i32 0))
  br label %85

; <label>:85:                                     ; preds = %78, %81, %83
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #5
  ret void
}

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #2 {
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @str.14, i32 0, i32 0))
  tail call void @findBrauer(i32 7, i32 12, i32 79)
  tail call void @findBrauer(i32 14, i32 12, i32 79)
  tail call void @findBrauer(i32 21, i32 12, i32 79)
  tail call void @findBrauer(i32 29, i32 12, i32 79)
  tail call void @findBrauer(i32 32, i32 12, i32 79)
  tail call void @findBrauer(i32 42, i32 12, i32 79)
  tail call void @findBrauer(i32 64, i32 12, i32 79)
  tail call void @findBrauer(i32 47, i32 12, i32 79)
  tail call void @findBrauer(i32 79, i32 12, i32 79)
  tail call void @findBrauer(i32 191, i32 12, i32 79)
  tail call void @findBrauer(i32 382, i32 12, i32 79)
  tail call void @findBrauer(i32 379, i32 12, i32 79)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #5

attributes #0 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

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
!8 = !{!9}
!9 = distinct !{!9, !10, !"checkSeq: argument 0"}
!10 = distinct !{!10, !"checkSeq"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"initTryPerm: argument 0"}
!13 = distinct !{!13, !"initTryPerm"}
!14 = !{!15, !3, i64 0}
!15 = !{!"", !3, i64 0, !3, i64 4}
!16 = !{!15, !3, i64 4}
