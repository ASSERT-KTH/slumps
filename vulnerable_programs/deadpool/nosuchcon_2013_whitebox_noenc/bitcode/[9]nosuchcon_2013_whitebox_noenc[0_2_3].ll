; ModuleID = '[9]nosuchcon_2013_whitebox_noenc[0_2_3].bc'
source_filename = "/inputs/wh/wbs_aes_nsc2013_variants_generator/src/nosuchcon_2013_whitebox_noenc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.aes_wb_s = type { %struct.sub_s, %struct.sub_s, [3 x [65536 x i8]], [9 x [16 x [4 x [256 x i8]]]], [16 x [256 x i8]] }
%struct.sub_s = type { [256 x i8], [256 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [10 x i8] c"wbt_noenc\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"Input:    \00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"%02X \00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"Enc in:   \00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"Enc out:  \00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"Output:   \00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local zeroext i8 @is_hex_char(i8 signext %c) local_unnamed_addr #0 {
entry:
  %c.off = add i8 %c, -48
  %0 = icmp ult i8 %c.off, 10
  %c.off25 = add i8 %c, -97
  %1 = icmp ult i8 %c.off25, 6
  %or.cond = or i1 %0, %1
  br i1 %or.cond, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %cmp13 = icmp sgt i8 %c, 64
  %cmp16 = icmp slt i8 %c, 71
  %2 = add i8 -65, %c
  %3 = icmp ult i8 %2, 6
  %4 = select i1 %cmp13, i1 %cmp16, i1 false
  %5 = add i8 -65, %c
  %6 = icmp ult i8 %5, 6
  %7 = zext i1 %6 to i8
  %phitmp = zext i1 %3 to i8
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %8 = phi i8 [ %phitmp, %lor.rhs ], [ 1, %entry ]
  ret i8 %8
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %aes = alloca %struct.aes_wb_s, align 1
  %t = alloca [12 x [16 x i8]], align 16
  %m = alloca [16 x i8], align 16
  %str_bytes = alloca [3 x i8], align 1
  %0 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 349184, i8* nonnull %0) #5
  %1 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 192, i8* nonnull %1) #5
  %2 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #5
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* %str_bytes, i64 0, i64 0
  %arrayinit.element = getelementptr inbounds [3 x i8], [3 x i8]* %str_bytes, i64 0, i64 1
  %arrayinit.element22 = getelementptr inbounds [3 x i8], [3 x i8]* %str_bytes, i64 0, i64 2
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv317 = phi i64 [ 0, %entry ], [ %indvars.iv.next318, %if.end ]
  %4 = load i8*, i8** %arrayidx, align 8, !tbaa !2
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %indvars.iv317
  %5 = load i8, i8* %arrayidx2, align 1, !tbaa !6
  %c.off.i = add i8 %5, -48
  %6 = icmp ult i8 %c.off.i, 10
  %c.off25.i = add i8 %5, -97
  %7 = icmp ult i8 %c.off25.i, 6
  %or.cond.i = or i1 %6, %7
  br i1 %or.cond.i, label %lor.lhs.false, label %is_hex_char.exit

is_hex_char.exit:                                 ; preds = %for.body
  %cmp13.i = icmp sgt i8 %5, 64
  %cmp16.i = icmp slt i8 %5, 71
  %8 = add i8 -65, %5
  %9 = icmp ult i8 %8, 6
  %10 = select i1 %cmp13.i, i1 %cmp16.i, i1 false
  br i1 %9, label %lor.lhs.false, label %cleanup

lor.lhs.false:                                    ; preds = %is_hex_char.exit, %for.body
  %11 = or i64 %indvars.iv317, 1
  %arrayidx9 = getelementptr inbounds i8, i8* %4, i64 %11
  %12 = load i8, i8* %arrayidx9, align 1, !tbaa !6
  %c.off.i279 = add i8 %12, -48
  %13 = icmp ult i8 %c.off.i279, 10
  %c.off25.i280 = add i8 %12, -97
  %14 = icmp ult i8 %c.off25.i280, 6
  %or.cond.i281 = or i1 %13, %14
  br i1 %or.cond.i281, label %if.end, label %is_hex_char.exit286

is_hex_char.exit286:                              ; preds = %lor.lhs.false
  %cmp13.i282 = icmp sgt i8 %12, 64
  %cmp16.i283 = icmp slt i8 %12, 71
  %15 = add i8 -65, %12
  %16 = icmp ult i8 %15, 6
  %17 = select i1 %cmp13.i282, i1 %cmp16.i283, i1 false
  br i1 %16, label %if.end, label %cleanup

if.end:                                           ; preds = %is_hex_char.exit286, %lor.lhs.false
  call void @llvm.lifetime.start.p0i8(i64 3, i8* nonnull %3) #5
  store i8 %5, i8* %3, align 1, !tbaa !6
  store i8 %12, i8* %arrayinit.element, align 1, !tbaa !6
  store i8 0, i8* %arrayinit.element22, align 1, !tbaa !6
  %call23 = call i64 @strtoul(i8* nocapture nonnull %3, i8** null, i32 16) #5
  %conv24 = trunc i64 %call23 to i8
  %18 = lshr exact i64 %indvars.iv317, 1
  %arrayidx27 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 %18
  store i8 %conv24, i8* %arrayidx27, align 1, !tbaa !6
  call void @llvm.lifetime.end.p0i8(i64 3, i8* nonnull %3) #5
  %indvars.iv.next318 = add nuw nsw i64 %indvars.iv317, 2
  %cmp = icmp ult i64 %indvars.iv.next318, 32
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %if.end
  %call31 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  %19 = call i64 @fread_unlocked(i8* nonnull %0, i64 1, i64 349184, %struct._IO_FILE* %call31)
  %call33 = tail call i32 @fclose(%struct._IO_FILE* %call31)
  %call34 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0))
  %20 = load i8, i8* %2, align 16, !tbaa !6
  %conv42 = zext i8 %20 to i32
  %call43 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42)
  %arrayidx41.1 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 1
  %21 = load i8, i8* %arrayidx41.1, align 1, !tbaa !6
  %conv42.1 = zext i8 %21 to i32
  %call43.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.1)
  %arrayidx41.2 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 2
  %22 = load i8, i8* %arrayidx41.2, align 2, !tbaa !6
  %conv42.2 = zext i8 %22 to i32
  %call43.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.2)
  %arrayidx41.3 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 3
  %23 = load i8, i8* %arrayidx41.3, align 1, !tbaa !6
  %conv42.3 = zext i8 %23 to i32
  %call43.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.3)
  %arrayidx41.4 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 4
  %24 = load i8, i8* %arrayidx41.4, align 4, !tbaa !6
  %conv42.4 = zext i8 %24 to i32
  %call43.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.4)
  %arrayidx41.5 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 5
  %25 = load i8, i8* %arrayidx41.5, align 1, !tbaa !6
  %conv42.5 = zext i8 %25 to i32
  %call43.5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.5)
  %arrayidx41.6 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 6
  %26 = load i8, i8* %arrayidx41.6, align 2, !tbaa !6
  %conv42.6 = zext i8 %26 to i32
  %call43.6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.6)
  %arrayidx41.7 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 7
  %27 = load i8, i8* %arrayidx41.7, align 1, !tbaa !6
  %conv42.7 = zext i8 %27 to i32
  %call43.7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.7)
  %arrayidx41.8 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 8
  %28 = load i8, i8* %arrayidx41.8, align 8, !tbaa !6
  %conv42.8 = zext i8 %28 to i32
  %call43.8 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.8)
  %arrayidx41.9 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 9
  %29 = load i8, i8* %arrayidx41.9, align 1, !tbaa !6
  %conv42.9 = zext i8 %29 to i32
  %call43.9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.9)
  %arrayidx41.10 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 10
  %30 = load i8, i8* %arrayidx41.10, align 2, !tbaa !6
  %conv42.10 = zext i8 %30 to i32
  %call43.10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.10)
  %arrayidx41.11 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 11
  %31 = load i8, i8* %arrayidx41.11, align 1, !tbaa !6
  %conv42.11 = zext i8 %31 to i32
  %call43.11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.11)
  %arrayidx41.12 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 12
  %32 = load i8, i8* %arrayidx41.12, align 4, !tbaa !6
  %conv42.12 = zext i8 %32 to i32
  %call43.12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.12)
  %arrayidx41.13 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 13
  %33 = load i8, i8* %arrayidx41.13, align 1, !tbaa !6
  %conv42.13 = zext i8 %33 to i32
  %call43.13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.13)
  %arrayidx41.14 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 14
  %34 = load i8, i8* %arrayidx41.14, align 2, !tbaa !6
  %conv42.14 = zext i8 %34 to i32
  %call43.14 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.14)
  %arrayidx41.15 = getelementptr inbounds [16 x i8], [16 x i8]* %m, i64 0, i64 15
  %35 = load i8, i8* %arrayidx41.15, align 1, !tbaa !6
  %conv42.15 = zext i8 %35 to i32
  %call43.15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv42.15)
  %putchar = tail call i32 @putchar(i32 10)
  %idxprom54 = zext i8 %20 to i64
  %arrayidx55 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54
  %36 = load i8, i8* %arrayidx55, align 1, !tbaa !6
  store i8 %36, i8* %1, align 16, !tbaa !6
  %idxprom54.1 = zext i8 %21 to i64
  %arrayidx55.1 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.1
  %37 = load i8, i8* %arrayidx55.1, align 1, !tbaa !6
  %arrayidx62.1 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 4
  store i8 %37, i8* %arrayidx62.1, align 4, !tbaa !6
  %idxprom54.2 = zext i8 %22 to i64
  %arrayidx55.2 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.2
  %38 = load i8, i8* %arrayidx55.2, align 1, !tbaa !6
  %arrayidx62.2 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 8
  store i8 %38, i8* %arrayidx62.2, align 8, !tbaa !6
  %idxprom54.3 = zext i8 %23 to i64
  %arrayidx55.3 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.3
  %39 = load i8, i8* %arrayidx55.3, align 1, !tbaa !6
  %arrayidx62.3 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 12
  store i8 %39, i8* %arrayidx62.3, align 4, !tbaa !6
  %idxprom54.4 = zext i8 %24 to i64
  %arrayidx55.4 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.4
  %40 = load i8, i8* %arrayidx55.4, align 1, !tbaa !6
  %arrayidx62.4 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 1
  store i8 %40, i8* %arrayidx62.4, align 1, !tbaa !6
  %idxprom54.5 = zext i8 %25 to i64
  %arrayidx55.5 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.5
  %41 = load i8, i8* %arrayidx55.5, align 1, !tbaa !6
  %arrayidx62.5 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 5
  store i8 %41, i8* %arrayidx62.5, align 1, !tbaa !6
  %idxprom54.6 = zext i8 %26 to i64
  %arrayidx55.6 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.6
  %42 = load i8, i8* %arrayidx55.6, align 1, !tbaa !6
  %arrayidx62.6 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 9
  store i8 %42, i8* %arrayidx62.6, align 1, !tbaa !6
  %idxprom54.7 = zext i8 %27 to i64
  %arrayidx55.7 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.7
  %43 = load i8, i8* %arrayidx55.7, align 1, !tbaa !6
  %arrayidx62.7 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 13
  store i8 %43, i8* %arrayidx62.7, align 1, !tbaa !6
  %idxprom54.8 = zext i8 %28 to i64
  %arrayidx55.8 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.8
  %44 = load i8, i8* %arrayidx55.8, align 1, !tbaa !6
  %arrayidx62.8 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 2
  store i8 %44, i8* %arrayidx62.8, align 2, !tbaa !6
  %idxprom54.9 = zext i8 %29 to i64
  %arrayidx55.9 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.9
  %45 = load i8, i8* %arrayidx55.9, align 1, !tbaa !6
  %arrayidx62.9 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 6
  store i8 %45, i8* %arrayidx62.9, align 2, !tbaa !6
  %idxprom54.10 = zext i8 %30 to i64
  %arrayidx55.10 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.10
  %46 = load i8, i8* %arrayidx55.10, align 1, !tbaa !6
  %arrayidx62.10 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 10
  store i8 %46, i8* %arrayidx62.10, align 2, !tbaa !6
  %idxprom54.11 = zext i8 %31 to i64
  %arrayidx55.11 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.11
  %47 = load i8, i8* %arrayidx55.11, align 1, !tbaa !6
  %arrayidx62.11 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 14
  store i8 %47, i8* %arrayidx62.11, align 2, !tbaa !6
  %idxprom54.12 = zext i8 %32 to i64
  %arrayidx55.12 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.12
  %48 = load i8, i8* %arrayidx55.12, align 1, !tbaa !6
  %arrayidx62.12 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 3
  store i8 %48, i8* %arrayidx62.12, align 1, !tbaa !6
  %idxprom54.13 = zext i8 %33 to i64
  %arrayidx55.13 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.13
  %49 = load i8, i8* %arrayidx55.13, align 1, !tbaa !6
  %arrayidx62.13 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 7
  store i8 %49, i8* %arrayidx62.13, align 1, !tbaa !6
  %idxprom54.14 = zext i8 %34 to i64
  %arrayidx55.14 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.14
  %50 = load i8, i8* %arrayidx55.14, align 1, !tbaa !6
  %arrayidx62.14 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 11
  store i8 %50, i8* %arrayidx62.14, align 1, !tbaa !6
  %idxprom54.15 = zext i8 %35 to i64
  %arrayidx55.15 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 0, i32 1, i64 %idxprom54.15
  %51 = load i8, i8* %arrayidx55.15, align 1, !tbaa !6
  %arrayidx62.15 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 0, i64 15
  store i8 %51, i8* %arrayidx62.15, align 1, !tbaa !6
  %call66 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0))
  %conv75 = zext i8 %36 to i32
  %call76 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75)
  %conv75.1 = zext i8 %40 to i32
  %call76.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.1)
  %conv75.2 = zext i8 %44 to i32
  %call76.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.2)
  %conv75.3 = zext i8 %48 to i32
  %call76.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.3)
  %conv75.4 = zext i8 %37 to i32
  %call76.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.4)
  %conv75.5 = zext i8 %41 to i32
  %call76.5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.5)
  %conv75.6 = zext i8 %45 to i32
  %call76.6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.6)
  %conv75.7 = zext i8 %49 to i32
  %call76.7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.7)
  %conv75.8 = zext i8 %38 to i32
  %call76.8 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.8)
  %conv75.9 = zext i8 %42 to i32
  %call76.9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.9)
  %conv75.10 = zext i8 %46 to i32
  %call76.10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.10)
  %conv75.11 = zext i8 %50 to i32
  %call76.11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.11)
  %conv75.12 = zext i8 %39 to i32
  %call76.12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.12)
  %conv75.13 = zext i8 %43 to i32
  %call76.13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.13)
  %conv75.14 = zext i8 %47 to i32
  %call76.14 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.14)
  %conv75.15 = zext i8 %51 to i32
  %call76.15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv75.15)
  %putchar276 = tail call i32 @putchar(i32 10)
  br label %for.cond86.preheader

for.cond86.preheader:                             ; preds = %for.inc155, %for.end
  %indvars.iv305 = phi i64 [ 1, %for.end ], [ %indvars.iv.next306, %for.inc155 ]
  %sub = add nsw i64 %indvars.iv305, -1
  br label %for.body90

for.body90:                                       ; preds = %for.body90, %for.cond86.preheader
  %indvars.iv = phi i64 [ 0, %for.cond86.preheader ], [ %indvars.iv.next, %for.body90 ]
  %conv87296 = phi i32 [ 0, %for.cond86.preheader ], [ %63, %for.body90 ]
  %rem112 = and i32 %conv87296, 3
  %idxprom114 = zext i32 %rem112 to i64
  %arrayidx115 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 %sub, i64 %idxprom114
  %52 = load i8, i8* %arrayidx115, align 1, !tbaa !6
  %idxprom116 = zext i8 %52 to i64
  %arrayidx117 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 3, i64 %sub, i64 %indvars.iv, i64 0, i64 %idxprom116
  %53 = load i8, i8* %arrayidx117, align 1, !tbaa !6
  %add111.1 = add nuw nsw i32 %conv87296, 1
  %rem112.1 = and i32 %add111.1, 3
  %add113.1 = or i32 %rem112.1, 4
  %idxprom114.1 = zext i32 %add113.1 to i64
  %arrayidx115.1 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 %sub, i64 %idxprom114.1
  %54 = load i8, i8* %arrayidx115.1, align 1, !tbaa !6
  %idxprom116.1 = zext i8 %54 to i64
  %arrayidx117.1 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 3, i64 %sub, i64 %indvars.iv, i64 1, i64 %idxprom116.1
  %55 = load i8, i8* %arrayidx117.1, align 1, !tbaa !6
  %add111.2 = add nuw nsw i32 %conv87296, 2
  %rem112.2 = and i32 %add111.2, 3
  %add113.2 = or i32 %rem112.2, 8
  %idxprom114.2 = zext i32 %add113.2 to i64
  %arrayidx115.2 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 %sub, i64 %idxprom114.2
  %56 = load i8, i8* %arrayidx115.2, align 1, !tbaa !6
  %idxprom116.2 = zext i8 %56 to i64
  %arrayidx117.2 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 3, i64 %sub, i64 %indvars.iv, i64 2, i64 %idxprom116.2
  %57 = load i8, i8* %arrayidx117.2, align 1, !tbaa !6
  %add111.3 = add nuw nsw i32 %conv87296, 3
  %rem112.3 = and i32 %add111.3, 3
  %add113.3 = or i32 %rem112.3, 12
  %idxprom114.3 = zext i32 %add113.3 to i64
  %arrayidx115.3 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 %sub, i64 %idxprom114.3
  %58 = load i8, i8* %arrayidx115.3, align 1, !tbaa !6
  %idxprom116.3 = zext i8 %58 to i64
  %arrayidx117.3 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 3, i64 %sub, i64 %indvars.iv, i64 3, i64 %idxprom116.3
  %59 = load i8, i8* %arrayidx117.3, align 1, !tbaa !6
  %conv127 = zext i8 %53 to i64
  %shl = shl nuw nsw i64 %conv127, 8
  %conv129 = zext i8 %55 to i64
  %or = or i64 %shl, %conv129
  %arrayidx131 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 2, i64 0, i64 %or
  %60 = load i8, i8* %arrayidx131, align 1, !tbaa !6
  %conv132 = zext i8 %60 to i64
  %shl133 = shl nuw nsw i64 %conv132, 8
  %conv137 = zext i8 %57 to i64
  %shl138 = shl nuw nsw i64 %conv137, 8
  %conv140 = zext i8 %59 to i64
  %or141 = or i64 %shl138, %conv140
  %arrayidx143 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 2, i64 1, i64 %or141
  %61 = load i8, i8* %arrayidx143, align 1, !tbaa !6
  %conv144 = zext i8 %61 to i64
  %or145 = or i64 %shl133, %conv144
  %arrayidx147 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 2, i64 2, i64 %or145
  %62 = load i8, i8* %arrayidx147, align 1, !tbaa !6
  %arrayidx151 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 %indvars.iv305, i64 %indvars.iv
  store i8 %62, i8* %arrayidx151, align 1, !tbaa !6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 16
  br i1 %exitcond, label %for.inc155, label %for.body90

for.inc155:                                       ; preds = %for.body90
  %indvars.iv.next306 = add nuw nsw i64 %indvars.iv305, 1
  %exitcond307 = icmp eq i64 %indvars.iv.next306, 10
  br i1 %exitcond307, label %for.body162.preheader, label %for.cond86.preheader

for.body162.preheader:                            ; preds = %for.inc155
  %arrayidx174 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 0
  %64 = load i8, i8* %arrayidx174, align 16, !tbaa !6
  %idxprom175 = zext i8 %64 to i64
  %arrayidx176 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 0, i64 %idxprom175
  %65 = load i8, i8* %arrayidx176, align 1, !tbaa !6
  %arrayidx185 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 0
  store i8 %65, i8* %arrayidx185, align 16, !tbaa !6
  %arrayidx174.1 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 1
  %66 = load i8, i8* %arrayidx174.1, align 1, !tbaa !6
  %idxprom175.1 = zext i8 %66 to i64
  %arrayidx176.1 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 1, i64 %idxprom175.1
  %67 = load i8, i8* %arrayidx176.1, align 1, !tbaa !6
  %arrayidx185.1 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 4
  store i8 %67, i8* %arrayidx185.1, align 4, !tbaa !6
  %arrayidx174.2 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 2
  %68 = load i8, i8* %arrayidx174.2, align 2, !tbaa !6
  %idxprom175.2 = zext i8 %68 to i64
  %arrayidx176.2 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 2, i64 %idxprom175.2
  %69 = load i8, i8* %arrayidx176.2, align 1, !tbaa !6
  %arrayidx185.2 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 8
  store i8 %69, i8* %arrayidx185.2, align 8, !tbaa !6
  %arrayidx174.3 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 3
  %70 = load i8, i8* %arrayidx174.3, align 1, !tbaa !6
  %idxprom175.3 = zext i8 %70 to i64
  %arrayidx176.3 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 3, i64 %idxprom175.3
  %71 = load i8, i8* %arrayidx176.3, align 1, !tbaa !6
  %arrayidx185.3 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 12
  store i8 %71, i8* %arrayidx185.3, align 4, !tbaa !6
  %arrayidx174.4 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 5
  %72 = load i8, i8* %arrayidx174.4, align 1, !tbaa !6
  %idxprom175.4 = zext i8 %72 to i64
  %arrayidx176.4 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 4, i64 %idxprom175.4
  %73 = load i8, i8* %arrayidx176.4, align 1, !tbaa !6
  %arrayidx185.4 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 1
  store i8 %73, i8* %arrayidx185.4, align 1, !tbaa !6
  %arrayidx174.5 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 6
  %74 = load i8, i8* %arrayidx174.5, align 2, !tbaa !6
  %idxprom175.5 = zext i8 %74 to i64
  %arrayidx176.5 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 5, i64 %idxprom175.5
  %75 = load i8, i8* %arrayidx176.5, align 1, !tbaa !6
  %arrayidx185.5 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 5
  store i8 %75, i8* %arrayidx185.5, align 1, !tbaa !6
  %arrayidx174.6 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 7
  %76 = load i8, i8* %arrayidx174.6, align 1, !tbaa !6
  %idxprom175.6 = zext i8 %76 to i64
  %arrayidx176.6 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 6, i64 %idxprom175.6
  %77 = load i8, i8* %arrayidx176.6, align 1, !tbaa !6
  %arrayidx185.6 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 9
  store i8 %77, i8* %arrayidx185.6, align 1, !tbaa !6
  %arrayidx174.7 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 4
  %78 = load i8, i8* %arrayidx174.7, align 4, !tbaa !6
  %idxprom175.7 = zext i8 %78 to i64
  %arrayidx176.7 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 7, i64 %idxprom175.7
  %79 = load i8, i8* %arrayidx176.7, align 1, !tbaa !6
  %arrayidx185.7 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 13
  store i8 %79, i8* %arrayidx185.7, align 1, !tbaa !6
  %arrayidx174.8 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 10
  %80 = load i8, i8* %arrayidx174.8, align 2, !tbaa !6
  %idxprom175.8 = zext i8 %80 to i64
  %arrayidx176.8 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 8, i64 %idxprom175.8
  %81 = load i8, i8* %arrayidx176.8, align 1, !tbaa !6
  %arrayidx185.8 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 2
  store i8 %81, i8* %arrayidx185.8, align 2, !tbaa !6
  %arrayidx174.9 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 11
  %82 = load i8, i8* %arrayidx174.9, align 1, !tbaa !6
  %idxprom175.9 = zext i8 %82 to i64
  %arrayidx176.9 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 9, i64 %idxprom175.9
  %83 = load i8, i8* %arrayidx176.9, align 1, !tbaa !6
  %arrayidx185.9 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 6
  store i8 %83, i8* %arrayidx185.9, align 2, !tbaa !6
  %arrayidx174.10 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 8
  %84 = load i8, i8* %arrayidx174.10, align 8, !tbaa !6
  %idxprom175.10 = zext i8 %84 to i64
  %arrayidx176.10 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 10, i64 %idxprom175.10
  %85 = load i8, i8* %arrayidx176.10, align 1, !tbaa !6
  %arrayidx185.10 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 10
  store i8 %85, i8* %arrayidx185.10, align 2, !tbaa !6
  %arrayidx174.11 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 9
  %86 = load i8, i8* %arrayidx174.11, align 1, !tbaa !6
  %idxprom175.11 = zext i8 %86 to i64
  %arrayidx176.11 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 11, i64 %idxprom175.11
  %87 = load i8, i8* %arrayidx176.11, align 1, !tbaa !6
  %arrayidx185.11 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 14
  store i8 %87, i8* %arrayidx185.11, align 2, !tbaa !6
  %arrayidx174.12 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 15
  %88 = load i8, i8* %arrayidx174.12, align 1, !tbaa !6
  %idxprom175.12 = zext i8 %88 to i64
  %arrayidx176.12 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 12, i64 %idxprom175.12
  %89 = load i8, i8* %arrayidx176.12, align 1, !tbaa !6
  %arrayidx185.12 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 3
  store i8 %89, i8* %arrayidx185.12, align 1, !tbaa !6
  %arrayidx174.13 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 12
  %90 = load i8, i8* %arrayidx174.13, align 4, !tbaa !6
  %idxprom175.13 = zext i8 %90 to i64
  %arrayidx176.13 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 13, i64 %idxprom175.13
  %91 = load i8, i8* %arrayidx176.13, align 1, !tbaa !6
  %arrayidx185.13 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 7
  store i8 %91, i8* %arrayidx185.13, align 1, !tbaa !6
  %arrayidx174.14 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 13
  %92 = load i8, i8* %arrayidx174.14, align 1, !tbaa !6
  %idxprom175.14 = zext i8 %92 to i64
  %arrayidx176.14 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 14, i64 %idxprom175.14
  %93 = load i8, i8* %arrayidx176.14, align 1, !tbaa !6
  %arrayidx185.14 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 11
  store i8 %93, i8* %arrayidx185.14, align 1, !tbaa !6
  %arrayidx174.15 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 9, i64 14
  %94 = load i8, i8* %arrayidx174.15, align 2, !tbaa !6
  %idxprom175.15 = zext i8 %94 to i64
  %arrayidx176.15 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 4, i64 15, i64 %idxprom175.15
  %95 = load i8, i8* %arrayidx176.15, align 1, !tbaa !6
  %arrayidx185.15 = getelementptr inbounds [12 x [16 x i8]], [12 x [16 x i8]]* %t, i64 0, i64 10, i64 15
  store i8 %95, i8* %arrayidx185.15, align 1, !tbaa !6
  %call189 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i64 0, i64 0))
  %96 = load i8, i8* %arrayidx185, align 16, !tbaa !6
  %conv198 = zext i8 %96 to i32
  %call199 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198)
  %conv198.1 = zext i8 %73 to i32
  %call199.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.1)
  %conv198.2 = zext i8 %81 to i32
  %call199.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.2)
  %conv198.3 = zext i8 %89 to i32
  %call199.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.3)
  %97 = load i8, i8* %arrayidx185.1, align 4, !tbaa !6
  %conv198.4 = zext i8 %97 to i32
  %call199.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.4)
  %conv198.5 = zext i8 %75 to i32
  %call199.5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.5)
  %conv198.6 = zext i8 %83 to i32
  %call199.6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.6)
  %conv198.7 = zext i8 %91 to i32
  %call199.7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.7)
  %98 = load i8, i8* %arrayidx185.2, align 8, !tbaa !6
  %conv198.8 = zext i8 %98 to i32
  %call199.8 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.8)
  %conv198.9 = zext i8 %77 to i32
  %call199.9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.9)
  %conv198.10 = zext i8 %85 to i32
  %call199.10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.10)
  %conv198.11 = zext i8 %93 to i32
  %call199.11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.11)
  %99 = load i8, i8* %arrayidx185.3, align 4, !tbaa !6
  %conv198.12 = zext i8 %99 to i32
  %call199.12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.12)
  %conv198.13 = zext i8 %79 to i32
  %call199.13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.13)
  %conv198.14 = zext i8 %87 to i32
  %call199.14 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.14)
  %conv198.15 = zext i8 %95 to i32
  %call199.15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv198.15)
  %putchar277 = tail call i32 @putchar(i32 10)
  %call204 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0))
  %idxprom214 = zext i8 %96 to i64
  %arrayidx215 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214
  %100 = load i8, i8* %arrayidx215, align 1, !tbaa !6
  %conv216 = zext i8 %100 to i32
  %call217 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216)
  %101 = load i8, i8* %arrayidx185.4, align 1, !tbaa !6
  %idxprom214.1 = zext i8 %101 to i64
  %arrayidx215.1 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.1
  %102 = load i8, i8* %arrayidx215.1, align 1, !tbaa !6
  %conv216.1 = zext i8 %102 to i32
  %call217.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.1)
  %103 = load i8, i8* %arrayidx185.8, align 2, !tbaa !6
  %idxprom214.2 = zext i8 %103 to i64
  %arrayidx215.2 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.2
  %104 = load i8, i8* %arrayidx215.2, align 1, !tbaa !6
  %conv216.2 = zext i8 %104 to i32
  %call217.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.2)
  %idxprom214.3 = zext i8 %89 to i64
  %arrayidx215.3 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.3
  %105 = load i8, i8* %arrayidx215.3, align 1, !tbaa !6
  %conv216.3 = zext i8 %105 to i32
  %call217.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.3)
  %idxprom214.4 = zext i8 %97 to i64
  %arrayidx215.4 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.4
  %106 = load i8, i8* %arrayidx215.4, align 1, !tbaa !6
  %conv216.4 = zext i8 %106 to i32
  %call217.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.4)
  %107 = load i8, i8* %arrayidx185.5, align 1, !tbaa !6
  %idxprom214.5 = zext i8 %107 to i64
  %arrayidx215.5 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.5
  %108 = load i8, i8* %arrayidx215.5, align 1, !tbaa !6
  %conv216.5 = zext i8 %108 to i32
  %call217.5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.5)
  %109 = load i8, i8* %arrayidx185.9, align 2, !tbaa !6
  %idxprom214.6 = zext i8 %109 to i64
  %arrayidx215.6 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.6
  %110 = load i8, i8* %arrayidx215.6, align 1, !tbaa !6
  %conv216.6 = zext i8 %110 to i32
  %call217.6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.6)
  %idxprom214.7 = zext i8 %91 to i64
  %arrayidx215.7 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.7
  %111 = load i8, i8* %arrayidx215.7, align 1, !tbaa !6
  %conv216.7 = zext i8 %111 to i32
  %call217.7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.7)
  %idxprom214.8 = zext i8 %98 to i64
  %arrayidx215.8 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.8
  %112 = load i8, i8* %arrayidx215.8, align 1, !tbaa !6
  %conv216.8 = zext i8 %112 to i32
  %call217.8 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.8)
  %113 = load i8, i8* %arrayidx185.6, align 1, !tbaa !6
  %idxprom214.9 = zext i8 %113 to i64
  %arrayidx215.9 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.9
  %114 = load i8, i8* %arrayidx215.9, align 1, !tbaa !6
  %conv216.9 = zext i8 %114 to i32
  %call217.9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.9)
  %115 = load i8, i8* %arrayidx185.10, align 2, !tbaa !6
  %idxprom214.10 = zext i8 %115 to i64
  %arrayidx215.10 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.10
  %116 = load i8, i8* %arrayidx215.10, align 1, !tbaa !6
  %conv216.10 = zext i8 %116 to i32
  %call217.10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.10)
  %117 = load i8, i8* %arrayidx185.14, align 1, !tbaa !6
  %idxprom214.11 = zext i8 %117 to i64
  %arrayidx215.11 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.11
  %118 = load i8, i8* %arrayidx215.11, align 1, !tbaa !6
  %conv216.11 = zext i8 %118 to i32
  %call217.11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.11)
  %idxprom214.12 = zext i8 %99 to i64
  %arrayidx215.12 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.12
  %119 = load i8, i8* %arrayidx215.12, align 1, !tbaa !6
  %conv216.12 = zext i8 %119 to i32
  %call217.12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.12)
  %120 = load i8, i8* %arrayidx185.7, align 1, !tbaa !6
  %idxprom214.13 = zext i8 %120 to i64
  %arrayidx215.13 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.13
  %121 = load i8, i8* %arrayidx215.13, align 1, !tbaa !6
  %conv216.13 = zext i8 %121 to i32
  %call217.13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.13)
  %122 = load i8, i8* %arrayidx185.11, align 2, !tbaa !6
  %idxprom214.14 = zext i8 %122 to i64
  %arrayidx215.14 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.14
  %123 = load i8, i8* %arrayidx215.14, align 1, !tbaa !6
  %conv216.14 = zext i8 %123 to i32
  %call217.14 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.14)
  %124 = load i8, i8* %arrayidx185.15, align 1, !tbaa !6
  %idxprom214.15 = zext i8 %124 to i64
  %arrayidx215.15 = getelementptr inbounds %struct.aes_wb_s, %struct.aes_wb_s* %aes, i64 0, i32 1, i32 1, i64 %idxprom214.15
  %125 = load i8, i8* %arrayidx215.15, align 1, !tbaa !6
  %conv216.15 = zext i8 %125 to i32
  %call217.15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i32 %conv216.15)
  %putchar278 = tail call i32 @putchar(i32 10)
  br label %cleanup

cleanup:                                          ; preds = %for.body162.preheader, %is_hex_char.exit286, %is_hex_char.exit
  %retval.0 = phi i32 [ 0, %for.body162.preheader ], [ 1, %is_hex_char.exit ], [ 1, %is_hex_char.exit286 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #5
  call void @llvm.lifetime.end.p0i8(i64 192, i8* nonnull %1) #5
  call void @llvm.lifetime.end.p0i8(i64 349184, i8* nonnull %0) #5
  ret i32 %retval.0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nounwind
declare dso_local i64 @strtoul(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare i64 @fread_unlocked(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare i32 @putchar(i32) local_unnamed_addr #4

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final 375507)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!4, !4, i64 0}
