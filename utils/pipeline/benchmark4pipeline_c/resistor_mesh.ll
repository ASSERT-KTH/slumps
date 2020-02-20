; ModuleID = 'resistor_mesh.c'
source_filename = "resistor_mesh.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown-wasm"

%struct.node = type { double, i32 }

@.str = private unnamed_addr constant [8 x i8] c"R = %g\0A\00", align 1

; Function Attrs: nounwind
define %struct.node** @alloc2(i32 %w, i32 %h) local_unnamed_addr #0 {
  %mul1 = shl i32 %w, 4
  %mul217 = or i32 %mul1, 4
  %add = mul i32 %mul217, %h
  %call = tail call i8* @calloc(i32 1, i32 %add)
  %1 = bitcast i8* %call to %struct.node**
  %cmp18 = icmp sgt i32 %h, 0
  br i1 %cmp18, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %add.ptr3 = getelementptr inbounds %struct.node*, %struct.node** %1, i32 %h
  %2 = bitcast %struct.node** %add.ptr3 to %struct.node*
  br label %3

; <label>:3:                                      ; preds = %6, %.lr.ph
  %i.019 = phi i32 [ 0, %.lr.ph ], [ %inc, %6 ]
  %tobool = icmp eq i32 %i.019, 0
  br i1 %tobool, label %6, label %4

; <label>:4:                                      ; preds = %3
  %sub = add nsw i32 %i.019, -1
  %arrayidx = getelementptr inbounds %struct.node*, %struct.node** %1, i32 %sub
  %5 = load %struct.node*, %struct.node** %arrayidx, align 4, !tbaa !2
  %add.ptr = getelementptr inbounds %struct.node, %struct.node* %5, i32 %w
  br label %6

; <label>:6:                                      ; preds = %3, %4
  %cond = phi %struct.node* [ %add.ptr, %4 ], [ %2, %3 ]
  %arrayidx4 = getelementptr inbounds %struct.node*, %struct.node** %1, i32 %i.019
  store %struct.node* %cond, %struct.node** %arrayidx4, align 4, !tbaa !2
  %inc = add nuw nsw i32 %i.019, 1
  %exitcond = icmp eq i32 %inc, %h
  br i1 %exitcond, label %._crit_edge, label %3

._crit_edge:                                      ; preds = %6, %0
  ret %struct.node** %1
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i32, i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind
define void @set_boundary(%struct.node** nocapture readonly %m) local_unnamed_addr #3 {
  %arrayidx = getelementptr inbounds %struct.node*, %struct.node** %m, i32 1
  %1 = load %struct.node*, %struct.node** %arrayidx, align 4, !tbaa !2
  %fixed = getelementptr inbounds %struct.node, %struct.node* %1, i32 1, i32 1
  store i32 1, i32* %fixed, align 8, !tbaa !6
  %v = getelementptr inbounds %struct.node, %struct.node* %1, i32 1, i32 0
  store double 1.000000e+00, double* %v, align 8, !tbaa !10
  %arrayidx4 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 6
  %2 = load %struct.node*, %struct.node** %arrayidx4, align 4, !tbaa !2
  %fixed6 = getelementptr inbounds %struct.node, %struct.node* %2, i32 7, i32 1
  store i32 -1, i32* %fixed6, align 8, !tbaa !6
  %v9 = getelementptr inbounds %struct.node, %struct.node* %2, i32 7, i32 0
  store double -1.000000e+00, double* %v9, align 8, !tbaa !10
  ret void
}

; Function Attrs: norecurse nounwind
define double @calc_diff(%struct.node** nocapture readonly %m, %struct.node** nocapture readonly %d, i32 %w, i32 %h) local_unnamed_addr #3 {
  %cmp86 = icmp sgt i32 %h, 0
  br i1 %cmp86, label %.lr.ph90, label %._crit_edge91

.lr.ph90:                                         ; preds = %0
  %cmp183 = icmp sgt i32 %w, 0
  br label %1

; <label>:1:                                      ; preds = %._crit_edge, %.lr.ph90
  %total.088 = phi double [ 0.000000e+00, %.lr.ph90 ], [ %total.1.lcssa, %._crit_edge ]
  %i.087 = phi i32 [ 0, %.lr.ph90 ], [ %inc39.pre-phi, %._crit_edge ]
  br i1 %cmp183, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %1
  %.pre96 = add nuw nsw i32 %i.087, 1
  br label %._crit_edge

.lr.ph:                                           ; preds = %1
  %tobool = icmp eq i32 %i.087, 0
  %add11 = add nuw nsw i32 %i.087, 1
  %cmp12 = icmp slt i32 %add11, %h
  %arrayidx5 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %i.087
  %arrayidx14 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %add11
  %2 = load %struct.node*, %struct.node** %arrayidx5, align 4, !tbaa !2
  %arrayidx31 = getelementptr inbounds %struct.node*, %struct.node** %d, i32 %i.087
  %3 = load %struct.node*, %struct.node** %arrayidx31, align 4, !tbaa !2
  br i1 %tobool, label %.lr.ph.split.us.preheader, label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %13
  %total.185.us = phi double [ %total.2.us, %13 ], [ %total.088, %.lr.ph.split.us.preheader ]
  %j.084.us = phi i32 [ %add19.us, %13 ], [ 0, %.lr.ph.split.us.preheader ]
  %tobool4.us = icmp eq i32 %j.084.us, 0
  br i1 %tobool4.us, label %6, label %4

; <label>:4:                                      ; preds = %.lr.ph.split.us
  %sub6.us = add nsw i32 %j.084.us, -1
  %v8.us = getelementptr inbounds %struct.node, %struct.node* %2, i32 %sub6.us, i32 0
  %5 = load double, double* %v8.us, align 8, !tbaa !10
  %add9.us = fadd double %5, 0.000000e+00
  br label %6

; <label>:6:                                      ; preds = %4, %.lr.ph.split.us
  %n.1.us = phi i32 [ 1, %4 ], [ 0, %.lr.ph.split.us ]
  %v.1.us = phi double [ %add9.us, %4 ], [ 0.000000e+00, %.lr.ph.split.us ]
  br i1 %cmp12, label %7, label %10

; <label>:7:                                      ; preds = %6
  %8 = load %struct.node*, %struct.node** %arrayidx14, align 4, !tbaa !2
  %v16.us = getelementptr inbounds %struct.node, %struct.node* %8, i32 %j.084.us, i32 0
  %9 = load double, double* %v16.us, align 8, !tbaa !10
  %add17.us = fadd double %v.1.us, %9
  %inc18.us = add nuw nsw i32 %n.1.us, 1
  br label %10

; <label>:10:                                     ; preds = %7, %6
  %n.2.us = phi i32 [ %inc18.us, %7 ], [ %n.1.us, %6 ]
  %v.2.us = phi double [ %add17.us, %7 ], [ %v.1.us, %6 ]
  %add19.us = add nuw nsw i32 %j.084.us, 1
  %cmp20.us = icmp slt i32 %add19.us, %w
  br i1 %cmp20.us, label %11, label %13

; <label>:11:                                     ; preds = %10
  %v24.us = getelementptr inbounds %struct.node, %struct.node* %2, i32 %add19.us, i32 0
  %12 = load double, double* %v24.us, align 8, !tbaa !10
  %add25.us = fadd double %v.2.us, %12
  %inc26.us = add nsw i32 %n.2.us, 1
  br label %13

; <label>:13:                                     ; preds = %11, %10
  %n.3.us = phi i32 [ %inc26.us, %11 ], [ %n.2.us, %10 ]
  %v.3.us = phi double [ %add25.us, %11 ], [ %v.2.us, %10 ]
  %v29.us = getelementptr inbounds %struct.node, %struct.node* %2, i32 %j.084.us, i32 0
  %14 = load double, double* %v29.us, align 8, !tbaa !10
  %conv.us = sitofp i32 %n.3.us to double
  %div.us = fdiv double %v.3.us, %conv.us
  %sub30.us = fsub double %14, %div.us
  %v33.us = getelementptr inbounds %struct.node, %struct.node* %3, i32 %j.084.us, i32 0
  store double %sub30.us, double* %v33.us, align 8, !tbaa !10
  %fixed.us = getelementptr inbounds %struct.node, %struct.node* %2, i32 %j.084.us, i32 1
  %15 = load i32, i32* %fixed.us, align 8, !tbaa !6
  %tobool36.us = icmp eq i32 %15, 0
  %mul.us = fmul double %sub30.us, %sub30.us
  %add37.us = fadd double %total.185.us, %mul.us
  %total.2.us = select i1 %tobool36.us, double %add37.us, double %total.185.us
  %exitcond94 = icmp eq i32 %add19.us, %w
  br i1 %exitcond94, label %._crit_edge, label %.lr.ph.split.us

.lr.ph.split:                                     ; preds = %.lr.ph
  %sub = add nsw i32 %i.087, -1
  %arrayidx = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %sub
  %.pre = load %struct.node*, %struct.node** %arrayidx, align 4, !tbaa !2
  br label %16

; <label>:16:                                     ; preds = %27, %.lr.ph.split
  %total.185 = phi double [ %total.088, %.lr.ph.split ], [ %total.2, %27 ]
  %j.084 = phi i32 [ 0, %.lr.ph.split ], [ %add19, %27 ]
  %v3 = getelementptr inbounds %struct.node, %struct.node* %.pre, i32 %j.084, i32 0
  %17 = load double, double* %v3, align 8, !tbaa !10
  %add = fadd double %17, 0.000000e+00
  %tobool4 = icmp eq i32 %j.084, 0
  br i1 %tobool4, label %20, label %18

; <label>:18:                                     ; preds = %16
  %sub6 = add nsw i32 %j.084, -1
  %v8 = getelementptr inbounds %struct.node, %struct.node* %2, i32 %sub6, i32 0
  %19 = load double, double* %v8, align 8, !tbaa !10
  %add9 = fadd double %add, %19
  br label %20

; <label>:20:                                     ; preds = %16, %18
  %n.1 = phi i32 [ 2, %18 ], [ 1, %16 ]
  %v.1 = phi double [ %add9, %18 ], [ %add, %16 ]
  br i1 %cmp12, label %21, label %24

; <label>:21:                                     ; preds = %20
  %22 = load %struct.node*, %struct.node** %arrayidx14, align 4, !tbaa !2
  %v16 = getelementptr inbounds %struct.node, %struct.node* %22, i32 %j.084, i32 0
  %23 = load double, double* %v16, align 8, !tbaa !10
  %add17 = fadd double %v.1, %23
  %inc18 = add nuw nsw i32 %n.1, 1
  br label %24

; <label>:24:                                     ; preds = %21, %20
  %n.2 = phi i32 [ %inc18, %21 ], [ %n.1, %20 ]
  %v.2 = phi double [ %add17, %21 ], [ %v.1, %20 ]
  %add19 = add nuw nsw i32 %j.084, 1
  %cmp20 = icmp slt i32 %add19, %w
  br i1 %cmp20, label %25, label %27

; <label>:25:                                     ; preds = %24
  %v24 = getelementptr inbounds %struct.node, %struct.node* %2, i32 %add19, i32 0
  %26 = load double, double* %v24, align 8, !tbaa !10
  %add25 = fadd double %v.2, %26
  %inc26 = add nsw i32 %n.2, 1
  br label %27

; <label>:27:                                     ; preds = %25, %24
  %n.3 = phi i32 [ %inc26, %25 ], [ %n.2, %24 ]
  %v.3 = phi double [ %add25, %25 ], [ %v.2, %24 ]
  %v29 = getelementptr inbounds %struct.node, %struct.node* %2, i32 %j.084, i32 0
  %28 = load double, double* %v29, align 8, !tbaa !10
  %conv = sitofp i32 %n.3 to double
  %div = fdiv double %v.3, %conv
  %sub30 = fsub double %28, %div
  %v33 = getelementptr inbounds %struct.node, %struct.node* %3, i32 %j.084, i32 0
  store double %sub30, double* %v33, align 8, !tbaa !10
  %fixed = getelementptr inbounds %struct.node, %struct.node* %2, i32 %j.084, i32 1
  %29 = load i32, i32* %fixed, align 8, !tbaa !6
  %tobool36 = icmp eq i32 %29, 0
  %mul = fmul double %sub30, %sub30
  %add37 = fadd double %total.185, %mul
  %total.2 = select i1 %tobool36, double %add37, double %total.185
  %exitcond = icmp eq i32 %add19, %w
  br i1 %exitcond, label %._crit_edge, label %16

._crit_edge:                                      ; preds = %27, %13, %.._crit_edge_crit_edge
  %inc39.pre-phi = phi i32 [ %.pre96, %.._crit_edge_crit_edge ], [ %add11, %13 ], [ %add11, %27 ]
  %total.1.lcssa = phi double [ %total.088, %.._crit_edge_crit_edge ], [ %total.2.us, %13 ], [ %total.2, %27 ]
  %exitcond95 = icmp eq i32 %inc39.pre-phi, %h
  br i1 %exitcond95, label %._crit_edge91, label %1

._crit_edge91:                                    ; preds = %._crit_edge, %0
  %total.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %total.1.lcssa, %._crit_edge ]
  ret double %total.0.lcssa
}

; Function Attrs: nounwind
define double @iter(%struct.node** nocapture readonly %m, i32 %w, i32 %h) local_unnamed_addr #0 {
  %cur = alloca [3 x double], align 16
  %mul1.i = shl i32 %w, 4
  %mul217.i = or i32 %mul1.i, 4
  %add.i = mul i32 %mul217.i, %h
  %call.i = tail call i8* @calloc(i32 1, i32 %add.i) #4
  %1 = bitcast i8* %call.i to %struct.node**
  %cmp18.i = icmp sgt i32 %h, 0
  br i1 %cmp18.i, label %.lr.ph.i, label %alloc2.exit

.lr.ph.i:                                         ; preds = %0
  %add.ptr3.i = getelementptr inbounds %struct.node*, %struct.node** %1, i32 %h
  %2 = bitcast %struct.node** %add.ptr3.i to %struct.node*
  br label %3

; <label>:3:                                      ; preds = %6, %.lr.ph.i
  %i.019.i = phi i32 [ 0, %.lr.ph.i ], [ %inc.i, %6 ]
  %tobool.i = icmp eq i32 %i.019.i, 0
  br i1 %tobool.i, label %6, label %4

; <label>:4:                                      ; preds = %3
  %sub.i = add nsw i32 %i.019.i, -1
  %arrayidx.i = getelementptr inbounds %struct.node*, %struct.node** %1, i32 %sub.i
  %5 = load %struct.node*, %struct.node** %arrayidx.i, align 4, !tbaa !2
  %add.ptr.i = getelementptr inbounds %struct.node, %struct.node* %5, i32 %w
  br label %6

; <label>:6:                                      ; preds = %4, %3
  %cond.i = phi %struct.node* [ %add.ptr.i, %4 ], [ %2, %3 ]
  %arrayidx4.i = getelementptr inbounds %struct.node*, %struct.node** %1, i32 %i.019.i
  store %struct.node* %cond.i, %struct.node** %arrayidx4.i, align 4, !tbaa !2
  %inc.i = add nuw nsw i32 %i.019.i, 1
  %exitcond.i = icmp eq i32 %inc.i, %h
  br i1 %exitcond.i, label %alloc2.exit, label %3

alloc2.exit:                                      ; preds = %6, %0
  %7 = bitcast [3 x double]* %cur to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #4
  call void @llvm.memset.p0i8.i32(i8* nonnull %7, i8 0, i32 24, i32 16, i1 false)
  %arrayidx.i74 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 1
  %arrayidx4.i75 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 6
  %cmp383 = icmp sgt i32 %w, 0
  br i1 %cmp18.i, label %.lr.ph91.us.preheader, label %alloc2.exit.split.preheader

alloc2.exit.split.preheader:                      ; preds = %alloc2.exit
  br label %alloc2.exit.split

.lr.ph91.us.preheader:                            ; preds = %alloc2.exit
  br label %.lr.ph91.us

.lr.ph91.us:                                      ; preds = %.lr.ph91.us.preheader, %._crit_edge92.us
  %8 = load %struct.node*, %struct.node** %arrayidx.i74, align 4, !tbaa !2
  %fixed.i.us = getelementptr inbounds %struct.node, %struct.node* %8, i32 1, i32 1
  store i32 1, i32* %fixed.i.us, align 8, !tbaa !6
  %v.i.us = getelementptr inbounds %struct.node, %struct.node* %8, i32 1, i32 0
  store double 1.000000e+00, double* %v.i.us, align 8, !tbaa !10
  %9 = load %struct.node*, %struct.node** %arrayidx4.i75, align 4, !tbaa !2
  %fixed6.i.us = getelementptr inbounds %struct.node, %struct.node* %9, i32 7, i32 1
  store i32 -1, i32* %fixed6.i.us, align 8, !tbaa !6
  %v9.i.us = getelementptr inbounds %struct.node, %struct.node* %9, i32 7, i32 0
  store double -1.000000e+00, double* %v9.i.us, align 8, !tbaa !10
  %call1.us = tail call double @calc_diff(%struct.node** %m, %struct.node** %1, i32 %w, i32 %h)
  br i1 %cmp383, label %.lr.ph86.us.us.preheader, label %._crit_edge92.us

.lr.ph86.us.us.preheader:                         ; preds = %.lr.ph91.us
  br label %.lr.ph86.us.us

._crit_edge92.us:                                 ; preds = %._crit_edge87.us.us, %.lr.ph91.us
  %cmp.us = fcmp ogt double %call1.us, 0x3AF357C299A88EA7
  br i1 %cmp.us, label %.lr.ph91.us, label %.us-lcssa.us

.lr.ph86.us.us:                                   ; preds = %.lr.ph86.us.us.preheader, %._crit_edge87.us.us
  %i.089.us.us = phi i32 [ %inc8.us.us, %._crit_edge87.us.us ], [ 0, %.lr.ph86.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds %struct.node*, %struct.node** %1, i32 %i.089.us.us
  %10 = load %struct.node*, %struct.node** %arrayidx.us.us, align 4, !tbaa !2
  %arrayidx5.us.us = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %i.089.us.us
  %11 = load %struct.node*, %struct.node** %arrayidx5.us.us, align 4, !tbaa !2
  br label %12

._crit_edge87.us.us:                              ; preds = %12
  %inc8.us.us = add nuw nsw i32 %i.089.us.us, 1
  %exitcond115 = icmp eq i32 %inc8.us.us, %h
  br i1 %exitcond115, label %._crit_edge92.us, label %.lr.ph86.us.us

; <label>:12:                                     ; preds = %12, %.lr.ph86.us.us
  %j.084.us.us = phi i32 [ 0, %.lr.ph86.us.us ], [ %inc.us.us, %12 ]
  %v.us.us = getelementptr inbounds %struct.node, %struct.node* %10, i32 %j.084.us.us, i32 0
  %13 = load double, double* %v.us.us, align 8, !tbaa !10
  %v7.us.us = getelementptr inbounds %struct.node, %struct.node* %11, i32 %j.084.us.us, i32 0
  %14 = load double, double* %v7.us.us, align 8, !tbaa !10
  %sub.us.us = fsub double %14, %13
  store double %sub.us.us, double* %v7.us.us, align 8, !tbaa !10
  %inc.us.us = add nuw nsw i32 %j.084.us.us, 1
  %exitcond114 = icmp eq i32 %inc.us.us, %w
  br i1 %exitcond114, label %._crit_edge87.us.us, label %12

alloc2.exit.split:                                ; preds = %alloc2.exit.split.preheader, %alloc2.exit.split
  %15 = load %struct.node*, %struct.node** %arrayidx.i74, align 4, !tbaa !2
  %fixed.i = getelementptr inbounds %struct.node, %struct.node* %15, i32 1, i32 1
  store i32 1, i32* %fixed.i, align 8, !tbaa !6
  %v.i = getelementptr inbounds %struct.node, %struct.node* %15, i32 1, i32 0
  store double 1.000000e+00, double* %v.i, align 8, !tbaa !10
  %16 = load %struct.node*, %struct.node** %arrayidx4.i75, align 4, !tbaa !2
  %fixed6.i = getelementptr inbounds %struct.node, %struct.node* %16, i32 7, i32 1
  store i32 -1, i32* %fixed6.i, align 8, !tbaa !6
  %v9.i = getelementptr inbounds %struct.node, %struct.node* %16, i32 7, i32 0
  store double -1.000000e+00, double* %v9.i, align 8, !tbaa !10
  %call1 = tail call double @calc_diff(%struct.node** %m, %struct.node** %1, i32 %w, i32 %h)
  %cmp = fcmp ogt double %call1, 0x3AF357C299A88EA7
  br i1 %cmp, label %alloc2.exit.split, label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %alloc2.exit.split, %._crit_edge92.us
  br i1 %cmp18.i, label %.lr.ph81, label %._crit_edge82

.lr.ph81:                                         ; preds = %.us-lcssa.us
  %sub20 = add nsw i32 %h, -1
  %sub23 = add nsw i32 %w, -1
  br i1 %cmp383, label %.lr.ph.us.preheader, label %._crit_edge82

.lr.ph.us.preheader:                              ; preds = %.lr.ph81
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge.us
  %i.179.us = phi i32 [ %inc34.us, %._crit_edge.us ], [ 0, %.lr.ph.us.preheader ]
  %arrayidx11.us = getelementptr inbounds %struct.node*, %struct.node** %1, i32 %i.179.us
  %17 = load %struct.node*, %struct.node** %arrayidx11.us, align 4, !tbaa !2
  %tobool.us = icmp ne i32 %i.179.us, 0
  %lnot.ext.us = zext i1 %tobool.us to i32
  %cmp21.us = icmp slt i32 %i.179.us, %sub20
  %conv.us = zext i1 %cmp21.us to i32
  %add.us = add nuw nsw i32 %conv.us, %lnot.ext.us
  %arrayidx28.us = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %i.179.us
  %18 = load %struct.node*, %struct.node** %arrayidx28.us, align 4, !tbaa !2
  br label %19

; <label>:19:                                     ; preds = %19, %.lr.ph.us
  %j.177.us = phi i32 [ 0, %.lr.ph.us ], [ %inc33.us, %19 ]
  %v13.us = getelementptr inbounds %struct.node, %struct.node* %17, i32 %j.177.us, i32 0
  %20 = load double, double* %v13.us, align 8, !tbaa !10
  %tobool15.us = icmp ne i32 %j.177.us, 0
  %lnot.ext19.us = zext i1 %tobool15.us to i32
  %cmp24.us = icmp slt i32 %j.177.us, %sub23
  %conv25.us = zext i1 %cmp24.us to i32
  %add22.us = add nuw nsw i32 %add.us, %lnot.ext19.us
  %add26.us = add nuw nsw i32 %add22.us, %conv25.us
  %conv27.us = sitofp i32 %add26.us to double
  %mul.us = fmul double %20, %conv27.us
  %fixed.us = getelementptr inbounds %struct.node, %struct.node* %18, i32 %j.177.us, i32 1
  %21 = load i32, i32* %fixed.us, align 8, !tbaa !6
  %add30.us = add nsw i32 %21, 1
  %arrayidx31.us = getelementptr inbounds [3 x double], [3 x double]* %cur, i32 0, i32 %add30.us
  %22 = load double, double* %arrayidx31.us, align 8, !tbaa !11
  %add32.us = fadd double %mul.us, %22
  store double %add32.us, double* %arrayidx31.us, align 8, !tbaa !11
  %inc33.us = add nuw nsw i32 %j.177.us, 1
  %exitcond = icmp eq i32 %inc33.us, %w
  br i1 %exitcond, label %._crit_edge.us, label %19

._crit_edge.us:                                   ; preds = %19
  %inc34.us = add nuw nsw i32 %i.179.us, 1
  %exitcond111 = icmp eq i32 %inc34.us, %h
  br i1 %exitcond111, label %._crit_edge82.loopexit, label %.lr.ph.us

._crit_edge82.loopexit:                           ; preds = %._crit_edge.us
  %arrayidx35.phi.trans.insert = getelementptr inbounds [3 x double], [3 x double]* %cur, i32 0, i32 2
  %.pre = load double, double* %arrayidx35.phi.trans.insert, align 16, !tbaa !11
  %arrayidx36.phi.trans.insert = getelementptr inbounds [3 x double], [3 x double]* %cur, i32 0, i32 0
  %.pre116 = load double, double* %arrayidx36.phi.trans.insert, align 16, !tbaa !11
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %.lr.ph81, %._crit_edge82.loopexit, %.us-lcssa.us
  %23 = phi double [ %.pre116, %._crit_edge82.loopexit ], [ 0.000000e+00, %.us-lcssa.us ], [ 0.000000e+00, %.lr.ph81 ]
  %24 = phi double [ %.pre, %._crit_edge82.loopexit ], [ 0.000000e+00, %.us-lcssa.us ], [ 0.000000e+00, %.lr.ph81 ]
  tail call void @free(i8* %call.i)
  %sub37 = fsub double %24, %23
  %div = fmul double %sub37, 5.000000e-01
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #4
  ret double %div
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
define i32 @main() local_unnamed_addr #0 {
alloc2.exit4:
  %call.i = tail call i8* @calloc(i32 1, i32 1640) #4
  %0 = bitcast i8* %call.i to %struct.node**
  %add.ptr3.i = getelementptr inbounds i8, i8* %call.i, i32 40
  %1 = bitcast i8* %call.i to i8**
  store i8* %add.ptr3.i, i8** %1, align 4, !tbaa !2
  %add.ptr.i.1 = getelementptr inbounds i8, i8* %call.i, i32 200
  %arrayidx4.i.1 = getelementptr inbounds i8, i8* %call.i, i32 4
  %2 = bitcast i8* %arrayidx4.i.1 to i8**
  store i8* %add.ptr.i.1, i8** %2, align 4, !tbaa !2
  %add.ptr.i.2 = getelementptr inbounds i8, i8* %call.i, i32 360
  %arrayidx4.i.2 = getelementptr inbounds i8, i8* %call.i, i32 8
  %3 = bitcast i8* %arrayidx4.i.2 to i8**
  store i8* %add.ptr.i.2, i8** %3, align 4, !tbaa !2
  %add.ptr.i.3 = getelementptr inbounds i8, i8* %call.i, i32 520
  %arrayidx4.i.3 = getelementptr inbounds i8, i8* %call.i, i32 12
  %4 = bitcast i8* %arrayidx4.i.3 to i8**
  store i8* %add.ptr.i.3, i8** %4, align 4, !tbaa !2
  %add.ptr.i.4 = getelementptr inbounds i8, i8* %call.i, i32 680
  %arrayidx4.i.4 = getelementptr inbounds i8, i8* %call.i, i32 16
  %5 = bitcast i8* %arrayidx4.i.4 to i8**
  store i8* %add.ptr.i.4, i8** %5, align 4, !tbaa !2
  %add.ptr.i.5 = getelementptr inbounds i8, i8* %call.i, i32 840
  %arrayidx4.i.5 = getelementptr inbounds i8, i8* %call.i, i32 20
  %6 = bitcast i8* %arrayidx4.i.5 to i8**
  store i8* %add.ptr.i.5, i8** %6, align 4, !tbaa !2
  %add.ptr.i.6 = getelementptr inbounds i8, i8* %call.i, i32 1000
  %arrayidx4.i.6 = getelementptr inbounds i8, i8* %call.i, i32 24
  %7 = bitcast i8* %arrayidx4.i.6 to i8**
  store i8* %add.ptr.i.6, i8** %7, align 4, !tbaa !2
  %add.ptr.i.7 = getelementptr inbounds i8, i8* %call.i, i32 1160
  %arrayidx4.i.7 = getelementptr inbounds i8, i8* %call.i, i32 28
  %8 = bitcast i8* %arrayidx4.i.7 to i8**
  store i8* %add.ptr.i.7, i8** %8, align 4, !tbaa !2
  %add.ptr.i.8 = getelementptr inbounds i8, i8* %call.i, i32 1320
  %arrayidx4.i.8 = getelementptr inbounds i8, i8* %call.i, i32 32
  %9 = bitcast i8* %arrayidx4.i.8 to i8**
  store i8* %add.ptr.i.8, i8** %9, align 4, !tbaa !2
  %add.ptr.i.9 = getelementptr inbounds i8, i8* %call.i, i32 1480
  %arrayidx4.i.9 = getelementptr inbounds i8, i8* %call.i, i32 36
  %10 = bitcast i8* %arrayidx4.i.9 to i8**
  store i8* %add.ptr.i.9, i8** %10, align 4, !tbaa !2
  %call1 = tail call double @iter(%struct.node** nonnull %0, i32 10, i32 10)
  %div = fdiv double 2.000000e+00, %call1
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), double %div)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
