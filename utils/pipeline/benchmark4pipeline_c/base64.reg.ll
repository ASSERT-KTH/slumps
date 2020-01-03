; ModuleID = '/input/benchmark4pipeline_c/base64.ll'
source_filename = "/input/benchmark4pipeline_c/base64.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [65 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00", align 1
@stdin = external global %struct._IO_FILE*, align 4

; Function Attrs: noinline nounwind
define hidden i32 @main() #0 {
entry:
  %c = alloca [4 x i8], align 1
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %w.0 = phi i32 [ 0, %entry ], [ %w.1, %do.cond ]
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %c, i32 0, i32 2
  store i8 0, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [4 x i8], [4 x i8]* %c, i32 0, i32 1
  store i8 0, i8* %arrayidx1, align 1
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %0) #3
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %c, i32 0, i32 0
  %call2 = call i32 @read(i32 %call, i8* %arraydecay, i32 3)
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %do.body
  br label %do.end

if.end:                                           ; preds = %do.body
  %arrayidx3 = getelementptr inbounds [4 x i8], [4 x i8]* %c, i32 0, i32 0
  %1 = load i8, i8* %arrayidx3, align 1
  %conv = zext i8 %1 to i32
  %shl = shl i32 %conv, 16
  %arrayidx4 = getelementptr inbounds [4 x i8], [4 x i8]* %c, i32 0, i32 1
  %2 = load i8, i8* %arrayidx4, align 1
  %conv5 = zext i8 %2 to i32
  %shl6 = shl i32 %conv5, 8
  %or = or i32 %shl, %shl6
  %arrayidx7 = getelementptr inbounds [4 x i8], [4 x i8]* %c, i32 0, i32 2
  %3 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %3 to i32
  %or9 = or i32 %or, %conv8
  %shr = lshr i32 %or9, 18
  %arrayidx10 = getelementptr inbounds i8, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %shr
  %4 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %4 to i32
  %call12 = call i32 @putchar(i32 %conv11)
  %shr13 = lshr i32 %or9, 12
  %and = and i32 %shr13, 63
  %arrayidx14 = getelementptr inbounds i8, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %and
  %5 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %5 to i32
  %call16 = call i32 @putchar(i32 %conv15)
  %cmp = icmp ult i32 %call2, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %shr18 = lshr i32 %or9, 6
  %and19 = and i32 %shr18, 63
  %arrayidx20 = getelementptr inbounds i8, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %and19
  %6 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %6 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 61, %cond.true ], [ %conv21, %cond.false ]
  %call22 = call i32 @putchar(i32 %cond)
  %cmp23 = icmp ult i32 %call2, 3
  br i1 %cmp23, label %cond.true25, label %cond.false26

cond.true25:                                      ; preds = %cond.end
  br label %cond.end30

cond.false26:                                     ; preds = %cond.end
  %and27 = and i32 %or9, 63
  %arrayidx28 = getelementptr inbounds i8, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), i32 %and27
  %7 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %7 to i32
  br label %cond.end30

cond.end30:                                       ; preds = %cond.false26, %cond.true25
  %cond31 = phi i32 [ 61, %cond.true25 ], [ %conv29, %cond.false26 ]
  %call32 = call i32 @putchar(i32 %cond31)
  %inc = add i32 %w.0, 1
  %cmp33 = icmp eq i32 %inc, 19
  br i1 %cmp33, label %if.then35, label %if.end37

if.then35:                                        ; preds = %cond.end30
  %call36 = call i32 @putchar(i32 10)
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %cond.end30
  %w.1 = phi i32 [ 0, %if.then35 ], [ %inc, %cond.end30 ]
  br label %do.cond

do.cond:                                          ; preds = %if.end37
  %cmp38 = icmp eq i32 %call2, 3
  br i1 %cmp38, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.then
  %w.2 = phi i32 [ %w.1, %do.cond ], [ %w.0, %if.then ]
  %tobool40 = icmp ne i32 %w.2, 0
  br i1 %tobool40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %do.end
  %call42 = call i32 @putchar(i32 10)
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %do.end
  ret i32 0
}

declare i32 @read(i32, i8*, i32) #1

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE*) #2

declare i32 @putchar(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
