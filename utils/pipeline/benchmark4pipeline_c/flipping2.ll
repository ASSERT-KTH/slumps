; ModuleID = 'flipping_bits_game.opt2.bc'
source_filename = "benchmark4pipeline_c/flipping_bits_game.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@i = dso_local hidden local_unnamed_addr global i32 0, align 4
@j = dso_local hidden local_unnamed_addr global i32 0, align 4
@.str.1 = private dso_local unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.3 = private dso_local unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.6 = private dso_local unnamed_addr constant [15 x i8] c"What to flip: \00", align 1
@.str.7 = private dso_local unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.8 = private dso_local unnamed_addr constant [36 x i8] c"Please specify r or c and an number\00", align 1
@.str.9 = private dso_local unnamed_addr constant [17 x i8] c"Moves Taken: %d\0A\00", align 1
@str = private dso_local unnamed_addr constant [9 x i8] c"Target: \00", align 1
@str.11 = private dso_local unnamed_addr constant [8 x i8] c"Board: \00", align 1
@str.12 = private dso_local unnamed_addr constant [9 x i8] c"You win!\00", align 1

; Function Attrs: norecurse nounwind
define dso_local hidden void @fliprow(i32** nocapture readonly %b, i32 %sz, i32 %n) local_unnamed_addr #0 {
entry:
  store i32 0, i32* @i, align 4, !tbaa !2
  %cmp7 = icmp sgt i32 %sz, 0
  br i1 %cmp7, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %add = add nsw i32 %n, 1
  %arrayidx = getelementptr inbounds i32*, i32** %b, i32 %add
  %0 = load i32*, i32** %arrayidx, align 4, !tbaa !6
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %storemerge8 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx1 = getelementptr inbounds i32, i32* %0, i32 %storemerge8
  %1 = load i32, i32* %arrayidx1, align 4, !tbaa !2
  %tobool = icmp eq i32 %1, 0
  %lnot.ext = zext i1 %tobool to i32
  store i32 %lnot.ext, i32* %arrayidx1, align 4, !tbaa !2
  %2 = load i32, i32* @i, align 4, !tbaa !2
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @i, align 4, !tbaa !2
  %cmp = icmp slt i32 %inc, %sz
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: norecurse nounwind
define dso_local hidden void @flipcol(i32** nocapture readonly %b, i32 %sz, i32 %n) local_unnamed_addr #0 {
entry:
  store i32 1, i32* @i, align 4, !tbaa !2
  %cmp6 = icmp slt i32 %sz, 1
  br i1 %cmp6, label %for.end, label %for.body

for.body:                                         ; preds = %for.body, %entry
  %storemerge7 = phi i32 [ %inc, %for.body ], [ 1, %entry ]
  %arrayidx = getelementptr inbounds i32*, i32** %b, i32 %storemerge7
  %0 = load i32*, i32** %arrayidx, align 4, !tbaa !6
  %arrayidx1 = getelementptr inbounds i32, i32* %0, i32 %n
  %1 = load i32, i32* %arrayidx1, align 4, !tbaa !2
  %tobool = icmp eq i32 %1, 0
  %lnot.ext = zext i1 %tobool to i32
  store i32 %lnot.ext, i32* %arrayidx1, align 4, !tbaa !2
  %2 = load i32, i32* @i, align 4, !tbaa !2
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @i, align 4, !tbaa !2
  %cmp = icmp slt i32 %2, %sz
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind
define dso_local hidden void @initt(i32** nocapture readonly %t, i32 %sz) local_unnamed_addr #1 {
entry:
  store i32 1, i32* @i, align 4, !tbaa !2
  %cmp11 = icmp slt i32 %sz, 1
  br i1 %cmp11, label %for.end7, label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc5_crit_edge.us, %entry
  store i32 0, i32* @j, align 4, !tbaa !2
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %call.us = tail call i32 @rand() #5
  %rem.us = srem i32 %call.us, 2
  %0 = load i32, i32* @i, align 4, !tbaa !2
  %arrayidx.us = getelementptr inbounds i32*, i32** %t, i32 %0
  %1 = load i32*, i32** %arrayidx.us, align 4, !tbaa !6
  %2 = load i32, i32* @j, align 4, !tbaa !2
  %arrayidx4.us = getelementptr inbounds i32, i32* %1, i32 %2
  store i32 %rem.us, i32* %arrayidx4.us, align 4, !tbaa !2
  %3 = load i32, i32* @j, align 4, !tbaa !2
  %inc.us = add nsw i32 %3, 1
  store i32 %inc.us, i32* @j, align 4, !tbaa !2
  %cmp2.us = icmp slt i32 %inc.us, %sz
  br i1 %cmp2.us, label %for.body3.us, label %for.cond1.for.inc5_crit_edge.us

for.cond1.for.inc5_crit_edge.us:                  ; preds = %for.body3.us
  %4 = load i32, i32* @i, align 4, !tbaa !2
  %inc6.us = add nsw i32 %4, 1
  store i32 %inc6.us, i32* @i, align 4, !tbaa !2
  %cmp.us = icmp slt i32 %4, %sz
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end7

for.end7:                                         ; preds = %for.cond1.for.inc5_crit_edge.us, %entry
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local hidden void @initb(i32** nocapture readonly %t, i32** nocapture readonly %b, i32 %sz) local_unnamed_addr #1 {
entry:
  store i32 1, i32* @i, align 4, !tbaa !2
  %cmp47 = icmp slt i32 %sz, 1
  br i1 %cmp47, label %for.cond10.preheader.thread, label %for.cond1.preheader.us

for.cond10.preheader.thread:                      ; preds = %entry
  store i32 1, i32* @i, align 4, !tbaa !2
  br label %for.cond16.preheader.thread

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %entry
  %0 = phi i32 [ %inc8.us, %for.cond1.for.inc7_crit_edge.us ], [ 1, %entry ]
  store i32 0, i32* @j, align 4, !tbaa !2
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %1 = phi i32 [ %0, %for.cond1.preheader.us ], [ %6, %for.body3.us ]
  %storemerge3546.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %inc.us, %for.body3.us ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %t, i32 %1
  %2 = load i32*, i32** %arrayidx.us, align 4, !tbaa !6
  %arrayidx4.us = getelementptr inbounds i32, i32* %2, i32 %storemerge3546.us
  %3 = load i32, i32* %arrayidx4.us, align 4, !tbaa !2
  %arrayidx5.us = getelementptr inbounds i32*, i32** %b, i32 %1
  %4 = load i32*, i32** %arrayidx5.us, align 4, !tbaa !6
  %arrayidx6.us = getelementptr inbounds i32, i32* %4, i32 %storemerge3546.us
  store i32 %3, i32* %arrayidx6.us, align 4, !tbaa !2
  %5 = load i32, i32* @j, align 4, !tbaa !2
  %inc.us = add nsw i32 %5, 1
  store i32 %inc.us, i32* @j, align 4, !tbaa !2
  %cmp2.us = icmp slt i32 %inc.us, %sz
  %6 = load i32, i32* @i, align 4, !tbaa !2
  br i1 %cmp2.us, label %for.body3.us, label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %inc8.us = add nsw i32 %6, 1
  store i32 %inc8.us, i32* @i, align 4, !tbaa !2
  %cmp.us = icmp slt i32 %6, %sz
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge.us
  store i32 1, i32* @i, align 4, !tbaa !2
  br i1 %cmp47, label %for.cond16.preheader.thread, label %for.body12.us

for.body12.us:                                    ; preds = %for.cond10.preheader
  %call.us = tail call i32 @rand() #5
  store i32 0, i32* @i, align 4, !tbaa !2
  %rem.us = srem i32 %call.us, %sz
  %add.i.us = add nsw i32 %rem.us, 2
  %arrayidx.i.us = getelementptr inbounds i32*, i32** %b, i32 %add.i.us
  %7 = load i32*, i32** %arrayidx.i.us, align 4, !tbaa !6
  br label %for.body.i.us

for.body.i.us:                                    ; preds = %for.body.i.us, %for.body12.us
  %storemerge8.i.us = phi i32 [ 0, %for.body12.us ], [ %inc.i.us, %for.body.i.us ]
  %arrayidx1.i.us = getelementptr inbounds i32, i32* %7, i32 %storemerge8.i.us
  %8 = load i32, i32* %arrayidx1.i.us, align 4, !tbaa !2
  %tobool.i.us = icmp eq i32 %8, 0
  %lnot.ext.i.us = zext i1 %tobool.i.us to i32
  store i32 %lnot.ext.i.us, i32* %arrayidx1.i.us, align 4, !tbaa !2
  %9 = load i32, i32* @i, align 4, !tbaa !2
  %inc.i.us = add nsw i32 %9, 1
  store i32 %inc.i.us, i32* @i, align 4, !tbaa !2
  %cmp.i.us = icmp slt i32 %inc.i.us, %sz
  br i1 %cmp.i.us, label %for.body.i.us, label %for.cond16.preheader

for.cond16.preheader.thread:                      ; preds = %for.cond10.preheader, %for.cond10.preheader.thread
  store i32 0, i32* @i, align 4, !tbaa !2
  br label %for.end23

for.cond16.preheader:                             ; preds = %for.body.i.us
  store i32 0, i32* @i, align 4, !tbaa !2
  %cmp1743 = icmp sgt i32 %sz, 0
  br i1 %cmp1743, label %for.body18, label %for.end23

for.body18:                                       ; preds = %flipcol.exit, %for.cond16.preheader
  %call19 = tail call i32 @rand() #5
  %rem20 = srem i32 %call19, %sz
  store i32 1, i32* @i, align 4, !tbaa !2
  br label %for.body.i42

for.body.i42:                                     ; preds = %for.body.i42, %for.body18
  %storemerge7.i = phi i32 [ %inc.i40, %for.body.i42 ], [ 1, %for.body18 ]
  %arrayidx.i36 = getelementptr inbounds i32*, i32** %b, i32 %storemerge7.i
  %10 = load i32*, i32** %arrayidx.i36, align 4, !tbaa !6
  %arrayidx1.i37 = getelementptr inbounds i32, i32* %10, i32 %rem20
  %11 = load i32, i32* %arrayidx1.i37, align 4, !tbaa !2
  %tobool.i38 = icmp eq i32 %11, 0
  %lnot.ext.i39 = zext i1 %tobool.i38 to i32
  store i32 %lnot.ext.i39, i32* %arrayidx1.i37, align 4, !tbaa !2
  %12 = load i32, i32* @i, align 4, !tbaa !2
  %inc.i40 = add nsw i32 %12, 1
  store i32 %inc.i40, i32* @i, align 4, !tbaa !2
  %cmp.i41 = icmp slt i32 %12, %sz
  br i1 %cmp.i41, label %for.body.i42, label %flipcol.exit

flipcol.exit:                                     ; preds = %for.body.i42
  %inc22 = add nsw i32 %12, 2
  store i32 %inc22, i32* @i, align 4, !tbaa !2
  %cmp17 = icmp slt i32 %inc22, %sz
  br i1 false, label %for.body18, label %for.end23

for.end23:                                        ; preds = %flipcol.exit, %for.cond16.preheader, %for.cond16.preheader.thread
  ret void
}

; Function Attrs: nounwind
define dso_local hidden void @printb(i32** nocapture readonly %b, i32 %sz) local_unnamed_addr #1 {
entry:
  %putchar = tail call i32 @putchar(i32 32)
  store i32 0, i32* @i, align 4, !tbaa !2
  %cmp33 = icmp sgt i32 %sz, 0
  br i1 %cmp33, label %for.body, label %for.end.thread

for.end.thread:                                   ; preds = %entry
  %putchar2436 = tail call i32 @putchar(i32 10)
  store i32 1, i32* @i, align 4, !tbaa !2
  br label %for.end18

for.body:                                         ; preds = %for.body, %entry
  %storemerge34 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %storemerge34)
  %0 = load i32, i32* @i, align 4, !tbaa !2
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @i, align 4, !tbaa !2
  %cmp = icmp slt i32 %inc, %sz
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %putchar24 = tail call i32 @putchar(i32 10)
  store i32 1, i32* @i, align 4, !tbaa !2
  %cmp431 = icmp slt i32 %sz, 1
  br i1 %cmp431, label %for.end18, label %for.body5.us

for.body5.us:                                     ; preds = %for.cond7.for.end14_crit_edge.us, %for.end
  %storemerge2532.us = phi i32 [ %inc17.us, %for.cond7.for.end14_crit_edge.us ], [ 1, %for.end ]
  %sub.us = add nsw i32 %storemerge2532.us, -1
  %call6.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i32 %sub.us)
  store i32 0, i32* @j, align 4, !tbaa !2
  br label %for.body9.us

for.body9.us:                                     ; preds = %for.body9.us, %for.body5.us
  %storemerge2730.us = phi i32 [ 0, %for.body5.us ], [ %inc13.us, %for.body9.us ]
  %1 = load i32, i32* @i, align 4, !tbaa !2
  %arrayidx.us = getelementptr inbounds i32*, i32** %b, i32 %1
  %2 = load i32*, i32** %arrayidx.us, align 4, !tbaa !6
  %arrayidx10.us = getelementptr inbounds i32, i32* %2, i32 %storemerge2730.us
  %3 = load i32, i32* %arrayidx10.us, align 4, !tbaa !2
  %call11.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %3)
  %4 = load i32, i32* @j, align 4, !tbaa !2
  %inc13.us = add nsw i32 %4, 1
  store i32 %inc13.us, i32* @j, align 4, !tbaa !2
  %cmp8.us = icmp slt i32 %inc13.us, %sz
  br i1 %cmp8.us, label %for.body9.us, label %for.cond7.for.end14_crit_edge.us

for.cond7.for.end14_crit_edge.us:                 ; preds = %for.body9.us
  %putchar28.us = tail call i32 @putchar(i32 10)
  %5 = load i32, i32* @i, align 4, !tbaa !2
  %inc17.us = add nsw i32 %5, 1
  store i32 %inc17.us, i32* @i, align 4, !tbaa !2
  %cmp4.us = icmp slt i32 %5, %sz
  br i1 %cmp4.us, label %for.body5.us, label %for.end18

for.end18:                                        ; preds = %for.cond7.for.end14_crit_edge.us, %for.end, %for.end.thread
  %putchar26 = tail call i32 @putchar(i32 10)
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: norecurse nounwind
define dso_local hidden i32 @eq(i32** nocapture readonly %t, i32** nocapture readonly %b, i32 %sz) local_unnamed_addr #0 {
entry:
  store i32 1, i32* @i, align 4, !tbaa !2
  %cmp16 = icmp slt i32 %sz, 1
  br i1 %cmp16, label %return, label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc8_crit_edge.us, %entry
  %storemerge17.us = phi i32 [ %inc9.us, %for.cond1.for.inc8_crit_edge.us ], [ 1, %entry ]
  store i32 0, i32* @j, align 4, !tbaa !2
  %arrayidx.us = getelementptr inbounds i32*, i32** %b, i32 %storemerge17.us
  %0 = load i32*, i32** %arrayidx.us, align 4, !tbaa !6
  %arrayidx5.us = getelementptr inbounds i32*, i32** %t, i32 %storemerge17.us
  %1 = load i32*, i32** %arrayidx5.us, align 4, !tbaa !6
  br label %for.body3.us

for.cond1.us:                                     ; preds = %for.body3.us
  store i32 %inc.us, i32* @j, align 4, !tbaa !2
  %cmp2.us = icmp slt i32 %inc.us, %sz
  br i1 %cmp2.us, label %for.body3.us, label %for.cond1.for.inc8_crit_edge.us

for.body3.us:                                     ; preds = %for.cond1.us, %for.cond1.preheader.us
  %storemerge1215.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %inc.us, %for.cond1.us ]
  %arrayidx4.us = getelementptr inbounds i32, i32* %0, i32 %storemerge1215.us
  %2 = load i32, i32* %arrayidx4.us, align 4, !tbaa !2
  %arrayidx6.us = getelementptr inbounds i32, i32* %1, i32 %storemerge1215.us
  %3 = load i32, i32* %arrayidx6.us, align 4, !tbaa !2
  %cmp7.us = icmp eq i32 %2, %3
  %inc.us = add nuw nsw i32 %storemerge1215.us, 1
  br i1 %cmp7.us, label %for.cond1.us, label %return

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.cond1.us
  %inc9.us = add nuw nsw i32 %storemerge17.us, 1
  store i32 %inc9.us, i32* @i, align 4, !tbaa !2
  %cmp.us = icmp slt i32 %storemerge17.us, %sz
  br i1 %cmp.us, label %for.cond1.preheader.us, label %return

return:                                           ; preds = %for.cond1.for.inc8_crit_edge.us, %for.body3.us, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %for.body3.us ], [ 1, %for.cond1.for.inc8_crit_edge.us ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define dso_local hidden void @main() local_unnamed_addr #1 {
entry:
  %roc = alloca i8, align 1
  %n = alloca i32, align 4
  %call = tail call noalias i8* @malloc(i32 15) #5
  %0 = bitcast i8* %call to i32**
  %call2 = tail call noalias i8* @malloc(i32 12) #5
  %arrayidx = getelementptr inbounds i8, i8* %call, i32 4
  %1 = bitcast i8* %arrayidx to i8**
  store i8* %call2, i8** %1, align 4, !tbaa !6
  %call2.1 = tail call noalias i8* @malloc(i32 12) #5
  %arrayidx.1 = getelementptr inbounds i8, i8* %call, i32 8
  %2 = bitcast i8* %arrayidx.1 to i8**
  store i8* %call2.1, i8** %2, align 4, !tbaa !6
  %call2.2 = tail call noalias i8* @malloc(i32 12) #5
  %arrayidx.2 = getelementptr inbounds i8, i8* %call, i32 12
  %3 = bitcast i8* %arrayidx.2 to i8**
  store i8* %call2.2, i8** %3, align 4, !tbaa !6
  %call4 = tail call noalias i8* @malloc(i32 15) #5
  %4 = bitcast i8* %call4 to i32**
  %call9 = tail call noalias i8* @malloc(i32 12) #5
  %arrayidx10 = getelementptr inbounds i8, i8* %call4, i32 4
  %5 = bitcast i8* %arrayidx10 to i8**
  store i8* %call9, i8** %5, align 4, !tbaa !6
  %call9.1 = tail call noalias i8* @malloc(i32 12) #5
  %arrayidx10.1 = getelementptr inbounds i8, i8* %call4, i32 8
  %6 = bitcast i8* %arrayidx10.1 to i8**
  store i8* %call9.1, i8** %6, align 4, !tbaa !6
  %call9.2 = tail call noalias i8* @malloc(i32 12) #5
  %arrayidx10.2 = getelementptr inbounds i8, i8* %call4, i32 12
  %7 = bitcast i8* %arrayidx10.2 to i8**
  store i8* %call9.2, i8** %7, align 4, !tbaa !6
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %roc) #5
  %8 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #5
  store i32 1, i32* @i, align 4, !tbaa !2
  %9 = bitcast i8* %call9 to i32*
  %10 = bitcast i8* %call2 to i32*
  %11 = bitcast i8* %call9.1 to i32*
  %12 = bitcast i8* %call2.1 to i32*
  %13 = bitcast i8* %call9.2 to i32*
  %14 = bitcast i8* %call2.2 to i32*
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc5_crit_edge.us.i, %entry
  store i32 0, i32* @j, align 4, !tbaa !2
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.body3.us.i, %for.cond1.preheader.us.i
  %call.us.i = tail call i32 @rand() #5
  %rem.us.i = srem i32 %call.us.i, 2
  %15 = load i32, i32* @i, align 4, !tbaa !2
  %arrayidx.us.i = getelementptr inbounds i32*, i32** %0, i32 %15
  %16 = load i32*, i32** %arrayidx.us.i, align 4, !tbaa !6
  %17 = load i32, i32* @j, align 4, !tbaa !2
  %arrayidx4.us.i = getelementptr inbounds i32, i32* %16, i32 %17
  store i32 %rem.us.i, i32* %arrayidx4.us.i, align 4, !tbaa !2
  %18 = load i32, i32* @j, align 4, !tbaa !2
  %inc.us.i = add nsw i32 %18, 1
  store i32 %inc.us.i, i32* @j, align 4, !tbaa !2
  %cmp2.us.i = icmp slt i32 %inc.us.i, 3
  br i1 %cmp2.us.i, label %for.body3.us.i, label %for.cond1.for.inc5_crit_edge.us.i

for.cond1.for.inc5_crit_edge.us.i:                ; preds = %for.body3.us.i
  %19 = load i32, i32* @i, align 4, !tbaa !2
  %inc6.us.i = add nsw i32 %19, 1
  store i32 %inc6.us.i, i32* @i, align 4, !tbaa !2
  %cmp.us.i = icmp slt i32 %19, 3
  br i1 %cmp.us.i, label %for.cond1.preheader.us.i, label %initt.exit

initt.exit:                                       ; preds = %for.cond1.for.inc5_crit_edge.us.i
  tail call void @initb(i32** nonnull %0, i32** %4, i32 3)
  %arrayidx4.us.i68.1 = getelementptr inbounds i8, i8* %call9, i32 4
  %20 = bitcast i8* %arrayidx4.us.i68.1 to i32*
  %arrayidx6.us.i.1 = getelementptr inbounds i8, i8* %call2, i32 4
  %21 = bitcast i8* %arrayidx6.us.i.1 to i32*
  %arrayidx4.us.i68.2 = getelementptr inbounds i8, i8* %call9, i32 8
  %22 = bitcast i8* %arrayidx4.us.i68.2 to i32*
  %arrayidx6.us.i.2 = getelementptr inbounds i8, i8* %call2, i32 8
  %23 = bitcast i8* %arrayidx6.us.i.2 to i32*
  %arrayidx4.us.i68.1.1 = getelementptr inbounds i8, i8* %call9.1, i32 4
  %24 = bitcast i8* %arrayidx4.us.i68.1.1 to i32*
  %arrayidx6.us.i.1.1 = getelementptr inbounds i8, i8* %call2.1, i32 4
  %25 = bitcast i8* %arrayidx6.us.i.1.1 to i32*
  %arrayidx4.us.i68.2.1 = getelementptr inbounds i8, i8* %call9.1, i32 8
  %26 = bitcast i8* %arrayidx4.us.i68.2.1 to i32*
  %arrayidx6.us.i.2.1 = getelementptr inbounds i8, i8* %call2.1, i32 8
  %27 = bitcast i8* %arrayidx6.us.i.2.1 to i32*
  %arrayidx4.us.i68.1.2 = getelementptr inbounds i8, i8* %call9.2, i32 4
  %28 = bitcast i8* %arrayidx4.us.i68.1.2 to i32*
  %arrayidx6.us.i.1.2 = getelementptr inbounds i8, i8* %call2.2, i32 4
  %29 = bitcast i8* %arrayidx6.us.i.1.2 to i32*
  %arrayidx4.us.i68.2.2 = getelementptr inbounds i8, i8* %call9.2, i32 8
  %30 = bitcast i8* %arrayidx4.us.i68.2.2 to i32*
  %arrayidx6.us.i.2.2 = getelementptr inbounds i8, i8* %call2.2, i32 8
  %31 = bitcast i8* %arrayidx6.us.i.2.2 to i32*
  store i32 1, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %32 = load i32, i32* %9, align 4, !tbaa !2
  %33 = load i32, i32* %10, align 4, !tbaa !2
  %cmp7.us.i120 = icmp eq i32 %32, %33
  br i1 %cmp7.us.i120, label %for.cond1.us.i, label %while.body17.preheader

for.cond1.us.i:                                   ; preds = %for.cond1.us.i.2.2, %initt.exit
  store i32 1, i32* @j, align 4, !tbaa !2
  %34 = load i32, i32* %20, align 4, !tbaa !2
  %35 = load i32, i32* %21, align 4, !tbaa !2
  %cmp7.us.i.1 = icmp eq i32 %34, %35
  br i1 %cmp7.us.i.1, label %for.cond1.us.i.1, label %while.body17.preheader

while.body17.preheader:                           ; preds = %for.cond1.us.i.2.2, %for.cond1.us.i.1.2, %for.cond1.us.i.2111, %for.cond1.us.i.2.1, %for.cond1.us.i.1.1, %for.cond1.us.i.1109, %for.cond1.us.i.2, %for.cond1.us.i.1, %for.cond1.us.i, %initt.exit
  %arrayidx4.us.i79.1 = getelementptr inbounds i8, i8* %call9, i32 4
  %36 = bitcast i8* %arrayidx4.us.i79.1 to i32*
  %arrayidx6.us.i80.1 = getelementptr inbounds i8, i8* %call2, i32 4
  %37 = bitcast i8* %arrayidx6.us.i80.1 to i32*
  %arrayidx4.us.i79.2 = getelementptr inbounds i8, i8* %call9, i32 8
  %38 = bitcast i8* %arrayidx4.us.i79.2 to i32*
  %arrayidx6.us.i80.2 = getelementptr inbounds i8, i8* %call2, i32 8
  %39 = bitcast i8* %arrayidx6.us.i80.2 to i32*
  %arrayidx4.us.i79.1.1 = getelementptr inbounds i8, i8* %call9.1, i32 4
  %40 = bitcast i8* %arrayidx4.us.i79.1.1 to i32*
  %arrayidx6.us.i80.1.1 = getelementptr inbounds i8, i8* %call2.1, i32 4
  %41 = bitcast i8* %arrayidx6.us.i80.1.1 to i32*
  %arrayidx4.us.i79.2.1 = getelementptr inbounds i8, i8* %call9.1, i32 8
  %42 = bitcast i8* %arrayidx4.us.i79.2.1 to i32*
  %arrayidx6.us.i80.2.1 = getelementptr inbounds i8, i8* %call2.1, i32 8
  %43 = bitcast i8* %arrayidx6.us.i80.2.1 to i32*
  %arrayidx4.us.i79.1.2 = getelementptr inbounds i8, i8* %call9.2, i32 4
  %44 = bitcast i8* %arrayidx4.us.i79.1.2 to i32*
  %arrayidx6.us.i80.1.2 = getelementptr inbounds i8, i8* %call2.2, i32 4
  %45 = bitcast i8* %arrayidx6.us.i80.1.2 to i32*
  %arrayidx4.us.i79.2.2 = getelementptr inbounds i8, i8* %call9.2, i32 8
  %46 = bitcast i8* %arrayidx4.us.i79.2.2 to i32*
  %arrayidx6.us.i80.2.2 = getelementptr inbounds i8, i8* %call2.2, i32 8
  %47 = bitcast i8* %arrayidx6.us.i80.2.2 to i32*
  br label %while.body17

while.body17:                                     ; preds = %while.body17.backedge, %while.body17.preheader
  %mov.099 = phi i32 [ 0, %while.body17.preheader ], [ %inc24, %while.body17.backedge ]
  %puts = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str, i32 0, i32 0))
  call void @printb(i32** %0, i32 3)
  %puts63 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.11, i32 0, i32 0))
  call void @printb(i32** %4, i32 3)
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0))
  %call21 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i8* nonnull %roc) #5
  %call22 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %n) #5
  %48 = load i8, i8* %roc, align 1, !tbaa !8
  %conv = sext i8 %48 to i32
  switch i32 %conv, label %sw.default [
    i32 114, label %sw.bb
    i32 99, label %sw.bb23
  ]

sw.bb:                                            ; preds = %while.body17
  %49 = load i32, i32* %n, align 4, !tbaa !2
  store i32 0, i32* @i, align 4, !tbaa !2
  %add.i = add nsw i32 %49, 1
  %arrayidx.i89 = getelementptr inbounds i32*, i32** %4, i32 %add.i
  %50 = load i32*, i32** %arrayidx.i89, align 4, !tbaa !6
  br label %for.body.i95

for.body.i95:                                     ; preds = %for.body.i95, %sw.bb
  %storemerge8.i = phi i32 [ 0, %sw.bb ], [ %inc.i93, %for.body.i95 ]
  %arrayidx1.i90 = getelementptr inbounds i32, i32* %50, i32 %storemerge8.i
  %51 = load i32, i32* %arrayidx1.i90, align 4, !tbaa !2
  %tobool.i91 = icmp eq i32 %51, 0
  %lnot.ext.i92 = zext i1 %tobool.i91 to i32
  store i32 %lnot.ext.i92, i32* %arrayidx1.i90, align 4, !tbaa !2
  %52 = load i32, i32* @i, align 4, !tbaa !2
  %inc.i93 = add nsw i32 %52, 1
  store i32 %inc.i93, i32* @i, align 4, !tbaa !2
  %cmp.i94 = icmp slt i32 %inc.i93, 3
  br i1 %cmp.i94, label %for.body.i95, label %sw.epilog

sw.bb23:                                          ; preds = %while.body17
  %53 = load i32, i32* %n, align 4, !tbaa !2
  store i32 1, i32* @i, align 4, !tbaa !2
  %arrayidx1.i114 = getelementptr inbounds i32, i32* %9, i32 %53
  %54 = load i32, i32* %arrayidx1.i114, align 4, !tbaa !2
  %tobool.i115 = icmp eq i32 %54, 0
  %lnot.ext.i116 = zext i1 %tobool.i115 to i32
  store i32 %lnot.ext.i116, i32* %arrayidx1.i114, align 4, !tbaa !2
  store i32 2, i32* @i, align 4, !tbaa !2
  br label %for.body.i.for.body.i_crit_edge

for.body.i.for.body.i_crit_edge:                  ; preds = %for.body.i.for.body.i_crit_edge, %sw.bb23
  %inc.i119 = phi i32 [ 2, %sw.bb23 ], [ %inc.i, %for.body.i.for.body.i_crit_edge ]
  %arrayidx.i.phi.trans.insert = getelementptr inbounds i32*, i32** %4, i32 %inc.i119
  %.pre = load i32*, i32** %arrayidx.i.phi.trans.insert, align 4, !tbaa !6
  %arrayidx1.i = getelementptr inbounds i32, i32* %.pre, i32 %53
  %55 = load i32, i32* %arrayidx1.i, align 4, !tbaa !2
  %tobool.i = icmp eq i32 %55, 0
  %lnot.ext.i = zext i1 %tobool.i to i32
  store i32 %lnot.ext.i, i32* %arrayidx1.i, align 4, !tbaa !2
  %56 = load i32, i32* @i, align 4, !tbaa !2
  %inc.i = add nsw i32 %56, 1
  store i32 %inc.i, i32* @i, align 4, !tbaa !2
  %cmp.i = icmp slt i32 %56, 3
  br i1 %cmp.i, label %for.body.i.for.body.i_crit_edge, label %sw.epilog

sw.default:                                       ; preds = %while.body17
  call void @perror(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i32 0, i32 0)) #6
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %for.body.i.for.body.i_crit_edge, %for.body.i95
  %inc24 = add nuw nsw i32 %mov.099, 1
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i32 0, i32 0), i32 %inc24)
  store i32 1, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %57 = load i32, i32* %9, align 4, !tbaa !2
  %58 = load i32, i32* %10, align 4, !tbaa !2
  %cmp7.us.i81 = icmp eq i32 %57, %58
  br i1 %cmp7.us.i81, label %for.cond1.us.i77, label %while.body17.backedge

while.body17.backedge:                            ; preds = %for.cond1.us.i77.1.2, %for.cond1.us.i77.2107, %for.cond1.us.i77.2.1, %for.cond1.us.i77.1.1, %for.cond1.us.i77.1105, %for.cond1.us.i77.2, %for.cond1.us.i77.1, %for.cond1.us.i77, %sw.epilog
  br label %while.body17

for.cond1.us.i77:                                 ; preds = %sw.epilog
  store i32 1, i32* @j, align 4, !tbaa !2
  %59 = load i32, i32* %36, align 4, !tbaa !2
  %60 = load i32, i32* %37, align 4, !tbaa !2
  %cmp7.us.i81.1 = icmp eq i32 %59, %60
  br i1 %cmp7.us.i81.1, label %for.cond1.us.i77.1, label %while.body17.backedge

while.end29:                                      ; preds = %for.cond1.us.i77.1.2
  store i32 3, i32* @j, align 4, !tbaa !2
  store i32 4, i32* @i, align 4, !tbaa !2
  %puts64 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.12, i32 0, i32 0))
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #5
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %roc) #5
  ret void

for.cond1.us.i77.1:                               ; preds = %for.cond1.us.i77
  store i32 2, i32* @j, align 4, !tbaa !2
  %61 = load i32, i32* %38, align 4, !tbaa !2
  %62 = load i32, i32* %39, align 4, !tbaa !2
  %cmp7.us.i81.2 = icmp eq i32 %61, %62
  br i1 %cmp7.us.i81.2, label %for.cond1.us.i77.2, label %while.body17.backedge

for.cond1.us.i77.2:                               ; preds = %for.cond1.us.i77.1
  store i32 2, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %63 = load i32, i32* %11, align 4, !tbaa !2
  %64 = load i32, i32* %12, align 4, !tbaa !2
  %cmp7.us.i81.1104 = icmp eq i32 %63, %64
  br i1 %cmp7.us.i81.1104, label %for.cond1.us.i77.1105, label %while.body17.backedge

for.cond1.us.i77.1105:                            ; preds = %for.cond1.us.i77.2
  store i32 1, i32* @j, align 4, !tbaa !2
  %65 = load i32, i32* %40, align 4, !tbaa !2
  %66 = load i32, i32* %41, align 4, !tbaa !2
  %cmp7.us.i81.1.1 = icmp eq i32 %65, %66
  br i1 %cmp7.us.i81.1.1, label %for.cond1.us.i77.1.1, label %while.body17.backedge

for.cond1.us.i77.1.1:                             ; preds = %for.cond1.us.i77.1105
  store i32 2, i32* @j, align 4, !tbaa !2
  %67 = load i32, i32* %42, align 4, !tbaa !2
  %68 = load i32, i32* %43, align 4, !tbaa !2
  %cmp7.us.i81.2.1 = icmp eq i32 %67, %68
  br i1 %cmp7.us.i81.2.1, label %for.cond1.us.i77.2.1, label %while.body17.backedge

for.cond1.us.i77.2.1:                             ; preds = %for.cond1.us.i77.1.1
  store i32 3, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %69 = load i32, i32* %13, align 4, !tbaa !2
  %70 = load i32, i32* %14, align 4, !tbaa !2
  %cmp7.us.i81.2106 = icmp eq i32 %69, %70
  br i1 %cmp7.us.i81.2106, label %for.cond1.us.i77.2107, label %while.body17.backedge

for.cond1.us.i77.2107:                            ; preds = %for.cond1.us.i77.2.1
  store i32 1, i32* @j, align 4, !tbaa !2
  %71 = load i32, i32* %44, align 4, !tbaa !2
  %72 = load i32, i32* %45, align 4, !tbaa !2
  %cmp7.us.i81.1.2 = icmp eq i32 %71, %72
  br i1 %cmp7.us.i81.1.2, label %for.cond1.us.i77.1.2, label %while.body17.backedge

for.cond1.us.i77.1.2:                             ; preds = %for.cond1.us.i77.2107
  store i32 2, i32* @j, align 4, !tbaa !2
  %73 = load i32, i32* %46, align 4, !tbaa !2
  %74 = load i32, i32* %47, align 4, !tbaa !2
  %cmp7.us.i81.2.2 = icmp eq i32 %73, %74
  br i1 %cmp7.us.i81.2.2, label %while.end29, label %while.body17.backedge

for.cond1.us.i.1:                                 ; preds = %for.cond1.us.i
  store i32 2, i32* @j, align 4, !tbaa !2
  %75 = load i32, i32* %22, align 4, !tbaa !2
  %76 = load i32, i32* %23, align 4, !tbaa !2
  %cmp7.us.i.2 = icmp eq i32 %75, %76
  br i1 %cmp7.us.i.2, label %for.cond1.us.i.2, label %while.body17.preheader

for.cond1.us.i.2:                                 ; preds = %for.cond1.us.i.1
  store i32 2, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %77 = load i32, i32* %11, align 4, !tbaa !2
  %78 = load i32, i32* %12, align 4, !tbaa !2
  %cmp7.us.i.1108 = icmp eq i32 %77, %78
  br i1 %cmp7.us.i.1108, label %for.cond1.us.i.1109, label %while.body17.preheader

for.cond1.us.i.1109:                              ; preds = %for.cond1.us.i.2
  store i32 1, i32* @j, align 4, !tbaa !2
  %79 = load i32, i32* %24, align 4, !tbaa !2
  %80 = load i32, i32* %25, align 4, !tbaa !2
  %cmp7.us.i.1.1 = icmp eq i32 %79, %80
  br i1 %cmp7.us.i.1.1, label %for.cond1.us.i.1.1, label %while.body17.preheader

for.cond1.us.i.1.1:                               ; preds = %for.cond1.us.i.1109
  store i32 2, i32* @j, align 4, !tbaa !2
  %81 = load i32, i32* %26, align 4, !tbaa !2
  %82 = load i32, i32* %27, align 4, !tbaa !2
  %cmp7.us.i.2.1 = icmp eq i32 %81, %82
  br i1 %cmp7.us.i.2.1, label %for.cond1.us.i.2.1, label %while.body17.preheader

for.cond1.us.i.2.1:                               ; preds = %for.cond1.us.i.1.1
  store i32 3, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %83 = load i32, i32* %13, align 4, !tbaa !2
  %84 = load i32, i32* %14, align 4, !tbaa !2
  %cmp7.us.i.2110 = icmp eq i32 %83, %84
  br i1 %cmp7.us.i.2110, label %for.cond1.us.i.2111, label %while.body17.preheader

for.cond1.us.i.2111:                              ; preds = %for.cond1.us.i.2.1
  store i32 1, i32* @j, align 4, !tbaa !2
  %85 = load i32, i32* %28, align 4, !tbaa !2
  %86 = load i32, i32* %29, align 4, !tbaa !2
  %cmp7.us.i.1.2 = icmp eq i32 %85, %86
  br i1 %cmp7.us.i.1.2, label %for.cond1.us.i.1.2, label %while.body17.preheader

for.cond1.us.i.1.2:                               ; preds = %for.cond1.us.i.2111
  store i32 2, i32* @j, align 4, !tbaa !2
  %87 = load i32, i32* %30, align 4, !tbaa !2
  %88 = load i32, i32* %31, align 4, !tbaa !2
  %cmp7.us.i.2.2 = icmp eq i32 %87, %88
  br i1 %cmp7.us.i.2.2, label %for.cond1.us.i.2.2, label %while.body17.preheader

for.cond1.us.i.2.2:                               ; preds = %for.cond1.us.i.1.2
  store i32 3, i32* @j, align 4, !tbaa !2
  store i32 4, i32* @i, align 4, !tbaa !2
  tail call void @initb(i32** %0, i32** %4, i32 3)
  store i32 1, i32* @i, align 4, !tbaa !2
  store i32 0, i32* @j, align 4, !tbaa !2
  %89 = load i32, i32* %9, align 4, !tbaa !2
  %90 = load i32, i32* %10, align 4, !tbaa !2
  %cmp7.us.i = icmp eq i32 %89, %90
  br i1 %cmp7.us.i, label %for.cond1.us.i, label %while.body17.preheader
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

attributes #0 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{!4, !4, i64 0}
