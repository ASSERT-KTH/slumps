; ModuleID = 'benchmark4pipeline_c/Banker's_algorithm.c'
source_filename = "benchmark4pipeline_c/Banker's_algorithm.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@.str = private unnamed_addr constant [33 x i8] c"\0AEnter the number of resources: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"\0AEnter the number of processes: \00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"\0AEnter Claim Vector: \00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"\0AEnter Allocated Resource Table: \00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"\0AEnter Maximum Claim table: \00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"\0AThe Claim Vector is: \00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"\09%d\00", align 1
@.str.12 = private unnamed_addr constant [23 x i8] c"\0AAllocated resources: \00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c"\0AAvailable resources: \00", align 1
@.str.14 = private unnamed_addr constant [26 x i8] c"\0AProcess%d is executing.\0A\00", align 1
@.str.15 = private unnamed_addr constant [36 x i8] c"\0AThe processes are in unsafe state.\00", align 1
@.str.16 = private unnamed_addr constant [31 x i8] c"\0AThe process is in safe state.\00", align 1
@.str.17 = private unnamed_addr constant [20 x i8] c"\0AAvailable vector: \00", align 1
@str = private unnamed_addr constant [31 x i8] c"\0AThe Allocated Resource Table:\00", align 1
@str.18 = private unnamed_addr constant [26 x i8] c"\0AThe Maximum Claim Table:\00", align 1

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
entry:
  %curr = alloca [5 x [5 x i32]], align 16
  %max_claim = alloca [5 x [5 x i32]], align 16
  %avl = alloca [5 x i32], align 16
  %alloc = alloca [5 x i32], align 16
  %max_res = alloca [5 x i32], align 16
  %running = alloca [5 x i32], align 16
  %r = alloca i32, align 4
  %p = alloca i32, align 4
  %0 = bitcast [5 x [5 x i32]]* %curr to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %0) #4
  %1 = bitcast [5 x [5 x i32]]* %max_claim to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %1) #4
  %2 = bitcast [5 x i32]* %avl to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %2) #4
  %3 = bitcast [5 x i32]* %alloc to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %3) #4
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 %3, i8 0, i32 20, i1 false)
  %4 = bitcast [5 x i32]* %max_res to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %4) #4
  %5 = bitcast [5 x i32]* %running to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #4
  %6 = bitcast i32* %r to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #4
  %7 = bitcast i32* %p to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #4
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i32 0, i32 0))
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %r) #4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0))
  %call3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %p) #4
  %8 = load i32, i32* %p, align 4, !tbaa !2
  %cmp318 = icmp sgt i32 %8, 0
  br i1 %cmp318, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %count.0320 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %running, i32 0, i32 %count.0320
  store i32 1, i32* %arrayidx, align 4, !tbaa !2
  %inc = add nuw nsw i32 %count.0320, 1
  %cmp = icmp slt i32 %inc, %8
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %count.0.lcssa = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0))
  %9 = load i32, i32* %r, align 4, !tbaa !2
  %cmp7316 = icmp sgt i32 %9, 0
  br i1 %cmp7316, label %for.body8, label %for.end13

for.body8:                                        ; preds = %for.end, %for.body8
  %i.1317 = phi i32 [ %inc12, %for.body8 ], [ 0, %for.end ]
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* %max_res, i32 0, i32 %i.1317
  %call10 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %arrayidx9) #4
  %inc12 = add nuw nsw i32 %i.1317, 1
  %10 = load i32, i32* %r, align 4, !tbaa !2
  %cmp7 = icmp slt i32 %inc12, %10
  br i1 %cmp7, label %for.body8, label %for.end13

for.end13:                                        ; preds = %for.body8, %for.end
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.4, i32 0, i32 0))
  %11 = load i32, i32* %p, align 4, !tbaa !2
  %cmp16313 = icmp sgt i32 %11, 0
  br i1 %cmp16313, label %for.cond18.preheader.preheader, label %for.end29

for.cond18.preheader.preheader:                   ; preds = %for.end13
  %.pre = load i32, i32* %r, align 4, !tbaa !2
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond18.preheader.preheader, %for.inc27
  %12 = phi i32 [ %15, %for.inc27 ], [ %11, %for.cond18.preheader.preheader ]
  %13 = phi i32 [ %16, %for.inc27 ], [ %.pre, %for.cond18.preheader.preheader ]
  %i.2314 = phi i32 [ %inc28, %for.inc27 ], [ 0, %for.cond18.preheader.preheader ]
  %cmp19311 = icmp sgt i32 %13, 0
  br i1 %cmp19311, label %for.body20, label %for.inc27

for.body20:                                       ; preds = %for.cond18.preheader, %for.body20
  %j.0312 = phi i32 [ %inc25, %for.body20 ], [ 0, %for.cond18.preheader ]
  %arrayidx22 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %curr, i32 0, i32 %i.2314, i32 %j.0312
  %call23 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %arrayidx22) #4
  %inc25 = add nuw nsw i32 %j.0312, 1
  %14 = load i32, i32* %r, align 4, !tbaa !2
  %cmp19 = icmp slt i32 %inc25, %14
  br i1 %cmp19, label %for.body20, label %for.inc27.loopexit

for.inc27.loopexit:                               ; preds = %for.body20
  %.pre336 = load i32, i32* %p, align 4, !tbaa !2
  br label %for.inc27

for.inc27:                                        ; preds = %for.inc27.loopexit, %for.cond18.preheader
  %15 = phi i32 [ %.pre336, %for.inc27.loopexit ], [ %12, %for.cond18.preheader ]
  %16 = phi i32 [ %14, %for.inc27.loopexit ], [ %13, %for.cond18.preheader ]
  %inc28 = add nuw nsw i32 %i.2314, 1
  %cmp16 = icmp slt i32 %inc28, %15
  br i1 %cmp16, label %for.cond18.preheader, label %for.end29

for.end29:                                        ; preds = %for.inc27, %for.end13
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  %17 = load i32, i32* %p, align 4, !tbaa !2
  %cmp32308 = icmp sgt i32 %17, 0
  br i1 %cmp32308, label %for.cond34.preheader.preheader, label %for.end45

for.cond34.preheader.preheader:                   ; preds = %for.end29
  %.pre337 = load i32, i32* %r, align 4, !tbaa !2
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.preheader, %for.inc43
  %18 = phi i32 [ %21, %for.inc43 ], [ %17, %for.cond34.preheader.preheader ]
  %19 = phi i32 [ %22, %for.inc43 ], [ %.pre337, %for.cond34.preheader.preheader ]
  %i.3309 = phi i32 [ %inc44, %for.inc43 ], [ 0, %for.cond34.preheader.preheader ]
  %cmp35306 = icmp sgt i32 %19, 0
  br i1 %cmp35306, label %for.body36, label %for.inc43

for.body36:                                       ; preds = %for.cond34.preheader, %for.body36
  %j.1307 = phi i32 [ %inc41, %for.body36 ], [ 0, %for.cond34.preheader ]
  %arrayidx38 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %max_claim, i32 0, i32 %i.3309, i32 %j.1307
  %call39 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* nonnull %arrayidx38) #4
  %inc41 = add nuw nsw i32 %j.1307, 1
  %20 = load i32, i32* %r, align 4, !tbaa !2
  %cmp35 = icmp slt i32 %inc41, %20
  br i1 %cmp35, label %for.body36, label %for.inc43.loopexit

for.inc43.loopexit:                               ; preds = %for.body36
  %.pre338 = load i32, i32* %p, align 4, !tbaa !2
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %for.cond34.preheader
  %21 = phi i32 [ %.pre338, %for.inc43.loopexit ], [ %18, %for.cond34.preheader ]
  %22 = phi i32 [ %20, %for.inc43.loopexit ], [ %19, %for.cond34.preheader ]
  %inc44 = add nuw nsw i32 %i.3309, 1
  %cmp32 = icmp slt i32 %inc44, %21
  br i1 %cmp32, label %for.cond34.preheader, label %for.end45

for.end45:                                        ; preds = %for.inc43, %for.end29
  %call46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i32 0, i32 0))
  %23 = load i32, i32* %r, align 4, !tbaa !2
  %cmp48304 = icmp sgt i32 %23, 0
  br i1 %cmp48304, label %for.body49, label %for.end54

for.body49:                                       ; preds = %for.end45, %for.body49
  %i.4305 = phi i32 [ %inc53, %for.body49 ], [ 0, %for.end45 ]
  %arrayidx50 = getelementptr inbounds [5 x i32], [5 x i32]* %max_res, i32 0, i32 %i.4305
  %24 = load i32, i32* %arrayidx50, align 4, !tbaa !2
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %24)
  %inc53 = add nuw nsw i32 %i.4305, 1
  %25 = load i32, i32* %r, align 4, !tbaa !2
  %cmp48 = icmp slt i32 %inc53, %25
  br i1 %cmp48, label %for.body49, label %for.end54

for.end54:                                        ; preds = %for.body49, %for.end45
  %puts = call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @str, i32 0, i32 0))
  %26 = load i32, i32* %p, align 4, !tbaa !2
  %cmp57301 = icmp sgt i32 %26, 0
  br i1 %cmp57301, label %for.cond59.preheader, label %for.end71

for.cond59.preheader:                             ; preds = %for.end54, %for.end67
  %i.5302 = phi i32 [ %inc70, %for.end67 ], [ 0, %for.end54 ]
  %27 = load i32, i32* %r, align 4, !tbaa !2
  %cmp60299 = icmp sgt i32 %27, 0
  br i1 %cmp60299, label %for.body61, label %for.end67

for.body61:                                       ; preds = %for.cond59.preheader, %for.body61
  %j.2300 = phi i32 [ %inc66, %for.body61 ], [ 0, %for.cond59.preheader ]
  %arrayidx63 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %curr, i32 0, i32 %i.5302, i32 %j.2300
  %28 = load i32, i32* %arrayidx63, align 4, !tbaa !2
  %call64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 %28)
  %inc66 = add nuw nsw i32 %j.2300, 1
  %29 = load i32, i32* %r, align 4, !tbaa !2
  %cmp60 = icmp slt i32 %inc66, %29
  br i1 %cmp60, label %for.body61, label %for.end67

for.end67:                                        ; preds = %for.body61, %for.cond59.preheader
  %putchar263 = call i32 @putchar(i32 10)
  %inc70 = add nuw nsw i32 %i.5302, 1
  %30 = load i32, i32* %p, align 4, !tbaa !2
  %cmp57 = icmp slt i32 %inc70, %30
  br i1 %cmp57, label %for.cond59.preheader, label %for.end71

for.end71:                                        ; preds = %for.end67, %for.end54
  %puts261 = call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.18, i32 0, i32 0))
  %31 = load i32, i32* %p, align 4, !tbaa !2
  %cmp74295 = icmp sgt i32 %31, 0
  br i1 %cmp74295, label %for.cond76.preheader, label %for.end103

for.cond76.preheader:                             ; preds = %for.end71, %for.end84
  %i.6296 = phi i32 [ %inc87, %for.end84 ], [ 0, %for.end71 ]
  %32 = load i32, i32* %r, align 4, !tbaa !2
  %cmp77293 = icmp sgt i32 %32, 0
  br i1 %cmp77293, label %for.body78, label %for.end84

for.cond89.preheader:                             ; preds = %for.end84
  %cmp90290 = icmp sgt i32 %38, 0
  br i1 %cmp90290, label %for.cond92.preheader.lr.ph, label %for.end103

for.cond92.preheader.lr.ph:                       ; preds = %for.cond89.preheader
  %33 = load i32, i32* %r, align 4
  %cmp93288 = icmp sgt i32 %33, 0
  br i1 %cmp93288, label %for.cond92.preheader.us, label %for.end103

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.lr.ph, %for.cond92.for.inc101_crit_edge.us
  %i.7291.us = phi i32 [ %inc102.us, %for.cond92.for.inc101_crit_edge.us ], [ 0, %for.cond92.preheader.lr.ph ]
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us, %for.cond92.preheader.us
  %j.4289.us = phi i32 [ 0, %for.cond92.preheader.us ], [ %inc99.us, %for.body94.us ]
  %arrayidx96.us = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %curr, i32 0, i32 %i.7291.us, i32 %j.4289.us
  %34 = load i32, i32* %arrayidx96.us, align 4, !tbaa !2
  %arrayidx97.us = getelementptr inbounds [5 x i32], [5 x i32]* %alloc, i32 0, i32 %j.4289.us
  %35 = load i32, i32* %arrayidx97.us, align 4, !tbaa !2
  %add.us = add nsw i32 %35, %34
  store i32 %add.us, i32* %arrayidx97.us, align 4, !tbaa !2
  %inc99.us = add nuw nsw i32 %j.4289.us, 1
  %exitcond333 = icmp eq i32 %inc99.us, %33
  br i1 %exitcond333, label %for.cond92.for.inc101_crit_edge.us, label %for.body94.us

for.cond92.for.inc101_crit_edge.us:               ; preds = %for.body94.us
  %inc102.us = add nuw nsw i32 %i.7291.us, 1
  %exitcond334 = icmp eq i32 %inc102.us, %38
  br i1 %exitcond334, label %for.end103, label %for.cond92.preheader.us

for.body78:                                       ; preds = %for.cond76.preheader, %for.body78
  %j.3294 = phi i32 [ %inc83, %for.body78 ], [ 0, %for.cond76.preheader ]
  %arrayidx80 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %max_claim, i32 0, i32 %i.6296, i32 %j.3294
  %36 = load i32, i32* %arrayidx80, align 4, !tbaa !2
  %call81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 %36)
  %inc83 = add nuw nsw i32 %j.3294, 1
  %37 = load i32, i32* %r, align 4, !tbaa !2
  %cmp77 = icmp slt i32 %inc83, %37
  br i1 %cmp77, label %for.body78, label %for.end84

for.end84:                                        ; preds = %for.body78, %for.cond76.preheader
  %putchar262 = call i32 @putchar(i32 10)
  %inc87 = add nuw nsw i32 %i.6296, 1
  %38 = load i32, i32* %p, align 4, !tbaa !2
  %cmp74 = icmp slt i32 %inc87, %38
  br i1 %cmp74, label %for.cond76.preheader, label %for.cond89.preheader

for.end103:                                       ; preds = %for.cond92.for.inc101_crit_edge.us, %for.end71, %for.cond92.preheader.lr.ph, %for.cond89.preheader
  %call104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i32 0, i32 0))
  %39 = load i32, i32* %r, align 4, !tbaa !2
  %cmp106285 = icmp sgt i32 %39, 0
  br i1 %cmp106285, label %for.body107, label %for.end121

for.cond113.preheader:                            ; preds = %for.body107
  %cmp114283 = icmp sgt i32 %41, 0
  br i1 %cmp114283, label %for.body115, label %for.end121

for.body107:                                      ; preds = %for.end103, %for.body107
  %i.8286 = phi i32 [ %inc111, %for.body107 ], [ 0, %for.end103 ]
  %arrayidx108 = getelementptr inbounds [5 x i32], [5 x i32]* %alloc, i32 0, i32 %i.8286
  %40 = load i32, i32* %arrayidx108, align 4, !tbaa !2
  %call109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %40)
  %inc111 = add nuw nsw i32 %i.8286, 1
  %41 = load i32, i32* %r, align 4, !tbaa !2
  %cmp106 = icmp slt i32 %inc111, %41
  br i1 %cmp106, label %for.body107, label %for.cond113.preheader

for.body115:                                      ; preds = %for.cond113.preheader, %for.body115
  %i.9284 = phi i32 [ %inc120, %for.body115 ], [ 0, %for.cond113.preheader ]
  %arrayidx116 = getelementptr inbounds [5 x i32], [5 x i32]* %max_res, i32 0, i32 %i.9284
  %42 = load i32, i32* %arrayidx116, align 4, !tbaa !2
  %arrayidx117 = getelementptr inbounds [5 x i32], [5 x i32]* %alloc, i32 0, i32 %i.9284
  %43 = load i32, i32* %arrayidx117, align 4, !tbaa !2
  %sub = sub nsw i32 %42, %43
  %arrayidx118 = getelementptr inbounds [5 x i32], [5 x i32]* %avl, i32 0, i32 %i.9284
  store i32 %sub, i32* %arrayidx118, align 4, !tbaa !2
  %inc120 = add nuw nsw i32 %i.9284, 1
  %exitcond = icmp eq i32 %inc120, %41
  br i1 %exitcond, label %for.end121, label %for.body115

for.end121:                                       ; preds = %for.body115, %for.end103, %for.cond113.preheader
  %call122 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.13, i32 0, i32 0))
  %44 = load i32, i32* %r, align 4, !tbaa !2
  %cmp124281 = icmp sgt i32 %44, 0
  br i1 %cmp124281, label %for.body125, label %for.end130

for.body125:                                      ; preds = %for.end121, %for.body125
  %i.10282 = phi i32 [ %inc129, %for.body125 ], [ 0, %for.end121 ]
  %arrayidx126 = getelementptr inbounds [5 x i32], [5 x i32]* %avl, i32 0, i32 %i.10282
  %45 = load i32, i32* %arrayidx126, align 4, !tbaa !2
  %call127 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %45)
  %inc129 = add nuw nsw i32 %i.10282, 1
  %46 = load i32, i32* %r, align 4, !tbaa !2
  %cmp124 = icmp slt i32 %inc129, %46
  br i1 %cmp124, label %for.body125, label %for.end130

for.end130:                                       ; preds = %for.body125, %for.end121
  %putchar = call i32 @putchar(i32 10)
  %cmp132279 = icmp eq i32 %count.0.lcssa, 0
  br i1 %cmp132279, label %while.end, label %for.cond133.preheader

while.cond.loopexit:                              ; preds = %for.body182, %if.then176
  %cmp132 = icmp eq i32 %dec, 0
  br i1 %cmp132, label %while.end, label %for.cond133.preheader

for.cond133.preheader:                            ; preds = %for.end130, %while.cond.loopexit
  %count.1280 = phi i32 [ %dec, %while.cond.loopexit ], [ %count.0.lcssa, %for.end130 ]
  %47 = load i32, i32* %p, align 4, !tbaa !2
  %cmp134272 = icmp sgt i32 %47, 0
  br i1 %cmp134272, label %for.body135.lr.ph, label %if.then172

for.body135.lr.ph:                                ; preds = %for.cond133.preheader
  %48 = load i32, i32* %r, align 4
  %cmp138267 = icmp sgt i32 %48, 0
  br i1 %cmp138267, label %for.body135.us, label %for.body135

for.body135.us:                                   ; preds = %for.body135.lr.ph, %for.inc168.us
  %i.11273.us = phi i32 [ %inc169.us, %for.inc168.us ], [ 0, %for.body135.lr.ph ]
  %arrayidx136.us = getelementptr inbounds [5 x i32], [5 x i32]* %running, i32 0, i32 %i.11273.us
  %49 = load i32, i32* %arrayidx136.us, align 4, !tbaa !2
  %tobool.us = icmp eq i32 %49, 0
  br i1 %tobool.us, label %for.inc168.us, label %for.body139.us

for.cond137.us:                                   ; preds = %for.body139.us
  %cmp138.us = icmp slt i32 %inc149.us, %48
  br i1 %cmp138.us, label %for.body139.us, label %if.then152.critedge

for.body139.us:                                   ; preds = %for.body135.us, %for.cond137.us
  %j.5268.us = phi i32 [ %inc149.us, %for.cond137.us ], [ 0, %for.body135.us ]
  %arrayidx141.us = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %max_claim, i32 0, i32 %i.11273.us, i32 %j.5268.us
  %50 = load i32, i32* %arrayidx141.us, align 4, !tbaa !2
  %arrayidx143.us = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %curr, i32 0, i32 %i.11273.us, i32 %j.5268.us
  %51 = load i32, i32* %arrayidx143.us, align 4, !tbaa !2
  %sub144.us = sub nsw i32 %50, %51
  %arrayidx145.us = getelementptr inbounds [5 x i32], [5 x i32]* %avl, i32 0, i32 %j.5268.us
  %52 = load i32, i32* %arrayidx145.us, align 4, !tbaa !2
  %cmp146.us = icmp sgt i32 %sub144.us, %52
  %inc149.us = add nuw nsw i32 %j.5268.us, 1
  br i1 %cmp146.us, label %for.inc168.us, label %for.cond137.us

for.inc168.us:                                    ; preds = %for.body139.us, %for.body135.us
  %inc169.us = add nuw nsw i32 %i.11273.us, 1
  %cmp134.us = icmp slt i32 %inc169.us, %47
  br i1 %cmp134.us, label %for.body135.us, label %if.then172

for.body135:                                      ; preds = %for.body135.lr.ph, %for.inc168
  %i.11273 = phi i32 [ %inc169, %for.inc168 ], [ 0, %for.body135.lr.ph ]
  %arrayidx136 = getelementptr inbounds [5 x i32], [5 x i32]* %running, i32 0, i32 %i.11273
  %53 = load i32, i32* %arrayidx136, align 4, !tbaa !2
  %tobool = icmp eq i32 %53, 0
  br i1 %tobool, label %for.inc168, label %if.then152.critedge

if.then152.critedge:                              ; preds = %for.body135, %for.cond137.us
  %arrayidx136.lcssa = phi i32* [ %arrayidx136.us, %for.cond137.us ], [ %arrayidx136, %for.body135 ]
  %i.11.lcssa265 = phi i32 [ %i.11273.us, %for.cond137.us ], [ %i.11273, %for.body135 ]
  %add153 = add nuw nsw i32 %i.11.lcssa265, 1
  %call154 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.14, i32 0, i32 0), i32 %add153)
  store i32 0, i32* %arrayidx136.lcssa, align 4, !tbaa !2
  %dec = add nsw i32 %count.1280, -1
  %54 = load i32, i32* %r, align 4, !tbaa !2
  %cmp157275 = icmp sgt i32 %54, 0
  br i1 %cmp157275, label %for.body158, label %if.then176

for.body158:                                      ; preds = %if.then152.critedge, %for.body158
  %j.6276 = phi i32 [ %inc164, %for.body158 ], [ 0, %if.then152.critedge ]
  %arrayidx160 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %curr, i32 0, i32 %i.11.lcssa265, i32 %j.6276
  %55 = load i32, i32* %arrayidx160, align 4, !tbaa !2
  %arrayidx161 = getelementptr inbounds [5 x i32], [5 x i32]* %avl, i32 0, i32 %j.6276
  %56 = load i32, i32* %arrayidx161, align 4, !tbaa !2
  %add162 = add nsw i32 %56, %55
  store i32 %add162, i32* %arrayidx161, align 4, !tbaa !2
  %inc164 = add nuw nsw i32 %j.6276, 1
  %cmp157 = icmp slt i32 %inc164, %54
  br i1 %cmp157, label %for.body158, label %if.then176

for.inc168:                                       ; preds = %for.body135
  %inc169 = add nuw nsw i32 %i.11273, 1
  %cmp134 = icmp slt i32 %inc169, %47
  br i1 %cmp134, label %for.body135, label %if.then172

if.then172:                                       ; preds = %for.cond133.preheader, %for.inc168, %for.inc168.us
  %call173 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.15, i32 0, i32 0))
  br label %while.end

if.then176:                                       ; preds = %for.body158, %if.then152.critedge
  %call177 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.16, i32 0, i32 0))
  %call179 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.17, i32 0, i32 0))
  %57 = load i32, i32* %r, align 4, !tbaa !2
  %cmp181277 = icmp sgt i32 %57, 0
  br i1 %cmp181277, label %for.body182, label %while.cond.loopexit

for.body182:                                      ; preds = %if.then176, %for.body182
  %i.12278 = phi i32 [ %inc186, %for.body182 ], [ 0, %if.then176 ]
  %arrayidx183 = getelementptr inbounds [5 x i32], [5 x i32]* %avl, i32 0, i32 %i.12278
  %58 = load i32, i32* %arrayidx183, align 4, !tbaa !2
  %call184 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %58)
  %inc186 = add nuw nsw i32 %i.12278, 1
  %59 = load i32, i32* %r, align 4, !tbaa !2
  %cmp181 = icmp slt i32 %inc186, %59
  br i1 %cmp181, label %for.body182, label %while.cond.loopexit

while.end:                                        ; preds = %while.cond.loopexit, %for.end130, %if.then172
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #4
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %4) #4
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %3) #4
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %2) #4
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %1) #4
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %0) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare i32 @__isoc99_scanf(i8*, ...) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #4

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
