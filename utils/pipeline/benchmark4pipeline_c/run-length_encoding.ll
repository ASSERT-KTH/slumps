; ModuleID = 'benchmark4pipeline_c/run-length_encoding.c'
source_filename = "benchmark4pipeline_c/run-length_encoding.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.string_stream = type { i32 (%struct.stream_t*)*, i32 (%struct.stream_t*, i32)*, i8*, i32 }
%struct.stream_t = type { {}*, i32 (%struct.stream_t*, i32)* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.file_stream = type { i32 (%struct.stream_t*)*, i32 (%struct.stream_t*, i32)*, %struct._IO_FILE* }

@.str = private unnamed_addr constant [68 x i8] c"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW\00", align 1
@__const.main.str_in = private unnamed_addr constant %struct.string_stream { i32 (%struct.stream_t*)* @sget, i32 (%struct.stream_t*, i32)* null, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str, i32 0, i32 0), i32 0 }, align 4
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 4

; Function Attrs: norecurse nounwind
define hidden i32 @sget(%struct.stream_t* nocapture %in) #0 {
entry:
  %string = getelementptr inbounds %struct.stream_t, %struct.stream_t* %in, i32 1
  %0 = bitcast %struct.stream_t* %string to i8**
  %1 = load i8*, i8** %0, align 4, !tbaa !2
  %pos = getelementptr inbounds %struct.stream_t, %struct.stream_t* %in, i32 1, i32 1
  %2 = bitcast i32 (%struct.stream_t*, i32)** %pos to i32*
  %3 = load i32, i32* %2, align 4, !tbaa !8
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %3
  %4 = load i8, i8* %arrayidx, align 1, !tbaa !9
  %cmp = icmp eq i8 %4, 0
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %conv = zext i8 %4 to i32
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %2, align 4, !tbaa !8
  br label %cleanup

cleanup:                                          ; preds = %entry, %if.end
  %retval.0 = phi i32 [ %conv, %if.end ], [ -1, %entry ]
  ret i32 %retval.0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind
define hidden i32 @sput(%struct.stream_t* nocapture %out, i32 %c) #0 {
entry:
  %cmp = icmp eq i32 %c, -1
  %cond = select i1 %cmp, i32 0, i32 %c
  %conv = trunc i32 %cond to i8
  %string = getelementptr inbounds %struct.stream_t, %struct.stream_t* %out, i32 1
  %0 = bitcast %struct.stream_t* %string to i8**
  %1 = load i8*, i8** %0, align 4, !tbaa !2
  %pos = getelementptr inbounds %struct.stream_t, %struct.stream_t* %out, i32 1, i32 1
  %2 = bitcast i32 (%struct.stream_t*, i32)** %pos to i32*
  %3 = load i32, i32* %2, align 4, !tbaa !8
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %2, align 4, !tbaa !8
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %3
  store i8 %conv, i8* %arrayidx, align 1, !tbaa !9
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %2, align 4, !tbaa !8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

; Function Attrs: nounwind
define hidden i32 @file_put(%struct.stream_t* nocapture readonly %out, i32 %c) #2 {
entry:
  %fp = getelementptr inbounds %struct.stream_t, %struct.stream_t* %out, i32 1
  %0 = bitcast %struct.stream_t* %fp to %struct._IO_FILE**
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %0, align 4, !tbaa !10
  %call = tail call i32 @fputc(i32 %c, %struct._IO_FILE* %1)
  ret i32 %call
}

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden void @output(%struct.stream_t* %out, i8* nocapture readonly %buf, i32 %len) local_unnamed_addr #2 {
entry:
  %put = getelementptr inbounds %struct.stream_t, %struct.stream_t* %out, i32 0, i32 1
  %0 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put, align 4, !tbaa !12
  %add = add nsw i32 %len, 128
  %call = tail call i32 %0(%struct.stream_t* %out, i32 %add) #4
  %cmp10 = icmp sgt i32 %len, 0
  br i1 %cmp10, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %i.011 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %1 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put, align 4, !tbaa !12
  %arrayidx = getelementptr inbounds i8, i8* %buf, i32 %i.011
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !9
  %conv = zext i8 %2 to i32
  %call2 = tail call i32 %1(%struct.stream_t* nonnull %out, i32 %conv) #4
  %inc = add nuw nsw i32 %i.011, 1
  %exitcond = icmp eq i32 %inc, %len
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind
define hidden void @encode(%struct.stream_t* %in, %struct.stream_t* %out) local_unnamed_addr #2 {
entry:
  %buf = alloca [256 x i8], align 16
  %0 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %0) #4
  %get2 = bitcast %struct.stream_t* %in to i32 (%struct.stream_t*)**
  %1 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %get2, align 4, !tbaa !14
  %put3 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %out, i32 0, i32 1
  %2 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put3, align 4, !tbaa !12
  %arrayidx52 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i32 0, i32 1
  br label %while.cond.outer.outer

while.cond.outer.outer:                           ; preds = %while.cond.outer.outer.backedge, %entry
  %end.0.ph.ph = phi i32 [ 0, %entry ], [ %conv.le, %while.cond.outer.outer.backedge ]
  %repeat.0.ph.ph = phi i32 [ 0, %entry ], [ %repeat.0.ph.ph.be, %while.cond.outer.outer.backedge ]
  %len.0.ph.ph = phi i32 [ 0, %entry ], [ %len.0.ph.ph.be, %while.cond.outer.outer.backedge ]
  %tobool10 = icmp eq i32 %repeat.0.ph.ph, 0
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %while.cond.outer.outer, %if.then11
  %end.0.ph = phi i32 [ %conv.le, %if.then11 ], [ %end.0.ph.ph, %while.cond.outer.outer ]
  %len.0.ph = phi i32 [ %len.1, %if.then11 ], [ %len.0.ph.ph, %while.cond.outer.outer ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %if.then
  %end.0 = phi i32 [ 0, %if.then ], [ %end.0.ph, %while.cond.outer ]
  %len.0 = phi i32 [ %inc, %if.then ], [ %len.0.ph, %while.cond.outer ]
  %tobool = icmp eq i32 %end.0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = tail call i32 %1(%struct.stream_t* %in) #4
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.end9, label %if.then

if.then:                                          ; preds = %while.body
  %conv5 = trunc i32 %call to i8
  %inc = add nsw i32 %len.0, 1
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i32 0, i32 %len.0
  store i8 %conv5, i8* %arrayidx, align 1, !tbaa !9
  %cmp6 = icmp slt i32 %inc, 2
  br i1 %cmp6, label %while.cond, label %if.end9

if.end9:                                          ; preds = %while.body, %if.then
  %cmp.lcssa = phi i1 [ false, %if.then ], [ true, %while.body ]
  %len.1 = phi i32 [ %inc, %if.then ], [ %len.0, %while.body ]
  %conv.le = zext i1 %cmp.lcssa to i32
  %sub = add nsw i32 %len.1, -1
  %arrayidx12 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i32 0, i32 %sub
  %3 = load i8, i8* %arrayidx12, align 1, !tbaa !9
  %sub14 = add nsw i32 %len.1, -2
  %arrayidx15 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i32 0, i32 %sub14
  %4 = load i8, i8* %arrayidx15, align 1, !tbaa !9
  %cmp43 = icmp eq i8 %3, %4
  br i1 %tobool10, label %if.else, label %if.then11

if.then11:                                        ; preds = %if.end9
  %spec.select = select i1 %cmp43, i32 %repeat.0.ph.ph, i32 0
  %tobool21 = icmp eq i32 %spec.select, 0
  %cmp22 = icmp eq i32 %len.1, 129
  %or.cond = or i1 %cmp22, %tobool21
  %or.cond65 = or i1 %cmp.lcssa, %or.cond
  br i1 %or.cond65, label %if.then26, label %while.cond.outer

if.then26:                                        ; preds = %if.then11
  %cond = select i1 %cmp.lcssa, i32 %len.1, i32 %sub
  %call29 = tail call i32 %2(%struct.stream_t* %out, i32 %cond) #4
  %5 = load i8, i8* %0, align 16, !tbaa !9
  %conv31 = zext i8 %5 to i32
  %call32 = tail call i32 %2(%struct.stream_t* %out, i32 %conv31) #4
  store i8 %3, i8* %0, align 16, !tbaa !9
  br label %while.cond.outer.outer.backedge

while.cond.outer.outer.backedge:                  ; preds = %for.body.i107, %if.then26, %if.end55, %if.then60, %if.then45, %output.exit
  %repeat.0.ph.ph.be = phi i32 [ 1, %output.exit ], [ 1, %if.then45 ], [ 0, %if.then60 ], [ 0, %if.end55 ], [ %spec.select, %if.then26 ], [ 0, %for.body.i107 ]
  %len.0.ph.ph.be = phi i32 [ 2, %output.exit ], [ %len.1, %if.then45 ], [ 0, %if.then60 ], [ %len.1, %if.end55 ], [ 1, %if.then26 ], [ 0, %for.body.i107 ]
  br label %while.cond.outer.outer

if.else:                                          ; preds = %if.end9
  br i1 %cmp43, label %if.then45, label %if.end55

if.then45:                                        ; preds = %if.else
  %cmp46 = icmp sgt i32 %len.1, 2
  br i1 %cmp46, label %if.then48, label %while.cond.outer.outer.backedge

if.then48:                                        ; preds = %if.then45
  %6 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put3, align 4, !tbaa !12
  %add.i = add nsw i32 %len.1, 126
  %call.i = tail call i32 %6(%struct.stream_t* %out, i32 %add.i) #4
  %cmp10.i = icmp sgt i32 %sub14, 0
  br i1 %cmp10.i, label %for.body.i, label %output.exit

for.body.i:                                       ; preds = %if.then48, %for.body.i
  %i.011.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %if.then48 ]
  %7 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put3, align 4, !tbaa !12
  %arrayidx.i = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i32 0, i32 %i.011.i
  %8 = load i8, i8* %arrayidx.i, align 1, !tbaa !9
  %conv.i = zext i8 %8 to i32
  %call2.i = tail call i32 %7(%struct.stream_t* nonnull %out, i32 %conv.i) #4
  %inc.i = add nuw nsw i32 %i.011.i, 1
  %exitcond.i = icmp eq i32 %inc.i, %sub14
  br i1 %exitcond.i, label %output.exit, label %for.body.i

output.exit:                                      ; preds = %for.body.i, %if.then48
  store i8 %3, i8* %arrayidx52, align 1, !tbaa !9
  store i8 %3, i8* %0, align 16, !tbaa !9
  br label %while.cond.outer.outer.backedge

if.end55:                                         ; preds = %if.else
  %cmp56 = icmp eq i32 %len.1, 128
  %or.cond66 = or i1 %cmp.lcssa, %cmp56
  br i1 %or.cond66, label %if.then60, label %while.cond.outer.outer.backedge

if.then60:                                        ; preds = %if.end55
  %9 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put3, align 4, !tbaa !12
  %add.i98 = add nsw i32 %len.1, 128
  %call.i99 = tail call i32 %9(%struct.stream_t* %out, i32 %add.i98) #4
  %cmp10.i100 = icmp sgt i32 %len.1, 0
  br i1 %cmp10.i100, label %for.body.i107, label %while.cond.outer.outer.backedge

for.body.i107:                                    ; preds = %if.then60, %for.body.i107
  %i.011.i101 = phi i32 [ %inc.i105, %for.body.i107 ], [ 0, %if.then60 ]
  %10 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put3, align 4, !tbaa !12
  %arrayidx.i102 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i32 0, i32 %i.011.i101
  %11 = load i8, i8* %arrayidx.i102, align 1, !tbaa !9
  %conv.i103 = zext i8 %11 to i32
  %call2.i104 = tail call i32 %10(%struct.stream_t* nonnull %out, i32 %conv.i103) #4
  %inc.i105 = add nuw nsw i32 %i.011.i101, 1
  %exitcond.i106 = icmp eq i32 %inc.i105, %len.1
  br i1 %exitcond.i106, label %while.cond.outer.outer.backedge, label %for.body.i107

while.end:                                        ; preds = %while.cond
  %call64 = tail call i32 %2(%struct.stream_t* %out, i32 -1) #4
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %0) #4
  ret void
}

; Function Attrs: nounwind
define hidden void @decode(%struct.stream_t* %in, %struct.stream_t* %out) local_unnamed_addr #2 {
entry:
  %get1 = bitcast %struct.stream_t* %in to i32 (%struct.stream_t*)**
  %0 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %get1, align 4, !tbaa !14
  %call44 = tail call i32 %0(%struct.stream_t* %in) #4
  %cmp45 = icmp eq i32 %call44, -1
  br i1 %cmp45, label %if.then, label %if.end.lr.ph

if.end.lr.ph:                                     ; preds = %entry
  %put15 = getelementptr inbounds %struct.stream_t, %struct.stream_t* %out, i32 0, i32 1
  br label %if.end

if.then:                                          ; preds = %if.end20, %entry
  ret void

if.end:                                           ; preds = %if.end.lr.ph, %if.end20
  %call46 = phi i32 [ %call44, %if.end.lr.ph ], [ %call, %if.end20 ]
  %cmp2 = icmp sgt i32 %call46, 128
  br i1 %cmp2, label %for.body.preheader, label %if.else

for.body.preheader:                               ; preds = %if.end
  %sub = add i32 %call46, -128
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %i.043 = phi i32 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %1 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put15, align 4, !tbaa !12
  %2 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %get1, align 4, !tbaa !14
  %call7 = tail call i32 %2(%struct.stream_t* nonnull %in) #4
  %call8 = tail call i32 %1(%struct.stream_t* %out, i32 %call7) #4
  %inc = add nuw nsw i32 %i.043, 1
  %exitcond48 = icmp eq i32 %inc, %sub
  br i1 %exitcond48, label %if.end20, label %for.body

if.else:                                          ; preds = %if.end
  %3 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %get1, align 4, !tbaa !14
  %call11 = tail call i32 %3(%struct.stream_t* nonnull %in) #4
  %cmp1340 = icmp sgt i32 %call46, 0
  br i1 %cmp1340, label %for.body14, label %if.end20

for.body14:                                       ; preds = %if.else, %for.body14
  %i.141 = phi i32 [ %inc18, %for.body14 ], [ 0, %if.else ]
  %4 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put15, align 4, !tbaa !12
  %call16 = tail call i32 %4(%struct.stream_t* %out, i32 %call11) #4
  %inc18 = add nuw nsw i32 %i.141, 1
  %exitcond = icmp eq i32 %inc18, %call46
  br i1 %exitcond, label %if.end20, label %for.body14

if.end20:                                         ; preds = %for.body14, %for.body, %if.else
  %5 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %get1, align 4, !tbaa !14
  %call = tail call i32 %5(%struct.stream_t* %in) #4
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.then, label %if.end
}

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #2 {
entry:
  %buf = alloca [256 x i8], align 16
  %str_in = alloca %struct.string_stream, align 4
  %str_out = alloca %struct.string_stream, align 4
  %file = alloca %struct.file_stream, align 4
  %0 = getelementptr inbounds [256 x i8], [256 x i8]* %buf, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %0) #4
  %1 = bitcast %struct.string_stream* %str_in to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1) #4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 4 %1, i8* align 4 bitcast (%struct.string_stream* @__const.main.str_in to i8*), i32 16, i1 false)
  %2 = bitcast %struct.string_stream* %str_out to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #4
  %get = getelementptr inbounds %struct.string_stream, %struct.string_stream* %str_out, i32 0, i32 0
  store i32 (%struct.stream_t*)* @sget, i32 (%struct.stream_t*)** %get, align 4, !tbaa !15
  %put = getelementptr inbounds %struct.string_stream, %struct.string_stream* %str_out, i32 0, i32 1
  store i32 (%struct.stream_t*, i32)* @sput, i32 (%struct.stream_t*, i32)** %put, align 4, !tbaa !16
  %string = getelementptr inbounds %struct.string_stream, %struct.string_stream* %str_out, i32 0, i32 2
  store i8* %0, i8** %string, align 4, !tbaa !2
  %pos = getelementptr inbounds %struct.string_stream, %struct.string_stream* %str_out, i32 0, i32 3
  store i32 0, i32* %pos, align 4, !tbaa !8
  %3 = bitcast %struct.file_stream* %file to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %3) #4
  %get1 = getelementptr inbounds %struct.file_stream, %struct.file_stream* %file, i32 0, i32 0
  store i32 (%struct.stream_t*)* null, i32 (%struct.stream_t*)** %get1, align 4, !tbaa !17
  %put2 = getelementptr inbounds %struct.file_stream, %struct.file_stream* %file, i32 0, i32 1
  store i32 (%struct.stream_t*, i32)* @file_put, i32 (%struct.stream_t*, i32)** %put2, align 4, !tbaa !18
  %fp = getelementptr inbounds %struct.file_stream, %struct.file_stream* %file, i32 0, i32 2
  %4 = load i32, i32* bitcast (%struct._IO_FILE** @stdout to i32*), align 4, !tbaa !19
  %5 = bitcast %struct._IO_FILE** %fp to i32*
  store i32 %4, i32* %5, align 4, !tbaa !10
  %6 = bitcast %struct.string_stream* %str_in to %struct.stream_t*
  %7 = bitcast %struct.string_stream* %str_out to %struct.stream_t*
  call void @encode(%struct.stream_t* nonnull %6, %struct.stream_t* nonnull %7)
  %8 = bitcast %struct.file_stream* %file to %struct.stream_t*
  %9 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %get, align 4, !tbaa !14
  %call44.i = call i32 %9(%struct.stream_t* nonnull %7) #4
  %cmp45.i = icmp eq i32 %call44.i, -1
  br i1 %cmp45.i, label %decode.exit, label %if.end.i

if.end.i:                                         ; preds = %entry, %if.end20.i
  %call46.i = phi i32 [ %call.i, %if.end20.i ], [ %call44.i, %entry ]
  %cmp2.i = icmp sgt i32 %call46.i, 128
  br i1 %cmp2.i, label %for.body.preheader.i, label %if.else.i

for.body.preheader.i:                             ; preds = %if.end.i
  %sub.i = add i32 %call46.i, -128
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.preheader.i
  %i.043.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %for.body.preheader.i ]
  %10 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put2, align 4, !tbaa !12
  %11 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %get, align 4, !tbaa !14
  %call7.i = call i32 %11(%struct.stream_t* nonnull %7) #4
  %call8.i = call i32 %10(%struct.stream_t* nonnull %8, i32 %call7.i) #4
  %inc.i = add nuw nsw i32 %i.043.i, 1
  %exitcond48.i = icmp eq i32 %inc.i, %sub.i
  br i1 %exitcond48.i, label %if.end20.i, label %for.body.i

if.else.i:                                        ; preds = %if.end.i
  %12 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %get, align 4, !tbaa !14
  %call11.i = call i32 %12(%struct.stream_t* nonnull %7) #4
  %cmp1340.i = icmp sgt i32 %call46.i, 0
  br i1 %cmp1340.i, label %for.body14.i, label %if.end20.i

for.body14.i:                                     ; preds = %if.else.i, %for.body14.i
  %i.141.i = phi i32 [ %inc18.i, %for.body14.i ], [ 0, %if.else.i ]
  %13 = load i32 (%struct.stream_t*, i32)*, i32 (%struct.stream_t*, i32)** %put2, align 4, !tbaa !12
  %call16.i = call i32 %13(%struct.stream_t* nonnull %8, i32 %call11.i) #4
  %inc18.i = add nuw nsw i32 %i.141.i, 1
  %exitcond.i = icmp eq i32 %inc18.i, %call46.i
  br i1 %exitcond.i, label %if.end20.i, label %for.body14.i

if.end20.i:                                       ; preds = %for.body14.i, %for.body.i, %if.else.i
  %14 = load i32 (%struct.stream_t*)*, i32 (%struct.stream_t*)** %get, align 4, !tbaa !14
  %call.i = call i32 %14(%struct.stream_t* nonnull %7) #4
  %cmp.i = icmp eq i32 %call.i, -1
  br i1 %cmp.i, label %decode.exit, label %if.end.i

decode.exit:                                      ; preds = %if.end20.i, %entry
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %3) #4
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #4
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1) #4
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %0) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i1) #1

attributes #0 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !4, i64 8}
!3 = !{!"", !4, i64 0, !4, i64 4, !4, i64 8, !7, i64 12}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!3, !7, i64 12}
!9 = !{!5, !5, i64 0}
!10 = !{!11, !4, i64 8}
!11 = !{!"", !4, i64 0, !4, i64 4, !4, i64 8}
!12 = !{!13, !4, i64 4}
!13 = !{!"stream_t", !4, i64 0, !4, i64 4}
!14 = !{!13, !4, i64 0}
!15 = !{!3, !4, i64 0}
!16 = !{!3, !4, i64 4}
!17 = !{!11, !4, i64 0}
!18 = !{!11, !4, i64 4}
!19 = !{!4, !4, i64 0}
