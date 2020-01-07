; ModuleID = 'benchmark4pipeline_c/resistor_mesh.c'
source_filename = "benchmark4pipeline_c/resistor_mesh.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.node = type { double, i32 }

@.str = private unnamed_addr constant [8 x i8] c"R = %g\0A\00", align 1

; Function Attrs: nounwind
define hidden %struct.node** @alloc2(i32, i32) local_unnamed_addr #0 {
  %3 = shl i32 %0, 4
  %4 = or i32 %3, 4
  %5 = mul i32 %4, %1
  %6 = tail call noalias i8* @calloc(i32 1, i32 %5) #4
  %7 = bitcast i8* %6 to %struct.node**
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %9, label %25

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.node*, %struct.node** %7, i32 %1
  %11 = bitcast %struct.node** %10 to %struct.node*
  br label %12

; <label>:12:                                     ; preds = %20, %9
  %13 = phi i32 [ 0, %9 ], [ %23, %20 ]
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %20, label %15

; <label>:15:                                     ; preds = %12
  %16 = add nsw i32 %13, -1
  %17 = getelementptr inbounds %struct.node*, %struct.node** %7, i32 %16
  %18 = load %struct.node*, %struct.node** %17, align 4, !tbaa !2
  %19 = getelementptr inbounds %struct.node, %struct.node* %18, i32 %0
  br label %20

; <label>:20:                                     ; preds = %12, %15
  %21 = phi %struct.node* [ %19, %15 ], [ %11, %12 ]
  %22 = getelementptr inbounds %struct.node*, %struct.node** %7, i32 %13
  store %struct.node* %21, %struct.node** %22, align 4, !tbaa !2
  %23 = add nuw nsw i32 %13, 1
  %24 = icmp eq i32 %23, %1
  br i1 %24, label %25, label %12

; <label>:25:                                     ; preds = %20, %2
  ret %struct.node** %7
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i32, i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind
define hidden void @set_boundary(%struct.node** nocapture readonly) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 1
  %3 = load %struct.node*, %struct.node** %2, align 4, !tbaa !2
  %4 = getelementptr inbounds %struct.node, %struct.node* %3, i32 1, i32 1
  store i32 1, i32* %4, align 8, !tbaa !6
  %5 = getelementptr inbounds %struct.node, %struct.node* %3, i32 1, i32 0
  store double 1.000000e+00, double* %5, align 8, !tbaa !10
  %6 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 6
  %7 = load %struct.node*, %struct.node** %6, align 4, !tbaa !2
  %8 = getelementptr inbounds %struct.node, %struct.node* %7, i32 7, i32 1
  store i32 -1, i32* %8, align 8, !tbaa !6
  %9 = getelementptr inbounds %struct.node, %struct.node* %7, i32 7, i32 0
  store double -1.000000e+00, double* %9, align 8, !tbaa !10
  ret void
}

; Function Attrs: norecurse nounwind
define hidden double @calc_diff(%struct.node** nocapture readonly, %struct.node** nocapture readonly, i32, i32) local_unnamed_addr #3 {
  %5 = icmp sgt i32 %3, 0
  br i1 %5, label %6, label %122

; <label>:6:                                      ; preds = %4
  %7 = icmp sgt i32 %2, 0
  br label %8

; <label>:8:                                      ; preds = %118, %6
  %9 = phi double [ 0.000000e+00, %6 ], [ %120, %118 ]
  %10 = phi i32 [ 0, %6 ], [ %119, %118 ]
  br i1 %7, label %13, label %11

; <label>:11:                                     ; preds = %8
  %12 = add nuw nsw i32 %10, 1
  br label %118

; <label>:13:                                     ; preds = %8
  %14 = icmp eq i32 %10, 0
  %15 = add nuw nsw i32 %10, 1
  %16 = icmp slt i32 %15, %3
  %17 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %10
  %18 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %15
  %19 = load %struct.node*, %struct.node** %17, align 4, !tbaa !2
  %20 = getelementptr inbounds %struct.node*, %struct.node** %1, i32 %10
  %21 = load %struct.node*, %struct.node** %20, align 4, !tbaa !2
  br i1 %14, label %22, label %67

; <label>:22:                                     ; preds = %13
  br label %23

; <label>:23:                                     ; preds = %22, %51
  %24 = phi double [ %65, %51 ], [ %9, %22 ]
  %25 = phi i32 [ %44, %51 ], [ 0, %22 ]
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %32, label %27

; <label>:27:                                     ; preds = %23
  %28 = add nsw i32 %25, -1
  %29 = getelementptr inbounds %struct.node, %struct.node* %19, i32 %28, i32 0
  %30 = load double, double* %29, align 8, !tbaa !10
  %31 = fadd double %30, 0.000000e+00
  br label %32

; <label>:32:                                     ; preds = %27, %23
  %33 = phi i32 [ 1, %27 ], [ 0, %23 ]
  %34 = phi double [ %31, %27 ], [ 0.000000e+00, %23 ]
  br i1 %16, label %35, label %41

; <label>:35:                                     ; preds = %32
  %36 = load %struct.node*, %struct.node** %18, align 4, !tbaa !2
  %37 = getelementptr inbounds %struct.node, %struct.node* %36, i32 %25, i32 0
  %38 = load double, double* %37, align 8, !tbaa !10
  %39 = fadd double %34, %38
  %40 = add nuw nsw i32 %33, 1
  br label %41

; <label>:41:                                     ; preds = %35, %32
  %42 = phi i32 [ %40, %35 ], [ %33, %32 ]
  %43 = phi double [ %39, %35 ], [ %34, %32 ]
  %44 = add nuw nsw i32 %25, 1
  %45 = icmp slt i32 %44, %2
  br i1 %45, label %46, label %51

; <label>:46:                                     ; preds = %41
  %47 = getelementptr inbounds %struct.node, %struct.node* %19, i32 %44, i32 0
  %48 = load double, double* %47, align 8, !tbaa !10
  %49 = fadd double %43, %48
  %50 = add nsw i32 %42, 1
  br label %51

; <label>:51:                                     ; preds = %46, %41
  %52 = phi i32 [ %50, %46 ], [ %42, %41 ]
  %53 = phi double [ %49, %46 ], [ %43, %41 ]
  %54 = getelementptr inbounds %struct.node, %struct.node* %19, i32 %25, i32 0
  %55 = load double, double* %54, align 8, !tbaa !10
  %56 = sitofp i32 %52 to double
  %57 = fdiv double %53, %56
  %58 = fsub double %55, %57
  %59 = getelementptr inbounds %struct.node, %struct.node* %21, i32 %25, i32 0
  store double %58, double* %59, align 8, !tbaa !10
  %60 = getelementptr inbounds %struct.node, %struct.node* %19, i32 %25, i32 1
  %61 = load i32, i32* %60, align 8, !tbaa !6
  %62 = icmp eq i32 %61, 0
  %63 = fmul double %58, %58
  %64 = fadd double %24, %63
  %65 = select i1 %62, double %64, double %24
  %66 = icmp eq i32 %44, %2
  br i1 %66, label %118, label %23

; <label>:67:                                     ; preds = %13
  %68 = add nsw i32 %10, -1
  %69 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %68
  %70 = load %struct.node*, %struct.node** %69, align 4, !tbaa !2
  br label %71

; <label>:71:                                     ; preds = %102, %67
  %72 = phi double [ %9, %67 ], [ %116, %102 ]
  %73 = phi i32 [ 0, %67 ], [ %95, %102 ]
  %74 = getelementptr inbounds %struct.node, %struct.node* %70, i32 %73, i32 0
  %75 = load double, double* %74, align 8, !tbaa !10
  %76 = fadd double %75, 0.000000e+00
  %77 = icmp eq i32 %73, 0
  br i1 %77, label %83, label %78

; <label>:78:                                     ; preds = %71
  %79 = add nsw i32 %73, -1
  %80 = getelementptr inbounds %struct.node, %struct.node* %19, i32 %79, i32 0
  %81 = load double, double* %80, align 8, !tbaa !10
  %82 = fadd double %76, %81
  br label %83

; <label>:83:                                     ; preds = %71, %78
  %84 = phi i32 [ 2, %78 ], [ 1, %71 ]
  %85 = phi double [ %82, %78 ], [ %76, %71 ]
  br i1 %16, label %86, label %92

; <label>:86:                                     ; preds = %83
  %87 = load %struct.node*, %struct.node** %18, align 4, !tbaa !2
  %88 = getelementptr inbounds %struct.node, %struct.node* %87, i32 %73, i32 0
  %89 = load double, double* %88, align 8, !tbaa !10
  %90 = fadd double %85, %89
  %91 = add nuw nsw i32 %84, 1
  br label %92

; <label>:92:                                     ; preds = %86, %83
  %93 = phi i32 [ %91, %86 ], [ %84, %83 ]
  %94 = phi double [ %90, %86 ], [ %85, %83 ]
  %95 = add nuw nsw i32 %73, 1
  %96 = icmp slt i32 %95, %2
  br i1 %96, label %97, label %102

; <label>:97:                                     ; preds = %92
  %98 = getelementptr inbounds %struct.node, %struct.node* %19, i32 %95, i32 0
  %99 = load double, double* %98, align 8, !tbaa !10
  %100 = fadd double %94, %99
  %101 = add nsw i32 %93, 1
  br label %102

; <label>:102:                                    ; preds = %97, %92
  %103 = phi i32 [ %101, %97 ], [ %93, %92 ]
  %104 = phi double [ %100, %97 ], [ %94, %92 ]
  %105 = getelementptr inbounds %struct.node, %struct.node* %19, i32 %73, i32 0
  %106 = load double, double* %105, align 8, !tbaa !10
  %107 = sitofp i32 %103 to double
  %108 = fdiv double %104, %107
  %109 = fsub double %106, %108
  %110 = getelementptr inbounds %struct.node, %struct.node* %21, i32 %73, i32 0
  store double %109, double* %110, align 8, !tbaa !10
  %111 = getelementptr inbounds %struct.node, %struct.node* %19, i32 %73, i32 1
  %112 = load i32, i32* %111, align 8, !tbaa !6
  %113 = icmp eq i32 %112, 0
  %114 = fmul double %109, %109
  %115 = fadd double %72, %114
  %116 = select i1 %113, double %115, double %72
  %117 = icmp eq i32 %95, %2
  br i1 %117, label %118, label %71

; <label>:118:                                    ; preds = %102, %51, %11
  %119 = phi i32 [ %12, %11 ], [ %15, %51 ], [ %15, %102 ]
  %120 = phi double [ %9, %11 ], [ %65, %51 ], [ %116, %102 ]
  %121 = icmp eq i32 %119, %3
  br i1 %121, label %122, label %8

; <label>:122:                                    ; preds = %118, %4
  %123 = phi double [ 0.000000e+00, %4 ], [ %120, %118 ]
  ret double %123
}

; Function Attrs: nounwind
define hidden double @iter(%struct.node** nocapture readonly, i32, i32) local_unnamed_addr #0 {
  %4 = alloca [3 x double], align 16
  %5 = shl i32 %1, 4
  %6 = or i32 %5, 4
  %7 = mul i32 %6, %2
  %8 = tail call noalias i8* @calloc(i32 1, i32 %7) #4
  %9 = bitcast i8* %8 to %struct.node**
  %10 = icmp sgt i32 %2, 0
  br i1 %10, label %11, label %27

; <label>:11:                                     ; preds = %3
  %12 = getelementptr inbounds %struct.node*, %struct.node** %9, i32 %2
  %13 = bitcast %struct.node** %12 to %struct.node*
  br label %14

; <label>:14:                                     ; preds = %22, %11
  %15 = phi i32 [ 0, %11 ], [ %25, %22 ]
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %22, label %17

; <label>:17:                                     ; preds = %14
  %18 = add nsw i32 %15, -1
  %19 = getelementptr inbounds %struct.node*, %struct.node** %9, i32 %18
  %20 = load %struct.node*, %struct.node** %19, align 4, !tbaa !2
  %21 = getelementptr inbounds %struct.node, %struct.node* %20, i32 %1
  br label %22

; <label>:22:                                     ; preds = %17, %14
  %23 = phi %struct.node* [ %21, %17 ], [ %13, %14 ]
  %24 = getelementptr inbounds %struct.node*, %struct.node** %9, i32 %15
  store %struct.node* %23, %struct.node** %24, align 4, !tbaa !2
  %25 = add nuw nsw i32 %15, 1
  %26 = icmp eq i32 %25, %2
  br i1 %26, label %27, label %14

; <label>:27:                                     ; preds = %22, %3
  %28 = bitcast [3 x double]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #4
  call void @llvm.memset.p0i8.i32(i8* nonnull %28, i8 0, i32 24, i32 16, i1 false)
  %29 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 1
  %30 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 6
  %31 = icmp sgt i32 %1, 0
  br i1 %10, label %33, label %32

; <label>:32:                                     ; preds = %27
  br label %63

; <label>:33:                                     ; preds = %27
  br label %34

; <label>:34:                                     ; preds = %33, %43
  %35 = load %struct.node*, %struct.node** %29, align 4, !tbaa !2
  %36 = getelementptr inbounds %struct.node, %struct.node* %35, i32 1, i32 1
  store i32 1, i32* %36, align 8, !tbaa !6
  %37 = getelementptr inbounds %struct.node, %struct.node* %35, i32 1, i32 0
  store double 1.000000e+00, double* %37, align 8, !tbaa !10
  %38 = load %struct.node*, %struct.node** %30, align 4, !tbaa !2
  %39 = getelementptr inbounds %struct.node, %struct.node* %38, i32 7, i32 1
  store i32 -1, i32* %39, align 8, !tbaa !6
  %40 = getelementptr inbounds %struct.node, %struct.node* %38, i32 7, i32 0
  store double -1.000000e+00, double* %40, align 8, !tbaa !10
  %41 = tail call double @calc_diff(%struct.node** %0, %struct.node** %9, i32 %1, i32 %2)
  br i1 %31, label %42, label %43

; <label>:42:                                     ; preds = %34
  br label %45

; <label>:43:                                     ; preds = %51, %34
  %44 = fcmp ogt double %41, 0x3AF357C299A88EA7
  br i1 %44, label %34, label %72

; <label>:45:                                     ; preds = %42, %51
  %46 = phi i32 [ %52, %51 ], [ 0, %42 ]
  %47 = getelementptr inbounds %struct.node*, %struct.node** %9, i32 %46
  %48 = load %struct.node*, %struct.node** %47, align 4, !tbaa !2
  %49 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %46
  %50 = load %struct.node*, %struct.node** %49, align 4, !tbaa !2
  br label %54

; <label>:51:                                     ; preds = %54
  %52 = add nuw nsw i32 %46, 1
  %53 = icmp eq i32 %52, %2
  br i1 %53, label %43, label %45

; <label>:54:                                     ; preds = %54, %45
  %55 = phi i32 [ 0, %45 ], [ %61, %54 ]
  %56 = getelementptr inbounds %struct.node, %struct.node* %48, i32 %55, i32 0
  %57 = load double, double* %56, align 8, !tbaa !10
  %58 = getelementptr inbounds %struct.node, %struct.node* %50, i32 %55, i32 0
  %59 = load double, double* %58, align 8, !tbaa !10
  %60 = fsub double %59, %57
  store double %60, double* %58, align 8, !tbaa !10
  %61 = add nuw nsw i32 %55, 1
  %62 = icmp eq i32 %61, %1
  br i1 %62, label %51, label %54

; <label>:63:                                     ; preds = %32, %63
  %64 = load %struct.node*, %struct.node** %29, align 4, !tbaa !2
  %65 = getelementptr inbounds %struct.node, %struct.node* %64, i32 1, i32 1
  store i32 1, i32* %65, align 8, !tbaa !6
  %66 = getelementptr inbounds %struct.node, %struct.node* %64, i32 1, i32 0
  store double 1.000000e+00, double* %66, align 8, !tbaa !10
  %67 = load %struct.node*, %struct.node** %30, align 4, !tbaa !2
  %68 = getelementptr inbounds %struct.node, %struct.node* %67, i32 7, i32 1
  store i32 -1, i32* %68, align 8, !tbaa !6
  %69 = getelementptr inbounds %struct.node, %struct.node* %67, i32 7, i32 0
  store double -1.000000e+00, double* %69, align 8, !tbaa !10
  %70 = tail call double @calc_diff(%struct.node** %0, %struct.node** %9, i32 %1, i32 %2)
  %71 = fcmp ogt double %70, 0x3AF357C299A88EA7
  br i1 %71, label %63, label %72

; <label>:72:                                     ; preds = %63, %43
  br i1 %10, label %73, label %116

; <label>:73:                                     ; preds = %72
  %74 = add nsw i32 %2, -1
  %75 = add nsw i32 %1, -1
  br i1 %31, label %76, label %116

; <label>:76:                                     ; preds = %73
  br label %77

; <label>:77:                                     ; preds = %76, %108
  %78 = phi i32 [ %109, %108 ], [ 0, %76 ]
  %79 = getelementptr inbounds %struct.node*, %struct.node** %9, i32 %78
  %80 = load %struct.node*, %struct.node** %79, align 4, !tbaa !2
  %81 = icmp ne i32 %78, 0
  %82 = zext i1 %81 to i32
  %83 = icmp slt i32 %78, %74
  %84 = zext i1 %83 to i32
  %85 = add nuw nsw i32 %84, %82
  %86 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %78
  %87 = load %struct.node*, %struct.node** %86, align 4, !tbaa !2
  br label %88

; <label>:88:                                     ; preds = %88, %77
  %89 = phi i32 [ 0, %77 ], [ %106, %88 ]
  %90 = getelementptr inbounds %struct.node, %struct.node* %80, i32 %89, i32 0
  %91 = load double, double* %90, align 8, !tbaa !10
  %92 = icmp ne i32 %89, 0
  %93 = zext i1 %92 to i32
  %94 = icmp slt i32 %89, %75
  %95 = zext i1 %94 to i32
  %96 = add nuw nsw i32 %85, %93
  %97 = add nuw nsw i32 %96, %95
  %98 = sitofp i32 %97 to double
  %99 = fmul double %91, %98
  %100 = getelementptr inbounds %struct.node, %struct.node* %87, i32 %89, i32 1
  %101 = load i32, i32* %100, align 8, !tbaa !6
  %102 = add nsw i32 %101, 1
  %103 = getelementptr inbounds [3 x double], [3 x double]* %4, i32 0, i32 %102
  %104 = load double, double* %103, align 8, !tbaa !11
  %105 = fadd double %99, %104
  store double %105, double* %103, align 8, !tbaa !11
  %106 = add nuw nsw i32 %89, 1
  %107 = icmp eq i32 %106, %1
  br i1 %107, label %108, label %88

; <label>:108:                                    ; preds = %88
  %109 = add nuw nsw i32 %78, 1
  %110 = icmp eq i32 %109, %2
  br i1 %110, label %111, label %77

; <label>:111:                                    ; preds = %108
  %112 = getelementptr inbounds [3 x double], [3 x double]* %4, i32 0, i32 2
  %113 = load double, double* %112, align 16, !tbaa !11
  %114 = getelementptr inbounds [3 x double], [3 x double]* %4, i32 0, i32 0
  %115 = load double, double* %114, align 16, !tbaa !11
  br label %116

; <label>:116:                                    ; preds = %73, %111, %72
  %117 = phi double [ %115, %111 ], [ 0.000000e+00, %72 ], [ 0.000000e+00, %73 ]
  %118 = phi double [ %113, %111 ], [ 0.000000e+00, %72 ], [ 0.000000e+00, %73 ]
  tail call void @free(i8* %8) #4
  %119 = fsub double %118, %117
  %120 = fmul double %119, 5.000000e-01
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #4
  ret double %120
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
  %1 = tail call noalias i8* @calloc(i32 1, i32 1640) #4
  %2 = bitcast i8* %1 to %struct.node**
  %3 = getelementptr inbounds i8, i8* %1, i32 40
  %4 = bitcast i8* %1 to i8**
  store i8* %3, i8** %4, align 4, !tbaa !2
  %5 = getelementptr inbounds i8, i8* %1, i32 200
  %6 = getelementptr inbounds i8, i8* %1, i32 4
  %7 = bitcast i8* %6 to i8**
  store i8* %5, i8** %7, align 4, !tbaa !2
  %8 = getelementptr inbounds i8, i8* %1, i32 360
  %9 = getelementptr inbounds i8, i8* %1, i32 8
  %10 = bitcast i8* %9 to i8**
  store i8* %8, i8** %10, align 4, !tbaa !2
  %11 = getelementptr inbounds i8, i8* %1, i32 520
  %12 = getelementptr inbounds i8, i8* %1, i32 12
  %13 = bitcast i8* %12 to i8**
  store i8* %11, i8** %13, align 4, !tbaa !2
  %14 = getelementptr inbounds i8, i8* %1, i32 680
  %15 = getelementptr inbounds i8, i8* %1, i32 16
  %16 = bitcast i8* %15 to i8**
  store i8* %14, i8** %16, align 4, !tbaa !2
  %17 = getelementptr inbounds i8, i8* %1, i32 840
  %18 = getelementptr inbounds i8, i8* %1, i32 20
  %19 = bitcast i8* %18 to i8**
  store i8* %17, i8** %19, align 4, !tbaa !2
  %20 = getelementptr inbounds i8, i8* %1, i32 1000
  %21 = getelementptr inbounds i8, i8* %1, i32 24
  %22 = bitcast i8* %21 to i8**
  store i8* %20, i8** %22, align 4, !tbaa !2
  %23 = getelementptr inbounds i8, i8* %1, i32 1160
  %24 = getelementptr inbounds i8, i8* %1, i32 28
  %25 = bitcast i8* %24 to i8**
  store i8* %23, i8** %25, align 4, !tbaa !2
  %26 = getelementptr inbounds i8, i8* %1, i32 1320
  %27 = getelementptr inbounds i8, i8* %1, i32 32
  %28 = bitcast i8* %27 to i8**
  store i8* %26, i8** %28, align 4, !tbaa !2
  %29 = getelementptr inbounds i8, i8* %1, i32 1480
  %30 = getelementptr inbounds i8, i8* %1, i32 36
  %31 = bitcast i8* %30 to i8**
  store i8* %29, i8** %31, align 4, !tbaa !2
  %32 = tail call double @iter(%struct.node** nonnull %2, i32 10, i32 10)
  %33 = fdiv double 2.000000e+00, %32
  %34 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), double %33)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !9, i64 8}
!7 = !{!"", !8, i64 0, !9, i64 8}
!8 = !{!"double", !4, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = !{!7, !8, i64 0}
!11 = !{!8, !8, i64 0}
