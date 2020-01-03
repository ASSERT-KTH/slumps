; ModuleID = 'benchmark4pipeline_c/aliquot_sequence_classifications_1.c'
source_filename = "benchmark4pipeline_c/aliquot_sequence_classifications_1.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [38 x i8] c"\0AInteger : %llu, Type : %s, Series : \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"%llu, \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%llu\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"Terminating\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"Perfect\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"Amicable\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Aspiring\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"Sociable\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"Cyclic\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"Non-Terminating\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"Usage : %s <positive integer>\00", align 1

; Function Attrs: norecurse nounwind readnone
define hidden i64 @bruteForceProperDivisorSum(i64 %n) local_unnamed_addr #0 {
entry:
  %add = add i64 %n, 1
  %div = lshr i64 %add, 1
  %cmp13 = icmp ugt i64 %add, 3
  br i1 %cmp13, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %sum.015 = phi i64 [ %sum.1, %for.body ], [ 0, %entry ]
  %i.014 = phi i64 [ %inc, %for.body ], [ 1, %entry ]
  %rem = urem i64 %n, %i.014
  %cmp1 = icmp ne i64 %rem, 0
  %cmp2 = icmp eq i64 %i.014, %n
  %or.cond = or i1 %cmp2, %cmp1
  %add3 = select i1 %or.cond, i64 0, i64 %i.014
  %sum.1 = add i64 %add3, %sum.015
  %inc = add nuw nsw i64 %i.014, 1
  %cmp = icmp ult i64 %inc, %div
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %sum.0.lcssa = phi i64 [ 0, %entry ], [ %sum.1, %for.body ]
  ret i64 %sum.0.lcssa
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
define hidden void @printSeries(i64* nocapture readonly %arr, i32 %size, i8* %type) local_unnamed_addr #2 {
entry:
  %0 = load i64, i64* %arr, align 8, !tbaa !2
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %0, i8* %type)
  %sub = add i32 %size, -1
  %cmp9 = icmp sgt i32 %sub, 0
  %1 = load i64, i64* %arr, align 8, !tbaa !2
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %2 = phi i64 [ %3, %for.body ], [ %1, %entry ]
  %i.010 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %2)
  %inc = add nuw nsw i32 %i.010, 1
  %arrayidx1 = getelementptr inbounds i64, i64* %arr, i32 %inc
  %3 = load i64, i64* %arrayidx1, align 8, !tbaa !2
  %exitcond = icmp eq i32 %inc, %sub
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %.lcssa = phi i64 [ %1, %entry ], [ %3, %for.body ]
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %.lcssa)
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden void @aliquotClassifier(i64 %n) local_unnamed_addr #2 {
entry:
  %arr = alloca [16 x i64], align 16
  %0 = bitcast [16 x i64]* %arr to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %0) #5
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i32 0, i32 0
  store i64 %n, i64* %arrayidx, align 16, !tbaa !2
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc49
  %1 = phi i64 [ %n, %entry ], [ %sum.1.i, %for.inc49 ]
  %i.0131 = phi i32 [ 1, %entry ], [ %inc50, %for.inc49 ]
  %add.i = add i64 %1, 1
  %div.i = lshr i64 %add.i, 1
  %cmp13.i = icmp ugt i64 %add.i, 3
  br i1 %cmp13.i, label %for.body.i, label %if.then.thread

if.then.thread:                                   ; preds = %for.body
  %arrayidx2109 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i32 0, i32 %i.0131
  store i64 0, i64* %arrayidx2109, align 8, !tbaa !2
  br label %cond.end37

for.body.i:                                       ; preds = %for.body, %for.body.i
  %sum.015.i = phi i64 [ %sum.1.i, %for.body.i ], [ 0, %for.body ]
  %i.014.i = phi i64 [ %inc.i, %for.body.i ], [ 1, %for.body ]
  %rem.i = urem i64 %1, %i.014.i
  %cmp1.i = icmp ne i64 %rem.i, 0
  %cmp2.i = icmp eq i64 %i.014.i, %1
  %or.cond.i = or i1 %cmp2.i, %cmp1.i
  %add3.i = select i1 %or.cond.i, i64 0, i64 %i.014.i
  %sum.1.i = add i64 %add3.i, %sum.015.i
  %inc.i = add nuw nsw i64 %i.014.i, 1
  %cmp.i = icmp ult i64 %inc.i, %div.i
  br i1 %cmp.i, label %for.body.i, label %bruteForceProperDivisorSum.exit

bruteForceProperDivisorSum.exit:                  ; preds = %for.body.i
  %arrayidx2 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i32 0, i32 %i.0131
  store i64 %sum.1.i, i64* %arrayidx2, align 8, !tbaa !2
  %cmp4 = icmp eq i64 %sum.1.i, 0
  %cmp6 = icmp eq i64 %sum.1.i, %n
  %or.cond87 = or i1 %cmp4, %cmp6
  %or.cond87.not = xor i1 %or.cond87, true
  %cmp11 = icmp ne i64 %sum.1.i, %1
  %or.cond116 = and i1 %cmp11, %or.cond87.not
  br i1 %or.cond116, label %for.cond39.preheader, label %if.then

for.cond39.preheader:                             ; preds = %bruteForceProperDivisorSum.exit
  %cmp40129 = icmp ugt i32 %i.0131, 1
  br i1 %cmp40129, label %for.body41, label %for.inc49

if.then:                                          ; preds = %bruteForceProperDivisorSum.exit
  br i1 %cmp4, label %cond.end37, label %cond.false

cond.false:                                       ; preds = %if.then
  %cmp19 = icmp eq i32 %i.0131, 1
  %or.cond = and i1 %cmp19, %cmp6
  br i1 %or.cond, label %cond.end37, label %cond.false21

cond.false21:                                     ; preds = %cond.false
  %cmp25 = icmp eq i32 %i.0131, 2
  %or.cond56 = and i1 %cmp25, %cmp6
  br i1 %or.cond56, label %cond.end37, label %cond.false27

cond.false27:                                     ; preds = %cond.false21
  %cmp31 = icmp eq i64 %sum.1.i, %1
  %phitmp = select i1 %cmp6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0)
  %2 = select i1 %cmp31, i8* %phitmp, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0)
  br label %cond.end37

cond.end37:                                       ; preds = %if.then.thread, %cond.false27, %cond.false, %cond.false21, %if.then
  %cond38 = phi i8* [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), %if.then ], [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), %cond.false ], [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0), %cond.false21 ], [ %2, %cond.false27 ], [ getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), %if.then.thread ]
  %3 = load i64, i64* %arrayidx, align 16, !tbaa !2
  %call.i91 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %3, i8* %cond38) #5
  br label %for.body.i97

for.body.i97:                                     ; preds = %for.body.i97, %cond.end37
  %4 = phi i64 [ %5, %for.body.i97 ], [ %3, %cond.end37 ]
  %i.010.i92 = phi i32 [ %inc.i94, %for.body.i97 ], [ 0, %cond.end37 ]
  %call2.i93 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %4) #5
  %inc.i94 = add nuw nsw i32 %i.010.i92, 1
  %arrayidx1.i95 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i32 0, i32 %inc.i94
  %5 = load i64, i64* %arrayidx1.i95, align 8, !tbaa !2
  %exitcond.i96 = icmp eq i32 %inc.i94, %i.0131
  br i1 %exitcond.i96, label %printSeries.exit99, label %for.body.i97

printSeries.exit99:                               ; preds = %for.body.i97
  %call4.i98 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %5) #5
  br label %cleanup

for.cond39:                                       ; preds = %for.body41
  %cmp40 = icmp ult i32 %inc, %i.0131
  br i1 %cmp40, label %for.body41, label %for.inc49

for.body41:                                       ; preds = %for.cond39.preheader, %for.cond39
  %j.0130 = phi i32 [ %inc, %for.cond39 ], [ 1, %for.cond39.preheader ]
  %arrayidx42 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i32 0, i32 %j.0130
  %6 = load i64, i64* %arrayidx42, align 8, !tbaa !2
  %cmp44 = icmp eq i64 %6, %sum.1.i
  %inc = add nuw nsw i32 %j.0130, 1
  br i1 %cmp44, label %if.then45, label %for.cond39

if.then45:                                        ; preds = %for.body41
  %7 = load i64, i64* %arrayidx, align 16, !tbaa !2
  %call.i100 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0)) #5
  br label %for.body.i106

for.body.i106:                                    ; preds = %for.body.i106, %if.then45
  %8 = phi i64 [ %9, %for.body.i106 ], [ %7, %if.then45 ]
  %i.010.i101 = phi i32 [ %inc.i103, %for.body.i106 ], [ 0, %if.then45 ]
  %call2.i102 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %8) #5
  %inc.i103 = add nuw nsw i32 %i.010.i101, 1
  %arrayidx1.i104 = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i32 0, i32 %inc.i103
  %9 = load i64, i64* %arrayidx1.i104, align 8, !tbaa !2
  %exitcond.i105 = icmp eq i32 %inc.i103, %i.0131
  br i1 %exitcond.i105, label %printSeries.exit108, label %for.body.i106

printSeries.exit108:                              ; preds = %for.body.i106
  %call4.i107 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %9) #5
  br label %cleanup

for.inc49:                                        ; preds = %for.cond39, %for.cond39.preheader
  %inc50 = add nuw nsw i32 %i.0131, 1
  %cmp = icmp ult i32 %inc50, 16
  br i1 %cmp, label %for.body, label %for.end51

for.end51:                                        ; preds = %for.inc49
  %10 = load i64, i64* %arrayidx, align 16, !tbaa !2
  %call.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i64 %10, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i32 0, i32 0)) #5
  br label %for.body.i90

for.body.i90:                                     ; preds = %for.body.i90, %for.end51
  %11 = phi i64 [ %12, %for.body.i90 ], [ %10, %for.end51 ]
  %i.010.i = phi i32 [ %inc.i89, %for.body.i90 ], [ 0, %for.end51 ]
  %call2.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i64 %11) #5
  %inc.i89 = add nuw nsw i32 %i.010.i, 1
  %arrayidx1.i = getelementptr inbounds [16 x i64], [16 x i64]* %arr, i32 0, i32 %inc.i89
  %12 = load i64, i64* %arrayidx1.i, align 8, !tbaa !2
  %exitcond.i = icmp eq i32 %inc.i89, %inc50
  br i1 %exitcond.i, label %printSeries.exit, label %for.body.i90

printSeries.exit:                                 ; preds = %for.body.i90
  %call4.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %12) #5
  br label %cleanup

cleanup:                                          ; preds = %printSeries.exit, %printSeries.exit108, %printSeries.exit99
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %0) #5
  ret void
}

; Function Attrs: nounwind
define hidden void @processFile(i8* nocapture readonly %fileName) local_unnamed_addr #2 {
entry:
  %str = alloca [21 x i8], align 16
  %call = tail call %struct._IO_FILE* @fopen(i8* %fileName, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  %0 = getelementptr inbounds [21 x i8], [21 x i8]* %str, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %0) #5
  %call17 = call i8* @fgets(i8* nonnull %0, i32 21, %struct._IO_FILE* %call)
  %cmp8 = icmp eq i8* %call17, null
  br i1 %cmp8, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %call3 = call i64 @strtoull(i8* nocapture nonnull %0, i8** null, i32 10) #5
  call void @aliquotClassifier(i64 %call3)
  %call1 = call i8* @fgets(i8* nonnull %0, i32 21, %struct._IO_FILE* %call)
  %cmp = icmp eq i8* %call1, null
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %call4 = call i32 @fclose(%struct._IO_FILE* %call)
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %0) #5
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind
declare i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @strtoull(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
define hidden i32 @main(i32 %argC, i8** nocapture readonly %argV) local_unnamed_addr #2 {
entry:
  %str.i = alloca [21 x i8], align 16
  %cmp = icmp eq i32 %argC, 2
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %argV, align 4, !tbaa !6
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i32 0, i32 0), i8* %0)
  br label %if.end9

if.else:                                          ; preds = %entry
  %arrayidx1 = getelementptr inbounds i8*, i8** %argV, i32 1
  %1 = load i8*, i8** %arrayidx1, align 4, !tbaa !6
  %call2 = tail call i8* @strchr(i8* %1, i32 46) #6
  %cmp3 = icmp eq i8* %call2, null
  br i1 %cmp3, label %if.else6, label %if.then4

if.then4:                                         ; preds = %if.else
  %call.i = tail call %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0)) #5
  %2 = getelementptr inbounds [21 x i8], [21 x i8]* %str.i, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %2) #5
  %call17.i = call i8* @fgets(i8* nonnull %2, i32 21, %struct._IO_FILE* %call.i) #5
  %cmp8.i = icmp eq i8* %call17.i, null
  br i1 %cmp8.i, label %processFile.exit, label %while.body.i

while.body.i:                                     ; preds = %if.then4, %while.body.i
  %call3.i = call i64 @strtoull(i8* nocapture nonnull %2, i8** null, i32 10) #5
  call void @aliquotClassifier(i64 %call3.i) #5
  %call1.i = call i8* @fgets(i8* nonnull %2, i32 21, %struct._IO_FILE* %call.i) #5
  %cmp.i = icmp eq i8* %call1.i, null
  br i1 %cmp.i, label %processFile.exit, label %while.body.i

processFile.exit:                                 ; preds = %while.body.i, %if.then4
  %call4.i = call i32 @fclose(%struct._IO_FILE* %call.i) #5
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %2) #5
  br label %if.end9

if.else6:                                         ; preds = %if.else
  %call8 = tail call i64 @strtoull(i8* nocapture %1, i8** null, i32 10) #5
  tail call void @aliquotClassifier(i64 %call8)
  br label %if.end9

if.end9:                                          ; preds = %processFile.exit, %if.else6, %if.then
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) local_unnamed_addr #4

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
