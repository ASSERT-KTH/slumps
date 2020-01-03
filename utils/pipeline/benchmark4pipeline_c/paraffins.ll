; ModuleID = 'benchmark4pipeline_c/paraffins.c'
source_filename = "benchmark4pipeline_c/paraffins.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@rooted = hidden local_unnamed_addr global <{ i64, i64, [31 x i64] }> <{ i64 1, i64 1, [31 x i64] zeroinitializer }>, align 16
@unrooted = hidden local_unnamed_addr global <{ i64, i64, [31 x i64] }> <{ i64 1, i64 1, [31 x i64] zeroinitializer }>, align 16
@.str = private unnamed_addr constant [12 x i8] c"%llu: %llu\0A\00", align 1

; Function Attrs: norecurse nounwind readnone
define hidden i64 @choose(i64 %m, i64 %k) local_unnamed_addr #0 {
entry:
  %cmp111 = icmp ugt i64 %k, 1
  br i1 %cmp111, label %for.body, label %cleanup

for.body:                                         ; preds = %entry, %for.body
  %r.013 = phi i64 [ %div, %for.body ], [ %m, %entry ]
  %i.012 = phi i64 [ %add2, %for.body ], [ 1, %entry ]
  %add = add i64 %i.012, %m
  %mul = mul i64 %r.013, %add
  %add2 = add nuw i64 %i.012, 1
  %div = udiv i64 %mul, %add2
  %exitcond = icmp eq i64 %add2, %k
  br i1 %exitcond, label %cleanup, label %for.body

cleanup:                                          ; preds = %for.body, %entry
  %retval.0 = phi i64 [ %m, %entry ], [ %div, %for.body ]
  ret i64 %retval.0
}

; Function Attrs: nounwind
define hidden void @tree(i64 %br, i64 %n, i64 %cnt, i64 %sum, i64 %l) local_unnamed_addr #1 {
entry:
  %b.047 = add i64 %br, 1
  %cmp48 = icmp ult i64 %b.047, 5
  br i1 %cmp48, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %entry
  %idxprom = trunc i64 %n to i32
  %arrayidx = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @rooted to [33 x i64]*), i32 0, i32 %idxprom
  %mul5 = shl i64 %l, 1
  %dec44 = add i64 %n, -1
  %tobool45 = icmp eq i64 %dec44, 0
  br i1 %tobool45, label %for.body.us, label %for.body

for.body.us:                                      ; preds = %for.body.lr.ph, %if.end14.us
  %b.049.us = phi i64 [ %b.0.us, %if.end14.us ], [ %b.047, %for.body.lr.ph ]
  %sub.us = sub i64 %b.049.us, %br
  %mul.us = mul i64 %sub.us, %n
  %add1.us = add i64 %mul.us, %sum
  %cmp2.us = icmp ugt i64 %add1.us, 32
  br i1 %cmp2.us, label %cleanup, label %if.end.us

if.end.us:                                        ; preds = %for.body.us
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !2
  %cmp111.i.us = icmp ugt i64 %sub.us, 1
  br i1 %cmp111.i.us, label %for.body.i.us, label %choose.exit.us

for.body.i.us:                                    ; preds = %if.end.us, %for.body.i.us
  %r.013.i.us = phi i64 [ %div.i.us, %for.body.i.us ], [ %0, %if.end.us ]
  %i.012.i.us = phi i64 [ %add2.i.us, %for.body.i.us ], [ 1, %if.end.us ]
  %add.i.us = add i64 %i.012.i.us, %0
  %mul.i.us = mul i64 %add.i.us, %r.013.i.us
  %add2.i.us = add nuw nsw i64 %i.012.i.us, 1
  %div.i.us = udiv i64 %mul.i.us, %add2.i.us
  %exitcond.i.us = icmp eq i64 %add2.i.us, %sub.us
  br i1 %exitcond.i.us, label %choose.exit.us, label %for.body.i.us

choose.exit.us:                                   ; preds = %for.body.i.us, %if.end.us
  %retval.0.i.us = phi i64 [ %0, %if.end.us ], [ %div.i.us, %for.body.i.us ]
  %mul4.us = mul i64 %retval.0.i.us, %cnt
  %cmp6.us = icmp ult i64 %mul5, %add1.us
  br i1 %cmp6.us, label %if.then7.us, label %if.end11.us

if.then7.us:                                      ; preds = %choose.exit.us
  %idxprom8.us = trunc i64 %add1.us to i32
  %arrayidx9.us = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @unrooted to [33 x i64]*), i32 0, i32 %idxprom8.us
  %1 = load i64, i64* %arrayidx9.us, align 8, !tbaa !2
  %add10.us = add i64 %1, %mul4.us
  store i64 %add10.us, i64* %arrayidx9.us, align 8, !tbaa !2
  br label %if.end11.us

if.end11.us:                                      ; preds = %if.then7.us, %choose.exit.us
  %cmp12.us = icmp eq i64 %b.049.us, 4
  br i1 %cmp12.us, label %cleanup, label %if.end14.us

if.end14.us:                                      ; preds = %if.end11.us
  %idxprom15.us = trunc i64 %add1.us to i32
  %arrayidx16.us = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @rooted to [33 x i64]*), i32 0, i32 %idxprom15.us
  %2 = load i64, i64* %arrayidx16.us, align 8, !tbaa !2
  %add17.us = add i64 %2, %mul4.us
  store i64 %add17.us, i64* %arrayidx16.us, align 8, !tbaa !2
  %b.0.us = add i64 %b.049.us, 1
  %cmp.us = icmp ult i64 %b.0.us, 5
  br i1 %cmp.us, label %for.body.us, label %cleanup

for.cond.loopexit:                                ; preds = %for.body19
  %b.0 = add i64 %b.049, 1
  %cmp = icmp ult i64 %b.0, 5
  br i1 %cmp, label %for.body, label %cleanup

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.loopexit
  %b.049 = phi i64 [ %b.0, %for.cond.loopexit ], [ %b.047, %for.body.lr.ph ]
  %sub = sub i64 %b.049, %br
  %mul = mul i64 %sub, %n
  %add1 = add i64 %mul, %sum
  %cmp2 = icmp ugt i64 %add1, 32
  br i1 %cmp2, label %cleanup, label %if.end

if.end:                                           ; preds = %for.body
  %3 = load i64, i64* %arrayidx, align 8, !tbaa !2
  %cmp111.i = icmp ugt i64 %sub, 1
  br i1 %cmp111.i, label %for.body.i, label %choose.exit

for.body.i:                                       ; preds = %if.end, %for.body.i
  %r.013.i = phi i64 [ %div.i, %for.body.i ], [ %3, %if.end ]
  %i.012.i = phi i64 [ %add2.i, %for.body.i ], [ 1, %if.end ]
  %add.i = add i64 %i.012.i, %3
  %mul.i = mul i64 %add.i, %r.013.i
  %add2.i = add nuw nsw i64 %i.012.i, 1
  %div.i = udiv i64 %mul.i, %add2.i
  %exitcond.i = icmp eq i64 %add2.i, %sub
  br i1 %exitcond.i, label %choose.exit, label %for.body.i

choose.exit:                                      ; preds = %for.body.i, %if.end
  %retval.0.i = phi i64 [ %3, %if.end ], [ %div.i, %for.body.i ]
  %mul4 = mul i64 %retval.0.i, %cnt
  %cmp6 = icmp ult i64 %mul5, %add1
  br i1 %cmp6, label %if.then7, label %if.end11

if.then7:                                         ; preds = %choose.exit
  %idxprom8 = trunc i64 %add1 to i32
  %arrayidx9 = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @unrooted to [33 x i64]*), i32 0, i32 %idxprom8
  %4 = load i64, i64* %arrayidx9, align 8, !tbaa !2
  %add10 = add i64 %4, %mul4
  store i64 %add10, i64* %arrayidx9, align 8, !tbaa !2
  br label %if.end11

if.end11:                                         ; preds = %if.then7, %choose.exit
  %cmp12 = icmp eq i64 %b.049, 4
  br i1 %cmp12, label %cleanup, label %if.end14

if.end14:                                         ; preds = %if.end11
  %idxprom15 = trunc i64 %add1 to i32
  %arrayidx16 = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @rooted to [33 x i64]*), i32 0, i32 %idxprom15
  %5 = load i64, i64* %arrayidx16, align 8, !tbaa !2
  %add17 = add i64 %5, %mul4
  store i64 %add17, i64* %arrayidx16, align 8, !tbaa !2
  br label %for.body19

for.body19:                                       ; preds = %if.end14, %for.body19
  %dec46 = phi i64 [ %dec44, %if.end14 ], [ %dec, %for.body19 ]
  tail call void @tree(i64 %b.049, i64 %dec46, i64 %mul4, i64 %add1, i64 %l)
  %dec = add i64 %dec46, -1
  %tobool = icmp eq i64 %dec, 0
  br i1 %tobool, label %for.cond.loopexit, label %for.body19

cleanup:                                          ; preds = %for.body, %if.end11, %for.cond.loopexit, %for.body.us, %if.end11.us, %if.end14.us, %entry
  ret void
}

; Function Attrs: norecurse nounwind
define hidden void @bicenter(i32 %s) local_unnamed_addr #2 {
entry:
  %and = and i32 %s, 1
  %tobool = icmp eq i32 %and, 0
  br i1 %tobool, label %if.end, label %return

if.end:                                           ; preds = %entry
  %div = sdiv i32 %s, 2
  %arrayidx = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @rooted to [33 x i64]*), i32 0, i32 %div
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !2
  %add = add i64 %0, 1
  %mul = mul i64 %add, %0
  %div3 = lshr i64 %mul, 1
  %arrayidx4 = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @unrooted to [33 x i64]*), i32 0, i32 %s
  %1 = load i64, i64* %arrayidx4, align 8, !tbaa !2
  %add5 = add i64 %div3, %1
  store i64 %add5, i64* %arrayidx4, align 8, !tbaa !2
  br label %return

return:                                           ; preds = %entry, %if.end
  ret void
}

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #1 {
entry:
  br label %for.body

for.body:                                         ; preds = %bicenter.exit, %entry
  %n.010 = phi i64 [ 1, %entry ], [ %inc, %bicenter.exit ]
  tail call void @tree(i64 0, i64 %n.010, i64 1, i64 1, i64 %n.010)
  %conv = trunc i64 %n.010 to i32
  %and.i = and i32 %conv, 1
  %tobool.i = icmp eq i32 %and.i, 0
  br i1 %tobool.i, label %if.end.i, label %for.body.bicenter.exit_crit_edge

for.body.bicenter.exit_crit_edge:                 ; preds = %for.body
  %arrayidx.phi.trans.insert = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @unrooted to [33 x i64]*), i32 0, i32 %conv
  %.pre = load i64, i64* %arrayidx.phi.trans.insert, align 8, !tbaa !2
  br label %bicenter.exit

if.end.i:                                         ; preds = %for.body
  %div.i89 = lshr i32 %conv, 1
  %div.i8.zext = and i32 %div.i89, 127
  %arrayidx.i = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @rooted to [33 x i64]*), i32 0, i32 %div.i8.zext
  %0 = load i64, i64* %arrayidx.i, align 8, !tbaa !2
  %add.i = add i64 %0, 1
  %mul.i = mul i64 %add.i, %0
  %div3.i = lshr i64 %mul.i, 1
  %arrayidx4.i = getelementptr inbounds [33 x i64], [33 x i64]* bitcast (<{ i64, i64, [31 x i64] }>* @unrooted to [33 x i64]*), i32 0, i32 %conv
  %1 = load i64, i64* %arrayidx4.i, align 8, !tbaa !2
  %add5.i = add i64 %div3.i, %1
  store i64 %add5.i, i64* %arrayidx4.i, align 8, !tbaa !2
  br label %bicenter.exit

bicenter.exit:                                    ; preds = %for.body.bicenter.exit_crit_edge, %if.end.i
  %2 = phi i64 [ %.pre, %for.body.bicenter.exit_crit_edge ], [ %add5.i, %if.end.i ]
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i64 %n.010, i64 %2)
  %inc = add nuw nsw i64 %n.010, 1
  %exitcond = icmp eq i64 %inc, 33
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %bicenter.exit
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
