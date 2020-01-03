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
@str = private unnamed_addr constant [17 x i8] c"Error in tryPerm\00", align 1
@str.12 = private unnamed_addr constant [3 x i8] c"\08]\00", align 1
@str.13 = private unnamed_addr constant [31 x i8] c"Non-Brauer analysis suppressed\00", align 1
@str.14 = private unnamed_addr constant [58 x i8] c"Searching for Brauer chains up to a minimum length of 12:\00", align 1

; Function Attrs: norecurse nounwind
define hidden void @reverse(i32* nocapture %s, i32 %len) local_unnamed_addr #0 {
entry:
  %j.016 = add nsw i32 %len, -1
  %cmp17 = icmp sgt i32 %j.016, 0
  br i1 %cmp17, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %j.019 = phi i32 [ %j.0, %for.body ], [ %j.016, %entry ]
  %i.018 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i32, i32* %s, i32 %i.018
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %arrayidx1 = getelementptr inbounds i32, i32* %s, i32 %j.019
  %1 = load i32, i32* %arrayidx1, align 4, !tbaa !2
  store i32 %1, i32* %arrayidx, align 4, !tbaa !2
  store i32 %0, i32* %arrayidx1, align 4, !tbaa !2
  %inc = add nuw nsw i32 %i.018, 1
  %j.0 = add nsw i32 %j.019, -1
  %cmp = icmp slt i32 %inc, %j.0
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
define hidden void @checkSeq(%struct.pair* noalias nocapture sret %agg.result, i32 %pos, i32* %seq, i32 %n, i32 %len, i32 %minLen) local_unnamed_addr #2 {
entry:
  %cmp = icmp sgt i32 %pos, %minLen
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %0 = load i32, i32* %seq, align 4, !tbaa !2
  %cmp1 = icmp sgt i32 %0, %n
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %p.sroa.0.0..sroa_idx = getelementptr inbounds %struct.pair, %struct.pair* %agg.result, i32 0, i32 0
  store i32 %minLen, i32* %p.sroa.0.0..sroa_idx, align 4
  %p.sroa.8.0..sroa_idx19 = getelementptr inbounds %struct.pair, %struct.pair* %agg.result, i32 0, i32 1
  store i32 0, i32* %p.sroa.8.0..sroa_idx19, align 4
  br label %cleanup

if.else:                                          ; preds = %lor.lhs.false
  %cmp3 = icmp eq i32 %0, %n
  br i1 %cmp3, label %if.then4, label %if.else8

if.then4:                                         ; preds = %if.else
  %mul = shl i32 %len, 2
  %call = tail call noalias i8* @malloc(i32 %mul) #5
  store i8* %call, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  %1 = bitcast i32* %seq to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %call, i8* align 4 %1, i32 %mul, i1 false)
  store i32 %len, i32* @exampleLen, align 4, !tbaa !2
  %p.sroa.0.0..sroa_idx14 = getelementptr inbounds %struct.pair, %struct.pair* %agg.result, i32 0, i32 0
  store i32 %pos, i32* %p.sroa.0.0..sroa_idx14, align 4
  %p.sroa.8.0..sroa_idx20 = getelementptr inbounds %struct.pair, %struct.pair* %agg.result, i32 0, i32 1
  store i32 1, i32* %p.sroa.8.0..sroa_idx20, align 4
  br label %cleanup

if.else8:                                         ; preds = %if.else
  %cmp9 = icmp slt i32 %pos, %minLen
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.else8
  tail call void @tryPerm(%struct.pair* sret %agg.result, i32 0, i32 %pos, i32* nonnull %seq, i32 %n, i32 %len, i32 %minLen)
  br label %cleanup

if.else11:                                        ; preds = %if.else8
  %p.sroa.0.0..sroa_idx16 = getelementptr inbounds %struct.pair, %struct.pair* %agg.result, i32 0, i32 0
  store i32 %minLen, i32* %p.sroa.0.0..sroa_idx16, align 4
  %p.sroa.8.0..sroa_idx22 = getelementptr inbounds %struct.pair, %struct.pair* %agg.result, i32 0, i32 1
  store i32 0, i32* %p.sroa.8.0..sroa_idx22, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.else11, %if.then10, %if.then4, %if.then
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i1) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden void @tryPerm(%struct.pair* noalias nocapture sret %agg.result, i32 %i, i32 %pos, i32* nocapture readonly %seq, i32 %n, i32 %len, i32 %minLen) local_unnamed_addr #2 {
entry:
  %tmp = alloca %struct.pair, align 4
  %tmp7 = alloca %struct.pair, align 4
  %cmp = icmp sgt i32 %i, %pos
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %add = add nsw i32 %len, 1
  %mul = shl i32 %add, 2
  %call = tail call noalias i8* @malloc(i32 %mul) #5
  %0 = bitcast i8* %call to i32*
  %add.ptr = getelementptr inbounds i8, i8* %call, i32 4
  %1 = bitcast i32* %seq to i8*
  %mul1 = shl i32 %len, 2
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 4 %add.ptr, i8* align 4 %1, i32 %mul1, i1 false)
  %2 = load i32, i32* %seq, align 4, !tbaa !2
  %arrayidx2 = getelementptr inbounds i32, i32* %seq, i32 %i
  %3 = load i32, i32* %arrayidx2, align 4, !tbaa !2
  %add3 = add nsw i32 %3, %2
  store i32 %add3, i32* %0, align 4, !tbaa !2
  %4 = bitcast %struct.pair* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #5
  %add5 = add nsw i32 %pos, 1
  %cmp.i = icmp sge i32 %pos, %minLen
  %cmp1.i = icmp sgt i32 %add3, %n
  %or.cond = or i1 %cmp.i, %cmp1.i
  br i1 %or.cond, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.end
  %p.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.pair, %struct.pair* %tmp, i32 0, i32 0
  store i32 %minLen, i32* %p.sroa.0.0..sroa_idx.i, align 4, !alias.scope !8
  %p.sroa.8.0..sroa_idx19.i = getelementptr inbounds %struct.pair, %struct.pair* %tmp, i32 0, i32 1
  store i32 0, i32* %p.sroa.8.0..sroa_idx19.i, align 4, !alias.scope !8
  br label %checkSeq.exit

if.else.i:                                        ; preds = %if.end
  %cmp3.i = icmp eq i32 %add3, %n
  br i1 %cmp3.i, label %if.then4.i, label %if.else8.i

if.then4.i:                                       ; preds = %if.else.i
  %call.i = tail call noalias i8* @malloc(i32 %mul) #5
  store i8* %call.i, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %call.i, i8* align 4 %call, i32 %mul, i1 false) #5, !noalias !8
  store i32 %add, i32* @exampleLen, align 4, !tbaa !2
  %p.sroa.0.0..sroa_idx14.i = getelementptr inbounds %struct.pair, %struct.pair* %tmp, i32 0, i32 0
  store i32 %add5, i32* %p.sroa.0.0..sroa_idx14.i, align 4, !alias.scope !8
  %p.sroa.8.0..sroa_idx20.i = getelementptr inbounds %struct.pair, %struct.pair* %tmp, i32 0, i32 1
  store i32 1, i32* %p.sroa.8.0..sroa_idx20.i, align 4, !alias.scope !8
  br label %checkSeq.exit

if.else8.i:                                       ; preds = %if.else.i
  %cmp9.i = icmp slt i32 %add5, %minLen
  br i1 %cmp9.i, label %if.then10.i, label %if.else11.i

if.then10.i:                                      ; preds = %if.else8.i
  call void @tryPerm(%struct.pair* nonnull sret %tmp, i32 0, i32 %add5, i32* %0, i32 %n, i32 %add, i32 %minLen) #5
  %res1.sroa.0.0..sroa_idx.phi.trans.insert = getelementptr inbounds %struct.pair, %struct.pair* %tmp, i32 0, i32 0
  %res1.sroa.0.0.copyload.pre = load i32, i32* %res1.sroa.0.0..sroa_idx.phi.trans.insert, align 4
  %res1.sroa.6.0..sroa_idx46.phi.trans.insert = getelementptr inbounds %struct.pair, %struct.pair* %tmp, i32 0, i32 1
  %res1.sroa.6.0.copyload.pre = load i32, i32* %res1.sroa.6.0..sroa_idx46.phi.trans.insert, align 4
  br label %checkSeq.exit

if.else11.i:                                      ; preds = %if.else8.i
  %p.sroa.0.0..sroa_idx16.i = getelementptr inbounds %struct.pair, %struct.pair* %tmp, i32 0, i32 0
  store i32 %minLen, i32* %p.sroa.0.0..sroa_idx16.i, align 4, !alias.scope !8
  %p.sroa.8.0..sroa_idx22.i = getelementptr inbounds %struct.pair, %struct.pair* %tmp, i32 0, i32 1
  store i32 0, i32* %p.sroa.8.0..sroa_idx22.i, align 4, !alias.scope !8
  br label %checkSeq.exit

checkSeq.exit:                                    ; preds = %if.then.i, %if.then4.i, %if.then10.i, %if.else11.i
  %res1.sroa.6.0.copyload = phi i32 [ 0, %if.then.i ], [ 1, %if.then4.i ], [ %res1.sroa.6.0.copyload.pre, %if.then10.i ], [ 0, %if.else11.i ]
  %res1.sroa.0.0.copyload = phi i32 [ %minLen, %if.then.i ], [ %add5, %if.then4.i ], [ %res1.sroa.0.0.copyload.pre, %if.then10.i ], [ %minLen, %if.else11.i ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #5
  %5 = bitcast %struct.pair* %tmp7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #5
  %add8 = add nsw i32 %i, 1
  call void @tryPerm(%struct.pair* nonnull sret %tmp7, i32 %add8, i32 %pos, i32* nonnull %seq, i32 %n, i32 %len, i32 %res1.sroa.0.0.copyload)
  %res2.sroa.0.0..sroa_idx = getelementptr inbounds %struct.pair, %struct.pair* %tmp7, i32 0, i32 0
  %res2.sroa.0.0.copyload = load i32, i32* %res2.sroa.0.0..sroa_idx, align 4
  %res2.sroa.7.0..sroa_idx39 = getelementptr inbounds %struct.pair, %struct.pair* %tmp7, i32 0, i32 1
  %res2.sroa.7.0.copyload = load i32, i32* %res2.sroa.7.0..sroa_idx39, align 4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #5
  tail call void @free(i8* %call) #5
  %cmp12 = icmp slt i32 %res2.sroa.0.0.copyload, %res1.sroa.0.0.copyload
  br i1 %cmp12, label %cleanup, label %if.else

if.else:                                          ; preds = %checkSeq.exit
  %cmp16 = icmp eq i32 %res2.sroa.0.0.copyload, %res1.sroa.0.0.copyload
  br i1 %cmp16, label %if.then17, label %if.else24

if.then17:                                        ; preds = %if.else
  %add22 = add nsw i32 %res2.sroa.7.0.copyload, %res1.sroa.6.0.copyload
  br label %cleanup

if.else24:                                        ; preds = %if.else
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @str, i32 0, i32 0))
  br label %cleanup

cleanup:                                          ; preds = %checkSeq.exit, %entry, %if.else24, %if.then17
  %.sink77 = phi i32 [ 0, %if.else24 ], [ %res1.sroa.0.0.copyload, %if.then17 ], [ %minLen, %entry ], [ %res2.sroa.0.0.copyload, %checkSeq.exit ]
  %.sink = phi i32 [ 0, %if.else24 ], [ %add22, %if.then17 ], [ 0, %entry ], [ %res2.sroa.7.0.copyload, %checkSeq.exit ]
  %p.sroa.0.0..sroa_idx50 = getelementptr inbounds %struct.pair, %struct.pair* %agg.result, i32 0, i32 0
  store i32 %.sink77, i32* %p.sroa.0.0..sroa_idx50, align 4
  %p.sroa.8.0..sroa_idx56 = getelementptr inbounds %struct.pair, %struct.pair* %agg.result, i32 0, i32 1
  store i32 %.sink, i32* %p.sroa.8.0..sroa_idx56, align 4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden void @initTryPerm(%struct.pair* noalias nocapture sret %agg.result, i32 %x, i32 %minLen) local_unnamed_addr #2 {
entry:
  %seq = alloca [1 x i32], align 4
  %0 = bitcast [1 x i32]* %seq to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #5
  %1 = getelementptr inbounds [1 x i32], [1 x i32]* %seq, i32 0, i32 0
  store i32 1, i32* %1, align 4
  call void @tryPerm(%struct.pair* sret %agg.result, i32 0, i32 0, i32* nonnull %1, i32 %x, i32 1, i32 %minLen)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #5
  ret void
}

; Function Attrs: nounwind
define hidden void @printArray(i32* nocapture readonly %a, i32 %len) local_unnamed_addr #2 {
entry:
  %putchar = tail call i32 @putchar(i32 91)
  %cmp6 = icmp sgt i32 %len, 0
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %i.07 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i32 %i.07
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %0)
  %inc = add nuw nsw i32 %i.07, 1
  %exitcond = icmp eq i32 %inc, %len
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.12, i32 0, i32 0))
  ret void
}

; Function Attrs: norecurse nounwind readonly
define hidden i32 @isBrauer(i32* nocapture readonly %a, i32 %len) local_unnamed_addr #4 {
entry:
  %cmp27 = icmp sgt i32 %len, 2
  br i1 %cmp27, label %for.body.preheader, label %cleanup

for.body.preheader:                               ; preds = %entry
  %arrayidx.phi.trans.insert = getelementptr inbounds i32, i32* %a, i32 1
  %.pre = load i32, i32* %arrayidx.phi.trans.insert, align 4, !tbaa !2
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc10
  %0 = phi i32 [ %1, %for.inc10 ], [ %.pre, %for.body.preheader ]
  %i.028 = phi i32 [ %inc, %for.inc10 ], [ 2, %for.body.preheader ]
  %arrayidx6 = getelementptr inbounds i32, i32* %a, i32 %i.028
  %1 = load i32, i32* %arrayidx6, align 4, !tbaa !2
  br label %for.body3

for.cond1:                                        ; preds = %for.body3
  %cmp2 = icmp sgt i32 %j.026, 0
  br i1 %cmp2, label %for.body3, label %cleanup

for.body3:                                        ; preds = %for.body, %for.cond1
  %j.026.in = phi i32 [ %i.028, %for.body ], [ %j.026, %for.cond1 ]
  %j.026 = add nsw i32 %j.026.in, -1
  %arrayidx5 = getelementptr inbounds i32, i32* %a, i32 %j.026
  %2 = load i32, i32* %arrayidx5, align 4, !tbaa !2
  %add = add nsw i32 %2, %0
  %cmp7 = icmp eq i32 %add, %1
  br i1 %cmp7, label %for.inc10, label %for.cond1

for.inc10:                                        ; preds = %for.body3
  %inc = add nuw nsw i32 %i.028, 1
  %cmp = icmp slt i32 %inc, %len
  br i1 %cmp, label %for.body, label %cleanup

cleanup:                                          ; preds = %for.inc10, %for.cond1, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %for.cond1 ], [ 1, %for.inc10 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define hidden i32 @isAdditionChain(i32* nocapture readonly %a, i32 %len) local_unnamed_addr #2 {
entry:
  %cmp71 = icmp sgt i32 %len, 2
  br i1 %cmp71, label %for.body.preheader, label %cleanup

for.body.preheader:                               ; preds = %entry
  %arrayidx1.phi.trans.insert = getelementptr inbounds i32, i32* %a, i32 1
  %.pre = load i32, i32* %arrayidx1.phi.trans.insert, align 4, !tbaa !2
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc24
  %0 = phi i32 [ %1, %for.inc24 ], [ %.pre, %for.body.preheader ]
  %i.072 = phi i32 [ %inc, %for.inc24 ], [ 2, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i32 %i.072
  %1 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %mul = shl nsw i32 %0, 1
  %cmp2 = icmp sgt i32 %1, %mul
  br i1 %cmp2, label %cleanup, label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.body, %for.inc18
  %j.069.in = phi i32 [ %j.069, %for.inc18 ], [ %i.072, %for.body ]
  %j.069 = add nsw i32 %j.069.in, -1
  %cmp867 = icmp sgt i32 %j.069.in, 0
  br i1 %cmp867, label %for.body9.lr.ph, label %for.inc18

for.body9.lr.ph:                                  ; preds = %for.cond7.preheader
  %arrayidx10 = getelementptr inbounds i32, i32* %a, i32 %j.069
  %2 = load i32, i32* %arrayidx10, align 4, !tbaa !2
  %add82 = shl nsw i32 %2, 1
  %cmp1383 = icmp eq i32 %add82, %1
  br i1 %cmp1383, label %for.inc24, label %for.cond7

for.cond7:                                        ; preds = %for.body9.lr.ph, %for.cond7.for.body9_crit_edge
  %k.06884 = phi i32 [ %dec, %for.cond7.for.body9_crit_edge ], [ %j.069, %for.body9.lr.ph ]
  %dec = add nsw i32 %k.06884, -1
  %cmp8 = icmp sgt i32 %k.06884, 0
  br i1 %cmp8, label %for.cond7.for.body9_crit_edge, label %for.inc18

for.cond7.for.body9_crit_edge:                    ; preds = %for.cond7
  %arrayidx11.phi.trans.insert = getelementptr inbounds i32, i32* %a, i32 %dec
  %.pre75 = load i32, i32* %arrayidx11.phi.trans.insert, align 4, !tbaa !2
  %add = add nsw i32 %.pre75, %2
  %cmp13 = icmp eq i32 %add, %1
  br i1 %cmp13, label %for.inc24, label %for.cond7

for.inc18:                                        ; preds = %for.cond7, %for.cond7.preheader
  %cmp5 = icmp sgt i32 %j.069, 0
  br i1 %cmp5, label %for.cond7.preheader, label %cleanup

for.inc24:                                        ; preds = %for.body9.lr.ph, %for.cond7.for.body9_crit_edge
  %inc = add nuw nsw i32 %i.072, 1
  %cmp = icmp slt i32 %inc, %len
  br i1 %cmp, label %for.body, label %for.end25

for.end25:                                        ; preds = %for.inc24
  %3 = load i32*, i32** @example, align 4, !tbaa !6
  %cmp26 = icmp eq i32* %3, null
  %or.cond = and i1 %cmp71, %cmp26
  br i1 %or.cond, label %for.body.preheader.i, label %cleanup

for.body.preheader.i:                             ; preds = %for.end25
  %arrayidx.phi.trans.insert.i = getelementptr inbounds i32, i32* %a, i32 1
  %.pre.i = load i32, i32* %arrayidx.phi.trans.insert.i, align 4, !tbaa !2
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc10.i, %for.body.preheader.i
  %4 = phi i32 [ %5, %for.inc10.i ], [ %.pre.i, %for.body.preheader.i ]
  %i.028.i = phi i32 [ %inc.i, %for.inc10.i ], [ 2, %for.body.preheader.i ]
  %arrayidx6.i = getelementptr inbounds i32, i32* %a, i32 %i.028.i
  %5 = load i32, i32* %arrayidx6.i, align 4, !tbaa !2
  br label %for.body3.i

for.cond1.i:                                      ; preds = %for.body3.i
  %cmp2.i = icmp sgt i32 %j.026.i, 0
  br i1 %cmp2.i, label %for.body3.i, label %if.then28

for.body3.i:                                      ; preds = %for.cond1.i, %for.body.i
  %j.026.in.i = phi i32 [ %i.028.i, %for.body.i ], [ %j.026.i, %for.cond1.i ]
  %j.026.i = add nsw i32 %j.026.in.i, -1
  %arrayidx5.i = getelementptr inbounds i32, i32* %a, i32 %j.026.i
  %6 = load i32, i32* %arrayidx5.i, align 4, !tbaa !2
  %add.i = add nsw i32 %6, %4
  %cmp7.i = icmp eq i32 %add.i, %5
  br i1 %cmp7.i, label %for.inc10.i, label %for.cond1.i

for.inc10.i:                                      ; preds = %for.body3.i
  %inc.i = add nuw nsw i32 %i.028.i, 1
  %cmp.i = icmp slt i32 %inc.i, %len
  br i1 %cmp.i, label %for.body.i, label %cleanup

if.then28:                                        ; preds = %for.cond1.i
  %mul29 = shl i32 %len, 2
  %call30 = tail call noalias i8* @malloc(i32 %mul29) #5
  store i8* %call30, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  %7 = bitcast i32* %a to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %call30, i8* align 4 %7, i32 %mul29, i1 false)
  store i32 %len, i32* @exampleLen, align 4, !tbaa !2
  br label %cleanup

cleanup:                                          ; preds = %for.body, %for.inc18, %for.inc10.i, %entry, %for.end25, %if.then28
  %retval.0 = phi i32 [ 1, %if.then28 ], [ 1, %for.end25 ], [ 1, %entry ], [ 1, %for.inc10.i ], [ 0, %for.inc18 ], [ 0, %for.body ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define hidden void @nextChains(i32 %index, i32 %len, i32* nocapture %seq, i32* nocapture %pcount) local_unnamed_addr #2 {
entry:
  %sub = add i32 %len, -1
  %cmp = icmp sgt i32 %sub, %index
  %add = add nsw i32 %index, 1
  %arrayidx = getelementptr inbounds i32, i32* %seq, i32 %index
  %0 = xor i32 %index, -1
  %add1 = add i32 %0, %len
  %arrayidx5 = getelementptr inbounds i32, i32* %seq, i32 %sub
  %cmp1345 = icmp slt i32 %add, %sub
  %cmp71.i = icmp sgt i32 %len, 2
  %arrayidx1.phi.trans.insert.i = getelementptr inbounds i32, i32* %seq, i32 1
  %mul29.i = shl i32 %len, 2
  %1 = bitcast i32* %seq to i8*
  br i1 %cmp, label %for.cond.us.preheader, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %sub369 = add i32 %add1, %2
  %3 = load i32, i32* %arrayidx5, align 4, !tbaa !2
  %cmp670 = icmp slt i32 %sub369, %3
  br i1 %cmp670, label %if.end8, label %return.critedge

for.cond.us.preheader:                            ; preds = %entry
  tail call void @nextChains(i32 %add, i32 %len, i32* %seq, i32* %pcount)
  %4 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %sub3.us67 = add i32 %add1, %4
  %5 = load i32, i32* %arrayidx5, align 4, !tbaa !2
  %cmp6.us68 = icmp slt i32 %sub3.us67, %5
  br i1 %cmp6.us68, label %if.end8.us, label %return.critedge

if.end8.us:                                       ; preds = %for.cond.us.preheader, %cleanup.us
  %6 = phi i32 [ %15, %cleanup.us ], [ %4, %for.cond.us.preheader ]
  %inc.us = add nsw i32 %6, 1
  store i32 %inc.us, i32* %arrayidx, align 4, !tbaa !2
  br i1 %cmp1345, label %for.body.us, label %for.end.us

for.end.us:                                       ; preds = %for.body.us, %if.end8.us
  br i1 %cmp71.i, label %for.body.preheader.i.us, label %if.then19.us

for.body.preheader.i.us:                          ; preds = %for.end.us
  %.pre.i.us = load i32, i32* %arrayidx1.phi.trans.insert.i, align 4, !tbaa !2
  br label %for.body.i.us

for.body.i.us:                                    ; preds = %for.inc24.i.us, %for.body.preheader.i.us
  %7 = phi i32 [ %8, %for.inc24.i.us ], [ %.pre.i.us, %for.body.preheader.i.us ]
  %i.072.i.us = phi i32 [ %inc.i.us, %for.inc24.i.us ], [ 2, %for.body.preheader.i.us ]
  %arrayidx.i.us = getelementptr inbounds i32, i32* %seq, i32 %i.072.i.us
  %8 = load i32, i32* %arrayidx.i.us, align 4, !tbaa !2
  %mul.i.us = shl nsw i32 %7, 1
  %cmp2.i.us = icmp sgt i32 %8, %mul.i.us
  br i1 %cmp2.i.us, label %cleanup.us, label %for.body9.lr.ph.i.us

for.body9.lr.ph.i.us:                             ; preds = %for.body.i.us, %for.inc18.i.us
  %j.069.in.i.us = phi i32 [ %j.069.i.us, %for.inc18.i.us ], [ %i.072.i.us, %for.body.i.us ]
  %j.069.i.us = add nsw i32 %j.069.in.i.us, -1
  %arrayidx10.i.us = getelementptr inbounds i32, i32* %seq, i32 %j.069.i.us
  %9 = load i32, i32* %arrayidx10.i.us, align 4, !tbaa !2
  %add.i48.us = shl nsw i32 %9, 1
  %cmp13.i49.us = icmp eq i32 %add.i48.us, %8
  br i1 %cmp13.i49.us, label %for.inc24.i.us, label %for.cond7.i.us

for.cond7.i.us:                                   ; preds = %for.body9.lr.ph.i.us, %for.cond7.for.body9_crit_edge.i.us
  %k.068.i50.us = phi i32 [ %dec.i.us, %for.cond7.for.body9_crit_edge.i.us ], [ %j.069.i.us, %for.body9.lr.ph.i.us ]
  %dec.i.us = add nsw i32 %k.068.i50.us, -1
  %cmp8.i.us = icmp sgt i32 %k.068.i50.us, 0
  br i1 %cmp8.i.us, label %for.cond7.for.body9_crit_edge.i.us, label %for.inc18.i.us

for.inc18.i.us:                                   ; preds = %for.cond7.i.us
  %cmp5.i.us = icmp sgt i32 %j.069.i.us, 0
  br i1 %cmp5.i.us, label %for.body9.lr.ph.i.us, label %cleanup.us

for.cond7.for.body9_crit_edge.i.us:               ; preds = %for.cond7.i.us
  %arrayidx11.phi.trans.insert.i.us = getelementptr inbounds i32, i32* %seq, i32 %dec.i.us
  %.pre75.i.us = load i32, i32* %arrayidx11.phi.trans.insert.i.us, align 4, !tbaa !2
  %add.i.us = add nsw i32 %.pre75.i.us, %9
  %cmp13.i.us = icmp eq i32 %add.i.us, %8
  br i1 %cmp13.i.us, label %for.inc24.i.us, label %for.cond7.i.us

for.inc24.i.us:                                   ; preds = %for.body9.lr.ph.i.us, %for.cond7.for.body9_crit_edge.i.us
  %inc.i.us = add nuw nsw i32 %i.072.i.us, 1
  %cmp.i.us = icmp slt i32 %inc.i.us, %len
  br i1 %cmp.i.us, label %for.body.i.us, label %for.end25.i.us

for.end25.i.us:                                   ; preds = %for.inc24.i.us
  %10 = load i32*, i32** @example, align 4, !tbaa !6
  %cmp26.i.us = icmp eq i32* %10, null
  br i1 %cmp26.i.us, label %for.body.i.i.us, label %if.then19.us

for.body.i.i.us:                                  ; preds = %for.end25.i.us, %for.inc10.i.i.us
  %11 = phi i32 [ %12, %for.inc10.i.i.us ], [ %.pre.i.us, %for.end25.i.us ]
  %i.028.i.i.us = phi i32 [ %inc.i.i.us, %for.inc10.i.i.us ], [ 2, %for.end25.i.us ]
  %arrayidx6.i.i.us = getelementptr inbounds i32, i32* %seq, i32 %i.028.i.i.us
  %12 = load i32, i32* %arrayidx6.i.i.us, align 4, !tbaa !2
  br label %for.body3.i.i.us

for.body3.i.i.us:                                 ; preds = %for.cond1.i.i.us, %for.body.i.i.us
  %j.026.in.i.i.us = phi i32 [ %i.028.i.i.us, %for.body.i.i.us ], [ %j.026.i.i.us, %for.cond1.i.i.us ]
  %j.026.i.i.us = add nsw i32 %j.026.in.i.i.us, -1
  %arrayidx5.i.i.us = getelementptr inbounds i32, i32* %seq, i32 %j.026.i.i.us
  %13 = load i32, i32* %arrayidx5.i.i.us, align 4, !tbaa !2
  %add.i.i.us = add nsw i32 %13, %11
  %cmp7.i.i.us = icmp eq i32 %add.i.i.us, %12
  br i1 %cmp7.i.i.us, label %for.inc10.i.i.us, label %for.cond1.i.i.us

for.cond1.i.i.us:                                 ; preds = %for.body3.i.i.us
  %cmp2.i.i.us = icmp sgt i32 %j.026.i.i.us, 0
  br i1 %cmp2.i.i.us, label %for.body3.i.i.us, label %if.then28.i.us

if.then28.i.us:                                   ; preds = %for.cond1.i.i.us
  %call30.i.us = tail call noalias i8* @malloc(i32 %mul29.i) #5
  store i8* %call30.i.us, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %call30.i.us, i8* nonnull align 4 %1, i32 %mul29.i, i1 false) #5
  store i32 %len, i32* @exampleLen, align 4, !tbaa !2
  br label %if.then19.us

for.inc10.i.i.us:                                 ; preds = %for.body3.i.i.us
  %inc.i.i.us = add nuw nsw i32 %i.028.i.i.us, 1
  %cmp.i.i.us = icmp slt i32 %inc.i.i.us, %len
  br i1 %cmp.i.i.us, label %for.body.i.i.us, label %if.then19.us

if.then19.us:                                     ; preds = %for.inc10.i.i.us, %if.then28.i.us, %for.end25.i.us, %for.end.us
  %14 = load i32, i32* %pcount, align 4, !tbaa !2
  %inc20.us = add nsw i32 %14, 1
  store i32 %inc20.us, i32* %pcount, align 4, !tbaa !2
  br label %cleanup.us

cleanup.us:                                       ; preds = %for.body.i.us, %for.inc18.i.us, %if.then19.us
  tail call void @nextChains(i32 %add, i32 %len, i32* %seq, i32* %pcount)
  %15 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %sub3.us = add i32 %add1, %15
  %16 = load i32, i32* %arrayidx5, align 4, !tbaa !2
  %cmp6.us = icmp slt i32 %sub3.us, %16
  br i1 %cmp6.us, label %if.end8.us, label %return.critedge

for.body.us:                                      ; preds = %if.end8.us, %for.body.us
  %17 = phi i32 [ %add16.us, %for.body.us ], [ %inc.us, %if.end8.us ]
  %i.047.us = phi i32 [ %i.0.us, %for.body.us ], [ %add, %if.end8.us ]
  %add16.us = add nsw i32 %17, 1
  %arrayidx17.us = getelementptr inbounds i32, i32* %seq, i32 %i.047.us
  store i32 %add16.us, i32* %arrayidx17.us, align 4, !tbaa !2
  %i.0.us = add nsw i32 %i.047.us, 1
  %exitcond = icmp eq i32 %i.0.us, %sub
  br i1 %exitcond, label %for.end.us, label %for.body.us

if.end8:                                          ; preds = %for.cond.preheader, %cleanup
  %18 = phi i32 [ %28, %cleanup ], [ %2, %for.cond.preheader ]
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %arrayidx, align 4, !tbaa !2
  br i1 %cmp1345, label %for.body, label %for.end

for.body:                                         ; preds = %if.end8, %for.body
  %19 = phi i32 [ %add16, %for.body ], [ %inc, %if.end8 ]
  %i.047 = phi i32 [ %i.0, %for.body ], [ %add, %if.end8 ]
  %add16 = add nsw i32 %19, 1
  %arrayidx17 = getelementptr inbounds i32, i32* %seq, i32 %i.047
  store i32 %add16, i32* %arrayidx17, align 4, !tbaa !2
  %i.0 = add nsw i32 %i.047, 1
  %exitcond56 = icmp eq i32 %i.0, %sub
  br i1 %exitcond56, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %if.end8
  br i1 %cmp71.i, label %for.body.preheader.i, label %if.then19

for.body.preheader.i:                             ; preds = %for.end
  %.pre.i = load i32, i32* %arrayidx1.phi.trans.insert.i, align 4, !tbaa !2
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc24.i, %for.body.preheader.i
  %20 = phi i32 [ %21, %for.inc24.i ], [ %.pre.i, %for.body.preheader.i ]
  %i.072.i = phi i32 [ %inc.i, %for.inc24.i ], [ 2, %for.body.preheader.i ]
  %arrayidx.i = getelementptr inbounds i32, i32* %seq, i32 %i.072.i
  %21 = load i32, i32* %arrayidx.i, align 4, !tbaa !2
  %mul.i = shl nsw i32 %20, 1
  %cmp2.i = icmp sgt i32 %21, %mul.i
  br i1 %cmp2.i, label %cleanup, label %for.body9.lr.ph.i

for.body9.lr.ph.i:                                ; preds = %for.body.i, %for.inc18.i
  %j.069.in.i = phi i32 [ %j.069.i, %for.inc18.i ], [ %i.072.i, %for.body.i ]
  %j.069.i = add nsw i32 %j.069.in.i, -1
  %arrayidx10.i = getelementptr inbounds i32, i32* %seq, i32 %j.069.i
  %22 = load i32, i32* %arrayidx10.i, align 4, !tbaa !2
  %add.i48 = shl nsw i32 %22, 1
  %cmp13.i49 = icmp eq i32 %add.i48, %21
  br i1 %cmp13.i49, label %for.inc24.i, label %for.cond7.i

for.cond7.i:                                      ; preds = %for.body9.lr.ph.i, %for.cond7.for.body9_crit_edge.i
  %k.068.i50 = phi i32 [ %dec.i, %for.cond7.for.body9_crit_edge.i ], [ %j.069.i, %for.body9.lr.ph.i ]
  %dec.i = add nsw i32 %k.068.i50, -1
  %cmp8.i = icmp sgt i32 %k.068.i50, 0
  br i1 %cmp8.i, label %for.cond7.for.body9_crit_edge.i, label %for.inc18.i

for.cond7.for.body9_crit_edge.i:                  ; preds = %for.cond7.i
  %arrayidx11.phi.trans.insert.i = getelementptr inbounds i32, i32* %seq, i32 %dec.i
  %.pre75.i = load i32, i32* %arrayidx11.phi.trans.insert.i, align 4, !tbaa !2
  %add.i = add nsw i32 %.pre75.i, %22
  %cmp13.i = icmp eq i32 %add.i, %21
  br i1 %cmp13.i, label %for.inc24.i, label %for.cond7.i

for.inc18.i:                                      ; preds = %for.cond7.i
  %cmp5.i = icmp sgt i32 %j.069.i, 0
  br i1 %cmp5.i, label %for.body9.lr.ph.i, label %cleanup

for.inc24.i:                                      ; preds = %for.body9.lr.ph.i, %for.cond7.for.body9_crit_edge.i
  %inc.i = add nuw nsw i32 %i.072.i, 1
  %cmp.i = icmp slt i32 %inc.i, %len
  br i1 %cmp.i, label %for.body.i, label %for.end25.i

for.end25.i:                                      ; preds = %for.inc24.i
  %23 = load i32*, i32** @example, align 4, !tbaa !6
  %cmp26.i = icmp eq i32* %23, null
  br i1 %cmp26.i, label %for.body.i.i, label %if.then19

for.body.i.i:                                     ; preds = %for.end25.i, %for.inc10.i.i
  %24 = phi i32 [ %25, %for.inc10.i.i ], [ %.pre.i, %for.end25.i ]
  %i.028.i.i = phi i32 [ %inc.i.i, %for.inc10.i.i ], [ 2, %for.end25.i ]
  %arrayidx6.i.i = getelementptr inbounds i32, i32* %seq, i32 %i.028.i.i
  %25 = load i32, i32* %arrayidx6.i.i, align 4, !tbaa !2
  br label %for.body3.i.i

for.cond1.i.i:                                    ; preds = %for.body3.i.i
  %cmp2.i.i = icmp sgt i32 %j.026.i.i, 0
  br i1 %cmp2.i.i, label %for.body3.i.i, label %if.then28.i

for.body3.i.i:                                    ; preds = %for.cond1.i.i, %for.body.i.i
  %j.026.in.i.i = phi i32 [ %i.028.i.i, %for.body.i.i ], [ %j.026.i.i, %for.cond1.i.i ]
  %j.026.i.i = add nsw i32 %j.026.in.i.i, -1
  %arrayidx5.i.i = getelementptr inbounds i32, i32* %seq, i32 %j.026.i.i
  %26 = load i32, i32* %arrayidx5.i.i, align 4, !tbaa !2
  %add.i.i = add nsw i32 %26, %24
  %cmp7.i.i = icmp eq i32 %add.i.i, %25
  br i1 %cmp7.i.i, label %for.inc10.i.i, label %for.cond1.i.i

for.inc10.i.i:                                    ; preds = %for.body3.i.i
  %inc.i.i = add nuw nsw i32 %i.028.i.i, 1
  %cmp.i.i = icmp slt i32 %inc.i.i, %len
  br i1 %cmp.i.i, label %for.body.i.i, label %if.then19

if.then28.i:                                      ; preds = %for.cond1.i.i
  %call30.i = tail call noalias i8* @malloc(i32 %mul29.i) #5
  store i8* %call30.i, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %call30.i, i8* nonnull align 4 %1, i32 %mul29.i, i1 false) #5
  store i32 %len, i32* @exampleLen, align 4, !tbaa !2
  br label %if.then19

if.then19:                                        ; preds = %for.inc10.i.i, %if.then28.i, %for.end25.i, %for.end
  %27 = load i32, i32* %pcount, align 4, !tbaa !2
  %inc20 = add nsw i32 %27, 1
  store i32 %inc20, i32* %pcount, align 4, !tbaa !2
  br label %cleanup

cleanup:                                          ; preds = %for.body.i, %for.inc18.i, %if.then19
  %28 = load i32, i32* %arrayidx, align 4, !tbaa !2
  %sub3 = add i32 %add1, %28
  %29 = load i32, i32* %arrayidx5, align 4, !tbaa !2
  %cmp6 = icmp slt i32 %sub3, %29
  br i1 %cmp6, label %if.end8, label %return.critedge

return.critedge:                                  ; preds = %cleanup, %cleanup.us, %for.cond.preheader, %for.cond.us.preheader
  ret void
}

; Function Attrs: nounwind
define hidden i32 @findNonBrauer(i32 %num, i32 %len, i32 %brauer) local_unnamed_addr #2 {
entry:
  %count = alloca i32, align 4
  %0 = bitcast i32* %count to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #5
  store i32 0, i32* %count, align 4, !tbaa !2
  %mul = shl i32 %len, 2
  %call = tail call noalias i8* @malloc(i32 %mul) #5
  %1 = bitcast i8* %call to i32*
  store i32 1, i32* %1, align 4, !tbaa !2
  %sub = add i32 %len, -1
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i32 %sub
  store i32 %num, i32* %arrayidx1, align 4, !tbaa !2
  %cmp27 = icmp sgt i32 %sub, 1
  br i1 %cmp27, label %for.body.preheader, label %if.then

for.body.preheader:                               ; preds = %entry
  %.pre = load i32, i32* %1, align 4, !tbaa !2
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %2 = phi i32 [ %add, %for.body ], [ %.pre, %for.body.preheader ]
  %i.028 = phi i32 [ %inc, %for.body ], [ 1, %for.body.preheader ]
  %add = add nsw i32 %2, 1
  %arrayidx5 = getelementptr inbounds i32, i32* %1, i32 %i.028
  store i32 %add, i32* %arrayidx5, align 4, !tbaa !2
  %inc = add nuw nsw i32 %i.028, 1
  %exitcond = icmp eq i32 %inc, %sub
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %cmp71.i = icmp sgt i32 %len, 2
  br i1 %cmp71.i, label %for.body.preheader.i, label %if.then

for.body.preheader.i:                             ; preds = %for.end
  %arrayidx1.phi.trans.insert.i = getelementptr inbounds i8, i8* %call, i32 4
  %3 = bitcast i8* %arrayidx1.phi.trans.insert.i to i32*
  %.pre.i = load i32, i32* %3, align 4, !tbaa !2
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc24.i, %for.body.preheader.i
  %4 = phi i32 [ %5, %for.inc24.i ], [ %.pre.i, %for.body.preheader.i ]
  %i.072.i = phi i32 [ %inc.i, %for.inc24.i ], [ 2, %for.body.preheader.i ]
  %arrayidx.i = getelementptr inbounds i32, i32* %1, i32 %i.072.i
  %5 = load i32, i32* %arrayidx.i, align 4, !tbaa !2
  %mul.i = shl nsw i32 %4, 1
  %cmp2.i = icmp sgt i32 %5, %mul.i
  br i1 %cmp2.i, label %if.end, label %for.body9.lr.ph.i

for.body9.lr.ph.i:                                ; preds = %for.body.i, %for.inc18.i
  %j.069.in.i = phi i32 [ %j.069.i, %for.inc18.i ], [ %i.072.i, %for.body.i ]
  %j.069.i = add nsw i32 %j.069.in.i, -1
  %arrayidx10.i = getelementptr inbounds i32, i32* %1, i32 %j.069.i
  %6 = load i32, i32* %arrayidx10.i, align 4, !tbaa !2
  %add.i24 = shl nsw i32 %6, 1
  %cmp13.i25 = icmp eq i32 %add.i24, %5
  br i1 %cmp13.i25, label %for.inc24.i, label %for.cond7.i

for.cond7.i:                                      ; preds = %for.body9.lr.ph.i, %for.cond7.for.body9_crit_edge.i
  %k.068.i26 = phi i32 [ %dec.i, %for.cond7.for.body9_crit_edge.i ], [ %j.069.i, %for.body9.lr.ph.i ]
  %dec.i = add nsw i32 %k.068.i26, -1
  %cmp8.i = icmp sgt i32 %k.068.i26, 0
  br i1 %cmp8.i, label %for.cond7.for.body9_crit_edge.i, label %for.inc18.i

for.cond7.for.body9_crit_edge.i:                  ; preds = %for.cond7.i
  %arrayidx11.phi.trans.insert.i = getelementptr inbounds i32, i32* %1, i32 %dec.i
  %.pre75.i = load i32, i32* %arrayidx11.phi.trans.insert.i, align 4, !tbaa !2
  %add.i = add nsw i32 %.pre75.i, %6
  %cmp13.i = icmp eq i32 %add.i, %5
  br i1 %cmp13.i, label %for.inc24.i, label %for.cond7.i

for.inc18.i:                                      ; preds = %for.cond7.i
  %cmp5.i = icmp sgt i32 %j.069.i, 0
  br i1 %cmp5.i, label %for.body9.lr.ph.i, label %if.end

for.inc24.i:                                      ; preds = %for.body9.lr.ph.i, %for.cond7.for.body9_crit_edge.i
  %inc.i = add nuw nsw i32 %i.072.i, 1
  %cmp.i = icmp slt i32 %inc.i, %len
  br i1 %cmp.i, label %for.body.i, label %for.end25.i

for.end25.i:                                      ; preds = %for.inc24.i
  %7 = load i32*, i32** @example, align 4, !tbaa !6
  %cmp26.i = icmp eq i32* %7, null
  br i1 %cmp26.i, label %for.body.i.i, label %if.then

for.body.i.i:                                     ; preds = %for.end25.i, %for.inc10.i.i
  %8 = phi i32 [ %9, %for.inc10.i.i ], [ %.pre.i, %for.end25.i ]
  %i.028.i.i = phi i32 [ %inc.i.i, %for.inc10.i.i ], [ 2, %for.end25.i ]
  %arrayidx6.i.i = getelementptr inbounds i32, i32* %1, i32 %i.028.i.i
  %9 = load i32, i32* %arrayidx6.i.i, align 4, !tbaa !2
  br label %for.body3.i.i

for.cond1.i.i:                                    ; preds = %for.body3.i.i
  %cmp2.i.i = icmp sgt i32 %j.026.i.i, 0
  br i1 %cmp2.i.i, label %for.body3.i.i, label %if.then28.i

for.body3.i.i:                                    ; preds = %for.cond1.i.i, %for.body.i.i
  %j.026.in.i.i = phi i32 [ %i.028.i.i, %for.body.i.i ], [ %j.026.i.i, %for.cond1.i.i ]
  %j.026.i.i = add nsw i32 %j.026.in.i.i, -1
  %arrayidx5.i.i = getelementptr inbounds i32, i32* %1, i32 %j.026.i.i
  %10 = load i32, i32* %arrayidx5.i.i, align 4, !tbaa !2
  %add.i.i = add nsw i32 %10, %8
  %cmp7.i.i = icmp eq i32 %add.i.i, %9
  br i1 %cmp7.i.i, label %for.inc10.i.i, label %for.cond1.i.i

for.inc10.i.i:                                    ; preds = %for.body3.i.i
  %inc.i.i = add nuw nsw i32 %i.028.i.i, 1
  %cmp.i.i = icmp slt i32 %inc.i.i, %len
  br i1 %cmp.i.i, label %for.body.i.i, label %if.then

if.then28.i:                                      ; preds = %for.cond1.i.i
  %call30.i = tail call noalias i8* @malloc(i32 %mul) #5
  store i8* %call30.i, i8** bitcast (i32** @example to i8**), align 4, !tbaa !6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %call30.i, i8* nonnull align 4 %call, i32 %mul, i1 false) #5
  store i32 %len, i32* @exampleLen, align 4, !tbaa !2
  br label %if.then

if.then:                                          ; preds = %for.inc10.i.i, %entry, %if.then28.i, %for.end25.i, %for.end
  store i32 1, i32* %count, align 4, !tbaa !2
  br label %if.end

if.end:                                           ; preds = %for.body.i, %for.inc18.i, %if.then
  call void @nextChains(i32 2, i32 %len, i32* %1, i32* nonnull %count)
  tail call void @free(i8* %call) #5
  %11 = load i32, i32* %count, align 4, !tbaa !2
  %sub7 = sub nsw i32 %11, %brauer
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #5
  ret i32 %sub7
}

; Function Attrs: nounwind
define hidden void @findBrauer(i32 %num, i32 %minLen, i32 %nbLimit) local_unnamed_addr #2 {
entry:
  %seq.i = alloca [1 x i32], align 4
  %p = alloca %struct.pair, align 4
  %0 = bitcast %struct.pair* %p to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #5
  %1 = bitcast [1 x i32]* %seq.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #5, !noalias !11
  %2 = getelementptr inbounds [1 x i32], [1 x i32]* %seq.i, i32 0, i32 0
  store i32 1, i32* %2, align 4, !noalias !11
  call void @tryPerm(%struct.pair* nonnull sret %p, i32 0, i32 0, i32* nonnull %2, i32 %num, i32 1, i32 %minLen) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #5, !noalias !11
  %x = getelementptr inbounds %struct.pair, %struct.pair* %p, i32 0, i32 0
  %3 = load i32, i32* %x, align 4, !tbaa !14
  %y = getelementptr inbounds %struct.pair, %struct.pair* %p, i32 0, i32 1
  %4 = load i32, i32* %y, align 4, !tbaa !16
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0), i32 %num)
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.5, i32 0, i32 0), i32 %num, i32 %3)
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.6, i32 0, i32 0), i32 %4)
  %cmp = icmp sgt i32 %4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.7, i32 0, i32 0))
  %5 = load i32*, i32** @example, align 4, !tbaa !6
  %6 = load i32, i32* @exampleLen, align 4, !tbaa !2
  %j.016.i = add nsw i32 %6, -1
  %cmp17.i = icmp sgt i32 %j.016.i, 0
  br i1 %cmp17.i, label %for.body.i, label %reverse.exit

for.body.i:                                       ; preds = %if.then, %for.body.i
  %j.019.i = phi i32 [ %j.0.i, %for.body.i ], [ %j.016.i, %if.then ]
  %i.018.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %if.then ]
  %arrayidx.i = getelementptr inbounds i32, i32* %5, i32 %i.018.i
  %7 = load i32, i32* %arrayidx.i, align 4, !tbaa !2
  %arrayidx1.i = getelementptr inbounds i32, i32* %5, i32 %j.019.i
  %8 = load i32, i32* %arrayidx1.i, align 4, !tbaa !2
  store i32 %8, i32* %arrayidx.i, align 4, !tbaa !2
  store i32 %7, i32* %arrayidx1.i, align 4, !tbaa !2
  %inc.i = add nuw nsw i32 %i.018.i, 1
  %j.0.i = add nsw i32 %j.019.i, -1
  %cmp.i = icmp slt i32 %inc.i, %j.0.i
  br i1 %cmp.i, label %for.body.i, label %reverse.exitthread-pre-split

reverse.exitthread-pre-split:                     ; preds = %for.body.i
  %.pr = load i32, i32* @exampleLen, align 4, !tbaa !2
  br label %reverse.exit

reverse.exit:                                     ; preds = %reverse.exitthread-pre-split, %if.then
  %9 = phi i32 [ %.pr, %reverse.exitthread-pre-split ], [ %6, %if.then ]
  %putchar.i35 = tail call i32 @putchar(i32 91) #5
  %cmp6.i36 = icmp sgt i32 %9, 0
  br i1 %cmp6.i36, label %for.body.i42, label %printArray.exit44

for.body.i42:                                     ; preds = %reverse.exit, %for.body.i42
  %i.07.i37 = phi i32 [ %inc.i40, %for.body.i42 ], [ 0, %reverse.exit ]
  %arrayidx.i38 = getelementptr inbounds i32, i32* %5, i32 %i.07.i37
  %10 = load i32, i32* %arrayidx.i38, align 4, !tbaa !2
  %call1.i39 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %10) #5
  %inc.i40 = add nuw nsw i32 %i.07.i37, 1
  %exitcond.i41 = icmp eq i32 %inc.i40, %9
  br i1 %exitcond.i41, label %printArray.exit44, label %for.body.i42

printArray.exit44:                                ; preds = %for.body.i42, %reverse.exit
  %puts.i43 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.12, i32 0, i32 0)) #5
  br label %if.end

if.end:                                           ; preds = %printArray.exit44, %entry
  %11 = load i32*, i32** @example, align 4, !tbaa !6
  %cmp4 = icmp eq i32* %11, null
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  %12 = bitcast i32* %11 to i8*
  tail call void @free(i8* %12) #5
  store i32* null, i32** @example, align 4, !tbaa !6
  store i32 0, i32* @exampleLen, align 4, !tbaa !2
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then5
  %cmp7 = icmp sgt i32 %num, %nbLimit
  br i1 %cmp7, label %if.else, label %if.then8

if.then8:                                         ; preds = %if.end6
  %add = add nsw i32 %3, 1
  %call9 = tail call i32 @findNonBrauer(i32 %num, i32 %add, i32 %4)
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i32 0, i32 0), i32 %call9)
  %cmp11 = icmp sgt i32 %call9, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.then8
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i32 0, i32 0))
  %13 = load i32*, i32** @example, align 4, !tbaa !6
  %14 = load i32, i32* @exampleLen, align 4, !tbaa !2
  %putchar.i = tail call i32 @putchar(i32 91) #5
  %cmp6.i = icmp sgt i32 %14, 0
  br i1 %cmp6.i, label %for.body.i34, label %printArray.exit

for.body.i34:                                     ; preds = %if.then12, %for.body.i34
  %i.07.i = phi i32 [ %inc.i33, %for.body.i34 ], [ 0, %if.then12 ]
  %arrayidx.i32 = getelementptr inbounds i32, i32* %13, i32 %i.07.i
  %15 = load i32, i32* %arrayidx.i32, align 4, !tbaa !2
  %call1.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %15) #5
  %inc.i33 = add nuw nsw i32 %i.07.i, 1
  %exitcond.i = icmp eq i32 %inc.i33, %14
  br i1 %exitcond.i, label %printArray.exit, label %for.body.i34

printArray.exit:                                  ; preds = %for.body.i34, %if.then12
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.12, i32 0, i32 0)) #5
  br label %if.end14

if.end14:                                         ; preds = %printArray.exit, %if.then8
  %16 = load i32*, i32** @example, align 4, !tbaa !6
  %cmp15 = icmp eq i32* %16, null
  br i1 %cmp15, label %if.end19, label %if.then16

if.then16:                                        ; preds = %if.end14
  %17 = bitcast i32* %16 to i8*
  tail call void @free(i8* %17) #5
  store i32* null, i32** @example, align 4, !tbaa !6
  store i32 0, i32* @exampleLen, align 4, !tbaa !2
  br label %if.end19

if.else:                                          ; preds = %if.end6
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @str.13, i32 0, i32 0))
  br label %if.end19

if.end19:                                         ; preds = %if.end14, %if.then16, %if.else
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #5
  ret void
}

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #2 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @str.14, i32 0, i32 0))
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

attributes #0 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

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
!8 = !{!9}
!9 = distinct !{!9, !10, !"checkSeq: %agg.result"}
!10 = distinct !{!10, !"checkSeq"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"initTryPerm: %agg.result"}
!13 = distinct !{!13, !"initTryPerm"}
!14 = !{!15, !3, i64 0}
!15 = !{!"", !3, i64 0, !3, i64 4}
!16 = !{!15, !3, i64 4}
