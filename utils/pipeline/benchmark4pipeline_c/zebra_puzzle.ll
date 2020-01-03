; ModuleID = 'benchmark4pipeline_c/zebra_puzzle.c'
source_filename = "benchmark4pipeline_c/zebra_puzzle.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

@.str = private unnamed_addr constant [4 x i8] c"Red\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"Green\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"White\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Yellow\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Blue\00", align 1
@__const.printHouses.color = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)], align 16
@.str.5 = private unnamed_addr constant [8 x i8] c"English\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"Swede\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"Dane\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"German\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"Norwegian\00", align 1
@__const.printHouses.man = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i32 0, i32 0)], align 16
@.str.10 = private unnamed_addr constant [4 x i8] c"Tea\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"Coffee\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"Milk\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"Beer\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"Water\00", align 1
@__const.printHouses.drink = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0)], align 16
@.str.15 = private unnamed_addr constant [4 x i8] c"Dog\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"Birds\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"Cats\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"Horse\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"Zebra\00", align 1
@__const.printHouses.animal = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0)], align 16
@.str.20 = private unnamed_addr constant [9 x i8] c"PallMall\00", align 1
@.str.21 = private unnamed_addr constant [8 x i8] c"Dunhill\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"Blend\00", align 1
@.str.23 = private unnamed_addr constant [11 x i8] c"BlueMaster\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"Prince\00", align 1
@__const.printHouses.smoke = private unnamed_addr constant [5 x i8*] [i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i32 0, i32 0)], align 16
@.str.25 = private unnamed_addr constant [50 x i8] c"%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s\0A\00", align 1
@.str.26 = private unnamed_addr constant [6 x i8] c"House\00", align 1
@.str.27 = private unnamed_addr constant [6 x i8] c"Color\00", align 1
@.str.28 = private unnamed_addr constant [4 x i8] c"Man\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"Drink\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"Animal\00", align 1
@.str.31 = private unnamed_addr constant [6 x i8] c"Smoke\00", align 1
@.str.32 = private unnamed_addr constant [6 x i8] c"%-10d\00", align 1
@.str.33 = private unnamed_addr constant [9 x i8] c"%-10.10s\00", align 1
@.str.35 = private unnamed_addr constant [10 x i8] c"%-10.10s\0A\00", align 1
@str = private unnamed_addr constant [2 x i8] c"-\00", align 1

; Function Attrs: nounwind
define hidden void @printHouses([5 x i32]* nocapture readonly %ha) local_unnamed_addr #0 {
entry:
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.31, i32 0, i32 0))
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.inc
  ret void

for.body:                                         ; preds = %for.inc, %entry
  %i.079 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.32, i32 0, i32 0), i32 %i.079)
  %arrayidx2 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.079, i32 0
  %0 = load i32, i32* %arrayidx2, align 4, !tbaa !2
  %cmp3 = icmp sgt i32 %0, -1
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %arrayidx6 = getelementptr inbounds [5 x i8*], [5 x i8*]* @__const.printHouses.color, i32 0, i32 %0
  %1 = load i8*, i8** %arrayidx6, align 4, !tbaa !6
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* %1)
  br label %if.end

if.else:                                          ; preds = %for.body
  %call8 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %arrayidx10 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.079, i32 1
  %2 = load i32, i32* %arrayidx10, align 4, !tbaa !2
  %cmp11 = icmp sgt i32 %2, -1
  br i1 %cmp11, label %if.then12, label %if.else17

if.then12:                                        ; preds = %if.end
  %arrayidx15 = getelementptr inbounds [5 x i8*], [5 x i8*]* @__const.printHouses.man, i32 0, i32 %2
  %3 = load i8*, i8** %arrayidx15, align 4, !tbaa !6
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* %3)
  br label %if.end19

if.else17:                                        ; preds = %if.end
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %if.end19

if.end19:                                         ; preds = %if.else17, %if.then12
  %arrayidx21 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.079, i32 2
  %4 = load i32, i32* %arrayidx21, align 4, !tbaa !2
  %cmp22 = icmp sgt i32 %4, -1
  br i1 %cmp22, label %if.then23, label %if.else28

if.then23:                                        ; preds = %if.end19
  %arrayidx26 = getelementptr inbounds [5 x i8*], [5 x i8*]* @__const.printHouses.drink, i32 0, i32 %4
  %5 = load i8*, i8** %arrayidx26, align 4, !tbaa !6
  %call27 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* %5)
  br label %if.end30

if.else28:                                        ; preds = %if.end19
  %call29 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %if.end30

if.end30:                                         ; preds = %if.else28, %if.then23
  %arrayidx32 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.079, i32 3
  %6 = load i32, i32* %arrayidx32, align 4, !tbaa !2
  %cmp33 = icmp sgt i32 %6, -1
  br i1 %cmp33, label %if.then34, label %if.else39

if.then34:                                        ; preds = %if.end30
  %arrayidx37 = getelementptr inbounds [5 x i8*], [5 x i8*]* @__const.printHouses.animal, i32 0, i32 %6
  %7 = load i8*, i8** %arrayidx37, align 4, !tbaa !6
  %call38 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* %7)
  br label %if.end41

if.else39:                                        ; preds = %if.end30
  %call40 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %if.end41

if.end41:                                         ; preds = %if.else39, %if.then34
  %arrayidx43 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.079, i32 4
  %8 = load i32, i32* %arrayidx43, align 4, !tbaa !2
  %cmp44 = icmp sgt i32 %8, -1
  br i1 %cmp44, label %if.then45, label %if.else50

if.then45:                                        ; preds = %if.end41
  %arrayidx48 = getelementptr inbounds [5 x i8*], [5 x i8*]* @__const.printHouses.smoke, i32 0, i32 %8
  %9 = load i8*, i8** %arrayidx48, align 4, !tbaa !6
  %call49 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.35, i32 0, i32 0), i8* %9)
  br label %for.inc

if.else50:                                        ; preds = %if.end41
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i32 0, i32 0))
  br label %for.inc

for.inc:                                          ; preds = %if.then45, %if.else50
  %inc = add nuw nsw i32 %i.079, 1
  %exitcond = icmp eq i32 %inc, 5
  br i1 %exitcond, label %for.cond.cleanup, label %for.body
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i1) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind readonly
define hidden i32 @checkHouses([5 x i32]* readonly %ha) local_unnamed_addr #3 {
entry:
  %arrayidx1 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 2, i32 2
  %0 = load i32, i32* %arrayidx1, align 4, !tbaa !2
  %cmp = icmp slt i32 %0, 0
  %cmp4 = icmp eq i32 %0, 2
  %or.cond745 = or i1 %cmp, %cmp4
  br i1 %or.cond745, label %if.end, label %cleanup477

if.end:                                           ; preds = %entry
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 0, i32 1
  %1 = load i32, i32* %arrayidx6, align 4, !tbaa !2
  %cmp7 = icmp slt i32 %1, 0
  %cmp11 = icmp eq i32 %1, 4
  %or.cond746 = or i1 %cmp7, %cmp11
  br i1 %or.cond746, label %for.cond.preheader, label %cleanup477

for.cond.preheader:                               ; preds = %if.end
  %arrayidx258 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 1, i32 3
  %arrayidx419 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 1, i32 2
  %arrayidx270 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 3, i32 3
  %arrayidx314 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 3, i32 3
  %arrayidx432 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 3, i32 2
  br label %for.body

for.body:                                         ; preds = %for.cond.preheader, %for.inc
  %i.0802 = phi i32 [ 0, %for.cond.preheader ], [ %inc.pre-phi, %for.inc ]
  %s_or.0801 = phi i32 [ 0, %for.cond.preheader ], [ %s_or.1, %for.inc ]
  %s_add.0800 = phi i32 [ 0, %for.cond.preheader ], [ %s_add.1, %for.inc ]
  %a_or.0799 = phi i32 [ 0, %for.cond.preheader ], [ %a_or.1, %for.inc ]
  %a_add.0798 = phi i32 [ 0, %for.cond.preheader ], [ %a_add.1, %for.inc ]
  %d_or.0797 = phi i32 [ 0, %for.cond.preheader ], [ %d_or.1, %for.inc ]
  %d_add.0796 = phi i32 [ 0, %for.cond.preheader ], [ %d_add.1, %for.inc ]
  %m_or.0795 = phi i32 [ 0, %for.cond.preheader ], [ %m_or.1, %for.inc ]
  %m_add.0794 = phi i32 [ 0, %for.cond.preheader ], [ %m_add.1, %for.inc ]
  %c_or.0793 = phi i32 [ 0, %for.cond.preheader ], [ %c_or.1, %for.inc ]
  %c_add.0792 = phi i32 [ 0, %for.cond.preheader ], [ %c_add.1, %for.inc ]
  %arrayidx16 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.0802, i32 0
  %2 = load i32, i32* %arrayidx16, align 4, !tbaa !2
  %cmp17 = icmp sgt i32 %2, -1
  br i1 %cmp17, label %if.then18, label %if.end24

if.then18:                                        ; preds = %for.body
  %shl = shl i32 1, %2
  %add = add nsw i32 %shl, %c_add.0792
  %or = or i32 %shl, %c_or.0793
  br label %if.end24

if.end24:                                         ; preds = %if.then18, %for.body
  %c_add.1 = phi i32 [ %add, %if.then18 ], [ %c_add.0792, %for.body ]
  %c_or.1 = phi i32 [ %or, %if.then18 ], [ %c_or.0793, %for.body ]
  %arrayidx26 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.0802, i32 1
  %3 = load i32, i32* %arrayidx26, align 4, !tbaa !2
  %cmp27 = icmp sgt i32 %3, -1
  br i1 %cmp27, label %if.then28, label %if.end37

if.then28:                                        ; preds = %if.end24
  %shl31 = shl i32 1, %3
  %add32 = add nsw i32 %shl31, %m_add.0794
  %or36 = or i32 %shl31, %m_or.0795
  br label %if.end37

if.end37:                                         ; preds = %if.then28, %if.end24
  %m_add.1 = phi i32 [ %add32, %if.then28 ], [ %m_add.0794, %if.end24 ]
  %m_or.1 = phi i32 [ %or36, %if.then28 ], [ %m_or.0795, %if.end24 ]
  %arrayidx39 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.0802, i32 2
  %4 = load i32, i32* %arrayidx39, align 4, !tbaa !2
  %cmp40 = icmp sgt i32 %4, -1
  br i1 %cmp40, label %if.then41, label %if.end50

if.then41:                                        ; preds = %if.end37
  %shl44 = shl i32 1, %4
  %add45 = add nsw i32 %shl44, %d_add.0796
  %or49 = or i32 %shl44, %d_or.0797
  br label %if.end50

if.end50:                                         ; preds = %if.then41, %if.end37
  %d_add.1 = phi i32 [ %add45, %if.then41 ], [ %d_add.0796, %if.end37 ]
  %d_or.1 = phi i32 [ %or49, %if.then41 ], [ %d_or.0797, %if.end37 ]
  %arrayidx52 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.0802, i32 3
  %5 = load i32, i32* %arrayidx52, align 4, !tbaa !2
  %cmp53 = icmp sgt i32 %5, -1
  br i1 %cmp53, label %if.then54, label %if.end63

if.then54:                                        ; preds = %if.end50
  %shl57 = shl i32 1, %5
  %add58 = add nsw i32 %shl57, %a_add.0798
  %or62 = or i32 %shl57, %a_or.0799
  br label %if.end63

if.end63:                                         ; preds = %if.then54, %if.end50
  %a_add.1 = phi i32 [ %add58, %if.then54 ], [ %a_add.0798, %if.end50 ]
  %a_or.1 = phi i32 [ %or62, %if.then54 ], [ %a_or.0799, %if.end50 ]
  %arrayidx65 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %i.0802, i32 4
  %6 = load i32, i32* %arrayidx65, align 4, !tbaa !2
  %cmp66 = icmp sgt i32 %6, -1
  br i1 %cmp66, label %if.then67, label %if.end76

if.then67:                                        ; preds = %if.end63
  %shl70 = shl i32 1, %6
  %add71 = add nsw i32 %shl70, %s_add.0800
  %or75 = or i32 %shl70, %s_or.0801
  br label %if.end76

if.end76:                                         ; preds = %if.then67, %if.end63
  %s_add.1 = phi i32 [ %add71, %if.then67 ], [ %s_add.0800, %if.end63 ]
  %s_or.1 = phi i32 [ %or75, %if.then67 ], [ %s_or.0801, %if.end63 ]
  br i1 %cmp27, label %land.lhs.true80, label %if.end150

land.lhs.true80:                                  ; preds = %if.end76
  br i1 %cmp17, label %land.lhs.true84, label %land.lhs.true104

land.lhs.true84:                                  ; preds = %land.lhs.true80
  %cmp87 = icmp ne i32 %3, 0
  %cmp91 = icmp eq i32 %2, 0
  %or.cond747 = or i1 %cmp91, %cmp87
  br i1 %or.cond747, label %lor.lhs.false, label %cleanup477

lor.lhs.false:                                    ; preds = %land.lhs.true84
  %cmp94 = icmp eq i32 %3, 0
  %cmp91.not = xor i1 %cmp91, true
  %brmerge = or i1 %cmp94, %cmp91.not
  br i1 %brmerge, label %land.lhs.true104, label %cleanup477

land.lhs.true104:                                 ; preds = %lor.lhs.false, %land.lhs.true80
  br i1 %cmp53, label %land.lhs.true108, label %land.lhs.true129

land.lhs.true108:                                 ; preds = %land.lhs.true104
  %cmp111 = icmp ne i32 %3, 1
  %cmp115 = icmp eq i32 %5, 0
  %or.cond748 = or i1 %cmp111, %cmp115
  br i1 %or.cond748, label %lor.lhs.false116, label %cleanup477

lor.lhs.false116:                                 ; preds = %land.lhs.true108
  %cmp119 = icmp eq i32 %3, 1
  %cmp115.not = xor i1 %cmp115, true
  %brmerge775 = or i1 %cmp119, %cmp115.not
  br i1 %brmerge775, label %land.lhs.true129, label %cleanup477

land.lhs.true129:                                 ; preds = %lor.lhs.false116, %land.lhs.true104
  br i1 %cmp40, label %land.lhs.true133, label %if.end150

land.lhs.true133:                                 ; preds = %land.lhs.true129
  %cmp136 = icmp ne i32 %3, 2
  %cmp140 = icmp eq i32 %4, 0
  %or.cond749 = or i1 %cmp136, %cmp140
  br i1 %or.cond749, label %lor.lhs.false141, label %cleanup477

lor.lhs.false141:                                 ; preds = %land.lhs.true133
  %cmp144 = icmp eq i32 %3, 2
  %cmp140.not = xor i1 %cmp140, true
  %brmerge776 = or i1 %cmp144, %cmp140.not
  br i1 %brmerge776, label %if.end150, label %cleanup477

if.end150:                                        ; preds = %lor.lhs.false141, %if.end76, %land.lhs.true129
  %cmp151 = icmp ne i32 %i.0802, 0
  br i1 %cmp151, label %land.lhs.true152, label %if.end174

land.lhs.true152:                                 ; preds = %if.end150
  br i1 %cmp17, label %land.lhs.true156, label %if.end199

land.lhs.true156:                                 ; preds = %land.lhs.true152
  %sub = add nsw i32 %i.0802, -1
  %arrayidx158 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %sub, i32 0
  %7 = load i32, i32* %arrayidx158, align 4, !tbaa !2
  %cmp159 = icmp ne i32 %7, 1
  %cmp163 = icmp eq i32 %2, 2
  %or.cond750 = or i1 %cmp163, %cmp159
  br i1 %or.cond750, label %lor.lhs.false164, label %cleanup477

lor.lhs.false164:                                 ; preds = %land.lhs.true156
  %cmp168 = icmp eq i32 %7, 1
  %cmp163.not = xor i1 %cmp163, true
  %brmerge777 = or i1 %cmp168, %cmp163.not
  br i1 %brmerge777, label %land.lhs.true178, label %cleanup477

if.end174:                                        ; preds = %if.end150
  %8 = or i32 %4, %2
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %if.end199, label %land.lhs.true182

land.lhs.true178:                                 ; preds = %lor.lhs.false164
  br i1 %cmp40, label %land.lhs.true182, label %if.end199

land.lhs.true182:                                 ; preds = %if.end174, %land.lhs.true178
  %cmp185 = icmp ne i32 %2, 1
  %cmp189 = icmp eq i32 %4, 1
  %or.cond751 = or i1 %cmp185, %cmp189
  br i1 %or.cond751, label %lor.lhs.false190, label %cleanup477

lor.lhs.false190:                                 ; preds = %land.lhs.true182
  %cmp193 = icmp eq i32 %2, 1
  %cmp189.not = xor i1 %cmp189, true
  %brmerge779 = or i1 %cmp193, %cmp189.not
  br i1 %brmerge779, label %if.end199, label %cleanup477

if.end199:                                        ; preds = %lor.lhs.false190, %if.end174, %land.lhs.true152, %land.lhs.true178
  br i1 %cmp66, label %land.lhs.true203, label %if.end361

land.lhs.true203:                                 ; preds = %if.end199
  br i1 %cmp53, label %land.lhs.true207, label %land.lhs.true228

land.lhs.true207:                                 ; preds = %land.lhs.true203
  %cmp210 = icmp ne i32 %6, 0
  %cmp214 = icmp eq i32 %5, 1
  %or.cond752 = or i1 %cmp214, %cmp210
  br i1 %or.cond752, label %lor.lhs.false215, label %cleanup477

lor.lhs.false215:                                 ; preds = %land.lhs.true207
  %cmp218 = icmp eq i32 %6, 0
  %cmp214.not = xor i1 %cmp214, true
  %brmerge780 = or i1 %cmp218, %cmp214.not
  br i1 %brmerge780, label %land.lhs.true228, label %cleanup477

land.lhs.true228:                                 ; preds = %lor.lhs.false215, %land.lhs.true203
  br i1 %cmp17, label %land.lhs.true232, label %if.end249

land.lhs.true232:                                 ; preds = %land.lhs.true228
  %cmp235 = icmp ne i32 %6, 1
  %cmp239 = icmp eq i32 %2, 3
  %or.cond753 = or i1 %cmp239, %cmp235
  br i1 %or.cond753, label %lor.lhs.false240, label %cleanup477

lor.lhs.false240:                                 ; preds = %land.lhs.true232
  %cond = icmp eq i32 %6, 1
  br i1 %cond, label %if.then296, label %land.lhs.true244

land.lhs.true244:                                 ; preds = %lor.lhs.false240
  br i1 %cmp239, label %cleanup477, label %if.end249

if.end249:                                        ; preds = %land.lhs.true244, %land.lhs.true228
  switch i32 %6, label %land.lhs.true340 [
    i32 2, label %if.then253
    i32 1, label %if.then296
  ]

if.then253:                                       ; preds = %if.end249
  switch i32 %i.0802, label %if.else273 [
    i32 0, label %land.lhs.true255
    i32 4, label %land.lhs.true267
  ]

land.lhs.true255:                                 ; preds = %if.then253
  %10 = load i32, i32* %arrayidx258, align 4, !tbaa !2
  %cmp259 = icmp slt i32 %10, 0
  %cmp264 = icmp eq i32 %10, 2
  %or.cond754 = or i1 %cmp259, %cmp264
  br i1 %or.cond754, label %if.else273, label %cleanup477

land.lhs.true267:                                 ; preds = %if.then253
  %11 = load i32, i32* %arrayidx270, align 4, !tbaa !2
  %cmp271 = icmp eq i32 %11, 2
  br i1 %cmp271, label %if.else273, label %cleanup477

if.else273:                                       ; preds = %land.lhs.true255, %if.then253, %land.lhs.true267
  %add274 = add nuw nsw i32 %i.0802, 1
  %arrayidx276 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %add274, i32 3
  %12 = load i32, i32* %arrayidx276, align 4, !tbaa !2
  %cmp277 = icmp slt i32 %12, 0
  %cmp282 = icmp eq i32 %12, 2
  %or.cond755 = or i1 %cmp277, %cmp282
  br i1 %or.cond755, label %land.lhs.true340, label %land.lhs.true283

land.lhs.true283:                                 ; preds = %if.else273
  %sub284 = add nsw i32 %i.0802, -1
  %arrayidx286 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %sub284, i32 3
  %13 = load i32, i32* %arrayidx286, align 4, !tbaa !2
  %cmp287 = icmp eq i32 %13, 2
  br i1 %cmp287, label %land.lhs.true340, label %cleanup477

if.then296:                                       ; preds = %lor.lhs.false240, %if.end249
  switch i32 %i.0802, label %if.else317 [
    i32 0, label %land.lhs.true298
    i32 4, label %land.lhs.true311
  ]

land.lhs.true298:                                 ; preds = %if.then296
  %14 = load i32, i32* %arrayidx258, align 4, !tbaa !2
  %cmp302 = icmp slt i32 %14, 0
  %cmp307 = icmp eq i32 %14, 3
  %or.cond756 = or i1 %cmp302, %cmp307
  br i1 %or.cond756, label %if.else317, label %cleanup477

land.lhs.true311:                                 ; preds = %if.then296
  %15 = load i32, i32* %arrayidx314, align 4, !tbaa !2
  %cmp315 = icmp eq i32 %15, 3
  br i1 %cmp315, label %if.else317, label %cleanup477

if.else317:                                       ; preds = %land.lhs.true298, %if.then296, %land.lhs.true311
  %add318 = add nuw nsw i32 %i.0802, 1
  %arrayidx320 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %add318, i32 3
  %16 = load i32, i32* %arrayidx320, align 4, !tbaa !2
  %cmp321 = icmp slt i32 %16, 0
  %cmp326 = icmp eq i32 %16, 3
  %or.cond757 = or i1 %cmp321, %cmp326
  br i1 %or.cond757, label %land.lhs.true340, label %land.lhs.true327

land.lhs.true327:                                 ; preds = %if.else317
  %sub328 = add nsw i32 %i.0802, -1
  %arrayidx330 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %sub328, i32 3
  %17 = load i32, i32* %arrayidx330, align 4, !tbaa !2
  %cmp331 = icmp eq i32 %17, 3
  br i1 %cmp331, label %land.lhs.true340, label %cleanup477

land.lhs.true340:                                 ; preds = %land.lhs.true327, %if.else317, %if.end249, %if.else273, %land.lhs.true283
  %cmp252769771773 = phi i1 [ true, %land.lhs.true283 ], [ true, %if.else273 ], [ false, %if.end249 ], [ false, %if.else317 ], [ false, %land.lhs.true327 ]
  br i1 %cmp40, label %land.lhs.true344, label %if.end361

land.lhs.true344:                                 ; preds = %land.lhs.true340
  %cmp347 = icmp ne i32 %6, 3
  %cmp351 = icmp eq i32 %4, 3
  %or.cond758 = or i1 %cmp351, %cmp347
  br i1 %or.cond758, label %lor.lhs.false352, label %cleanup477

lor.lhs.false352:                                 ; preds = %land.lhs.true344
  %cmp355 = icmp eq i32 %6, 3
  %cmp351.not = xor i1 %cmp351, true
  %brmerge781 = or i1 %cmp355, %cmp351.not
  br i1 %brmerge781, label %if.end361, label %cleanup477

if.end361:                                        ; preds = %if.end199, %lor.lhs.false352, %land.lhs.true340
  %cmp252769771772 = phi i1 [ %cmp252769771773, %lor.lhs.false352 ], [ %cmp252769771773, %land.lhs.true340 ], [ false, %if.end199 ]
  br i1 %cmp27, label %land.lhs.true365, label %if.end410

land.lhs.true365:                                 ; preds = %if.end361
  br i1 %cmp66, label %land.lhs.true369, label %if.end386

land.lhs.true369:                                 ; preds = %land.lhs.true365
  %cmp372 = icmp ne i32 %3, 3
  %cmp376 = icmp eq i32 %6, 4
  %or.cond759 = or i1 %cmp372, %cmp376
  br i1 %or.cond759, label %lor.lhs.false377, label %cleanup477

lor.lhs.false377:                                 ; preds = %land.lhs.true369
  %cmp380 = icmp eq i32 %3, 3
  br i1 %cmp380, label %if.end410, label %land.lhs.true381

land.lhs.true381:                                 ; preds = %lor.lhs.false377
  br i1 %cmp376, label %cleanup477, label %if.end386

if.end386:                                        ; preds = %land.lhs.true381, %land.lhs.true365
  %cmp389 = icmp eq i32 %3, 4
  br i1 %cmp389, label %land.lhs.true390, label %if.end410

land.lhs.true390:                                 ; preds = %if.end386
  %cmp391 = icmp ult i32 %i.0802, 4
  br i1 %cmp391, label %land.lhs.true392, label %lor.lhs.false402

land.lhs.true392:                                 ; preds = %land.lhs.true390
  %add393 = add nuw nsw i32 %i.0802, 1
  %arrayidx395 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %add393, i32 0
  %18 = load i32, i32* %arrayidx395, align 4, !tbaa !2
  %cmp396 = icmp slt i32 %18, 0
  %cmp401 = icmp eq i32 %18, 4
  %or.cond760 = or i1 %cmp396, %cmp401
  br i1 %or.cond760, label %lor.lhs.false402, label %cleanup477

lor.lhs.false402:                                 ; preds = %land.lhs.true392, %land.lhs.true390
  br i1 %cmp151, label %land.lhs.true404, label %if.end410

land.lhs.true404:                                 ; preds = %lor.lhs.false402
  %sub405 = add nsw i32 %i.0802, -1
  %arrayidx407 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %sub405, i32 0
  %19 = load i32, i32* %arrayidx407, align 4, !tbaa !2
  %cmp408 = icmp eq i32 %19, 4
  br i1 %cmp408, label %if.end410, label %cleanup477

if.end410:                                        ; preds = %if.end361, %lor.lhs.false377, %land.lhs.true404, %lor.lhs.false402, %if.end386
  br i1 %cmp252769771772, label %if.then414, label %if.end410.for.inc_crit_edge

if.end410.for.inc_crit_edge:                      ; preds = %if.end410
  %.pre = add nuw nsw i32 %i.0802, 1
  br label %for.inc

if.then414:                                       ; preds = %if.end410
  switch i32 %i.0802, label %if.else435 [
    i32 0, label %land.lhs.true416
    i32 4, label %land.lhs.true429
  ]

land.lhs.true416:                                 ; preds = %if.then414
  %20 = load i32, i32* %arrayidx419, align 4, !tbaa !2
  %cmp420 = icmp slt i32 %20, 0
  %cmp425 = icmp eq i32 %20, 4
  %or.cond761 = or i1 %cmp420, %cmp425
  br i1 %or.cond761, label %if.else435, label %cleanup477

land.lhs.true429:                                 ; preds = %if.then414
  %21 = load i32, i32* %arrayidx432, align 4, !tbaa !2
  %cmp433 = icmp eq i32 %21, 4
  br i1 %cmp433, label %if.else435, label %cleanup477

if.else435:                                       ; preds = %land.lhs.true416, %if.then414, %land.lhs.true429
  %add436 = add nuw nsw i32 %i.0802, 1
  %arrayidx438 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %add436, i32 2
  %22 = load i32, i32* %arrayidx438, align 4, !tbaa !2
  %cmp439 = icmp slt i32 %22, 0
  %cmp444 = icmp eq i32 %22, 4
  %or.cond762 = or i1 %cmp439, %cmp444
  br i1 %or.cond762, label %for.inc, label %land.lhs.true445

land.lhs.true445:                                 ; preds = %if.else435
  %sub446 = add nsw i32 %i.0802, -1
  %arrayidx448 = getelementptr inbounds [5 x i32], [5 x i32]* %ha, i32 %sub446, i32 2
  %23 = load i32, i32* %arrayidx448, align 4, !tbaa !2
  %cmp449 = icmp eq i32 %23, 4
  br i1 %cmp449, label %for.inc, label %cleanup477

for.inc:                                          ; preds = %if.end410.for.inc_crit_edge, %if.else435, %land.lhs.true445
  %inc.pre-phi = phi i32 [ %.pre, %if.end410.for.inc_crit_edge ], [ %add436, %if.else435 ], [ %add436, %land.lhs.true445 ]
  %cmp14 = icmp ult i32 %inc.pre-phi, 5
  br i1 %cmp14, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  %cmp455 = icmp eq i32 %c_add.1, %c_or.1
  %cmp457 = icmp eq i32 %m_add.1, %m_or.1
  %or.cond763 = and i1 %cmp455, %cmp457
  %cmp459 = icmp eq i32 %d_add.1, %d_or.1
  %or.cond764 = and i1 %or.cond763, %cmp459
  %cmp461 = icmp eq i32 %a_add.1, %a_or.1
  %or.cond765 = and i1 %or.cond764, %cmp461
  %cmp463 = icmp eq i32 %s_add.1, %s_or.1
  %or.cond766 = and i1 %or.cond765, %cmp463
  br i1 %or.cond766, label %if.end465, label %cleanup477

if.end465:                                        ; preds = %for.end
  %cmp466 = icmp ne i32 %c_add.1, 31
  %cmp468 = icmp ne i32 %m_add.1, 31
  %or.cond = or i1 %cmp466, %cmp468
  %cmp470 = icmp ne i32 %d_add.1, 31
  %or.cond487 = or i1 %or.cond, %cmp470
  %cmp472 = icmp ne i32 %a_add.1, 31
  %or.cond488 = or i1 %or.cond487, %cmp472
  %cmp474 = icmp ne i32 %s_add.1, 31
  %or.cond489 = or i1 %or.cond488, %cmp474
  %. = select i1 %or.cond489, i32 1, i32 2
  br label %cleanup477

cleanup477:                                       ; preds = %lor.lhs.false352, %lor.lhs.false215, %lor.lhs.false190, %lor.lhs.false164, %lor.lhs.false141, %lor.lhs.false116, %lor.lhs.false, %land.lhs.true445, %land.lhs.true429, %land.lhs.true416, %land.lhs.true404, %land.lhs.true392, %land.lhs.true381, %land.lhs.true369, %land.lhs.true344, %land.lhs.true327, %land.lhs.true311, %land.lhs.true298, %land.lhs.true283, %land.lhs.true267, %land.lhs.true255, %land.lhs.true244, %land.lhs.true232, %land.lhs.true207, %land.lhs.true182, %land.lhs.true156, %land.lhs.true133, %land.lhs.true108, %land.lhs.true84, %if.end465, %for.end, %if.end, %entry
  %retval.1 = phi i32 [ 0, %entry ], [ 0, %if.end ], [ 0, %for.end ], [ %., %if.end465 ], [ 0, %land.lhs.true84 ], [ 0, %land.lhs.true108 ], [ 0, %land.lhs.true133 ], [ 0, %land.lhs.true156 ], [ 0, %land.lhs.true182 ], [ 0, %land.lhs.true207 ], [ 0, %land.lhs.true232 ], [ 0, %land.lhs.true244 ], [ 0, %land.lhs.true255 ], [ 0, %land.lhs.true267 ], [ 0, %land.lhs.true283 ], [ 0, %land.lhs.true298 ], [ 0, %land.lhs.true311 ], [ 0, %land.lhs.true327 ], [ 0, %land.lhs.true344 ], [ 0, %land.lhs.true369 ], [ 0, %land.lhs.true381 ], [ 0, %land.lhs.true392 ], [ 0, %land.lhs.true404 ], [ 0, %land.lhs.true416 ], [ 0, %land.lhs.true429 ], [ 0, %land.lhs.true445 ], [ 0, %lor.lhs.false ], [ 0, %lor.lhs.false116 ], [ 0, %lor.lhs.false141 ], [ 0, %lor.lhs.false164 ], [ 0, %lor.lhs.false190 ], [ 0, %lor.lhs.false215 ], [ 0, %lor.lhs.false352 ]
  ret i32 %retval.1
}

; Function Attrs: nounwind
define hidden i32 @bruteFill([5 x i32]* %ha, i32 %hno, i32 %attr) local_unnamed_addr #0 {
entry:
  %hb = alloca [5 x [5 x i32]], align 16
  %call = tail call i32 @checkHouses([5 x i32]* %ha)
  %0 = or i32 %call, 2
  %1 = icmp eq i32 %0, 2
  br i1 %1, label %cleanup23, label %if.end

if.end:                                           ; preds = %entry
  %2 = bitcast [5 x [5 x i32]]* %hb to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %2) #4
  %arraydecay = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i32 0, i32 0
  %3 = bitcast [5 x i32]* %ha to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 %2, i8* align 4 %3, i32 100, i1 false)
  %arrayidx3 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %hb, i32 0, i32 %hno, i32 %attr
  %cmp8 = icmp slt i32 %attr, 4
  %add = add nsw i32 %attr, 1
  %add10 = select i1 %cmp8, i32 0, i32 1
  %nexthno.0 = add nsw i32 %add10, %hno
  %nextattr.0 = select i1 %cmp8, i32 %add, i32 0
  store i32 0, i32* %arrayidx3, align 4, !tbaa !2
  %call5 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
  %cmp6 = icmp eq i32 %call5, 0
  br i1 %cmp6, label %for.inc, label %if.then7

if.then7:                                         ; preds = %if.end
  %call13 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
  %cmp14 = icmp eq i32 %call13, 0
  br i1 %cmp14, label %for.inc, label %cleanup20

for.inc:                                          ; preds = %if.then7, %if.end
  store i32 1, i32* %arrayidx3, align 4, !tbaa !2
  %call5.1 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
  %cmp6.1 = icmp eq i32 %call5.1, 0
  br i1 %cmp6.1, label %for.inc.1, label %if.then7.1

cleanup20:                                        ; preds = %if.then7.4, %if.then7.3, %if.then7.2, %if.then7.1, %if.then7
  %call13.lcssa = phi i32 [ %call13, %if.then7 ], [ %call13.1, %if.then7.1 ], [ %call13.2, %if.then7.2 ], [ %call13.3, %if.then7.3 ], [ %call13.4, %if.then7.4 ]
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %3, i8* nonnull align 16 %2, i32 100, i1 false)
  br label %.loopexit

.loopexit:                                        ; preds = %for.inc.3, %if.then7.4, %cleanup20
  %4 = phi i32 [ %call13.lcssa, %cleanup20 ], [ 0, %if.then7.4 ], [ 0, %for.inc.3 ]
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %2) #4
  br label %cleanup23

cleanup23:                                        ; preds = %entry, %.loopexit
  %retval.5 = phi i32 [ %4, %.loopexit ], [ %call, %entry ]
  ret i32 %retval.5

if.then7.1:                                       ; preds = %for.inc
  %call13.1 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
  %cmp14.1 = icmp eq i32 %call13.1, 0
  br i1 %cmp14.1, label %for.inc.1, label %cleanup20

for.inc.1:                                        ; preds = %if.then7.1, %for.inc
  store i32 2, i32* %arrayidx3, align 4, !tbaa !2
  %call5.2 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
  %cmp6.2 = icmp eq i32 %call5.2, 0
  br i1 %cmp6.2, label %for.inc.2, label %if.then7.2

if.then7.2:                                       ; preds = %for.inc.1
  %call13.2 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
  %cmp14.2 = icmp eq i32 %call13.2, 0
  br i1 %cmp14.2, label %for.inc.2, label %cleanup20

for.inc.2:                                        ; preds = %if.then7.2, %for.inc.1
  store i32 3, i32* %arrayidx3, align 4, !tbaa !2
  %call5.3 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
  %cmp6.3 = icmp eq i32 %call5.3, 0
  br i1 %cmp6.3, label %for.inc.3, label %if.then7.3

if.then7.3:                                       ; preds = %for.inc.2
  %call13.3 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
  %cmp14.3 = icmp eq i32 %call13.3, 0
  br i1 %cmp14.3, label %for.inc.3, label %cleanup20

for.inc.3:                                        ; preds = %if.then7.3, %for.inc.2
  store i32 4, i32* %arrayidx3, align 4, !tbaa !2
  %call5.4 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
  %cmp6.4 = icmp eq i32 %call5.4, 0
  br i1 %cmp6.4, label %.loopexit, label %if.then7.4

if.then7.4:                                       ; preds = %for.inc.3
  %call13.4 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
  %cmp14.4 = icmp eq i32 %call13.4, 0
  br i1 %cmp14.4, label %.loopexit, label %cleanup20
}

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
entry:
  %ha = alloca [5 x [5 x i32]], align 16
  %0 = bitcast [5 x [5 x i32]]* %ha to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %0) #4
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 %0, i8 -1, i32 100, i1 false)
  %arraydecay = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %ha, i32 0, i32 0
  %call = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 0, i32 0)
  call void @printHouses([5 x i32]* nonnull %arraydecay)
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %0) #4
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
