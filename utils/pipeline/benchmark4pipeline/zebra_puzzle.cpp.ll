; ModuleID = 'benchmark4pipeline/zebra_puzzle.cpp'
source_filename = "benchmark4pipeline/zebra_puzzle.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.HouseNoRule = type { i32, i32, i32 }
%struct.AttrPairRule = type { i32, i32, i32, i32 }
%struct.NextToRule = type { i32, i32, i32, i32 }
%struct.LeftOfRule = type { i32, i32, i32, i32 }

$_ZN10LeftOfRule7invalidEPA5_i = comdat any

$_ZN12AttrPairRule7invalidEPA5_ii = comdat any

$_ZN10NextToRule7invalidEPA5_ii = comdat any

$_ZN10LeftOfRule7invalidEPA5_ii = comdat any

@.str = private unnamed_addr constant [6 x i8] c"Color\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"Man\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Drink\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Animal\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"Smoke\00", align 1
@Attrib_str = dso_local global [5 x i8*] [i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0)], align 16
@.str.5 = private unnamed_addr constant [4 x i8] c"Red\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"Green\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"White\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"Yellow\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"Blue\00", align 1
@Colors_str = dso_local global [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0)], align 16
@.str.10 = private unnamed_addr constant [8 x i8] c"English\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"Swede\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"Dane\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"German\00", align 1
@.str.14 = private unnamed_addr constant [10 x i8] c"Norwegian\00", align 1
@Mans_str = dso_local global [5 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.14, i32 0, i32 0)], align 16
@.str.15 = private unnamed_addr constant [4 x i8] c"Tea\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"Coffee\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"Milk\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c"Beer\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"Water\00", align 1
@Drinks_str = dso_local global [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0)], align 16
@.str.20 = private unnamed_addr constant [4 x i8] c"Dog\00", align 1
@.str.21 = private unnamed_addr constant [6 x i8] c"Birds\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"Cats\00", align 1
@.str.23 = private unnamed_addr constant [6 x i8] c"Horse\00", align 1
@.str.24 = private unnamed_addr constant [6 x i8] c"Zebra\00", align 1
@Animals_str = dso_local global [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.24, i32 0, i32 0)], align 16
@.str.25 = private unnamed_addr constant [9 x i8] c"PallMall\00", align 1
@.str.26 = private unnamed_addr constant [8 x i8] c"Dunhill\00", align 1
@.str.27 = private unnamed_addr constant [6 x i8] c"Blend\00", align 1
@.str.28 = private unnamed_addr constant [11 x i8] c"BlueMaster\00", align 1
@.str.29 = private unnamed_addr constant [7 x i8] c"Prince\00", align 1
@Smokes_str = dso_local global [5 x i8*] [i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0)], align 16
@.str.30 = private unnamed_addr constant [6 x i8] c"%-10s\00", align 1
@.str.31 = private unnamed_addr constant [6 x i8] c"House\00", align 1
@.str.32 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.33 = private unnamed_addr constant [6 x i8] c"%-10d\00", align 1
@housenos = dso_local global [2 x %struct.HouseNoRule] [%struct.HouseNoRule { i32 2, i32 2, i32 2 }, %struct.HouseNoRule { i32 0, i32 1, i32 4 }], align 16
@pairs = dso_local global [8 x %struct.AttrPairRule] [%struct.AttrPairRule { i32 1, i32 0, i32 0, i32 0 }, %struct.AttrPairRule { i32 1, i32 1, i32 3, i32 0 }, %struct.AttrPairRule { i32 1, i32 2, i32 2, i32 0 }, %struct.AttrPairRule { i32 0, i32 1, i32 2, i32 1 }, %struct.AttrPairRule { i32 4, i32 0, i32 3, i32 1 }, %struct.AttrPairRule { i32 4, i32 1, i32 0, i32 3 }, %struct.AttrPairRule { i32 4, i32 3, i32 2, i32 3 }, %struct.AttrPairRule { i32 1, i32 3, i32 4, i32 4 }], align 16
@nexttos = dso_local global [4 x %struct.NextToRule] [%struct.NextToRule { i32 4, i32 2, i32 3, i32 2 }, %struct.NextToRule { i32 4, i32 1, i32 3, i32 3 }, %struct.NextToRule { i32 1, i32 4, i32 0, i32 4 }, %struct.NextToRule { i32 4, i32 2, i32 2, i32 4 }], align 16
@leftofs = dso_local global [1 x %struct.LeftOfRule] [%struct.LeftOfRule { i32 0, i32 1, i32 0, i32 2 }], align 16

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z11printHousesPA5_i([5 x i32]* %ha) #0 {
entry:
  %ha.addr = alloca [5 x i32]*, align 8
  %attr_names = alloca [5 x i8**], align 16
  %__range1 = alloca [5 x i8*]*, align 8
  %__begin1 = alloca i8**, align 8
  %__end1 = alloca i8**, align 8
  %name = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  %0 = bitcast [5 x i8**]* %attr_names to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false)
  %1 = bitcast i8* %0 to [5 x i8**]*
  %2 = getelementptr inbounds [5 x i8**], [5 x i8**]* %1, i32 0, i32 0
  store i8** getelementptr inbounds ([5 x i8*], [5 x i8*]* @Colors_str, i32 0, i32 0), i8*** %2, align 16
  %3 = getelementptr inbounds [5 x i8**], [5 x i8**]* %1, i32 0, i32 1
  store i8** getelementptr inbounds ([5 x i8*], [5 x i8*]* @Mans_str, i32 0, i32 0), i8*** %3, align 8
  %4 = getelementptr inbounds [5 x i8**], [5 x i8**]* %1, i32 0, i32 2
  store i8** getelementptr inbounds ([5 x i8*], [5 x i8*]* @Drinks_str, i32 0, i32 0), i8*** %4, align 16
  %5 = getelementptr inbounds [5 x i8**], [5 x i8**]* %1, i32 0, i32 3
  store i8** getelementptr inbounds ([5 x i8*], [5 x i8*]* @Animals_str, i32 0, i32 0), i8*** %5, align 8
  %6 = getelementptr inbounds [5 x i8**], [5 x i8**]* %1, i32 0, i32 4
  store i8** getelementptr inbounds ([5 x i8*], [5 x i8*]* @Smokes_str, i32 0, i32 0), i8*** %6, align 16
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.31, i32 0, i32 0))
  store [5 x i8*]* @Attrib_str, [5 x i8*]** %__range1, align 8
  store i8** getelementptr inbounds ([5 x i8*], [5 x i8*]* @Attrib_str, i32 0, i32 0), i8*** %__begin1, align 8
  store i8** getelementptr inbounds (i8*, i8** getelementptr inbounds ([5 x i8*], [5 x i8*]* @Attrib_str, i32 0, i32 0), i64 5), i8*** %__end1, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i8**, i8*** %__begin1, align 8
  %8 = load i8**, i8*** %__end1, align 8
  %cmp = icmp ne i8** %7, %8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i8**, i8*** %__begin1, align 8
  %10 = load i8*, i8** %9, align 8
  store i8* %10, i8** %name, align 8
  %11 = load i8*, i8** %name, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.30, i32 0, i32 0), i8* %11)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i8**, i8*** %__begin1, align 8
  %incdec.ptr = getelementptr inbounds i8*, i8** %12, i32 1
  store i8** %incdec.ptr, i8*** %__begin1, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.32, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc20, %for.end
  %13 = load i32, i32* %i, align 4
  %cmp4 = icmp slt i32 %13, 5
  br i1 %cmp4, label %for.body5, label %for.end22

for.body5:                                        ; preds = %for.cond3
  %14 = load i32, i32* %i, align 4
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33, i32 0, i32 0), i32 %14)
  store i32 0, i32* %j, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc17, %for.body5
  %15 = load i32, i32* %j, align 4
  %cmp8 = icmp slt i32 %15, 5
  br i1 %cmp8, label %for.body9, label %for.end18

for.body9:                                        ; preds = %for.cond7
  %16 = load i32, i32* %j, align 4
  %idxprom = sext i32 %16 to i64
  %arrayidx = getelementptr inbounds [5 x i8**], [5 x i8**]* %attr_names, i64 0, i64 %idxprom
  %17 = load i8**, i8*** %arrayidx, align 8
  %18 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %19 to i64
  %arrayidx11 = getelementptr inbounds [5 x i32], [5 x i32]* %18, i64 %idxprom10
  %20 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %20 to i64
  %arrayidx13 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx11, i64 0, i64 %idxprom12
  %21 = load i32, i32* %arrayidx13, align 4
  %idxprom14 = sext i32 %21 to i64
  %arrayidx15 = getelementptr inbounds i8*, i8** %17, i64 %idxprom14
  %22 = load i8*, i8** %arrayidx15, align 8
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.30, i32 0, i32 0), i8* %22)
  br label %for.inc17

for.inc17:                                        ; preds = %for.body9
  %23 = load i32, i32* %j, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond7

for.end18:                                        ; preds = %for.cond7
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.32, i32 0, i32 0))
  br label %for.inc20

for.inc20:                                        ; preds = %for.end18
  %24 = load i32, i32* %i, align 4
  %inc21 = add nsw i32 %24, 1
  store i32 %inc21, i32* %i, align 4
  br label %for.cond3

for.end22:                                        ; preds = %for.cond3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline optnone uwtable
define dso_local zeroext i1 @_Z7invalidPA5_i([5 x i32]* %ha) #0 {
entry:
  %retval = alloca i1, align 1
  %ha.addr = alloca [5 x i32]*, align 8
  %__range1 = alloca [1 x %struct.LeftOfRule]*, align 8
  %__begin1 = alloca %struct.LeftOfRule*, align 8
  %__end1 = alloca %struct.LeftOfRule*, align 8
  %rule = alloca %struct.LeftOfRule*, align 8
  %i = alloca i32, align 4
  %__range2 = alloca [8 x %struct.AttrPairRule]*, align 8
  %__begin2 = alloca %struct.AttrPairRule*, align 8
  %__end2 = alloca %struct.AttrPairRule*, align 8
  %rule7 = alloca %struct.AttrPairRule*, align 8
  %__range214 = alloca [4 x %struct.NextToRule]*, align 8
  %__begin215 = alloca %struct.NextToRule*, align 8
  %__end216 = alloca %struct.NextToRule*, align 8
  %rule20 = alloca %struct.NextToRule*, align 8
  %__range227 = alloca [1 x %struct.LeftOfRule]*, align 8
  %__begin228 = alloca %struct.LeftOfRule*, align 8
  %__end229 = alloca %struct.LeftOfRule*, align 8
  %rule33 = alloca %struct.LeftOfRule*, align 8
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  store [1 x %struct.LeftOfRule]* @leftofs, [1 x %struct.LeftOfRule]** %__range1, align 8
  store %struct.LeftOfRule* getelementptr inbounds ([1 x %struct.LeftOfRule], [1 x %struct.LeftOfRule]* @leftofs, i32 0, i32 0), %struct.LeftOfRule** %__begin1, align 8
  store %struct.LeftOfRule* getelementptr inbounds (%struct.LeftOfRule, %struct.LeftOfRule* getelementptr inbounds ([1 x %struct.LeftOfRule], [1 x %struct.LeftOfRule]* @leftofs, i32 0, i32 0), i64 1), %struct.LeftOfRule** %__end1, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.LeftOfRule*, %struct.LeftOfRule** %__begin1, align 8
  %1 = load %struct.LeftOfRule*, %struct.LeftOfRule** %__end1, align 8
  %cmp = icmp ne %struct.LeftOfRule* %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.LeftOfRule*, %struct.LeftOfRule** %__begin1, align 8
  store %struct.LeftOfRule* %2, %struct.LeftOfRule** %rule, align 8
  %3 = load %struct.LeftOfRule*, %struct.LeftOfRule** %rule, align 8
  %4 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %call = call zeroext i1 @_ZN10LeftOfRule7invalidEPA5_i(%struct.LeftOfRule* %3, [5 x i32]* %4)
  br i1 %call, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i1 true, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load %struct.LeftOfRule*, %struct.LeftOfRule** %__begin1, align 8
  %incdec.ptr = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %5, i32 1
  store %struct.LeftOfRule* %incdec.ptr, %struct.LeftOfRule** %__begin1, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc40, %for.end
  %6 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %6, 5
  br i1 %cmp2, label %for.body3, label %for.end41

for.body3:                                        ; preds = %for.cond1
  store [8 x %struct.AttrPairRule]* @pairs, [8 x %struct.AttrPairRule]** %__range2, align 8
  store %struct.AttrPairRule* getelementptr inbounds ([8 x %struct.AttrPairRule], [8 x %struct.AttrPairRule]* @pairs, i32 0, i32 0), %struct.AttrPairRule** %__begin2, align 8
  store %struct.AttrPairRule* getelementptr inbounds (%struct.AttrPairRule, %struct.AttrPairRule* getelementptr inbounds ([8 x %struct.AttrPairRule], [8 x %struct.AttrPairRule]* @pairs, i32 0, i32 0), i64 8), %struct.AttrPairRule** %__end2, align 8
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc11, %for.body3
  %7 = load %struct.AttrPairRule*, %struct.AttrPairRule** %__begin2, align 8
  %8 = load %struct.AttrPairRule*, %struct.AttrPairRule** %__end2, align 8
  %cmp5 = icmp ne %struct.AttrPairRule* %7, %8
  br i1 %cmp5, label %for.body6, label %for.end13

for.body6:                                        ; preds = %for.cond4
  %9 = load %struct.AttrPairRule*, %struct.AttrPairRule** %__begin2, align 8
  store %struct.AttrPairRule* %9, %struct.AttrPairRule** %rule7, align 8
  %10 = load %struct.AttrPairRule*, %struct.AttrPairRule** %rule7, align 8
  %11 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %12 = load i32, i32* %i, align 4
  %call8 = call zeroext i1 @_ZN12AttrPairRule7invalidEPA5_ii(%struct.AttrPairRule* %10, [5 x i32]* %11, i32 %12)
  br i1 %call8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %for.body6
  store i1 true, i1* %retval, align 1
  br label %return

if.end10:                                         ; preds = %for.body6
  br label %for.inc11

for.inc11:                                        ; preds = %if.end10
  %13 = load %struct.AttrPairRule*, %struct.AttrPairRule** %__begin2, align 8
  %incdec.ptr12 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %13, i32 1
  store %struct.AttrPairRule* %incdec.ptr12, %struct.AttrPairRule** %__begin2, align 8
  br label %for.cond4

for.end13:                                        ; preds = %for.cond4
  store [4 x %struct.NextToRule]* @nexttos, [4 x %struct.NextToRule]** %__range214, align 8
  store %struct.NextToRule* getelementptr inbounds ([4 x %struct.NextToRule], [4 x %struct.NextToRule]* @nexttos, i32 0, i32 0), %struct.NextToRule** %__begin215, align 8
  store %struct.NextToRule* getelementptr inbounds (%struct.NextToRule, %struct.NextToRule* getelementptr inbounds ([4 x %struct.NextToRule], [4 x %struct.NextToRule]* @nexttos, i32 0, i32 0), i64 4), %struct.NextToRule** %__end216, align 8
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc24, %for.end13
  %14 = load %struct.NextToRule*, %struct.NextToRule** %__begin215, align 8
  %15 = load %struct.NextToRule*, %struct.NextToRule** %__end216, align 8
  %cmp18 = icmp ne %struct.NextToRule* %14, %15
  br i1 %cmp18, label %for.body19, label %for.end26

for.body19:                                       ; preds = %for.cond17
  %16 = load %struct.NextToRule*, %struct.NextToRule** %__begin215, align 8
  store %struct.NextToRule* %16, %struct.NextToRule** %rule20, align 8
  %17 = load %struct.NextToRule*, %struct.NextToRule** %rule20, align 8
  %18 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %19 = load i32, i32* %i, align 4
  %call21 = call zeroext i1 @_ZN10NextToRule7invalidEPA5_ii(%struct.NextToRule* %17, [5 x i32]* %18, i32 %19)
  br i1 %call21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %for.body19
  store i1 true, i1* %retval, align 1
  br label %return

if.end23:                                         ; preds = %for.body19
  br label %for.inc24

for.inc24:                                        ; preds = %if.end23
  %20 = load %struct.NextToRule*, %struct.NextToRule** %__begin215, align 8
  %incdec.ptr25 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %20, i32 1
  store %struct.NextToRule* %incdec.ptr25, %struct.NextToRule** %__begin215, align 8
  br label %for.cond17

for.end26:                                        ; preds = %for.cond17
  store [1 x %struct.LeftOfRule]* @leftofs, [1 x %struct.LeftOfRule]** %__range227, align 8
  store %struct.LeftOfRule* getelementptr inbounds ([1 x %struct.LeftOfRule], [1 x %struct.LeftOfRule]* @leftofs, i32 0, i32 0), %struct.LeftOfRule** %__begin228, align 8
  store %struct.LeftOfRule* getelementptr inbounds (%struct.LeftOfRule, %struct.LeftOfRule* getelementptr inbounds ([1 x %struct.LeftOfRule], [1 x %struct.LeftOfRule]* @leftofs, i32 0, i32 0), i64 1), %struct.LeftOfRule** %__end229, align 8
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc37, %for.end26
  %21 = load %struct.LeftOfRule*, %struct.LeftOfRule** %__begin228, align 8
  %22 = load %struct.LeftOfRule*, %struct.LeftOfRule** %__end229, align 8
  %cmp31 = icmp ne %struct.LeftOfRule* %21, %22
  br i1 %cmp31, label %for.body32, label %for.end39

for.body32:                                       ; preds = %for.cond30
  %23 = load %struct.LeftOfRule*, %struct.LeftOfRule** %__begin228, align 8
  store %struct.LeftOfRule* %23, %struct.LeftOfRule** %rule33, align 8
  %24 = load %struct.LeftOfRule*, %struct.LeftOfRule** %rule33, align 8
  %25 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %26 = load i32, i32* %i, align 4
  %call34 = call zeroext i1 @_ZN10LeftOfRule7invalidEPA5_ii(%struct.LeftOfRule* %24, [5 x i32]* %25, i32 %26)
  br i1 %call34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %for.body32
  store i1 true, i1* %retval, align 1
  br label %return

if.end36:                                         ; preds = %for.body32
  br label %for.inc37

for.inc37:                                        ; preds = %if.end36
  %27 = load %struct.LeftOfRule*, %struct.LeftOfRule** %__begin228, align 8
  %incdec.ptr38 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %27, i32 1
  store %struct.LeftOfRule* %incdec.ptr38, %struct.LeftOfRule** %__begin228, align 8
  br label %for.cond30

for.end39:                                        ; preds = %for.cond30
  br label %for.inc40

for.inc40:                                        ; preds = %for.end39
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end41:                                        ; preds = %for.cond1
  store i1 false, i1* %retval, align 1
  br label %return

return:                                           ; preds = %for.end41, %if.then35, %if.then22, %if.then9, %if.then
  %29 = load i1, i1* %retval, align 1
  ret i1 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZN10LeftOfRule7invalidEPA5_i(%struct.LeftOfRule* %this, [5 x i32]* %ha) #3 comdat align 2 {
entry:
  %this.addr = alloca %struct.LeftOfRule*, align 8
  %ha.addr = alloca [5 x i32]*, align 8
  store %struct.LeftOfRule* %this, %struct.LeftOfRule** %this.addr, align 8
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  %this1 = load %struct.LeftOfRule*, %struct.LeftOfRule** %this.addr, align 8
  %0 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %0, i64 0
  %a2 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 2
  %1 = load i32, i32* %a2, align 4
  %idxprom = zext i32 %1 to i64
  %arrayidx2 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 %idxprom
  %2 = load i32, i32* %arrayidx2, align 4
  %v2 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 3
  %3 = load i32, i32* %v2, align 4
  %cmp = icmp eq i32 %2, %3
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %4 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %arrayidx3 = getelementptr inbounds [5 x i32], [5 x i32]* %4, i64 4
  %a1 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 0
  %5 = load i32, i32* %a1, align 4
  %idxprom4 = zext i32 %5 to i64
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx3, i64 0, i64 %idxprom4
  %6 = load i32, i32* %arrayidx5, align 4
  %v1 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 1
  %7 = load i32, i32* %v1, align 4
  %cmp6 = icmp eq i32 %6, %7
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %8 = phi i1 [ true, %entry ], [ %cmp6, %lor.rhs ]
  ret i1 %8
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZN12AttrPairRule7invalidEPA5_ii(%struct.AttrPairRule* %this, [5 x i32]* %ha, i32 %i) #3 comdat align 2 {
entry:
  %this.addr = alloca %struct.AttrPairRule*, align 8
  %ha.addr = alloca [5 x i32]*, align 8
  %i.addr = alloca i32, align 4
  store %struct.AttrPairRule* %this, %struct.AttrPairRule** %this.addr, align 8
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %this1 = load %struct.AttrPairRule*, %struct.AttrPairRule** %this.addr, align 8
  %0 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %1 = load i32, i32* %i.addr, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %0, i64 %idxprom
  %a1 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 0
  %2 = load i32, i32* %a1, align 4
  %idxprom2 = zext i32 %2 to i64
  %arrayidx3 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 %idxprom2
  %3 = load i32, i32* %arrayidx3, align 4
  %cmp = icmp sge i32 %3, 0
  br i1 %cmp, label %land.lhs.true, label %land.end37

land.lhs.true:                                    ; preds = %entry
  %4 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %5 = load i32, i32* %i.addr, align 4
  %idxprom4 = sext i32 %5 to i64
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* %4, i64 %idxprom4
  %a2 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 2
  %6 = load i32, i32* %a2, align 4
  %idxprom6 = zext i32 %6 to i64
  %arrayidx7 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx5, i64 0, i64 %idxprom6
  %7 = load i32, i32* %arrayidx7, align 4
  %cmp8 = icmp sge i32 %7, 0
  br i1 %cmp8, label %land.rhs, label %land.end37

land.rhs:                                         ; preds = %land.lhs.true
  %8 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %9 = load i32, i32* %i.addr, align 4
  %idxprom9 = sext i32 %9 to i64
  %arrayidx10 = getelementptr inbounds [5 x i32], [5 x i32]* %8, i64 %idxprom9
  %a111 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 0
  %10 = load i32, i32* %a111, align 4
  %idxprom12 = zext i32 %10 to i64
  %arrayidx13 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx10, i64 0, i64 %idxprom12
  %11 = load i32, i32* %arrayidx13, align 4
  %v1 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 1
  %12 = load i32, i32* %v1, align 4
  %cmp14 = icmp eq i32 %11, %12
  br i1 %cmp14, label %land.lhs.true15, label %lor.rhs

land.lhs.true15:                                  ; preds = %land.rhs
  %13 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %14 = load i32, i32* %i.addr, align 4
  %idxprom16 = sext i32 %14 to i64
  %arrayidx17 = getelementptr inbounds [5 x i32], [5 x i32]* %13, i64 %idxprom16
  %a218 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 2
  %15 = load i32, i32* %a218, align 4
  %idxprom19 = zext i32 %15 to i64
  %arrayidx20 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx17, i64 0, i64 %idxprom19
  %16 = load i32, i32* %arrayidx20, align 4
  %v2 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 3
  %17 = load i32, i32* %v2, align 4
  %cmp21 = icmp ne i32 %16, %17
  br i1 %cmp21, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true15, %land.rhs
  %18 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %19 = load i32, i32* %i.addr, align 4
  %idxprom22 = sext i32 %19 to i64
  %arrayidx23 = getelementptr inbounds [5 x i32], [5 x i32]* %18, i64 %idxprom22
  %a124 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 0
  %20 = load i32, i32* %a124, align 4
  %idxprom25 = zext i32 %20 to i64
  %arrayidx26 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx23, i64 0, i64 %idxprom25
  %21 = load i32, i32* %arrayidx26, align 4
  %v127 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 1
  %22 = load i32, i32* %v127, align 4
  %cmp28 = icmp ne i32 %21, %22
  br i1 %cmp28, label %land.rhs29, label %land.end

land.rhs29:                                       ; preds = %lor.rhs
  %23 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %24 = load i32, i32* %i.addr, align 4
  %idxprom30 = sext i32 %24 to i64
  %arrayidx31 = getelementptr inbounds [5 x i32], [5 x i32]* %23, i64 %idxprom30
  %a232 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 2
  %25 = load i32, i32* %a232, align 4
  %idxprom33 = zext i32 %25 to i64
  %arrayidx34 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx31, i64 0, i64 %idxprom33
  %26 = load i32, i32* %arrayidx34, align 4
  %v235 = getelementptr inbounds %struct.AttrPairRule, %struct.AttrPairRule* %this1, i32 0, i32 3
  %27 = load i32, i32* %v235, align 4
  %cmp36 = icmp eq i32 %26, %27
  br label %land.end

land.end:                                         ; preds = %land.rhs29, %lor.rhs
  %28 = phi i1 [ false, %lor.rhs ], [ %cmp36, %land.rhs29 ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.lhs.true15
  %29 = phi i1 [ true, %land.lhs.true15 ], [ %28, %land.end ]
  br label %land.end37

land.end37:                                       ; preds = %lor.end, %land.lhs.true, %entry
  %30 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %29, %lor.end ]
  ret i1 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZN10NextToRule7invalidEPA5_ii(%struct.NextToRule* %this, [5 x i32]* %ha, i32 %i) #3 comdat align 2 {
entry:
  %this.addr = alloca %struct.NextToRule*, align 8
  %ha.addr = alloca [5 x i32]*, align 8
  %i.addr = alloca i32, align 4
  store %struct.NextToRule* %this, %struct.NextToRule** %this.addr, align 8
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %this1 = load %struct.NextToRule*, %struct.NextToRule** %this.addr, align 8
  %0 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %1 = load i32, i32* %i.addr, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %0, i64 %idxprom
  %a1 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 0
  %2 = load i32, i32* %a1, align 4
  %idxprom2 = zext i32 %2 to i64
  %arrayidx3 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 %idxprom2
  %3 = load i32, i32* %arrayidx3, align 4
  %v1 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 1
  %4 = load i32, i32* %v1, align 4
  %cmp = icmp eq i32 %3, %4
  br i1 %cmp, label %land.rhs, label %land.end52

land.rhs:                                         ; preds = %entry
  %5 = load i32, i32* %i.addr, align 4
  %cmp4 = icmp eq i32 %5, 0
  br i1 %cmp4, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %land.rhs
  %6 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %7 = load i32, i32* %i.addr, align 4
  %add = add nsw i32 %7, 1
  %idxprom5 = sext i32 %add to i64
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %6, i64 %idxprom5
  %a2 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 2
  %8 = load i32, i32* %a2, align 4
  %idxprom7 = zext i32 %8 to i64
  %arrayidx8 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx6, i64 0, i64 %idxprom7
  %9 = load i32, i32* %arrayidx8, align 4
  %cmp9 = icmp sge i32 %9, 0
  br i1 %cmp9, label %land.lhs.true10, label %lor.lhs.false

land.lhs.true10:                                  ; preds = %land.lhs.true
  %10 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %11 = load i32, i32* %i.addr, align 4
  %add11 = add nsw i32 %11, 1
  %idxprom12 = sext i32 %add11 to i64
  %arrayidx13 = getelementptr inbounds [5 x i32], [5 x i32]* %10, i64 %idxprom12
  %a214 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 2
  %12 = load i32, i32* %a214, align 4
  %idxprom15 = zext i32 %12 to i64
  %arrayidx16 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx13, i64 0, i64 %idxprom15
  %13 = load i32, i32* %arrayidx16, align 4
  %v2 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 3
  %14 = load i32, i32* %v2, align 4
  %cmp17 = icmp ne i32 %13, %14
  br i1 %cmp17, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true10, %land.lhs.true, %land.rhs
  %15 = load i32, i32* %i.addr, align 4
  %cmp18 = icmp eq i32 %15, 4
  br i1 %cmp18, label %land.lhs.true19, label %lor.rhs

land.lhs.true19:                                  ; preds = %lor.lhs.false
  %16 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %17 = load i32, i32* %i.addr, align 4
  %sub = sub nsw i32 %17, 1
  %idxprom20 = sext i32 %sub to i64
  %arrayidx21 = getelementptr inbounds [5 x i32], [5 x i32]* %16, i64 %idxprom20
  %a222 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 2
  %18 = load i32, i32* %a222, align 4
  %idxprom23 = zext i32 %18 to i64
  %arrayidx24 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx21, i64 0, i64 %idxprom23
  %19 = load i32, i32* %arrayidx24, align 4
  %v225 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 3
  %20 = load i32, i32* %v225, align 4
  %cmp26 = icmp ne i32 %19, %20
  br i1 %cmp26, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true19, %lor.lhs.false
  %21 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %22 = load i32, i32* %i.addr, align 4
  %add27 = add nsw i32 %22, 1
  %idxprom28 = sext i32 %add27 to i64
  %arrayidx29 = getelementptr inbounds [5 x i32], [5 x i32]* %21, i64 %idxprom28
  %a230 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 2
  %23 = load i32, i32* %a230, align 4
  %idxprom31 = zext i32 %23 to i64
  %arrayidx32 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx29, i64 0, i64 %idxprom31
  %24 = load i32, i32* %arrayidx32, align 4
  %cmp33 = icmp sge i32 %24, 0
  br i1 %cmp33, label %land.lhs.true34, label %land.end

land.lhs.true34:                                  ; preds = %lor.rhs
  %25 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %26 = load i32, i32* %i.addr, align 4
  %add35 = add nsw i32 %26, 1
  %idxprom36 = sext i32 %add35 to i64
  %arrayidx37 = getelementptr inbounds [5 x i32], [5 x i32]* %25, i64 %idxprom36
  %a238 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 2
  %27 = load i32, i32* %a238, align 4
  %idxprom39 = zext i32 %27 to i64
  %arrayidx40 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx37, i64 0, i64 %idxprom39
  %28 = load i32, i32* %arrayidx40, align 4
  %v241 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 3
  %29 = load i32, i32* %v241, align 4
  %cmp42 = icmp ne i32 %28, %29
  br i1 %cmp42, label %land.rhs43, label %land.end

land.rhs43:                                       ; preds = %land.lhs.true34
  %30 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %31 = load i32, i32* %i.addr, align 4
  %sub44 = sub nsw i32 %31, 1
  %idxprom45 = sext i32 %sub44 to i64
  %arrayidx46 = getelementptr inbounds [5 x i32], [5 x i32]* %30, i64 %idxprom45
  %a247 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 2
  %32 = load i32, i32* %a247, align 4
  %idxprom48 = zext i32 %32 to i64
  %arrayidx49 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx46, i64 0, i64 %idxprom48
  %33 = load i32, i32* %arrayidx49, align 4
  %v250 = getelementptr inbounds %struct.NextToRule, %struct.NextToRule* %this1, i32 0, i32 3
  %34 = load i32, i32* %v250, align 4
  %cmp51 = icmp ne i32 %33, %34
  br label %land.end

land.end:                                         ; preds = %land.rhs43, %land.lhs.true34, %lor.rhs
  %35 = phi i1 [ false, %land.lhs.true34 ], [ false, %lor.rhs ], [ %cmp51, %land.rhs43 ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.lhs.true19, %land.lhs.true10
  %36 = phi i1 [ true, %land.lhs.true19 ], [ true, %land.lhs.true10 ], [ %35, %land.end ]
  br label %land.end52

land.end52:                                       ; preds = %lor.end, %entry
  %37 = phi i1 [ false, %entry ], [ %36, %lor.end ]
  ret i1 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local zeroext i1 @_ZN10LeftOfRule7invalidEPA5_ii(%struct.LeftOfRule* %this, [5 x i32]* %ha, i32 %i) #3 comdat align 2 {
entry:
  %this.addr = alloca %struct.LeftOfRule*, align 8
  %ha.addr = alloca [5 x i32]*, align 8
  %i.addr = alloca i32, align 4
  store %struct.LeftOfRule* %this, %struct.LeftOfRule** %this.addr, align 8
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %this1 = load %struct.LeftOfRule*, %struct.LeftOfRule** %this.addr, align 8
  %0 = load i32, i32* %i.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %land.end33

land.lhs.true:                                    ; preds = %entry
  %1 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %2 = load i32, i32* %i.addr, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %1, i64 %idxprom
  %a1 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 0
  %3 = load i32, i32* %a1, align 4
  %idxprom2 = zext i32 %3 to i64
  %arrayidx3 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 %idxprom2
  %4 = load i32, i32* %arrayidx3, align 4
  %cmp4 = icmp sge i32 %4, 0
  br i1 %cmp4, label %land.rhs, label %land.end33

land.rhs:                                         ; preds = %land.lhs.true
  %5 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %6 = load i32, i32* %i.addr, align 4
  %sub = sub nsw i32 %6, 1
  %idxprom5 = sext i32 %sub to i64
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %5, i64 %idxprom5
  %a17 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 0
  %7 = load i32, i32* %a17, align 4
  %idxprom8 = zext i32 %7 to i64
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx6, i64 0, i64 %idxprom8
  %8 = load i32, i32* %arrayidx9, align 4
  %v1 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 1
  %9 = load i32, i32* %v1, align 4
  %cmp10 = icmp eq i32 %8, %9
  br i1 %cmp10, label %land.lhs.true11, label %lor.rhs

land.lhs.true11:                                  ; preds = %land.rhs
  %10 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %11 = load i32, i32* %i.addr, align 4
  %idxprom12 = sext i32 %11 to i64
  %arrayidx13 = getelementptr inbounds [5 x i32], [5 x i32]* %10, i64 %idxprom12
  %a2 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 2
  %12 = load i32, i32* %a2, align 4
  %idxprom14 = zext i32 %12 to i64
  %arrayidx15 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx13, i64 0, i64 %idxprom14
  %13 = load i32, i32* %arrayidx15, align 4
  %v2 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 3
  %14 = load i32, i32* %v2, align 4
  %cmp16 = icmp ne i32 %13, %14
  br i1 %cmp16, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true11, %land.rhs
  %15 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %16 = load i32, i32* %i.addr, align 4
  %sub17 = sub nsw i32 %16, 1
  %idxprom18 = sext i32 %sub17 to i64
  %arrayidx19 = getelementptr inbounds [5 x i32], [5 x i32]* %15, i64 %idxprom18
  %a120 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 0
  %17 = load i32, i32* %a120, align 4
  %idxprom21 = zext i32 %17 to i64
  %arrayidx22 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx19, i64 0, i64 %idxprom21
  %18 = load i32, i32* %arrayidx22, align 4
  %v123 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 1
  %19 = load i32, i32* %v123, align 4
  %cmp24 = icmp ne i32 %18, %19
  br i1 %cmp24, label %land.rhs25, label %land.end

land.rhs25:                                       ; preds = %lor.rhs
  %20 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %21 = load i32, i32* %i.addr, align 4
  %idxprom26 = sext i32 %21 to i64
  %arrayidx27 = getelementptr inbounds [5 x i32], [5 x i32]* %20, i64 %idxprom26
  %a228 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 2
  %22 = load i32, i32* %a228, align 4
  %idxprom29 = zext i32 %22 to i64
  %arrayidx30 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx27, i64 0, i64 %idxprom29
  %23 = load i32, i32* %arrayidx30, align 4
  %v231 = getelementptr inbounds %struct.LeftOfRule, %struct.LeftOfRule* %this1, i32 0, i32 3
  %24 = load i32, i32* %v231, align 4
  %cmp32 = icmp eq i32 %23, %24
  br label %land.end

land.end:                                         ; preds = %land.rhs25, %lor.rhs
  %25 = phi i1 [ false, %lor.rhs ], [ %cmp32, %land.rhs25 ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.lhs.true11
  %26 = phi i1 [ true, %land.lhs.true11 ], [ %25, %land.end ]
  br label %land.end33

land.end33:                                       ; preds = %lor.end, %land.lhs.true, %entry
  %27 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %26, %lor.end ]
  ret i1 %27
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z6searchPA5_bPA5_iii([5 x i8]* %used, [5 x i32]* %ha, i32 %hno, i32 %attr) #0 {
entry:
  %used.addr = alloca [5 x i8]*, align 8
  %ha.addr = alloca [5 x i32]*, align 8
  %hno.addr = alloca i32, align 4
  %attr.addr = alloca i32, align 4
  %nexthno = alloca i32, align 4
  %nextattr = alloca i32, align 4
  %i = alloca i32, align 4
  store [5 x i8]* %used, [5 x i8]** %used.addr, align 8
  store [5 x i32]* %ha, [5 x i32]** %ha.addr, align 8
  store i32 %hno, i32* %hno.addr, align 4
  store i32 %attr, i32* %attr.addr, align 4
  %0 = load i32, i32* %attr.addr, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %attr.addr, align 4
  %add = add nsw i32 %1, 1
  store i32 %add, i32* %nextattr, align 4
  %2 = load i32, i32* %hno.addr, align 4
  store i32 %2, i32* %nexthno, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 0, i32* %nextattr, align 4
  %3 = load i32, i32* %hno.addr, align 4
  %add1 = add nsw i32 %3, 1
  store i32 %add1, i32* %nexthno, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %5 = load i32, i32* %hno.addr, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %4, i64 %idxprom
  %6 = load i32, i32* %attr.addr, align 4
  %idxprom2 = sext i32 %6 to i64
  %arrayidx3 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 %idxprom2
  %7 = load i32, i32* %arrayidx3, align 4
  %cmp4 = icmp ne i32 %7, -1
  br i1 %cmp4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.end
  %8 = load [5 x i8]*, [5 x i8]** %used.addr, align 8
  %9 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %10 = load i32, i32* %nexthno, align 4
  %11 = load i32, i32* %nextattr, align 4
  call void @_Z6searchPA5_bPA5_iii([5 x i8]* %8, [5 x i32]* %9, i32 %10, i32 %11)
  br label %if.end37

if.else6:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else6
  %12 = load i32, i32* %i, align 4
  %cmp7 = icmp slt i32 %12, 5
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load [5 x i8]*, [5 x i8]** %used.addr, align 8
  %14 = load i32, i32* %attr.addr, align 4
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds [5 x i8], [5 x i8]* %13, i64 %idxprom8
  %15 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %15 to i64
  %arrayidx11 = getelementptr inbounds [5 x i8], [5 x i8]* %arrayidx9, i64 0, i64 %idxprom10
  %16 = load i8, i8* %arrayidx11, align 1
  %tobool = trunc i8 %16 to i1
  br i1 %tobool, label %if.then12, label %if.end13

if.then12:                                        ; preds = %for.body
  br label %for.inc

if.end13:                                         ; preds = %for.body
  %17 = load [5 x i8]*, [5 x i8]** %used.addr, align 8
  %18 = load i32, i32* %attr.addr, align 4
  %idxprom14 = sext i32 %18 to i64
  %arrayidx15 = getelementptr inbounds [5 x i8], [5 x i8]* %17, i64 %idxprom14
  %19 = load i32, i32* %i, align 4
  %idxprom16 = sext i32 %19 to i64
  %arrayidx17 = getelementptr inbounds [5 x i8], [5 x i8]* %arrayidx15, i64 0, i64 %idxprom16
  store i8 1, i8* %arrayidx17, align 1
  %20 = load i32, i32* %i, align 4
  %21 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %22 = load i32, i32* %hno.addr, align 4
  %idxprom18 = sext i32 %22 to i64
  %arrayidx19 = getelementptr inbounds [5 x i32], [5 x i32]* %21, i64 %idxprom18
  %23 = load i32, i32* %attr.addr, align 4
  %idxprom20 = sext i32 %23 to i64
  %arrayidx21 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx19, i64 0, i64 %idxprom20
  store i32 %20, i32* %arrayidx21, align 4
  %24 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %call = call zeroext i1 @_Z7invalidPA5_i([5 x i32]* %24)
  br i1 %call, label %if.end28, label %if.then22

if.then22:                                        ; preds = %if.end13
  %25 = load i32, i32* %hno.addr, align 4
  %cmp23 = icmp eq i32 %25, 4
  br i1 %cmp23, label %land.lhs.true, label %if.else26

land.lhs.true:                                    ; preds = %if.then22
  %26 = load i32, i32* %attr.addr, align 4
  %cmp24 = icmp eq i32 %26, 4
  br i1 %cmp24, label %if.then25, label %if.else26

if.then25:                                        ; preds = %land.lhs.true
  %27 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  call void @_Z11printHousesPA5_i([5 x i32]* %27)
  br label %if.end27

if.else26:                                        ; preds = %land.lhs.true, %if.then22
  %28 = load [5 x i8]*, [5 x i8]** %used.addr, align 8
  %29 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %30 = load i32, i32* %nexthno, align 4
  %31 = load i32, i32* %nextattr, align 4
  call void @_Z6searchPA5_bPA5_iii([5 x i8]* %28, [5 x i32]* %29, i32 %30, i32 %31)
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %if.then25
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end13
  %32 = load [5 x i8]*, [5 x i8]** %used.addr, align 8
  %33 = load i32, i32* %attr.addr, align 4
  %idxprom29 = sext i32 %33 to i64
  %arrayidx30 = getelementptr inbounds [5 x i8], [5 x i8]* %32, i64 %idxprom29
  %34 = load i32, i32* %i, align 4
  %idxprom31 = sext i32 %34 to i64
  %arrayidx32 = getelementptr inbounds [5 x i8], [5 x i8]* %arrayidx30, i64 0, i64 %idxprom31
  store i8 0, i8* %arrayidx32, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end28, %if.then12
  %35 = load i32, i32* %i, align 4
  %inc = add nsw i32 %35, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %36 = load [5 x i32]*, [5 x i32]** %ha.addr, align 8
  %37 = load i32, i32* %hno.addr, align 4
  %idxprom33 = sext i32 %37 to i64
  %arrayidx34 = getelementptr inbounds [5 x i32], [5 x i32]* %36, i64 %idxprom33
  %38 = load i32, i32* %attr.addr, align 4
  %idxprom35 = sext i32 %38 to i64
  %arrayidx36 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx34, i64 0, i64 %idxprom35
  store i32 -1, i32* %arrayidx36, align 4
  br label %if.end37

if.end37:                                         ; preds = %for.end, %if.then5
  ret void
}

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #4 {
entry:
  %retval = alloca i32, align 4
  %used = alloca [5 x [5 x i8]], align 16
  %ha = alloca [5 x [5 x i32]], align 16
  %__range1 = alloca [2 x %struct.HouseNoRule]*, align 8
  %__begin1 = alloca %struct.HouseNoRule*, align 8
  %__end1 = alloca %struct.HouseNoRule*, align 8
  %rule = alloca %struct.HouseNoRule*, align 8
  store i32 0, i32* %retval, align 4
  %0 = bitcast [5 x [5 x i8]]* %used to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 25, i1 false)
  %arraydecay = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %ha, i32 0, i32 0
  %1 = bitcast [5 x i32]* %arraydecay to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 -1, i64 100, i1 false)
  store [2 x %struct.HouseNoRule]* @housenos, [2 x %struct.HouseNoRule]** %__range1, align 8
  store %struct.HouseNoRule* getelementptr inbounds ([2 x %struct.HouseNoRule], [2 x %struct.HouseNoRule]* @housenos, i32 0, i32 0), %struct.HouseNoRule** %__begin1, align 8
  store %struct.HouseNoRule* getelementptr inbounds (%struct.HouseNoRule, %struct.HouseNoRule* getelementptr inbounds ([2 x %struct.HouseNoRule], [2 x %struct.HouseNoRule]* @housenos, i32 0, i32 0), i64 2), %struct.HouseNoRule** %__end1, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.HouseNoRule*, %struct.HouseNoRule** %__begin1, align 8
  %3 = load %struct.HouseNoRule*, %struct.HouseNoRule** %__end1, align 8
  %cmp = icmp ne %struct.HouseNoRule* %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.HouseNoRule*, %struct.HouseNoRule** %__begin1, align 8
  store %struct.HouseNoRule* %4, %struct.HouseNoRule** %rule, align 8
  %5 = load %struct.HouseNoRule*, %struct.HouseNoRule** %rule, align 8
  %v = getelementptr inbounds %struct.HouseNoRule, %struct.HouseNoRule* %5, i32 0, i32 2
  %6 = load i32, i32* %v, align 4
  %7 = load %struct.HouseNoRule*, %struct.HouseNoRule** %rule, align 8
  %houseno = getelementptr inbounds %struct.HouseNoRule, %struct.HouseNoRule* %7, i32 0, i32 0
  %8 = load i32, i32* %houseno, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %ha, i64 0, i64 %idxprom
  %9 = load %struct.HouseNoRule*, %struct.HouseNoRule** %rule, align 8
  %a = getelementptr inbounds %struct.HouseNoRule, %struct.HouseNoRule* %9, i32 0, i32 1
  %10 = load i32, i32* %a, align 4
  %idxprom1 = zext i32 %10 to i64
  %arrayidx2 = getelementptr inbounds [5 x i32], [5 x i32]* %arrayidx, i64 0, i64 %idxprom1
  store i32 %6, i32* %arrayidx2, align 4
  %11 = load %struct.HouseNoRule*, %struct.HouseNoRule** %rule, align 8
  %a3 = getelementptr inbounds %struct.HouseNoRule, %struct.HouseNoRule* %11, i32 0, i32 1
  %12 = load i32, i32* %a3, align 4
  %idxprom4 = zext i32 %12 to i64
  %arrayidx5 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* %used, i64 0, i64 %idxprom4
  %13 = load %struct.HouseNoRule*, %struct.HouseNoRule** %rule, align 8
  %v6 = getelementptr inbounds %struct.HouseNoRule, %struct.HouseNoRule* %13, i32 0, i32 2
  %14 = load i32, i32* %v6, align 4
  %idxprom7 = sext i32 %14 to i64
  %arrayidx8 = getelementptr inbounds [5 x i8], [5 x i8]* %arrayidx5, i64 0, i64 %idxprom7
  store i8 1, i8* %arrayidx8, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load %struct.HouseNoRule*, %struct.HouseNoRule** %__begin1, align 8
  %incdec.ptr = getelementptr inbounds %struct.HouseNoRule, %struct.HouseNoRule* %15, i32 1
  store %struct.HouseNoRule* %incdec.ptr, %struct.HouseNoRule** %__begin1, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay9 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* %used, i32 0, i32 0
  %arraydecay10 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* %ha, i32 0, i32 0
  call void @_Z6searchPA5_bPA5_iii([5 x i8]* %arraydecay9, [5 x i32]* %arraydecay10, i32 0, i32 0)
  ret i32 0
}

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
