; ModuleID = 'benchmark4pipeline_c/zebra_puzzle.c'
source_filename = "benchmark4pipeline_c/zebra_puzzle.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@.str = private unnamed_addr constant [4 x i8] c"Red\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"Green\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"White\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Yellow\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Blue\00", align 1
@printHouses.color = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)], align 16
@.str.5 = private unnamed_addr constant [8 x i8] c"English\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"Swede\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"Dane\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"German\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"Norwegian\00", align 1
@printHouses.man = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i32 0, i32 0)], align 16
@.str.10 = private unnamed_addr constant [4 x i8] c"Tea\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"Coffee\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"Milk\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"Beer\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"Water\00", align 1
@printHouses.drink = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0)], align 16
@.str.15 = private unnamed_addr constant [4 x i8] c"Dog\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"Birds\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"Cats\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"Horse\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"Zebra\00", align 1
@printHouses.animal = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0)], align 16
@.str.20 = private unnamed_addr constant [9 x i8] c"PallMall\00", align 1
@.str.21 = private unnamed_addr constant [8 x i8] c"Dunhill\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"Blend\00", align 1
@.str.23 = private unnamed_addr constant [11 x i8] c"BlueMaster\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"Prince\00", align 1
@printHouses.smoke = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i32 0, i32 0)], align 16
@.str.25 = private unnamed_addr constant [50 x i8] c"%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s\0A\00", align 1
@.str.26 = private unnamed_addr constant [6 x i8] c"House\00", align 1
@.str.27 = private unnamed_addr constant [6 x i8] c"Color\00", align 1
@.str.28 = private unnamed_addr constant [4 x i8] c"Man\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"Drink\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"Animal\00", align 1
@.str.31 = private unnamed_addr constant [6 x i8] c"Smoke\00", align 1
@.str.32 = private unnamed_addr constant [6 x i8] c"%-10d\00", align 1
@.str.33 = private unnamed_addr constant [9 x i8] c"%-10.10s\00", align 1
@.str.35 = private unnamed_addr constant [10 x i8] c"%-10.10s\0A\00", align 1
@main.ha = private unnamed_addr constant [5 x [5 x i32]] [[5 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], [5 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], [5 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], [5 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], [5 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1]], align 16
@str = private unnamed_addr constant [2 x i8] c"-\00", align 1

; Function Attrs: nounwind
define hidden void @printHouses([5 x i32]* nocapture readonly) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.31, i32 0, i32 0))
  br label %4

; <label>:3:                                      ; preds = %56
  ret void

; <label>:4:                                      ; preds = %56, %1
  %5 = phi i32 [ 0, %1 ], [ %57, %56 ]
  %6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.32, i32 0, i32 0), i32 %5)
  %7 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %5, i32 0
  %8 = load i32, i32* %7, align 4, !tbaa !2
  %9 = icmp sgt i32 %8, -1
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %4
  %11 = getelementptr inbounds [5 x i8*], [5 x i8*]* @printHouses.color, i32 0, i32 %8
  %12 = load i8*, i8** %11, align 4, !tbaa !6
  %13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* %12)
  br label %16

; <label>:14:                                     ; preds = %4
  %15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %16

; <label>:16:                                     ; preds = %14, %10
  %17 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %5, i32 1
  %18 = load i32, i32* %17, align 4, !tbaa !2
  %19 = icmp sgt i32 %18, -1
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %16
  %21 = getelementptr inbounds [5 x i8*], [5 x i8*]* @printHouses.man, i32 0, i32 %18
  %22 = load i8*, i8** %21, align 4, !tbaa !6
  %23 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* %22)
  br label %26

; <label>:24:                                     ; preds = %16
  %25 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %26

; <label>:26:                                     ; preds = %24, %20
  %27 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %5, i32 2
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = icmp sgt i32 %28, -1
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %26
  %31 = getelementptr inbounds [5 x i8*], [5 x i8*]* @printHouses.drink, i32 0, i32 %28
  %32 = load i8*, i8** %31, align 4, !tbaa !6
  %33 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* %32)
  br label %36

; <label>:34:                                     ; preds = %26
  %35 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %36

; <label>:36:                                     ; preds = %34, %30
  %37 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %5, i32 3
  %38 = load i32, i32* %37, align 4, !tbaa !2
  %39 = icmp sgt i32 %38, -1
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %36
  %41 = getelementptr inbounds [5 x i8*], [5 x i8*]* @printHouses.animal, i32 0, i32 %38
  %42 = load i8*, i8** %41, align 4, !tbaa !6
  %43 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* %42)
  br label %46

; <label>:44:                                     ; preds = %36
  %45 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %46

; <label>:46:                                     ; preds = %44, %40
  %47 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %5, i32 4
  %48 = load i32, i32* %47, align 4, !tbaa !2
  %49 = icmp sgt i32 %48, -1
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %46
  %51 = getelementptr inbounds [5 x i8*], [5 x i8*]* @printHouses.smoke, i32 0, i32 %48
  %52 = load i8*, i8** %51, align 4, !tbaa !6
  %53 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.35, i32 0, i32 0), i8* %52)
  br label %56

; <label>:54:                                     ; preds = %46
  %55 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %56

; <label>:56:                                     ; preds = %50, %54
  %57 = add nuw nsw i32 %5, 1
  %58 = icmp eq i32 %57, 5
  br i1 %58, label %3, label %4
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind readonly
define hidden i32 @checkHouses([5 x i32]* readonly) local_unnamed_addr #3 {
  %2 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 2, i32 2
  %3 = load i32, i32* %2, align 4, !tbaa !2
  %4 = icmp slt i32 %3, 0
  %5 = icmp eq i32 %3, 2
  %6 = or i1 %4, %5
  br i1 %6, label %7, label %290

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 0, i32 1
  %9 = load i32, i32* %8, align 4, !tbaa !2
  %10 = icmp slt i32 %9, 0
  %11 = icmp eq i32 %9, 4
  %12 = or i1 %10, %11
  br i1 %12, label %13, label %290

; <label>:13:                                     ; preds = %7
  br label %14

; <label>:14:                                     ; preds = %13, %266
  %15 = phi i32 [ %267, %266 ], [ 0, %13 ]
  %16 = phi i32 [ %75, %266 ], [ 0, %13 ]
  %17 = phi i32 [ %74, %266 ], [ 0, %13 ]
  %18 = phi i32 [ %65, %266 ], [ 0, %13 ]
  %19 = phi i32 [ %64, %266 ], [ 0, %13 ]
  %20 = phi i32 [ %55, %266 ], [ 0, %13 ]
  %21 = phi i32 [ %54, %266 ], [ 0, %13 ]
  %22 = phi i32 [ %45, %266 ], [ 0, %13 ]
  %23 = phi i32 [ %44, %266 ], [ 0, %13 ]
  %24 = phi i32 [ %35, %266 ], [ 0, %13 ]
  %25 = phi i32 [ %34, %266 ], [ 0, %13 ]
  %26 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %15, i32 0
  %27 = load i32, i32* %26, align 4, !tbaa !2
  %28 = icmp sgt i32 %27, -1
  br i1 %28, label %29, label %33

; <label>:29:                                     ; preds = %14
  %30 = shl i32 1, %27
  %31 = add nsw i32 %30, %25
  %32 = or i32 %30, %24
  br label %33

; <label>:33:                                     ; preds = %29, %14
  %34 = phi i32 [ %31, %29 ], [ %25, %14 ]
  %35 = phi i32 [ %32, %29 ], [ %24, %14 ]
  %36 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %15, i32 1
  %37 = load i32, i32* %36, align 4, !tbaa !2
  %38 = icmp sgt i32 %37, -1
  br i1 %38, label %39, label %43

; <label>:39:                                     ; preds = %33
  %40 = shl i32 1, %37
  %41 = add nsw i32 %40, %23
  %42 = or i32 %40, %22
  br label %43

; <label>:43:                                     ; preds = %39, %33
  %44 = phi i32 [ %41, %39 ], [ %23, %33 ]
  %45 = phi i32 [ %42, %39 ], [ %22, %33 ]
  %46 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %15, i32 2
  %47 = load i32, i32* %46, align 4, !tbaa !2
  %48 = icmp sgt i32 %47, -1
  br i1 %48, label %49, label %53

; <label>:49:                                     ; preds = %43
  %50 = shl i32 1, %47
  %51 = add nsw i32 %50, %21
  %52 = or i32 %50, %20
  br label %53

; <label>:53:                                     ; preds = %49, %43
  %54 = phi i32 [ %51, %49 ], [ %21, %43 ]
  %55 = phi i32 [ %52, %49 ], [ %20, %43 ]
  %56 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %15, i32 3
  %57 = load i32, i32* %56, align 4, !tbaa !2
  %58 = icmp sgt i32 %57, -1
  br i1 %58, label %59, label %63

; <label>:59:                                     ; preds = %53
  %60 = shl i32 1, %57
  %61 = add nsw i32 %60, %19
  %62 = or i32 %60, %18
  br label %63

; <label>:63:                                     ; preds = %59, %53
  %64 = phi i32 [ %61, %59 ], [ %19, %53 ]
  %65 = phi i32 [ %62, %59 ], [ %18, %53 ]
  %66 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %15, i32 4
  %67 = load i32, i32* %66, align 4, !tbaa !2
  %68 = icmp sgt i32 %67, -1
  br i1 %68, label %69, label %73

; <label>:69:                                     ; preds = %63
  %70 = shl i32 1, %67
  %71 = add nsw i32 %70, %17
  %72 = or i32 %70, %16
  br label %73

; <label>:73:                                     ; preds = %69, %63
  %74 = phi i32 [ %71, %69 ], [ %17, %63 ]
  %75 = phi i32 [ %72, %69 ], [ %16, %63 ]
  br i1 %38, label %76, label %103

; <label>:76:                                     ; preds = %73
  br i1 %28, label %77, label %85

; <label>:77:                                     ; preds = %76
  %78 = icmp ne i32 %37, 0
  %79 = icmp eq i32 %27, 0
  %80 = or i1 %79, %78
  br i1 %80, label %81, label %290

; <label>:81:                                     ; preds = %77
  %82 = icmp eq i32 %37, 0
  %83 = xor i1 %79, true
  %84 = or i1 %82, %83
  br i1 %84, label %85, label %290

; <label>:85:                                     ; preds = %81, %76
  br i1 %58, label %86, label %94

; <label>:86:                                     ; preds = %85
  %87 = icmp ne i32 %37, 1
  %88 = icmp eq i32 %57, 0
  %89 = or i1 %87, %88
  br i1 %89, label %90, label %290

; <label>:90:                                     ; preds = %86
  %91 = icmp eq i32 %37, 1
  %92 = xor i1 %88, true
  %93 = or i1 %91, %92
  br i1 %93, label %94, label %290

; <label>:94:                                     ; preds = %90, %85
  br i1 %48, label %95, label %103

; <label>:95:                                     ; preds = %94
  %96 = icmp ne i32 %37, 2
  %97 = icmp eq i32 %47, 0
  %98 = or i1 %96, %97
  br i1 %98, label %99, label %290

; <label>:99:                                     ; preds = %95
  %100 = icmp eq i32 %37, 2
  %101 = xor i1 %97, true
  %102 = or i1 %100, %101
  br i1 %102, label %103, label %290

; <label>:103:                                    ; preds = %99, %73, %94
  %104 = icmp ne i32 %15, 0
  br i1 %104, label %105, label %117

; <label>:105:                                    ; preds = %103
  br i1 %28, label %106, label %129

; <label>:106:                                    ; preds = %105
  %107 = add nsw i32 %15, -1
  %108 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %107, i32 0
  %109 = load i32, i32* %108, align 4, !tbaa !2
  %110 = icmp ne i32 %109, 1
  %111 = icmp eq i32 %27, 2
  %112 = or i1 %111, %110
  br i1 %112, label %113, label %290

; <label>:113:                                    ; preds = %106
  %114 = icmp eq i32 %109, 1
  %115 = xor i1 %111, true
  %116 = or i1 %114, %115
  br i1 %116, label %120, label %290

; <label>:117:                                    ; preds = %103
  %118 = or i32 %47, %27
  %119 = icmp slt i32 %118, 0
  br i1 %119, label %129, label %121

; <label>:120:                                    ; preds = %113
  br i1 %48, label %121, label %129

; <label>:121:                                    ; preds = %117, %120
  %122 = icmp ne i32 %27, 1
  %123 = icmp eq i32 %47, 1
  %124 = or i1 %122, %123
  br i1 %124, label %125, label %290

; <label>:125:                                    ; preds = %121
  %126 = icmp eq i32 %27, 1
  %127 = xor i1 %123, true
  %128 = or i1 %126, %127
  br i1 %128, label %129, label %290

; <label>:129:                                    ; preds = %125, %117, %105, %120
  br i1 %68, label %130, label %210

; <label>:130:                                    ; preds = %129
  br i1 %58, label %131, label %139

; <label>:131:                                    ; preds = %130
  %132 = icmp ne i32 %67, 0
  %133 = icmp eq i32 %57, 1
  %134 = or i1 %133, %132
  br i1 %134, label %135, label %290

; <label>:135:                                    ; preds = %131
  %136 = icmp eq i32 %67, 0
  %137 = xor i1 %133, true
  %138 = or i1 %136, %137
  br i1 %138, label %139, label %290

; <label>:139:                                    ; preds = %135, %130
  br i1 %28, label %140, label %147

; <label>:140:                                    ; preds = %139
  %141 = icmp ne i32 %67, 1
  %142 = icmp eq i32 %27, 3
  %143 = or i1 %142, %141
  br i1 %143, label %144, label %290

; <label>:144:                                    ; preds = %140
  %145 = icmp eq i32 %67, 1
  br i1 %145, label %174, label %146

; <label>:146:                                    ; preds = %144
  br i1 %142, label %290, label %147

; <label>:147:                                    ; preds = %146, %139
  switch i32 %67, label %200 [
    i32 2, label %148
    i32 1, label %174
  ]

; <label>:148:                                    ; preds = %147
  %149 = trunc i32 %15 to i31
  switch i31 %149, label %162 [
    i31 0, label %150
    i31 4, label %157
  ]

; <label>:150:                                    ; preds = %148
  %151 = add nuw nsw i32 %15, 1
  %152 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %151, i32 3
  %153 = load i32, i32* %152, align 4, !tbaa !2
  %154 = icmp slt i32 %153, 0
  %155 = icmp eq i32 %153, 2
  %156 = or i1 %154, %155
  br i1 %156, label %162, label %290

; <label>:157:                                    ; preds = %148
  %158 = add nsw i32 %15, -1
  %159 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %158, i32 3
  %160 = load i32, i32* %159, align 4, !tbaa !2
  %161 = icmp eq i32 %160, 2
  br i1 %161, label %162, label %290

; <label>:162:                                    ; preds = %150, %148, %157
  %163 = add nuw nsw i32 %15, 1
  %164 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %163, i32 3
  %165 = load i32, i32* %164, align 4, !tbaa !2
  %166 = icmp slt i32 %165, 0
  %167 = icmp eq i32 %165, 2
  %168 = or i1 %166, %167
  br i1 %168, label %200, label %169

; <label>:169:                                    ; preds = %162
  %170 = add nsw i32 %15, -1
  %171 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %170, i32 3
  %172 = load i32, i32* %171, align 4, !tbaa !2
  %173 = icmp eq i32 %172, 2
  br i1 %173, label %200, label %290

; <label>:174:                                    ; preds = %144, %147
  %175 = trunc i32 %15 to i31
  switch i31 %175, label %188 [
    i31 0, label %176
    i31 4, label %183
  ]

; <label>:176:                                    ; preds = %174
  %177 = add nuw nsw i32 %15, 1
  %178 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %177, i32 3
  %179 = load i32, i32* %178, align 4, !tbaa !2
  %180 = icmp slt i32 %179, 0
  %181 = icmp eq i32 %179, 3
  %182 = or i1 %180, %181
  br i1 %182, label %188, label %290

; <label>:183:                                    ; preds = %174
  %184 = add nsw i32 %15, -1
  %185 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %184, i32 3
  %186 = load i32, i32* %185, align 4, !tbaa !2
  %187 = icmp eq i32 %186, 3
  br i1 %187, label %188, label %290

; <label>:188:                                    ; preds = %176, %174, %183
  %189 = add nuw nsw i32 %15, 1
  %190 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %189, i32 3
  %191 = load i32, i32* %190, align 4, !tbaa !2
  %192 = icmp slt i32 %191, 0
  %193 = icmp eq i32 %191, 3
  %194 = or i1 %192, %193
  br i1 %194, label %200, label %195

; <label>:195:                                    ; preds = %188
  %196 = add nsw i32 %15, -1
  %197 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %196, i32 3
  %198 = load i32, i32* %197, align 4, !tbaa !2
  %199 = icmp eq i32 %198, 3
  br i1 %199, label %200, label %290

; <label>:200:                                    ; preds = %195, %188, %147, %162, %169
  %201 = phi i1 [ true, %169 ], [ true, %162 ], [ false, %147 ], [ false, %188 ], [ false, %195 ]
  br i1 %48, label %202, label %210

; <label>:202:                                    ; preds = %200
  %203 = icmp ne i32 %67, 3
  %204 = icmp eq i32 %47, 3
  %205 = or i1 %204, %203
  br i1 %205, label %206, label %290

; <label>:206:                                    ; preds = %202
  %207 = icmp eq i32 %67, 3
  %208 = xor i1 %204, true
  %209 = or i1 %207, %208
  br i1 %209, label %210, label %290

; <label>:210:                                    ; preds = %129, %206, %200
  %211 = phi i1 [ %201, %206 ], [ %201, %200 ], [ false, %129 ]
  br i1 %38, label %212, label %237

; <label>:212:                                    ; preds = %210
  br i1 %68, label %213, label %220

; <label>:213:                                    ; preds = %212
  %214 = icmp ne i32 %37, 3
  %215 = icmp eq i32 %67, 4
  %216 = or i1 %214, %215
  br i1 %216, label %217, label %290

; <label>:217:                                    ; preds = %213
  %218 = icmp eq i32 %37, 3
  br i1 %218, label %237, label %219

; <label>:219:                                    ; preds = %217
  br i1 %215, label %290, label %220

; <label>:220:                                    ; preds = %219, %212
  %221 = icmp eq i32 %37, 4
  br i1 %221, label %222, label %237

; <label>:222:                                    ; preds = %220
  %223 = icmp ult i32 %15, 4
  br i1 %223, label %224, label %231

; <label>:224:                                    ; preds = %222
  %225 = add nuw nsw i32 %15, 1
  %226 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %225, i32 0
  %227 = load i32, i32* %226, align 4, !tbaa !2
  %228 = icmp slt i32 %227, 0
  %229 = icmp eq i32 %227, 4
  %230 = or i1 %228, %229
  br i1 %230, label %231, label %290

; <label>:231:                                    ; preds = %224, %222
  br i1 %104, label %232, label %237

; <label>:232:                                    ; preds = %231
  %233 = add nsw i32 %15, -1
  %234 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %233, i32 0
  %235 = load i32, i32* %234, align 4, !tbaa !2
  %236 = icmp eq i32 %235, 4
  br i1 %236, label %237, label %290

; <label>:237:                                    ; preds = %210, %217, %232, %231, %220
  br i1 %211, label %240, label %238

; <label>:238:                                    ; preds = %237
  %239 = add nuw nsw i32 %15, 1
  br label %266

; <label>:240:                                    ; preds = %237
  %241 = trunc i32 %15 to i31
  switch i31 %241, label %254 [
    i31 0, label %242
    i31 4, label %249
  ]

; <label>:242:                                    ; preds = %240
  %243 = add nuw nsw i32 %15, 1
  %244 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %243, i32 2
  %245 = load i32, i32* %244, align 4, !tbaa !2
  %246 = icmp slt i32 %245, 0
  %247 = icmp eq i32 %245, 4
  %248 = or i1 %246, %247
  br i1 %248, label %254, label %290

; <label>:249:                                    ; preds = %240
  %250 = add nsw i32 %15, -1
  %251 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %250, i32 2
  %252 = load i32, i32* %251, align 4, !tbaa !2
  %253 = icmp eq i32 %252, 4
  br i1 %253, label %254, label %290

; <label>:254:                                    ; preds = %242, %240, %249
  %255 = add nuw nsw i32 %15, 1
  %256 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %255, i32 2
  %257 = load i32, i32* %256, align 4, !tbaa !2
  %258 = icmp slt i32 %257, 0
  %259 = icmp eq i32 %257, 4
  %260 = or i1 %258, %259
  br i1 %260, label %266, label %261

; <label>:261:                                    ; preds = %254
  %262 = add nsw i32 %15, -1
  %263 = getelementptr inbounds [5 x i32], [5 x i32]* %0, i32 %262, i32 2
  %264 = load i32, i32* %263, align 4, !tbaa !2
  %265 = icmp eq i32 %264, 4
  br i1 %265, label %266, label %290

; <label>:266:                                    ; preds = %238, %254, %261
  %267 = phi i32 [ %239, %238 ], [ %255, %254 ], [ %255, %261 ]
  %268 = icmp ult i32 %267, 5
  br i1 %268, label %14, label %269

; <label>:269:                                    ; preds = %266
  %270 = icmp eq i32 %34, %35
  %271 = icmp eq i32 %44, %45
  %272 = and i1 %270, %271
  %273 = icmp eq i32 %54, %55
  %274 = and i1 %272, %273
  %275 = icmp eq i32 %64, %65
  %276 = and i1 %274, %275
  %277 = icmp eq i32 %74, %75
  %278 = and i1 %276, %277
  br i1 %278, label %279, label %290

; <label>:279:                                    ; preds = %269
  %280 = icmp ne i32 %34, 31
  %281 = icmp ne i32 %44, 31
  %282 = or i1 %280, %281
  %283 = icmp ne i32 %54, 31
  %284 = or i1 %282, %283
  %285 = icmp ne i32 %64, 31
  %286 = or i1 %284, %285
  %287 = icmp ne i32 %74, 31
  %288 = or i1 %286, %287
  %289 = select i1 %288, i32 1, i32 2
  br label %290

; <label>:290:                                    ; preds = %206, %135, %125, %113, %99, %90, %81, %261, %249, %242, %232, %224, %219, %213, %202, %195, %183, %176, %169, %157, %150, %146, %140, %131, %121, %106, %95, %86, %77, %279, %269, %7, %1
  %291 = phi i32 [ 0, %1 ], [ 0, %7 ], [ 0, %269 ], [ %289, %279 ], [ 0, %77 ], [ 0, %86 ], [ 0, %95 ], [ 0, %106 ], [ 0, %121 ], [ 0, %131 ], [ 0, %140 ], [ 0, %146 ], [ 0, %150 ], [ 0, %157 ], [ 0, %169 ], [ 0, %176 ], [ 0, %183 ], [ 0, %195 ], [ 0, %202 ], [ 0, %213 ], [ 0, %219 ], [ 0, %224 ], [ 0, %232 ], [ 0, %242 ], [ 0, %249 ], [ 0, %261 ], [ 0, %81 ], [ 0, %90 ], [ 0, %99 ], [ 0, %113 ], [ 0, %125 ], [ 0, %135 ], [ 0, %206 ]
  ret i32 %291
}

; Function Attrs: nounwind
define hidden i32 @bruteFill([5 x i32]*, i32, i32) local_unnamed_addr #0 {
  %4 = alloca [5 x [5 x i32]], align 16
  %5 = tail call i32 @checkHouses([5 x i32]* %0)
  %6 = or i32 %5, 2
  %7 = icmp eq i32 %6, 2
  br i1 %7, label %31, label %8

; <label>:8:                                      ; preds = %3
  %9 = bitcast [5 x [5 x i32]]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %9) #4
  %10 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %4, i32 0, i32 0
  %11 = bitcast [5 x i32]* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull %9, i8* %11, i32 100, i32 4, i1 false)
  %12 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %4, i32 0, i32 %1, i32 %2
  %13 = icmp slt i32 %2, 4
  %14 = add nsw i32 %2, 1
  %15 = xor i1 %13, true
  %16 = zext i1 %15 to i32
  %17 = add nsw i32 %16, %1
  %18 = select i1 %13, i32 %14, i32 0
  store i32 0, i32* %12, align 4, !tbaa !2
  %19 = call i32 @checkHouses([5 x i32]* nonnull %10)
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %24, label %21

; <label>:21:                                     ; preds = %8
  %22 = call i32 @bruteFill([5 x i32]* nonnull %10, i32 %17, i32 %18)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %27

; <label>:24:                                     ; preds = %21, %8
  store i32 1, i32* %12, align 4, !tbaa !2
  %25 = call i32 @checkHouses([5 x i32]* nonnull %10)
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %36, label %33

; <label>:27:                                     ; preds = %51, %45, %39, %33, %21
  %28 = phi i32 [ %22, %21 ], [ %34, %33 ], [ %40, %39 ], [ %46, %45 ], [ %52, %51 ]
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %11, i8* nonnull %9, i32 100, i32 4, i1 false)
  br label %29

; <label>:29:                                     ; preds = %48, %51, %27
  %30 = phi i32 [ %28, %27 ], [ 0, %51 ], [ 0, %48 ]
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %9) #4
  br label %31

; <label>:31:                                     ; preds = %3, %29
  %32 = phi i32 [ %30, %29 ], [ %5, %3 ]
  ret i32 %32

; <label>:33:                                     ; preds = %24
  %34 = call i32 @bruteFill([5 x i32]* nonnull %10, i32 %17, i32 %18)
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %27

; <label>:36:                                     ; preds = %33, %24
  store i32 2, i32* %12, align 4, !tbaa !2
  %37 = call i32 @checkHouses([5 x i32]* nonnull %10)
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %42, label %39

; <label>:39:                                     ; preds = %36
  %40 = call i32 @bruteFill([5 x i32]* nonnull %10, i32 %17, i32 %18)
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %27

; <label>:42:                                     ; preds = %39, %36
  store i32 3, i32* %12, align 4, !tbaa !2
  %43 = call i32 @checkHouses([5 x i32]* nonnull %10)
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %48, label %45

; <label>:45:                                     ; preds = %42
  %46 = call i32 @bruteFill([5 x i32]* nonnull %10, i32 %17, i32 %18)
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %27

; <label>:48:                                     ; preds = %45, %42
  store i32 4, i32* %12, align 4, !tbaa !2
  %49 = call i32 @checkHouses([5 x i32]* nonnull %10)
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %29, label %51

; <label>:51:                                     ; preds = %48
  %52 = call i32 @bruteFill([5 x i32]* nonnull %10, i32 %17, i32 %18)
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %29, label %27
}

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  %2 = bitcast [5 x [5 x i32]]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %2) #4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull %2, i8* bitcast ([5 x [5 x i32]]* @main.ha to i8*), i32 100, i32 16, i1 false)
  %3 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %1, i32 0, i32 0
  %4 = call i32 @bruteFill([5 x i32]* nonnull %3, i32 0, i32 0)
  call void @printHouses([5 x i32]* nonnull %3)
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %2) #4
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

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
