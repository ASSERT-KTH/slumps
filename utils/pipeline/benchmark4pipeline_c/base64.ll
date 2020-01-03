; ModuleID = '/input/benchmark4pipeline_c/base64.c'
source_filename = "/input/benchmark4pipeline_c/base64.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [65 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00", align 1
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 4
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 4

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
entry:
  %c = alloca [4 x i8], align 1
  %0 = getelementptr inbounds [4 x i8], [4 x i8]* %c, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #4
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %c, i32 0, i32 2
  %arrayidx1 = getelementptr inbounds [4 x i8], [4 x i8]* %c, i32 0, i32 1
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %w.0 = phi i32 [ 0, %entry ], [ %w.1, %do.cond ]
  store i8 0, i8* %arrayidx, align 1, !tbaa !2
  store i8 0, i8* %arrayidx1, align 1, !tbaa !2
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4, !tbaa !5
  %call = tail call i32 @fileno(%struct._IO_FILE* %1) #4
  %call2 = call i32 @read(i32 %call, i8* nonnull %0, i32 3) #4
  %tobool = icmp eq i32 %call2, 0
  br i1 %tobool, label %do.end, label %if.end

if.end:                                           ; preds = %do.body
  %2 = load i8, i8* %0, align 1, !tbaa !2
  %conv = zext i8 %2 to i32
  %shl = shl nuw nsw i32 %conv, 16
  %3 = load i8, i8* %arrayidx1, align 1, !tbaa !2
  %conv5 = zext i8 %3 to i32
  %shl6 = shl nuw nsw i32 %conv5, 8
  %or = or i32 %shl6, %shl
  %4 = load i8, i8* %arrayidx, align 1, !tbaa !2
  %conv8 = zext i8 %4 to i32
  %shr = lshr i32 %conv, 2
  %arrayidx10 = getelementptr inbounds [65 x i8], [65 x i8]* @.str, i32 0, i32 %shr
  %5 = load i8, i8* %arrayidx10, align 1, !tbaa !2
  %conv11 = sext i8 %5 to i32
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !tbaa !5
  %call.i = tail call i32 @_IO_putc(i32 %conv11, %struct._IO_FILE* %6) #4
  %shr13 = lshr i32 %or, 12
  %and = and i32 %shr13, 63
  %arrayidx14 = getelementptr inbounds [65 x i8], [65 x i8]* @.str, i32 0, i32 %and
  %7 = load i8, i8* %arrayidx14, align 1, !tbaa !2
  %conv15 = sext i8 %7 to i32
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !tbaa !5
  %call.i57 = tail call i32 @_IO_putc(i32 %conv15, %struct._IO_FILE* %8) #4
  %cmp = icmp eq i32 %call2, 1
  br i1 %cmp, label %cond.end.thread, label %cond.end

cond.end.thread:                                  ; preds = %if.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !tbaa !5
  %call.i5862 = tail call i32 @_IO_putc(i32 61, %struct._IO_FILE* %9) #4
  br label %cond.end30

cond.end:                                         ; preds = %if.end
  %or9 = or i32 %shl6, %conv8
  %shr18 = lshr i32 %or9, 6
  %and19 = and i32 %shr18, 63
  %arrayidx20 = getelementptr inbounds [65 x i8], [65 x i8]* @.str, i32 0, i32 %and19
  %10 = load i8, i8* %arrayidx20, align 1, !tbaa !2
  %conv21 = sext i8 %10 to i32
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !tbaa !5
  %call.i58 = tail call i32 @_IO_putc(i32 %conv21, %struct._IO_FILE* %11) #4
  %cmp23 = icmp ult i32 %call2, 3
  br i1 %cmp23, label %cond.end30, label %cond.false26

cond.false26:                                     ; preds = %cond.end
  %and27 = and i32 %conv8, 63
  %arrayidx28 = getelementptr inbounds [65 x i8], [65 x i8]* @.str, i32 0, i32 %and27
  %12 = load i8, i8* %arrayidx28, align 1, !tbaa !2
  %conv29 = sext i8 %12 to i32
  br label %cond.end30

cond.end30:                                       ; preds = %cond.end.thread, %cond.end, %cond.false26
  %cond31 = phi i32 [ %conv29, %cond.false26 ], [ 61, %cond.end ], [ 61, %cond.end.thread ]
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !tbaa !5
  %call.i59 = tail call i32 @_IO_putc(i32 %cond31, %struct._IO_FILE* %13) #4
  %inc = add i32 %w.0, 1
  %cmp33 = icmp eq i32 %inc, 19
  br i1 %cmp33, label %if.then35, label %do.cond

if.then35:                                        ; preds = %cond.end30
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !tbaa !5
  %call.i60 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %14) #4
  br label %do.cond

do.cond:                                          ; preds = %cond.end30, %if.then35
  %w.1 = phi i32 [ 0, %if.then35 ], [ %inc, %cond.end30 ]
  %cmp38 = icmp eq i32 %call2, 3
  br i1 %cmp38, label %do.body, label %do.end

do.end:                                           ; preds = %do.body, %do.cond
  %w.2 = phi i32 [ %w.1, %do.cond ], [ %w.0, %do.body ]
  %tobool40 = icmp eq i32 %w.2, 0
  br i1 %tobool40, label %if.end43, label %if.then41

if.then41:                                        ; preds = %do.end
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4, !tbaa !5
  %call.i61 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %15) #4
  br label %if.end43

if.end43:                                         ; preds = %do.end, %if.then41
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare i32 @read(i32, i8* nocapture, i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

declare i32 @_IO_putc(i32, %struct._IO_FILE*) local_unnamed_addr #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
