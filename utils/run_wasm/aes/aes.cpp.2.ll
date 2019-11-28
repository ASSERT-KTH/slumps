; Replacing %conv2 = zext i8 1 to i32 -> i32 1; ModuleID = '<stdin>'
source_filename = "tests/_aes/aes.cpp"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%class.AES = type { i32, i32, i32, i32 }

@.str = private unnamed_addr constant [21 x i8] c"Incorrect key length\00", align 1
@_ZTIPKc = external constant i8*
@_ZL4sbox = internal constant [16 x [16 x i8]] [[16 x i8] c"c|w{\F2ko\C50\01g+\FE\D7\ABv", [16 x i8] c"\CA\82\C9}\FAYG\F0\AD\D4\A2\AF\9C\A4r\C0", [16 x i8] c"\B7\FD\93&6?\F7\CC4\A5\E5\F1q\D81\15", [16 x i8] c"\04\C7#\C3\18\96\05\9A\07\12\80\E2\EB'\B2u", [16 x i8] c"\09\83,\1A\1BnZ\A0R;\D6\B3)\E3/\84", [16 x i8] c"S\D1\00\ED \FC\B1[j\CB\BE9JLX\CF", [16 x i8] c"\D0\EF\AA\FBCM3\85E\F9\02\7FP<\9F\A8", [16 x i8] c"Q\A3@\8F\92\9D8\F5\BC\B6\DA!\10\FF\F3\D2", [16 x i8] c"\CD\0C\13\EC_\97D\17\C4\A7~=d]\19s", [16 x i8] c"`\81O\DC\22*\90\88F\EE\B8\14\DE^\0B\DB", [16 x i8] c"\E02:\0AI\06$\5C\C2\D3\ACb\91\95\E4y", [16 x i8] c"\E7\C87m\8D\D5N\A9lV\F4\EAez\AE\08", [16 x i8] c"\BAx%.\1C\A6\B4\C6\E8\DDt\1FK\BD\8B\8A", [16 x i8] c"p>\B5fH\03\F6\0Ea5W\B9\86\C1\1D\9E", [16 x i8] c"\E1\F8\98\11i\D9\8E\94\9B\1E\87\E9\CEU(\DF", [16 x i8] c"\8C\A1\89\0D\BF\E6BhA\99-\0F\B0T\BB\16"], align 16
@_ZL8inv_sbox = internal constant [16 x [16 x i8]] [[16 x i8] c"R\09j\D506\A58\BF@\A3\9E\81\F3\D7\FB", [16 x i8] c"|\E39\82\9B/\FF\874\8ECD\C4\DE\E9\CB", [16 x i8] c"T{\942\A6\C2#=\EEL\95\0BB\FA\C3N", [16 x i8] c"\08.\A1f(\D9$\B2v[\A2Im\8B\D1%", [16 x i8] c"r\F8\F6d\86h\98\16\D4\A4\5C\CC]e\B6\92", [16 x i8] c"lpHP\FD\ED\B9\DA^\15FW\A7\8D\9D\84", [16 x i8] c"\90\D8\AB\00\8C\BC\D3\0A\F7\E4X\05\B8\B3E\06", [16 x i8] c"\D0,\1E\8F\CA?\0F\02\C1\AF\BD\03\01\13\8Ak", [16 x i8] c":\91\11AOg\DC\EA\97\F2\CF\CE\F0\B4\E6s", [16 x i8] c"\96\ACt\22\E7\AD5\85\E2\F97\E8\1Cu\DFn", [16 x i8] c"G\F1\1Aq\1D)\C5\89o\B7b\0E\AA\18\BE\1B", [16 x i8] c"\FCV>K\C6\D2y \9A\DB\C0\FEx\CDZ\F4", [16 x i8] c"\1F\DD\A83\88\07\C71\B1\12\10Y'\80\EC_", [16 x i8] c"`Q\7F\A9\19\B5J\0D-\E5z\9F\93\C9\9C\EF", [16 x i8] c"\A0\E0;M\AE*\F5\B0\C8\EB\BB<\83S\99a", [16 x i8] c"\17+\04~\BAw\D6&\E1i\14cU!\0C}"], align 16

; Function Attrs: noinline ssp uwtable
define void @_ZN3AESC2Ei(%class.AES* %this, i32 %keyLen) unnamed_addr #0 align 2 {
entry:
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  store i32 4, i32* %Nb, align 4
  switch i32 %keyLen, label %sw.default [
    i32 128, label %sw.bb
    i32 192, label %sw.bb2
    i32 256, label %sw.bb5
  ]

sw.bb:                                            ; preds = %entry
  %Nk = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  store i32 4, i32* %Nk, align 4
  %Nr = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  store i32 10, i32* %Nr, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %Nk3 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  store i32 6, i32* %Nk3, align 4
  %Nr4 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  store i32 12, i32* %Nr4, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %Nk6 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  store i32 8, i32* %Nk6, align 4
  %Nr7 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  store i32 14, i32* %Nr7, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %exception = call i8* @__cxa_allocate_exception(i64 8) #5
  %0 = bitcast i8* %exception to i8**
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0), i8** %0, align 16
  call void @__cxa_throw(i8* %exception, i8* bitcast (i8** @_ZTIPKc to i8*), i8* null) #6
  unreachable

sw.epilog:                                        ; preds = %sw.bb5, %sw.bb2, %sw.bb
  %Nb8 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %1 = load i32, i32* %Nb8, align 4
  %mul = mul nsw i32 4, %1
  %conv = sext i32 %mul to i64
  %mul9 = mul i64 %conv, 1
  %conv10 = trunc i64 %mul9 to i32
  %blockBytesLen = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  store i32 %conv10, i32* %blockBytesLen, align 4
  ret void
}

declare i8* @__cxa_allocate_exception(i64)

declare void @__cxa_throw(i8*, i8*, i8*)

; Function Attrs: noinline ssp uwtable
define void @_ZN3AESC1Ei(%class.AES* %this, i32 %keyLen) unnamed_addr #0 align 2 {
entry:
  call void @_ZN3AESC2Ei(%class.AES* %this, i32 %keyLen)
  ret void
}

; Function Attrs: noinline ssp uwtable
define i8* @_ZN3AES10EncryptECBEPhjS0_Rj(%class.AES* %this, i8* %in, i32 %inLen, i8* %key, i32* dereferenceable(4) %outLen) #0 align 2 {
entry:
  %call = call i32 @_ZN3AES16GetPaddingLengthEj(%class.AES* %this, i32 %inLen)
  store i32 %call, i32* %outLen, align 4
  %0 = load i32, i32* %outLen, align 4
  %call2 = call i8* @_ZN3AES12PaddingNullsEPhjj(%class.AES* %this, i8* %in, i32 %inLen, i32 %0)
  %1 = load i32, i32* %outLen, align 4
  %conv = zext i32 %1 to i64
  %call3 = call i8* @_Znam(i64 %conv) #7
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ]
  %2 = load i32, i32* %outLen, align 4
  %cmp = icmp ult i32 %i.0, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idx.ext = zext i32 %i.0 to i64
  %add.ptr = getelementptr inbounds i8, i8* %call2, i64 %idx.ext
  %idx.ext4 = zext i32 %i.0 to i64
  %add.ptr5 = getelementptr inbounds i8, i8* %call3, i64 %idx.ext4
  call void @_ZN3AES12EncryptBlockEPhS0_S0_(%class.AES* %this, i8* %add.ptr, i8* %add.ptr5, i8* %key)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %blockBytesLen = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %3 = load i32, i32* %blockBytesLen, align 4
  %add = add i32 %i.0, %3
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %isnull = icmp eq i8* %call2, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %for.end
  call void @_ZdaPv(i8* %call2) #8
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %for.end
  ret i8* %call3
}

; Function Attrs: noinline nounwind ssp uwtable
define i32 @_ZN3AES16GetPaddingLengthEj(%class.AES* %this, i32 %len) #1 align 2 {
entry:
  %blockBytesLen = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %0 = load i32, i32* %blockBytesLen, align 4
  %div = udiv i32 %len, %0
  %blockBytesLen2 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %1 = load i32, i32* %blockBytesLen2, align 4
  %rem = urem i32 %len, %1
  %tobool = icmp ne i32 %rem, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %inc = add i32 %div, 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %lengthWithPadding.0 = phi i32 [ %inc, %if.then ], [ %div, %entry ]
  %blockBytesLen3 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %2 = load i32, i32* %blockBytesLen3, align 4
  %mul = mul i32 %lengthWithPadding.0, %2
  ret i32 %mul
}

; Function Attrs: noinline ssp uwtable
define i8* @_ZN3AES12PaddingNullsEPhjj(%class.AES* %this, i8* %in, i32 %inLen, i32 %alignLen) #0 align 2 {
entry:
  %conv = zext i32 %alignLen to i64
  %call = call i8* @_Znam(i64 %conv) #7
  %conv2 = zext i32 %inLen to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call, i8* align 1 %in, i64 %conv2, i1 false)
  %idx.ext = zext i32 %inLen to i64
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 %idx.ext
  %sub = sub i32 %alignLen, %inLen
  %conv3 = zext i32 %sub to i64
  call void @llvm.memset.p0i8.i64(i8* align 1 %add.ptr, i8 0, i64 %conv3, i1 false)
  ret i8* %call
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #2

; Function Attrs: noinline ssp uwtable
define void @_ZN3AES12EncryptBlockEPhS0_S0_(%class.AES* %this, i8* %in, i8* %out, i8* %key) #0 align 2 {
entry:
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %0 = load i32, i32* %Nb, align 4
  %mul = mul nsw i32 4, %0
  %Nr = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  %1 = load i32, i32* %Nr, align 4
  %add = add nsw i32 %1, 1
  %mul2 = mul nsw i32 %mul, %add
  %conv = sext i32 %mul2 to i64
  %call = call i8* @_Znam(i64 %conv) #7
  call void @_ZN3AES12KeyExpansionEPhS0_(%class.AES* %this, i8* %key, i8* %call)
  %call3 = call i8* @_Znam(i64 32) #7
  %2 = bitcast i8* %call3 to i8**
  %Nb4 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %3 = load i32, i32* %Nb4, align 4
  %mul5 = mul nsw i32 4, %3
  %conv6 = sext i32 %mul5 to i64
  %call7 = call i8* @_Znam(i64 %conv6) #7
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 0
  store i8* %call7, i8** %arrayidx, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds i8*, i8** %2, i64 0
  %4 = load i8*, i8** %arrayidx8, align 8
  %Nb9 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %5 = load i32, i32* %Nb9, align 4
  %mul10 = mul nsw i32 %5, %i.0
  %idx.ext = sext i32 %mul10 to i64
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %idx.ext
  %idxprom = sext i32 %i.0 to i64
  %arrayidx11 = getelementptr inbounds i8*, i8** %2, i64 %idxprom
  store i8* %add.ptr, i8** %arrayidx11, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc30, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc31, %for.inc30 ]
  %cmp13 = icmp slt i32 %i.1, 4
  br i1 %cmp13, label %for.body14, label %for.end32

for.body14:                                       ; preds = %for.cond12
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc27, %for.body14
  %j.0 = phi i32 [ 0, %for.body14 ], [ %inc28, %for.inc27 ]
  %Nb16 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %6 = load i32, i32* %Nb16, align 4
  %cmp17 = icmp slt i32 %j.0, %6
  br i1 %cmp17, label %for.body18, label %for.end29

for.body18:                                       ; preds = %for.cond15
  %mul19 = mul nsw i32 4, %j.0
  %add20 = add nsw i32 %i.1, %mul19
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds i8, i8* %in, i64 %idxprom21
  %7 = load i8, i8* %arrayidx22, align 1
  %idxprom23 = sext i32 %i.1 to i64
  %arrayidx24 = getelementptr inbounds i8*, i8** %2, i64 %idxprom23
  %8 = load i8*, i8** %arrayidx24, align 8
  %idxprom25 = sext i32 %j.0 to i64
  %arrayidx26 = getelementptr inbounds i8, i8* %8, i64 %idxprom25
  store i8 %7, i8* %arrayidx26, align 1
  br label %for.inc27

for.inc27:                                        ; preds = %for.body18
  %inc28 = add nsw i32 %j.0, 1
  br label %for.cond15

for.end29:                                        ; preds = %for.cond15
  br label %for.inc30

for.inc30:                                        ; preds = %for.end29
  %inc31 = add nsw i32 %i.1, 1
  br label %for.cond12

for.end32:                                        ; preds = %for.cond12
  call void @_ZN3AES11AddRoundKeyEPPhS0_(%class.AES* %this, i8** %2, i8* %call)
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc42, %for.end32
  %round.0 = phi i32 [ 1, %for.end32 ], [ %inc43, %for.inc42 ]
  %Nr34 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  %9 = load i32, i32* %Nr34, align 4
  %sub = sub nsw i32 %9, 1
  %cmp35 = icmp sle i32 %round.0, %sub
  br i1 %cmp35, label %for.body36, label %for.end44

for.body36:                                       ; preds = %for.cond33
  call void @_ZN3AES8SubBytesEPPh(%class.AES* %this, i8** %2)
  call void @_ZN3AES9ShiftRowsEPPh(%class.AES* %this, i8** %2)
  call void @_ZN3AES10MixColumnsEPPh(%class.AES* %this, i8** %2)
  %mul37 = mul nsw i32 %round.0, 4
  %Nb38 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %10 = load i32, i32* %Nb38, align 4
  %mul39 = mul nsw i32 %mul37, %10
  %idx.ext40 = sext i32 %mul39 to i64
  %add.ptr41 = getelementptr inbounds i8, i8* %call, i64 %idx.ext40
  call void @_ZN3AES11AddRoundKeyEPPhS0_(%class.AES* %this, i8** %2, i8* %add.ptr41)
  br label %for.inc42

for.inc42:                                        ; preds = %for.body36
  %inc43 = add nsw i32 %round.0, 1
  br label %for.cond33

for.end44:                                        ; preds = %for.cond33
  call void @_ZN3AES8SubBytesEPPh(%class.AES* %this, i8** %2)
  call void @_ZN3AES9ShiftRowsEPPh(%class.AES* %this, i8** %2)
  %Nr45 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  %11 = load i32, i32* %Nr45, align 4
  %mul46 = mul nsw i32 %11, 4
  %Nb47 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %12 = load i32, i32* %Nb47, align 4
  %mul48 = mul nsw i32 %mul46, %12
  %idx.ext49 = sext i32 %mul48 to i64
  %add.ptr50 = getelementptr inbounds i8, i8* %call, i64 %idx.ext49
  call void @_ZN3AES11AddRoundKeyEPPhS0_(%class.AES* %this, i8** %2, i8* %add.ptr50)
  br label %for.cond51

for.cond51:                                       ; preds = %for.inc69, %for.end44
  %i.2 = phi i32 [ 0, %for.end44 ], [ %inc70, %for.inc69 ]
  %cmp52 = icmp slt i32 %i.2, 4
  br i1 %cmp52, label %for.body53, label %for.end71

for.body53:                                       ; preds = %for.cond51
  br label %for.cond54

for.cond54:                                       ; preds = %for.inc66, %for.body53
  %j.1 = phi i32 [ 0, %for.body53 ], [ %inc67, %for.inc66 ]
  %Nb55 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %13 = load i32, i32* %Nb55, align 4
  %cmp56 = icmp slt i32 %j.1, %13
  br i1 %cmp56, label %for.body57, label %for.end68

for.body57:                                       ; preds = %for.cond54
  %idxprom58 = sext i32 %i.2 to i64
  %arrayidx59 = getelementptr inbounds i8*, i8** %2, i64 %idxprom58
  %14 = load i8*, i8** %arrayidx59, align 8
  %idxprom60 = sext i32 %j.1 to i64
  %arrayidx61 = getelementptr inbounds i8, i8* %14, i64 %idxprom60
  %15 = load i8, i8* %arrayidx61, align 1
  %mul62 = mul nsw i32 4, %j.1
  %add63 = add nsw i32 %i.2, %mul62
  %idxprom64 = sext i32 %add63 to i64
  %arrayidx65 = getelementptr inbounds i8, i8* %out, i64 %idxprom64
  store i8 %15, i8* %arrayidx65, align 1
  br label %for.inc66

for.inc66:                                        ; preds = %for.body57
  %inc67 = add nsw i32 %j.1, 1
  br label %for.cond54

for.end68:                                        ; preds = %for.cond54
  br label %for.inc69

for.inc69:                                        ; preds = %for.end68
  %inc70 = add nsw i32 %i.2, 1
  br label %for.cond51

for.end71:                                        ; preds = %for.cond51
  %arrayidx72 = getelementptr inbounds i8*, i8** %2, i64 0
  %16 = load i8*, i8** %arrayidx72, align 8
  %isnull = icmp eq i8* %16, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %for.end71
  call void @_ZdaPv(i8* %16) #8
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %for.end71
  %isnull73 = icmp eq i8** %2, null
  br i1 %isnull73, label %delete.end75, label %delete.notnull74

delete.notnull74:                                 ; preds = %delete.end
  %17 = bitcast i8** %2 to i8*
  call void @_ZdaPv(i8* %17) #8
  br label %delete.end75

delete.end75:                                     ; preds = %delete.notnull74, %delete.end
  %isnull76 = icmp eq i8* %call, null
  br i1 %isnull76, label %delete.end78, label %delete.notnull77

delete.notnull77:                                 ; preds = %delete.end75
  call void @_ZdaPv(i8* %call) #8
  br label %delete.end78

delete.end78:                                     ; preds = %delete.notnull77, %delete.end75
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #3

; Function Attrs: noinline ssp uwtable
define i8* @_ZN3AES10DecryptECBEPhjS0_(%class.AES* %this, i8* %in, i32 %inLen, i8* %key) #0 align 2 {
entry:
  %conv = zext i32 %inLen to i64
  %call = call i8* @_Znam(i64 %conv) #7
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ]
  %cmp = icmp ult i32 %i.0, %inLen
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idx.ext = zext i32 %i.0 to i64
  %add.ptr = getelementptr inbounds i8, i8* %in, i64 %idx.ext
  %idx.ext2 = zext i32 %i.0 to i64
  %add.ptr3 = getelementptr inbounds i8, i8* %call, i64 %idx.ext2
  call void @_ZN3AES12DecryptBlockEPhS0_S0_(%class.AES* %this, i8* %add.ptr, i8* %add.ptr3, i8* %key)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %blockBytesLen = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %0 = load i32, i32* %blockBytesLen, align 4
  %add = add i32 %i.0, %0
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i8* %call
}

; Function Attrs: noinline ssp uwtable
define void @_ZN3AES12DecryptBlockEPhS0_S0_(%class.AES* %this, i8* %in, i8* %out, i8* %key) #0 align 2 {
entry:
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %0 = load i32, i32* %Nb, align 4
  %mul = mul nsw i32 4, %0
  %Nr = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  %1 = load i32, i32* %Nr, align 4
  %add = add nsw i32 %1, 1
  %mul2 = mul nsw i32 %mul, %add
  %conv = sext i32 %mul2 to i64
  %call = call i8* @_Znam(i64 %conv) #7
  call void @_ZN3AES12KeyExpansionEPhS0_(%class.AES* %this, i8* %key, i8* %call)
  %call3 = call i8* @_Znam(i64 32) #7
  %2 = bitcast i8* %call3 to i8**
  %Nb4 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %3 = load i32, i32* %Nb4, align 4
  %mul5 = mul nsw i32 4, %3
  %conv6 = sext i32 %mul5 to i64
  %call7 = call i8* @_Znam(i64 %conv6) #7
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 0
  store i8* %call7, i8** %arrayidx, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds i8*, i8** %2, i64 0
  %4 = load i8*, i8** %arrayidx8, align 8
  %Nb9 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %5 = load i32, i32* %Nb9, align 4
  %mul10 = mul nsw i32 %5, %i.0
  %idx.ext = sext i32 %mul10 to i64
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 %idx.ext
  %idxprom = sext i32 %i.0 to i64
  %arrayidx11 = getelementptr inbounds i8*, i8** %2, i64 %idxprom
  store i8* %add.ptr, i8** %arrayidx11, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc30, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc31, %for.inc30 ]
  %cmp13 = icmp slt i32 %i.1, 4
  br i1 %cmp13, label %for.body14, label %for.end32

for.body14:                                       ; preds = %for.cond12
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc27, %for.body14
  %j.0 = phi i32 [ 0, %for.body14 ], [ %inc28, %for.inc27 ]
  %Nb16 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %6 = load i32, i32* %Nb16, align 4
  %cmp17 = icmp slt i32 %j.0, %6
  br i1 %cmp17, label %for.body18, label %for.end29

for.body18:                                       ; preds = %for.cond15
  %mul19 = mul nsw i32 4, %j.0
  %add20 = add nsw i32 %i.1, %mul19
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds i8, i8* %in, i64 %idxprom21
  %7 = load i8, i8* %arrayidx22, align 1
  %idxprom23 = sext i32 %i.1 to i64
  %arrayidx24 = getelementptr inbounds i8*, i8** %2, i64 %idxprom23
  %8 = load i8*, i8** %arrayidx24, align 8
  %idxprom25 = sext i32 %j.0 to i64
  %arrayidx26 = getelementptr inbounds i8, i8* %8, i64 %idxprom25
  store i8 %7, i8* %arrayidx26, align 1
  br label %for.inc27

for.inc27:                                        ; preds = %for.body18
  %inc28 = add nsw i32 %j.0, 1
  br label %for.cond15

for.end29:                                        ; preds = %for.cond15
  br label %for.inc30

for.inc30:                                        ; preds = %for.end29
  %inc31 = add nsw i32 %i.1, 1
  br label %for.cond12

for.end32:                                        ; preds = %for.cond12
  %Nr33 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  %9 = load i32, i32* %Nr33, align 4
  %mul34 = mul nsw i32 %9, 4
  %Nb35 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %10 = load i32, i32* %Nb35, align 4
  %mul36 = mul nsw i32 %mul34, %10
  %idx.ext37 = sext i32 %mul36 to i64
  %add.ptr38 = getelementptr inbounds i8, i8* %call, i64 %idx.ext37
  call void @_ZN3AES11AddRoundKeyEPPhS0_(%class.AES* %this, i8** %2, i8* %add.ptr38)
  %Nr39 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  %11 = load i32, i32* %Nr39, align 4
  %sub = sub nsw i32 %11, 1
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc48, %for.end32
  %round.0 = phi i32 [ %sub, %for.end32 ], [ %dec, %for.inc48 ]
  %cmp41 = icmp sge i32 %round.0, 1
  br i1 %cmp41, label %for.body42, label %for.end49

for.body42:                                       ; preds = %for.cond40
  call void @_ZN3AES11InvSubBytesEPPh(%class.AES* %this, i8** %2)
  call void @_ZN3AES12InvShiftRowsEPPh(%class.AES* %this, i8** %2)
  %mul43 = mul nsw i32 %round.0, 4
  %Nb44 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %12 = load i32, i32* %Nb44, align 4
  %mul45 = mul nsw i32 %mul43, %12
  %idx.ext46 = sext i32 %mul45 to i64
  %add.ptr47 = getelementptr inbounds i8, i8* %call, i64 %idx.ext46
  call void @_ZN3AES11AddRoundKeyEPPhS0_(%class.AES* %this, i8** %2, i8* %add.ptr47)
  call void @_ZN3AES13InvMixColumnsEPPh(%class.AES* %this, i8** %2)
  br label %for.inc48

for.inc48:                                        ; preds = %for.body42
  %dec = add nsw i32 %round.0, -1
  br label %for.cond40

for.end49:                                        ; preds = %for.cond40
  call void @_ZN3AES11InvSubBytesEPPh(%class.AES* %this, i8** %2)
  call void @_ZN3AES12InvShiftRowsEPPh(%class.AES* %this, i8** %2)
  call void @_ZN3AES11AddRoundKeyEPPhS0_(%class.AES* %this, i8** %2, i8* %call)
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc68, %for.end49
  %i.2 = phi i32 [ 0, %for.end49 ], [ %inc69, %for.inc68 ]
  %cmp51 = icmp slt i32 %i.2, 4
  br i1 %cmp51, label %for.body52, label %for.end70

for.body52:                                       ; preds = %for.cond50
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc65, %for.body52
  %j.1 = phi i32 [ 0, %for.body52 ], [ %inc66, %for.inc65 ]
  %Nb54 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %13 = load i32, i32* %Nb54, align 4
  %cmp55 = icmp slt i32 %j.1, %13
  br i1 %cmp55, label %for.body56, label %for.end67

for.body56:                                       ; preds = %for.cond53
  %idxprom57 = sext i32 %i.2 to i64
  %arrayidx58 = getelementptr inbounds i8*, i8** %2, i64 %idxprom57
  %14 = load i8*, i8** %arrayidx58, align 8
  %idxprom59 = sext i32 %j.1 to i64
  %arrayidx60 = getelementptr inbounds i8, i8* %14, i64 %idxprom59
  %15 = load i8, i8* %arrayidx60, align 1
  %mul61 = mul nsw i32 4, %j.1
  %add62 = add nsw i32 %i.2, %mul61
  %idxprom63 = sext i32 %add62 to i64
  %arrayidx64 = getelementptr inbounds i8, i8* %out, i64 %idxprom63
  store i8 %15, i8* %arrayidx64, align 1
  br label %for.inc65

for.inc65:                                        ; preds = %for.body56
  %inc66 = add nsw i32 %j.1, 1
  br label %for.cond53

for.end67:                                        ; preds = %for.cond53
  br label %for.inc68

for.inc68:                                        ; preds = %for.end67
  %inc69 = add nsw i32 %i.2, 1
  br label %for.cond50

for.end70:                                        ; preds = %for.cond50
  %arrayidx71 = getelementptr inbounds i8*, i8** %2, i64 0
  %16 = load i8*, i8** %arrayidx71, align 8
  %isnull = icmp eq i8* %16, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %for.end70
  call void @_ZdaPv(i8* %16) #8
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %for.end70
  %isnull72 = icmp eq i8** %2, null
  br i1 %isnull72, label %delete.end74, label %delete.notnull73

delete.notnull73:                                 ; preds = %delete.end
  %17 = bitcast i8** %2 to i8*
  call void @_ZdaPv(i8* %17) #8
  br label %delete.end74

delete.end74:                                     ; preds = %delete.notnull73, %delete.end
  %isnull75 = icmp eq i8* %call, null
  br i1 %isnull75, label %delete.end77, label %delete.notnull76

delete.notnull76:                                 ; preds = %delete.end74
  call void @_ZdaPv(i8* %call) #8
  br label %delete.end77

delete.end77:                                     ; preds = %delete.notnull76, %delete.end74
  ret void
}

; Function Attrs: noinline ssp uwtable
define i8* @_ZN3AES10EncryptCBCEPhjS0_S0_Rj(%class.AES* %this, i8* %in, i32 %inLen, i8* %key, i8* %iv, i32* dereferenceable(4) %outLen) #0 align 2 {
entry:
  %call = call i32 @_ZN3AES16GetPaddingLengthEj(%class.AES* %this, i32 %inLen)
  store i32 %call, i32* %outLen, align 4
  %0 = load i32, i32* %outLen, align 4
  %call2 = call i8* @_ZN3AES12PaddingNullsEPhjj(%class.AES* %this, i8* %in, i32 %inLen, i32 %0)
  %1 = load i32, i32* %outLen, align 4
  %conv = zext i32 %1 to i64
  %call3 = call i8* @_Znam(i64 %conv) #7
  %blockBytesLen = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %2 = load i32, i32* %blockBytesLen, align 4
  %conv4 = zext i32 %2 to i64
  %call5 = call i8* @_Znam(i64 %conv4) #7
  %blockBytesLen6 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %3 = load i32, i32* %blockBytesLen6, align 4
  %conv7 = zext i32 %3 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call5, i8* align 1 %iv, i64 %conv7, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ]
  %4 = load i32, i32* %outLen, align 4
  %cmp = icmp ult i32 %i.0, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idx.ext = zext i32 %i.0 to i64
  %add.ptr = getelementptr inbounds i8, i8* %call2, i64 %idx.ext
  %blockBytesLen8 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %5 = load i32, i32* %blockBytesLen8, align 4
  call void @_ZN3AES9XorBlocksEPhS0_S0_j(%class.AES* %this, i8* %call5, i8* %add.ptr, i8* %call5, i32 %5)
  %idx.ext9 = zext i32 %i.0 to i64
  %add.ptr10 = getelementptr inbounds i8, i8* %call3, i64 %idx.ext9
  call void @_ZN3AES12EncryptBlockEPhS0_S0_(%class.AES* %this, i8* %call5, i8* %add.ptr10, i8* %key)
  %idx.ext11 = zext i32 %i.0 to i64
  %add.ptr12 = getelementptr inbounds i8, i8* %call3, i64 %idx.ext11
  %blockBytesLen13 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %6 = load i32, i32* %blockBytesLen13, align 4
  %conv14 = zext i32 %6 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call5, i8* align 1 %add.ptr12, i64 %conv14, i1 false)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %blockBytesLen15 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %7 = load i32, i32* %blockBytesLen15, align 4
  %add = add i32 %i.0, %7
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %isnull = icmp eq i8* %call5, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %for.end
  call void @_ZdaPv(i8* %call5) #8
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %for.end
  %isnull16 = icmp eq i8* %call2, null
  br i1 %isnull16, label %delete.end18, label %delete.notnull17

delete.notnull17:                                 ; preds = %delete.end
  call void @_ZdaPv(i8* %call2) #8
  br label %delete.end18

delete.end18:                                     ; preds = %delete.notnull17, %delete.end
  ret i8* %call3
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #4

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES9XorBlocksEPhS0_S0_j(%class.AES* %this, i8* %a, i8* %b, i8* %c, i32 %len) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, %len
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = zext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %a, i64 %idxprom
  %0 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %0 to i32
  %idxprom2 = zext i32 %i.0 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %b, i64 %idxprom2
  %1 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %1 to i32
  %xor = xor i32 %conv, %conv4
  %conv5 = trunc i32 %xor to i8
  %idxprom6 = zext i32 %i.0 to i64
  %arrayidx7 = getelementptr inbounds i8, i8* %c, i64 %idxprom6
  store i8 %conv5, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline ssp uwtable
define i8* @_ZN3AES10DecryptCBCEPhjS0_S0_(%class.AES* %this, i8* %in, i32 %inLen, i8* %key, i8* %iv) #0 align 2 {
entry:
  %conv = zext i32 %inLen to i64
  %call = call i8* @_Znam(i64 %conv) #7
  %blockBytesLen = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %0 = load i32, i32* %blockBytesLen, align 4
  %conv2 = zext i32 %0 to i64
  %call3 = call i8* @_Znam(i64 %conv2) #7
  %blockBytesLen4 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %1 = load i32, i32* %blockBytesLen4, align 4
  %conv5 = zext i32 %1 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call3, i8* align 1 %iv, i64 %conv5, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ]
  %cmp = icmp ult i32 %i.0, %inLen
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idx.ext = zext i32 %i.0 to i64
  %add.ptr = getelementptr inbounds i8, i8* %in, i64 %idx.ext
  %idx.ext6 = zext i32 %i.0 to i64
  %add.ptr7 = getelementptr inbounds i8, i8* %call, i64 %idx.ext6
  call void @_ZN3AES12DecryptBlockEPhS0_S0_(%class.AES* %this, i8* %add.ptr, i8* %add.ptr7, i8* %key)
  %idx.ext8 = zext i32 %i.0 to i64
  %add.ptr9 = getelementptr inbounds i8, i8* %call, i64 %idx.ext8
  %idx.ext10 = zext i32 %i.0 to i64
  %add.ptr11 = getelementptr inbounds i8, i8* %call, i64 %idx.ext10
  %blockBytesLen12 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %2 = load i32, i32* %blockBytesLen12, align 4
  call void @_ZN3AES9XorBlocksEPhS0_S0_j(%class.AES* %this, i8* %call3, i8* %add.ptr9, i8* %add.ptr11, i32 %2)
  %idx.ext13 = zext i32 %i.0 to i64
  %add.ptr14 = getelementptr inbounds i8, i8* %in, i64 %idx.ext13
  %blockBytesLen15 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %3 = load i32, i32* %blockBytesLen15, align 4
  %conv16 = zext i32 %3 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call3, i8* align 1 %add.ptr14, i64 %conv16, i1 false)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %blockBytesLen17 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %4 = load i32, i32* %blockBytesLen17, align 4
  %add = add i32 %i.0, %4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %isnull = icmp eq i8* %call3, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %for.end
  call void @_ZdaPv(i8* %call3) #8
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %for.end
  ret i8* %call
}

; Function Attrs: noinline ssp uwtable
define i8* @_ZN3AES10EncryptCFBEPhjS0_S0_Rj(%class.AES* %this, i8* %in, i32 %inLen, i8* %key, i8* %iv, i32* dereferenceable(4) %outLen) #0 align 2 {
entry:
  %call = call i32 @_ZN3AES16GetPaddingLengthEj(%class.AES* %this, i32 %inLen)
  store i32 %call, i32* %outLen, align 4
  %0 = load i32, i32* %outLen, align 4
  %call2 = call i8* @_ZN3AES12PaddingNullsEPhjj(%class.AES* %this, i8* %in, i32 %inLen, i32 %0)
  %1 = load i32, i32* %outLen, align 4
  %conv = zext i32 %1 to i64
  %call3 = call i8* @_Znam(i64 %conv) #7
  %blockBytesLen = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %2 = load i32, i32* %blockBytesLen, align 4
  %conv4 = zext i32 %2 to i64
  %call5 = call i8* @_Znam(i64 %conv4) #7
  %blockBytesLen6 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %3 = load i32, i32* %blockBytesLen6, align 4
  %conv7 = zext i32 %3 to i64
  %call8 = call i8* @_Znam(i64 %conv7) #7
  %blockBytesLen9 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %4 = load i32, i32* %blockBytesLen9, align 4
  %conv10 = zext i32 %4 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call5, i8* align 1 %iv, i64 %conv10, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ]
  %5 = load i32, i32* %outLen, align 4
  %cmp = icmp ult i32 %i.0, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @_ZN3AES12EncryptBlockEPhS0_S0_(%class.AES* %this, i8* %call5, i8* %call8, i8* %key)
  %idx.ext = zext i32 %i.0 to i64
  %add.ptr = getelementptr inbounds i8, i8* %call2, i64 %idx.ext
  %idx.ext11 = zext i32 %i.0 to i64
  %add.ptr12 = getelementptr inbounds i8, i8* %call3, i64 %idx.ext11
  %blockBytesLen13 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %6 = load i32, i32* %blockBytesLen13, align 4
  call void @_ZN3AES9XorBlocksEPhS0_S0_j(%class.AES* %this, i8* %add.ptr, i8* %call8, i8* %add.ptr12, i32 %6)
  %idx.ext14 = zext i32 %i.0 to i64
  %add.ptr15 = getelementptr inbounds i8, i8* %call3, i64 %idx.ext14
  %blockBytesLen16 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %7 = load i32, i32* %blockBytesLen16, align 4
  %conv17 = zext i32 %7 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call5, i8* align 1 %add.ptr15, i64 %conv17, i1 false)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %blockBytesLen18 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %8 = load i32, i32* %blockBytesLen18, align 4
  %add = add i32 %i.0, %8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %isnull = icmp eq i8* %call5, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %for.end
  call void @_ZdaPv(i8* %call5) #8
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %for.end
  %isnull19 = icmp eq i8* %call8, null
  br i1 %isnull19, label %delete.end21, label %delete.notnull20

delete.notnull20:                                 ; preds = %delete.end
  call void @_ZdaPv(i8* %call8) #8
  br label %delete.end21

delete.end21:                                     ; preds = %delete.notnull20, %delete.end
  %isnull22 = icmp eq i8* %call2, null
  br i1 %isnull22, label %delete.end24, label %delete.notnull23

delete.notnull23:                                 ; preds = %delete.end21
  call void @_ZdaPv(i8* %call2) #8
  br label %delete.end24

delete.end24:                                     ; preds = %delete.notnull23, %delete.end21
  ret i8* %call3
}

; Function Attrs: noinline ssp uwtable
define i8* @_ZN3AES10DecryptCFBEPhjS0_S0_(%class.AES* %this, i8* %in, i32 %inLen, i8* %key, i8* %iv) #0 align 2 {
entry:
  %conv = zext i32 %inLen to i64
  %call = call i8* @_Znam(i64 %conv) #7
  %blockBytesLen = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %0 = load i32, i32* %blockBytesLen, align 4
  %conv2 = zext i32 %0 to i64
  %call3 = call i8* @_Znam(i64 %conv2) #7
  %blockBytesLen4 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %1 = load i32, i32* %blockBytesLen4, align 4
  %conv5 = zext i32 %1 to i64
  %call6 = call i8* @_Znam(i64 %conv5) #7
  %blockBytesLen7 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %2 = load i32, i32* %blockBytesLen7, align 4
  %conv8 = zext i32 %2 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call3, i8* align 1 %iv, i64 %conv8, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ]
  %cmp = icmp ult i32 %i.0, %inLen
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @_ZN3AES12EncryptBlockEPhS0_S0_(%class.AES* %this, i8* %call3, i8* %call6, i8* %key)
  %idx.ext = zext i32 %i.0 to i64
  %add.ptr = getelementptr inbounds i8, i8* %in, i64 %idx.ext
  %idx.ext9 = zext i32 %i.0 to i64
  %add.ptr10 = getelementptr inbounds i8, i8* %call, i64 %idx.ext9
  %blockBytesLen11 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %3 = load i32, i32* %blockBytesLen11, align 4
  call void @_ZN3AES9XorBlocksEPhS0_S0_j(%class.AES* %this, i8* %add.ptr, i8* %call6, i8* %add.ptr10, i32 %3)
  %idx.ext12 = zext i32 %i.0 to i64
  %add.ptr13 = getelementptr inbounds i8, i8* %in, i64 %idx.ext12
  %blockBytesLen14 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %4 = load i32, i32* %blockBytesLen14, align 4
  %conv15 = zext i32 %4 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call3, i8* align 1 %add.ptr13, i64 %conv15, i1 false)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %blockBytesLen16 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 3
  %5 = load i32, i32* %blockBytesLen16, align 4
  %add = add i32 %i.0, %5
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %isnull = icmp eq i8* %call3, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %for.end
  call void @_ZdaPv(i8* %call3) #8
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %for.end
  %isnull17 = icmp eq i8* %call6, null
  br i1 %isnull17, label %delete.end19, label %delete.notnull18

delete.notnull18:                                 ; preds = %delete.end
  call void @_ZdaPv(i8* %call6) #8
  br label %delete.end19

delete.end19:                                     ; preds = %delete.notnull18, %delete.end
  ret i8* %call
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #4

; Function Attrs: noinline ssp uwtable
define void @_ZN3AES12KeyExpansionEPhS0_(%class.AES* %this, i8* %key, i8* %w) #0 align 2 {
entry:
  %call = call i8* @_Znam(i64 4) #7
  %call2 = call i8* @_Znam(i64 4) #7
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %while.body ]
  %Nk = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %0 = load i32, i32* %Nk, align 4
  %mul = mul nsw i32 4, %0
  %cmp = icmp slt i32 %i.0, %mul
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %key, i64 %idxprom
  %1 = load i8, i8* %arrayidx, align 1
  %idxprom3 = sext i32 %i.0 to i64
  %arrayidx4 = getelementptr inbounds i8, i8* %w, i64 %idxprom3
  store i8 %1, i8* %arrayidx4, align 1
  %inc = add nsw i32 %i.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %Nk5 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %2 = load i32, i32* %Nk5, align 4
  %mul6 = mul nsw i32 4, %2
  br label %while.cond7

while.cond7:                                      ; preds = %if.end43, %while.end
  %i.1 = phi i32 [ %mul6, %while.end ], [ %add97, %if.end43 ]
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %3 = load i32, i32* %Nb, align 4
  %mul8 = mul nsw i32 4, %3
  %Nr = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 2
  %4 = load i32, i32* %Nr, align 4
  %add = add nsw i32 %4, 1
  %mul9 = mul nsw i32 %mul8, %add
  %cmp10 = icmp slt i32 %i.1, %mul9
  br i1 %cmp10, label %while.body11, label %while.end98

while.body11:                                     ; preds = %while.cond7
  %sub = sub nsw i32 %i.1, 4
  %add12 = add nsw i32 %sub, 0
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds i8, i8* %w, i64 %idxprom13
  %5 = load i8, i8* %arrayidx14, align 1
  %arrayidx15 = getelementptr inbounds i8, i8* %call, i64 0
  store i8 %5, i8* %arrayidx15, align 1
  %sub16 = sub nsw i32 %i.1, 4
  %add17 = add nsw i32 %sub16, 1
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds i8, i8* %w, i64 %idxprom18
  %6 = load i8, i8* %arrayidx19, align 1
  %arrayidx20 = getelementptr inbounds i8, i8* %call, i64 1
  store i8 %6, i8* %arrayidx20, align 1
  %sub21 = sub nsw i32 %i.1, 4
  %add22 = add nsw i32 %sub21, 2
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds i8, i8* %w, i64 %idxprom23
  %7 = load i8, i8* %arrayidx24, align 1
  %arrayidx25 = getelementptr inbounds i8, i8* %call, i64 2
  store i8 %7, i8* %arrayidx25, align 1
  %sub26 = sub nsw i32 %i.1, 4
  %add27 = add nsw i32 %sub26, 3
  %idxprom28 = sext i32 %add27 to i64
  %arrayidx29 = getelementptr inbounds i8, i8* %w, i64 %idxprom28
  %8 = load i8, i8* %arrayidx29, align 1
  %arrayidx30 = getelementptr inbounds i8, i8* %call, i64 3
  store i8 %8, i8* %arrayidx30, align 1
  %div = sdiv i32 %i.1, 4
  %Nk31 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %9 = load i32, i32* %Nk31, align 4
  %rem = srem i32 %div, %9
  %cmp32 = icmp eq i32 %rem, 0
  br i1 %cmp32, label %if.then, label %if.else

if.then:                                          ; preds = %while.body11
  call void @_ZN3AES7RotWordEPh(%class.AES* %this, i8* %call)
  call void @_ZN3AES7SubWordEPh(%class.AES* %this, i8* %call)
  %Nk33 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %10 = load i32, i32* %Nk33, align 4
  %mul34 = mul nsw i32 %10, 4
  %div35 = sdiv i32 %i.1, %mul34
  call void @_ZN3AES4RconEPhi(%class.AES* %this, i8* %call2, i32 %div35)
  call void @_ZN3AES8XorWordsEPhS0_S0_(%class.AES* %this, i8* %call, i8* %call2, i8* %call)
  br label %if.end43

if.else:                                          ; preds = %while.body11
  %Nk36 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %11 = load i32, i32* %Nk36, align 4
  %cmp37 = icmp sgt i32 %11, 6
  br i1 %cmp37, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.else
  %div38 = sdiv i32 %i.1, 4
  %Nk39 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %12 = load i32, i32* %Nk39, align 4
  %rem40 = srem i32 %div38, %12
  %cmp41 = icmp eq i32 %rem40, 4
  br i1 %cmp41, label %if.then42, label %if.end

if.then42:                                        ; preds = %land.lhs.true
  call void @_ZN3AES7SubWordEPh(%class.AES* %this, i8* %call)
  br label %if.end

if.end:                                           ; preds = %if.then42, %land.lhs.true, %if.else
  br label %if.end43

if.end43:                                         ; preds = %if.end, %if.then
  %Nk44 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %13 = load i32, i32* %Nk44, align 4
  %mul45 = mul nsw i32 4, %13
  %sub46 = sub nsw i32 %i.1, %mul45
  %idxprom47 = sext i32 %sub46 to i64
  %arrayidx48 = getelementptr inbounds i8, i8* %w, i64 %idxprom47
  %14 = load i8, i8* %arrayidx48, align 1
  %conv = zext i8 %14 to i32
  %arrayidx49 = getelementptr inbounds i8, i8* %call, i64 0
  %15 = load i8, i8* %arrayidx49, align 1
  %conv50 = zext i8 %15 to i32
  %xor = xor i32 %conv, %conv50
  %conv51 = trunc i32 %xor to i8
  %add52 = add nsw i32 %i.1, 0
  %idxprom53 = sext i32 %add52 to i64
  %arrayidx54 = getelementptr inbounds i8, i8* %w, i64 %idxprom53
  store i8 %conv51, i8* %arrayidx54, align 1
  %add55 = add nsw i32 %i.1, 1
  %Nk56 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %16 = load i32, i32* %Nk56, align 4
  %mul57 = mul nsw i32 4, %16
  %sub58 = sub nsw i32 %add55, %mul57
  %idxprom59 = sext i32 %sub58 to i64
  %arrayidx60 = getelementptr inbounds i8, i8* %w, i64 %idxprom59
  %17 = load i8, i8* %arrayidx60, align 1
  %conv61 = zext i8 %17 to i32
  %arrayidx62 = getelementptr inbounds i8, i8* %call, i64 1
  %18 = load i8, i8* %arrayidx62, align 1
  %conv63 = zext i8 %18 to i32
  %xor64 = xor i32 %conv61, %conv63
  %conv65 = trunc i32 %xor64 to i8
  %add66 = add nsw i32 %i.1, 1
  %idxprom67 = sext i32 %add66 to i64
  %arrayidx68 = getelementptr inbounds i8, i8* %w, i64 %idxprom67
  store i8 %conv65, i8* %arrayidx68, align 1
  %add69 = add nsw i32 %i.1, 2
  %Nk70 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %19 = load i32, i32* %Nk70, align 4
  %mul71 = mul nsw i32 4, %19
  %sub72 = sub nsw i32 %add69, %mul71
  %idxprom73 = sext i32 %sub72 to i64
  %arrayidx74 = getelementptr inbounds i8, i8* %w, i64 %idxprom73
  %20 = load i8, i8* %arrayidx74, align 1
  %conv75 = zext i8 %20 to i32
  %arrayidx76 = getelementptr inbounds i8, i8* %call, i64 2
  %21 = load i8, i8* %arrayidx76, align 1
  %conv77 = zext i8 %21 to i32
  %xor78 = xor i32 %conv75, %conv77
  %conv79 = trunc i32 %xor78 to i8
  %add80 = add nsw i32 %i.1, 2
  %idxprom81 = sext i32 %add80 to i64
  %arrayidx82 = getelementptr inbounds i8, i8* %w, i64 %idxprom81
  store i8 %conv79, i8* %arrayidx82, align 1
  %add83 = add nsw i32 %i.1, 3
  %Nk84 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 1
  %22 = load i32, i32* %Nk84, align 4
  %mul85 = mul nsw i32 4, %22
  %sub86 = sub nsw i32 %add83, %mul85
  %idxprom87 = sext i32 %sub86 to i64
  %arrayidx88 = getelementptr inbounds i8, i8* %w, i64 %idxprom87
  %23 = load i8, i8* %arrayidx88, align 1
  %conv89 = zext i8 %23 to i32
  %arrayidx90 = getelementptr inbounds i8, i8* %call, i64 3
  %24 = load i8, i8* %arrayidx90, align 1
  %conv91 = zext i8 %24 to i32
  %xor92 = xor i32 %conv89, %conv91
  %conv93 = trunc i32 %xor92 to i8
  %add94 = add nsw i32 %i.1, 3
  %idxprom95 = sext i32 %add94 to i64
  %arrayidx96 = getelementptr inbounds i8, i8* %w, i64 %idxprom95
  store i8 %conv93, i8* %arrayidx96, align 1
  %add97 = add nsw i32 %i.1, 4
  br label %while.cond7

while.end98:                                      ; preds = %while.cond7
  %isnull = icmp eq i8* %call2, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %while.end98
  call void @_ZdaPv(i8* %call2) #8
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %while.end98
  %isnull99 = icmp eq i8* %call, null
  br i1 %isnull99, label %delete.end101, label %delete.notnull100

delete.notnull100:                                ; preds = %delete.end
  call void @_ZdaPv(i8* %call) #8
  br label %delete.end101

delete.end101:                                    ; preds = %delete.notnull100, %delete.end
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES11AddRoundKeyEPPhS0_(%class.AES* %this, i8** %state, i8* %key) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ]
  %cmp = icmp slt i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %0 = load i32, i32* %Nb, align 4
  %cmp3 = icmp slt i32 %j.0, %0
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %state, i64 %idxprom
  %1 = load i8*, i8** %arrayidx, align 8
  %idxprom5 = sext i32 %j.0 to i64
  %arrayidx6 = getelementptr inbounds i8, i8* %1, i64 %idxprom5
  %2 = load i8, i8* %arrayidx6, align 1
  %conv = zext i8 %2 to i32
  %mul = mul nsw i32 4, %j.0
  %add = add nsw i32 %i.0, %mul
  %idxprom7 = sext i32 %add to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %key, i64 %idxprom7
  %3 = load i8, i8* %arrayidx8, align 1
  %conv9 = zext i8 %3 to i32
  %xor = xor i32 %conv, %conv9
  %conv10 = trunc i32 %xor to i8
  %idxprom11 = sext i32 %i.0 to i64
  %arrayidx12 = getelementptr inbounds i8*, i8** %state, i64 %idxprom11
  %4 = load i8*, i8** %arrayidx12, align 8
  %idxprom13 = sext i32 %j.0 to i64
  %arrayidx14 = getelementptr inbounds i8, i8* %4, i64 %idxprom13
  store i8 %conv10, i8* %arrayidx14, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %j.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %inc16 = add nsw i32 %i.0, 1
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES8SubBytesEPPh(%class.AES* %this, i8** %state) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc16, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc17, %for.inc16 ]
  %cmp = icmp slt i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end18

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %0 = load i32, i32* %Nb, align 4
  %cmp3 = icmp slt i32 %j.0, %0
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %state, i64 %idxprom
  %1 = load i8*, i8** %arrayidx, align 8
  %idxprom5 = sext i32 %j.0 to i64
  %arrayidx6 = getelementptr inbounds i8, i8* %1, i64 %idxprom5
  %2 = load i8, i8* %arrayidx6, align 1
  %conv = zext i8 %2 to i32
  %div = sdiv i32 %conv, 16
  %idxprom7 = sext i32 %div to i64
  %arrayidx8 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @_ZL4sbox, i64 0, i64 %idxprom7
  %conv9 = zext i8 %2 to i32
  %rem = srem i32 %conv9, 16
  %idxprom10 = sext i32 %rem to i64
  %arrayidx11 = getelementptr inbounds [16 x i8], [16 x i8]* %arrayidx8, i64 0, i64 %idxprom10
  %3 = load i8, i8* %arrayidx11, align 1
  %idxprom12 = sext i32 %i.0 to i64
  %arrayidx13 = getelementptr inbounds i8*, i8** %state, i64 %idxprom12
  %4 = load i8*, i8** %arrayidx13, align 8
  %idxprom14 = sext i32 %j.0 to i64
  %arrayidx15 = getelementptr inbounds i8, i8* %4, i64 %idxprom14
  store i8 %3, i8* %arrayidx15, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %j.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %inc17 = add nsw i32 %i.0, 1
  br label %for.cond

for.end18:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES9ShiftRowsEPPh(%class.AES* %this, i8** %state) #1 align 2 {
entry:
  call void @_ZN3AES8ShiftRowEPPhii(%class.AES* %this, i8** %state, i32 1, i32 1)
  call void @_ZN3AES8ShiftRowEPPhii(%class.AES* %this, i8** %state, i32 2, i32 2)
  call void @_ZN3AES8ShiftRowEPPhii(%class.AES* %this, i8** %state, i32 3, i32 3)
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES10MixColumnsEPPh(%class.AES* %this, i8** %state) #1 align 2 {
entry:
  %s = alloca [4 x i8], align 1
  %s1 = alloca [4 x i8], align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc78, %entry
  %j.0 = phi i32 [ 0, %entry ], [ %inc79, %for.inc78 ]
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %0 = load i32, i32* %Nb, align 4
  %cmp = icmp slt i32 %j.0, %0
  br i1 %cmp, label %for.body, label %for.end80

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp3 = icmp slt i32 %i.0, 4
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %state, i64 %idxprom
  %1 = load i8*, i8** %arrayidx, align 8
  %idxprom5 = sext i32 %j.0 to i64
  %arrayidx6 = getelementptr inbounds i8, i8* %1, i64 %idxprom5
  %2 = load i8, i8* %arrayidx6, align 1
  %idxprom7 = sext i32 %i.0 to i64
  %arrayidx8 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 %idxprom7
  store i8 %2, i8* %arrayidx8, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %i.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %arrayidx9 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 0
  %3 = load i8, i8* %arrayidx9, align 1
  %call = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 2, i8 zeroext %3)
  %conv = zext i8 %call to i32
  %arrayidx10 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 1
  %4 = load i8, i8* %arrayidx10, align 1
  %call11 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 3, i8 zeroext %4)
  %conv12 = zext i8 %call11 to i32
  %xor = xor i32 %conv, %conv12
  %arrayidx13 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 2
  %5 = load i8, i8* %arrayidx13, align 1
  %conv14 = zext i8 %5 to i32
  %xor15 = xor i32 %xor, %conv14
  %arrayidx16 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 3
  %6 = load i8, i8* %arrayidx16, align 1
  %conv17 = zext i8 %6 to i32
  %xor18 = xor i32 %xor15, %conv17
  %conv19 = trunc i32 %xor18 to i8
  %arrayidx20 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 0
  store i8 %conv19, i8* %arrayidx20, align 1
  %arrayidx21 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 0
  %7 = load i8, i8* %arrayidx21, align 1
  %conv22 = zext i8 %7 to i32
  %arrayidx23 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 1
  %8 = load i8, i8* %arrayidx23, align 1
  %call24 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 2, i8 zeroext %8)
  %conv25 = zext i8 %call24 to i32
  %xor26 = xor i32 %conv22, %conv25
  %arrayidx27 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 2
  %9 = load i8, i8* %arrayidx27, align 1
  %call28 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 3, i8 zeroext %9)
  %conv29 = zext i8 %call28 to i32
  %xor30 = xor i32 %xor26, %conv29
  %arrayidx31 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 3
  %10 = load i8, i8* %arrayidx31, align 1
  %conv32 = zext i8 %10 to i32
  %xor33 = xor i32 %xor30, %conv32
  %conv34 = trunc i32 %xor33 to i8
  %arrayidx35 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 1
  store i8 %conv34, i8* %arrayidx35, align 1
  %arrayidx36 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 0
  %11 = load i8, i8* %arrayidx36, align 1
  %conv37 = zext i8 %11 to i32
  %arrayidx38 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 1
  %12 = load i8, i8* %arrayidx38, align 1
  %conv39 = zext i8 %12 to i32
  %xor40 = xor i32 %conv37, %conv39
  %arrayidx41 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 2
  %13 = load i8, i8* %arrayidx41, align 1
  %call42 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 2, i8 zeroext %13)
  %conv43 = zext i8 %call42 to i32
  %xor44 = xor i32 %xor40, %conv43
  %arrayidx45 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 3
  %14 = load i8, i8* %arrayidx45, align 1
  %call46 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 3, i8 zeroext %14)
  %conv47 = zext i8 %call46 to i32
  %xor48 = xor i32 %xor44, %conv47
  %conv49 = trunc i32 %xor48 to i8
  %arrayidx50 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 2
  store i8 %conv49, i8* %arrayidx50, align 1
  %arrayidx51 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 0
  %15 = load i8, i8* %arrayidx51, align 1
  %call52 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 3, i8 zeroext %15)
  %conv53 = zext i8 %call52 to i32
  %arrayidx54 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 1
  %16 = load i8, i8* %arrayidx54, align 1
  %conv55 = zext i8 %16 to i32
  %xor56 = xor i32 %conv53, %conv55
  %arrayidx57 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 2
  %17 = load i8, i8* %arrayidx57, align 1
  %conv58 = zext i8 %17 to i32
  %xor59 = xor i32 %xor56, %conv58
  %arrayidx60 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 3
  %18 = load i8, i8* %arrayidx60, align 1
  %call61 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 2, i8 zeroext %18)
  %conv62 = zext i8 %call61 to i32
  %xor63 = xor i32 %xor59, %conv62
  %conv64 = trunc i32 %xor63 to i8
  %arrayidx65 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 3
  store i8 %conv64, i8* %arrayidx65, align 1
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc75, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc76, %for.inc75 ]
  %cmp67 = icmp slt i32 %i.1, 4
  br i1 %cmp67, label %for.body68, label %for.end77

for.body68:                                       ; preds = %for.cond66
  %idxprom69 = sext i32 %i.1 to i64
  %arrayidx70 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 %idxprom69
  %19 = load i8, i8* %arrayidx70, align 1
  %idxprom71 = sext i32 %i.1 to i64
  %arrayidx72 = getelementptr inbounds i8*, i8** %state, i64 %idxprom71
  %20 = load i8*, i8** %arrayidx72, align 8
  %idxprom73 = sext i32 %j.0 to i64
  %arrayidx74 = getelementptr inbounds i8, i8* %20, i64 %idxprom73
  store i8 %19, i8* %arrayidx74, align 1
  br label %for.inc75

for.inc75:                                        ; preds = %for.body68
  %inc76 = add nsw i32 %i.1, 1
  br label %for.cond66

for.end77:                                        ; preds = %for.cond66
  br label %for.inc78

for.inc78:                                        ; preds = %for.end77
  %inc79 = add nsw i32 %j.0, 1
  br label %for.cond

for.end80:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES11InvSubBytesEPPh(%class.AES* %this, i8** %state) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc16, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc17, %for.inc16 ]
  %cmp = icmp slt i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end18

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %0 = load i32, i32* %Nb, align 4
  %cmp3 = icmp slt i32 %j.0, %0
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %state, i64 %idxprom
  %1 = load i8*, i8** %arrayidx, align 8
  %idxprom5 = sext i32 %j.0 to i64
  %arrayidx6 = getelementptr inbounds i8, i8* %1, i64 %idxprom5
  %2 = load i8, i8* %arrayidx6, align 1
  %conv = zext i8 %2 to i32
  %div = sdiv i32 %conv, 16
  %idxprom7 = sext i32 %div to i64
  %arrayidx8 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @_ZL8inv_sbox, i64 0, i64 %idxprom7
  %conv9 = zext i8 %2 to i32
  %rem = srem i32 %conv9, 16
  %idxprom10 = sext i32 %rem to i64
  %arrayidx11 = getelementptr inbounds [16 x i8], [16 x i8]* %arrayidx8, i64 0, i64 %idxprom10
  %3 = load i8, i8* %arrayidx11, align 1
  %idxprom12 = sext i32 %i.0 to i64
  %arrayidx13 = getelementptr inbounds i8*, i8** %state, i64 %idxprom12
  %4 = load i8*, i8** %arrayidx13, align 8
  %idxprom14 = sext i32 %j.0 to i64
  %arrayidx15 = getelementptr inbounds i8, i8* %4, i64 %idxprom14
  store i8 %3, i8* %arrayidx15, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %j.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %inc17 = add nsw i32 %i.0, 1
  br label %for.cond

for.end18:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES12InvShiftRowsEPPh(%class.AES* %this, i8** %state) #1 align 2 {
entry:
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %0 = load i32, i32* %Nb, align 4
  %sub = sub nsw i32 %0, 1
  call void @_ZN3AES8ShiftRowEPPhii(%class.AES* %this, i8** %state, i32 1, i32 %sub)
  %Nb2 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %1 = load i32, i32* %Nb2, align 4
  %sub3 = sub nsw i32 %1, 2
  call void @_ZN3AES8ShiftRowEPPhii(%class.AES* %this, i8** %state, i32 2, i32 %sub3)
  %Nb4 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %2 = load i32, i32* %Nb4, align 4
  %sub5 = sub nsw i32 %2, 3
  call void @_ZN3AES8ShiftRowEPPhii(%class.AES* %this, i8** %state, i32 3, i32 %sub5)
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES13InvMixColumnsEPPh(%class.AES* %this, i8** %state) #1 align 2 {
entry:
  %s = alloca [4 x i8], align 1
  %s1 = alloca [4 x i8], align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc86, %entry
  %j.0 = phi i32 [ 0, %entry ], [ %inc87, %for.inc86 ]
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %0 = load i32, i32* %Nb, align 4
  %cmp = icmp slt i32 %j.0, %0
  br i1 %cmp, label %for.body, label %for.end88

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp3 = icmp slt i32 %i.0, 4
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %state, i64 %idxprom
  %1 = load i8*, i8** %arrayidx, align 8
  %idxprom5 = sext i32 %j.0 to i64
  %arrayidx6 = getelementptr inbounds i8, i8* %1, i64 %idxprom5
  %2 = load i8, i8* %arrayidx6, align 1
  %idxprom7 = sext i32 %i.0 to i64
  %arrayidx8 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 %idxprom7
  store i8 %2, i8* %arrayidx8, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %inc = add nsw i32 %i.0, 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %arrayidx9 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 0
  %3 = load i8, i8* %arrayidx9, align 1
  %call = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 14, i8 zeroext %3)
  %conv = zext i8 %call to i32
  %arrayidx10 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 1
  %4 = load i8, i8* %arrayidx10, align 1
  %call11 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 11, i8 zeroext %4)
  %conv12 = zext i8 %call11 to i32
  %xor = xor i32 %conv, %conv12
  %arrayidx13 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 2
  %5 = load i8, i8* %arrayidx13, align 1
  %call14 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 13, i8 zeroext %5)
  %conv15 = zext i8 %call14 to i32
  %xor16 = xor i32 %xor, %conv15
  %arrayidx17 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 3
  %6 = load i8, i8* %arrayidx17, align 1
  %call18 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 9, i8 zeroext %6)
  %conv19 = zext i8 %call18 to i32
  %xor20 = xor i32 %xor16, %conv19
  %conv21 = trunc i32 %xor20 to i8
  %arrayidx22 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 0
  store i8 %conv21, i8* %arrayidx22, align 1
  %arrayidx23 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 0
  %7 = load i8, i8* %arrayidx23, align 1
  %call24 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 9, i8 zeroext %7)
  %conv25 = zext i8 %call24 to i32
  %arrayidx26 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 1
  %8 = load i8, i8* %arrayidx26, align 1
  %call27 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 14, i8 zeroext %8)
  %conv28 = zext i8 %call27 to i32
  %xor29 = xor i32 %conv25, %conv28
  %arrayidx30 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 2
  %9 = load i8, i8* %arrayidx30, align 1
  %call31 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 11, i8 zeroext %9)
  %conv32 = zext i8 %call31 to i32
  %xor33 = xor i32 %xor29, %conv32
  %arrayidx34 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 3
  %10 = load i8, i8* %arrayidx34, align 1
  %call35 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 13, i8 zeroext %10)
  %conv36 = zext i8 %call35 to i32
  %xor37 = xor i32 %xor33, %conv36
  %conv38 = trunc i32 %xor37 to i8
  %arrayidx39 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 1
  store i8 %conv38, i8* %arrayidx39, align 1
  %arrayidx40 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 0
  %11 = load i8, i8* %arrayidx40, align 1
  %call41 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 13, i8 zeroext %11)
  %conv42 = zext i8 %call41 to i32
  %arrayidx43 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 1
  %12 = load i8, i8* %arrayidx43, align 1
  %call44 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 9, i8 zeroext %12)
  %conv45 = zext i8 %call44 to i32
  %xor46 = xor i32 %conv42, %conv45
  %arrayidx47 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 2
  %13 = load i8, i8* %arrayidx47, align 1
  %call48 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 14, i8 zeroext %13)
  %conv49 = zext i8 %call48 to i32
  %xor50 = xor i32 %xor46, %conv49
  %arrayidx51 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 3
  %14 = load i8, i8* %arrayidx51, align 1
  %call52 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 11, i8 zeroext %14)
  %conv53 = zext i8 %call52 to i32
  %xor54 = xor i32 %xor50, %conv53
  %conv55 = trunc i32 %xor54 to i8
  %arrayidx56 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 2
  store i8 %conv55, i8* %arrayidx56, align 1
  %arrayidx57 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 0
  %15 = load i8, i8* %arrayidx57, align 1
  %call58 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 11, i8 zeroext %15)
  %conv59 = zext i8 %call58 to i32
  %arrayidx60 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 1
  %16 = load i8, i8* %arrayidx60, align 1
  %call61 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 13, i8 zeroext %16)
  %conv62 = zext i8 %call61 to i32
  %xor63 = xor i32 %conv59, %conv62
  %arrayidx64 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 2
  %17 = load i8, i8* %arrayidx64, align 1
  %call65 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 9, i8 zeroext %17)
  %conv66 = zext i8 %call65 to i32
  %xor67 = xor i32 %xor63, %conv66
  %arrayidx68 = getelementptr inbounds [4 x i8], [4 x i8]* %s, i64 0, i64 3
  %18 = load i8, i8* %arrayidx68, align 1
  %call69 = call zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext 14, i8 zeroext %18)
  %conv70 = zext i8 %call69 to i32
  %xor71 = xor i32 %xor67, %conv70
  %conv72 = trunc i32 %xor71 to i8
  %arrayidx73 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 3
  store i8 %conv72, i8* %arrayidx73, align 1
  br label %for.cond74

for.cond74:                                       ; preds = %for.inc83, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc84, %for.inc83 ]
  %cmp75 = icmp slt i32 %i.1, 4
  br i1 %cmp75, label %for.body76, label %for.end85

for.body76:                                       ; preds = %for.cond74
  %idxprom77 = sext i32 %i.1 to i64
  %arrayidx78 = getelementptr inbounds [4 x i8], [4 x i8]* %s1, i64 0, i64 %idxprom77
  %19 = load i8, i8* %arrayidx78, align 1
  %idxprom79 = sext i32 %i.1 to i64
  %arrayidx80 = getelementptr inbounds i8*, i8** %state, i64 %idxprom79
  %20 = load i8*, i8** %arrayidx80, align 8
  %idxprom81 = sext i32 %j.0 to i64
  %arrayidx82 = getelementptr inbounds i8, i8* %20, i64 %idxprom81
  store i8 %19, i8* %arrayidx82, align 1
  br label %for.inc83

for.inc83:                                        ; preds = %for.body76
  %inc84 = add nsw i32 %i.1, 1
  br label %for.cond74

for.end85:                                        ; preds = %for.cond74
  br label %for.inc86

for.inc86:                                        ; preds = %for.end85
  %inc87 = add nsw i32 %j.0, 1
  br label %for.cond

for.end88:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES8ShiftRowEPPhii(%class.AES* %this, i8** %state, i32 %i, i32 %n) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc20, %entry
  %k.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ]
  %cmp = icmp slt i32 %k.0, %n
  br i1 %cmp, label %for.body, label %for.end22

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i to i64
  %arrayidx = getelementptr inbounds i8*, i8** %state, i64 %idxprom
  %0 = load i8*, i8** %arrayidx, align 8
  %arrayidx2 = getelementptr inbounds i8, i8* %0, i64 0
  %1 = load i8, i8* %arrayidx2, align 1
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %Nb = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %2 = load i32, i32* %Nb, align 4
  %sub = sub nsw i32 %2, 1
  %cmp4 = icmp slt i32 %j.0, %sub
  br i1 %cmp4, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond3
  %idxprom6 = sext i32 %i to i64
  %arrayidx7 = getelementptr inbounds i8*, i8** %state, i64 %idxprom6
  %3 = load i8*, i8** %arrayidx7, align 8
  %add = add nsw i32 %j.0, 1
  %idxprom8 = sext i32 %add to i64
  %arrayidx9 = getelementptr inbounds i8, i8* %3, i64 %idxprom8
  %4 = load i8, i8* %arrayidx9, align 1
  %idxprom10 = sext i32 %i to i64
  %arrayidx11 = getelementptr inbounds i8*, i8** %state, i64 %idxprom10
  %5 = load i8*, i8** %arrayidx11, align 8
  %idxprom12 = sext i32 %j.0 to i64
  %arrayidx13 = getelementptr inbounds i8, i8* %5, i64 %idxprom12
  store i8 %4, i8* %arrayidx13, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %inc = add nsw i32 %j.0, 1
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  %idxprom14 = sext i32 %i to i64
  %arrayidx15 = getelementptr inbounds i8*, i8** %state, i64 %idxprom14
  %6 = load i8*, i8** %arrayidx15, align 8
  %Nb16 = getelementptr inbounds %class.AES, %class.AES* %this, i32 0, i32 0
  %7 = load i32, i32* %Nb16, align 4
  %sub17 = sub nsw i32 %7, 1
  %idxprom18 = sext i32 %sub17 to i64
  %arrayidx19 = getelementptr inbounds i8, i8* %6, i64 %idxprom18
  store i8 %1, i8* %arrayidx19, align 1
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %inc21 = add nsw i32 %k.0, 1
  br label %for.cond

for.end22:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define zeroext i8 @_ZN3AES5xtimeEh(%class.AES* %this, i8 zeroext %b) #1 align 2 {
entry:
  %conv = zext i8 %b to i32
  %conv2 = zext i8 -128 to i32
  %and = and i32 %conv, %conv2
  %conv3 = trunc i32 %and to i8
  %conv4 = zext i8 %b to i32
  %shl = shl i32 %conv4, 1
  %conv5 = trunc i32 %shl to i8
  %tobool = icmp ne i8 %conv3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %conv6 = zext i8 %conv5 to i32
  %conv7 = zext i8 27 to i32
  %xor = xor i32 %conv6, %conv7
  %conv8 = trunc i32 %xor to i8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %b.addr.0 = phi i8 [ %conv8, %if.then ], [ %conv5, %entry ]
  ret i8 %b.addr.0
}

; Function Attrs: noinline nounwind ssp uwtable
define zeroext i8 @_ZN3AES9mul_bytesEhh(%class.AES* %this, i8 zeroext %a, i8 zeroext %b) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %c.0 = phi i8 [ 0, %entry ], [ %c.1, %for.inc12 ]
  %b.addr.0 = phi i8 [ %b, %entry ], [ %conv11, %for.inc12 ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc13, %for.inc12 ]
  %cmp = icmp slt i32 %i.0, 8
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  %conv = zext i8 %b.addr.0 to i32
  %conv2 = add i32 1, 0
  %and = and i32 %conv, %conv2
  %conv3 = trunc i32 %and to i8
  %tobool = icmp ne i8 %conv3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %if.then
  %d.0 = phi i8 [ %a, %if.then ], [ %call, %for.inc ]
  %j.0 = phi i32 [ 0, %if.then ], [ %inc, %for.inc ]
  %cmp5 = icmp slt i32 %j.0, %i.0
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %call = call zeroext i8 @_ZN3AES5xtimeEh(%class.AES* %this, i8 zeroext %d.0)
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %inc = add nsw i32 %j.0, 1
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %conv7 = zext i8 %c.0 to i32
  %conv8 = zext i8 %d.0 to i32
  %xor = xor i32 %conv7, %conv8
  %conv9 = trunc i32 %xor to i8
  br label %if.end

if.end:                                           ; preds = %for.end, %for.body
  %c.1 = phi i8 [ %conv9, %for.end ], [ %c.0, %for.body ]
  %conv10 = zext i8 %b.addr.0 to i32
  %shr = ashr i32 %conv10, 1
  %conv11 = trunc i32 %shr to i8
  br label %for.inc12

for.inc12:                                        ; preds = %if.end
  %inc13 = add nsw i32 %i.0, 1
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  ret i8 %c.0
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES7SubWordEPh(%class.AES* %this, i8* %a) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %a, i64 %idxprom
  %0 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %0 to i32
  %div = sdiv i32 %conv, 16
  %idxprom2 = sext i32 %div to i64
  %arrayidx3 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @_ZL4sbox, i64 0, i64 %idxprom2
  %idxprom4 = sext i32 %i.0 to i64
  %arrayidx5 = getelementptr inbounds i8, i8* %a, i64 %idxprom4
  %1 = load i8, i8* %arrayidx5, align 1
  %conv6 = zext i8 %1 to i32
  %rem = srem i32 %conv6, 16
  %idxprom7 = sext i32 %rem to i64
  %arrayidx8 = getelementptr inbounds [16 x i8], [16 x i8]* %arrayidx3, i64 0, i64 %idxprom7
  %2 = load i8, i8* %arrayidx8, align 1
  %idxprom9 = sext i32 %i.0 to i64
  %arrayidx10 = getelementptr inbounds i8, i8* %a, i64 %idxprom9
  store i8 %2, i8* %arrayidx10, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES7RotWordEPh(%class.AES* %this, i8* %a) #1 align 2 {
entry:
  %arrayidx = getelementptr inbounds i8, i8* %a, i64 0
  %0 = load i8, i8* %arrayidx, align 1
  %arrayidx2 = getelementptr inbounds i8, i8* %a, i64 1
  %1 = load i8, i8* %arrayidx2, align 1
  %arrayidx3 = getelementptr inbounds i8, i8* %a, i64 0
  store i8 %1, i8* %arrayidx3, align 1
  %arrayidx4 = getelementptr inbounds i8, i8* %a, i64 2
  %2 = load i8, i8* %arrayidx4, align 1
  %arrayidx5 = getelementptr inbounds i8, i8* %a, i64 1
  store i8 %2, i8* %arrayidx5, align 1
  %arrayidx6 = getelementptr inbounds i8, i8* %a, i64 3
  %3 = load i8, i8* %arrayidx6, align 1
  %arrayidx7 = getelementptr inbounds i8, i8* %a, i64 2
  store i8 %3, i8* %arrayidx7, align 1
  %arrayidx8 = getelementptr inbounds i8, i8* %a, i64 3
  store i8 %0, i8* %arrayidx8, align 1
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES8XorWordsEPhS0_S0_(%class.AES* %this, i8* %a, i8* %b, i8* %c) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %a, i64 %idxprom
  %0 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %0 to i32
  %idxprom2 = sext i32 %i.0 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %b, i64 %idxprom2
  %1 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %1 to i32
  %xor = xor i32 %conv, %conv4
  %conv5 = trunc i32 %xor to i8
  %idxprom6 = sext i32 %i.0 to i64
  %arrayidx7 = getelementptr inbounds i8, i8* %c, i64 %idxprom6
  store i8 %conv5, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES4RconEPhi(%class.AES* %this, i8* %a, i32 %n) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %c.0 = phi i8 [ 1, %entry ], [ %call, %for.inc ]
  %sub = sub nsw i32 %n, 1
  %cmp = icmp slt i32 %i.0, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call zeroext i8 @_ZN3AES5xtimeEh(%class.AES* %this, i8 zeroext %c.0)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx = getelementptr inbounds i8, i8* %a, i64 0
  store i8 %c.0, i8* %arrayidx, align 1
  %arrayidx2 = getelementptr inbounds i8, i8* %a, i64 3
  store i8 0, i8* %arrayidx2, align 1
  %arrayidx3 = getelementptr inbounds i8, i8* %a, i64 2
  store i8 0, i8* %arrayidx3, align 1
  %arrayidx4 = getelementptr inbounds i8, i8* %a, i64 1
  store i8 0, i8* %arrayidx4, align 1
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define void @_ZN3AES13printHexArrayEPhj(%class.AES* %this, i8* %a, i32 %n) #1 align 2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { noinline ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { noreturn }
attributes #7 = { builtin }
attributes #8 = { builtin nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 8.0.0 (tags/RELEASE_800/final 375507)"}
