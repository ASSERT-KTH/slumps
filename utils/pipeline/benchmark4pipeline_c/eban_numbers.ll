; ModuleID = 'benchmark4pipeline_c/eban_numbers.c'
source_filename = "benchmark4pipeline_c/eban_numbers.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.Interval = type { i32, i32, i8 }

@__const.main.intervals = private unnamed_addr constant [8 x %struct.Interval] [%struct.Interval { i32 2, i32 1000, i8 1 }, %struct.Interval { i32 1000, i32 4000, i8 1 }, %struct.Interval { i32 2, i32 10000, i8 0 }, %struct.Interval { i32 2, i32 100000, i8 0 }, %struct.Interval { i32 2, i32 1000000, i8 0 }, %struct.Interval { i32 2, i32 10000000, i8 0 }, %struct.Interval { i32 2, i32 100000000, i8 0 }, %struct.Interval { i32 2, i32 1000000000, i8 0 }], align 16
@.str = private unnamed_addr constant [38 x i8] c"eban numbers up to and including %d:\0A\00", align 1
@.str.1 = private unnamed_addr constant [44 x i8] c"eban numbers between %d and %d (inclusive:)\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"count = %d\0A\0A\00", align 1

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %if.end73, %entry
  %idx.0148 = phi i32 [ 0, %entry ], [ %inc76, %if.end73 ]
  %intv.sroa.0.0..sroa_idx = getelementptr inbounds [8 x %struct.Interval], [8 x %struct.Interval]* @__const.main.intervals, i32 0, i32 %idx.0148, i32 0
  %intv.sroa.0.0.copyload = load i32, i32* %intv.sroa.0.0..sroa_idx, align 4
  %intv.sroa.6.0..sroa_idx131 = getelementptr inbounds [8 x %struct.Interval], [8 x %struct.Interval]* @__const.main.intervals, i32 0, i32 %idx.0148, i32 1
  %intv.sroa.6.0.copyload = load i32, i32* %intv.sroa.6.0..sroa_idx131, align 4
  %cmp1 = icmp eq i32 %idx.0148, 1
  br i1 %cmp1, label %if.else, label %if.then

if.then:                                          ; preds = %for.body
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0), i32 %intv.sroa.6.0.copyload)
  br label %if.end

if.else:                                          ; preds = %for.body
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i32 0, i32 0), i32 %intv.sroa.0.0.copyload, i32 %intv.sroa.6.0.copyload)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %cmp8143 = icmp sgt i32 %intv.sroa.0.0.copyload, %intv.sroa.6.0.copyload
  br i1 %cmp8143, label %for.end, label %for.body9.lr.ph

for.body9.lr.ph:                                  ; preds = %if.end
  %0 = icmp ult i32 %idx.0148, 2
  br i1 %0, label %for.body9.us, label %for.body9

for.body9.us:                                     ; preds = %for.body9.lr.ph, %if.end68.us
  %i.0145.us = phi i32 [ %add.us, %if.end68.us ], [ %intv.sroa.0.0.copyload, %for.body9.lr.ph ]
  %count.0144.us = phi i32 [ %count.1.us, %if.end68.us ], [ 0, %for.body9.lr.ph ]
  %rem.us = srem i32 %i.0145.us, 1000000000
  %div10.us = sdiv i32 %rem.us, 1000000
  %rem11.us = srem i32 %i.0145.us, 1000000
  %div12.us = sdiv i32 %rem11.us, 1000
  %1 = mul i32 %div12.us, 1000
  %2 = sub i32 %rem11.us, %1
  %rem11.off.us = add nsw i32 %rem11.us, -30000
  %3 = icmp ult i32 %rem11.off.us, 37000
  %rem23.us = srem i32 %div12.us, 10
  %t.0.us = select i1 %3, i32 %rem23.us, i32 %div12.us
  %rem13.off.us = add nsw i32 %2, -30
  %4 = icmp ult i32 %rem13.off.us, 37
  %rem29.us = srem i32 %2, 10
  %r.0.us = select i1 %4, i32 %rem29.us, i32 %2
  %i.0.off.us = add i32 %i.0145.us, 999999999
  %5 = icmp ult i32 %i.0.off.us, 1999999999
  %cmp32.us = icmp sgt i32 %i.0145.us, 1999999999
  %or.cond80.us = or i1 %cmp32.us, %5
  br i1 %or.cond80.us, label %if.then37.us, label %if.end68.us

if.then37.us:                                     ; preds = %for.body9.us
  %rem.off.us = add nsw i32 %rem.us, -30000000
  %6 = icmp ult i32 %rem.off.us, 37000000
  %rem17.us = srem i32 %div10.us, 10
  %m.0.us = select i1 %6, i32 %rem17.us, i32 %div10.us
  switch i32 %m.0.us, label %if.end68.us [
    i32 6, label %if.then45.us
    i32 4, label %if.then45.us
    i32 2, label %if.then45.us
    i32 0, label %if.then45.us
  ]

if.then45.us:                                     ; preds = %if.then37.us, %if.then37.us, %if.then37.us, %if.then37.us
  switch i32 %t.0.us, label %if.end68.us [
    i32 6, label %if.then53.us
    i32 4, label %if.then53.us
    i32 2, label %if.then53.us
    i32 0, label %if.then53.us
  ]

if.then53.us:                                     ; preds = %if.then45.us, %if.then45.us, %if.then45.us, %if.then45.us
  switch i32 %r.0.us, label %if.end68.us [
    i32 6, label %if.then62.us
    i32 4, label %if.then62.us
    i32 2, label %if.then62.us
    i32 0, label %if.then62.us
  ]

if.then62.us:                                     ; preds = %if.then53.us, %if.then53.us, %if.then53.us, %if.then53.us
  %call63.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %i.0145.us)
  %inc.us = add nsw i32 %count.0144.us, 1
  br label %if.end68.us

if.end68.us:                                      ; preds = %if.then62.us, %if.then53.us, %if.then45.us, %if.then37.us, %for.body9.us
  %count.1.us = phi i32 [ %inc.us, %if.then62.us ], [ %count.0144.us, %if.then53.us ], [ %count.0144.us, %if.then45.us ], [ %count.0144.us, %if.then37.us ], [ %count.0144.us, %for.body9.us ]
  %add.us = add nsw i32 %i.0145.us, 2
  %cmp8.us = icmp sgt i32 %add.us, %intv.sroa.6.0.copyload
  br i1 %cmp8.us, label %for.end, label %for.body9.us

for.body9:                                        ; preds = %for.body9.lr.ph, %if.end68
  %i.0145 = phi i32 [ %add, %if.end68 ], [ %intv.sroa.0.0.copyload, %for.body9.lr.ph ]
  %count.0144 = phi i32 [ %count.1, %if.end68 ], [ 0, %for.body9.lr.ph ]
  %rem = srem i32 %i.0145, 1000000000
  %div10 = sdiv i32 %rem, 1000000
  %rem11 = srem i32 %i.0145, 1000000
  %div12 = sdiv i32 %rem11, 1000
  %7 = mul i32 %div12, 1000
  %8 = sub i32 %rem11, %7
  %rem11.off = add nsw i32 %rem11, -30000
  %9 = icmp ult i32 %rem11.off, 37000
  %rem23 = srem i32 %div12, 10
  %t.0 = select i1 %9, i32 %rem23, i32 %div12
  %rem13.off = add nsw i32 %8, -30
  %10 = icmp ult i32 %rem13.off, 37
  %rem29 = srem i32 %8, 10
  %r.0 = select i1 %10, i32 %rem29, i32 %8
  %i.0.off = add i32 %i.0145, 999999999
  %11 = icmp ult i32 %i.0.off, 1999999999
  %cmp32 = icmp sgt i32 %i.0145, 1999999999
  %or.cond80 = or i1 %cmp32, %11
  br i1 %or.cond80, label %if.then37, label %if.end68

if.then37:                                        ; preds = %for.body9
  %rem.off = add nsw i32 %rem, -30000000
  %12 = icmp ult i32 %rem.off, 37000000
  %rem17 = srem i32 %div10, 10
  %m.0 = select i1 %12, i32 %rem17, i32 %div10
  switch i32 %m.0, label %if.end68 [
    i32 6, label %if.then45
    i32 4, label %if.then45
    i32 2, label %if.then45
    i32 0, label %if.then45
  ]

if.then45:                                        ; preds = %if.then37, %if.then37, %if.then37, %if.then37
  switch i32 %t.0, label %if.end68 [
    i32 6, label %if.then53
    i32 4, label %if.then53
    i32 2, label %if.then53
    i32 0, label %if.then53
  ]

if.then53:                                        ; preds = %if.then45, %if.then45, %if.then45, %if.then45
  switch i32 %r.0, label %if.end68 [
    i32 6, label %if.end64
    i32 4, label %if.end64
    i32 2, label %if.end64
    i32 0, label %if.end64
  ]

if.end64:                                         ; preds = %if.then53, %if.then53, %if.then53, %if.then53
  %inc = add nsw i32 %count.0144, 1
  br label %if.end68

if.end68:                                         ; preds = %if.then53, %if.then45, %if.then37, %if.end64, %for.body9
  %count.1 = phi i32 [ %inc, %if.end64 ], [ %count.0144, %if.then53 ], [ %count.0144, %if.then45 ], [ %count.0144, %if.then37 ], [ %count.0144, %for.body9 ]
  %add = add nsw i32 %i.0145, 2
  %cmp8 = icmp sgt i32 %add, %intv.sroa.6.0.copyload
  br i1 %cmp8, label %for.end, label %for.body9

for.end:                                          ; preds = %if.end68, %if.end68.us, %if.end
  %count.0.lcssa = phi i32 [ 0, %if.end ], [ %count.1.us, %if.end68.us ], [ %count.1, %if.end68 ]
  %13 = icmp ult i32 %idx.0148, 2
  br i1 %13, label %if.then71, label %if.end73

if.then71:                                        ; preds = %for.end
  %putchar = tail call i32 @putchar(i32 10)
  br label %if.end73

if.end73:                                         ; preds = %if.then71, %for.end
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0), i32 %count.0.lcssa)
  %inc76 = add nuw nsw i32 %idx.0148, 1
  %exitcond = icmp eq i32 %inc76, 8
  br i1 %exitcond, label %for.end77, label %for.body

for.end77:                                        ; preds = %if.end73
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
