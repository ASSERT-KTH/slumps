; ModuleID = '/input/benchmark4pipeline_c/2048.c'
source_filename = "/input/benchmark4pipeline_c/2048.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%struct.gamestate_struct__ = type { [4 x [4 x i32]], i32, i32, i32, i32 }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@values = hidden local_unnamed_addr constant [12 x i32] [i32 0, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048], align 16
@.str = private unnamed_addr constant [3 x i8] c"39\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"31\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"32\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"33\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"34\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"35\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"36\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"37\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"91\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"92\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"93\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"94\00", align 1
@colors = hidden local_unnamed_addr global [12 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0)], align 16
@.str.12 = private unnamed_addr constant [18 x i8] c"\1B[2J\1B[HScore: %ld\00", align 1
@game = hidden local_unnamed_addr global %struct.gamestate_struct__ zeroinitializer, align 4
@.str.13 = private unnamed_addr constant [8 x i8] c" (+%ld)\00", align 1
@.str.17 = private unnamed_addr constant [20 x i8] c"\1B[7m\1B[%sm%*zd \1B[0m|\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"%*s |\00", align 1
@.str.19 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@oldt = hidden global %struct.termios zeroinitializer, align 4
@newt = hidden global %struct.termios zeroinitializer, align 4
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 4
@str = private unnamed_addr constant [9 x i8] c"You win!\00", align 1
@str.22 = private unnamed_addr constant [10 x i8] c"You lose!\00", align 1

; Function Attrs: nounwind
define hidden void @do_draw() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.12, i32 0, i32 0), i32 %0)
  %1 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %tobool = icmp eq i32 %1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i32 0, i32 0), i32 %1)
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %putchar = tail call i32 @putchar(i32 10)
  %putchar63 = tail call i32 @putchar(i32 45)
  %putchar63.1 = tail call i32 @putchar(i32 45)
  %putchar63.2 = tail call i32 @putchar(i32 45)
  %putchar63.3 = tail call i32 @putchar(i32 45)
  %putchar63.4 = tail call i32 @putchar(i32 45)
  %putchar63.5 = tail call i32 @putchar(i32 45)
  %putchar63.6 = tail call i32 @putchar(i32 45)
  %putchar63.7 = tail call i32 @putchar(i32 45)
  %putchar63.8 = tail call i32 @putchar(i32 45)
  %putchar63.9 = tail call i32 @putchar(i32 45)
  %putchar63.10 = tail call i32 @putchar(i32 45)
  %putchar63.11 = tail call i32 @putchar(i32 45)
  %putchar63.12 = tail call i32 @putchar(i32 45)
  %putchar63.13 = tail call i32 @putchar(i32 45)
  %putchar63.14 = tail call i32 @putchar(i32 45)
  %putchar63.15 = tail call i32 @putchar(i32 45)
  %putchar63.16 = tail call i32 @putchar(i32 45)
  %putchar63.17 = tail call i32 @putchar(i32 45)
  %putchar63.18 = tail call i32 @putchar(i32 45)
  %putchar63.19 = tail call i32 @putchar(i32 45)
  %putchar63.20 = tail call i32 @putchar(i32 45)
  %putchar63.21 = tail call i32 @putchar(i32 45)
  %putchar63.22 = tail call i32 @putchar(i32 45)
  %putchar63.23 = tail call i32 @putchar(i32 45)
  %putchar63.24 = tail call i32 @putchar(i32 45)
  %putchar58 = tail call i32 @putchar(i32 10)
  br label %for.body8

for.body8:                                        ; preds = %for.inc26.3, %if.end
  %y.066 = phi i32 [ 0, %if.end ], [ %inc31, %for.inc26.3 ]
  %putchar61 = tail call i32 @putchar(i32 124)
  %arrayidx14 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 %y.066
  %2 = load i32, i32* %arrayidx14, align 4, !tbaa !9
  %tobool15 = icmp eq i32 %2, 0
  br i1 %tobool15, label %if.else, label %if.then16

for.body37.preheader:                             ; preds = %for.inc26.3
  %putchar60 = tail call i32 @putchar(i32 45)
  %putchar60.1 = tail call i32 @putchar(i32 45)
  %putchar60.2 = tail call i32 @putchar(i32 45)
  %putchar60.3 = tail call i32 @putchar(i32 45)
  %putchar60.4 = tail call i32 @putchar(i32 45)
  %putchar60.5 = tail call i32 @putchar(i32 45)
  %putchar60.6 = tail call i32 @putchar(i32 45)
  %putchar60.7 = tail call i32 @putchar(i32 45)
  %putchar60.8 = tail call i32 @putchar(i32 45)
  %putchar60.9 = tail call i32 @putchar(i32 45)
  %putchar60.10 = tail call i32 @putchar(i32 45)
  %putchar60.11 = tail call i32 @putchar(i32 45)
  %putchar60.12 = tail call i32 @putchar(i32 45)
  %putchar60.13 = tail call i32 @putchar(i32 45)
  %putchar60.14 = tail call i32 @putchar(i32 45)
  %putchar60.15 = tail call i32 @putchar(i32 45)
  %putchar60.16 = tail call i32 @putchar(i32 45)
  %putchar60.17 = tail call i32 @putchar(i32 45)
  %putchar60.18 = tail call i32 @putchar(i32 45)
  %putchar60.19 = tail call i32 @putchar(i32 45)
  %putchar60.20 = tail call i32 @putchar(i32 45)
  %putchar60.21 = tail call i32 @putchar(i32 45)
  %putchar60.22 = tail call i32 @putchar(i32 45)
  %putchar60.23 = tail call i32 @putchar(i32 45)
  %putchar60.24 = tail call i32 @putchar(i32 45)
  %putchar59 = tail call i32 @putchar(i32 10)
  ret void

if.then16:                                        ; preds = %for.body8
  %arrayidx19 = getelementptr inbounds [12 x i8*], [12 x i8*]* @colors, i32 0, i32 %2
  %3 = load i8*, i8** %arrayidx19, align 4, !tbaa !10
  %arrayidx22 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %2
  %4 = load i32, i32* %arrayidx22, align 4, !tbaa !12
  %call23 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.17, i32 0, i32 0), i8* %3, i32 4, i32 %4)
  br label %for.inc26

if.else:                                          ; preds = %for.body8
  %call24 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i32 0, i32 0))
  br label %for.inc26

for.inc26:                                        ; preds = %if.then16, %if.else
  %arrayidx14.1 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 %y.066
  %5 = load i32, i32* %arrayidx14.1, align 4, !tbaa !9
  %tobool15.1 = icmp eq i32 %5, 0
  br i1 %tobool15.1, label %if.else.1, label %if.then16.1

if.then16.1:                                      ; preds = %for.inc26
  %arrayidx19.1 = getelementptr inbounds [12 x i8*], [12 x i8*]* @colors, i32 0, i32 %5
  %6 = load i8*, i8** %arrayidx19.1, align 4, !tbaa !10
  %arrayidx22.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %5
  %7 = load i32, i32* %arrayidx22.1, align 4, !tbaa !12
  %call23.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.17, i32 0, i32 0), i8* %6, i32 4, i32 %7)
  br label %for.inc26.1

if.else.1:                                        ; preds = %for.inc26
  %call24.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i32 0, i32 0))
  br label %for.inc26.1

for.inc26.1:                                      ; preds = %if.else.1, %if.then16.1
  %arrayidx14.2 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 %y.066
  %8 = load i32, i32* %arrayidx14.2, align 4, !tbaa !9
  %tobool15.2 = icmp eq i32 %8, 0
  br i1 %tobool15.2, label %if.else.2, label %if.then16.2

if.then16.2:                                      ; preds = %for.inc26.1
  %arrayidx19.2 = getelementptr inbounds [12 x i8*], [12 x i8*]* @colors, i32 0, i32 %8
  %9 = load i8*, i8** %arrayidx19.2, align 4, !tbaa !10
  %arrayidx22.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %8
  %10 = load i32, i32* %arrayidx22.2, align 4, !tbaa !12
  %call23.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.17, i32 0, i32 0), i8* %9, i32 4, i32 %10)
  br label %for.inc26.2

if.else.2:                                        ; preds = %for.inc26.1
  %call24.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i32 0, i32 0))
  br label %for.inc26.2

for.inc26.2:                                      ; preds = %if.else.2, %if.then16.2
  %arrayidx14.3 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 %y.066
  %11 = load i32, i32* %arrayidx14.3, align 4, !tbaa !9
  %tobool15.3 = icmp eq i32 %11, 0
  br i1 %tobool15.3, label %if.else.3, label %if.then16.3

if.then16.3:                                      ; preds = %for.inc26.2
  %arrayidx19.3 = getelementptr inbounds [12 x i8*], [12 x i8*]* @colors, i32 0, i32 %11
  %12 = load i8*, i8** %arrayidx19.3, align 4, !tbaa !10
  %arrayidx22.3 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %11
  %13 = load i32, i32* %arrayidx22.3, align 4, !tbaa !12
  %call23.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.17, i32 0, i32 0), i8* %12, i32 4, i32 %13)
  br label %for.inc26.3

if.else.3:                                        ; preds = %for.inc26.2
  %call24.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i32 0, i32 0))
  br label %for.inc26.3

for.inc26.3:                                      ; preds = %if.else.3, %if.then16.3
  %putchar62 = tail call i32 @putchar(i32 10)
  %inc31 = add nuw nsw i32 %y.066, 1
  %exitcond = icmp eq i32 %inc31, 4
  br i1 %exitcond, label %for.body37.preheader, label %for.body8
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: norecurse nounwind
define hidden void @do_merge(i32 %d) local_unnamed_addr #2 {
entry:
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  switch i32 %d, label %sw.epilog [
    i32 4, label %for.cond1.preheader
    i32 3, label %for.cond39.preheader
    i32 2, label %for.cond88.preheader
    i32 1, label %for.cond137.preheader
  ]

for.cond1.preheader:                              ; preds = %entry
  %0 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %tobool = icmp ne i32 %0, 0
  %1 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4
  %cmp11 = icmp eq i32 %0, %1
  %or.cond = and i1 %tobool, %cmp11
  br i1 %or.cond, label %if.then, label %for.inc

if.then:                                          ; preds = %for.cond1.preheader
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %2 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %add14 = add nsw i32 %2, 1
  store i32 %add14, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %3 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %arrayidx21 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14
  %4 = load i32, i32* %arrayidx21, align 4, !tbaa !12
  store i32 %4, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %5 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26 = add nsw i32 %5, %4
  store i32 %add26, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %for.cond1.preheader, %if.then
  %6 = phi i32 [ 0, %for.cond1.preheader ], [ %4, %if.then ]
  %7 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool.1 = icmp ne i32 %7, 0
  %8 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4
  %cmp11.1 = icmp eq i32 %7, %8
  %or.cond358 = and i1 %tobool.1, %cmp11.1
  br i1 %or.cond358, label %if.then.1, label %for.inc.1

for.cond39.preheader:                             ; preds = %entry, %for.inc73.3
  %9 = phi i32 [ %71, %for.inc73.3 ], [ 0, %entry ]
  %x33.0261 = phi i32 [ %add49, %for.inc73.3 ], [ %d, %entry ]
  %add49 = add nsw i32 %x33.0261, -1
  %arrayidx44 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 %x33.0261, i32 0
  %10 = load i32, i32* %arrayidx44, align 4, !tbaa !9
  %tobool45 = icmp eq i32 %10, 0
  br i1 %tobool45, label %for.inc73, label %land.lhs.true46

land.lhs.true46:                                  ; preds = %for.cond39.preheader
  %arrayidx52 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 %add49, i32 0
  %11 = load i32, i32* %arrayidx52, align 4, !tbaa !9
  %cmp53 = icmp eq i32 %10, %11
  br i1 %cmp53, label %if.then54, label %for.inc73

if.then54:                                        ; preds = %land.lhs.true46
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %12 = load i32, i32* %arrayidx44, align 4, !tbaa !9
  %add57 = add nsw i32 %12, 1
  store i32 %add57, i32* %arrayidx44, align 4, !tbaa !9
  %13 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec58 = add nsw i32 %13, -1
  store i32 %dec58, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* %arrayidx52, align 4, !tbaa !9
  %arrayidx66 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add57
  %14 = load i32, i32* %arrayidx66, align 4, !tbaa !12
  %add67 = add nsw i32 %9, %14
  store i32 %add67, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %15 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add71 = add nsw i32 %15, %14
  store i32 %add71, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc73

for.inc73:                                        ; preds = %for.cond39.preheader, %land.lhs.true46, %if.then54
  %16 = phi i32 [ %9, %for.cond39.preheader ], [ %9, %land.lhs.true46 ], [ %add67, %if.then54 ]
  %arrayidx44.1 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 %x33.0261, i32 1
  %17 = load i32, i32* %arrayidx44.1, align 4, !tbaa !9
  %tobool45.1 = icmp eq i32 %17, 0
  br i1 %tobool45.1, label %for.inc73.1, label %land.lhs.true46.1

for.cond88.preheader:                             ; preds = %entry
  %18 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %tobool94 = icmp ne i32 %18, 0
  %19 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4
  %cmp102 = icmp eq i32 %18, %19
  %or.cond356 = and i1 %tobool94, %cmp102
  br i1 %or.cond356, label %if.then103, label %for.inc122

if.then103:                                       ; preds = %for.cond88.preheader
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %20 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %add106 = add nsw i32 %20, 1
  store i32 %add106, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %21 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107 = add nsw i32 %21, -1
  store i32 %dec107, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %arrayidx115 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106
  %22 = load i32, i32* %arrayidx115, align 4, !tbaa !12
  store i32 %22, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %23 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120 = add nsw i32 %23, %22
  store i32 %add120, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122

for.inc122:                                       ; preds = %for.cond88.preheader, %if.then103
  %24 = phi i32 [ 0, %for.cond88.preheader ], [ %22, %if.then103 ]
  %25 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %tobool94.1 = icmp ne i32 %25, 0
  %26 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4
  %cmp102.1 = icmp eq i32 %25, %26
  %or.cond361 = and i1 %tobool94.1, %cmp102.1
  br i1 %or.cond361, label %if.then103.1, label %for.inc122.1

for.cond137.preheader:                            ; preds = %entry
  %27 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %tobool143 = icmp ne i32 %27, 0
  %28 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4
  %cmp151 = icmp eq i32 %27, %28
  %or.cond357 = and i1 %tobool143, %cmp151
  br i1 %or.cond357, label %if.then152, label %for.inc171

if.then152:                                       ; preds = %for.cond137.preheader
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %29 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %add155 = add nsw i32 %29, 1
  store i32 %add155, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %30 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156 = add nsw i32 %30, -1
  store i32 %dec156, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %arrayidx164 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155
  %31 = load i32, i32* %arrayidx164, align 4, !tbaa !12
  store i32 %31, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %32 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169 = add nsw i32 %32, %31
  store i32 %add169, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171

for.inc171:                                       ; preds = %for.cond137.preheader, %if.then152
  %33 = phi i32 [ 0, %for.cond137.preheader ], [ %31, %if.then152 ]
  %34 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %tobool143.1 = icmp ne i32 %34, 0
  %35 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4
  %cmp151.1 = icmp eq i32 %34, %35
  %or.cond364 = and i1 %tobool143.1, %cmp151.1
  br i1 %or.cond364, label %if.then152.1, label %for.inc171.1

sw.epilog:                                        ; preds = %if.then152.3.2, %for.inc171.2.2, %if.then103.3.2, %for.inc122.2.2, %if.then.3.2, %for.inc.2.2, %for.inc73.3, %entry
  ret void

if.then.1:                                        ; preds = %for.inc
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add14.1 = add nsw i32 %7, 1
  store i32 %add14.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %36 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.1 = add nsw i32 %36, -1
  store i32 %dec.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %arrayidx21.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.1
  %37 = load i32, i32* %arrayidx21.1, align 4, !tbaa !12
  %add22.1 = add nsw i32 %6, %37
  store i32 %add22.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %38 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.1 = add nsw i32 %38, %37
  store i32 %add26.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.1

for.inc.1:                                        ; preds = %for.inc, %if.then.1
  %39 = phi i32 [ %add22.1, %if.then.1 ], [ %6, %for.inc ]
  %40 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool.2 = icmp ne i32 %40, 0
  %41 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4
  %cmp11.2 = icmp eq i32 %40, %41
  %or.cond359 = and i1 %tobool.2, %cmp11.2
  br i1 %or.cond359, label %if.then.2, label %for.inc.2

if.then.2:                                        ; preds = %for.inc.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add14.2 = add nsw i32 %40, 1
  store i32 %add14.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %42 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.2 = add nsw i32 %42, -1
  store i32 %dec.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %arrayidx21.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.2
  %43 = load i32, i32* %arrayidx21.2, align 4, !tbaa !12
  %add22.2 = add nsw i32 %39, %43
  store i32 %add22.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %44 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.2 = add nsw i32 %44, %43
  store i32 %add26.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.2

for.inc.2:                                        ; preds = %for.inc.1, %if.then.2
  %45 = phi i32 [ %add22.2, %if.then.2 ], [ %39, %for.inc.1 ]
  %46 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %tobool.3 = icmp ne i32 %46, 0
  %47 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4
  %cmp11.3 = icmp eq i32 %46, %47
  %or.cond360 = and i1 %tobool.3, %cmp11.3
  br i1 %or.cond360, label %if.then.3, label %for.inc.3

if.then.3:                                        ; preds = %for.inc.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add14.3 = add nsw i32 %46, 1
  store i32 %add14.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %48 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.3 = add nsw i32 %48, -1
  store i32 %dec.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %arrayidx21.3 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.3
  %49 = load i32, i32* %arrayidx21.3, align 4, !tbaa !12
  %add22.3 = add nsw i32 %45, %49
  store i32 %add22.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %50 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.3 = add nsw i32 %50, %49
  store i32 %add26.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.3

for.inc.3:                                        ; preds = %for.inc.2, %if.then.3
  %51 = phi i32 [ %add22.3, %if.then.3 ], [ %45, %for.inc.2 ]
  %52 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %tobool.1285 = icmp ne i32 %52, 0
  %53 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4
  %cmp11.1287 = icmp eq i32 %52, %53
  %or.cond367 = and i1 %tobool.1285, %cmp11.1287
  br i1 %or.cond367, label %if.then.1294, label %for.inc.1295

land.lhs.true46.1:                                ; preds = %for.inc73
  %arrayidx52.1 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 %add49, i32 1
  %54 = load i32, i32* %arrayidx52.1, align 4, !tbaa !9
  %cmp53.1 = icmp eq i32 %17, %54
  br i1 %cmp53.1, label %if.then54.1, label %for.inc73.1

if.then54.1:                                      ; preds = %land.lhs.true46.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add57.1 = add nsw i32 %17, 1
  store i32 %add57.1, i32* %arrayidx44.1, align 4, !tbaa !9
  %55 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec58.1 = add nsw i32 %55, -1
  store i32 %dec58.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* %arrayidx52.1, align 4, !tbaa !9
  %arrayidx66.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add57.1
  %56 = load i32, i32* %arrayidx66.1, align 4, !tbaa !12
  %add67.1 = add nsw i32 %16, %56
  store i32 %add67.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %57 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add71.1 = add nsw i32 %57, %56
  store i32 %add71.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc73.1

for.inc73.1:                                      ; preds = %if.then54.1, %land.lhs.true46.1, %for.inc73
  %58 = phi i32 [ %add67.1, %if.then54.1 ], [ %16, %land.lhs.true46.1 ], [ %16, %for.inc73 ]
  %arrayidx44.2 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 %x33.0261, i32 2
  %59 = load i32, i32* %arrayidx44.2, align 4, !tbaa !9
  %tobool45.2 = icmp eq i32 %59, 0
  br i1 %tobool45.2, label %for.inc73.2, label %land.lhs.true46.2

land.lhs.true46.2:                                ; preds = %for.inc73.1
  %arrayidx52.2 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 %add49, i32 2
  %60 = load i32, i32* %arrayidx52.2, align 4, !tbaa !9
  %cmp53.2 = icmp eq i32 %59, %60
  br i1 %cmp53.2, label %if.then54.2, label %for.inc73.2

if.then54.2:                                      ; preds = %land.lhs.true46.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add57.2 = add nsw i32 %59, 1
  store i32 %add57.2, i32* %arrayidx44.2, align 4, !tbaa !9
  %61 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec58.2 = add nsw i32 %61, -1
  store i32 %dec58.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* %arrayidx52.2, align 4, !tbaa !9
  %arrayidx66.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add57.2
  %62 = load i32, i32* %arrayidx66.2, align 4, !tbaa !12
  %add67.2 = add nsw i32 %58, %62
  store i32 %add67.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %63 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add71.2 = add nsw i32 %63, %62
  store i32 %add71.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc73.2

for.inc73.2:                                      ; preds = %if.then54.2, %land.lhs.true46.2, %for.inc73.1
  %64 = phi i32 [ %add67.2, %if.then54.2 ], [ %58, %land.lhs.true46.2 ], [ %58, %for.inc73.1 ]
  %arrayidx44.3 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 %x33.0261, i32 3
  %65 = load i32, i32* %arrayidx44.3, align 4, !tbaa !9
  %tobool45.3 = icmp eq i32 %65, 0
  br i1 %tobool45.3, label %for.inc73.3, label %land.lhs.true46.3

land.lhs.true46.3:                                ; preds = %for.inc73.2
  %arrayidx52.3 = getelementptr inbounds %struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 %add49, i32 3
  %66 = load i32, i32* %arrayidx52.3, align 4, !tbaa !9
  %cmp53.3 = icmp eq i32 %65, %66
  br i1 %cmp53.3, label %if.then54.3, label %for.inc73.3

if.then54.3:                                      ; preds = %land.lhs.true46.3
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add57.3 = add nsw i32 %65, 1
  store i32 %add57.3, i32* %arrayidx44.3, align 4, !tbaa !9
  %67 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec58.3 = add nsw i32 %67, -1
  store i32 %dec58.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* %arrayidx52.3, align 4, !tbaa !9
  %68 = load i32, i32* %arrayidx44.3, align 4, !tbaa !9
  %arrayidx66.3 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %68
  %69 = load i32, i32* %arrayidx66.3, align 4, !tbaa !12
  %add67.3 = add nsw i32 %64, %69
  store i32 %add67.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %70 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add71.3 = add nsw i32 %70, %69
  store i32 %add71.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc73.3

for.inc73.3:                                      ; preds = %if.then54.3, %land.lhs.true46.3, %for.inc73.2
  %71 = phi i32 [ %add67.3, %if.then54.3 ], [ %64, %land.lhs.true46.3 ], [ %64, %for.inc73.2 ]
  %cmp35 = icmp eq i32 %add49, 0
  br i1 %cmp35, label %sw.epilog, label %for.cond39.preheader

if.then103.1:                                     ; preds = %for.inc122
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %72 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %add106.1 = add nsw i32 %72, 1
  store i32 %add106.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %73 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.1 = add nsw i32 %73, -1
  store i32 %dec107.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %arrayidx115.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.1
  %74 = load i32, i32* %arrayidx115.1, align 4, !tbaa !12
  %add116.1 = add nsw i32 %24, %74
  store i32 %add116.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %75 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.1 = add nsw i32 %75, %74
  store i32 %add120.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.1

for.inc122.1:                                     ; preds = %for.inc122, %if.then103.1
  %76 = phi i32 [ %add116.1, %if.then103.1 ], [ %24, %for.inc122 ]
  %77 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %tobool94.2 = icmp ne i32 %77, 0
  %78 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4
  %cmp102.2 = icmp eq i32 %77, %78
  %or.cond362 = and i1 %tobool94.2, %cmp102.2
  br i1 %or.cond362, label %if.then103.2, label %for.inc122.2

if.then103.2:                                     ; preds = %for.inc122.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %79 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %add106.2 = add nsw i32 %79, 1
  store i32 %add106.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %80 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.2 = add nsw i32 %80, -1
  store i32 %dec107.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %arrayidx115.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.2
  %81 = load i32, i32* %arrayidx115.2, align 4, !tbaa !12
  %add116.2 = add nsw i32 %76, %81
  store i32 %add116.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %82 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.2 = add nsw i32 %82, %81
  store i32 %add120.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.2

for.inc122.2:                                     ; preds = %for.inc122.1, %if.then103.2
  %83 = phi i32 [ %add116.2, %if.then103.2 ], [ %76, %for.inc122.1 ]
  %84 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %tobool94.3 = icmp ne i32 %84, 0
  %85 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4
  %cmp102.3 = icmp eq i32 %84, %85
  %or.cond363 = and i1 %tobool94.3, %cmp102.3
  br i1 %or.cond363, label %if.then103.3, label %for.inc122.3

if.then103.3:                                     ; preds = %for.inc122.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %86 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %add106.3 = add nsw i32 %86, 1
  store i32 %add106.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %87 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.3 = add nsw i32 %87, -1
  store i32 %dec107.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %arrayidx115.3 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.3
  %88 = load i32, i32* %arrayidx115.3, align 4, !tbaa !12
  %add116.3 = add nsw i32 %83, %88
  store i32 %add116.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %89 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.3 = add nsw i32 %89, %88
  store i32 %add120.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.3

for.inc122.3:                                     ; preds = %for.inc122.2, %if.then103.3
  %90 = phi i32 [ %add116.3, %if.then103.3 ], [ %83, %for.inc122.2 ]
  %91 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool94.1309 = icmp ne i32 %91, 0
  %92 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4
  %cmp102.1311 = icmp eq i32 %91, %92
  %or.cond375 = and i1 %tobool94.1309, %cmp102.1311
  br i1 %or.cond375, label %if.then103.1318, label %for.inc122.1319

if.then152.1:                                     ; preds = %for.inc171
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %93 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %add155.1 = add nsw i32 %93, 1
  store i32 %add155.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %94 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.1 = add nsw i32 %94, -1
  store i32 %dec156.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %arrayidx164.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.1
  %95 = load i32, i32* %arrayidx164.1, align 4, !tbaa !12
  %add165.1 = add nsw i32 %33, %95
  store i32 %add165.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %96 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.1 = add nsw i32 %96, %95
  store i32 %add169.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.1

for.inc171.1:                                     ; preds = %for.inc171, %if.then152.1
  %97 = phi i32 [ %add165.1, %if.then152.1 ], [ %33, %for.inc171 ]
  %98 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %tobool143.2 = icmp ne i32 %98, 0
  %99 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4
  %cmp151.2 = icmp eq i32 %98, %99
  %or.cond365 = and i1 %tobool143.2, %cmp151.2
  br i1 %or.cond365, label %if.then152.2, label %for.inc171.2

if.then152.2:                                     ; preds = %for.inc171.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %100 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %add155.2 = add nsw i32 %100, 1
  store i32 %add155.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %101 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.2 = add nsw i32 %101, -1
  store i32 %dec156.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %arrayidx164.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.2
  %102 = load i32, i32* %arrayidx164.2, align 4, !tbaa !12
  %add165.2 = add nsw i32 %97, %102
  store i32 %add165.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %103 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.2 = add nsw i32 %103, %102
  store i32 %add169.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.2

for.inc171.2:                                     ; preds = %for.inc171.1, %if.then152.2
  %104 = phi i32 [ %add165.2, %if.then152.2 ], [ %97, %for.inc171.1 ]
  %105 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %tobool143.3 = icmp ne i32 %105, 0
  %106 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4
  %cmp151.3 = icmp eq i32 %105, %106
  %or.cond366 = and i1 %tobool143.3, %cmp151.3
  br i1 %or.cond366, label %if.then152.3, label %for.inc171.3

if.then152.3:                                     ; preds = %for.inc171.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %107 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %add155.3 = add nsw i32 %107, 1
  store i32 %add155.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %108 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.3 = add nsw i32 %108, -1
  store i32 %dec156.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %arrayidx164.3 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.3
  %109 = load i32, i32* %arrayidx164.3, align 4, !tbaa !12
  %add165.3 = add nsw i32 %104, %109
  store i32 %add165.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %110 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.3 = add nsw i32 %110, %109
  store i32 %add169.3, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.3

for.inc171.3:                                     ; preds = %for.inc171.2, %if.then152.3
  %111 = phi i32 [ %add165.3, %if.then152.3 ], [ %104, %for.inc171.2 ]
  %112 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool143.1333 = icmp ne i32 %112, 0
  %113 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4
  %cmp151.1335 = icmp eq i32 %112, %113
  %or.cond383 = and i1 %tobool143.1333, %cmp151.1335
  br i1 %or.cond383, label %if.then152.1342, label %for.inc171.1343

if.then.1294:                                     ; preds = %for.inc.3
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %114 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %add14.1289 = add nsw i32 %114, 1
  store i32 %add14.1289, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %115 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.1290 = add nsw i32 %115, -1
  store i32 %dec.1290, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %arrayidx21.1291 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.1289
  %116 = load i32, i32* %arrayidx21.1291, align 4, !tbaa !12
  %add22.1292 = add nsw i32 %51, %116
  store i32 %add22.1292, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %117 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.1293 = add nsw i32 %117, %116
  store i32 %add26.1293, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.1295

for.inc.1295:                                     ; preds = %for.inc.3, %if.then.1294
  %118 = phi i32 [ %51, %for.inc.3 ], [ %add22.1292, %if.then.1294 ]
  %119 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool.1.1 = icmp ne i32 %119, 0
  %120 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4
  %cmp11.1.1 = icmp eq i32 %119, %120
  %or.cond368 = and i1 %tobool.1.1, %cmp11.1.1
  br i1 %or.cond368, label %if.then.1.1, label %for.inc.1.1

if.then.1.1:                                      ; preds = %for.inc.1295
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add14.1.1 = add nsw i32 %119, 1
  store i32 %add14.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %121 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.1.1 = add nsw i32 %121, -1
  store i32 %dec.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %arrayidx21.1.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.1.1
  %122 = load i32, i32* %arrayidx21.1.1, align 4, !tbaa !12
  %add22.1.1 = add nsw i32 %118, %122
  store i32 %add22.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %123 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.1.1 = add nsw i32 %123, %122
  store i32 %add26.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.1.1

for.inc.1.1:                                      ; preds = %for.inc.1295, %if.then.1.1
  %124 = phi i32 [ %add22.1.1, %if.then.1.1 ], [ %118, %for.inc.1295 ]
  %125 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool.2.1 = icmp ne i32 %125, 0
  %126 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4
  %cmp11.2.1 = icmp eq i32 %125, %126
  %or.cond369 = and i1 %tobool.2.1, %cmp11.2.1
  br i1 %or.cond369, label %if.then.2.1, label %for.inc.2.1

if.then.2.1:                                      ; preds = %for.inc.1.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add14.2.1 = add nsw i32 %125, 1
  store i32 %add14.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %127 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.2.1 = add nsw i32 %127, -1
  store i32 %dec.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %arrayidx21.2.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.2.1
  %128 = load i32, i32* %arrayidx21.2.1, align 4, !tbaa !12
  %add22.2.1 = add nsw i32 %124, %128
  store i32 %add22.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %129 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.2.1 = add nsw i32 %129, %128
  store i32 %add26.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.2.1

for.inc.2.1:                                      ; preds = %for.inc.1.1, %if.then.2.1
  %130 = phi i32 [ %add22.2.1, %if.then.2.1 ], [ %124, %for.inc.1.1 ]
  %131 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %tobool.3.1 = icmp ne i32 %131, 0
  %132 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4
  %cmp11.3.1 = icmp eq i32 %131, %132
  %or.cond370 = and i1 %tobool.3.1, %cmp11.3.1
  br i1 %or.cond370, label %if.then.3.1, label %for.inc.3.1

if.then.3.1:                                      ; preds = %for.inc.2.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add14.3.1 = add nsw i32 %131, 1
  store i32 %add14.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %133 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.3.1 = add nsw i32 %133, -1
  store i32 %dec.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %arrayidx21.3.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.3.1
  %134 = load i32, i32* %arrayidx21.3.1, align 4, !tbaa !12
  %add22.3.1 = add nsw i32 %130, %134
  store i32 %add22.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %135 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.3.1 = add nsw i32 %135, %134
  store i32 %add26.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.3.1

for.inc.3.1:                                      ; preds = %for.inc.2.1, %if.then.3.1
  %136 = phi i32 [ %add22.3.1, %if.then.3.1 ], [ %130, %for.inc.2.1 ]
  %137 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %tobool.2297 = icmp ne i32 %137, 0
  %138 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4
  %cmp11.2299 = icmp eq i32 %137, %138
  %or.cond371 = and i1 %tobool.2297, %cmp11.2299
  br i1 %or.cond371, label %if.then.2306, label %for.inc.2307

if.then.2306:                                     ; preds = %for.inc.3.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %139 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %add14.2301 = add nsw i32 %139, 1
  store i32 %add14.2301, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %140 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.2302 = add nsw i32 %140, -1
  store i32 %dec.2302, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %arrayidx21.2303 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.2301
  %141 = load i32, i32* %arrayidx21.2303, align 4, !tbaa !12
  %add22.2304 = add nsw i32 %136, %141
  store i32 %add22.2304, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %142 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.2305 = add nsw i32 %142, %141
  store i32 %add26.2305, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.2307

for.inc.2307:                                     ; preds = %for.inc.3.1, %if.then.2306
  %143 = phi i32 [ %136, %for.inc.3.1 ], [ %add22.2304, %if.then.2306 ]
  %144 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool.1.2 = icmp ne i32 %144, 0
  %145 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4
  %cmp11.1.2 = icmp eq i32 %144, %145
  %or.cond372 = and i1 %tobool.1.2, %cmp11.1.2
  br i1 %or.cond372, label %if.then.1.2, label %for.inc.1.2

if.then.1.2:                                      ; preds = %for.inc.2307
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add14.1.2 = add nsw i32 %144, 1
  store i32 %add14.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %146 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.1.2 = add nsw i32 %146, -1
  store i32 %dec.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %arrayidx21.1.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.1.2
  %147 = load i32, i32* %arrayidx21.1.2, align 4, !tbaa !12
  %add22.1.2 = add nsw i32 %143, %147
  store i32 %add22.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %148 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.1.2 = add nsw i32 %148, %147
  store i32 %add26.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.1.2

for.inc.1.2:                                      ; preds = %for.inc.2307, %if.then.1.2
  %149 = phi i32 [ %add22.1.2, %if.then.1.2 ], [ %143, %for.inc.2307 ]
  %150 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool.2.2 = icmp ne i32 %150, 0
  %151 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4
  %cmp11.2.2 = icmp eq i32 %150, %151
  %or.cond373 = and i1 %tobool.2.2, %cmp11.2.2
  br i1 %or.cond373, label %if.then.2.2, label %for.inc.2.2

if.then.2.2:                                      ; preds = %for.inc.1.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add14.2.2 = add nsw i32 %150, 1
  store i32 %add14.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %152 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.2.2 = add nsw i32 %152, -1
  store i32 %dec.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %arrayidx21.2.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.2.2
  %153 = load i32, i32* %arrayidx21.2.2, align 4, !tbaa !12
  %add22.2.2 = add nsw i32 %149, %153
  store i32 %add22.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %154 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.2.2 = add nsw i32 %154, %153
  store i32 %add26.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc.2.2

for.inc.2.2:                                      ; preds = %for.inc.1.2, %if.then.2.2
  %155 = phi i32 [ %add22.2.2, %if.then.2.2 ], [ %149, %for.inc.1.2 ]
  %156 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %tobool.3.2 = icmp ne i32 %156, 0
  %157 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4
  %cmp11.3.2 = icmp eq i32 %156, %157
  %or.cond374 = and i1 %tobool.3.2, %cmp11.3.2
  br i1 %or.cond374, label %if.then.3.2, label %sw.epilog

if.then.3.2:                                      ; preds = %for.inc.2.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %add14.3.2 = add nsw i32 %156, 1
  store i32 %add14.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %158 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec.3.2 = add nsw i32 %158, -1
  store i32 %dec.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %arrayidx21.3.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add14.3.2
  %159 = load i32, i32* %arrayidx21.3.2, align 4, !tbaa !12
  %add22.3.2 = add nsw i32 %155, %159
  store i32 %add22.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %160 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add26.3.2 = add nsw i32 %160, %159
  store i32 %add26.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %sw.epilog

if.then103.1318:                                  ; preds = %for.inc122.3
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %161 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %add106.1313 = add nsw i32 %161, 1
  store i32 %add106.1313, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %162 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.1314 = add nsw i32 %162, -1
  store i32 %dec107.1314, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %arrayidx115.1315 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.1313
  %163 = load i32, i32* %arrayidx115.1315, align 4, !tbaa !12
  %add116.1316 = add nsw i32 %90, %163
  store i32 %add116.1316, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %164 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.1317 = add nsw i32 %164, %163
  store i32 %add120.1317, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.1319

for.inc122.1319:                                  ; preds = %for.inc122.3, %if.then103.1318
  %165 = phi i32 [ %90, %for.inc122.3 ], [ %add116.1316, %if.then103.1318 ]
  %166 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool94.1.1 = icmp ne i32 %166, 0
  %167 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4
  %cmp102.1.1 = icmp eq i32 %166, %167
  %or.cond376 = and i1 %tobool94.1.1, %cmp102.1.1
  br i1 %or.cond376, label %if.then103.1.1, label %for.inc122.1.1

if.then103.1.1:                                   ; preds = %for.inc122.1319
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %168 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %add106.1.1 = add nsw i32 %168, 1
  store i32 %add106.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %169 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.1.1 = add nsw i32 %169, -1
  store i32 %dec107.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %arrayidx115.1.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.1.1
  %170 = load i32, i32* %arrayidx115.1.1, align 4, !tbaa !12
  %add116.1.1 = add nsw i32 %165, %170
  store i32 %add116.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %171 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.1.1 = add nsw i32 %171, %170
  store i32 %add120.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.1.1

for.inc122.1.1:                                   ; preds = %for.inc122.1319, %if.then103.1.1
  %172 = phi i32 [ %add116.1.1, %if.then103.1.1 ], [ %165, %for.inc122.1319 ]
  %173 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool94.2.1 = icmp ne i32 %173, 0
  %174 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4
  %cmp102.2.1 = icmp eq i32 %173, %174
  %or.cond377 = and i1 %tobool94.2.1, %cmp102.2.1
  br i1 %or.cond377, label %if.then103.2.1, label %for.inc122.2.1

if.then103.2.1:                                   ; preds = %for.inc122.1.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %175 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %add106.2.1 = add nsw i32 %175, 1
  store i32 %add106.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %176 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.2.1 = add nsw i32 %176, -1
  store i32 %dec107.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %arrayidx115.2.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.2.1
  %177 = load i32, i32* %arrayidx115.2.1, align 4, !tbaa !12
  %add116.2.1 = add nsw i32 %172, %177
  store i32 %add116.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %178 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.2.1 = add nsw i32 %178, %177
  store i32 %add120.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.2.1

for.inc122.2.1:                                   ; preds = %for.inc122.1.1, %if.then103.2.1
  %179 = phi i32 [ %add116.2.1, %if.then103.2.1 ], [ %172, %for.inc122.1.1 ]
  %180 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %tobool94.3.1 = icmp ne i32 %180, 0
  %181 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4
  %cmp102.3.1 = icmp eq i32 %180, %181
  %or.cond378 = and i1 %tobool94.3.1, %cmp102.3.1
  br i1 %or.cond378, label %if.then103.3.1, label %for.inc122.3.1

if.then103.3.1:                                   ; preds = %for.inc122.2.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %182 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %add106.3.1 = add nsw i32 %182, 1
  store i32 %add106.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %183 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.3.1 = add nsw i32 %183, -1
  store i32 %dec107.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %arrayidx115.3.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.3.1
  %184 = load i32, i32* %arrayidx115.3.1, align 4, !tbaa !12
  %add116.3.1 = add nsw i32 %179, %184
  store i32 %add116.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %185 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.3.1 = add nsw i32 %185, %184
  store i32 %add120.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.3.1

for.inc122.3.1:                                   ; preds = %for.inc122.2.1, %if.then103.3.1
  %186 = phi i32 [ %add116.3.1, %if.then103.3.1 ], [ %179, %for.inc122.2.1 ]
  %187 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool94.2321 = icmp ne i32 %187, 0
  %188 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4
  %cmp102.2323 = icmp eq i32 %187, %188
  %or.cond379 = and i1 %tobool94.2321, %cmp102.2323
  br i1 %or.cond379, label %if.then103.2330, label %for.inc122.2331

if.then103.2330:                                  ; preds = %for.inc122.3.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %189 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %add106.2325 = add nsw i32 %189, 1
  store i32 %add106.2325, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %190 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.2326 = add nsw i32 %190, -1
  store i32 %dec107.2326, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %arrayidx115.2327 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.2325
  %191 = load i32, i32* %arrayidx115.2327, align 4, !tbaa !12
  %add116.2328 = add nsw i32 %186, %191
  store i32 %add116.2328, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %192 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.2329 = add nsw i32 %192, %191
  store i32 %add120.2329, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.2331

for.inc122.2331:                                  ; preds = %for.inc122.3.1, %if.then103.2330
  %193 = phi i32 [ %186, %for.inc122.3.1 ], [ %add116.2328, %if.then103.2330 ]
  %194 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool94.1.2 = icmp ne i32 %194, 0
  %195 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4
  %cmp102.1.2 = icmp eq i32 %194, %195
  %or.cond380 = and i1 %tobool94.1.2, %cmp102.1.2
  br i1 %or.cond380, label %if.then103.1.2, label %for.inc122.1.2

if.then103.1.2:                                   ; preds = %for.inc122.2331
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %196 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %add106.1.2 = add nsw i32 %196, 1
  store i32 %add106.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %197 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.1.2 = add nsw i32 %197, -1
  store i32 %dec107.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %arrayidx115.1.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.1.2
  %198 = load i32, i32* %arrayidx115.1.2, align 4, !tbaa !12
  %add116.1.2 = add nsw i32 %193, %198
  store i32 %add116.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %199 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.1.2 = add nsw i32 %199, %198
  store i32 %add120.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.1.2

for.inc122.1.2:                                   ; preds = %for.inc122.2331, %if.then103.1.2
  %200 = phi i32 [ %add116.1.2, %if.then103.1.2 ], [ %193, %for.inc122.2331 ]
  %201 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool94.2.2 = icmp ne i32 %201, 0
  %202 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4
  %cmp102.2.2 = icmp eq i32 %201, %202
  %or.cond381 = and i1 %tobool94.2.2, %cmp102.2.2
  br i1 %or.cond381, label %if.then103.2.2, label %for.inc122.2.2

if.then103.2.2:                                   ; preds = %for.inc122.1.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %203 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %add106.2.2 = add nsw i32 %203, 1
  store i32 %add106.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %204 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.2.2 = add nsw i32 %204, -1
  store i32 %dec107.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %arrayidx115.2.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.2.2
  %205 = load i32, i32* %arrayidx115.2.2, align 4, !tbaa !12
  %add116.2.2 = add nsw i32 %200, %205
  store i32 %add116.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %206 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.2.2 = add nsw i32 %206, %205
  store i32 %add120.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc122.2.2

for.inc122.2.2:                                   ; preds = %for.inc122.1.2, %if.then103.2.2
  %207 = phi i32 [ %add116.2.2, %if.then103.2.2 ], [ %200, %for.inc122.1.2 ]
  %208 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %tobool94.3.2 = icmp ne i32 %208, 0
  %209 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4
  %cmp102.3.2 = icmp eq i32 %208, %209
  %or.cond382 = and i1 %tobool94.3.2, %cmp102.3.2
  br i1 %or.cond382, label %if.then103.3.2, label %sw.epilog

if.then103.3.2:                                   ; preds = %for.inc122.2.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %210 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %add106.3.2 = add nsw i32 %210, 1
  store i32 %add106.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %211 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec107.3.2 = add nsw i32 %211, -1
  store i32 %dec107.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %arrayidx115.3.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add106.3.2
  %212 = load i32, i32* %arrayidx115.3.2, align 4, !tbaa !12
  %add116.3.2 = add nsw i32 %207, %212
  store i32 %add116.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %213 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add120.3.2 = add nsw i32 %213, %212
  store i32 %add120.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %sw.epilog

if.then152.1342:                                  ; preds = %for.inc171.3
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %214 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %add155.1337 = add nsw i32 %214, 1
  store i32 %add155.1337, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %215 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.1338 = add nsw i32 %215, -1
  store i32 %dec156.1338, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %arrayidx164.1339 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.1337
  %216 = load i32, i32* %arrayidx164.1339, align 4, !tbaa !12
  %add165.1340 = add nsw i32 %111, %216
  store i32 %add165.1340, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %217 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.1341 = add nsw i32 %217, %216
  store i32 %add169.1341, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.1343

for.inc171.1343:                                  ; preds = %for.inc171.3, %if.then152.1342
  %218 = phi i32 [ %111, %for.inc171.3 ], [ %add165.1340, %if.then152.1342 ]
  %219 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool143.1.1 = icmp ne i32 %219, 0
  %220 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4
  %cmp151.1.1 = icmp eq i32 %219, %220
  %or.cond384 = and i1 %tobool143.1.1, %cmp151.1.1
  br i1 %or.cond384, label %if.then152.1.1, label %for.inc171.1.1

if.then152.1.1:                                   ; preds = %for.inc171.1343
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %221 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %add155.1.1 = add nsw i32 %221, 1
  store i32 %add155.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %222 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.1.1 = add nsw i32 %222, -1
  store i32 %dec156.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %arrayidx164.1.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.1.1
  %223 = load i32, i32* %arrayidx164.1.1, align 4, !tbaa !12
  %add165.1.1 = add nsw i32 %218, %223
  store i32 %add165.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %224 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.1.1 = add nsw i32 %224, %223
  store i32 %add169.1.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.1.1

for.inc171.1.1:                                   ; preds = %for.inc171.1343, %if.then152.1.1
  %225 = phi i32 [ %add165.1.1, %if.then152.1.1 ], [ %218, %for.inc171.1343 ]
  %226 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool143.2.1 = icmp ne i32 %226, 0
  %227 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4
  %cmp151.2.1 = icmp eq i32 %226, %227
  %or.cond385 = and i1 %tobool143.2.1, %cmp151.2.1
  br i1 %or.cond385, label %if.then152.2.1, label %for.inc171.2.1

if.then152.2.1:                                   ; preds = %for.inc171.1.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %228 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %add155.2.1 = add nsw i32 %228, 1
  store i32 %add155.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %229 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.2.1 = add nsw i32 %229, -1
  store i32 %dec156.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %arrayidx164.2.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.2.1
  %230 = load i32, i32* %arrayidx164.2.1, align 4, !tbaa !12
  %add165.2.1 = add nsw i32 %225, %230
  store i32 %add165.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %231 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.2.1 = add nsw i32 %231, %230
  store i32 %add169.2.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.2.1

for.inc171.2.1:                                   ; preds = %for.inc171.1.1, %if.then152.2.1
  %232 = phi i32 [ %add165.2.1, %if.then152.2.1 ], [ %225, %for.inc171.1.1 ]
  %233 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %tobool143.3.1 = icmp ne i32 %233, 0
  %234 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4
  %cmp151.3.1 = icmp eq i32 %233, %234
  %or.cond386 = and i1 %tobool143.3.1, %cmp151.3.1
  br i1 %or.cond386, label %if.then152.3.1, label %for.inc171.3.1

if.then152.3.1:                                   ; preds = %for.inc171.2.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %235 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %add155.3.1 = add nsw i32 %235, 1
  store i32 %add155.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %236 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.3.1 = add nsw i32 %236, -1
  store i32 %dec156.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %arrayidx164.3.1 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.3.1
  %237 = load i32, i32* %arrayidx164.3.1, align 4, !tbaa !12
  %add165.3.1 = add nsw i32 %232, %237
  store i32 %add165.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %238 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.3.1 = add nsw i32 %238, %237
  store i32 %add169.3.1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.3.1

for.inc171.3.1:                                   ; preds = %for.inc171.2.1, %if.then152.3.1
  %239 = phi i32 [ %add165.3.1, %if.then152.3.1 ], [ %232, %for.inc171.2.1 ]
  %240 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool143.2345 = icmp ne i32 %240, 0
  %241 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4
  %cmp151.2347 = icmp eq i32 %240, %241
  %or.cond387 = and i1 %tobool143.2345, %cmp151.2347
  br i1 %or.cond387, label %if.then152.2354, label %for.inc171.2355

if.then152.2354:                                  ; preds = %for.inc171.3.1
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %242 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %add155.2349 = add nsw i32 %242, 1
  store i32 %add155.2349, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %243 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.2350 = add nsw i32 %243, -1
  store i32 %dec156.2350, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %arrayidx164.2351 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.2349
  %244 = load i32, i32* %arrayidx164.2351, align 4, !tbaa !12
  %add165.2352 = add nsw i32 %239, %244
  store i32 %add165.2352, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %245 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.2353 = add nsw i32 %245, %244
  store i32 %add169.2353, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.2355

for.inc171.2355:                                  ; preds = %for.inc171.3.1, %if.then152.2354
  %246 = phi i32 [ %239, %for.inc171.3.1 ], [ %add165.2352, %if.then152.2354 ]
  %247 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool143.1.2 = icmp ne i32 %247, 0
  %248 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4
  %cmp151.1.2 = icmp eq i32 %247, %248
  %or.cond388 = and i1 %tobool143.1.2, %cmp151.1.2
  br i1 %or.cond388, label %if.then152.1.2, label %for.inc171.1.2

if.then152.1.2:                                   ; preds = %for.inc171.2355
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %249 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %add155.1.2 = add nsw i32 %249, 1
  store i32 %add155.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %250 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.1.2 = add nsw i32 %250, -1
  store i32 %dec156.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %arrayidx164.1.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.1.2
  %251 = load i32, i32* %arrayidx164.1.2, align 4, !tbaa !12
  %add165.1.2 = add nsw i32 %246, %251
  store i32 %add165.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %252 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.1.2 = add nsw i32 %252, %251
  store i32 %add169.1.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.1.2

for.inc171.1.2:                                   ; preds = %for.inc171.2355, %if.then152.1.2
  %253 = phi i32 [ %add165.1.2, %if.then152.1.2 ], [ %246, %for.inc171.2355 ]
  %254 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool143.2.2 = icmp ne i32 %254, 0
  %255 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4
  %cmp151.2.2 = icmp eq i32 %254, %255
  %or.cond389 = and i1 %tobool143.2.2, %cmp151.2.2
  br i1 %or.cond389, label %if.then152.2.2, label %for.inc171.2.2

if.then152.2.2:                                   ; preds = %for.inc171.1.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %256 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %add155.2.2 = add nsw i32 %256, 1
  store i32 %add155.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %257 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.2.2 = add nsw i32 %257, -1
  store i32 %dec156.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %arrayidx164.2.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.2.2
  %258 = load i32, i32* %arrayidx164.2.2, align 4, !tbaa !12
  %add165.2.2 = add nsw i32 %253, %258
  store i32 %add165.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %259 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.2.2 = add nsw i32 %259, %258
  store i32 %add169.2.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %for.inc171.2.2

for.inc171.2.2:                                   ; preds = %for.inc171.1.2, %if.then152.2.2
  %260 = phi i32 [ %add165.2.2, %if.then152.2.2 ], [ %253, %for.inc171.1.2 ]
  %261 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %tobool143.3.2 = icmp ne i32 %261, 0
  %262 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4
  %cmp151.3.2 = icmp eq i32 %261, %262
  %or.cond390 = and i1 %tobool143.3.2, %cmp151.3.2
  br i1 %or.cond390, label %if.then152.3.2, label %sw.epilog

if.then152.3.2:                                   ; preds = %for.inc171.2.2
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %263 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %add155.3.2 = add nsw i32 %263, 1
  store i32 %add155.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %264 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %dec156.3.2 = add nsw i32 %264, -1
  store i32 %dec156.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %arrayidx164.3.2 = getelementptr inbounds [12 x i32], [12 x i32]* @values, i32 0, i32 %add155.3.2
  %265 = load i32, i32* %arrayidx164.3.2, align 4, !tbaa !12
  %add165.3.2 = add nsw i32 %260, %265
  store i32 %add165.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 3), align 4, !tbaa !8
  %266 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  %add169.3.2 = add nsw i32 %266, %265
  store i32 %add169.3.2, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 2), align 4, !tbaa !2
  br label %sw.epilog
}

; Function Attrs: nounwind
define hidden void @do_gravity(i32 %d) local_unnamed_addr #0 {
entry:
  switch i32 %d, label %sw.epilog [
    i32 4, label %for.cond.preheader
    i32 3, label %for.cond33.preheader
    i32 2, label %for.cond80.preheader
    i32 1, label %for.cond127.preheader
  ]

for.cond.preheader:                               ; preds = %entry, %for.inc.3.2
  %0 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %tobool6 = icmp eq i32 %0, 0
  br i1 %tobool6, label %land.lhs.true, label %for.inc

land.lhs.true:                                    ; preds = %for.cond.preheader
  %1 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %tobool10 = icmp eq i32 %1, 0
  br i1 %tobool10, label %for.inc, label %if.then

if.then:                                          ; preds = %land.lhs.true
  store i32 %1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc

for.inc:                                          ; preds = %land.lhs.true, %for.cond.preheader, %if.then
  %break_cond.3 = phi i32 [ 1, %for.cond.preheader ], [ 0, %if.then ], [ 1, %land.lhs.true ]
  %2 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool6.1 = icmp eq i32 %2, 0
  br i1 %tobool6.1, label %land.lhs.true.1, label %for.inc.1

for.cond33.preheader:                             ; preds = %entry, %for.inc63.3.2
  %3 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %tobool44 = icmp eq i32 %3, 0
  br i1 %tobool44, label %land.lhs.true45, label %for.inc63

land.lhs.true45:                                  ; preds = %for.cond33.preheader
  %4 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %tobool50 = icmp eq i32 %4, 0
  br i1 %tobool50, label %for.inc63, label %if.then51

if.then51:                                        ; preds = %land.lhs.true45
  store i32 %4, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63

for.inc63:                                        ; preds = %land.lhs.true45, %for.cond33.preheader, %if.then51
  %break_cond27.3 = phi i32 [ 1, %for.cond33.preheader ], [ 0, %if.then51 ], [ 1, %land.lhs.true45 ]
  %5 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %tobool44.1 = icmp eq i32 %5, 0
  br i1 %tobool44.1, label %land.lhs.true45.1, label %for.inc63.1

for.cond80.preheader:                             ; preds = %entry, %for.inc110.3.2
  %6 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %tobool91 = icmp eq i32 %6, 0
  br i1 %tobool91, label %land.lhs.true92, label %for.inc110

land.lhs.true92:                                  ; preds = %for.cond80.preheader
  %7 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool97 = icmp eq i32 %7, 0
  br i1 %tobool97, label %for.inc110, label %if.then98

if.then98:                                        ; preds = %land.lhs.true92
  store i32 %7, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110

for.inc110:                                       ; preds = %land.lhs.true92, %for.cond80.preheader, %if.then98
  %break_cond74.3 = phi i32 [ 1, %for.cond80.preheader ], [ 0, %if.then98 ], [ 1, %land.lhs.true92 ]
  %8 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %tobool91.1 = icmp eq i32 %8, 0
  br i1 %tobool91.1, label %land.lhs.true92.1, label %for.inc110.1

for.cond127.preheader:                            ; preds = %entry, %for.inc157.3.2
  %9 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %tobool138 = icmp eq i32 %9, 0
  br i1 %tobool138, label %land.lhs.true139, label %for.inc157

land.lhs.true139:                                 ; preds = %for.cond127.preheader
  %10 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool144 = icmp eq i32 %10, 0
  br i1 %tobool144, label %for.inc157, label %if.then145

if.then145:                                       ; preds = %land.lhs.true139
  store i32 %10, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157

for.inc157:                                       ; preds = %land.lhs.true139, %for.cond127.preheader, %if.then145
  %break_cond121.3 = phi i32 [ 1, %for.cond127.preheader ], [ 0, %if.then145 ], [ 1, %land.lhs.true139 ]
  %11 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %tobool138.1 = icmp eq i32 %11, 0
  br i1 %tobool138.1, label %land.lhs.true139.1, label %for.inc157.1

sw.epilog:                                        ; preds = %for.inc157.3.2, %for.inc110.3.2, %for.inc63.3.2, %for.inc.3.2, %entry
  ret void

land.lhs.true.1:                                  ; preds = %for.inc
  %12 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool10.1 = icmp eq i32 %12, 0
  br i1 %tobool10.1, label %for.inc.1, label %if.then.1

if.then.1:                                        ; preds = %land.lhs.true.1
  store i32 %12, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.1

for.inc.1:                                        ; preds = %if.then.1, %land.lhs.true.1, %for.inc
  %break_cond.3.1 = phi i32 [ %break_cond.3, %for.inc ], [ 0, %if.then.1 ], [ %break_cond.3, %land.lhs.true.1 ]
  %13 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool6.2 = icmp eq i32 %13, 0
  br i1 %tobool6.2, label %land.lhs.true.2, label %for.inc.2

land.lhs.true.2:                                  ; preds = %for.inc.1
  %14 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool10.2 = icmp eq i32 %14, 0
  br i1 %tobool10.2, label %for.inc.2, label %if.then.2

if.then.2:                                        ; preds = %land.lhs.true.2
  store i32 %14, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.2

for.inc.2:                                        ; preds = %if.then.2, %land.lhs.true.2, %for.inc.1
  %break_cond.3.2 = phi i32 [ %break_cond.3.1, %for.inc.1 ], [ 0, %if.then.2 ], [ %break_cond.3.1, %land.lhs.true.2 ]
  %15 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %tobool6.3 = icmp eq i32 %15, 0
  br i1 %tobool6.3, label %land.lhs.true.3, label %for.inc.3

land.lhs.true.3:                                  ; preds = %for.inc.2
  %16 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %tobool10.3 = icmp eq i32 %16, 0
  br i1 %tobool10.3, label %for.inc.3, label %if.then.3

if.then.3:                                        ; preds = %land.lhs.true.3
  store i32 %16, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.3

for.inc.3:                                        ; preds = %if.then.3, %land.lhs.true.3, %for.inc.2
  %break_cond.3.3 = phi i32 [ %break_cond.3.2, %for.inc.2 ], [ 0, %if.then.3 ], [ %break_cond.3.2, %land.lhs.true.3 ]
  %17 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %tobool6.1256 = icmp eq i32 %17, 0
  br i1 %tobool6.1256, label %land.lhs.true.1259, label %for.inc.1262

land.lhs.true.1259:                               ; preds = %for.inc.3
  %18 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %tobool10.1258 = icmp eq i32 %18, 0
  br i1 %tobool10.1258, label %for.inc.1262, label %if.then.1260

if.then.1260:                                     ; preds = %land.lhs.true.1259
  store i32 %18, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.1262

for.inc.1262:                                     ; preds = %if.then.1260, %land.lhs.true.1259, %for.inc.3
  %break_cond.3.1261 = phi i32 [ %break_cond.3.3, %for.inc.3 ], [ 0, %if.then.1260 ], [ %break_cond.3.3, %land.lhs.true.1259 ]
  %19 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool6.1.1 = icmp eq i32 %19, 0
  br i1 %tobool6.1.1, label %land.lhs.true.1.1, label %for.inc.1.1

land.lhs.true.1.1:                                ; preds = %for.inc.1262
  %20 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool10.1.1 = icmp eq i32 %20, 0
  br i1 %tobool10.1.1, label %for.inc.1.1, label %if.then.1.1

if.then.1.1:                                      ; preds = %land.lhs.true.1.1
  store i32 %20, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.1.1

for.inc.1.1:                                      ; preds = %if.then.1.1, %land.lhs.true.1.1, %for.inc.1262
  %break_cond.3.1.1 = phi i32 [ %break_cond.3.1261, %for.inc.1262 ], [ 0, %if.then.1.1 ], [ %break_cond.3.1261, %land.lhs.true.1.1 ]
  %21 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool6.2.1 = icmp eq i32 %21, 0
  br i1 %tobool6.2.1, label %land.lhs.true.2.1, label %for.inc.2.1

land.lhs.true.2.1:                                ; preds = %for.inc.1.1
  %22 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool10.2.1 = icmp eq i32 %22, 0
  br i1 %tobool10.2.1, label %for.inc.2.1, label %if.then.2.1

if.then.2.1:                                      ; preds = %land.lhs.true.2.1
  store i32 %22, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.2.1

for.inc.2.1:                                      ; preds = %if.then.2.1, %land.lhs.true.2.1, %for.inc.1.1
  %break_cond.3.2.1 = phi i32 [ %break_cond.3.1.1, %for.inc.1.1 ], [ 0, %if.then.2.1 ], [ %break_cond.3.1.1, %land.lhs.true.2.1 ]
  %23 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %tobool6.3.1 = icmp eq i32 %23, 0
  br i1 %tobool6.3.1, label %land.lhs.true.3.1, label %for.inc.3.1

land.lhs.true.3.1:                                ; preds = %for.inc.2.1
  %24 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %tobool10.3.1 = icmp eq i32 %24, 0
  br i1 %tobool10.3.1, label %for.inc.3.1, label %if.then.3.1

if.then.3.1:                                      ; preds = %land.lhs.true.3.1
  store i32 %24, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.3.1

for.inc.3.1:                                      ; preds = %if.then.3.1, %land.lhs.true.3.1, %for.inc.2.1
  %break_cond.3.3.1 = phi i32 [ %break_cond.3.2.1, %for.inc.2.1 ], [ 0, %if.then.3.1 ], [ %break_cond.3.2.1, %land.lhs.true.3.1 ]
  %25 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %tobool6.2264 = icmp eq i32 %25, 0
  br i1 %tobool6.2264, label %land.lhs.true.2267, label %for.inc.2270

land.lhs.true.2267:                               ; preds = %for.inc.3.1
  %26 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %tobool10.2266 = icmp eq i32 %26, 0
  br i1 %tobool10.2266, label %for.inc.2270, label %if.then.2268

if.then.2268:                                     ; preds = %land.lhs.true.2267
  store i32 %26, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.2270

for.inc.2270:                                     ; preds = %if.then.2268, %land.lhs.true.2267, %for.inc.3.1
  %break_cond.3.2269 = phi i32 [ %break_cond.3.3.1, %for.inc.3.1 ], [ 0, %if.then.2268 ], [ %break_cond.3.3.1, %land.lhs.true.2267 ]
  %27 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool6.1.2 = icmp eq i32 %27, 0
  br i1 %tobool6.1.2, label %land.lhs.true.1.2, label %for.inc.1.2

land.lhs.true.1.2:                                ; preds = %for.inc.2270
  %28 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %tobool10.1.2 = icmp eq i32 %28, 0
  br i1 %tobool10.1.2, label %for.inc.1.2, label %if.then.1.2

if.then.1.2:                                      ; preds = %land.lhs.true.1.2
  store i32 %28, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.1.2

for.inc.1.2:                                      ; preds = %if.then.1.2, %land.lhs.true.1.2, %for.inc.2270
  %break_cond.3.1.2 = phi i32 [ %break_cond.3.2269, %for.inc.2270 ], [ 0, %if.then.1.2 ], [ %break_cond.3.2269, %land.lhs.true.1.2 ]
  %29 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool6.2.2 = icmp eq i32 %29, 0
  br i1 %tobool6.2.2, label %land.lhs.true.2.2, label %for.inc.2.2

land.lhs.true.2.2:                                ; preds = %for.inc.1.2
  %30 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %tobool10.2.2 = icmp eq i32 %30, 0
  br i1 %tobool10.2.2, label %for.inc.2.2, label %if.then.2.2

if.then.2.2:                                      ; preds = %land.lhs.true.2.2
  store i32 %30, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.2.2

for.inc.2.2:                                      ; preds = %if.then.2.2, %land.lhs.true.2.2, %for.inc.1.2
  %break_cond.3.2.2 = phi i32 [ %break_cond.3.1.2, %for.inc.1.2 ], [ 0, %if.then.2.2 ], [ %break_cond.3.1.2, %land.lhs.true.2.2 ]
  %31 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %tobool6.3.2 = icmp eq i32 %31, 0
  br i1 %tobool6.3.2, label %land.lhs.true.3.2, label %for.inc.3.2

land.lhs.true.3.2:                                ; preds = %for.inc.2.2
  %32 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %tobool10.3.2 = icmp eq i32 %32, 0
  br i1 %tobool10.3.2, label %for.inc.3.2, label %if.then.3.2

if.then.3.2:                                      ; preds = %land.lhs.true.3.2
  store i32 %32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc.3.2

for.inc.3.2:                                      ; preds = %if.then.3.2, %land.lhs.true.3.2, %for.inc.2.2
  %break_cond.3.3.2 = phi i32 [ %break_cond.3.2.2, %for.inc.2.2 ], [ 0, %if.then.3.2 ], [ %break_cond.3.2.2, %land.lhs.true.3.2 ]
  tail call void @do_draw()
  %call = tail call i32 @usleep(i32 40000) #6
  %tobool = icmp eq i32 %break_cond.3.3.2, 0
  br i1 %tobool, label %for.cond.preheader, label %sw.epilog

land.lhs.true45.1:                                ; preds = %for.inc63
  %33 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool50.1 = icmp eq i32 %33, 0
  br i1 %tobool50.1, label %for.inc63.1, label %if.then51.1

if.then51.1:                                      ; preds = %land.lhs.true45.1
  store i32 %33, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.1

for.inc63.1:                                      ; preds = %if.then51.1, %land.lhs.true45.1, %for.inc63
  %break_cond27.3.1 = phi i32 [ %break_cond27.3, %for.inc63 ], [ 0, %if.then51.1 ], [ %break_cond27.3, %land.lhs.true45.1 ]
  %34 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %tobool44.2 = icmp eq i32 %34, 0
  br i1 %tobool44.2, label %land.lhs.true45.2, label %for.inc63.2

land.lhs.true45.2:                                ; preds = %for.inc63.1
  %35 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool50.2 = icmp eq i32 %35, 0
  br i1 %tobool50.2, label %for.inc63.2, label %if.then51.2

if.then51.2:                                      ; preds = %land.lhs.true45.2
  store i32 %35, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.2

for.inc63.2:                                      ; preds = %if.then51.2, %land.lhs.true45.2, %for.inc63.1
  %break_cond27.3.2 = phi i32 [ %break_cond27.3.1, %for.inc63.1 ], [ 0, %if.then51.2 ], [ %break_cond27.3.1, %land.lhs.true45.2 ]
  %36 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %tobool44.3 = icmp eq i32 %36, 0
  br i1 %tobool44.3, label %land.lhs.true45.3, label %for.inc63.3

land.lhs.true45.3:                                ; preds = %for.inc63.2
  %37 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %tobool50.3 = icmp eq i32 %37, 0
  br i1 %tobool50.3, label %for.inc63.3, label %if.then51.3

if.then51.3:                                      ; preds = %land.lhs.true45.3
  store i32 %37, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.3

for.inc63.3:                                      ; preds = %if.then51.3, %land.lhs.true45.3, %for.inc63.2
  %break_cond27.3.3 = phi i32 [ %break_cond27.3.2, %for.inc63.2 ], [ 0, %if.then51.3 ], [ %break_cond27.3.2, %land.lhs.true45.3 ]
  %38 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %tobool44.1272 = icmp eq i32 %38, 0
  br i1 %tobool44.1272, label %land.lhs.true45.1275, label %for.inc63.1278

land.lhs.true45.1275:                             ; preds = %for.inc63.3
  %39 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %tobool50.1274 = icmp eq i32 %39, 0
  br i1 %tobool50.1274, label %for.inc63.1278, label %if.then51.1276

if.then51.1276:                                   ; preds = %land.lhs.true45.1275
  store i32 %39, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.1278

for.inc63.1278:                                   ; preds = %if.then51.1276, %land.lhs.true45.1275, %for.inc63.3
  %break_cond27.3.1277 = phi i32 [ %break_cond27.3.3, %for.inc63.3 ], [ 0, %if.then51.1276 ], [ %break_cond27.3.3, %land.lhs.true45.1275 ]
  %40 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool44.1.1 = icmp eq i32 %40, 0
  br i1 %tobool44.1.1, label %land.lhs.true45.1.1, label %for.inc63.1.1

land.lhs.true45.1.1:                              ; preds = %for.inc63.1278
  %41 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool50.1.1 = icmp eq i32 %41, 0
  br i1 %tobool50.1.1, label %for.inc63.1.1, label %if.then51.1.1

if.then51.1.1:                                    ; preds = %land.lhs.true45.1.1
  store i32 %41, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.1.1

for.inc63.1.1:                                    ; preds = %if.then51.1.1, %land.lhs.true45.1.1, %for.inc63.1278
  %break_cond27.3.1.1 = phi i32 [ %break_cond27.3.1277, %for.inc63.1278 ], [ 0, %if.then51.1.1 ], [ %break_cond27.3.1277, %land.lhs.true45.1.1 ]
  %42 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool44.2.1 = icmp eq i32 %42, 0
  br i1 %tobool44.2.1, label %land.lhs.true45.2.1, label %for.inc63.2.1

land.lhs.true45.2.1:                              ; preds = %for.inc63.1.1
  %43 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool50.2.1 = icmp eq i32 %43, 0
  br i1 %tobool50.2.1, label %for.inc63.2.1, label %if.then51.2.1

if.then51.2.1:                                    ; preds = %land.lhs.true45.2.1
  store i32 %43, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.2.1

for.inc63.2.1:                                    ; preds = %if.then51.2.1, %land.lhs.true45.2.1, %for.inc63.1.1
  %break_cond27.3.2.1 = phi i32 [ %break_cond27.3.1.1, %for.inc63.1.1 ], [ 0, %if.then51.2.1 ], [ %break_cond27.3.1.1, %land.lhs.true45.2.1 ]
  %44 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %tobool44.3.1 = icmp eq i32 %44, 0
  br i1 %tobool44.3.1, label %land.lhs.true45.3.1, label %for.inc63.3.1

land.lhs.true45.3.1:                              ; preds = %for.inc63.2.1
  %45 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %tobool50.3.1 = icmp eq i32 %45, 0
  br i1 %tobool50.3.1, label %for.inc63.3.1, label %if.then51.3.1

if.then51.3.1:                                    ; preds = %land.lhs.true45.3.1
  store i32 %45, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.3.1

for.inc63.3.1:                                    ; preds = %if.then51.3.1, %land.lhs.true45.3.1, %for.inc63.2.1
  %break_cond27.3.3.1 = phi i32 [ %break_cond27.3.2.1, %for.inc63.2.1 ], [ 0, %if.then51.3.1 ], [ %break_cond27.3.2.1, %land.lhs.true45.3.1 ]
  %46 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %tobool44.2280 = icmp eq i32 %46, 0
  br i1 %tobool44.2280, label %land.lhs.true45.2283, label %for.inc63.2286

land.lhs.true45.2283:                             ; preds = %for.inc63.3.1
  %47 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %tobool50.2282 = icmp eq i32 %47, 0
  br i1 %tobool50.2282, label %for.inc63.2286, label %if.then51.2284

if.then51.2284:                                   ; preds = %land.lhs.true45.2283
  store i32 %47, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.2286

for.inc63.2286:                                   ; preds = %if.then51.2284, %land.lhs.true45.2283, %for.inc63.3.1
  %break_cond27.3.2285 = phi i32 [ %break_cond27.3.3.1, %for.inc63.3.1 ], [ 0, %if.then51.2284 ], [ %break_cond27.3.3.1, %land.lhs.true45.2283 ]
  %48 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool44.1.2 = icmp eq i32 %48, 0
  br i1 %tobool44.1.2, label %land.lhs.true45.1.2, label %for.inc63.1.2

land.lhs.true45.1.2:                              ; preds = %for.inc63.2286
  %49 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool50.1.2 = icmp eq i32 %49, 0
  br i1 %tobool50.1.2, label %for.inc63.1.2, label %if.then51.1.2

if.then51.1.2:                                    ; preds = %land.lhs.true45.1.2
  store i32 %49, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.1.2

for.inc63.1.2:                                    ; preds = %if.then51.1.2, %land.lhs.true45.1.2, %for.inc63.2286
  %break_cond27.3.1.2 = phi i32 [ %break_cond27.3.2285, %for.inc63.2286 ], [ 0, %if.then51.1.2 ], [ %break_cond27.3.2285, %land.lhs.true45.1.2 ]
  %50 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool44.2.2 = icmp eq i32 %50, 0
  br i1 %tobool44.2.2, label %land.lhs.true45.2.2, label %for.inc63.2.2

land.lhs.true45.2.2:                              ; preds = %for.inc63.1.2
  %51 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool50.2.2 = icmp eq i32 %51, 0
  br i1 %tobool50.2.2, label %for.inc63.2.2, label %if.then51.2.2

if.then51.2.2:                                    ; preds = %land.lhs.true45.2.2
  store i32 %51, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.2.2

for.inc63.2.2:                                    ; preds = %if.then51.2.2, %land.lhs.true45.2.2, %for.inc63.1.2
  %break_cond27.3.2.2 = phi i32 [ %break_cond27.3.1.2, %for.inc63.1.2 ], [ 0, %if.then51.2.2 ], [ %break_cond27.3.1.2, %land.lhs.true45.2.2 ]
  %52 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %tobool44.3.2 = icmp eq i32 %52, 0
  br i1 %tobool44.3.2, label %land.lhs.true45.3.2, label %for.inc63.3.2

land.lhs.true45.3.2:                              ; preds = %for.inc63.2.2
  %53 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %tobool50.3.2 = icmp eq i32 %53, 0
  br i1 %tobool50.3.2, label %for.inc63.3.2, label %if.then51.3.2

if.then51.3.2:                                    ; preds = %land.lhs.true45.3.2
  store i32 %53, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc63.3.2

for.inc63.3.2:                                    ; preds = %if.then51.3.2, %land.lhs.true45.3.2, %for.inc63.2.2
  %break_cond27.3.3.2 = phi i32 [ %break_cond27.3.2.2, %for.inc63.2.2 ], [ 0, %if.then51.3.2 ], [ %break_cond27.3.2.2, %land.lhs.true45.3.2 ]
  tail call void @do_draw()
  %call69 = tail call i32 @usleep(i32 40000) #6
  %tobool29 = icmp eq i32 %break_cond27.3.3.2, 0
  br i1 %tobool29, label %for.cond33.preheader, label %sw.epilog

land.lhs.true92.1:                                ; preds = %for.inc110
  %54 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool97.1 = icmp eq i32 %54, 0
  br i1 %tobool97.1, label %for.inc110.1, label %if.then98.1

if.then98.1:                                      ; preds = %land.lhs.true92.1
  store i32 %54, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.1

for.inc110.1:                                     ; preds = %if.then98.1, %land.lhs.true92.1, %for.inc110
  %break_cond74.3.1 = phi i32 [ %break_cond74.3, %for.inc110 ], [ 0, %if.then98.1 ], [ %break_cond74.3, %land.lhs.true92.1 ]
  %55 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %tobool91.2 = icmp eq i32 %55, 0
  br i1 %tobool91.2, label %land.lhs.true92.2, label %for.inc110.2

land.lhs.true92.2:                                ; preds = %for.inc110.1
  %56 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool97.2 = icmp eq i32 %56, 0
  br i1 %tobool97.2, label %for.inc110.2, label %if.then98.2

if.then98.2:                                      ; preds = %land.lhs.true92.2
  store i32 %56, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.2

for.inc110.2:                                     ; preds = %if.then98.2, %land.lhs.true92.2, %for.inc110.1
  %break_cond74.3.2 = phi i32 [ %break_cond74.3.1, %for.inc110.1 ], [ 0, %if.then98.2 ], [ %break_cond74.3.1, %land.lhs.true92.2 ]
  %57 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %tobool91.3 = icmp eq i32 %57, 0
  br i1 %tobool91.3, label %land.lhs.true92.3, label %for.inc110.3

land.lhs.true92.3:                                ; preds = %for.inc110.2
  %58 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %tobool97.3 = icmp eq i32 %58, 0
  br i1 %tobool97.3, label %for.inc110.3, label %if.then98.3

if.then98.3:                                      ; preds = %land.lhs.true92.3
  store i32 %58, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.3

for.inc110.3:                                     ; preds = %if.then98.3, %land.lhs.true92.3, %for.inc110.2
  %break_cond74.3.3 = phi i32 [ %break_cond74.3.2, %for.inc110.2 ], [ 0, %if.then98.3 ], [ %break_cond74.3.2, %land.lhs.true92.3 ]
  %59 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool91.1288 = icmp eq i32 %59, 0
  br i1 %tobool91.1288, label %land.lhs.true92.1291, label %for.inc110.1294

land.lhs.true92.1291:                             ; preds = %for.inc110.3
  %60 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool97.1290 = icmp eq i32 %60, 0
  br i1 %tobool97.1290, label %for.inc110.1294, label %if.then98.1292

if.then98.1292:                                   ; preds = %land.lhs.true92.1291
  store i32 %60, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.1294

for.inc110.1294:                                  ; preds = %if.then98.1292, %land.lhs.true92.1291, %for.inc110.3
  %break_cond74.3.1293 = phi i32 [ %break_cond74.3.3, %for.inc110.3 ], [ 0, %if.then98.1292 ], [ %break_cond74.3.3, %land.lhs.true92.1291 ]
  %61 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool91.1.1 = icmp eq i32 %61, 0
  br i1 %tobool91.1.1, label %land.lhs.true92.1.1, label %for.inc110.1.1

land.lhs.true92.1.1:                              ; preds = %for.inc110.1294
  %62 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool97.1.1 = icmp eq i32 %62, 0
  br i1 %tobool97.1.1, label %for.inc110.1.1, label %if.then98.1.1

if.then98.1.1:                                    ; preds = %land.lhs.true92.1.1
  store i32 %62, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.1.1

for.inc110.1.1:                                   ; preds = %if.then98.1.1, %land.lhs.true92.1.1, %for.inc110.1294
  %break_cond74.3.1.1 = phi i32 [ %break_cond74.3.1293, %for.inc110.1294 ], [ 0, %if.then98.1.1 ], [ %break_cond74.3.1293, %land.lhs.true92.1.1 ]
  %63 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool91.2.1 = icmp eq i32 %63, 0
  br i1 %tobool91.2.1, label %land.lhs.true92.2.1, label %for.inc110.2.1

land.lhs.true92.2.1:                              ; preds = %for.inc110.1.1
  %64 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool97.2.1 = icmp eq i32 %64, 0
  br i1 %tobool97.2.1, label %for.inc110.2.1, label %if.then98.2.1

if.then98.2.1:                                    ; preds = %land.lhs.true92.2.1
  store i32 %64, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.2.1

for.inc110.2.1:                                   ; preds = %if.then98.2.1, %land.lhs.true92.2.1, %for.inc110.1.1
  %break_cond74.3.2.1 = phi i32 [ %break_cond74.3.1.1, %for.inc110.1.1 ], [ 0, %if.then98.2.1 ], [ %break_cond74.3.1.1, %land.lhs.true92.2.1 ]
  %65 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %tobool91.3.1 = icmp eq i32 %65, 0
  br i1 %tobool91.3.1, label %land.lhs.true92.3.1, label %for.inc110.3.1

land.lhs.true92.3.1:                              ; preds = %for.inc110.2.1
  %66 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %tobool97.3.1 = icmp eq i32 %66, 0
  br i1 %tobool97.3.1, label %for.inc110.3.1, label %if.then98.3.1

if.then98.3.1:                                    ; preds = %land.lhs.true92.3.1
  store i32 %66, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.3.1

for.inc110.3.1:                                   ; preds = %if.then98.3.1, %land.lhs.true92.3.1, %for.inc110.2.1
  %break_cond74.3.3.1 = phi i32 [ %break_cond74.3.2.1, %for.inc110.2.1 ], [ 0, %if.then98.3.1 ], [ %break_cond74.3.2.1, %land.lhs.true92.3.1 ]
  %67 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool91.2296 = icmp eq i32 %67, 0
  br i1 %tobool91.2296, label %land.lhs.true92.2299, label %for.inc110.2302

land.lhs.true92.2299:                             ; preds = %for.inc110.3.1
  %68 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %tobool97.2298 = icmp eq i32 %68, 0
  br i1 %tobool97.2298, label %for.inc110.2302, label %if.then98.2300

if.then98.2300:                                   ; preds = %land.lhs.true92.2299
  store i32 %68, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.2302

for.inc110.2302:                                  ; preds = %if.then98.2300, %land.lhs.true92.2299, %for.inc110.3.1
  %break_cond74.3.2301 = phi i32 [ %break_cond74.3.3.1, %for.inc110.3.1 ], [ 0, %if.then98.2300 ], [ %break_cond74.3.3.1, %land.lhs.true92.2299 ]
  %69 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool91.1.2 = icmp eq i32 %69, 0
  br i1 %tobool91.1.2, label %land.lhs.true92.1.2, label %for.inc110.1.2

land.lhs.true92.1.2:                              ; preds = %for.inc110.2302
  %70 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %tobool97.1.2 = icmp eq i32 %70, 0
  br i1 %tobool97.1.2, label %for.inc110.1.2, label %if.then98.1.2

if.then98.1.2:                                    ; preds = %land.lhs.true92.1.2
  store i32 %70, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.1.2

for.inc110.1.2:                                   ; preds = %if.then98.1.2, %land.lhs.true92.1.2, %for.inc110.2302
  %break_cond74.3.1.2 = phi i32 [ %break_cond74.3.2301, %for.inc110.2302 ], [ 0, %if.then98.1.2 ], [ %break_cond74.3.2301, %land.lhs.true92.1.2 ]
  %71 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool91.2.2 = icmp eq i32 %71, 0
  br i1 %tobool91.2.2, label %land.lhs.true92.2.2, label %for.inc110.2.2

land.lhs.true92.2.2:                              ; preds = %for.inc110.1.2
  %72 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %tobool97.2.2 = icmp eq i32 %72, 0
  br i1 %tobool97.2.2, label %for.inc110.2.2, label %if.then98.2.2

if.then98.2.2:                                    ; preds = %land.lhs.true92.2.2
  store i32 %72, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.2.2

for.inc110.2.2:                                   ; preds = %if.then98.2.2, %land.lhs.true92.2.2, %for.inc110.1.2
  %break_cond74.3.2.2 = phi i32 [ %break_cond74.3.1.2, %for.inc110.1.2 ], [ 0, %if.then98.2.2 ], [ %break_cond74.3.1.2, %land.lhs.true92.2.2 ]
  %73 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %tobool91.3.2 = icmp eq i32 %73, 0
  br i1 %tobool91.3.2, label %land.lhs.true92.3.2, label %for.inc110.3.2

land.lhs.true92.3.2:                              ; preds = %for.inc110.2.2
  %74 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %tobool97.3.2 = icmp eq i32 %74, 0
  br i1 %tobool97.3.2, label %for.inc110.3.2, label %if.then98.3.2

if.then98.3.2:                                    ; preds = %land.lhs.true92.3.2
  store i32 %74, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc110.3.2

for.inc110.3.2:                                   ; preds = %if.then98.3.2, %land.lhs.true92.3.2, %for.inc110.2.2
  %break_cond74.3.3.2 = phi i32 [ %break_cond74.3.2.2, %for.inc110.2.2 ], [ 0, %if.then98.3.2 ], [ %break_cond74.3.2.2, %land.lhs.true92.3.2 ]
  tail call void @do_draw()
  %call116 = tail call i32 @usleep(i32 40000) #6
  %tobool76 = icmp eq i32 %break_cond74.3.3.2, 0
  br i1 %tobool76, label %for.cond80.preheader, label %sw.epilog

land.lhs.true139.1:                               ; preds = %for.inc157
  %75 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool144.1 = icmp eq i32 %75, 0
  br i1 %tobool144.1, label %for.inc157.1, label %if.then145.1

if.then145.1:                                     ; preds = %land.lhs.true139.1
  store i32 %75, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.1

for.inc157.1:                                     ; preds = %if.then145.1, %land.lhs.true139.1, %for.inc157
  %break_cond121.3.1 = phi i32 [ %break_cond121.3, %for.inc157 ], [ 0, %if.then145.1 ], [ %break_cond121.3, %land.lhs.true139.1 ]
  %76 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %tobool138.2 = icmp eq i32 %76, 0
  br i1 %tobool138.2, label %land.lhs.true139.2, label %for.inc157.2

land.lhs.true139.2:                               ; preds = %for.inc157.1
  %77 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool144.2 = icmp eq i32 %77, 0
  br i1 %tobool144.2, label %for.inc157.2, label %if.then145.2

if.then145.2:                                     ; preds = %land.lhs.true139.2
  store i32 %77, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.2

for.inc157.2:                                     ; preds = %if.then145.2, %land.lhs.true139.2, %for.inc157.1
  %break_cond121.3.2 = phi i32 [ %break_cond121.3.1, %for.inc157.1 ], [ 0, %if.then145.2 ], [ %break_cond121.3.1, %land.lhs.true139.2 ]
  %78 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %tobool138.3 = icmp eq i32 %78, 0
  br i1 %tobool138.3, label %land.lhs.true139.3, label %for.inc157.3

land.lhs.true139.3:                               ; preds = %for.inc157.2
  %79 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %tobool144.3 = icmp eq i32 %79, 0
  br i1 %tobool144.3, label %for.inc157.3, label %if.then145.3

if.then145.3:                                     ; preds = %land.lhs.true139.3
  store i32 %79, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.3

for.inc157.3:                                     ; preds = %if.then145.3, %land.lhs.true139.3, %for.inc157.2
  %break_cond121.3.3 = phi i32 [ %break_cond121.3.2, %for.inc157.2 ], [ 0, %if.then145.3 ], [ %break_cond121.3.2, %land.lhs.true139.3 ]
  %80 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool138.1304 = icmp eq i32 %80, 0
  br i1 %tobool138.1304, label %land.lhs.true139.1307, label %for.inc157.1310

land.lhs.true139.1307:                            ; preds = %for.inc157.3
  %81 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool144.1306 = icmp eq i32 %81, 0
  br i1 %tobool144.1306, label %for.inc157.1310, label %if.then145.1308

if.then145.1308:                                  ; preds = %land.lhs.true139.1307
  store i32 %81, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.1310

for.inc157.1310:                                  ; preds = %if.then145.1308, %land.lhs.true139.1307, %for.inc157.3
  %break_cond121.3.1309 = phi i32 [ %break_cond121.3.3, %for.inc157.3 ], [ 0, %if.then145.1308 ], [ %break_cond121.3.3, %land.lhs.true139.1307 ]
  %82 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool138.1.1 = icmp eq i32 %82, 0
  br i1 %tobool138.1.1, label %land.lhs.true139.1.1, label %for.inc157.1.1

land.lhs.true139.1.1:                             ; preds = %for.inc157.1310
  %83 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool144.1.1 = icmp eq i32 %83, 0
  br i1 %tobool144.1.1, label %for.inc157.1.1, label %if.then145.1.1

if.then145.1.1:                                   ; preds = %land.lhs.true139.1.1
  store i32 %83, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.1.1

for.inc157.1.1:                                   ; preds = %if.then145.1.1, %land.lhs.true139.1.1, %for.inc157.1310
  %break_cond121.3.1.1 = phi i32 [ %break_cond121.3.1309, %for.inc157.1310 ], [ 0, %if.then145.1.1 ], [ %break_cond121.3.1309, %land.lhs.true139.1.1 ]
  %84 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool138.2.1 = icmp eq i32 %84, 0
  br i1 %tobool138.2.1, label %land.lhs.true139.2.1, label %for.inc157.2.1

land.lhs.true139.2.1:                             ; preds = %for.inc157.1.1
  %85 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool144.2.1 = icmp eq i32 %85, 0
  br i1 %tobool144.2.1, label %for.inc157.2.1, label %if.then145.2.1

if.then145.2.1:                                   ; preds = %land.lhs.true139.2.1
  store i32 %85, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.2.1

for.inc157.2.1:                                   ; preds = %if.then145.2.1, %land.lhs.true139.2.1, %for.inc157.1.1
  %break_cond121.3.2.1 = phi i32 [ %break_cond121.3.1.1, %for.inc157.1.1 ], [ 0, %if.then145.2.1 ], [ %break_cond121.3.1.1, %land.lhs.true139.2.1 ]
  %86 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %tobool138.3.1 = icmp eq i32 %86, 0
  br i1 %tobool138.3.1, label %land.lhs.true139.3.1, label %for.inc157.3.1

land.lhs.true139.3.1:                             ; preds = %for.inc157.2.1
  %87 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %tobool144.3.1 = icmp eq i32 %87, 0
  br i1 %tobool144.3.1, label %for.inc157.3.1, label %if.then145.3.1

if.then145.3.1:                                   ; preds = %land.lhs.true139.3.1
  store i32 %87, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.3.1

for.inc157.3.1:                                   ; preds = %if.then145.3.1, %land.lhs.true139.3.1, %for.inc157.2.1
  %break_cond121.3.3.1 = phi i32 [ %break_cond121.3.2.1, %for.inc157.2.1 ], [ 0, %if.then145.3.1 ], [ %break_cond121.3.2.1, %land.lhs.true139.3.1 ]
  %88 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool138.2312 = icmp eq i32 %88, 0
  br i1 %tobool138.2312, label %land.lhs.true139.2315, label %for.inc157.2318

land.lhs.true139.2315:                            ; preds = %for.inc157.3.1
  %89 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %tobool144.2314 = icmp eq i32 %89, 0
  br i1 %tobool144.2314, label %for.inc157.2318, label %if.then145.2316

if.then145.2316:                                  ; preds = %land.lhs.true139.2315
  store i32 %89, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.2318

for.inc157.2318:                                  ; preds = %if.then145.2316, %land.lhs.true139.2315, %for.inc157.3.1
  %break_cond121.3.2317 = phi i32 [ %break_cond121.3.3.1, %for.inc157.3.1 ], [ 0, %if.then145.2316 ], [ %break_cond121.3.3.1, %land.lhs.true139.2315 ]
  %90 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool138.1.2 = icmp eq i32 %90, 0
  br i1 %tobool138.1.2, label %land.lhs.true139.1.2, label %for.inc157.1.2

land.lhs.true139.1.2:                             ; preds = %for.inc157.2318
  %91 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %tobool144.1.2 = icmp eq i32 %91, 0
  br i1 %tobool144.1.2, label %for.inc157.1.2, label %if.then145.1.2

if.then145.1.2:                                   ; preds = %land.lhs.true139.1.2
  store i32 %91, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.1.2

for.inc157.1.2:                                   ; preds = %if.then145.1.2, %land.lhs.true139.1.2, %for.inc157.2318
  %break_cond121.3.1.2 = phi i32 [ %break_cond121.3.2317, %for.inc157.2318 ], [ 0, %if.then145.1.2 ], [ %break_cond121.3.2317, %land.lhs.true139.1.2 ]
  %92 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool138.2.2 = icmp eq i32 %92, 0
  br i1 %tobool138.2.2, label %land.lhs.true139.2.2, label %for.inc157.2.2

land.lhs.true139.2.2:                             ; preds = %for.inc157.1.2
  %93 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %tobool144.2.2 = icmp eq i32 %93, 0
  br i1 %tobool144.2.2, label %for.inc157.2.2, label %if.then145.2.2

if.then145.2.2:                                   ; preds = %land.lhs.true139.2.2
  store i32 %93, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.2.2

for.inc157.2.2:                                   ; preds = %if.then145.2.2, %land.lhs.true139.2.2, %for.inc157.1.2
  %break_cond121.3.2.2 = phi i32 [ %break_cond121.3.1.2, %for.inc157.1.2 ], [ 0, %if.then145.2.2 ], [ %break_cond121.3.1.2, %land.lhs.true139.2.2 ]
  %94 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %tobool138.3.2 = icmp eq i32 %94, 0
  br i1 %tobool138.3.2, label %land.lhs.true139.3.2, label %for.inc157.3.2

land.lhs.true139.3.2:                             ; preds = %for.inc157.2.2
  %95 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %tobool144.3.2 = icmp eq i32 %95, 0
  br i1 %tobool144.3.2, label %for.inc157.3.2, label %if.then145.3.2

if.then145.3.2:                                   ; preds = %land.lhs.true139.3.2
  store i32 %95, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  store i32 1, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  br label %for.inc157.3.2

for.inc157.3.2:                                   ; preds = %if.then145.3.2, %land.lhs.true139.3.2, %for.inc157.2.2
  %break_cond121.3.3.2 = phi i32 [ %break_cond121.3.2.2, %for.inc157.2.2 ], [ 0, %if.then145.3.2 ], [ %break_cond121.3.2.2, %land.lhs.true139.3.2 ]
  tail call void @do_draw()
  %call163 = tail call i32 @usleep(i32 40000) #6
  %tobool123 = icmp eq i32 %break_cond121.3.3.2, 0
  br i1 %tobool123, label %for.cond127.preheader, label %sw.epilog
}

declare i32 @usleep(i32) local_unnamed_addr #3

; Function Attrs: norecurse nounwind readonly
define hidden i32 @do_check_end_condition() local_unnamed_addr #4 {
for.body4.us.preheader:
  %0 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  switch i32 %0, label %land.lhs.true.us [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us
  ]

land.lhs.true.us:                                 ; preds = %for.body4.us.preheader
  %1 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %cmp16.us = icmp eq i32 %0, %1
  br i1 %cmp16.us, label %if.then27.us, label %land.lhs.true20.us

land.lhs.true20.us:                               ; preds = %land.lhs.true.us
  %2 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %cmp26.us = icmp eq i32 %0, %2
  br i1 %cmp26.us, label %if.then27.us, label %for.inc.us

if.then27.us:                                     ; preds = %land.lhs.true20.us, %land.lhs.true.us, %for.body4.us.preheader
  %.pr = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then27.us, %land.lhs.true20.us
  %3 = phi i32 [ %.pr, %if.then27.us ], [ %2, %land.lhs.true20.us ]
  %ret.2.us = phi i32 [ 0, %if.then27.us ], [ -1, %land.lhs.true20.us ]
  switch i32 %3, label %land.lhs.true.us.1 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.1
  ]

cleanup31:                                        ; preds = %for.body4.preheader.3, %for.inc.3118, %for.inc.1.3, %for.inc.2.3, %for.body4.us.preheader, %for.inc.us, %for.inc.us.1, %for.inc.us.2, %for.body4.us.preheader.1, %for.inc.us.191, %for.inc.us.1.1, %for.inc.us.2.1, %for.body4.us.preheader.2, %for.inc.us.2110, %for.inc.us.1.2, %for.inc.us.2.2, %for.inc29.3
  %4 = phi i32 [ %ret.1.lcssa.3, %for.inc29.3 ], [ 1, %for.inc.us.2.2 ], [ 1, %for.inc.us.1.2 ], [ 1, %for.inc.us.2110 ], [ 1, %for.body4.us.preheader.2 ], [ 1, %for.inc.us.2.1 ], [ 1, %for.inc.us.1.1 ], [ 1, %for.inc.us.191 ], [ 1, %for.body4.us.preheader.1 ], [ 1, %for.inc.us.2 ], [ 1, %for.inc.us.1 ], [ 1, %for.inc.us ], [ 1, %for.body4.us.preheader ], [ 1, %for.inc.2.3 ], [ 1, %for.inc.1.3 ], [ 1, %for.inc.3118 ], [ 1, %for.body4.preheader.3 ]
  ret i32 %4

land.lhs.true.us.1:                               ; preds = %for.inc.us
  %5 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %cmp16.us.1 = icmp eq i32 %3, %5
  br i1 %cmp16.us.1, label %if.then27.us.1, label %land.lhs.true20.us.1

land.lhs.true20.us.1:                             ; preds = %land.lhs.true.us.1
  %6 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %cmp26.us.1 = icmp eq i32 %3, %6
  br i1 %cmp26.us.1, label %if.then27.us.1, label %for.inc.us.1

if.then27.us.1:                                   ; preds = %land.lhs.true20.us.1, %land.lhs.true.us.1, %for.inc.us
  %.pr130 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  br label %for.inc.us.1

for.inc.us.1:                                     ; preds = %if.then27.us.1, %land.lhs.true20.us.1
  %7 = phi i32 [ %.pr130, %if.then27.us.1 ], [ %6, %land.lhs.true20.us.1 ]
  %ret.2.us.1 = phi i32 [ 0, %if.then27.us.1 ], [ %ret.2.us, %land.lhs.true20.us.1 ]
  switch i32 %7, label %land.lhs.true.us.2 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.2
  ]

land.lhs.true.us.2:                               ; preds = %for.inc.us.1
  %8 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %cmp16.us.2 = icmp eq i32 %7, %8
  br i1 %cmp16.us.2, label %if.then27.us.2, label %land.lhs.true20.us.2

land.lhs.true20.us.2:                             ; preds = %land.lhs.true.us.2
  %9 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %cmp26.us.2 = icmp eq i32 %7, %9
  br i1 %cmp26.us.2, label %if.then27.us.2, label %for.inc.us.2

if.then27.us.2:                                   ; preds = %land.lhs.true20.us.2, %land.lhs.true.us.2, %for.inc.us.1
  %.pr131 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  br label %for.inc.us.2

for.inc.us.2:                                     ; preds = %if.then27.us.2, %land.lhs.true20.us.2
  %10 = phi i32 [ %.pr131, %if.then27.us.2 ], [ %9, %land.lhs.true20.us.2 ]
  %ret.2.us.2 = phi i32 [ 0, %if.then27.us.2 ], [ %ret.2.us.1, %land.lhs.true20.us.2 ]
  switch i32 %10, label %land.lhs.true.us.3 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.3
  ]

land.lhs.true.us.3:                               ; preds = %for.inc.us.2
  %11 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %cmp16.us.3 = icmp eq i32 %10, %11
  br i1 %cmp16.us.3, label %if.then27.us.3, label %for.body4.us.preheader.1

if.then27.us.3:                                   ; preds = %land.lhs.true.us.3, %for.inc.us.2
  br label %for.body4.us.preheader.1

for.body4.us.preheader.1:                         ; preds = %if.then27.us.3, %land.lhs.true.us.3
  %ret.2.us.3 = phi i32 [ 0, %if.then27.us.3 ], [ %ret.2.us.2, %land.lhs.true.us.3 ]
  %12 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  switch i32 %12, label %land.lhs.true.us.184 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.189
  ]

land.lhs.true.us.184:                             ; preds = %for.body4.us.preheader.1
  %13 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %cmp16.us.183 = icmp eq i32 %12, %13
  br i1 %cmp16.us.183, label %if.then27.us.189, label %land.lhs.true20.us.188

land.lhs.true20.us.188:                           ; preds = %land.lhs.true.us.184
  %14 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %cmp26.us.187 = icmp eq i32 %12, %14
  br i1 %cmp26.us.187, label %if.then27.us.189, label %for.inc.us.191

if.then27.us.189:                                 ; preds = %land.lhs.true20.us.188, %land.lhs.true.us.184, %for.body4.us.preheader.1
  %.pr132 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  br label %for.inc.us.191

for.inc.us.191:                                   ; preds = %if.then27.us.189, %land.lhs.true20.us.188
  %15 = phi i32 [ %.pr132, %if.then27.us.189 ], [ %14, %land.lhs.true20.us.188 ]
  %ret.2.us.190 = phi i32 [ 0, %if.then27.us.189 ], [ %ret.2.us.3, %land.lhs.true20.us.188 ]
  switch i32 %15, label %land.lhs.true.us.1.1 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.1.1
  ]

land.lhs.true.us.1.1:                             ; preds = %for.inc.us.191
  %16 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %cmp16.us.1.1 = icmp eq i32 %15, %16
  br i1 %cmp16.us.1.1, label %if.then27.us.1.1, label %land.lhs.true20.us.1.1

land.lhs.true20.us.1.1:                           ; preds = %land.lhs.true.us.1.1
  %17 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %cmp26.us.1.1 = icmp eq i32 %15, %17
  br i1 %cmp26.us.1.1, label %if.then27.us.1.1, label %for.inc.us.1.1

if.then27.us.1.1:                                 ; preds = %land.lhs.true20.us.1.1, %land.lhs.true.us.1.1, %for.inc.us.191
  %.pr133 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  br label %for.inc.us.1.1

for.inc.us.1.1:                                   ; preds = %if.then27.us.1.1, %land.lhs.true20.us.1.1
  %18 = phi i32 [ %.pr133, %if.then27.us.1.1 ], [ %17, %land.lhs.true20.us.1.1 ]
  %ret.2.us.1.1 = phi i32 [ 0, %if.then27.us.1.1 ], [ %ret.2.us.190, %land.lhs.true20.us.1.1 ]
  switch i32 %18, label %land.lhs.true.us.2.1 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.2.1
  ]

land.lhs.true.us.2.1:                             ; preds = %for.inc.us.1.1
  %19 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %cmp16.us.2.1 = icmp eq i32 %18, %19
  br i1 %cmp16.us.2.1, label %if.then27.us.2.1, label %land.lhs.true20.us.2.1

land.lhs.true20.us.2.1:                           ; preds = %land.lhs.true.us.2.1
  %20 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %cmp26.us.2.1 = icmp eq i32 %18, %20
  br i1 %cmp26.us.2.1, label %if.then27.us.2.1, label %for.inc.us.2.1

if.then27.us.2.1:                                 ; preds = %land.lhs.true20.us.2.1, %land.lhs.true.us.2.1, %for.inc.us.1.1
  %.pr134 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  br label %for.inc.us.2.1

for.inc.us.2.1:                                   ; preds = %if.then27.us.2.1, %land.lhs.true20.us.2.1
  %21 = phi i32 [ %.pr134, %if.then27.us.2.1 ], [ %20, %land.lhs.true20.us.2.1 ]
  %ret.2.us.2.1 = phi i32 [ 0, %if.then27.us.2.1 ], [ %ret.2.us.1.1, %land.lhs.true20.us.2.1 ]
  switch i32 %21, label %land.lhs.true.us.3.1 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.3.1
  ]

land.lhs.true.us.3.1:                             ; preds = %for.inc.us.2.1
  %22 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %cmp16.us.3.1 = icmp eq i32 %21, %22
  br i1 %cmp16.us.3.1, label %if.then27.us.3.1, label %for.body4.us.preheader.2

if.then27.us.3.1:                                 ; preds = %land.lhs.true.us.3.1, %for.inc.us.2.1
  br label %for.body4.us.preheader.2

for.body4.us.preheader.2:                         ; preds = %land.lhs.true.us.3.1, %if.then27.us.3.1
  %ret.2.us.3.1 = phi i32 [ 0, %if.then27.us.3.1 ], [ %ret.2.us.2.1, %land.lhs.true.us.3.1 ]
  %23 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  switch i32 %23, label %land.lhs.true.us.2103 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.2108
  ]

land.lhs.true.us.2103:                            ; preds = %for.body4.us.preheader.2
  %24 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %cmp16.us.2102 = icmp eq i32 %23, %24
  br i1 %cmp16.us.2102, label %if.then27.us.2108, label %land.lhs.true20.us.2107

land.lhs.true20.us.2107:                          ; preds = %land.lhs.true.us.2103
  %25 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %cmp26.us.2106 = icmp eq i32 %23, %25
  br i1 %cmp26.us.2106, label %if.then27.us.2108, label %for.inc.us.2110

if.then27.us.2108:                                ; preds = %land.lhs.true20.us.2107, %land.lhs.true.us.2103, %for.body4.us.preheader.2
  %.pr135 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  br label %for.inc.us.2110

for.inc.us.2110:                                  ; preds = %if.then27.us.2108, %land.lhs.true20.us.2107
  %26 = phi i32 [ %.pr135, %if.then27.us.2108 ], [ %25, %land.lhs.true20.us.2107 ]
  %ret.2.us.2109 = phi i32 [ 0, %if.then27.us.2108 ], [ %ret.2.us.3.1, %land.lhs.true20.us.2107 ]
  switch i32 %26, label %land.lhs.true.us.1.2 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.1.2
  ]

land.lhs.true.us.1.2:                             ; preds = %for.inc.us.2110
  %27 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %cmp16.us.1.2 = icmp eq i32 %26, %27
  br i1 %cmp16.us.1.2, label %if.then27.us.1.2, label %land.lhs.true20.us.1.2

land.lhs.true20.us.1.2:                           ; preds = %land.lhs.true.us.1.2
  %28 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %cmp26.us.1.2 = icmp eq i32 %26, %28
  br i1 %cmp26.us.1.2, label %if.then27.us.1.2, label %for.inc.us.1.2

if.then27.us.1.2:                                 ; preds = %land.lhs.true20.us.1.2, %land.lhs.true.us.1.2, %for.inc.us.2110
  %.pr136 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  br label %for.inc.us.1.2

for.inc.us.1.2:                                   ; preds = %if.then27.us.1.2, %land.lhs.true20.us.1.2
  %29 = phi i32 [ %.pr136, %if.then27.us.1.2 ], [ %28, %land.lhs.true20.us.1.2 ]
  %ret.2.us.1.2 = phi i32 [ 0, %if.then27.us.1.2 ], [ %ret.2.us.2109, %land.lhs.true20.us.1.2 ]
  switch i32 %29, label %land.lhs.true.us.2.2 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.2.2
  ]

land.lhs.true.us.2.2:                             ; preds = %for.inc.us.1.2
  %30 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %cmp16.us.2.2 = icmp eq i32 %29, %30
  br i1 %cmp16.us.2.2, label %if.then27.us.2.2, label %land.lhs.true20.us.2.2

land.lhs.true20.us.2.2:                           ; preds = %land.lhs.true.us.2.2
  %31 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %cmp26.us.2.2 = icmp eq i32 %29, %31
  br i1 %cmp26.us.2.2, label %if.then27.us.2.2, label %for.inc.us.2.2

if.then27.us.2.2:                                 ; preds = %land.lhs.true20.us.2.2, %land.lhs.true.us.2.2, %for.inc.us.1.2
  %.pr137 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  br label %for.inc.us.2.2

for.inc.us.2.2:                                   ; preds = %if.then27.us.2.2, %land.lhs.true20.us.2.2
  %32 = phi i32 [ %.pr137, %if.then27.us.2.2 ], [ %31, %land.lhs.true20.us.2.2 ]
  %ret.2.us.2.2 = phi i32 [ 0, %if.then27.us.2.2 ], [ %ret.2.us.1.2, %land.lhs.true20.us.2.2 ]
  switch i32 %32, label %land.lhs.true.us.3.2 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.us.3.2
  ]

land.lhs.true.us.3.2:                             ; preds = %for.inc.us.2.2
  %33 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %cmp16.us.3.2 = icmp eq i32 %32, %33
  br i1 %cmp16.us.3.2, label %if.then27.us.3.2, label %for.body4.preheader.3

if.then27.us.3.2:                                 ; preds = %land.lhs.true.us.3.2, %for.inc.us.2.2
  br label %for.body4.preheader.3

for.body4.preheader.3:                            ; preds = %land.lhs.true.us.3.2, %if.then27.us.3.2
  %ret.2.us.3.2 = phi i32 [ 0, %if.then27.us.3.2 ], [ %ret.2.us.2.2, %land.lhs.true.us.3.2 ]
  %34 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  switch i32 %34, label %land.lhs.true20.3115 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.3116
  ]

land.lhs.true20.3115:                             ; preds = %for.body4.preheader.3
  %35 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %cmp26.3114 = icmp eq i32 %34, %35
  br i1 %cmp26.3114, label %if.then27.3116, label %for.inc.3118

if.then27.3116:                                   ; preds = %land.lhs.true20.3115, %for.body4.preheader.3
  %.pr138 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  br label %for.inc.3118

for.inc.3118:                                     ; preds = %if.then27.3116, %land.lhs.true20.3115
  %36 = phi i32 [ %.pr138, %if.then27.3116 ], [ %35, %land.lhs.true20.3115 ]
  %ret.2.3117 = phi i32 [ 0, %if.then27.3116 ], [ %ret.2.us.3.2, %land.lhs.true20.3115 ]
  switch i32 %36, label %land.lhs.true20.1.3 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.1.3
  ]

land.lhs.true20.1.3:                              ; preds = %for.inc.3118
  %37 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %cmp26.1.3 = icmp eq i32 %36, %37
  br i1 %cmp26.1.3, label %if.then27.1.3, label %for.inc.1.3

if.then27.1.3:                                    ; preds = %land.lhs.true20.1.3, %for.inc.3118
  %.pr139 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  br label %for.inc.1.3

for.inc.1.3:                                      ; preds = %if.then27.1.3, %land.lhs.true20.1.3
  %38 = phi i32 [ %.pr139, %if.then27.1.3 ], [ %37, %land.lhs.true20.1.3 ]
  %ret.2.1.3 = phi i32 [ 0, %if.then27.1.3 ], [ %ret.2.3117, %land.lhs.true20.1.3 ]
  switch i32 %38, label %land.lhs.true20.2.3 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.2.3
  ]

land.lhs.true20.2.3:                              ; preds = %for.inc.1.3
  %39 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %cmp26.2.3 = icmp eq i32 %38, %39
  br i1 %cmp26.2.3, label %if.then27.2.3, label %for.inc.2.3

if.then27.2.3:                                    ; preds = %land.lhs.true20.2.3, %for.inc.1.3
  %.pr140 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  br label %for.inc.2.3

for.inc.2.3:                                      ; preds = %if.then27.2.3, %land.lhs.true20.2.3
  %40 = phi i32 [ %.pr140, %if.then27.2.3 ], [ %39, %land.lhs.true20.2.3 ]
  %ret.2.2.3 = phi i32 [ 0, %if.then27.2.3 ], [ %ret.2.1.3, %land.lhs.true20.2.3 ]
  switch i32 %40, label %for.inc29.3 [
    i32 11, label %cleanup31
    i32 0, label %if.then27.3.3
  ]

if.then27.3.3:                                    ; preds = %for.inc.2.3
  br label %for.inc29.3

for.inc29.3:                                      ; preds = %if.then27.3.3, %for.inc.2.3
  %ret.1.lcssa.3 = phi i32 [ 0, %if.then27.3.3 ], [ %ret.2.2.3, %for.inc.2.3 ]
  br label %cleanup31
}

; Function Attrs: nounwind
define hidden i32 @do_tick(i32 %d) local_unnamed_addr #0 {
entry:
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  tail call void @do_gravity(i32 %d)
  tail call void @do_merge(i32 %d)
  tail call void @do_gravity(i32 %d)
  %0 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  ret i32 %0
}

; Function Attrs: nounwind
define hidden void @do_newblock() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %cmp = icmp sgt i32 %0, 15
  br i1 %cmp, label %cleanup.cont, label %if.end

if.end:                                           ; preds = %entry
  %call = tail call i32 @rand() #6
  %1 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %sub = sub nsw i32 16, %1
  %rem = srem i32 %call, %sub
  %2 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !9
  %tobool = icmp eq i32 %2, 0
  br i1 %tobool, label %if.end8, label %for.inc

if.end8:                                          ; preds = %if.end
  %cmp9 = icmp eq i32 %rem, 0
  br i1 %cmp9, label %cleanup, label %for.inc

for.inc:                                          ; preds = %if.end8, %if.end
  %pn.2 = phi i32 [ 0, %if.end ], [ 1, %if.end8 ]
  %3 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !9
  %tobool.1 = icmp eq i32 %3, 0
  br i1 %tobool.1, label %if.end8.1, label %for.inc.1

cleanup:                                          ; preds = %for.inc.2.3, %if.end8.2.3, %if.end8.1.3, %if.end8.366, %if.end8.3.2, %if.end8.2.2, %if.end8.1.2, %if.end8.258, %if.end8.3.1, %if.end8.2.1, %if.end8.1.1, %if.end8.150, %if.end8.3, %if.end8.2, %if.end8.1, %if.end8
  %arrayidx6.lcssa = phi i32* [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 0), %if.end8 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 1), %if.end8.1 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), %if.end8.2 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), %if.end8.3 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), %if.end8.150 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), %if.end8.1.1 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), %if.end8.2.1 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), %if.end8.3.1 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), %if.end8.258 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), %if.end8.1.2 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), %if.end8.2.2 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), %if.end8.3.2 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), %if.end8.366 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), %if.end8.1.3 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), %if.end8.2.3 ], [ getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), %for.inc.2.3 ]
  %call11 = tail call i32 @rand() #6
  %rem12 = srem i32 %call11, 10
  %tobool13 = icmp eq i32 %rem12, 0
  %cond = select i1 %tobool13, i32 2, i32 1
  store i32 %cond, i32* %arrayidx6.lcssa, align 4, !tbaa !9
  %4 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  %add = add nsw i32 %4, 1
  store i32 %add, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 4), align 4, !tbaa !14
  br label %cleanup.cont

cleanup.cont:                                     ; preds = %for.inc.2.3, %cleanup, %entry
  ret void

if.end8.1:                                        ; preds = %for.inc
  %cmp9.1 = icmp eq i32 %pn.2, %rem
  br i1 %cmp9.1, label %cleanup, label %if.else.1

if.else.1:                                        ; preds = %if.end8.1
  %inc.1 = add nuw nsw i32 %pn.2, 1
  br label %for.inc.1

for.inc.1:                                        ; preds = %if.else.1, %for.inc
  %pn.2.1 = phi i32 [ %pn.2, %for.inc ], [ %inc.1, %if.else.1 ]
  %5 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !9
  %tobool.2 = icmp eq i32 %5, 0
  br i1 %tobool.2, label %if.end8.2, label %for.inc.2

if.end8.2:                                        ; preds = %for.inc.1
  %cmp9.2 = icmp eq i32 %pn.2.1, %rem
  br i1 %cmp9.2, label %cleanup, label %if.else.2

if.else.2:                                        ; preds = %if.end8.2
  %inc.2 = add nsw i32 %pn.2.1, 1
  br label %for.inc.2

for.inc.2:                                        ; preds = %if.else.2, %for.inc.1
  %pn.2.2 = phi i32 [ %pn.2.1, %for.inc.1 ], [ %inc.2, %if.else.2 ]
  %6 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 0, i32 3), align 4, !tbaa !9
  %tobool.3 = icmp eq i32 %6, 0
  br i1 %tobool.3, label %if.end8.3, label %for.inc.3

if.end8.3:                                        ; preds = %for.inc.2
  %cmp9.3 = icmp eq i32 %pn.2.2, %rem
  br i1 %cmp9.3, label %cleanup, label %if.else.3

if.else.3:                                        ; preds = %if.end8.3
  %inc.3 = add nsw i32 %pn.2.2, 1
  br label %for.inc.3

for.inc.3:                                        ; preds = %if.else.3, %for.inc.2
  %pn.2.3 = phi i32 [ %pn.2.2, %for.inc.2 ], [ %inc.3, %if.else.3 ]
  %7 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 0), align 4, !tbaa !9
  %tobool.148 = icmp eq i32 %7, 0
  br i1 %tobool.148, label %if.end8.150, label %for.inc.154

if.end8.150:                                      ; preds = %for.inc.3
  %cmp9.149 = icmp eq i32 %pn.2.3, %rem
  br i1 %cmp9.149, label %cleanup, label %if.else.152

if.else.152:                                      ; preds = %if.end8.150
  %inc.151 = add nsw i32 %pn.2.3, 1
  br label %for.inc.154

for.inc.154:                                      ; preds = %if.else.152, %for.inc.3
  %pn.2.153 = phi i32 [ %pn.2.3, %for.inc.3 ], [ %inc.151, %if.else.152 ]
  %8 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 1), align 4, !tbaa !9
  %tobool.1.1 = icmp eq i32 %8, 0
  br i1 %tobool.1.1, label %if.end8.1.1, label %for.inc.1.1

if.end8.1.1:                                      ; preds = %for.inc.154
  %cmp9.1.1 = icmp eq i32 %pn.2.153, %rem
  br i1 %cmp9.1.1, label %cleanup, label %if.else.1.1

if.else.1.1:                                      ; preds = %if.end8.1.1
  %inc.1.1 = add nsw i32 %pn.2.153, 1
  br label %for.inc.1.1

for.inc.1.1:                                      ; preds = %if.else.1.1, %for.inc.154
  %pn.2.1.1 = phi i32 [ %pn.2.153, %for.inc.154 ], [ %inc.1.1, %if.else.1.1 ]
  %9 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 2), align 4, !tbaa !9
  %tobool.2.1 = icmp eq i32 %9, 0
  br i1 %tobool.2.1, label %if.end8.2.1, label %for.inc.2.1

if.end8.2.1:                                      ; preds = %for.inc.1.1
  %cmp9.2.1 = icmp eq i32 %pn.2.1.1, %rem
  br i1 %cmp9.2.1, label %cleanup, label %if.else.2.1

if.else.2.1:                                      ; preds = %if.end8.2.1
  %inc.2.1 = add nsw i32 %pn.2.1.1, 1
  br label %for.inc.2.1

for.inc.2.1:                                      ; preds = %if.else.2.1, %for.inc.1.1
  %pn.2.2.1 = phi i32 [ %pn.2.1.1, %for.inc.1.1 ], [ %inc.2.1, %if.else.2.1 ]
  %10 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 1, i32 3), align 4, !tbaa !9
  %tobool.3.1 = icmp eq i32 %10, 0
  br i1 %tobool.3.1, label %if.end8.3.1, label %for.inc.3.1

if.end8.3.1:                                      ; preds = %for.inc.2.1
  %cmp9.3.1 = icmp eq i32 %pn.2.2.1, %rem
  br i1 %cmp9.3.1, label %cleanup, label %if.else.3.1

if.else.3.1:                                      ; preds = %if.end8.3.1
  %inc.3.1 = add nsw i32 %pn.2.2.1, 1
  br label %for.inc.3.1

for.inc.3.1:                                      ; preds = %if.else.3.1, %for.inc.2.1
  %pn.2.3.1 = phi i32 [ %pn.2.2.1, %for.inc.2.1 ], [ %inc.3.1, %if.else.3.1 ]
  %11 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 0), align 4, !tbaa !9
  %tobool.256 = icmp eq i32 %11, 0
  br i1 %tobool.256, label %if.end8.258, label %for.inc.262

if.end8.258:                                      ; preds = %for.inc.3.1
  %cmp9.257 = icmp eq i32 %pn.2.3.1, %rem
  br i1 %cmp9.257, label %cleanup, label %if.else.260

if.else.260:                                      ; preds = %if.end8.258
  %inc.259 = add nsw i32 %pn.2.3.1, 1
  br label %for.inc.262

for.inc.262:                                      ; preds = %if.else.260, %for.inc.3.1
  %pn.2.261 = phi i32 [ %pn.2.3.1, %for.inc.3.1 ], [ %inc.259, %if.else.260 ]
  %12 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 1), align 4, !tbaa !9
  %tobool.1.2 = icmp eq i32 %12, 0
  br i1 %tobool.1.2, label %if.end8.1.2, label %for.inc.1.2

if.end8.1.2:                                      ; preds = %for.inc.262
  %cmp9.1.2 = icmp eq i32 %pn.2.261, %rem
  br i1 %cmp9.1.2, label %cleanup, label %if.else.1.2

if.else.1.2:                                      ; preds = %if.end8.1.2
  %inc.1.2 = add nsw i32 %pn.2.261, 1
  br label %for.inc.1.2

for.inc.1.2:                                      ; preds = %if.else.1.2, %for.inc.262
  %pn.2.1.2 = phi i32 [ %pn.2.261, %for.inc.262 ], [ %inc.1.2, %if.else.1.2 ]
  %13 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 2), align 4, !tbaa !9
  %tobool.2.2 = icmp eq i32 %13, 0
  br i1 %tobool.2.2, label %if.end8.2.2, label %for.inc.2.2

if.end8.2.2:                                      ; preds = %for.inc.1.2
  %cmp9.2.2 = icmp eq i32 %pn.2.1.2, %rem
  br i1 %cmp9.2.2, label %cleanup, label %if.else.2.2

if.else.2.2:                                      ; preds = %if.end8.2.2
  %inc.2.2 = add nsw i32 %pn.2.1.2, 1
  br label %for.inc.2.2

for.inc.2.2:                                      ; preds = %if.else.2.2, %for.inc.1.2
  %pn.2.2.2 = phi i32 [ %pn.2.1.2, %for.inc.1.2 ], [ %inc.2.2, %if.else.2.2 ]
  %14 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 2, i32 3), align 4, !tbaa !9
  %tobool.3.2 = icmp eq i32 %14, 0
  br i1 %tobool.3.2, label %if.end8.3.2, label %for.inc.3.2

if.end8.3.2:                                      ; preds = %for.inc.2.2
  %cmp9.3.2 = icmp eq i32 %pn.2.2.2, %rem
  br i1 %cmp9.3.2, label %cleanup, label %if.else.3.2

if.else.3.2:                                      ; preds = %if.end8.3.2
  %inc.3.2 = add nsw i32 %pn.2.2.2, 1
  br label %for.inc.3.2

for.inc.3.2:                                      ; preds = %if.else.3.2, %for.inc.2.2
  %pn.2.3.2 = phi i32 [ %pn.2.2.2, %for.inc.2.2 ], [ %inc.3.2, %if.else.3.2 ]
  %15 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 0), align 4, !tbaa !9
  %tobool.364 = icmp eq i32 %15, 0
  br i1 %tobool.364, label %if.end8.366, label %for.inc.370

if.end8.366:                                      ; preds = %for.inc.3.2
  %cmp9.365 = icmp eq i32 %pn.2.3.2, %rem
  br i1 %cmp9.365, label %cleanup, label %if.else.368

if.else.368:                                      ; preds = %if.end8.366
  %inc.367 = add nsw i32 %pn.2.3.2, 1
  br label %for.inc.370

for.inc.370:                                      ; preds = %if.else.368, %for.inc.3.2
  %pn.2.369 = phi i32 [ %pn.2.3.2, %for.inc.3.2 ], [ %inc.367, %if.else.368 ]
  %16 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 1), align 4, !tbaa !9
  %tobool.1.3 = icmp eq i32 %16, 0
  br i1 %tobool.1.3, label %if.end8.1.3, label %for.inc.1.3

if.end8.1.3:                                      ; preds = %for.inc.370
  %cmp9.1.3 = icmp eq i32 %pn.2.369, %rem
  br i1 %cmp9.1.3, label %cleanup, label %if.else.1.3

if.else.1.3:                                      ; preds = %if.end8.1.3
  %inc.1.3 = add nsw i32 %pn.2.369, 1
  br label %for.inc.1.3

for.inc.1.3:                                      ; preds = %if.else.1.3, %for.inc.370
  %pn.2.1.3 = phi i32 [ %pn.2.369, %for.inc.370 ], [ %inc.1.3, %if.else.1.3 ]
  %17 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 2), align 4, !tbaa !9
  %tobool.2.3 = icmp eq i32 %17, 0
  br i1 %tobool.2.3, label %if.end8.2.3, label %for.inc.2.3

if.end8.2.3:                                      ; preds = %for.inc.1.3
  %cmp9.2.3 = icmp eq i32 %pn.2.1.3, %rem
  br i1 %cmp9.2.3, label %cleanup, label %if.else.2.3

if.else.2.3:                                      ; preds = %if.end8.2.3
  %inc.2.3 = add nsw i32 %pn.2.1.3, 1
  br label %for.inc.2.3

for.inc.2.3:                                      ; preds = %if.else.2.3, %for.inc.1.3
  %pn.2.2.3 = phi i32 [ %pn.2.1.3, %for.inc.1.3 ], [ %inc.2.3, %if.else.2.3 ]
  %18 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 0, i32 3, i32 3), align 4, !tbaa !9
  %tobool.3.3 = icmp eq i32 %18, 0
  %cmp9.3.3 = icmp eq i32 %pn.2.2.3, %rem
  %or.cond = and i1 %tobool.3.3, %cmp9.3.3
  br i1 %or.cond, label %cleanup, label %cleanup.cont
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #1

; Function Attrs: nounwind
define hidden i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call i32 @tcgetattr(i32 0, %struct.termios* nonnull @oldt) #6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 bitcast (%struct.termios* @newt to i8*), i8* align 4 bitcast (%struct.termios* @oldt to i8*), i32 60, i1 false), !tbaa.struct !15
  %0 = load i32, i32* getelementptr inbounds (%struct.termios, %struct.termios* @newt, i32 0, i32 3), align 4, !tbaa !17
  %and = and i32 %0, -11
  store i32 %and, i32* getelementptr inbounds (%struct.termios, %struct.termios* @newt, i32 0, i32 3), align 4, !tbaa !17
  %call1 = tail call i32 @tcsetattr(i32 0, i32 0, %struct.termios* nonnull @newt) #6
  %call2 = tail call i32 @time(i32* null) #6
  tail call void @srand(i32 %call2) #6
  tail call void @do_newblock()
  tail call void @do_newblock()
  tail call void @do_draw()
  br label %do.body

do.body:                                          ; preds = %do.body.backedge, %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4, !tbaa !10
  %call.i = tail call i32 @_IO_getc(%struct._IO_FILE* %1) #6
  switch i32 %call.i, label %do.body.backedge [
    i32 104, label %do.end
    i32 97, label %do.end
    i32 108, label %do.end.loopexit47
    i32 100, label %do.end.loopexit47
    i32 106, label %do.end.loopexit49
    i32 115, label %do.end.loopexit49
    i32 107, label %do.end.loopexit51
    i32 119, label %do.end.loopexit51
    i32 113, label %game_quit
    i32 27, label %sw.bb8
  ]

sw.bb8:                                           ; preds = %do.body
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4, !tbaa !10
  %call.i43 = tail call i32 @_IO_getc(%struct._IO_FILE* %2) #6
  %cmp = icmp eq i32 %call.i43, 91
  br i1 %cmp, label %if.then, label %do.end

if.then:                                          ; preds = %sw.bb8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4, !tbaa !10
  %call.i44 = tail call i32 @_IO_getc(%struct._IO_FILE* %3) #6
  switch i32 %call.i44, label %do.body.backedge [
    i32 65, label %do.end
    i32 66, label %do.end.loopexit47
    i32 67, label %do.end.loopexit49
    i32 68, label %do.end.loopexit51
  ]

do.end.loopexit47:                                ; preds = %do.body, %do.body, %if.then
  %direction.0.ph.ph48 = phi i32 [ 2, %if.then ], [ 3, %do.body ], [ 3, %do.body ]
  br label %do.end

do.end.loopexit49:                                ; preds = %do.body, %do.body, %if.then
  %direction.0.ph.ph50 = phi i32 [ 3, %if.then ], [ 2, %do.body ], [ 2, %do.body ]
  br label %do.end

do.end.loopexit51:                                ; preds = %do.body, %do.body, %if.then
  %direction.0.ph.ph52 = phi i32 [ 4, %if.then ], [ 1, %do.body ], [ 1, %do.body ]
  br label %do.end

do.end:                                           ; preds = %sw.bb8, %do.body, %do.body, %if.then, %do.end.loopexit51, %do.end.loopexit49, %do.end.loopexit47
  %direction.0.ph = phi i32 [ %direction.0.ph.ph48, %do.end.loopexit47 ], [ %direction.0.ph.ph50, %do.end.loopexit49 ], [ %direction.0.ph.ph52, %do.end.loopexit51 ], [ -1, %sw.bb8 ], [ 4, %do.body ], [ 4, %do.body ], [ 1, %if.then ]
  store i32 0, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  tail call void @do_gravity(i32 %direction.0.ph) #6
  tail call void @do_merge(i32 %direction.0.ph) #6
  tail call void @do_gravity(i32 %direction.0.ph) #6
  %4 = load i32, i32* getelementptr inbounds (%struct.gamestate_struct__, %struct.gamestate_struct__* @game, i32 0, i32 1), align 4, !tbaa !13
  %cmp18 = icmp eq i32 %4, 0
  br i1 %cmp18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %do.end
  tail call void @do_newblock()
  br label %if.end20

if.end20:                                         ; preds = %do.end, %if.then19
  tail call void @do_draw()
  %call21 = tail call i32 @do_check_end_condition()
  switch i32 %call21, label %do.body.backedge [
    i32 -1, label %game_lose
    i32 1, label %game_win
  ]

do.body.backedge:                                 ; preds = %if.end20, %do.body, %if.then
  br label %do.body

game_lose:                                        ; preds = %if.end20
  %puts40 = tail call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @str.22, i32 0, i32 0))
  br label %game_quit

game_win:                                         ; preds = %if.end20
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str, i32 0, i32 0))
  br label %game_quit

game_quit:                                        ; preds = %do.body, %game_win, %game_lose
  %call34 = tail call i32 @tcsetattr(i32 0, i32 0, %struct.termios* nonnull @oldt) #6
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @tcgetattr(i32, %struct.termios*) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i1) #5

; Function Attrs: nounwind
declare i32 @tcsetattr(i32, i32, %struct.termios*) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @srand(i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @time(i32*) local_unnamed_addr #1

declare i32 @_IO_getc(%struct._IO_FILE*) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #6

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
!2 = !{!3, !7, i64 68}
!3 = !{!"gamestate_struct__", !4, i64 0, !6, i64 64, !7, i64 68, !7, i64 72, !6, i64 76}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!"int", !4, i64 0}
!7 = !{!"long", !4, i64 0}
!8 = !{!3, !7, i64 72}
!9 = !{!6, !6, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !4, i64 0}
!12 = !{!7, !7, i64 0}
!13 = !{!3, !6, i64 64}
!14 = !{!3, !6, i64 76}
!15 = !{i64 0, i64 4, !9, i64 4, i64 4, !9, i64 8, i64 4, !9, i64 12, i64 4, !9, i64 16, i64 1, !16, i64 17, i64 32, !16, i64 52, i64 4, !9, i64 56, i64 4, !9}
!16 = !{!4, !4, i64 0}
!17 = !{!18, !6, i64 12}
!18 = !{!"termios", !6, i64 0, !6, i64 4, !6, i64 8, !6, i64 12, !4, i64 16, !4, i64 17, !6, i64 52, !6, i64 56}
