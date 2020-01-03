; ModuleID = 'benchmark4pipeline_c/pascal_matrix_generation.c'
source_filename = "benchmark4pipeline_c/pascal_matrix_generation.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@.str.1 = private unnamed_addr constant [6 x i8] c"%4d%c\00", align 1
@str = private unnamed_addr constant [28 x i8] c"=== Pascal upper matrix ===\00", align 1
@str.4 = private unnamed_addr constant [28 x i8] c"=== Pascal lower matrix ===\00", align 1
@str.5 = private unnamed_addr constant [32 x i8] c"=== Pascal symmetric matrix ===\00", align 1

; Function Attrs: norecurse nounwind
define hidden void @pascal_low(i32** nocapture readonly %mat, i32 %n) local_unnamed_addr #0 {
entry:
  %cmp48 = icmp sgt i32 %n, 0
  br i1 %cmp48, label %for.cond1.preheader.us, label %for.end23

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc21_crit_edge.us
  %i.049.us = phi i32 [ %inc22.us, %for.cond1.for.inc21_crit_edge.us ], [ 0, %entry ]
  %sub.us = add nsw i32 %i.049.us, -1
  %arrayidx12.us = getelementptr inbounds i32*, i32** %mat, i32 %sub.us
  %arrayidx18.us = getelementptr inbounds i32*, i32** %mat, i32 %i.049.us
  %0 = load i32*, i32** %arrayidx18.us, align 4, !tbaa !2
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.inc.us, %for.cond1.preheader.us
  %j.046.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %inc.us, %for.inc.us ]
  %cmp4.us = icmp ult i32 %i.049.us, %j.046.us
  br i1 %cmp4.us, label %for.inc.us, label %if.else.us

if.else.us:                                       ; preds = %for.body3.us
  %cmp6.us = icmp eq i32 %i.049.us, %j.046.us
  %cmp7.us = icmp eq i32 %j.046.us, 0
  %or.cond.us = or i1 %cmp6.us, %cmp7.us
  br i1 %or.cond.us, label %for.inc.us, label %if.else11.us

if.else11.us:                                     ; preds = %if.else.us
  %1 = load i32*, i32** %arrayidx12.us, align 4, !tbaa !2
  %sub13.us = add nsw i32 %j.046.us, -1
  %arrayidx14.us = getelementptr inbounds i32, i32* %1, i32 %sub13.us
  %2 = load i32, i32* %arrayidx14.us, align 4, !tbaa !6
  %arrayidx17.us = getelementptr inbounds i32, i32* %1, i32 %j.046.us
  %3 = load i32, i32* %arrayidx17.us, align 4, !tbaa !6
  %add.us = add nsw i32 %3, %2
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body3.us, %if.else.us, %if.else11.us
  %.sink = phi i32 [ %add.us, %if.else11.us ], [ 1, %if.else.us ], [ 0, %for.body3.us ]
  %arrayidx5.us = getelementptr inbounds i32, i32* %0, i32 %j.046.us
  store i32 %.sink, i32* %arrayidx5.us, align 4, !tbaa !6
  %inc.us = add nuw nsw i32 %j.046.us, 1
  %exitcond = icmp eq i32 %inc.us, %n
  br i1 %exitcond, label %for.cond1.for.inc21_crit_edge.us, label %for.body3.us

for.cond1.for.inc21_crit_edge.us:                 ; preds = %for.inc.us
  %inc22.us = add nuw nsw i32 %i.049.us, 1
  %exitcond51 = icmp eq i32 %inc22.us, %n
  br i1 %exitcond51, label %for.end23, label %for.cond1.preheader.us

for.end23:                                        ; preds = %for.cond1.for.inc21_crit_edge.us, %entry
  ret void
}

; Function Attrs: norecurse nounwind
define hidden void @pascal_upp(i32** nocapture readonly %mat, i32 %n) local_unnamed_addr #0 {
entry:
  %cmp48 = icmp sgt i32 %n, 0
  br i1 %cmp48, label %for.cond1.preheader.us, label %for.end23

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc21_crit_edge.us
  %i.049.us = phi i32 [ %inc22.us, %for.cond1.for.inc21_crit_edge.us ], [ 0, %entry ]
  %cmp7.us = icmp eq i32 %i.049.us, 0
  %sub.us = add nsw i32 %i.049.us, -1
  %arrayidx12.us = getelementptr inbounds i32*, i32** %mat, i32 %sub.us
  %arrayidx15.us = getelementptr inbounds i32*, i32** %mat, i32 %i.049.us
  br i1 %cmp7.us, label %for.body3.us.us.preheader, label %for.body3.us52

for.body3.us.us.preheader:                        ; preds = %for.cond1.preheader.us
  %0 = load i32*, i32** %arrayidx15.us, align 4, !tbaa !2
  br label %for.inc.us.us

for.body3.us52:                                   ; preds = %for.cond1.preheader.us, %for.inc.us66
  %j.046.us53 = phi i32 [ %inc.us68, %for.inc.us66 ], [ 0, %for.cond1.preheader.us ]
  %cmp4.us54 = icmp ugt i32 %i.049.us, %j.046.us53
  br i1 %cmp4.us54, label %if.then.us64, label %if.else.us55

if.else.us55:                                     ; preds = %for.body3.us52
  %cmp6.us = icmp eq i32 %i.049.us, %j.046.us53
  br i1 %cmp6.us, label %if.then8.us62, label %if.else11.us56

if.else11.us56:                                   ; preds = %if.else.us55
  %1 = load i32*, i32** %arrayidx12.us, align 4, !tbaa !2
  %sub13.us57 = add nsw i32 %j.046.us53, -1
  %arrayidx14.us58 = getelementptr inbounds i32, i32* %1, i32 %sub13.us57
  %2 = load i32, i32* %arrayidx14.us58, align 4, !tbaa !6
  %3 = load i32*, i32** %arrayidx15.us, align 4, !tbaa !2
  %arrayidx17.us59 = getelementptr inbounds i32, i32* %3, i32 %sub13.us57
  %4 = load i32, i32* %arrayidx17.us59, align 4, !tbaa !6
  %add.us60 = add nsw i32 %4, %2
  %arrayidx19.us61 = getelementptr inbounds i32, i32* %3, i32 %j.046.us53
  br label %for.inc.us66

if.then8.us62:                                    ; preds = %if.else.us55
  %5 = load i32*, i32** %arrayidx15.us, align 4, !tbaa !2
  %arrayidx10.us63 = getelementptr inbounds i32, i32* %5, i32 %i.049.us
  br label %for.inc.us66

if.then.us64:                                     ; preds = %for.body3.us52
  %6 = load i32*, i32** %arrayidx15.us, align 4, !tbaa !2
  %arrayidx5.us65 = getelementptr inbounds i32, i32* %6, i32 %j.046.us53
  br label %for.inc.us66

for.inc.us66:                                     ; preds = %if.then.us64, %if.then8.us62, %if.else11.us56
  %arrayidx5.us65.sink = phi i32* [ %arrayidx5.us65, %if.then.us64 ], [ %arrayidx10.us63, %if.then8.us62 ], [ %arrayidx19.us61, %if.else11.us56 ]
  %.sink = phi i32 [ 0, %if.then.us64 ], [ 1, %if.then8.us62 ], [ %add.us60, %if.else11.us56 ]
  store i32 %.sink, i32* %arrayidx5.us65.sink, align 4, !tbaa !6
  %inc.us68 = add nuw nsw i32 %j.046.us53, 1
  %exitcond = icmp eq i32 %inc.us68, %n
  br i1 %exitcond, label %for.cond1.for.inc21_crit_edge.us, label %for.body3.us52

for.cond1.for.inc21_crit_edge.us:                 ; preds = %for.inc.us66, %for.inc.us.us
  %inc22.us = add nuw nsw i32 %i.049.us, 1
  %exitcond74 = icmp eq i32 %inc22.us, %n
  br i1 %exitcond74, label %for.end23, label %for.cond1.preheader.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.body3.us.us.preheader
  %j.046.us.us = phi i32 [ %inc.us.us, %for.inc.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx10.us.us = getelementptr inbounds i32, i32* %0, i32 %j.046.us.us
  store i32 1, i32* %arrayidx10.us.us, align 4, !tbaa !6
  %inc.us.us = add nuw nsw i32 %j.046.us.us, 1
  %exitcond73 = icmp eq i32 %inc.us.us, %n
  br i1 %exitcond73, label %for.cond1.for.inc21_crit_edge.us, label %for.inc.us.us

for.end23:                                        ; preds = %for.cond1.for.inc21_crit_edge.us, %entry
  ret void
}

; Function Attrs: norecurse nounwind
define hidden void @pascal_sym(i32** nocapture readonly %mat, i32 %n) local_unnamed_addr #0 {
entry:
  %cmp35 = icmp sgt i32 %n, 0
  br i1 %cmp35, label %for.cond1.preheader.us, label %for.end16

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc14_crit_edge.us
  %i.036.us = phi i32 [ %inc15.us, %for.cond1.for.inc14_crit_edge.us ], [ 0, %entry ]
  %cmp4.us = icmp eq i32 %i.036.us, 0
  %sub.us = add nsw i32 %i.036.us, -1
  %arrayidx7.us = getelementptr inbounds i32*, i32** %mat, i32 %sub.us
  %arrayidx9.us = getelementptr inbounds i32*, i32** %mat, i32 %i.036.us
  br i1 %cmp4.us, label %for.body3.us.us.preheader, label %for.body3.us38

for.body3.us.us.preheader:                        ; preds = %for.cond1.preheader.us
  %.pre = load i32*, i32** %arrayidx9.us, align 4, !tbaa !2
  br label %for.body3.us.us

for.body3.us38:                                   ; preds = %for.cond1.preheader.us, %for.inc.us48
  %j.033.us39 = phi i32 [ %inc.us50, %for.inc.us48 ], [ 0, %for.cond1.preheader.us ]
  %cmp5.us = icmp eq i32 %j.033.us39, 0
  br i1 %cmp5.us, label %if.then.us46, label %if.else.us40

if.else.us40:                                     ; preds = %for.body3.us38
  %0 = load i32*, i32** %arrayidx7.us, align 4, !tbaa !2
  %arrayidx8.us41 = getelementptr inbounds i32, i32* %0, i32 %j.033.us39
  %1 = load i32, i32* %arrayidx8.us41, align 4, !tbaa !6
  %2 = load i32*, i32** %arrayidx9.us, align 4, !tbaa !2
  %sub10.us42 = add nsw i32 %j.033.us39, -1
  %arrayidx11.us43 = getelementptr inbounds i32, i32* %2, i32 %sub10.us42
  %3 = load i32, i32* %arrayidx11.us43, align 4, !tbaa !6
  %add.us44 = add nsw i32 %3, %1
  %arrayidx13.us45 = getelementptr inbounds i32, i32* %2, i32 %j.033.us39
  store i32 %add.us44, i32* %arrayidx13.us45, align 4, !tbaa !6
  br label %for.inc.us48

if.then.us46:                                     ; preds = %for.body3.us38
  %4 = load i32*, i32** %arrayidx9.us, align 4, !tbaa !2
  store i32 1, i32* %4, align 4, !tbaa !6
  br label %for.inc.us48

for.inc.us48:                                     ; preds = %if.then.us46, %if.else.us40
  %inc.us50 = add nuw nsw i32 %j.033.us39, 1
  %exitcond = icmp eq i32 %inc.us50, %n
  br i1 %exitcond, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us38

for.cond1.for.inc14_crit_edge.us:                 ; preds = %for.inc.us48, %for.body3.us.us
  %inc15.us = add nuw nsw i32 %i.036.us, 1
  %exitcond56 = icmp eq i32 %inc15.us, %n
  br i1 %exitcond56, label %for.end16, label %for.cond1.preheader.us

for.body3.us.us:                                  ; preds = %for.body3.us.us, %for.body3.us.us.preheader
  %j.033.us.us = phi i32 [ %inc.us.us, %for.body3.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx6.us.us = getelementptr inbounds i32, i32* %.pre, i32 %j.033.us.us
  store i32 1, i32* %arrayidx6.us.us, align 4, !tbaa !6
  %inc.us.us = add nuw nsw i32 %j.033.us.us, 1
  %exitcond55 = icmp eq i32 %inc.us.us, %n
  br i1 %exitcond55, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us.us

for.end16:                                        ; preds = %for.cond1.for.inc14_crit_edge.us, %entry
  ret void
}

; Function Attrs: nounwind
define hidden i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #1 {
for.cond1.for.inc14_crit_edge.us.i.4:
  %call = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %0 = bitcast i8* %call to i32**
  %call1 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %1 = bitcast i8* %call to i8**
  store i8* %call1, i8** %1, align 4, !tbaa !2
  %call1.1 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %arrayidx.1 = getelementptr inbounds i8, i8* %call, i32 4
  %2 = bitcast i8* %arrayidx.1 to i32**
  %3 = bitcast i8* %arrayidx.1 to i8**
  store i8* %call1.1, i8** %3, align 4, !tbaa !2
  %call1.2 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %arrayidx.2 = getelementptr inbounds i8, i8* %call, i32 8
  %4 = bitcast i8* %arrayidx.2 to i32**
  %5 = bitcast i8* %arrayidx.2 to i8**
  store i8* %call1.2, i8** %5, align 4, !tbaa !2
  %call1.3 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %arrayidx.3 = getelementptr inbounds i8, i8* %call, i32 12
  %6 = bitcast i8* %arrayidx.3 to i32**
  %7 = bitcast i8* %arrayidx.3 to i8**
  store i8* %call1.3, i8** %7, align 4, !tbaa !2
  %call1.4 = tail call noalias i8* @calloc(i32 5, i32 4) #3
  %arrayidx.4 = getelementptr inbounds i8, i8* %call, i32 16
  %8 = bitcast i8* %arrayidx.4 to i32**
  %9 = bitcast i8* %arrayidx.4 to i8**
  store i8* %call1.4, i8** %9, align 4, !tbaa !2
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @str, i32 0, i32 0))
  %10 = load i32*, i32** %0, align 4, !tbaa !2
  store i32 1, i32* %10, align 4, !tbaa !6
  %arrayidx10.us.us.i.1 = getelementptr inbounds i32, i32* %10, i32 1
  store i32 1, i32* %arrayidx10.us.us.i.1, align 4, !tbaa !6
  %arrayidx10.us.us.i.2 = getelementptr inbounds i32, i32* %10, i32 2
  store i32 1, i32* %arrayidx10.us.us.i.2, align 4, !tbaa !6
  %arrayidx10.us.us.i.3 = getelementptr inbounds i32, i32* %10, i32 3
  store i32 1, i32* %arrayidx10.us.us.i.3, align 4, !tbaa !6
  %arrayidx10.us.us.i.4 = getelementptr inbounds i32, i32* %10, i32 4
  store i32 1, i32* %arrayidx10.us.us.i.4, align 4, !tbaa !6
  %11 = load i32*, i32** %2, align 4, !tbaa !2
  store i32 0, i32* %11, align 4, !tbaa !6
  %arrayidx10.us63.i.1.1 = getelementptr inbounds i32, i32* %11, i32 1
  store i32 1, i32* %arrayidx10.us63.i.1.1, align 4, !tbaa !6
  %arrayidx14.us58.i.2.1 = getelementptr inbounds i32, i32* %10, i32 1
  %12 = load i32, i32* %arrayidx14.us58.i.2.1, align 4, !tbaa !6
  %add.us60.i.2.1 = add nsw i32 %12, 1
  %arrayidx19.us61.i.2.1 = getelementptr inbounds i32, i32* %11, i32 2
  store i32 %add.us60.i.2.1, i32* %arrayidx19.us61.i.2.1, align 4, !tbaa !6
  %arrayidx14.us58.i.3.1 = getelementptr inbounds i32, i32* %10, i32 2
  %13 = load i32, i32* %arrayidx14.us58.i.3.1, align 4, !tbaa !6
  %add.us60.i.3.1 = add nsw i32 %add.us60.i.2.1, %13
  %arrayidx19.us61.i.3.1 = getelementptr inbounds i32, i32* %11, i32 3
  store i32 %add.us60.i.3.1, i32* %arrayidx19.us61.i.3.1, align 4, !tbaa !6
  %arrayidx14.us58.i.4.1 = getelementptr inbounds i32, i32* %10, i32 3
  %14 = load i32, i32* %arrayidx14.us58.i.4.1, align 4, !tbaa !6
  %add.us60.i.4.1 = add nsw i32 %add.us60.i.3.1, %14
  %arrayidx19.us61.i.4.1 = getelementptr inbounds i32, i32* %11, i32 4
  store i32 %add.us60.i.4.1, i32* %arrayidx19.us61.i.4.1, align 4, !tbaa !6
  %15 = load i32*, i32** %4, align 4, !tbaa !2
  store i32 0, i32* %15, align 4, !tbaa !6
  %arrayidx5.us65.i.1.2 = getelementptr inbounds i32, i32* %15, i32 1
  store i32 0, i32* %arrayidx5.us65.i.1.2, align 4, !tbaa !6
  %arrayidx10.us63.i.2.2 = getelementptr inbounds i32, i32* %15, i32 2
  store i32 1, i32* %arrayidx10.us63.i.2.2, align 4, !tbaa !6
  %arrayidx14.us58.i.3.2 = getelementptr inbounds i32, i32* %11, i32 2
  %16 = load i32, i32* %arrayidx14.us58.i.3.2, align 4, !tbaa !6
  %add.us60.i.3.2 = add nsw i32 %16, 1
  %arrayidx19.us61.i.3.2 = getelementptr inbounds i32, i32* %15, i32 3
  store i32 %add.us60.i.3.2, i32* %arrayidx19.us61.i.3.2, align 4, !tbaa !6
  %arrayidx14.us58.i.4.2 = getelementptr inbounds i32, i32* %11, i32 3
  %17 = load i32, i32* %arrayidx14.us58.i.4.2, align 4, !tbaa !6
  %add.us60.i.4.2 = add nsw i32 %add.us60.i.3.2, %17
  %arrayidx19.us61.i.4.2 = getelementptr inbounds i32, i32* %15, i32 4
  store i32 %add.us60.i.4.2, i32* %arrayidx19.us61.i.4.2, align 4, !tbaa !6
  %18 = load i32*, i32** %6, align 4, !tbaa !2
  store i32 0, i32* %18, align 4, !tbaa !6
  %arrayidx5.us65.i.1.3 = getelementptr inbounds i32, i32* %18, i32 1
  store i32 0, i32* %arrayidx5.us65.i.1.3, align 4, !tbaa !6
  %arrayidx5.us65.i.2.3 = getelementptr inbounds i32, i32* %18, i32 2
  store i32 0, i32* %arrayidx5.us65.i.2.3, align 4, !tbaa !6
  %arrayidx10.us63.i.3.3 = getelementptr inbounds i32, i32* %18, i32 3
  store i32 1, i32* %arrayidx10.us63.i.3.3, align 4, !tbaa !6
  %arrayidx14.us58.i.4.3 = getelementptr inbounds i32, i32* %15, i32 3
  %19 = load i32, i32* %arrayidx14.us58.i.4.3, align 4, !tbaa !6
  %add.us60.i.4.3 = add nsw i32 %19, 1
  %arrayidx19.us61.i.4.3 = getelementptr inbounds i32, i32* %18, i32 4
  store i32 %add.us60.i.4.3, i32* %arrayidx19.us61.i.4.3, align 4, !tbaa !6
  %20 = load i32*, i32** %8, align 4, !tbaa !2
  store i32 0, i32* %20, align 4, !tbaa !6
  %arrayidx5.us65.i.1.4 = getelementptr inbounds i32, i32* %20, i32 1
  store i32 0, i32* %arrayidx5.us65.i.1.4, align 4, !tbaa !6
  %arrayidx5.us65.i.2.4 = getelementptr inbounds i32, i32* %20, i32 2
  store i32 0, i32* %arrayidx5.us65.i.2.4, align 4, !tbaa !6
  %arrayidx5.us65.i.3.4 = getelementptr inbounds i32, i32* %20, i32 3
  store i32 0, i32* %arrayidx5.us65.i.3.4, align 4, !tbaa !6
  %arrayidx10.us63.i.4.4 = getelementptr inbounds i32, i32* %20, i32 4
  store i32 1, i32* %arrayidx10.us63.i.4.4, align 4, !tbaa !6
  %.pre.pre = load i32, i32* %10, align 4, !tbaa !6
  %call12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %.pre.pre, i32 32)
  %arrayidx10.1 = getelementptr inbounds i32, i32* %10, i32 1
  %21 = load i32, i32* %arrayidx10.1, align 4, !tbaa !6
  %call12.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %21, i32 32)
  %arrayidx10.2 = getelementptr inbounds i32, i32* %10, i32 2
  %22 = load i32, i32* %arrayidx10.2, align 4, !tbaa !6
  %call12.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %22, i32 32)
  %arrayidx10.3 = getelementptr inbounds i32, i32* %10, i32 3
  %23 = load i32, i32* %arrayidx10.3, align 4, !tbaa !6
  %call12.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %23, i32 32)
  %arrayidx10.4 = getelementptr inbounds i32, i32* %10, i32 4
  %24 = load i32, i32* %arrayidx10.4, align 4, !tbaa !6
  %call12.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %24, i32 10)
  %25 = load i32*, i32** %2, align 4, !tbaa !2
  %26 = load i32, i32* %25, align 4, !tbaa !6
  %call12.1185 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %26, i32 32)
  %arrayidx10.1.1 = getelementptr inbounds i32, i32* %25, i32 1
  %27 = load i32, i32* %arrayidx10.1.1, align 4, !tbaa !6
  %call12.1.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %27, i32 32)
  %arrayidx10.2.1 = getelementptr inbounds i32, i32* %25, i32 2
  %28 = load i32, i32* %arrayidx10.2.1, align 4, !tbaa !6
  %call12.2.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %28, i32 32)
  %arrayidx10.3.1 = getelementptr inbounds i32, i32* %25, i32 3
  %29 = load i32, i32* %arrayidx10.3.1, align 4, !tbaa !6
  %call12.3.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %29, i32 32)
  %arrayidx10.4.1 = getelementptr inbounds i32, i32* %25, i32 4
  %30 = load i32, i32* %arrayidx10.4.1, align 4, !tbaa !6
  %call12.4.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %30, i32 10)
  %31 = load i32*, i32** %4, align 4, !tbaa !2
  %32 = load i32, i32* %31, align 4, !tbaa !6
  %call12.2186 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %32, i32 32)
  %arrayidx10.1.2 = getelementptr inbounds i32, i32* %31, i32 1
  %33 = load i32, i32* %arrayidx10.1.2, align 4, !tbaa !6
  %call12.1.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %33, i32 32)
  %arrayidx10.2.2 = getelementptr inbounds i32, i32* %31, i32 2
  %34 = load i32, i32* %arrayidx10.2.2, align 4, !tbaa !6
  %call12.2.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %34, i32 32)
  %arrayidx10.3.2 = getelementptr inbounds i32, i32* %31, i32 3
  %35 = load i32, i32* %arrayidx10.3.2, align 4, !tbaa !6
  %call12.3.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %35, i32 32)
  %arrayidx10.4.2 = getelementptr inbounds i32, i32* %31, i32 4
  %36 = load i32, i32* %arrayidx10.4.2, align 4, !tbaa !6
  %call12.4.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %36, i32 10)
  %37 = load i32*, i32** %6, align 4, !tbaa !2
  %38 = load i32, i32* %37, align 4, !tbaa !6
  %call12.3187 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %38, i32 32)
  %arrayidx10.1.3 = getelementptr inbounds i32, i32* %37, i32 1
  %39 = load i32, i32* %arrayidx10.1.3, align 4, !tbaa !6
  %call12.1.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %39, i32 32)
  %arrayidx10.2.3 = getelementptr inbounds i32, i32* %37, i32 2
  %40 = load i32, i32* %arrayidx10.2.3, align 4, !tbaa !6
  %call12.2.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %40, i32 32)
  %arrayidx10.3.3 = getelementptr inbounds i32, i32* %37, i32 3
  %41 = load i32, i32* %arrayidx10.3.3, align 4, !tbaa !6
  %call12.3.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %41, i32 32)
  %arrayidx10.4.3 = getelementptr inbounds i32, i32* %37, i32 4
  %42 = load i32, i32* %arrayidx10.4.3, align 4, !tbaa !6
  %call12.4.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %42, i32 10)
  %43 = load i32*, i32** %8, align 4, !tbaa !2
  %44 = load i32, i32* %43, align 4, !tbaa !6
  %call12.4188 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %44, i32 32)
  %arrayidx10.1.4 = getelementptr inbounds i32, i32* %43, i32 1
  %45 = load i32, i32* %arrayidx10.1.4, align 4, !tbaa !6
  %call12.1.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %45, i32 32)
  %arrayidx10.2.4 = getelementptr inbounds i32, i32* %43, i32 2
  %46 = load i32, i32* %arrayidx10.2.4, align 4, !tbaa !6
  %call12.2.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %46, i32 32)
  %arrayidx10.3.4 = getelementptr inbounds i32, i32* %43, i32 3
  %47 = load i32, i32* %arrayidx10.3.4, align 4, !tbaa !6
  %call12.3.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %47, i32 32)
  %arrayidx10.4.4 = getelementptr inbounds i32, i32* %43, i32 4
  %48 = load i32, i32* %arrayidx10.4.4, align 4, !tbaa !6
  %call12.4.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %48, i32 10)
  %puts103 = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @str.4, i32 0, i32 0))
  %49 = load i32*, i32** %0, align 4, !tbaa !2
  store i32 1, i32* %49, align 4, !tbaa !6
  %arrayidx5.us.i.1 = getelementptr inbounds i32, i32* %49, i32 1
  store i32 0, i32* %arrayidx5.us.i.1, align 4, !tbaa !6
  %arrayidx5.us.i.2 = getelementptr inbounds i32, i32* %49, i32 2
  store i32 0, i32* %arrayidx5.us.i.2, align 4, !tbaa !6
  %arrayidx5.us.i.3 = getelementptr inbounds i32, i32* %49, i32 3
  store i32 0, i32* %arrayidx5.us.i.3, align 4, !tbaa !6
  %arrayidx5.us.i.4 = getelementptr inbounds i32, i32* %49, i32 4
  store i32 0, i32* %arrayidx5.us.i.4, align 4, !tbaa !6
  %50 = load i32*, i32** %2, align 4, !tbaa !2
  store i32 1, i32* %50, align 4, !tbaa !6
  %arrayidx10.us.i.1.1 = getelementptr inbounds i32, i32* %50, i32 1
  store i32 1, i32* %arrayidx10.us.i.1.1, align 4, !tbaa !6
  %arrayidx5.us.i.2.1 = getelementptr inbounds i32, i32* %50, i32 2
  store i32 0, i32* %arrayidx5.us.i.2.1, align 4, !tbaa !6
  %arrayidx5.us.i.3.1 = getelementptr inbounds i32, i32* %50, i32 3
  store i32 0, i32* %arrayidx5.us.i.3.1, align 4, !tbaa !6
  %arrayidx5.us.i.4.1 = getelementptr inbounds i32, i32* %50, i32 4
  store i32 0, i32* %arrayidx5.us.i.4.1, align 4, !tbaa !6
  %51 = load i32*, i32** %4, align 4, !tbaa !2
  store i32 1, i32* %51, align 4, !tbaa !6
  %52 = load i32, i32* %50, align 4, !tbaa !6
  %arrayidx17.us.i.1.2 = getelementptr inbounds i32, i32* %50, i32 1
  %53 = load i32, i32* %arrayidx17.us.i.1.2, align 4, !tbaa !6
  %add.us.i.1.2 = add nsw i32 %53, %52
  %arrayidx19.us.i.1.2 = getelementptr inbounds i32, i32* %51, i32 1
  store i32 %add.us.i.1.2, i32* %arrayidx19.us.i.1.2, align 4, !tbaa !6
  %arrayidx10.us.i.2.2 = getelementptr inbounds i32, i32* %51, i32 2
  store i32 1, i32* %arrayidx10.us.i.2.2, align 4, !tbaa !6
  %arrayidx5.us.i.3.2 = getelementptr inbounds i32, i32* %51, i32 3
  store i32 0, i32* %arrayidx5.us.i.3.2, align 4, !tbaa !6
  %arrayidx5.us.i.4.2 = getelementptr inbounds i32, i32* %51, i32 4
  store i32 0, i32* %arrayidx5.us.i.4.2, align 4, !tbaa !6
  %54 = load i32*, i32** %6, align 4, !tbaa !2
  store i32 1, i32* %54, align 4, !tbaa !6
  %55 = load i32, i32* %51, align 4, !tbaa !6
  %arrayidx17.us.i.1.3 = getelementptr inbounds i32, i32* %51, i32 1
  %56 = load i32, i32* %arrayidx17.us.i.1.3, align 4, !tbaa !6
  %add.us.i.1.3 = add nsw i32 %56, %55
  %arrayidx19.us.i.1.3 = getelementptr inbounds i32, i32* %54, i32 1
  store i32 %add.us.i.1.3, i32* %arrayidx19.us.i.1.3, align 4, !tbaa !6
  %arrayidx14.us.i.2.3 = getelementptr inbounds i32, i32* %51, i32 1
  %57 = load i32, i32* %arrayidx14.us.i.2.3, align 4, !tbaa !6
  %arrayidx17.us.i.2.3 = getelementptr inbounds i32, i32* %51, i32 2
  %58 = load i32, i32* %arrayidx17.us.i.2.3, align 4, !tbaa !6
  %add.us.i.2.3 = add nsw i32 %58, %57
  %arrayidx19.us.i.2.3 = getelementptr inbounds i32, i32* %54, i32 2
  store i32 %add.us.i.2.3, i32* %arrayidx19.us.i.2.3, align 4, !tbaa !6
  %arrayidx10.us.i.3.3 = getelementptr inbounds i32, i32* %54, i32 3
  store i32 1, i32* %arrayidx10.us.i.3.3, align 4, !tbaa !6
  %arrayidx5.us.i.4.3 = getelementptr inbounds i32, i32* %54, i32 4
  store i32 0, i32* %arrayidx5.us.i.4.3, align 4, !tbaa !6
  %59 = load i32*, i32** %8, align 4, !tbaa !2
  store i32 1, i32* %59, align 4, !tbaa !6
  %60 = load i32, i32* %54, align 4, !tbaa !6
  %arrayidx17.us.i.1.4 = getelementptr inbounds i32, i32* %54, i32 1
  %61 = load i32, i32* %arrayidx17.us.i.1.4, align 4, !tbaa !6
  %add.us.i.1.4 = add nsw i32 %61, %60
  %arrayidx19.us.i.1.4 = getelementptr inbounds i32, i32* %59, i32 1
  store i32 %add.us.i.1.4, i32* %arrayidx19.us.i.1.4, align 4, !tbaa !6
  %arrayidx14.us.i.2.4 = getelementptr inbounds i32, i32* %54, i32 1
  %62 = load i32, i32* %arrayidx14.us.i.2.4, align 4, !tbaa !6
  %arrayidx17.us.i.2.4 = getelementptr inbounds i32, i32* %54, i32 2
  %63 = load i32, i32* %arrayidx17.us.i.2.4, align 4, !tbaa !6
  %add.us.i.2.4 = add nsw i32 %63, %62
  %arrayidx19.us.i.2.4 = getelementptr inbounds i32, i32* %59, i32 2
  store i32 %add.us.i.2.4, i32* %arrayidx19.us.i.2.4, align 4, !tbaa !6
  %arrayidx14.us.i.3.4 = getelementptr inbounds i32, i32* %54, i32 2
  %64 = load i32, i32* %arrayidx14.us.i.3.4, align 4, !tbaa !6
  %arrayidx17.us.i.3.4 = getelementptr inbounds i32, i32* %54, i32 3
  %65 = load i32, i32* %arrayidx17.us.i.3.4, align 4, !tbaa !6
  %add.us.i.3.4 = add nsw i32 %65, %64
  %arrayidx19.us.i.3.4 = getelementptr inbounds i32, i32* %59, i32 3
  store i32 %add.us.i.3.4, i32* %arrayidx19.us.i.3.4, align 4, !tbaa !6
  %arrayidx10.us.i.4.4 = getelementptr inbounds i32, i32* %59, i32 4
  store i32 1, i32* %arrayidx10.us.i.4.4, align 4, !tbaa !6
  %.pre230 = load i32, i32* %49, align 4, !tbaa !6
  %call31 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %.pre230, i32 32)
  %arrayidx27.1 = getelementptr inbounds i32, i32* %49, i32 1
  %66 = load i32, i32* %arrayidx27.1, align 4, !tbaa !6
  %call31.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %66, i32 32)
  %arrayidx27.2 = getelementptr inbounds i32, i32* %49, i32 2
  %67 = load i32, i32* %arrayidx27.2, align 4, !tbaa !6
  %call31.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %67, i32 32)
  %arrayidx27.3 = getelementptr inbounds i32, i32* %49, i32 3
  %68 = load i32, i32* %arrayidx27.3, align 4, !tbaa !6
  %call31.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %68, i32 32)
  %arrayidx27.4 = getelementptr inbounds i32, i32* %49, i32 4
  %69 = load i32, i32* %arrayidx27.4, align 4, !tbaa !6
  %call31.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %69, i32 10)
  %70 = load i32*, i32** %2, align 4, !tbaa !2
  %71 = load i32, i32* %70, align 4, !tbaa !6
  %call31.1154 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %71, i32 32)
  %arrayidx27.1.1 = getelementptr inbounds i32, i32* %70, i32 1
  %72 = load i32, i32* %arrayidx27.1.1, align 4, !tbaa !6
  %call31.1.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %72, i32 32)
  %arrayidx27.2.1 = getelementptr inbounds i32, i32* %70, i32 2
  %73 = load i32, i32* %arrayidx27.2.1, align 4, !tbaa !6
  %call31.2.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %73, i32 32)
  %arrayidx27.3.1 = getelementptr inbounds i32, i32* %70, i32 3
  %74 = load i32, i32* %arrayidx27.3.1, align 4, !tbaa !6
  %call31.3.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %74, i32 32)
  %arrayidx27.4.1 = getelementptr inbounds i32, i32* %70, i32 4
  %75 = load i32, i32* %arrayidx27.4.1, align 4, !tbaa !6
  %call31.4.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %75, i32 10)
  %76 = load i32*, i32** %4, align 4, !tbaa !2
  %77 = load i32, i32* %76, align 4, !tbaa !6
  %call31.2155 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %77, i32 32)
  %arrayidx27.1.2 = getelementptr inbounds i32, i32* %76, i32 1
  %78 = load i32, i32* %arrayidx27.1.2, align 4, !tbaa !6
  %call31.1.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %78, i32 32)
  %arrayidx27.2.2 = getelementptr inbounds i32, i32* %76, i32 2
  %79 = load i32, i32* %arrayidx27.2.2, align 4, !tbaa !6
  %call31.2.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %79, i32 32)
  %arrayidx27.3.2 = getelementptr inbounds i32, i32* %76, i32 3
  %80 = load i32, i32* %arrayidx27.3.2, align 4, !tbaa !6
  %call31.3.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %80, i32 32)
  %arrayidx27.4.2 = getelementptr inbounds i32, i32* %76, i32 4
  %81 = load i32, i32* %arrayidx27.4.2, align 4, !tbaa !6
  %call31.4.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %81, i32 10)
  %82 = load i32*, i32** %6, align 4, !tbaa !2
  %83 = load i32, i32* %82, align 4, !tbaa !6
  %call31.3156 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %83, i32 32)
  %arrayidx27.1.3 = getelementptr inbounds i32, i32* %82, i32 1
  %84 = load i32, i32* %arrayidx27.1.3, align 4, !tbaa !6
  %call31.1.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %84, i32 32)
  %arrayidx27.2.3 = getelementptr inbounds i32, i32* %82, i32 2
  %85 = load i32, i32* %arrayidx27.2.3, align 4, !tbaa !6
  %call31.2.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %85, i32 32)
  %arrayidx27.3.3 = getelementptr inbounds i32, i32* %82, i32 3
  %86 = load i32, i32* %arrayidx27.3.3, align 4, !tbaa !6
  %call31.3.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %86, i32 32)
  %arrayidx27.4.3 = getelementptr inbounds i32, i32* %82, i32 4
  %87 = load i32, i32* %arrayidx27.4.3, align 4, !tbaa !6
  %call31.4.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %87, i32 10)
  %88 = load i32*, i32** %8, align 4, !tbaa !2
  %89 = load i32, i32* %88, align 4, !tbaa !6
  %call31.4157 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %89, i32 32)
  %arrayidx27.1.4 = getelementptr inbounds i32, i32* %88, i32 1
  %90 = load i32, i32* %arrayidx27.1.4, align 4, !tbaa !6
  %call31.1.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %90, i32 32)
  %arrayidx27.2.4 = getelementptr inbounds i32, i32* %88, i32 2
  %91 = load i32, i32* %arrayidx27.2.4, align 4, !tbaa !6
  %call31.2.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %91, i32 32)
  %arrayidx27.3.4 = getelementptr inbounds i32, i32* %88, i32 3
  %92 = load i32, i32* %arrayidx27.3.4, align 4, !tbaa !6
  %call31.3.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %92, i32 32)
  %arrayidx27.4.4 = getelementptr inbounds i32, i32* %88, i32 4
  %93 = load i32, i32* %arrayidx27.4.4, align 4, !tbaa !6
  %call31.4.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %93, i32 10)
  %puts104 = tail call i32 @puts(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @str.5, i32 0, i32 0))
  %.pre.i = load i32*, i32** %0, align 4, !tbaa !2
  store i32 1, i32* %.pre.i, align 4, !tbaa !6
  %arrayidx6.us.us.i.1 = getelementptr inbounds i32, i32* %.pre.i, i32 1
  store i32 1, i32* %arrayidx6.us.us.i.1, align 4, !tbaa !6
  %arrayidx6.us.us.i.2 = getelementptr inbounds i32, i32* %.pre.i, i32 2
  store i32 1, i32* %arrayidx6.us.us.i.2, align 4, !tbaa !6
  %arrayidx6.us.us.i.3 = getelementptr inbounds i32, i32* %.pre.i, i32 3
  store i32 1, i32* %arrayidx6.us.us.i.3, align 4, !tbaa !6
  %arrayidx6.us.us.i.4 = getelementptr inbounds i32, i32* %.pre.i, i32 4
  store i32 1, i32* %arrayidx6.us.us.i.4, align 4, !tbaa !6
  %94 = load i32*, i32** %2, align 4, !tbaa !2
  store i32 1, i32* %94, align 4, !tbaa !6
  %arrayidx8.us41.i.1.1 = getelementptr inbounds i32, i32* %.pre.i, i32 1
  %95 = load i32, i32* %arrayidx8.us41.i.1.1, align 4, !tbaa !6
  %add.us44.i.1.1 = add nsw i32 %95, 1
  %arrayidx13.us45.i.1.1 = getelementptr inbounds i32, i32* %94, i32 1
  store i32 %add.us44.i.1.1, i32* %arrayidx13.us45.i.1.1, align 4, !tbaa !6
  %arrayidx8.us41.i.2.1 = getelementptr inbounds i32, i32* %.pre.i, i32 2
  %96 = load i32, i32* %arrayidx8.us41.i.2.1, align 4, !tbaa !6
  %add.us44.i.2.1 = add nsw i32 %add.us44.i.1.1, %96
  %arrayidx13.us45.i.2.1 = getelementptr inbounds i32, i32* %94, i32 2
  store i32 %add.us44.i.2.1, i32* %arrayidx13.us45.i.2.1, align 4, !tbaa !6
  %arrayidx8.us41.i.3.1 = getelementptr inbounds i32, i32* %.pre.i, i32 3
  %97 = load i32, i32* %arrayidx8.us41.i.3.1, align 4, !tbaa !6
  %add.us44.i.3.1 = add nsw i32 %add.us44.i.2.1, %97
  %arrayidx13.us45.i.3.1 = getelementptr inbounds i32, i32* %94, i32 3
  store i32 %add.us44.i.3.1, i32* %arrayidx13.us45.i.3.1, align 4, !tbaa !6
  %arrayidx8.us41.i.4.1 = getelementptr inbounds i32, i32* %.pre.i, i32 4
  %98 = load i32, i32* %arrayidx8.us41.i.4.1, align 4, !tbaa !6
  %add.us44.i.4.1 = add nsw i32 %add.us44.i.3.1, %98
  %arrayidx13.us45.i.4.1 = getelementptr inbounds i32, i32* %94, i32 4
  store i32 %add.us44.i.4.1, i32* %arrayidx13.us45.i.4.1, align 4, !tbaa !6
  %99 = load i32*, i32** %4, align 4, !tbaa !2
  store i32 1, i32* %99, align 4, !tbaa !6
  %arrayidx8.us41.i.1.2 = getelementptr inbounds i32, i32* %94, i32 1
  %100 = load i32, i32* %arrayidx8.us41.i.1.2, align 4, !tbaa !6
  %add.us44.i.1.2 = add nsw i32 %100, 1
  %arrayidx13.us45.i.1.2 = getelementptr inbounds i32, i32* %99, i32 1
  store i32 %add.us44.i.1.2, i32* %arrayidx13.us45.i.1.2, align 4, !tbaa !6
  %arrayidx8.us41.i.2.2 = getelementptr inbounds i32, i32* %94, i32 2
  %101 = load i32, i32* %arrayidx8.us41.i.2.2, align 4, !tbaa !6
  %add.us44.i.2.2 = add nsw i32 %add.us44.i.1.2, %101
  %arrayidx13.us45.i.2.2 = getelementptr inbounds i32, i32* %99, i32 2
  store i32 %add.us44.i.2.2, i32* %arrayidx13.us45.i.2.2, align 4, !tbaa !6
  %arrayidx8.us41.i.3.2 = getelementptr inbounds i32, i32* %94, i32 3
  %102 = load i32, i32* %arrayidx8.us41.i.3.2, align 4, !tbaa !6
  %add.us44.i.3.2 = add nsw i32 %add.us44.i.2.2, %102
  %arrayidx13.us45.i.3.2 = getelementptr inbounds i32, i32* %99, i32 3
  store i32 %add.us44.i.3.2, i32* %arrayidx13.us45.i.3.2, align 4, !tbaa !6
  %arrayidx8.us41.i.4.2 = getelementptr inbounds i32, i32* %94, i32 4
  %103 = load i32, i32* %arrayidx8.us41.i.4.2, align 4, !tbaa !6
  %add.us44.i.4.2 = add nsw i32 %add.us44.i.3.2, %103
  %arrayidx13.us45.i.4.2 = getelementptr inbounds i32, i32* %99, i32 4
  store i32 %add.us44.i.4.2, i32* %arrayidx13.us45.i.4.2, align 4, !tbaa !6
  %104 = load i32*, i32** %6, align 4, !tbaa !2
  store i32 1, i32* %104, align 4, !tbaa !6
  %arrayidx8.us41.i.1.3 = getelementptr inbounds i32, i32* %99, i32 1
  %105 = load i32, i32* %arrayidx8.us41.i.1.3, align 4, !tbaa !6
  %add.us44.i.1.3 = add nsw i32 %105, 1
  %arrayidx13.us45.i.1.3 = getelementptr inbounds i32, i32* %104, i32 1
  store i32 %add.us44.i.1.3, i32* %arrayidx13.us45.i.1.3, align 4, !tbaa !6
  %arrayidx8.us41.i.2.3 = getelementptr inbounds i32, i32* %99, i32 2
  %106 = load i32, i32* %arrayidx8.us41.i.2.3, align 4, !tbaa !6
  %add.us44.i.2.3 = add nsw i32 %add.us44.i.1.3, %106
  %arrayidx13.us45.i.2.3 = getelementptr inbounds i32, i32* %104, i32 2
  store i32 %add.us44.i.2.3, i32* %arrayidx13.us45.i.2.3, align 4, !tbaa !6
  %arrayidx8.us41.i.3.3 = getelementptr inbounds i32, i32* %99, i32 3
  %107 = load i32, i32* %arrayidx8.us41.i.3.3, align 4, !tbaa !6
  %add.us44.i.3.3 = add nsw i32 %add.us44.i.2.3, %107
  %arrayidx13.us45.i.3.3 = getelementptr inbounds i32, i32* %104, i32 3
  store i32 %add.us44.i.3.3, i32* %arrayidx13.us45.i.3.3, align 4, !tbaa !6
  %arrayidx8.us41.i.4.3 = getelementptr inbounds i32, i32* %99, i32 4
  %108 = load i32, i32* %arrayidx8.us41.i.4.3, align 4, !tbaa !6
  %add.us44.i.4.3 = add nsw i32 %add.us44.i.3.3, %108
  %arrayidx13.us45.i.4.3 = getelementptr inbounds i32, i32* %104, i32 4
  store i32 %add.us44.i.4.3, i32* %arrayidx13.us45.i.4.3, align 4, !tbaa !6
  %109 = load i32*, i32** %8, align 4, !tbaa !2
  store i32 1, i32* %109, align 4, !tbaa !6
  %arrayidx8.us41.i.1.4 = getelementptr inbounds i32, i32* %104, i32 1
  %110 = load i32, i32* %arrayidx8.us41.i.1.4, align 4, !tbaa !6
  %add.us44.i.1.4 = add nsw i32 %110, 1
  %arrayidx13.us45.i.1.4 = getelementptr inbounds i32, i32* %109, i32 1
  store i32 %add.us44.i.1.4, i32* %arrayidx13.us45.i.1.4, align 4, !tbaa !6
  %arrayidx8.us41.i.2.4 = getelementptr inbounds i32, i32* %104, i32 2
  %111 = load i32, i32* %arrayidx8.us41.i.2.4, align 4, !tbaa !6
  %add.us44.i.2.4 = add nsw i32 %add.us44.i.1.4, %111
  %arrayidx13.us45.i.2.4 = getelementptr inbounds i32, i32* %109, i32 2
  store i32 %add.us44.i.2.4, i32* %arrayidx13.us45.i.2.4, align 4, !tbaa !6
  %arrayidx8.us41.i.3.4 = getelementptr inbounds i32, i32* %104, i32 3
  %112 = load i32, i32* %arrayidx8.us41.i.3.4, align 4, !tbaa !6
  %add.us44.i.3.4 = add nsw i32 %add.us44.i.2.4, %112
  %arrayidx13.us45.i.3.4 = getelementptr inbounds i32, i32* %109, i32 3
  store i32 %add.us44.i.3.4, i32* %arrayidx13.us45.i.3.4, align 4, !tbaa !6
  %arrayidx8.us41.i.4.4 = getelementptr inbounds i32, i32* %104, i32 4
  %113 = load i32, i32* %arrayidx8.us41.i.4.4, align 4, !tbaa !6
  %add.us44.i.4.4 = add nsw i32 %add.us44.i.3.4, %113
  %arrayidx13.us45.i.4.4 = getelementptr inbounds i32, i32* %109, i32 4
  store i32 %add.us44.i.4.4, i32* %arrayidx13.us45.i.4.4, align 4, !tbaa !6
  %.pre231.pre = load i32, i32* %.pre.i, align 4, !tbaa !6
  %call50 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %.pre231.pre, i32 32)
  %arrayidx46.1 = getelementptr inbounds i32, i32* %.pre.i, i32 1
  %114 = load i32, i32* %arrayidx46.1, align 4, !tbaa !6
  %call50.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %114, i32 32)
  %arrayidx46.2 = getelementptr inbounds i32, i32* %.pre.i, i32 2
  %115 = load i32, i32* %arrayidx46.2, align 4, !tbaa !6
  %call50.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %115, i32 32)
  %arrayidx46.3 = getelementptr inbounds i32, i32* %.pre.i, i32 3
  %116 = load i32, i32* %arrayidx46.3, align 4, !tbaa !6
  %call50.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %116, i32 32)
  %arrayidx46.4 = getelementptr inbounds i32, i32* %.pre.i, i32 4
  %117 = load i32, i32* %arrayidx46.4, align 4, !tbaa !6
  %call50.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %117, i32 10)
  %118 = load i32*, i32** %2, align 4, !tbaa !2
  %119 = load i32, i32* %118, align 4, !tbaa !6
  %call50.1131 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %119, i32 32)
  %arrayidx46.1.1 = getelementptr inbounds i32, i32* %118, i32 1
  %120 = load i32, i32* %arrayidx46.1.1, align 4, !tbaa !6
  %call50.1.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %120, i32 32)
  %arrayidx46.2.1 = getelementptr inbounds i32, i32* %118, i32 2
  %121 = load i32, i32* %arrayidx46.2.1, align 4, !tbaa !6
  %call50.2.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %121, i32 32)
  %arrayidx46.3.1 = getelementptr inbounds i32, i32* %118, i32 3
  %122 = load i32, i32* %arrayidx46.3.1, align 4, !tbaa !6
  %call50.3.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %122, i32 32)
  %arrayidx46.4.1 = getelementptr inbounds i32, i32* %118, i32 4
  %123 = load i32, i32* %arrayidx46.4.1, align 4, !tbaa !6
  %call50.4.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %123, i32 10)
  %124 = load i32*, i32** %4, align 4, !tbaa !2
  %125 = load i32, i32* %124, align 4, !tbaa !6
  %call50.2132 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %125, i32 32)
  %arrayidx46.1.2 = getelementptr inbounds i32, i32* %124, i32 1
  %126 = load i32, i32* %arrayidx46.1.2, align 4, !tbaa !6
  %call50.1.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %126, i32 32)
  %arrayidx46.2.2 = getelementptr inbounds i32, i32* %124, i32 2
  %127 = load i32, i32* %arrayidx46.2.2, align 4, !tbaa !6
  %call50.2.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %127, i32 32)
  %arrayidx46.3.2 = getelementptr inbounds i32, i32* %124, i32 3
  %128 = load i32, i32* %arrayidx46.3.2, align 4, !tbaa !6
  %call50.3.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %128, i32 32)
  %arrayidx46.4.2 = getelementptr inbounds i32, i32* %124, i32 4
  %129 = load i32, i32* %arrayidx46.4.2, align 4, !tbaa !6
  %call50.4.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %129, i32 10)
  %130 = load i32*, i32** %6, align 4, !tbaa !2
  %131 = load i32, i32* %130, align 4, !tbaa !6
  %call50.3133 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %131, i32 32)
  %arrayidx46.1.3 = getelementptr inbounds i32, i32* %130, i32 1
  %132 = load i32, i32* %arrayidx46.1.3, align 4, !tbaa !6
  %call50.1.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %132, i32 32)
  %arrayidx46.2.3 = getelementptr inbounds i32, i32* %130, i32 2
  %133 = load i32, i32* %arrayidx46.2.3, align 4, !tbaa !6
  %call50.2.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %133, i32 32)
  %arrayidx46.3.3 = getelementptr inbounds i32, i32* %130, i32 3
  %134 = load i32, i32* %arrayidx46.3.3, align 4, !tbaa !6
  %call50.3.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %134, i32 32)
  %arrayidx46.4.3 = getelementptr inbounds i32, i32* %130, i32 4
  %135 = load i32, i32* %arrayidx46.4.3, align 4, !tbaa !6
  %call50.4.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %135, i32 10)
  %136 = load i32*, i32** %8, align 4, !tbaa !2
  %137 = load i32, i32* %136, align 4, !tbaa !6
  %call50.4134 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %137, i32 32)
  %arrayidx46.1.4 = getelementptr inbounds i32, i32* %136, i32 1
  %138 = load i32, i32* %arrayidx46.1.4, align 4, !tbaa !6
  %call50.1.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %138, i32 32)
  %arrayidx46.2.4 = getelementptr inbounds i32, i32* %136, i32 2
  %139 = load i32, i32* %arrayidx46.2.4, align 4, !tbaa !6
  %call50.2.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %139, i32 32)
  %arrayidx46.3.4 = getelementptr inbounds i32, i32* %136, i32 3
  %140 = load i32, i32* %arrayidx46.3.4, align 4, !tbaa !6
  %call50.3.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %140, i32 32)
  %arrayidx46.4.4 = getelementptr inbounds i32, i32* %136, i32 4
  %141 = load i32, i32* %arrayidx46.4.4, align 4, !tbaa !6
  %call50.4.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %141, i32 10)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i32, i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #3

attributes #0 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
