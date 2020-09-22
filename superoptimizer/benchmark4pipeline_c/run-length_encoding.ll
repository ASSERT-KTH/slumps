; ModuleID = 'benchmark4pipeline_c/run-length_encoding.c'
source_filename = "benchmark4pipeline_c/run-length_encoding.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.string_stream = type { i32 (%struct.stream_t*)*, i32 (%struct.stream_t*, i32)*, i8*, i32 }
%struct.stream_t = type { {}*, i32 (%struct.stream_t*, i32)* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.file_stream = type { i32 (%struct.stream_t*)*, i32 (%struct.stream_t*, i32)*, %struct._IO_FILE* }

@.str = private unnamed_addr constant [68 x i8] c"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW\00", align 1
@main.str_in = private unnamed_addr constant %struct.string_stream { i32 (%struct.stream_t*)* @sget, i32 (%struct.stream_t*, i32)* null, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str, i32 0, i32 0), i32 0 }, align 4
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 4

; Function Attrs: norecurse nounwind
define hidden i32 @sget(%struct.stream_t* nocapture) #0 {
  %2 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %0, i32 1
  %3 = bitcast %struct.stream_t* %2 to i8**
  %4 = load i8*, i8** %3, align 4, !tbaa !2
  %5 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %0, i32 1, i32 1
  %6 = bitcast i32 (%struct.stream_t*, i32)** %5 to i32*
  %7 = load i32, i32* %6, align 4, !tbaa !8
  %8 = getelementptr inbounds i8, i8* %4, i32 %7
  %9 = load i8, i8* %8, align 1, !tbaa !9
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %14, label %11

; <label>:11:                                     ; preds = %1
  %12 = zext i8 %9 to i32
  %13 = add nsw i32 %7, 1
  store i32 %13, i32* %6, align 4, !tbaa !8
  br label %14

; <label>:14:                                     ; preds = %1, %11
  %15 = phi i32 [ %12, %11 ], [ -1, %1 ]
  ret i32 %15
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind
define hidden i32 @sput(%struct.stream_t* nocapture, i32) #0 {
  %3 = icmp eq i32 %1, -1
  %4 = trunc i32 %1 to i8
  %5 = select i1 %3, i8 0, i8 %4
  %6 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %0, i32 1
  %7 = bitcast %struct.stream_t* %6 to i8**
  %8 = load i8*, i8** %7, align 4, !tbaa !2
  %9 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %0, i32 1, i32 1
  %10 = bitcast i32 (%struct.stream_t*, i32)** %9 to i32*
  %11 = load i32, i32* %10, align 4, !tbaa !8
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %10, align 4, !tbaa !8
  %13 = getelementptr inbounds i8, i8* %8, i32 %11
  store i8 %5, i8* %13, align 1, !tbaa !9
  br i1 %3, label %14, label %15

; <label>:14:                                     ; preds = %2
  store i32 0, i32* %10, align 4, !tbaa !8
  br label %15

; <label>:15:                                     ; preds = %14, %2
  ret i32 0
}

; Function Attrs: nounwind
define hidden i32 @file_put(%struct.stream_t* nocapture readonly, i32) #2 {
  %3 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %0, i32 1
  %4 = bitcast %struct.stream_t* %3 to %struct._IO_FILE**
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 4, !tbaa !10
  %6 = tail call i32 @fputc(i32 %1, %struct._IO_FILE* %5)
  ret i32 %6
}

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden void @output(%struct.stream_t*, i8* nocapture readonly, i32) local_unnamed_addr #2 {
  %4 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %0, i32 0, i32 1
  %5 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %4, align 4, !tbaa !12
  %6 = add nsw i32 %2, 128
  %7 = tail call i32 %5(%struct.stream_t* %0, i32 %6) #4
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %9, label %19

; <label>:9:                                      ; preds = %3
  br label %10

; <label>:10:                                     ; preds = %9, %10
  %11 = phi i32 [ %17, %10 ], [ 0, %9 ]
  %12 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %4, align 4, !tbaa !12
  %13 = getelementptr inbounds i8, i8* %1, i32 %11
  %14 = load i8, i8* %13, align 1, !tbaa !9
  %15 = zext i8 %14 to i32
  %16 = tail call i32 %12(%struct.stream_t* nonnull %0, i32 %15) #4
  %17 = add nuw nsw i32 %11, 1
  %18 = icmp eq i32 %17, %2
  br i1 %18, label %19, label %10

; <label>:19:                                     ; preds = %10, %3
  ret void
}

; Function Attrs: nounwind
define hidden void @encode(%struct.stream_t*, %struct.stream_t*) local_unnamed_addr #2 {
  %3 = alloca [256 x i8], align 16
  %4 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %4) #4
  %5 = bitcast %struct.stream_t* %0 to i32 (%struct.stream_t*)**
  %6 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %5, align 4, !tbaa !14
  %7 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %1, i32 0, i32 1
  %8 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %7, align 4, !tbaa !12
  %9 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i32 0, i32 1
  br label %10

; <label>:10:                                     ; preds = %84, %2
  %11 = phi i32 [ 0, %2 ], [ %86, %84 ]
  %12 = phi i32 [ 0, %2 ], [ %85, %84 ]
  %13 = tail call i32 %6(%struct.stream_t* %0) #4
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %26, label %15

; <label>:15:                                     ; preds = %10
  br label %19

; <label>:16:                                     ; preds = %19
  %17 = tail call i32 %6(%struct.stream_t* %0) #4
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %26, label %19

; <label>:19:                                     ; preds = %15, %16
  %20 = phi i32 [ %17, %16 ], [ %13, %15 ]
  %21 = phi i32 [ %23, %16 ], [ %11, %15 ]
  %22 = trunc i32 %20 to i8
  %23 = add nsw i32 %21, 1
  %24 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i32 0, i32 %21
  store i8 %22, i8* %24, align 1, !tbaa !9
  %25 = icmp slt i32 %21, 1
  br i1 %25, label %16, label %26

; <label>:26:                                     ; preds = %19, %16, %10
  %27 = phi i1 [ true, %10 ], [ false, %19 ], [ true, %16 ]
  %28 = phi i32 [ %11, %10 ], [ %23, %16 ], [ %23, %19 ]
  %29 = icmp eq i32 %12, 0
  %30 = add nsw i32 %28, -1
  %31 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i32 0, i32 %30
  %32 = load i8, i8* %31, align 1, !tbaa !9
  %33 = add nsw i32 %28, -2
  %34 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i32 0, i32 %33
  %35 = load i8, i8* %34, align 1, !tbaa !9
  %36 = icmp eq i8 %32, %35
  br i1 %29, label %49, label %37

; <label>:37:                                     ; preds = %26
  %38 = select i1 %36, i32 %12, i32 0
  %39 = icmp eq i32 %38, 0
  %40 = icmp eq i32 %28, 129
  %41 = or i1 %40, %39
  %42 = or i1 %27, %41
  br i1 %42, label %43, label %84

; <label>:43:                                     ; preds = %37
  %44 = select i1 %27, i32 %28, i32 %30
  %45 = tail call i32 %8(%struct.stream_t* %1, i32 %44) #4
  %46 = load i8, i8* %4, align 16, !tbaa !9
  %47 = zext i8 %46 to i32
  %48 = tail call i32 %8(%struct.stream_t* %1, i32 %47) #4
  store i8 %32, i8* %4, align 16, !tbaa !9
  br label %84

; <label>:49:                                     ; preds = %26
  br i1 %36, label %50, label %66

; <label>:50:                                     ; preds = %49
  %51 = icmp sgt i32 %28, 2
  br i1 %51, label %52, label %84

; <label>:52:                                     ; preds = %50
  %53 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %7, align 4, !tbaa !12
  %54 = add nsw i32 %28, 126
  %55 = tail call i32 %53(%struct.stream_t* %1, i32 %54) #4
  br label %56

; <label>:56:                                     ; preds = %56, %52
  %57 = phi i32 [ 0, %52 ], [ %63, %56 ]
  %58 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %7, align 4, !tbaa !12
  %59 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i32 0, i32 %57
  %60 = load i8, i8* %59, align 1, !tbaa !9
  %61 = zext i8 %60 to i32
  %62 = tail call i32 %58(%struct.stream_t* nonnull %1, i32 %61) #4
  %63 = add nuw nsw i32 %57, 1
  %64 = icmp eq i32 %63, %33
  br i1 %64, label %65, label %56

; <label>:65:                                     ; preds = %56
  store i8 %32, i8* %9, align 1, !tbaa !9
  store i8 %32, i8* %4, align 16, !tbaa !9
  br label %84

; <label>:66:                                     ; preds = %49
  %67 = icmp eq i32 %28, 128
  %68 = or i1 %27, %67
  br i1 %68, label %69, label %84

; <label>:69:                                     ; preds = %66
  %70 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %7, align 4, !tbaa !12
  %71 = add nsw i32 %28, 128
  %72 = tail call i32 %70(%struct.stream_t* %1, i32 %71) #4
  %73 = icmp sgt i32 %28, 0
  br i1 %73, label %74, label %84

; <label>:74:                                     ; preds = %69
  br label %75

; <label>:75:                                     ; preds = %74, %75
  %76 = phi i32 [ %82, %75 ], [ 0, %74 ]
  %77 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %7, align 4, !tbaa !12
  %78 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i32 0, i32 %76
  %79 = load i8, i8* %78, align 1, !tbaa !9
  %80 = zext i8 %79 to i32
  %81 = tail call i32 %77(%struct.stream_t* nonnull %1, i32 %80) #4
  %82 = add nuw nsw i32 %76, 1
  %83 = icmp eq i32 %82, %28
  br i1 %83, label %84, label %75

; <label>:84:                                     ; preds = %75, %37, %43, %66, %69, %50, %65
  %85 = phi i32 [ 1, %65 ], [ 1, %50 ], [ %38, %43 ], [ %12, %37 ], [ 0, %66 ], [ 0, %69 ], [ 0, %75 ]
  %86 = phi i32 [ 2, %65 ], [ %28, %50 ], [ 1, %43 ], [ %28, %37 ], [ %28, %66 ], [ 0, %69 ], [ 0, %75 ]
  br i1 %27, label %87, label %10

; <label>:87:                                     ; preds = %84
  %88 = tail call i32 %8(%struct.stream_t* %1, i32 -1) #4
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %4) #4
  ret void
}

; Function Attrs: nounwind
define hidden void @decode(%struct.stream_t*, %struct.stream_t*) local_unnamed_addr #2 {
  %3 = bitcast %struct.stream_t* %0 to i32 (%struct.stream_t*)**
  %4 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %3, align 4, !tbaa !14
  %5 = tail call i32 %4(%struct.stream_t* %0) #4
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %9, label %7

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %1, i32 0, i32 1
  br label %10

; <label>:9:                                      ; preds = %34, %2
  ret void

; <label>:10:                                     ; preds = %7, %34
  %11 = phi i32 [ %5, %7 ], [ %36, %34 ]
  %12 = icmp sgt i32 %11, 128
  br i1 %12, label %13, label %23

; <label>:13:                                     ; preds = %10
  %14 = add nsw i32 %11, -128
  br label %15

; <label>:15:                                     ; preds = %15, %13
  %16 = phi i32 [ 0, %13 ], [ %21, %15 ]
  %17 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %8, align 4, !tbaa !12
  %18 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %3, align 4, !tbaa !14
  %19 = tail call i32 %18(%struct.stream_t* nonnull %0) #4
  %20 = tail call i32 %17(%struct.stream_t* %1, i32 %19) #4
  %21 = add nuw nsw i32 %16, 1
  %22 = icmp eq i32 %21, %14
  br i1 %22, label %34, label %15

; <label>:23:                                     ; preds = %10
  %24 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %3, align 4, !tbaa !14
  %25 = tail call i32 %24(%struct.stream_t* nonnull %0) #4
  %26 = icmp sgt i32 %11, 0
  br i1 %26, label %27, label %34

; <label>:27:                                     ; preds = %23
  br label %28

; <label>:28:                                     ; preds = %27, %28
  %29 = phi i32 [ %32, %28 ], [ 0, %27 ]
  %30 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %8, align 4, !tbaa !12
  %31 = tail call i32 %30(%struct.stream_t* %1, i32 %25) #4
  %32 = add nuw nsw i32 %29, 1
  %33 = icmp eq i32 %32, %11
  br i1 %33, label %34, label %28

; <label>:34:                                     ; preds = %28, %15, %23
  %35 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %3, align 4, !tbaa !14
  %36 = tail call i32 %35(%struct.stream_t* %0) #4
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %9, label %10
}

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #2 {
  %1 = alloca [256 x i8], align 16
  %2 = alloca %struct.string_stream, align 4
  %3 = alloca %struct.string_stream, align 4
  %4 = alloca %struct.file_stream, align 4
  %5 = getelementptr inbounds [256 x i8], [256 x i8]* %1, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %5) #4
  %6 = bitcast %struct.string_stream* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull %6, i8* bitcast (%struct.string_stream* @main.str_in to i8*), i32 16, i32 4, i1 false)
  %7 = bitcast %struct.string_stream* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #4
  %8 = getelementptr inbounds %struct.string_stream, %struct.string_stream* %3, i32 0, i32 0
  store i32 (%struct.stream_t*)* @sget, i32 (%struct.stream_t*)** %8, align 4, !tbaa !15
  %9 = getelementptr inbounds %struct.string_stream, %struct.string_stream* %3, i32 0, i32 1
  store i32 (%struct.stream_t*, i32)* @sput, i32 (%struct.stream_t*, i32)** %9, align 4, !tbaa !16
  %10 = getelementptr inbounds %struct.string_stream, %struct.string_stream* %3, i32 0, i32 2
  store i8* %5, i8** %10, align 4, !tbaa !2
  %11 = getelementptr inbounds %struct.string_stream, %struct.string_stream* %3, i32 0, i32 3
  store i32 0, i32* %11, align 4, !tbaa !8
  %12 = bitcast %struct.file_stream* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %12) #4
  %13 = getelementptr inbounds %struct.file_stream, %struct.file_stream* %4, i32 0, i32 0
  store i32 (%struct.stream_t*)* null, i32 (%struct.stream_t*)** %13, align 4, !tbaa !17
  %14 = getelementptr inbounds %struct.file_stream, %struct.file_stream* %4, i32 0, i32 1
  store i32 (%struct.stream_t*, i32)* @file_put, i32 (%struct.stream_t*, i32)** %14, align 4, !tbaa !18
  %15 = getelementptr inbounds %struct.file_stream, %struct.file_stream* %4, i32 0, i32 2
  %16 = load i32, i32* bitcast (%struct._IO_FILE** @stdout to i32*), align 4, !tbaa !19
  %17 = bitcast %struct._IO_FILE** %15 to i32*
  store i32 %16, i32* %17, align 4, !tbaa !10
  %18 = bitcast %struct.string_stream* %2 to %struct.stream_t*
  %19 = bitcast %struct.string_stream* %3 to %struct.stream_t*
  call void @encode(%struct.stream_t* nonnull %18, %struct.stream_t* nonnull %19)
  %20 = bitcast %struct.file_stream* %4 to %struct.stream_t*
  %21 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %8, align 4, !tbaa !14
  %22 = call i32 %21(%struct.stream_t* nonnull %19) #4
  %23 = icmp eq i32 %22, -1
  br i1 %23, label %53, label %24

; <label>:24:                                     ; preds = %0
  br label %25

; <label>:25:                                     ; preds = %24, %49
  %26 = phi i32 [ %51, %49 ], [ %22, %24 ]
  %27 = icmp sgt i32 %26, 128
  br i1 %27, label %28, label %38

; <label>:28:                                     ; preds = %25
  %29 = add nsw i32 %26, -128
  br label %30

; <label>:30:                                     ; preds = %30, %28
  %31 = phi i32 [ 0, %28 ], [ %36, %30 ]
  %32 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %14, align 4, !tbaa !12
  %33 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %8, align 4, !tbaa !14
  %34 = call i32 %33(%struct.stream_t* nonnull %19) #4
  %35 = call i32 %32(%struct.stream_t* nonnull %20, i32 %34) #4
  %36 = add nuw nsw i32 %31, 1
  %37 = icmp eq i32 %36, %29
  br i1 %37, label %49, label %30

; <label>:38:                                     ; preds = %25
  %39 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %8, align 4, !tbaa !14
  %40 = call i32 %39(%struct.stream_t* nonnull %19) #4
  %41 = icmp sgt i32 %26, 0
  br i1 %41, label %42, label %49

; <label>:42:                                     ; preds = %38
  br label %43

; <label>:43:                                     ; preds = %42, %43
  %44 = phi i32 [ %47, %43 ], [ 0, %42 ]
  %45 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %14, align 4, !tbaa !12
  %46 = call i32 %45(%struct.stream_t* nonnull %20, i32 %40) #4
  %47 = add nuw nsw i32 %44, 1
  %48 = icmp eq i32 %47, %26
  br i1 %48, label %49, label %43

; <label>:49:                                     ; preds = %43, %30, %38
  %50 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %8, align 4, !tbaa !14
  %51 = call i32 %50(%struct.stream_t* nonnull %19) #4
  %52 = icmp eq i32 %51, -1
  br i1 %52, label %53, label %25

; <label>:53:                                     ; preds = %49, %0
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %12) #4
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %5) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

attributes #0 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !4, i64 8}
!3 = !{!"", !4, i64 0, !4, i64 4, !4, i64 8, !7, i64 12}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!3, !7, i64 12}
!9 = !{!5, !5, i64 0}
!10 = !{!11, !4, i64 8}
!11 = !{!"", !4, i64 0, !4, i64 4, !4, i64 8}
!12 = !{!13, !4, i64 4}
!13 = !{!"stream_t", !4, i64 0, !4, i64 4}
!14 = !{!13, !4, i64 0}
!15 = !{!3, !4, i64 0}
!16 = !{!3, !4, i64 4}
!17 = !{!11, !4, i64 0}
!18 = !{!11, !4, i64 4}
!19 = !{!4, !4, i64 0}
