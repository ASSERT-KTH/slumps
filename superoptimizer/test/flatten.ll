; ModuleID = '/input/flatten.c'
source_filename = "/input/flatten.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-wasi"

%struct.list_t = type { i32, i32, %struct.list_t** }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"[1], 2, [[3,4], 5], [[[]]], [[[6]]], 7, 8, []\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"Nested: \00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"Flattened: \00", align 1
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @__main_void to i8*)], section "llvm.metadata"

@__main_void = alias i32 (), i32 ()* @main

; Function Attrs: nofree nounwind
define hidden noalias %struct.list_t* @new_list() local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i32 12)
  %0 = bitcast i8* %call to %struct.list_t*
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 1
  store i32 0, i32* %ival, align 4, !tbaa !2
  %is_list = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 0
  store i32 1, i32* %is_list, align 4, !tbaa !8
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 2
  store %struct.list_t** null, %struct.list_t*** %lst, align 4, !tbaa !9
  ret %struct.list_t* %0
}

; Function Attrs: nofree nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #1

; Function Attrs: nounwind
define hidden void @append(%struct.list_t* nocapture %parent, %struct.list_t* %child) local_unnamed_addr #2 {
entry:
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %parent, i32 0, i32 2
  %0 = load %struct.list_t**, %struct.list_t*** %lst, align 4, !tbaa !9
  %1 = bitcast %struct.list_t** %0 to i8*
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %parent, i32 0, i32 1
  %2 = load i32, i32* %ival, align 4, !tbaa !2
  %add = add nsw i32 %2, 1
  %mul = mul i32 4, %add
  %call = tail call i8* @realloc(i8* %1, i32 %mul)
  %3 = bitcast i8* %call to %struct.list_t**
  store %struct.list_t** %3, %struct.list_t*** %lst, align 4, !tbaa !9
  %4 = load i32, i32* %ival, align 4, !tbaa !2
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %ival, align 4, !tbaa !2
  %arrayidx = getelementptr inbounds %struct.list_t*, %struct.list_t** %3, i32 %4
  store %struct.list_t* %child, %struct.list_t** %arrayidx, align 4, !tbaa !10
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i32) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden %struct.list_t* @from_string(i8* %s, i8** %e, %struct.list_t* %parent) local_unnamed_addr #2 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4, !tbaa !10
  %tobool = icmp ne %struct.list_t* %parent, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call.i = tail call noalias i8* @malloc(i32 12) #5
  %0 = bitcast i8* %call.i to %struct.list_t*
  %ival.i = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 1
  store i32 0, i32* %ival.i, align 4, !tbaa !2
  %is_list.i = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 0
  store i32 1, i32* %is_list.i, align 4, !tbaa !8
  %lst.i = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 2
  store %struct.list_t** null, %struct.list_t*** %lst.i, align 4, !tbaa !9
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %parent.addr.0 = phi %struct.list_t* [ %parent, %entry ], [ %0, %if.then ]
  %1 = load i8, i8* %s, align 1, !tbaa !11
  %conv66 = sext i8 %1 to i32
  %cmp67 = icmp ne i32 %conv66, 0
  br i1 %cmp67, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end
  %lst.i54 = getelementptr inbounds %struct.list_t, %struct.list_t* %parent.addr.0, i32 0, i32 2
  %ival.i55 = getelementptr inbounds %struct.list_t, %struct.list_t* %parent.addr.0, i32 0, i32 1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.cond.backedge
  %conv68 = phi i32 [ %conv66, %while.body.lr.ph ], [ %conv, %while.cond.backedge ]
  %2 = phi i8* [ %s, %while.body.lr.ph ], [ %10, %while.cond.backedge ]
  %cmp3 = icmp eq i32 %conv68, 93
  br i1 %cmp3, label %if.then5, label %if.end9

if.then5:                                         ; preds = %while.body
  %tobool6 = icmp ne i8** %e, null
  br i1 %tobool6, label %if.then7, label %cleanup

if.then7:                                         ; preds = %if.then5
  %add.ptr = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %add.ptr, i8** %e, align 4, !tbaa !10
  br label %cleanup

if.end9:                                          ; preds = %while.body
  %cmp11 = icmp eq i32 %conv68, 91
  br i1 %cmp11, label %if.then13, label %if.end17

if.then13:                                        ; preds = %if.end9
  %call.i47 = call noalias i8* @malloc(i32 12) #5
  %3 = bitcast i8* %call.i47 to %struct.list_t*
  %ival.i48 = getelementptr inbounds %struct.list_t, %struct.list_t* %3, i32 0, i32 1
  %is_list.i49 = getelementptr inbounds %struct.list_t, %struct.list_t* %3, i32 0, i32 0
  %lst.i50 = getelementptr inbounds %struct.list_t, %struct.list_t* %3, i32 0, i32 2
  store %struct.list_t** null, %struct.list_t*** %lst.i50, align 4, !tbaa !9
  store i32 1, i32* %is_list.i49, align 4, !tbaa !8
  store i32 0, i32* %ival.i48, align 4, !tbaa !2
  %4 = load %struct.list_t**, %struct.list_t*** %lst.i54, align 4, !tbaa !9
  %5 = bitcast %struct.list_t** %4 to i8*
  %6 = load i32, i32* %ival.i55, align 4, !tbaa !2
  %add.i = add nsw i32 %6, 1
  %mul.i = mul i32 4, %add.i
  %call.i53 = call i8* @realloc(i8* %5, i32 %mul.i) #5
  %7 = bitcast i8* %call.i53 to %struct.list_t**
  store %struct.list_t** %7, %struct.list_t*** %lst.i54, align 4, !tbaa !9
  %8 = load i32, i32* %ival.i55, align 4, !tbaa !2
  %inc.i = add nsw i32 %8, 1
  store i32 %inc.i, i32* %ival.i55, align 4, !tbaa !2
  %arrayidx.i = getelementptr inbounds %struct.list_t*, %struct.list_t** %7, i32 %8
  store %struct.list_t* %3, %struct.list_t** %arrayidx.i, align 4, !tbaa !10
  %9 = load i8*, i8** %s.addr, align 4, !tbaa !10
  %add.ptr15 = getelementptr inbounds i8, i8* %9, i32 1
  %call16 = call %struct.list_t* @from_string(i8* nonnull %add.ptr15, i8** nonnull %s.addr, %struct.list_t* %3)
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %if.then13, %if.then24, %if.end29
  %10 = load i8*, i8** %s.addr, align 4, !tbaa !10
  %11 = load i8, i8* %10, align 1, !tbaa !11
  %conv = sext i8 %11 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.end.loopexit

if.end17:                                         ; preds = %if.end9
  %cmp19 = icmp sge i32 %conv68, 48
  br i1 %cmp19, label %land.lhs.true, label %if.end29

land.lhs.true:                                    ; preds = %if.end17
  %cmp22 = icmp sle i32 %conv68, 57
  br i1 %cmp22, label %if.then24, label %if.end29

if.then24:                                        ; preds = %land.lhs.true
  %call.i61 = call noalias i8* @malloc(i32 12) #5
  %12 = bitcast i8* %call.i61 to %struct.list_t*
  %ival.i62 = getelementptr inbounds %struct.list_t, %struct.list_t* %12, i32 0, i32 1
  store i32 0, i32* %ival.i62, align 4, !tbaa !2
  %is_list.i63 = getelementptr inbounds %struct.list_t, %struct.list_t* %12, i32 0, i32 0
  %lst.i64 = getelementptr inbounds %struct.list_t, %struct.list_t* %12, i32 0, i32 2
  store %struct.list_t** null, %struct.list_t*** %lst.i64, align 4, !tbaa !9
  store i32 0, i32* %is_list.i63, align 4, !tbaa !8
  %call27 = call i32 @strtol(i8* %2, i8** nonnull %s.addr, i32 10)
  store i32 %call27, i32* %ival.i62, align 4, !tbaa !2
  %13 = load %struct.list_t**, %struct.list_t*** %lst.i54, align 4, !tbaa !9
  %14 = bitcast %struct.list_t** %13 to i8*
  %15 = load i32, i32* %ival.i55, align 4, !tbaa !2
  %add.i56 = add nsw i32 %15, 1
  %mul.i57 = mul i32 4, %add.i56
  %call.i58 = call i8* @realloc(i8* %14, i32 %mul.i57) #5
  %16 = bitcast i8* %call.i58 to %struct.list_t**
  store %struct.list_t** %16, %struct.list_t*** %lst.i54, align 4, !tbaa !9
  %17 = load i32, i32* %ival.i55, align 4, !tbaa !2
  %inc.i59 = add nsw i32 %17, 1
  store i32 %inc.i59, i32* %ival.i55, align 4, !tbaa !2
  %arrayidx.i60 = getelementptr inbounds %struct.list_t*, %struct.list_t** %16, i32 %17
  store %struct.list_t* %12, %struct.list_t** %arrayidx.i60, align 4, !tbaa !10
  br label %while.cond.backedge

if.end29:                                         ; preds = %land.lhs.true, %if.end17
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %incdec.ptr, i8** %s.addr, align 4, !tbaa !10
  br label %while.cond.backedge

while.end.loopexit:                               ; preds = %while.cond.backedge
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.end
  %.lcssa = phi i8* [ %s, %if.end ], [ %10, %while.end.loopexit ]
  %tobool30 = icmp ne i8** %e, null
  br i1 %tobool30, label %if.then31, label %cleanup

if.then31:                                        ; preds = %while.end
  store i8* %.lcssa, i8** %e, align 4, !tbaa !10
  br label %cleanup

cleanup:                                          ; preds = %while.end, %if.then31, %if.then5, %if.then7
  ret %struct.list_t* %parent.addr.0
}

; Function Attrs: nofree nounwind
declare i32 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #1

; Function Attrs: nofree nounwind
define hidden void @show_list(%struct.list_t* readonly %l) local_unnamed_addr #0 {
entry:
  %tobool = icmp ne %struct.list_t* %l, null
  br i1 %tobool, label %if.end, label %cleanup.cont

if.end:                                           ; preds = %entry
  %is_list = getelementptr inbounds %struct.list_t, %struct.list_t* %l, i32 0, i32 0
  %0 = load i32, i32* %is_list, align 4, !tbaa !8
  %tobool1 = icmp ne i32 %0, 0
  br i1 %tobool1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %l, i32 0, i32 1
  %1 = load i32, i32* %ival, align 4, !tbaa !2
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i32 %1)
  br label %cleanup.cont

if.end3:                                          ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  %ival5 = getelementptr inbounds %struct.list_t, %struct.list_t* %l, i32 0, i32 1
  %2 = load i32, i32* %ival5, align 4, !tbaa !2
  %cmp21 = icmp slt i32 0, %2
  br i1 %cmp21, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.end3
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %l, i32 0, i32 2
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %i.022 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  %3 = load %struct.list_t**, %struct.list_t*** %lst, align 4, !tbaa !9
  %arrayidx = getelementptr inbounds %struct.list_t*, %struct.list_t** %3, i32 %i.022
  %4 = load %struct.list_t*, %struct.list_t** %arrayidx, align 4, !tbaa !10
  tail call void @show_list(%struct.list_t* %4)
  %5 = load i32, i32* %ival5, align 4, !tbaa !2
  %sub = sub nsw i32 %5, 1
  %cmp7 = icmp slt i32 %i.022, %sub
  br i1 %cmp7, label %if.then8, label %for.inc

if.then8:                                         ; preds = %for.body
  %call9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  %.pre = load i32, i32* %ival5, align 4, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then8
  %6 = phi i32 [ %5, %for.body ], [ %.pre, %if.then8 ]
  %inc = add nuw nsw i32 %i.022, 1
  %cmp = icmp slt i32 %inc, %6
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.end3
  %call11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  br label %cleanup.cont

cleanup.cont:                                     ; preds = %if.then2, %for.end, %entry
  ret void
}

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
define hidden %struct.list_t* @flatten(%struct.list_t* nocapture readonly %from, %struct.list_t* %to) local_unnamed_addr #2 {
entry:
  %tobool = icmp ne %struct.list_t* %to, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call.i = tail call noalias i8* @malloc(i32 12) #5
  %0 = bitcast i8* %call.i to %struct.list_t*
  %ival.i = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 1
  store i32 0, i32* %ival.i, align 4, !tbaa !2
  %is_list.i = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 0
  store i32 1, i32* %is_list.i, align 4, !tbaa !8
  %lst.i = getelementptr inbounds %struct.list_t, %struct.list_t* %0, i32 0, i32 2
  store %struct.list_t** null, %struct.list_t*** %lst.i, align 4, !tbaa !9
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %to.addr.0 = phi %struct.list_t* [ %to, %entry ], [ %0, %if.then ]
  %is_list = getelementptr inbounds %struct.list_t, %struct.list_t* %from, i32 0, i32 0
  %1 = load i32, i32* %is_list, align 4, !tbaa !8
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.else, label %if.then2

if.then2:                                         ; preds = %if.end
  %call.i17 = tail call noalias i8* @malloc(i32 12) #5
  %2 = bitcast i8* %call.i17 to %struct.list_t*
  %3 = bitcast %struct.list_t* %2 to i8*
  %4 = bitcast %struct.list_t* %from to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %3, i8* align 4 %4, i32 12, i1 false), !tbaa.struct !12
  %lst.i21 = getelementptr inbounds %struct.list_t, %struct.list_t* %to.addr.0, i32 0, i32 2
  %5 = load %struct.list_t**, %struct.list_t*** %lst.i21, align 4, !tbaa !9
  %6 = bitcast %struct.list_t** %5 to i8*
  %ival.i22 = getelementptr inbounds %struct.list_t, %struct.list_t* %to.addr.0, i32 0, i32 1
  %7 = load i32, i32* %ival.i22, align 4, !tbaa !2
  %add.i = add nsw i32 %7, 1
  %mul.i = mul i32 4, %add.i
  %call.i23 = tail call i8* @realloc(i8* %6, i32 %mul.i) #5
  %8 = bitcast i8* %call.i23 to %struct.list_t**
  store %struct.list_t** %8, %struct.list_t*** %lst.i21, align 4, !tbaa !9
  %9 = load i32, i32* %ival.i22, align 4, !tbaa !2
  %inc.i = add nsw i32 %9, 1
  store i32 %inc.i, i32* %ival.i22, align 4, !tbaa !2
  %arrayidx.i = getelementptr inbounds %struct.list_t*, %struct.list_t** %8, i32 %9
  store %struct.list_t* %2, %struct.list_t** %arrayidx.i, align 4, !tbaa !10
  br label %if.end5

if.else:                                          ; preds = %if.end
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %from, i32 0, i32 1
  %10 = load i32, i32* %ival, align 4, !tbaa !2
  %cmp24 = icmp slt i32 0, %10
  br i1 %cmp24, label %for.inc.lr.ph, label %if.end5

for.inc.lr.ph:                                    ; preds = %if.else
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %from, i32 0, i32 2
  br label %for.inc

for.inc:                                          ; preds = %for.inc.lr.ph, %for.inc
  %i.025 = phi i32 [ 0, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %11 = load %struct.list_t**, %struct.list_t*** %lst, align 4, !tbaa !9
  %arrayidx = getelementptr inbounds %struct.list_t*, %struct.list_t** %11, i32 %i.025
  %12 = load %struct.list_t*, %struct.list_t** %arrayidx, align 4, !tbaa !10
  %call4 = tail call %struct.list_t* @flatten(%struct.list_t* %12, %struct.list_t* %to.addr.0)
  %inc = add nuw nsw i32 %i.025, 1
  %13 = load i32, i32* %ival, align 4, !tbaa !2
  %cmp = icmp slt i32 %inc, %13
  br i1 %cmp, label %for.inc, label %if.end5.loopexit

if.end5.loopexit:                                 ; preds = %for.inc
  br label %if.end5

if.end5:                                          ; preds = %if.end5.loopexit, %if.else, %if.then2
  ret %struct.list_t* %to.addr.0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #4

; Function Attrs: nounwind
define hidden void @delete_list(%struct.list_t* %l) local_unnamed_addr #2 {
entry:
  %tobool = icmp ne %struct.list_t* %l, null
  br i1 %tobool, label %if.end, label %cleanup.cont

if.end:                                           ; preds = %entry
  %is_list = getelementptr inbounds %struct.list_t, %struct.list_t* %l, i32 0, i32 0
  %0 = load i32, i32* %is_list, align 4, !tbaa !8
  %tobool1 = icmp ne i32 %0, 0
  br i1 %tobool1, label %land.lhs.true, label %if.end6

land.lhs.true:                                    ; preds = %if.end
  %ival = getelementptr inbounds %struct.list_t, %struct.list_t* %l, i32 0, i32 1
  %1 = load i32, i32* %ival, align 4, !tbaa !2
  %tobool2 = icmp ne i32 %1, 0
  br i1 %tobool2, label %if.then3, label %if.end6

if.then3:                                         ; preds = %land.lhs.true
  %cmp16 = icmp slt i32 0, %1
  br i1 %cmp16, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %if.then3
  %lst = getelementptr inbounds %struct.list_t, %struct.list_t* %l, i32 0, i32 2
  br label %for.inc

for.inc:                                          ; preds = %for.inc.lr.ph, %for.inc
  %i.017 = phi i32 [ 0, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %2 = load %struct.list_t**, %struct.list_t*** %lst, align 4, !tbaa !9
  %arrayidx = getelementptr inbounds %struct.list_t*, %struct.list_t** %2, i32 %i.017
  %3 = load %struct.list_t*, %struct.list_t** %arrayidx, align 4, !tbaa !10
  tail call void @delete_list(%struct.list_t* %3)
  %inc = add nuw nsw i32 %i.017, 1
  %4 = load i32, i32* %ival, align 4, !tbaa !2
  %cmp = icmp slt i32 %inc, %4
  br i1 %cmp, label %for.inc, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.then3
  %lst5 = getelementptr inbounds %struct.list_t, %struct.list_t* %l, i32 0, i32 2
  %5 = load %struct.list_t**, %struct.list_t*** %lst5, align 4, !tbaa !9
  %6 = bitcast %struct.list_t** %5 to i8*
  tail call void @free(i8* %6)
  br label %if.end6

if.end6:                                          ; preds = %for.end, %land.lhs.true, %if.end
  %7 = bitcast %struct.list_t* %l to i8*
  tail call void @free(i8* %7)
  br label %cleanup.cont

cleanup.cont:                                     ; preds = %if.end6, %entry
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden i32 @main() #2 {
entry:
  %call = tail call %struct.list_t* @from_string(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i32 0, i32 0), i8** null, %struct.list_t* null)
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0))
  tail call void @show_list(%struct.list_t* %call)
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  %call3 = tail call %struct.list_t* @flatten(%struct.list_t* %call, %struct.list_t* null)
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0))
  tail call void @show_list(%struct.list_t* %call3)
  ret i32 0
}

attributes #0 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (https://github.com/Jacarte/llvm-project.git 0f6dea67136cc1e0b3d200eb2bb165628970c44b)"}
!2 = !{!3, !4, i64 4}
!3 = !{!"list_t", !4, i64 0, !4, i64 4, !7, i64 8}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"any pointer", !5, i64 0}
!8 = !{!3, !4, i64 0}
!9 = !{!3, !7, i64 8}
!10 = !{!7, !7, i64 0}
!11 = !{!5, !5, i64 0}
!12 = !{i64 0, i64 4, !13, i64 4, i64 4, !13, i64 8, i64 4, !10}
!13 = !{!4, !4, i64 0}
