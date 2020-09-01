; ModuleID = 'benchmark4pipeline_c/bitwise_IO.c'
source_filename = "benchmark4pipeline_c/bitwise_IO.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.bit_io_t = type { %struct._IO_FILE*, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@main.s = private unnamed_addr constant [12 x i8] c"abcdefghijk\00", align 1
@.str = private unnamed_addr constant [9 x i8] c"test.bin\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"%10s\0A\00", align 1

; Function Attrs: nounwind
define hidden noalias %struct.bit_io_t* @b_attach(%struct._IO_FILE*) local_unnamed_addr #0 {
  %2 = tail call noalias i8* @malloc(i32 12) #3
  %3 = bitcast i8* %2 to %struct.bit_io_t*
  %4 = getelementptr inbounds i8, i8* %2, i32 4
  %5 = bitcast i8* %4 to i32*
  store i32 0, i32* %5, align 4, !tbaa !2
  %6 = getelementptr inbounds i8, i8* %2, i32 8
  %7 = bitcast i8* %6 to i32*
  store i32 0, i32* %7, align 4, !tbaa !8
  %8 = bitcast i8* %2 to %struct._IO_FILE**
  store %struct._IO_FILE* %0, %struct._IO_FILE** %8, align 4, !tbaa !9
  ret %struct.bit_io_t* %3
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
define hidden void @b_write(i8* nocapture readonly, i32, i32, %struct.bit_io_t* nocapture) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %3, i32 0, i32 1
  %6 = load i32, i32* %5, align 4, !tbaa !2
  %7 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %3, i32 0, i32 2
  %8 = load i32, i32* %7, align 4, !tbaa !8
  %9 = icmp ne i32 %1, 0
  %10 = icmp sgt i32 %8, 7
  %11 = or i1 %9, %10
  br i1 %11, label %12, label %85

; <label>:12:                                     ; preds = %4
  %13 = and i32 %2, 7
  %14 = lshr i32 %2, 3
  %15 = getelementptr inbounds i8, i8* %0, i32 %14
  %16 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %3, i32 0, i32 0
  br label %17

; <label>:17:                                     ; preds = %12, %76
  %18 = phi i32 [ %8, %12 ], [ %81, %76 ]
  %19 = phi i32 [ %6, %12 ], [ %80, %76 ]
  %20 = phi i8* [ %15, %12 ], [ %79, %76 ]
  %21 = phi i32 [ %13, %12 ], [ %78, %76 ]
  %22 = phi i32 [ %1, %12 ], [ %77, %76 ]
  %23 = icmp sgt i32 %18, 7
  br i1 %23, label %24, label %45

; <label>:24:                                     ; preds = %17
  %25 = add i32 %18, 8
  %26 = xor i32 %18, -1
  %27 = icmp sgt i32 %26, -16
  %28 = select i1 %27, i32 %26, i32 -16
  %29 = add i32 %25, %28
  %30 = and i32 %29, -8
  br label %31

; <label>:31:                                     ; preds = %24, %31
  %32 = phi i32 [ %18, %24 ], [ %34, %31 ]
  %33 = phi i32 [ %19, %24 ], [ %40, %31 ]
  %34 = add nsw i32 %32, -8
  %35 = lshr i32 %33, %34
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 4, !tbaa !9
  %37 = tail call i32 @fputc(i32 %35, %struct._IO_FILE* %36)
  %38 = shl i32 1, %34
  %39 = add nsw i32 %38, -1
  %40 = and i32 %39, %33
  %41 = icmp sgt i32 %32, 15
  br i1 %41, label %31, label %42

; <label>:42:                                     ; preds = %31
  %43 = add i32 %18, -8
  %44 = sub i32 %43, %30
  br label %45

; <label>:45:                                     ; preds = %42, %17
  %46 = phi i32 [ %19, %17 ], [ %40, %42 ]
  %47 = phi i32 [ %18, %17 ], [ %44, %42 ]
  %48 = icmp slt i32 %47, 8
  %49 = icmp ne i32 %22, 0
  %50 = and i1 %49, %48
  br i1 %50, label %51, label %76

; <label>:51:                                     ; preds = %45
  br label %52

; <label>:52:                                     ; preds = %51, %52
  %53 = phi i32 [ %67, %52 ], [ %47, %51 ]
  %54 = phi i32 [ %65, %52 ], [ %46, %51 ]
  %55 = phi i8* [ %72, %52 ], [ %20, %51 ]
  %56 = phi i32 [ %71, %52 ], [ %21, %51 ]
  %57 = phi i32 [ %66, %52 ], [ %22, %51 ]
  %58 = shl i32 %54, 1
  %59 = lshr i32 128, %56
  %60 = load i8, i8* %55, align 1, !tbaa !10
  %61 = zext i8 %60 to i32
  %62 = and i32 %59, %61
  %63 = sub i32 7, %56
  %64 = lshr i32 %62, %63
  %65 = or i32 %64, %58
  %66 = add i32 %57, -1
  %67 = add nsw i32 %53, 1
  %68 = add i32 %56, 1
  %69 = icmp eq i32 %68, 8
  %70 = getelementptr inbounds i8, i8* %55, i32 1
  %71 = select i1 %69, i32 0, i32 %68
  %72 = select i1 %69, i8* %70, i8* %55
  %73 = icmp slt i32 %53, 7
  %74 = icmp ne i32 %66, 0
  %75 = and i1 %74, %73
  br i1 %75, label %52, label %76

; <label>:76:                                     ; preds = %52, %45
  %77 = phi i32 [ %22, %45 ], [ %66, %52 ]
  %78 = phi i32 [ %21, %45 ], [ %71, %52 ]
  %79 = phi i8* [ %20, %45 ], [ %72, %52 ]
  %80 = phi i32 [ %46, %45 ], [ %65, %52 ]
  %81 = phi i32 [ %47, %45 ], [ %67, %52 ]
  %82 = icmp ne i32 %77, 0
  %83 = icmp sgt i32 %81, 7
  %84 = or i1 %82, %83
  br i1 %84, label %17, label %85

; <label>:85:                                     ; preds = %76, %4
  %86 = phi i32 [ %6, %4 ], [ %80, %76 ]
  %87 = phi i32 [ %8, %4 ], [ %81, %76 ]
  store i32 %86, i32* %5, align 4, !tbaa !2
  store i32 %87, i32* %7, align 4, !tbaa !8
  ret void
}

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
define hidden i32 @b_read(i8* nocapture, i32, i32, %struct.bit_io_t* nocapture) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %3, i32 0, i32 1
  %6 = load i32, i32* %5, align 4, !tbaa !2
  %7 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %3, i32 0, i32 2
  %8 = load i32, i32* %7, align 4, !tbaa !8
  %9 = icmp eq i32 %1, 0
  br i1 %9, label %69, label %10

; <label>:10:                                     ; preds = %4
  %11 = and i32 %2, 7
  %12 = lshr i32 %2, 3
  %13 = getelementptr inbounds i8, i8* %0, i32 %12
  %14 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %3, i32 0, i32 0
  br label %15

; <label>:15:                                     ; preds = %10, %62
  %16 = phi i8* [ %13, %10 ], [ %60, %62 ]
  %17 = phi i32 [ %1, %10 ], [ %59, %62 ]
  %18 = phi i32 [ %8, %10 ], [ %67, %62 ]
  %19 = phi i32 [ %6, %10 ], [ %66, %62 ]
  %20 = phi i32 [ %11, %10 ], [ %57, %62 ]
  %21 = icmp ne i32 %18, 0
  %22 = icmp ne i32 %17, 0
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %56

; <label>:24:                                     ; preds = %15
  br label %25

; <label>:25:                                     ; preds = %24, %44
  %26 = phi i8* [ %52, %44 ], [ %16, %24 ]
  %27 = phi i32 [ %47, %44 ], [ %17, %24 ]
  %28 = phi i32 [ %30, %44 ], [ %18, %24 ]
  %29 = phi i32 [ %51, %44 ], [ %20, %24 ]
  %30 = add nsw i32 %28, -1
  %31 = shl i32 1, %30
  %32 = and i32 %31, %19
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %39, label %34

; <label>:34:                                     ; preds = %25
  %35 = lshr i32 128, %29
  %36 = load i8, i8* %26, align 1, !tbaa !10
  %37 = zext i8 %36 to i32
  %38 = or i32 %35, %37
  br label %44

; <label>:39:                                     ; preds = %25
  %40 = ashr i32 -129, %29
  %41 = load i8, i8* %26, align 1, !tbaa !10
  %42 = zext i8 %41 to i32
  %43 = and i32 %40, %42
  br label %44

; <label>:44:                                     ; preds = %39, %34
  %45 = phi i32 [ %43, %39 ], [ %38, %34 ]
  %46 = trunc i32 %45 to i8
  store i8 %46, i8* %26, align 1, !tbaa !10
  %47 = add i32 %27, -1
  %48 = add i32 %29, 1
  %49 = icmp ugt i32 %48, 7
  %50 = getelementptr inbounds i8, i8* %26, i32 1
  %51 = select i1 %49, i32 0, i32 %48
  %52 = select i1 %49, i8* %50, i8* %26
  %53 = icmp ne i32 %30, 0
  %54 = icmp ne i32 %47, 0
  %55 = and i1 %53, %54
  br i1 %55, label %25, label %56

; <label>:56:                                     ; preds = %44, %15
  %57 = phi i32 [ %20, %15 ], [ %51, %44 ]
  %58 = phi i32 [ %18, %15 ], [ %30, %44 ]
  %59 = phi i32 [ %17, %15 ], [ %47, %44 ]
  %60 = phi i8* [ %16, %15 ], [ %52, %44 ]
  %61 = phi i1 [ %22, %15 ], [ %54, %44 ]
  br i1 %61, label %62, label %69

; <label>:62:                                     ; preds = %56
  %63 = shl i32 %19, 8
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 4, !tbaa !9
  %65 = tail call i32 @fgetc(%struct._IO_FILE* %64)
  %66 = or i32 %65, %63
  %67 = add nsw i32 %58, 8
  %68 = icmp eq i32 %59, 0
  br i1 %68, label %69, label %15

; <label>:69:                                     ; preds = %56, %62, %4
  %70 = phi i32 [ %6, %4 ], [ %66, %62 ], [ %19, %56 ]
  %71 = phi i32 [ %8, %4 ], [ %67, %62 ], [ %58, %56 ]
  store i32 %70, i32* %5, align 4, !tbaa !2
  store i32 %71, i32* %7, align 4, !tbaa !8
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @fgetc(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
define hidden void @b_detach(%struct.bit_io_t* nocapture) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %0, i32 0, i32 2
  %3 = load i32, i32* %2, align 4, !tbaa !8
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %13, label %5

; <label>:5:                                      ; preds = %1
  %6 = sub nsw i32 8, %3
  %7 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %0, i32 0, i32 1
  %8 = load i32, i32* %7, align 4, !tbaa !2
  %9 = shl i32 %8, %6
  store i32 %9, i32* %7, align 4, !tbaa !2
  %10 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %0, i32 0, i32 0
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 4, !tbaa !9
  %12 = tail call i32 @fputc(i32 %9, %struct._IO_FILE* %11)
  br label %13

; <label>:13:                                     ; preds = %1, %5
  %14 = bitcast %struct.bit_io_t* %0 to i8*
  tail call void @free(i8* %14) #3
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
  %1 = alloca [12 x i8], align 1
  %2 = alloca [11 x i8], align 1
  %3 = getelementptr inbounds [12 x i8], [12 x i8]* %1, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %3) #3
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull %3, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @main.s, i32 0, i32 0), i32 12, i32 1, i1 false)
  %4 = getelementptr inbounds [11 x i8], [11 x i8]* %2, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %4) #3
  call void @llvm.memset.p0i8.i32(i8* nonnull %4, i8 0, i32 11, i32 1, i1 false)
  %5 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  %6 = tail call noalias i8* @malloc(i32 12) #3
  %7 = getelementptr inbounds i8, i8* %6, i32 4
  %8 = bitcast i8* %7 to i32*
  store i32 0, i32* %8, align 4, !tbaa !2
  %9 = getelementptr inbounds i8, i8* %6, i32 8
  %10 = bitcast i8* %9 to i32*
  store i32 0, i32* %10, align 4, !tbaa !8
  %11 = bitcast i8* %6 to %struct._IO_FILE**
  store %struct._IO_FILE* %5, %struct._IO_FILE** %11, align 4, !tbaa !9
  br label %12

; <label>:12:                                     ; preds = %84, %0
  %13 = phi i32 [ 0, %0 ], [ %80, %84 ]
  %14 = phi i32 [ 0, %0 ], [ %79, %84 ]
  %15 = phi i32 [ 0, %0 ], [ %85, %84 ]
  %16 = getelementptr inbounds [12 x i8], [12 x i8]* %1, i32 0, i32 %15
  br label %17

; <label>:17:                                     ; preds = %75, %12
  %18 = phi i32 [ %13, %12 ], [ %80, %75 ]
  %19 = phi i32 [ %14, %12 ], [ %79, %75 ]
  %20 = phi i8* [ %16, %12 ], [ %78, %75 ]
  %21 = phi i32 [ 1, %12 ], [ %77, %75 ]
  %22 = phi i32 [ 7, %12 ], [ %76, %75 ]
  %23 = icmp sgt i32 %18, 7
  br i1 %23, label %24, label %44

; <label>:24:                                     ; preds = %17
  %25 = add i32 %18, 8
  %26 = xor i32 %18, -1
  %27 = icmp sgt i32 %26, -16
  %28 = select i1 %27, i32 %26, i32 -16
  %29 = add i32 %25, %28
  br label %30

; <label>:30:                                     ; preds = %30, %24
  %31 = phi i32 [ %18, %24 ], [ %33, %30 ]
  %32 = phi i32 [ %19, %24 ], [ %38, %30 ]
  %33 = add nsw i32 %31, -8
  %34 = lshr i32 %32, %33
  %35 = tail call i32 @fputc(i32 %34, %struct._IO_FILE* %5) #3
  %36 = shl i32 1, %33
  %37 = add nsw i32 %36, -1
  %38 = and i32 %37, %32
  %39 = icmp sgt i32 %31, 15
  br i1 %39, label %30, label %40

; <label>:40:                                     ; preds = %30
  %41 = and i32 %29, -8
  %42 = add i32 %18, -8
  %43 = sub i32 %42, %41
  br label %44

; <label>:44:                                     ; preds = %40, %17
  %45 = phi i32 [ %19, %17 ], [ %38, %40 ]
  %46 = phi i32 [ %18, %17 ], [ %43, %40 ]
  %47 = icmp slt i32 %46, 8
  %48 = icmp ne i32 %22, 0
  %49 = and i1 %48, %47
  br i1 %49, label %50, label %75

; <label>:50:                                     ; preds = %44
  br label %51

; <label>:51:                                     ; preds = %50, %51
  %52 = phi i32 [ %66, %51 ], [ %46, %50 ]
  %53 = phi i32 [ %64, %51 ], [ %45, %50 ]
  %54 = phi i8* [ %71, %51 ], [ %20, %50 ]
  %55 = phi i32 [ %70, %51 ], [ %21, %50 ]
  %56 = phi i32 [ %65, %51 ], [ %22, %50 ]
  %57 = shl i32 %53, 1
  %58 = lshr i32 128, %55
  %59 = load i8, i8* %54, align 1, !tbaa !10
  %60 = zext i8 %59 to i32
  %61 = and i32 %58, %60
  %62 = sub i32 7, %55
  %63 = lshr i32 %61, %62
  %64 = or i32 %63, %57
  %65 = add i32 %56, -1
  %66 = add nsw i32 %52, 1
  %67 = add i32 %55, 1
  %68 = icmp eq i32 %67, 8
  %69 = getelementptr inbounds i8, i8* %54, i32 1
  %70 = select i1 %68, i32 0, i32 %67
  %71 = select i1 %68, i8* %69, i8* %54
  %72 = icmp slt i32 %52, 7
  %73 = icmp ne i32 %65, 0
  %74 = and i1 %72, %73
  br i1 %74, label %51, label %75

; <label>:75:                                     ; preds = %51, %44
  %76 = phi i32 [ %22, %44 ], [ %65, %51 ]
  %77 = phi i32 [ %21, %44 ], [ %70, %51 ]
  %78 = phi i8* [ %20, %44 ], [ %71, %51 ]
  %79 = phi i32 [ %45, %44 ], [ %64, %51 ]
  %80 = phi i32 [ %46, %44 ], [ %66, %51 ]
  %81 = icmp ne i32 %76, 0
  %82 = icmp sgt i32 %80, 7
  %83 = or i1 %81, %82
  br i1 %83, label %17, label %84

; <label>:84:                                     ; preds = %75
  store i32 %79, i32* %8, align 4, !tbaa !2
  store i32 %80, i32* %10, align 4, !tbaa !8
  %85 = add nuw nsw i32 %15, 1
  %86 = icmp eq i32 %85, 10
  br i1 %86, label %87, label %12

; <label>:87:                                     ; preds = %84
  %88 = icmp eq i32 %80, 0
  br i1 %88, label %94, label %89

; <label>:89:                                     ; preds = %87
  %90 = sub nsw i32 8, %80
  %91 = shl i32 %79, %90
  store i32 %91, i32* %8, align 4, !tbaa !2
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 4, !tbaa !9
  %93 = tail call i32 @fputc(i32 %91, %struct._IO_FILE* %92) #3
  br label %94

; <label>:94:                                     ; preds = %87, %89
  tail call void @free(i8* nonnull %6) #3
  %95 = tail call i32 @fclose(%struct._IO_FILE* %5)
  %96 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  %97 = tail call noalias i8* @malloc(i32 12) #3
  %98 = getelementptr inbounds i8, i8* %97, i32 4
  %99 = bitcast i8* %98 to i32*
  store i32 0, i32* %99, align 4, !tbaa !2
  %100 = getelementptr inbounds i8, i8* %97, i32 8
  %101 = bitcast i8* %100 to i32*
  store i32 0, i32* %101, align 4, !tbaa !8
  %102 = bitcast i8* %97 to %struct._IO_FILE**
  store %struct._IO_FILE* %96, %struct._IO_FILE** %102, align 4, !tbaa !9
  br label %103

; <label>:103:                                    ; preds = %162, %94
  %104 = phi i32 [ 0, %94 ], [ %164, %162 ]
  %105 = phi i32 [ 0, %94 ], [ %163, %162 ]
  %106 = phi i32 [ 0, %94 ], [ %165, %162 ]
  %107 = getelementptr inbounds [11 x i8], [11 x i8]* %2, i32 0, i32 %106
  br label %108

; <label>:108:                                    ; preds = %155, %103
  %109 = phi i8* [ %107, %103 ], [ %153, %155 ]
  %110 = phi i32 [ 7, %103 ], [ %152, %155 ]
  %111 = phi i32 [ %104, %103 ], [ %160, %155 ]
  %112 = phi i32 [ %105, %103 ], [ %159, %155 ]
  %113 = phi i32 [ 1, %103 ], [ %150, %155 ]
  %114 = icmp ne i32 %111, 0
  %115 = icmp ne i32 %110, 0
  %116 = and i1 %115, %114
  br i1 %116, label %117, label %149

; <label>:117:                                    ; preds = %108
  br label %118

; <label>:118:                                    ; preds = %117, %137
  %119 = phi i8* [ %145, %137 ], [ %109, %117 ]
  %120 = phi i32 [ %140, %137 ], [ %110, %117 ]
  %121 = phi i32 [ %123, %137 ], [ %111, %117 ]
  %122 = phi i32 [ %144, %137 ], [ %113, %117 ]
  %123 = add nsw i32 %121, -1
  %124 = shl i32 1, %123
  %125 = and i32 %124, %112
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %132, label %127

; <label>:127:                                    ; preds = %118
  %128 = lshr i32 128, %122
  %129 = load i8, i8* %119, align 1, !tbaa !10
  %130 = zext i8 %129 to i32
  %131 = or i32 %128, %130
  br label %137

; <label>:132:                                    ; preds = %118
  %133 = ashr i32 -129, %122
  %134 = load i8, i8* %119, align 1, !tbaa !10
  %135 = zext i8 %134 to i32
  %136 = and i32 %133, %135
  br label %137

; <label>:137:                                    ; preds = %132, %127
  %138 = phi i32 [ %136, %132 ], [ %131, %127 ]
  %139 = trunc i32 %138 to i8
  store i8 %139, i8* %119, align 1, !tbaa !10
  %140 = add i32 %120, -1
  %141 = add i32 %122, 1
  %142 = icmp ugt i32 %141, 7
  %143 = getelementptr inbounds i8, i8* %119, i32 1
  %144 = select i1 %142, i32 0, i32 %141
  %145 = select i1 %142, i8* %143, i8* %119
  %146 = icmp ne i32 %123, 0
  %147 = icmp ne i32 %140, 0
  %148 = and i1 %147, %146
  br i1 %148, label %118, label %149

; <label>:149:                                    ; preds = %137, %108
  %150 = phi i32 [ %113, %108 ], [ %144, %137 ]
  %151 = phi i32 [ %111, %108 ], [ %123, %137 ]
  %152 = phi i32 [ %110, %108 ], [ %140, %137 ]
  %153 = phi i8* [ %109, %108 ], [ %145, %137 ]
  %154 = phi i1 [ %115, %108 ], [ %147, %137 ]
  br i1 %154, label %155, label %162

; <label>:155:                                    ; preds = %149
  %156 = shl i32 %112, 8
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** %102, align 4, !tbaa !9
  %158 = tail call i32 @fgetc(%struct._IO_FILE* %157) #3
  %159 = or i32 %158, %156
  %160 = add nsw i32 %151, 8
  %161 = icmp eq i32 %152, 0
  br i1 %161, label %162, label %108

; <label>:162:                                    ; preds = %149, %155
  %163 = phi i32 [ %159, %155 ], [ %112, %149 ]
  %164 = phi i32 [ %160, %155 ], [ %151, %149 ]
  store i32 %163, i32* %99, align 4, !tbaa !2
  store i32 %164, i32* %101, align 4, !tbaa !8
  %165 = add nuw nsw i32 %106, 1
  %166 = icmp eq i32 %165, 10
  br i1 %166, label %167, label %103

; <label>:167:                                    ; preds = %162
  %168 = icmp eq i32 %164, 0
  br i1 %168, label %174, label %169

; <label>:169:                                    ; preds = %167
  %170 = sub nsw i32 8, %164
  %171 = shl i32 %163, %170
  store i32 %171, i32* %99, align 4, !tbaa !2
  %172 = load %struct._IO_FILE*, %struct._IO_FILE** %102, align 4, !tbaa !9
  %173 = tail call i32 @fputc(i32 %171, %struct._IO_FILE* %172) #3
  br label %174

; <label>:174:                                    ; preds = %167, %169
  tail call void @free(i8* nonnull %97) #3
  %175 = tail call i32 @fclose(%struct._IO_FILE* %96)
  %176 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* nonnull %4)
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %4) #3
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %3) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !7, i64 4}
!3 = !{!"", !4, i64 0, !7, i64 4, !7, i64 8}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!3, !7, i64 8}
!9 = !{!3, !4, i64 0}
!10 = !{!5, !5, i64 0}
