; ModuleID = '/home/jian/Desktop/duff.ll'
source_filename = "/home/jian/Desktop/duff.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @_Z4sendPcS_m(i8* %to, i8* %from, i64 %count) #0 {
entry:
  %add = add i64 %count, 7
  %div = udiv i64 %add, 8
  %rem = urem i64 %count, 8
  switch i64 %rem, label %sw.epilog [
    i64 0, label %sw.bb
    i64 7, label %sw.bb2
    i64 6, label %sw.bb5
    i64 5, label %sw.bb8
    i64 4, label %sw.bb11
    i64 3, label %sw.bb14
    i64 2, label %sw.bb17
    i64 1, label %sw.bb20
  ]

sw.bb:                                            ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %sw.bb
  %n.0 = phi i64 [ %dec, %do.cond ], [ %div, %sw.bb ]
  %from.addr.0 = phi i8* [ %incdec.ptr21, %do.cond ], [ %from, %sw.bb ]
  %to.addr.0 = phi i8* [ %incdec.ptr22, %do.cond ], [ %to, %sw.bb ]
  %incdec.ptr = getelementptr inbounds i8, i8* %from.addr.0, i32 1
  %0 = load i8, i8* %from.addr.0, align 1
  %incdec.ptr1 = getelementptr inbounds i8, i8* %to.addr.0, i32 1
  store i8 %0, i8* %to.addr.0, align 1
  br label %sw.bb2

sw.bb2:                                           ; preds = %do.body, %entry
  %n.1 = phi i64 [ %n.0, %do.body ], [ %div, %entry ]
  %from.addr.1 = phi i8* [ %incdec.ptr, %do.body ], [ %from, %entry ]
  %to.addr.1 = phi i8* [ %incdec.ptr1, %do.body ], [ %to, %entry ]
  %incdec.ptr3 = getelementptr inbounds i8, i8* %from.addr.1, i32 1
  %1 = load i8, i8* %from.addr.1, align 1
  %incdec.ptr4 = getelementptr inbounds i8, i8* %to.addr.1, i32 1
  store i8 %1, i8* %to.addr.1, align 1
  br label %sw.bb5

sw.bb5:                                           ; preds = %sw.bb2, %entry
  %n.2 = phi i64 [ %n.1, %sw.bb2 ], [ %div, %entry ]
  %from.addr.2 = phi i8* [ %incdec.ptr3, %sw.bb2 ], [ %from, %entry ]
  %to.addr.2 = phi i8* [ %incdec.ptr4, %sw.bb2 ], [ %to, %entry ]
  %incdec.ptr6 = getelementptr inbounds i8, i8* %from.addr.2, i32 1
  %2 = load i8, i8* %from.addr.2, align 1
  %incdec.ptr7 = getelementptr inbounds i8, i8* %to.addr.2, i32 1
  store i8 %2, i8* %to.addr.2, align 1
  br label %sw.bb8

sw.bb8:                                           ; preds = %sw.bb5, %entry
  %n.3 = phi i64 [ %n.2, %sw.bb5 ], [ %div, %entry ]
  %from.addr.3 = phi i8* [ %incdec.ptr6, %sw.bb5 ], [ %from, %entry ]
  %to.addr.3 = phi i8* [ %incdec.ptr7, %sw.bb5 ], [ %to, %entry ]
  %incdec.ptr9 = getelementptr inbounds i8, i8* %from.addr.3, i32 1
  %3 = load i8, i8* %from.addr.3, align 1
  %incdec.ptr10 = getelementptr inbounds i8, i8* %to.addr.3, i32 1
  store i8 %3, i8* %to.addr.3, align 1
  br label %sw.bb11

sw.bb11:                                          ; preds = %sw.bb8, %entry
  %n.4 = phi i64 [ %n.3, %sw.bb8 ], [ %div, %entry ]
  %from.addr.4 = phi i8* [ %incdec.ptr9, %sw.bb8 ], [ %from, %entry ]
  %to.addr.4 = phi i8* [ %incdec.ptr10, %sw.bb8 ], [ %to, %entry ]
  %incdec.ptr12 = getelementptr inbounds i8, i8* %from.addr.4, i32 1
  %4 = load i8, i8* %from.addr.4, align 1
  %incdec.ptr13 = getelementptr inbounds i8, i8* %to.addr.4, i32 1
  store i8 %4, i8* %to.addr.4, align 1
  br label %sw.bb14

sw.bb14:                                          ; preds = %sw.bb11, %entry
  %n.5 = phi i64 [ %n.4, %sw.bb11 ], [ %div, %entry ]
  %from.addr.5 = phi i8* [ %incdec.ptr12, %sw.bb11 ], [ %from, %entry ]
  %to.addr.5 = phi i8* [ %incdec.ptr13, %sw.bb11 ], [ %to, %entry ]
  %incdec.ptr15 = getelementptr inbounds i8, i8* %from.addr.5, i32 1
  %5 = load i8, i8* %from.addr.5, align 1
  %incdec.ptr16 = getelementptr inbounds i8, i8* %to.addr.5, i32 1
  store i8 %5, i8* %to.addr.5, align 1
  br label %sw.bb17

sw.bb17:                                          ; preds = %sw.bb14, %entry
  %n.6 = phi i64 [ %n.5, %sw.bb14 ], [ %div, %entry ]
  %from.addr.6 = phi i8* [ %incdec.ptr15, %sw.bb14 ], [ %from, %entry ]
  %to.addr.6 = phi i8* [ %incdec.ptr16, %sw.bb14 ], [ %to, %entry ]
  %incdec.ptr18 = getelementptr inbounds i8, i8* %from.addr.6, i32 1
  %6 = load i8, i8* %from.addr.6, align 1
  %incdec.ptr19 = getelementptr inbounds i8, i8* %to.addr.6, i32 1
  store i8 %6, i8* %to.addr.6, align 1
  br label %sw.bb20

sw.bb20:                                          ; preds = %sw.bb17, %entry
  %n.7 = phi i64 [ %div, %entry ], [ %n.6, %sw.bb17 ]
  %from.addr.7 = phi i8* [ %from, %entry ], [ %incdec.ptr18, %sw.bb17 ]
  %to.addr.7 = phi i8* [ %to, %entry ], [ %incdec.ptr19, %sw.bb17 ]
  %incdec.ptr21 = getelementptr inbounds i8, i8* %from.addr.7, i32 1
  %7 = load i8, i8* %from.addr.7, align 1
  %incdec.ptr22 = getelementptr inbounds i8, i8* %to.addr.7, i32 1
  store i8 %7, i8* %to.addr.7, align 1
  br label %do.cond

do.cond:                                          ; preds = %sw.bb20
  %dec = add i64 %n.7, -1
  %cmp = icmp ugt i64 %dec, 0
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %sw.epilog

sw.epilog:                                        ; preds = %do.end, %entry
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final 375507)"}
