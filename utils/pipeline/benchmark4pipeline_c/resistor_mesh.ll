; ModuleID = 'benchmark4pipeline_c/resistor_mesh.c'
source_filename = "benchmark4pipeline_c/resistor_mesh.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.node = type { double, i32 }

@.str = private unnamed_addr constant [8 x i8] c"R = %g\0A\00", align 1

; Function Attrs: nounwind
define hidden %struct.node** @alloc2(i32 %w, i32 %h) local_unnamed_addr #0 {
entry:
  %mul1 = shl i32 %w, 4
  %mul217 = or i32 %mul1, 4
  %add = mul i32 %mul217, %h
  %call = tail call noalias i8* @calloc(i32 1, i32 %add) #4
  %0 = bitcast i8* %call to %struct.node**
  %cmp18 = icmp sgt i32 %h, 0
  br i1 %cmp18, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %add.ptr3 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %h
  %1 = bitcast %struct.node** %add.ptr3 to %struct.node*
  br label %for.body

for.body:                                         ; preds = %cond.end, %for.body.lr.ph
  %i.019 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %cond.end ]
  %tobool = icmp eq i32 %i.019, 0
  br i1 %tobool, label %cond.end, label %cond.true

cond.true:                                        ; preds = %for.body
  %sub = add nsw i32 %i.019, -1
  %arrayidx = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %sub
  %2 = load %struct.node*, %struct.node** %arrayidx, align 4, !tbaa !2
  %add.ptr = getelementptr inbounds %struct.node, %struct.node* %2, i32 %w
  br label %cond.end

cond.end:                                         ; preds = %for.body, %cond.true
  %cond = phi %struct.node* [ %add.ptr, %cond.true ], [ %1, %for.body ]
  %arrayidx4 = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %i.019
  store %struct.node* %cond, %struct.node** %arrayidx4, align 4, !tbaa !2
  %inc = add nuw nsw i32 %i.019, 1
  %exitcond = icmp eq i32 %inc, %h
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %cond.end, %entry
  ret %struct.node** %0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i32, i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind
define hidden void @set_boundary(%struct.node** nocapture readonly %m) local_unnamed_addr #3 {
entry:
  %arrayidx = getelementptr inbounds %struct.node*, %struct.node** %m, i32 1
  %0 = load %struct.node*, %struct.node** %arrayidx, align 4, !tbaa !2
  %fixed = getelementptr inbounds %struct.node, %struct.node* %0, i32 1, i32 1
  store i32 1, i32* %fixed, align 8, !tbaa !6
  %v = getelementptr inbounds %struct.node, %struct.node* %0, i32 1, i32 0
  store double 1.000000e+00, double* %v, align 8, !tbaa !10
  %arrayidx4 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 6
  %1 = load %struct.node*, %struct.node** %arrayidx4, align 4, !tbaa !2
  %fixed6 = getelementptr inbounds %struct.node, %struct.node* %1, i32 7, i32 1
  store i32 -1, i32* %fixed6, align 8, !tbaa !6
  %v9 = getelementptr inbounds %struct.node, %struct.node* %1, i32 7, i32 0
  store double -1.000000e+00, double* %v9, align 8, !tbaa !10
  ret void
}

; Function Attrs: norecurse nounwind
define hidden double @calc_diff(%struct.node** nocapture readonly %m, %struct.node** nocapture readonly %d, i32 %w, i32 %h) local_unnamed_addr #3 {
entry:
  %cmp101 = icmp sgt i32 %h, 0
  br i1 %cmp101, label %for.cond1.preheader.lr.ph, label %for.end51

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp295 = icmp sgt i32 %w, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc49, %for.cond1.preheader.lr.ph
  %total.0104 = phi double [ 0.000000e+00, %for.cond1.preheader.lr.ph ], [ %total.1.lcssa, %for.inc49 ]
  %i.0102 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc50.pre-phi, %for.inc49 ]
  br i1 %cmp295, label %for.body3.lr.ph, label %for.cond1.preheader.for.inc49_crit_edge

for.cond1.preheader.for.inc49_crit_edge:          ; preds = %for.cond1.preheader
  %.pre109 = add nuw nsw i32 %i.0102, 1
  br label %for.inc49

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %tobool = icmp eq i32 %i.0102, 0
  %arrayidx8 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %i.0102
  %add15 = add nuw nsw i32 %i.0102, 1
  %cmp16 = icmp slt i32 %add15, %h
  %arrayidx19 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %add15
  %0 = load %struct.node*, %struct.node** %arrayidx8, align 4, !tbaa !2
  %arrayidx39 = getelementptr inbounds %struct.node*, %struct.node** %d, i32 %i.0102
  %1 = load %struct.node*, %struct.node** %arrayidx39, align 4, !tbaa !2
  br i1 %tobool, label %for.body3.us, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  %sub = add nsw i32 %i.0102, -1
  %arrayidx = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %sub
  %.pre = load %struct.node*, %struct.node** %arrayidx, align 4, !tbaa !2
  br label %for.body3

for.body3.us:                                     ; preds = %for.body3.lr.ph, %if.end34.us
  %total.1100.us = phi double [ %total.2.us, %if.end34.us ], [ %total.0104, %for.body3.lr.ph ]
  %j.096.us = phi i32 [ %add25.us, %if.end34.us ], [ 0, %for.body3.lr.ph ]
  %tobool6.us = icmp eq i32 %j.096.us, 0
  br i1 %tobool6.us, label %if.end14.us, label %if.then7.us

if.then7.us:                                      ; preds = %for.body3.us
  %sub9.us = add nsw i32 %j.096.us, -1
  %v11.us = getelementptr inbounds %struct.node, %struct.node* %0, i32 %sub9.us, i32 0
  %2 = load double, double* %v11.us, align 8, !tbaa !10
  %add12.us = fadd double %2, 0.000000e+00
  br label %if.end14.us

if.end14.us:                                      ; preds = %if.then7.us, %for.body3.us
  %n.1.us = phi i32 [ 1, %if.then7.us ], [ 0, %for.body3.us ]
  %v.1.us = phi double [ %add12.us, %if.then7.us ], [ 0.000000e+00, %for.body3.us ]
  br i1 %cmp16, label %if.then17.us, label %if.end24.us

if.then17.us:                                     ; preds = %if.end14.us
  %3 = load %struct.node*, %struct.node** %arrayidx19, align 4, !tbaa !2
  %v21.us = getelementptr inbounds %struct.node, %struct.node* %3, i32 %j.096.us, i32 0
  %4 = load double, double* %v21.us, align 8, !tbaa !10
  %add22.us = fadd double %v.1.us, %4
  %inc23.us = add nuw nsw i32 %n.1.us, 1
  br label %if.end24.us

if.end24.us:                                      ; preds = %if.then17.us, %if.end14.us
  %n.2.us = phi i32 [ %inc23.us, %if.then17.us ], [ %n.1.us, %if.end14.us ]
  %v.2.us = phi double [ %add22.us, %if.then17.us ], [ %v.1.us, %if.end14.us ]
  %add25.us = add nuw nsw i32 %j.096.us, 1
  %cmp26.us = icmp slt i32 %add25.us, %w
  br i1 %cmp26.us, label %if.then27.us, label %if.end34.us

if.then27.us:                                     ; preds = %if.end24.us
  %v31.us = getelementptr inbounds %struct.node, %struct.node* %0, i32 %add25.us, i32 0
  %5 = load double, double* %v31.us, align 8, !tbaa !10
  %add32.us = fadd double %v.2.us, %5
  %inc33.us = add nsw i32 %n.2.us, 1
  br label %if.end34.us

if.end34.us:                                      ; preds = %if.then27.us, %if.end24.us
  %n.3.us = phi i32 [ %inc33.us, %if.then27.us ], [ %n.2.us, %if.end24.us ]
  %v.3.us = phi double [ %add32.us, %if.then27.us ], [ %v.2.us, %if.end24.us ]
  %v37.us = getelementptr inbounds %struct.node, %struct.node* %0, i32 %j.096.us, i32 0
  %6 = load double, double* %v37.us, align 8, !tbaa !10
  %conv.us = sitofp i32 %n.3.us to double
  %div.us = fdiv double %v.3.us, %conv.us
  %sub38.us = fsub double %6, %div.us
  %v41.us = getelementptr inbounds %struct.node, %struct.node* %1, i32 %j.096.us, i32 0
  store double %sub38.us, double* %v41.us, align 8, !tbaa !10
  %fixed.us = getelementptr inbounds %struct.node, %struct.node* %0, i32 %j.096.us, i32 1
  %7 = load i32, i32* %fixed.us, align 8, !tbaa !6
  %tobool44.us = icmp eq i32 %7, 0
  %mul.us = fmul double %sub38.us, %sub38.us
  %add46.us = fadd double %total.1100.us, %mul.us
  %total.2.us = select i1 %tobool44.us, double %add46.us, double %total.1100.us
  %exitcond107 = icmp eq i32 %add25.us, %w
  br i1 %exitcond107, label %for.inc49, label %for.body3.us

for.body3:                                        ; preds = %if.end34, %for.body3.preheader
  %total.1100 = phi double [ %total.2, %if.end34 ], [ %total.0104, %for.body3.preheader ]
  %j.096 = phi i32 [ %add25, %if.end34 ], [ 0, %for.body3.preheader ]
  %v5 = getelementptr inbounds %struct.node, %struct.node* %.pre, i32 %j.096, i32 0
  %8 = load double, double* %v5, align 8, !tbaa !10
  %add = fadd double %8, 0.000000e+00
  %tobool6 = icmp eq i32 %j.096, 0
  br i1 %tobool6, label %if.end14, label %if.then7

if.then7:                                         ; preds = %for.body3
  %sub9 = add nsw i32 %j.096, -1
  %v11 = getelementptr inbounds %struct.node, %struct.node* %0, i32 %sub9, i32 0
  %9 = load double, double* %v11, align 8, !tbaa !10
  %add12 = fadd double %add, %9
  br label %if.end14

if.end14:                                         ; preds = %for.body3, %if.then7
  %n.1 = phi i32 [ 2, %if.then7 ], [ 1, %for.body3 ]
  %v.1 = phi double [ %add12, %if.then7 ], [ %add, %for.body3 ]
  br i1 %cmp16, label %if.then17, label %if.end24

if.then17:                                        ; preds = %if.end14
  %10 = load %struct.node*, %struct.node** %arrayidx19, align 4, !tbaa !2
  %v21 = getelementptr inbounds %struct.node, %struct.node* %10, i32 %j.096, i32 0
  %11 = load double, double* %v21, align 8, !tbaa !10
  %add22 = fadd double %v.1, %11
  %inc23 = add nuw nsw i32 %n.1, 1
  br label %if.end24

if.end24:                                         ; preds = %if.then17, %if.end14
  %n.2 = phi i32 [ %inc23, %if.then17 ], [ %n.1, %if.end14 ]
  %v.2 = phi double [ %add22, %if.then17 ], [ %v.1, %if.end14 ]
  %add25 = add nuw nsw i32 %j.096, 1
  %cmp26 = icmp slt i32 %add25, %w
  br i1 %cmp26, label %if.then27, label %if.end34

if.then27:                                        ; preds = %if.end24
  %v31 = getelementptr inbounds %struct.node, %struct.node* %0, i32 %add25, i32 0
  %12 = load double, double* %v31, align 8, !tbaa !10
  %add32 = fadd double %v.2, %12
  %inc33 = add nsw i32 %n.2, 1
  br label %if.end34

if.end34:                                         ; preds = %if.then27, %if.end24
  %n.3 = phi i32 [ %inc33, %if.then27 ], [ %n.2, %if.end24 ]
  %v.3 = phi double [ %add32, %if.then27 ], [ %v.2, %if.end24 ]
  %v37 = getelementptr inbounds %struct.node, %struct.node* %0, i32 %j.096, i32 0
  %13 = load double, double* %v37, align 8, !tbaa !10
  %conv = sitofp i32 %n.3 to double
  %div = fdiv double %v.3, %conv
  %sub38 = fsub double %13, %div
  %v41 = getelementptr inbounds %struct.node, %struct.node* %1, i32 %j.096, i32 0
  store double %sub38, double* %v41, align 8, !tbaa !10
  %fixed = getelementptr inbounds %struct.node, %struct.node* %0, i32 %j.096, i32 1
  %14 = load i32, i32* %fixed, align 8, !tbaa !6
  %tobool44 = icmp eq i32 %14, 0
  %mul = fmul double %sub38, %sub38
  %add46 = fadd double %total.1100, %mul
  %total.2 = select i1 %tobool44, double %add46, double %total.1100
  %exitcond = icmp eq i32 %add25, %w
  br i1 %exitcond, label %for.inc49, label %for.body3

for.inc49:                                        ; preds = %if.end34, %if.end34.us, %for.cond1.preheader.for.inc49_crit_edge
  %inc50.pre-phi = phi i32 [ %.pre109, %for.cond1.preheader.for.inc49_crit_edge ], [ %add15, %if.end34.us ], [ %add15, %if.end34 ]
  %total.1.lcssa = phi double [ %total.0104, %for.cond1.preheader.for.inc49_crit_edge ], [ %total.2.us, %if.end34.us ], [ %total.2, %if.end34 ]
  %exitcond108 = icmp eq i32 %inc50.pre-phi, %h
  br i1 %exitcond108, label %for.end51, label %for.cond1.preheader

for.end51:                                        ; preds = %for.inc49, %entry
  %total.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %total.1.lcssa, %for.inc49 ]
  ret double %total.0.lcssa
}

; Function Attrs: nounwind
define hidden double @iter(%struct.node** nocapture readonly %m, i32 %w, i32 %h) local_unnamed_addr #0 {
entry:
  %cur = alloca [3 x double], align 16
  %mul1.i = shl i32 %w, 4
  %mul217.i = or i32 %mul1.i, 4
  %add.i = mul i32 %mul217.i, %h
  %call.i = tail call noalias i8* @calloc(i32 1, i32 %add.i) #4
  %0 = bitcast i8* %call.i to %struct.node**
  %cmp18.i = icmp sgt i32 %h, 0
  br i1 %cmp18.i, label %for.body.lr.ph.i, label %alloc2.exit

for.body.lr.ph.i:                                 ; preds = %entry
  %add.ptr3.i = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %h
  %1 = bitcast %struct.node** %add.ptr3.i to %struct.node*
  br label %for.body.i

for.body.i:                                       ; preds = %cond.end.i, %for.body.lr.ph.i
  %i.019.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %inc.i, %cond.end.i ]
  %tobool.i = icmp eq i32 %i.019.i, 0
  br i1 %tobool.i, label %cond.end.i, label %cond.true.i

cond.true.i:                                      ; preds = %for.body.i
  %sub.i = add nsw i32 %i.019.i, -1
  %arrayidx.i = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %sub.i
  %2 = load %struct.node*, %struct.node** %arrayidx.i, align 4, !tbaa !2
  %add.ptr.i = getelementptr inbounds %struct.node, %struct.node* %2, i32 %w
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.true.i, %for.body.i
  %cond.i = phi %struct.node* [ %add.ptr.i, %cond.true.i ], [ %1, %for.body.i ]
  %arrayidx4.i = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %i.019.i
  store %struct.node* %cond.i, %struct.node** %arrayidx4.i, align 4, !tbaa !2
  %inc.i = add nuw nsw i32 %i.019.i, 1
  %exitcond.i = icmp eq i32 %inc.i, %h
  br i1 %exitcond.i, label %alloc2.exit, label %for.body.i

alloc2.exit:                                      ; preds = %cond.end.i, %entry
  %3 = bitcast [3 x double]* %cur to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #4
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 %3, i8 0, i32 24, i1 false)
  %arrayidx.i86 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 1
  %arrayidx4.i87 = getelementptr inbounds %struct.node*, %struct.node** %m, i32 6
  %cmp493 = icmp sgt i32 %w, 0
  br i1 %cmp18.i, label %while.body.us, label %while.body

while.body.us:                                    ; preds = %alloc2.exit, %for.cond.while.cond.loopexit_crit_edge.us
  %4 = load %struct.node*, %struct.node** %arrayidx.i86, align 4, !tbaa !2
  %fixed.i.us = getelementptr inbounds %struct.node, %struct.node* %4, i32 1, i32 1
  store i32 1, i32* %fixed.i.us, align 8, !tbaa !6
  %v.i.us = getelementptr inbounds %struct.node, %struct.node* %4, i32 1, i32 0
  store double 1.000000e+00, double* %v.i.us, align 8, !tbaa !10
  %5 = load %struct.node*, %struct.node** %arrayidx4.i87, align 4, !tbaa !2
  %fixed6.i.us = getelementptr inbounds %struct.node, %struct.node* %5, i32 7, i32 1
  store i32 -1, i32* %fixed6.i.us, align 8, !tbaa !6
  %v9.i.us = getelementptr inbounds %struct.node, %struct.node* %5, i32 7, i32 0
  store double -1.000000e+00, double* %v9.i.us, align 8, !tbaa !10
  %call1.us = tail call double @calc_diff(%struct.node** %m, %struct.node** %0, i32 %w, i32 %h)
  br i1 %cmp493, label %for.cond3.preheader.us.us, label %for.cond.while.cond.loopexit_crit_edge.us

for.cond.while.cond.loopexit_crit_edge.us:        ; preds = %for.cond3.for.inc10_crit_edge.us.us, %while.body.us
  %cmp.us = fcmp ogt double %call1.us, 0x3AF357C299A88EA7
  br i1 %cmp.us, label %while.body.us, label %for.cond13.preheader

for.cond3.preheader.us.us:                        ; preds = %while.body.us, %for.cond3.for.inc10_crit_edge.us.us
  %i.096.us.us = phi i32 [ %inc11.us.us, %for.cond3.for.inc10_crit_edge.us.us ], [ 0, %while.body.us ]
  %arrayidx.us.us = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %i.096.us.us
  %6 = load %struct.node*, %struct.node** %arrayidx.us.us, align 4, !tbaa !2
  %arrayidx7.us.us = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %i.096.us.us
  %7 = load %struct.node*, %struct.node** %arrayidx7.us.us, align 4, !tbaa !2
  br label %for.body5.us.us

for.cond3.for.inc10_crit_edge.us.us:              ; preds = %for.body5.us.us
  %inc11.us.us = add nuw nsw i32 %i.096.us.us, 1
  %exitcond124 = icmp eq i32 %inc11.us.us, %h
  br i1 %exitcond124, label %for.cond.while.cond.loopexit_crit_edge.us, label %for.cond3.preheader.us.us

for.body5.us.us:                                  ; preds = %for.body5.us.us, %for.cond3.preheader.us.us
  %j.094.us.us = phi i32 [ 0, %for.cond3.preheader.us.us ], [ %inc.us.us, %for.body5.us.us ]
  %v.us.us = getelementptr inbounds %struct.node, %struct.node* %6, i32 %j.094.us.us, i32 0
  %8 = load double, double* %v.us.us, align 8, !tbaa !10
  %v9.us.us = getelementptr inbounds %struct.node, %struct.node* %7, i32 %j.094.us.us, i32 0
  %9 = load double, double* %v9.us.us, align 8, !tbaa !10
  %sub.us.us = fsub double %9, %8
  store double %sub.us.us, double* %v9.us.us, align 8, !tbaa !10
  %inc.us.us = add nuw nsw i32 %j.094.us.us, 1
  %exitcond123 = icmp eq i32 %inc.us.us, %w
  br i1 %exitcond123, label %for.cond3.for.inc10_crit_edge.us.us, label %for.body5.us.us

for.cond13.preheader:                             ; preds = %while.body, %for.cond.while.cond.loopexit_crit_edge.us
  br i1 %cmp18.i, label %for.cond16.preheader.lr.ph, label %for.end46

for.cond16.preheader.lr.ph:                       ; preds = %for.cond13.preheader
  %sub28 = add nsw i32 %h, -1
  %sub31 = add nsw i32 %w, -1
  br i1 %cmp493, label %for.cond16.preheader.us, label %for.end46

for.cond16.preheader.us:                          ; preds = %for.cond16.preheader.lr.ph, %for.cond16.for.inc44_crit_edge.us
  %i.191.us = phi i32 [ %inc45.us, %for.cond16.for.inc44_crit_edge.us ], [ 0, %for.cond16.preheader.lr.ph ]
  %arrayidx19.us = getelementptr inbounds %struct.node*, %struct.node** %0, i32 %i.191.us
  %10 = load %struct.node*, %struct.node** %arrayidx19.us, align 4, !tbaa !2
  %tobool.us = icmp ne i32 %i.191.us, 0
  %lnot.ext.us = zext i1 %tobool.us to i32
  %cmp29.us = icmp slt i32 %i.191.us, %sub28
  %conv.us = zext i1 %cmp29.us to i32
  %add.us = add nuw nsw i32 %conv.us, %lnot.ext.us
  %arrayidx36.us = getelementptr inbounds %struct.node*, %struct.node** %m, i32 %i.191.us
  %11 = load %struct.node*, %struct.node** %arrayidx36.us, align 4, !tbaa !2
  br label %for.body18.us

for.body18.us:                                    ; preds = %for.body18.us, %for.cond16.preheader.us
  %j.189.us = phi i32 [ 0, %for.cond16.preheader.us ], [ %inc42.us, %for.body18.us ]
  %v21.us = getelementptr inbounds %struct.node, %struct.node* %10, i32 %j.189.us, i32 0
  %12 = load double, double* %v21.us, align 8, !tbaa !10
  %tobool23.us = icmp ne i32 %j.189.us, 0
  %lnot.ext27.us = zext i1 %tobool23.us to i32
  %cmp32.us = icmp slt i32 %j.189.us, %sub31
  %conv33.us = zext i1 %cmp32.us to i32
  %add30.us = add nuw nsw i32 %add.us, %lnot.ext27.us
  %add34.us = add nuw nsw i32 %add30.us, %conv33.us
  %conv35.us = sitofp i32 %add34.us to double
  %mul.us = fmul double %12, %conv35.us
  %fixed.us = getelementptr inbounds %struct.node, %struct.node* %11, i32 %j.189.us, i32 1
  %13 = load i32, i32* %fixed.us, align 8, !tbaa !6
  %add38.us = add nsw i32 %13, 1
  %arrayidx39.us = getelementptr inbounds [3 x double], [3 x double]* %cur, i32 0, i32 %add38.us
  %14 = load double, double* %arrayidx39.us, align 8, !tbaa !11
  %add40.us = fadd double %mul.us, %14
  store double %add40.us, double* %arrayidx39.us, align 8, !tbaa !11
  %inc42.us = add nuw nsw i32 %j.189.us, 1
  %exitcond = icmp eq i32 %inc42.us, %w
  br i1 %exitcond, label %for.cond16.for.inc44_crit_edge.us, label %for.body18.us

for.cond16.for.inc44_crit_edge.us:                ; preds = %for.body18.us
  %inc45.us = add nuw nsw i32 %i.191.us, 1
  %exitcond120 = icmp eq i32 %inc45.us, %h
  br i1 %exitcond120, label %for.end46.loopexit, label %for.cond16.preheader.us

while.body:                                       ; preds = %alloc2.exit, %while.body
  %15 = load %struct.node*, %struct.node** %arrayidx.i86, align 4, !tbaa !2
  %fixed.i = getelementptr inbounds %struct.node, %struct.node* %15, i32 1, i32 1
  store i32 1, i32* %fixed.i, align 8, !tbaa !6
  %v.i = getelementptr inbounds %struct.node, %struct.node* %15, i32 1, i32 0
  store double 1.000000e+00, double* %v.i, align 8, !tbaa !10
  %16 = load %struct.node*, %struct.node** %arrayidx4.i87, align 4, !tbaa !2
  %fixed6.i = getelementptr inbounds %struct.node, %struct.node* %16, i32 7, i32 1
  store i32 -1, i32* %fixed6.i, align 8, !tbaa !6
  %v9.i = getelementptr inbounds %struct.node, %struct.node* %16, i32 7, i32 0
  store double -1.000000e+00, double* %v9.i, align 8, !tbaa !10
  %call1 = tail call double @calc_diff(%struct.node** %m, %struct.node** %0, i32 %w, i32 %h)
  %cmp = fcmp ogt double %call1, 0x3AF357C299A88EA7
  br i1 %cmp, label %while.body, label %for.cond13.preheader

for.end46.loopexit:                               ; preds = %for.cond16.for.inc44_crit_edge.us
  %arrayidx47.phi.trans.insert = getelementptr inbounds [3 x double], [3 x double]* %cur, i32 0, i32 2
  %.pre = load double, double* %arrayidx47.phi.trans.insert, align 16, !tbaa !11
  %arrayidx48.phi.trans.insert = getelementptr inbounds [3 x double], [3 x double]* %cur, i32 0, i32 0
  %.pre125 = load double, double* %arrayidx48.phi.trans.insert, align 16, !tbaa !11
  br label %for.end46

for.end46:                                        ; preds = %for.cond16.preheader.lr.ph, %for.end46.loopexit, %for.cond13.preheader
  %17 = phi double [ %.pre125, %for.end46.loopexit ], [ 0.000000e+00, %for.cond13.preheader ], [ 0.000000e+00, %for.cond16.preheader.lr.ph ]
  %18 = phi double [ %.pre, %for.end46.loopexit ], [ 0.000000e+00, %for.cond13.preheader ], [ 0.000000e+00, %for.cond16.preheader.lr.ph ]
  tail call void @free(i8* %call.i) #4
  %sub49 = fsub double %18, %17
  %div = fmul double %sub49, 5.000000e-01
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #4
  ret double %div
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
cond.end.i.9:
  %call.i = tail call noalias i8* @calloc(i32 1, i32 1640) #4
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

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
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
