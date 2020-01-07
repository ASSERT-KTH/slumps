; ModuleID = 'bitwise_IO.opt2.bc'
source_filename = "benchmark4pipeline_c/bitwise_IO.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.bit_io_t = type { %struct._IO_FILE*, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@__const.main.s = private dso_local unnamed_addr constant [12 x i8] c"abcdefghijk\00", align 1
@.str = private dso_local unnamed_addr constant [9 x i8] c"test.bin\00", align 1
@.str.1 = private dso_local unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.2 = private dso_local unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private dso_local unnamed_addr constant [6 x i8] c"%10s\0A\00", align 1

; Function Attrs: nounwind
define dso_local hidden noalias %struct.bit_io_t* @b_attach(%struct._IO_FILE* %f) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i32 12) #3
  %0 = bitcast i8* %call to %struct.bit_io_t*
  %accu = getelementptr inbounds i8, i8* %call, i32 4
  %1 = bitcast i8* %accu to i32*
  store i32 0, i32* %1, align 4, !tbaa !2
  %bits = getelementptr inbounds i8, i8* %call, i32 8
  %2 = bitcast i8* %bits to i32*
  store i32 0, i32* %2, align 4, !tbaa !8
  %fp = bitcast i8* %call to %struct._IO_FILE**
  store %struct._IO_FILE* %f, %struct._IO_FILE** %fp, align 4, !tbaa !9
  ret %struct.bit_io_t* %0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
define dso_local hidden void @b_write(i8* nocapture readonly %buf, i32 %n_bits, i32 %shift, %struct.bit_io_t* nocapture %bf) local_unnamed_addr #0 {
entry:
  %accu1 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 1
  %0 = load i32, i32* %accu1, align 4, !tbaa !2
  %bits2 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 2
  %1 = load i32, i32* %bits2, align 4, !tbaa !8
  %tobool64 = icmp eq i32 %n_bits, 0
  %cmp65 = icmp sgt i32 %1, 7
  %2 = select i1 %tobool64, i1 %cmp65, i1 true
  br i1 %2, label %while.cond3.preheader.lr.ph, label %while.end20

while.cond3.preheader.lr.ph:                      ; preds = %entry
  %rem = and i32 %shift, 7
  %div = lshr i32 %shift, 3
  %add.ptr = getelementptr inbounds i8, i8* %buf, i32 %div
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 0
  br label %while.cond3.preheader

while.cond.loopexit:                              ; preds = %while.body10, %while.cond7.preheader
  %n_bits.addr.1.lcssa = phi i32 [ %n_bits.addr.066, %while.cond7.preheader ], [ %dec, %while.body10 ]
  %shift.addr.1.lcssa = phi i32 [ %shift.addr.067, %while.cond7.preheader ], [ %spec.select, %while.body10 ]
  %buf.addr.1.lcssa = phi i8* [ %buf.addr.068, %while.cond7.preheader ], [ %spec.select47, %while.body10 ]
  %accu.2.lcssa = phi i32 [ %accu.1.lcssa, %while.cond7.preheader ], [ %or, %while.body10 ]
  %bits.2.lcssa = phi i32 [ %bits.1.lcssa, %while.cond7.preheader ], [ %inc, %while.body10 ]
  %tobool = icmp eq i32 %n_bits.addr.1.lcssa, 0
  %cmp = icmp sgt i32 %bits.2.lcssa, 7
  %3 = select i1 %tobool, i1 %cmp, i1 true
  br i1 %3, label %while.cond3.preheader, label %while.end20

while.cond3.preheader:                            ; preds = %while.cond.loopexit, %while.cond3.preheader.lr.ph
  %bits.070 = phi i32 [ %1, %while.cond3.preheader.lr.ph ], [ %bits.2.lcssa, %while.cond.loopexit ]
  %accu.069 = phi i32 [ %0, %while.cond3.preheader.lr.ph ], [ %accu.2.lcssa, %while.cond.loopexit ]
  %buf.addr.068 = phi i8* [ %add.ptr, %while.cond3.preheader.lr.ph ], [ %buf.addr.1.lcssa, %while.cond.loopexit ]
  %shift.addr.067 = phi i32 [ %rem, %while.cond3.preheader.lr.ph ], [ %shift.addr.1.lcssa, %while.cond.loopexit ]
  %n_bits.addr.066 = phi i32 [ %n_bits, %while.cond3.preheader.lr.ph ], [ %n_bits.addr.1.lcssa, %while.cond.loopexit ]
  %cmp448 = icmp sgt i32 %bits.070, 7
  br i1 %cmp448, label %while.body5, label %while.cond7.preheader

while.cond7.preheader:                            ; preds = %while.body5, %while.cond3.preheader
  %accu.1.lcssa = phi i32 [ %accu.069, %while.cond3.preheader ], [ %and, %while.body5 ]
  %bits.1.lcssa = phi i32 [ %bits.070, %while.cond3.preheader ], [ %sub, %while.body5 ]
  %cmp852 = icmp slt i32 %bits.1.lcssa, 8
  %tobool953 = icmp ne i32 %n_bits.addr.066, 0
  %4 = select i1 true, i1 %tobool953, i1 false
  br i1 %4, label %while.body10, label %while.cond.loopexit

while.body5:                                      ; preds = %while.body5, %while.cond3.preheader
  %bits.150 = phi i32 [ %sub, %while.body5 ], [ %bits.070, %while.cond3.preheader ]
  %accu.149 = phi i32 [ %and, %while.body5 ], [ %accu.069, %while.cond3.preheader ]
  %sub = add nsw i32 %bits.150, -8
  %shr = lshr i32 %accu.149, %sub
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4, !tbaa !9
  %call = tail call i32 @fputc(i32 %shr, %struct._IO_FILE* %5)
  %notmask = shl nsw i32 -1, %sub
  %sub6 = xor i32 %notmask, -1
  %and = and i32 %accu.149, %sub6
  %cmp4 = icmp sgt i32 %sub, 7
  br i1 %cmp4, label %while.body5, label %while.cond7.preheader

while.body10:                                     ; preds = %while.body10, %while.cond7.preheader
  %bits.258 = phi i32 [ %inc, %while.body10 ], [ %bits.1.lcssa, %while.cond7.preheader ]
  %accu.257 = phi i32 [ %or, %while.body10 ], [ %accu.1.lcssa, %while.cond7.preheader ]
  %buf.addr.156 = phi i8* [ %spec.select47, %while.body10 ], [ %buf.addr.068, %while.cond7.preheader ]
  %shift.addr.155 = phi i32 [ %spec.select, %while.body10 ], [ %shift.addr.067, %while.cond7.preheader ]
  %n_bits.addr.154 = phi i32 [ %dec, %while.body10 ], [ %n_bits.addr.066, %while.cond7.preheader ]
  %shl11 = shl i32 %accu.257, 1
  %shr12 = lshr i32 128, %shift.addr.155
  %6 = load i8, i8* %buf.addr.156, align 1, !tbaa !10
  %conv = zext i8 %6 to i32
  %and13 = and i32 %shr12, %conv
  %sub14 = sub i32 7, %shift.addr.155
  %shr15 = lshr i32 %and13, %sub14
  %or = or i32 %shr15, %shl11
  %dec = add i32 %n_bits.addr.154, -1
  %inc = add nsw i32 %bits.258, 1
  %inc16 = add i32 %shift.addr.155, 1
  %cmp17 = icmp eq i32 %inc16, 8
  %incdec.ptr = getelementptr inbounds i8, i8* %buf.addr.156, i32 1
  %spec.select = select i1 %cmp17, i32 0, i32 %inc16
  %spec.select47 = select i1 %cmp17, i8* %incdec.ptr, i8* %buf.addr.156
  %cmp8 = icmp slt i32 %inc, 8
  %tobool9 = icmp ne i32 %dec, 0
  %7 = select i1 %cmp8, i1 %tobool9, i1 false
  br i1 %7, label %while.body10, label %while.cond.loopexit

while.end20:                                      ; preds = %while.cond.loopexit, %entry
  %accu.0.lcssa = phi i32 [ %0, %entry ], [ %accu.2.lcssa, %while.cond.loopexit ]
  %bits.0.lcssa = phi i32 [ %1, %entry ], [ %bits.2.lcssa, %while.cond.loopexit ]
  store i32 %accu.0.lcssa, i32* %accu1, align 4, !tbaa !2
  store i32 %bits.0.lcssa, i32* %bits2, align 4, !tbaa !8
  ret void
}

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local hidden i32 @b_read(i8* nocapture %buf, i32 %n_bits, i32 %shift, %struct.bit_io_t* nocapture %bf) local_unnamed_addr #0 {
entry:
  %accu1 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 1
  %0 = load i32, i32* %accu1, align 4, !tbaa !2
  %bits2 = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 2
  %1 = load i32, i32* %bits2, align 4, !tbaa !8
  %tobool59 = icmp eq i32 %n_bits, 0
  br i1 %tobool59, label %while.end21, label %while.cond3.preheader.lr.ph

while.cond3.preheader.lr.ph:                      ; preds = %entry
  %rem = and i32 %shift, 7
  %div = lshr i32 %shift, 3
  %add.ptr = getelementptr inbounds i8, i8* %buf, i32 %div
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 0
  br label %while.cond3.preheader

while.cond3.preheader:                            ; preds = %if.end18, %while.cond3.preheader.lr.ph
  %buf.addr.064 = phi i8* [ %add.ptr, %while.cond3.preheader.lr.ph ], [ %buf.addr.1.lcssa, %if.end18 ]
  %n_bits.addr.063 = phi i32 [ %n_bits, %while.cond3.preheader.lr.ph ], [ %n_bits.addr.1.lcssa, %if.end18 ]
  %bits.062 = phi i32 [ %1, %while.cond3.preheader.lr.ph ], [ %add, %if.end18 ]
  %accu.061 = phi i32 [ %0, %while.cond3.preheader.lr.ph ], [ %or20, %if.end18 ]
  %shift.addr.060 = phi i32 [ %rem, %while.cond3.preheader.lr.ph ], [ %shift.addr.1.lcssa, %if.end18 ]
  %tobool448 = icmp eq i32 %bits.062, 0
  %tobool549 = icmp ne i32 %n_bits.addr.063, 0
  %2 = select i1 %tobool448, i1 false, i1 true
  br i1 %2, label %while.body6, label %while.end

while.body6:                                      ; preds = %if.end, %while.cond3.preheader
  %buf.addr.154 = phi i8* [ %spec.select47, %if.end ], [ %buf.addr.064, %while.cond3.preheader ]
  %n_bits.addr.153 = phi i32 [ %dec, %if.end ], [ %n_bits.addr.063, %while.cond3.preheader ]
  %bits.152 = phi i32 [ %sub, %if.end ], [ %bits.062, %while.cond3.preheader ]
  %shift.addr.150 = phi i32 [ %spec.select, %if.end ], [ %shift.addr.060, %while.cond3.preheader ]
  %sub = add nsw i32 %bits.152, -1
  %shl = shl i32 1, %sub
  %and = and i32 %shl, %accu.061
  %tobool7 = icmp eq i32 %and, 0
  br i1 %tobool7, label %if.else, label %if.then

if.then:                                          ; preds = %while.body6
  %shr = lshr i32 128, %shift.addr.150
  %3 = load i8, i8* %buf.addr.154, align 1, !tbaa !10
  %4 = trunc i32 %shr to i8
  %conv8 = or i8 %3, %4
  br label %if.end

if.else:                                          ; preds = %while.body6
  %neg = ashr i32 -129, %shift.addr.150
  %5 = load i8, i8* %buf.addr.154, align 1, !tbaa !10
  %6 = trunc i32 %neg to i8
  %conv11 = and i8 %5, %6
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %storemerge = phi i8 [ %conv11, %if.else ], [ %conv8, %if.then ]
  store i8 %storemerge, i8* %buf.addr.154, align 1, !tbaa !10
  %dec = add i32 %n_bits.addr.153, -1
  %inc = add i32 %shift.addr.150, 1
  %cmp = icmp ugt i32 %inc, 7
  %incdec.ptr = getelementptr inbounds i8, i8* %buf.addr.154, i32 1
  %spec.select = select i1 %cmp, i32 0, i32 %inc
  %spec.select47 = select i1 %cmp, i8* %incdec.ptr, i8* %buf.addr.154
  %tobool4 = icmp eq i32 %sub, 0
  %tobool5 = icmp ne i32 %dec, 0
  %7 = select i1 %tobool4, i1 false, i1 %tobool5
  br i1 %7, label %while.body6, label %while.end

while.end:                                        ; preds = %if.end, %while.cond3.preheader
  %shift.addr.1.lcssa = phi i32 [ %shift.addr.060, %while.cond3.preheader ], [ %spec.select, %if.end ]
  %bits.1.lcssa = phi i32 [ %bits.062, %while.cond3.preheader ], [ %sub, %if.end ]
  %n_bits.addr.1.lcssa = phi i32 [ %n_bits.addr.063, %while.cond3.preheader ], [ %dec, %if.end ]
  %buf.addr.1.lcssa = phi i8* [ %buf.addr.064, %while.cond3.preheader ], [ %spec.select47, %if.end ]
  %tobool5.lcssa = phi i1 [ true, %while.cond3.preheader ], [ %tobool5, %if.end ]
  br i1 %tobool5.lcssa, label %if.end18, label %while.end21

if.end18:                                         ; preds = %while.end
  %shl19 = shl i32 %accu.061, 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4, !tbaa !9
  %call = tail call i32 @fgetc(%struct._IO_FILE* %8)
  %or20 = or i32 %call, %shl19
  %add = add nsw i32 %bits.1.lcssa, 8
  %tobool = icmp eq i32 %n_bits.addr.1.lcssa, 0
  br i1 %tobool, label %while.end21, label %while.cond3.preheader

while.end21:                                      ; preds = %if.end18, %while.end, %entry
  %accu.0.lcssa = phi i32 [ %0, %entry ], [ %or20, %if.end18 ], [ %accu.061, %while.end ]
  %bits.2 = phi i32 [ %1, %entry ], [ %add, %if.end18 ], [ %bits.1.lcssa, %while.end ]
  store i32 %accu.0.lcssa, i32* %accu1, align 4, !tbaa !2
  store i32 %bits.2, i32* %bits2, align 4, !tbaa !8
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @fgetc(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local hidden void @b_detach(%struct.bit_io_t* nocapture %bf) local_unnamed_addr #0 {
entry:
  %bits = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 2
  %0 = load i32, i32* %bits, align 4, !tbaa !8
  %tobool = icmp eq i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %sub = sub nsw i32 8, %0
  %accu = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 1
  %1 = load i32, i32* %accu, align 4, !tbaa !2
  %shl = shl i32 %1, %sub
  store i32 %shl, i32* %accu, align 4, !tbaa !2
  %fp = getelementptr inbounds %struct.bit_io_t, %struct.bit_io_t* %bf, i32 0, i32 0
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4, !tbaa !9
  %call = tail call i32 @fputc(i32 %shl, %struct._IO_FILE* %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = bitcast %struct.bit_io_t* %bf to i8*
  tail call void @free(i8* %3) #3
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local hidden i32 @main() local_unnamed_addr #0 {
entry:
  %s = alloca [12 x i8], align 1
  %s2 = alloca [11 x i8], align 1
  %0 = getelementptr inbounds [12 x i8], [12 x i8]* %s, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %0) #3
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %0, i8* align 1 getelementptr inbounds ([12 x i8], [12 x i8]* @__const.main.s, i32 0, i32 0), i32 12, i1 false)
  %1 = getelementptr inbounds [11 x i8], [11 x i8]* %s2, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %1) #3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 %1, i8 0, i32 11, i1 false)
  %call = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  br label %for.body

for.body:                                         ; preds = %b_write.exit, %entry
  %2 = phi i32 [ 0, %entry ], [ %5, %b_write.exit ]
  %3 = phi i32 [ 0, %entry ], [ %4, %b_write.exit ]
  %i.075 = phi i32 [ 0, %entry ], [ %inc, %b_write.exit ]
  %add.ptr = getelementptr inbounds [12 x i8], [12 x i8]* %s, i32 0, i32 %i.075
  br label %while.cond3.preheader.i

while.cond.loopexit.i:                            ; preds = %while.body10.i, %while.cond7.preheader.i
  %n_bits.addr.1.lcssa.i = phi i32 [ %n_bits.addr.066.i, %while.cond7.preheader.i ], [ %dec.i, %while.body10.i ]
  %shift.addr.1.lcssa.i = phi i32 [ %shift.addr.067.i, %while.cond7.preheader.i ], [ %spec.select.i, %while.body10.i ]
  %buf.addr.1.lcssa.i = phi i8* [ %buf.addr.068.i, %while.cond7.preheader.i ], [ %spec.select47.i, %while.body10.i ]
  %4 = phi i32 [ %accu.1.lcssa.i, %while.cond7.preheader.i ], [ %or.i, %while.body10.i ]
  %5 = phi i32 [ %bits.1.lcssa.i, %while.cond7.preheader.i ], [ %inc.i, %while.body10.i ]
  %tobool.i = icmp eq i32 %n_bits.addr.1.lcssa.i, 0
  %cmp.i = icmp sgt i32 %5, 7
  %6 = select i1 %tobool.i, i1 %cmp.i, i1 true
  br i1 %6, label %while.cond3.preheader.i, label %b_write.exit

while.cond3.preheader.i:                          ; preds = %while.cond.loopexit.i, %for.body
  %bits.070.i = phi i32 [ %2, %for.body ], [ %5, %while.cond.loopexit.i ]
  %accu.069.i = phi i32 [ %3, %for.body ], [ %4, %while.cond.loopexit.i ]
  %buf.addr.068.i = phi i8* [ %add.ptr, %for.body ], [ %buf.addr.1.lcssa.i, %while.cond.loopexit.i ]
  %shift.addr.067.i = phi i32 [ 1, %for.body ], [ %shift.addr.1.lcssa.i, %while.cond.loopexit.i ]
  %n_bits.addr.066.i = phi i32 [ 7, %for.body ], [ %n_bits.addr.1.lcssa.i, %while.cond.loopexit.i ]
  %cmp448.i = icmp sgt i32 %bits.070.i, 7
  br i1 %cmp448.i, label %while.body5.i, label %while.cond7.preheader.i

while.cond7.preheader.i:                          ; preds = %while.body5.i, %while.cond3.preheader.i
  %accu.1.lcssa.i = phi i32 [ %accu.069.i, %while.cond3.preheader.i ], [ %and.i, %while.body5.i ]
  %bits.1.lcssa.i = phi i32 [ %bits.070.i, %while.cond3.preheader.i ], [ %sub.i, %while.body5.i ]
  %cmp852.i = icmp slt i32 %bits.1.lcssa.i, 8
  %tobool953.i = icmp ne i32 %n_bits.addr.066.i, 0
  %7 = select i1 true, i1 %tobool953.i, i1 false
  br i1 %7, label %while.body10.i, label %while.cond.loopexit.i

while.body5.i:                                    ; preds = %while.body5.i, %while.cond3.preheader.i
  %bits.150.i = phi i32 [ %sub.i, %while.body5.i ], [ %bits.070.i, %while.cond3.preheader.i ]
  %accu.149.i = phi i32 [ %and.i, %while.body5.i ], [ %accu.069.i, %while.cond3.preheader.i ]
  %sub.i = add nsw i32 %bits.150.i, -8
  %shr.i = lshr i32 %accu.149.i, %sub.i
  %call.i32 = tail call i32 @fputc(i32 %shr.i, %struct._IO_FILE* %call) #3
  %notmask.i = shl nsw i32 -1, %sub.i
  %sub6.i = xor i32 %notmask.i, -1
  %and.i = and i32 %accu.149.i, %sub6.i
  %cmp4.i = icmp sgt i32 %sub.i, 7
  br i1 %cmp4.i, label %while.body5.i, label %while.cond7.preheader.i

while.body10.i:                                   ; preds = %while.body10.i, %while.cond7.preheader.i
  %bits.258.i = phi i32 [ %inc.i, %while.body10.i ], [ %bits.1.lcssa.i, %while.cond7.preheader.i ]
  %accu.257.i = phi i32 [ %or.i, %while.body10.i ], [ %accu.1.lcssa.i, %while.cond7.preheader.i ]
  %buf.addr.156.i = phi i8* [ %spec.select47.i, %while.body10.i ], [ %buf.addr.068.i, %while.cond7.preheader.i ]
  %shift.addr.155.i = phi i32 [ %spec.select.i, %while.body10.i ], [ %shift.addr.067.i, %while.cond7.preheader.i ]
  %n_bits.addr.154.i = phi i32 [ %dec.i, %while.body10.i ], [ %n_bits.addr.066.i, %while.cond7.preheader.i ]
  %shl11.i = shl i32 %accu.257.i, 1
  %shr12.i = lshr i32 128, %shift.addr.155.i
  %8 = load i8, i8* %buf.addr.156.i, align 1, !tbaa !10
  %conv.i = zext i8 %8 to i32
  %and13.i = and i32 %shr12.i, %conv.i
  %sub14.i = sub i32 7, %shift.addr.155.i
  %shr15.i = lshr i32 %and13.i, %sub14.i
  %or.i = or i32 %shr15.i, %shl11.i
  %dec.i = add i32 %n_bits.addr.154.i, -1
  %inc.i = add nsw i32 %bits.258.i, 1
  %inc16.i = add i32 %shift.addr.155.i, 1
  %cmp17.i = icmp eq i32 %inc16.i, 8
  %incdec.ptr.i = getelementptr inbounds i8, i8* %buf.addr.156.i, i32 1
  %spec.select.i = select i1 %cmp17.i, i32 0, i32 %inc16.i
  %spec.select47.i = select i1 %cmp17.i, i8* %incdec.ptr.i, i8* %buf.addr.156.i
  %cmp8.i = icmp slt i32 %inc.i, 8
  %tobool9.i = icmp ne i32 %dec.i, 0
  %9 = select i1 %cmp8.i, i1 %tobool9.i, i1 false
  br i1 %9, label %while.body10.i, label %while.cond.loopexit.i

b_write.exit:                                     ; preds = %while.cond.loopexit.i
  %inc = add nuw nsw i32 %i.075, 1
  %exitcond76 = icmp eq i32 %inc, 10
  br i1 %exitcond76, label %for.end, label %for.body

for.end:                                          ; preds = %b_write.exit
  %tobool.i34 = icmp eq i32 %5, 0
  br i1 %tobool.i34, label %b_detach.exit, label %if.then.i

if.then.i:                                        ; preds = %for.end
  %sub.i35 = sub nsw i32 8, %5
  %shl.i = shl i32 %4, %sub.i35
  %call.i38 = tail call i32 @fputc(i32 %shl.i, %struct._IO_FILE* %call) #3
  br label %b_detach.exit

b_detach.exit:                                    ; preds = %if.then.i, %for.end
  %call2 = tail call i32 @fclose(%struct._IO_FILE* %call)
  %call3 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  %call.i39 = tail call noalias i8* @malloc(i32 12) #3
  %accu.i40 = getelementptr inbounds i8, i8* %call.i39, i32 4
  %10 = bitcast i8* %accu.i40 to i32*
  store i32 0, i32* %10, align 4, !tbaa !2
  %bits.i41 = getelementptr inbounds i8, i8* %call.i39, i32 8
  %11 = bitcast i8* %bits.i41 to i32*
  store i32 0, i32* %11, align 4, !tbaa !8
  %fp.i42 = bitcast i8* %call.i39 to %struct._IO_FILE**
  store %struct._IO_FILE* %call3, %struct._IO_FILE** %fp.i42, align 4, !tbaa !9
  br label %for.body7

for.body7:                                        ; preds = %b_read.exit, %b_detach.exit
  %12 = phi i32 [ 0, %b_detach.exit ], [ %22, %b_read.exit ]
  %13 = phi i32 [ 0, %b_detach.exit ], [ %21, %b_read.exit ]
  %i.174 = phi i32 [ 0, %b_detach.exit ], [ %inc12, %b_read.exit ]
  %add.ptr9 = getelementptr inbounds [11 x i8], [11 x i8]* %s2, i32 0, i32 %i.174
  br label %while.cond3.preheader.i46

while.cond3.preheader.i46:                        ; preds = %if.end18.i, %for.body7
  %buf.addr.064.i = phi i8* [ %add.ptr9, %for.body7 ], [ %buf.addr.1.lcssa.i61, %if.end18.i ]
  %n_bits.addr.063.i = phi i32 [ 7, %for.body7 ], [ %n_bits.addr.1.lcssa.i60, %if.end18.i ]
  %bits.062.i = phi i32 [ %12, %for.body7 ], [ %add.i, %if.end18.i ]
  %accu.061.i = phi i32 [ %13, %for.body7 ], [ %or20.i, %if.end18.i ]
  %shift.addr.060.i = phi i32 [ 1, %for.body7 ], [ %shift.addr.1.lcssa.i58, %if.end18.i ]
  %tobool448.i = icmp eq i32 %bits.062.i, 0
  %tobool549.i = icmp ne i32 %n_bits.addr.063.i, 0
  %14 = select i1 %tobool448.i, i1 false, i1 true
  br i1 %14, label %while.body6.i, label %while.end.i

while.body6.i:                                    ; preds = %if.end.i, %while.cond3.preheader.i46
  %buf.addr.154.i = phi i8* [ %spec.select47.i57, %if.end.i ], [ %buf.addr.064.i, %while.cond3.preheader.i46 ]
  %n_bits.addr.153.i = phi i32 [ %dec.i52, %if.end.i ], [ %n_bits.addr.063.i, %while.cond3.preheader.i46 ]
  %bits.152.i = phi i32 [ %sub.i47, %if.end.i ], [ %bits.062.i, %while.cond3.preheader.i46 ]
  %shift.addr.150.i = phi i32 [ %spec.select.i56, %if.end.i ], [ %shift.addr.060.i, %while.cond3.preheader.i46 ]
  %sub.i47 = add nsw i32 %bits.152.i, -1
  %shl.i48 = shl i32 1, %sub.i47
  %and.i49 = and i32 %shl.i48, %accu.061.i
  %tobool7.i = icmp eq i32 %and.i49, 0
  br i1 %tobool7.i, label %if.else.i, label %if.then.i51

if.then.i51:                                      ; preds = %while.body6.i
  %shr.i50 = lshr i32 128, %shift.addr.150.i
  %15 = load i8, i8* %buf.addr.154.i, align 1, !tbaa !10
  %16 = trunc i32 %shr.i50 to i8
  %conv8.i = or i8 %15, %16
  br label %if.end.i

if.else.i:                                        ; preds = %while.body6.i
  %neg.i = ashr i32 -129, %shift.addr.150.i
  %17 = load i8, i8* %buf.addr.154.i, align 1, !tbaa !10
  %18 = trunc i32 %neg.i to i8
  %conv11.i = and i8 %17, %18
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %if.then.i51
  %storemerge.i = phi i8 [ %conv11.i, %if.else.i ], [ %conv8.i, %if.then.i51 ]
  store i8 %storemerge.i, i8* %buf.addr.154.i, align 1, !tbaa !10
  %dec.i52 = add i32 %n_bits.addr.153.i, -1
  %inc.i53 = add i32 %shift.addr.150.i, 1
  %cmp.i54 = icmp ugt i32 %inc.i53, 7
  %incdec.ptr.i55 = getelementptr inbounds i8, i8* %buf.addr.154.i, i32 1
  %spec.select.i56 = select i1 %cmp.i54, i32 0, i32 %inc.i53
  %spec.select47.i57 = select i1 %cmp.i54, i8* %incdec.ptr.i55, i8* %buf.addr.154.i
  %tobool4.i = icmp eq i32 %sub.i47, 0
  %tobool5.i = icmp ne i32 %dec.i52, 0
  %19 = select i1 %tobool4.i, i1 false, i1 %tobool5.i
  br i1 %19, label %while.body6.i, label %while.end.i

while.end.i:                                      ; preds = %if.end.i, %while.cond3.preheader.i46
  %shift.addr.1.lcssa.i58 = phi i32 [ %shift.addr.060.i, %while.cond3.preheader.i46 ], [ %spec.select.i56, %if.end.i ]
  %bits.1.lcssa.i59 = phi i32 [ %bits.062.i, %while.cond3.preheader.i46 ], [ %sub.i47, %if.end.i ]
  %n_bits.addr.1.lcssa.i60 = phi i32 [ %n_bits.addr.063.i, %while.cond3.preheader.i46 ], [ %dec.i52, %if.end.i ]
  %buf.addr.1.lcssa.i61 = phi i8* [ %buf.addr.064.i, %while.cond3.preheader.i46 ], [ %spec.select47.i57, %if.end.i ]
  %tobool5.lcssa.i = phi i1 [ true, %while.cond3.preheader.i46 ], [ %tobool5.i, %if.end.i ]
  br i1 %tobool5.lcssa.i, label %if.end18.i, label %b_read.exit

if.end18.i:                                       ; preds = %while.end.i
  %shl19.i = shl i32 %accu.061.i, 8
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.i42, align 4, !tbaa !9
  %call.i62 = tail call i32 @fgetc(%struct._IO_FILE* %20) #3
  %or20.i = or i32 %call.i62, %shl19.i
  %add.i = add nsw i32 %bits.1.lcssa.i59, 8
  %tobool.i63 = icmp eq i32 %n_bits.addr.1.lcssa.i60, 0
  br i1 %tobool.i63, label %b_read.exit, label %while.cond3.preheader.i46

b_read.exit:                                      ; preds = %if.end18.i, %while.end.i
  %21 = phi i32 [ %or20.i, %if.end18.i ], [ %accu.061.i, %while.end.i ]
  %22 = phi i32 [ %add.i, %if.end18.i ], [ %bits.1.lcssa.i59, %while.end.i ]
  store i32 %21, i32* %10, align 4, !tbaa !2
  store i32 %22, i32* %11, align 4, !tbaa !8
  %inc12 = add nuw nsw i32 %i.174, 1
  %exitcond = icmp eq i32 %inc12, 10
  br i1 %exitcond, label %for.end13, label %for.body7

for.end13:                                        ; preds = %b_read.exit
  %tobool.i65 = icmp eq i32 %22, 0
  br i1 %tobool.i65, label %b_detach.exit73, label %if.then.i71

if.then.i71:                                      ; preds = %for.end13
  %sub.i66 = sub nsw i32 8, %22
  %shl.i68 = shl i32 %21, %sub.i66
  store i32 %shl.i68, i32* %10, align 4, !tbaa !2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.i42, align 4, !tbaa !9
  %call.i70 = tail call i32 @fputc(i32 %shl.i68, %struct._IO_FILE* %23) #3
  br label %b_detach.exit73

b_detach.exit73:                                  ; preds = %if.then.i71, %for.end13
  tail call void @free(i8* nonnull %call.i39) #3
  %call14 = tail call i32 @fclose(%struct._IO_FILE* %call3)
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* nonnull %1)
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %1) #3
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %0) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1) #1

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !7, i64 4}
!3 = !{!"", !4, i64 0, !7, i64 4, !7, i64 8}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!3, !7, i64 8}
!9 = !{!3, !4, i64 0}
!10 = !{!5, !5, i64 0}
