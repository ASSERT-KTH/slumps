; ModuleID = 'fibo.7rcbfp3g-cgu.0'
source_filename = "fibo.7rcbfp3g-cgu.0"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.7.0"

%"core::fmt::Formatter" = type { [0 x i64], { i64, i64 }, [0 x i64], { i64, i64 }, [0 x i64], { {}*, [3 x i64]* }, [0 x i64], { i64*, i64* }, [0 x i64], { [0 x { i8*, i8* }]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i8], i8, [7 x i8] }
%"core::fmt::Void" = type { [0 x i8], {}, [0 x i8], %"core::marker::PhantomData<*mut core::ops::function::Fn<(), Output=()>>", [0 x i8] }
%"core::marker::PhantomData<*mut core::ops::function::Fn<(), Output=()>>" = type {}
%"core::fmt::Arguments" = type { [0 x i64], { [0 x { [0 x i8]*, i64 }]*, i64 }, [0 x i64], { i64*, i64 }, [0 x i64], { [0 x { i8*, i8* }]*, i64 }, [0 x i64] }
%"unwind::libunwind::_Unwind_Exception" = type { [0 x i64], i64, [0 x i64], void (i32, %"unwind::libunwind::_Unwind_Exception"*)*, [0 x i64], [6 x i64], [0 x i64] }
%"unwind::libunwind::_Unwind_Context" = type { [0 x i8] }

@vtable.0 = private unnamed_addr constant { void (i8**)*, i64, i64, i32 (i8**)*, i32 (i8**)*, i32 (i8**)* } { void (i8**)* @_ZN4core3ptr18real_drop_in_place17h0f77ff3c5227182aE, i64 8, i64 8, i32 (i8**)* @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h8bf8ddac79094706E", i32 (i8**)* @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h8bf8ddac79094706E", i32 (i8**)* @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hedc508ce1e761d06E" }, align 8
@str.1 = internal constant [42 x i8] c"../../benchmark_programs/rust/tiny/fibo.rs"
@str.2 = internal constant [33 x i8] c"attempt to subtract with overflow"
@panic_loc.3 = private unnamed_addr constant { { [0 x i8]*, i64 }, { [0 x i8]*, i64 }, i32, i32 } { { [0 x i8]*, i64 } { [0 x i8]* bitcast ([33 x i8]* @str.2 to [0 x i8]*), i64 33 }, { [0 x i8]*, i64 } { [0 x i8]* bitcast ([42 x i8]* @str.1 to [0 x i8]*), i64 42 }, i32 5, i32 24 }, align 8
@panic_loc.4 = private unnamed_addr constant { { [0 x i8]*, i64 }, { [0 x i8]*, i64 }, i32, i32 } { { [0 x i8]*, i64 } { [0 x i8]* bitcast ([33 x i8]* @str.2 to [0 x i8]*), i64 33 }, { [0 x i8]*, i64 } { [0 x i8]* bitcast ([42 x i8]* @str.1 to [0 x i8]*), i64 42 }, i32 5, i32 43 }, align 8
@str.5 = internal constant [28 x i8] c"attempt to add with overflow"
@panic_loc.6 = private unnamed_addr constant { { [0 x i8]*, i64 }, { [0 x i8]*, i64 }, i32, i32 } { { [0 x i8]*, i64 } { [0 x i8]* bitcast ([28 x i8]* @str.5 to [0 x i8]*), i64 28 }, { [0 x i8]*, i64 } { [0 x i8]* bitcast ([42 x i8]* @str.1 to [0 x i8]*), i64 42 }, i32 5, i32 14 }, align 8
@0 = private unnamed_addr constant <{ [20 x i8] }> <{ [20 x i8] c"Fibonacci generator\0A" }>, align 1
@1 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [20 x i8] }>, <{ [20 x i8] }>* @0, i32 0, i32 0, i32 0), [8 x i8] c"\14\00\00\00\00\00\00\00" }>, align 8
@2 = private unnamed_addr constant <{ [0 x i8] }> zeroinitializer, align 8
@3 = private unnamed_addr constant <{ [1 x i8] }> <{ [1 x i8] c"\0A" }>, align 1
@4 = private unnamed_addr constant <{ i8*, [8 x i8], i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [0 x i8] }>, <{ [0 x i8] }>* @2, i32 0, i32 0, i32 0), [8 x i8] zeroinitializer, i8* getelementptr inbounds (<{ [1 x i8] }>, <{ [1 x i8] }>* @3, i32 0, i32 0, i32 0), [8 x i8] c"\01\00\00\00\00\00\00\00" }>, align 8

; std::rt::lang_start
; Function Attrs: uwtable
define hidden i64 @_ZN3std2rt10lang_start17ha21c46746ba77dd7E(void ()* nonnull %main, i64 %argc, i8** %argv) unnamed_addr #0 {
start:
  %_7 = alloca i8*, align 8
  %0 = bitcast i8** %_7 to void ()**
  store void ()* %main, void ()** %0, align 8
  %1 = bitcast i8** %_7 to {}*
; call std::rt::lang_start_internal
  %2 = call i64 @_ZN3std2rt19lang_start_internal17ha688fd553625ef6fE({}* nonnull align 1 %1, [3 x i64]* noalias readonly align 8 dereferenceable(24) bitcast ({ void (i8**)*, i64, i64, i32 (i8**)*, i32 (i8**)*, i32 (i8**)* }* @vtable.0 to [3 x i64]*), i64 %argc, i8** %argv)
  br label %bb1

bb1:                                              ; preds = %start
  ret i64 %2
}

; std::rt::lang_start::{{closure}}
; Function Attrs: uwtable
define internal i32 @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h8bf8ddac79094706E"(i8** noalias readonly align 8 dereferenceable(8) %arg0) unnamed_addr #0 {
start:
  %0 = bitcast i8** %arg0 to void ()**
  %1 = load void ()*, void ()** %0, align 8, !nonnull !1
  call void %1()
  br label %bb1

bb1:                                              ; preds = %start
; call <() as std::process::Termination>::report
  %2 = call i32 @"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hc979d3212291c67fE"()
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i32 %2
}

; std::sys::unix::process::process_common::ExitCode::as_i32
; Function Attrs: inlinehint uwtable
define internal i32 @_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb8d66a3e42967b1aE(i8* noalias readonly align 1 dereferenceable(1) %self) unnamed_addr #1 {
start:
  %0 = load i8, i8* %self, align 1
  %1 = zext i8 %0 to i32
  ret i32 %1
}

; core::fmt::ArgumentV1::new
; Function Attrs: uwtable
define internal { i8*, i8* } @_ZN4core3fmt10ArgumentV13new17hb0f9838d92845ed7E(i32* noalias readonly align 4 dereferenceable(4) %x, i1 (i32*, %"core::fmt::Formatter"*)* nonnull %f) unnamed_addr #0 {
start:
  %transmute_temp1 = alloca %"core::fmt::Void"*, align 8
  %transmute_temp = alloca i1 (%"core::fmt::Void"*, %"core::fmt::Formatter"*)*, align 8
  %_0 = alloca { i8*, i8* }, align 8
  %0 = bitcast i1 (%"core::fmt::Void"*, %"core::fmt::Formatter"*)** %transmute_temp to i1 (i32*, %"core::fmt::Formatter"*)**
  store i1 (i32*, %"core::fmt::Formatter"*)* %f, i1 (i32*, %"core::fmt::Formatter"*)** %0, align 8
  %1 = load i1 (%"core::fmt::Void"*, %"core::fmt::Formatter"*)*, i1 (%"core::fmt::Void"*, %"core::fmt::Formatter"*)** %transmute_temp, align 8, !nonnull !1
  br label %bb1

bb1:                                              ; preds = %start
  %2 = bitcast %"core::fmt::Void"** %transmute_temp1 to i32**
  store i32* %x, i32** %2, align 8
  %3 = load %"core::fmt::Void"*, %"core::fmt::Void"** %transmute_temp1, align 8, !nonnull !1
  br label %bb2

bb2:                                              ; preds = %bb1
  %4 = bitcast { i8*, i8* }* %_0 to %"core::fmt::Void"**
  store %"core::fmt::Void"* %3, %"core::fmt::Void"** %4, align 8
  %5 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %_0, i32 0, i32 1
  %6 = bitcast i8** %5 to i1 (%"core::fmt::Void"*, %"core::fmt::Formatter"*)**
  store i1 (%"core::fmt::Void"*, %"core::fmt::Formatter"*)* %1, i1 (%"core::fmt::Void"*, %"core::fmt::Formatter"*)** %6, align 8
  %7 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %_0, i32 0, i32 0
  %8 = load i8*, i8** %7, align 8, !nonnull !1
  %9 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %_0, i32 0, i32 1
  %10 = load i8*, i8** %9, align 8, !nonnull !1
  %11 = insertvalue { i8*, i8* } undef, i8* %8, 0
  %12 = insertvalue { i8*, i8* } %11, i8* %10, 1
  ret { i8*, i8* } %12
}

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3fmt9Arguments6new_v117hf74f6ad6c995f455E(%"core::fmt::Arguments"* noalias nocapture sret dereferenceable(48), [0 x { [0 x i8]*, i64 }]* noalias nonnull readonly align 8 %pieces.0, i64 %pieces.1, [0 x { i8*, i8* }]* noalias nonnull readonly align 8 %args.0, i64 %args.1) unnamed_addr #1 {
start:
  %_4 = alloca { i64*, i64 }, align 8
  %1 = bitcast { i64*, i64 }* %_4 to {}**
  store {}* null, {}** %1, align 8
  %2 = bitcast %"core::fmt::Arguments"* %0 to { [0 x { [0 x i8]*, i64 }]*, i64 }*
  %3 = getelementptr inbounds { [0 x { [0 x i8]*, i64 }]*, i64 }, { [0 x { [0 x i8]*, i64 }]*, i64 }* %2, i32 0, i32 0
  store [0 x { [0 x i8]*, i64 }]* %pieces.0, [0 x { [0 x i8]*, i64 }]** %3, align 8
  %4 = getelementptr inbounds { [0 x { [0 x i8]*, i64 }]*, i64 }, { [0 x { [0 x i8]*, i64 }]*, i64 }* %2, i32 0, i32 1
  store i64 %pieces.1, i64* %4, align 8
  %5 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"* %0, i32 0, i32 3
  %6 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %_4, i32 0, i32 0
  %7 = load i64*, i64** %6, align 8
  %8 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %_4, i32 0, i32 1
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %5, i32 0, i32 0
  store i64* %7, i64** %10, align 8
  %11 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %5, i32 0, i32 1
  store i64 %9, i64* %11, align 8
  %12 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"* %0, i32 0, i32 5
  %13 = getelementptr inbounds { [0 x { i8*, i8* }]*, i64 }, { [0 x { i8*, i8* }]*, i64 }* %12, i32 0, i32 0
  store [0 x { i8*, i8* }]* %args.0, [0 x { i8*, i8* }]** %13, align 8
  %14 = getelementptr inbounds { [0 x { i8*, i8* }]*, i64 }, { [0 x { i8*, i8* }]*, i64 }* %12, i32 0, i32 1
  store i64 %args.1, i64* %14, align 8
  ret void
}

; core::ops::function::FnOnce::call_once{{vtable.shim}}
; Function Attrs: uwtable
define internal i32 @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hedc508ce1e761d06E"(i8** %arg0) unnamed_addr #0 {
start:
  %arg1 = alloca {}, align 1
  %0 = load i8*, i8** %arg0, align 8, !nonnull !1
; call core::ops::function::FnOnce::call_once
  %1 = call i32 @_ZN4core3ops8function6FnOnce9call_once17hb9e2b0ffed8f5681E(i8* nonnull %0)
  br label %bb1

bb1:                                              ; preds = %start
  ret i32 %1
}

; core::ops::function::FnOnce::call_once
; Function Attrs: uwtable
define internal i32 @_ZN4core3ops8function6FnOnce9call_once17hb9e2b0ffed8f5681E(i8* nonnull) unnamed_addr #0 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality {
start:
  %personalityslot = alloca { i8*, i32 }, align 8
  %arg1 = alloca {}, align 1
  %arg0 = alloca i8*, align 8
  store i8* %0, i8** %arg0, align 8
; invoke std::rt::lang_start::{{closure}}
  %1 = invoke i32 @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h8bf8ddac79094706E"(i8** align 8 dereferenceable(8) %arg0)
          to label %bb1 unwind label %cleanup

bb1:                                              ; preds = %start
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i32 %1

bb3:                                              ; preds = %cleanup
  br label %bb4

bb4:                                              ; preds = %bb3
  %2 = bitcast { i8*, i32 }* %personalityslot to i8**
  %3 = load i8*, i8** %2, align 8
  %4 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %personalityslot, i32 0, i32 1
  %5 = load i32, i32* %4, align 8
  %6 = insertvalue { i8*, i32 } undef, i8* %3, 0
  %7 = insertvalue { i8*, i32 } %6, i32 %5, 1
  resume { i8*, i32 } %7

cleanup:                                          ; preds = %start
  %8 = landingpad { i8*, i32 }
          cleanup
  %9 = extractvalue { i8*, i32 } %8, 0
  %10 = extractvalue { i8*, i32 } %8, 1
  %11 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %personalityslot, i32 0, i32 0
  store i8* %9, i8** %11, align 8
  %12 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %personalityslot, i32 0, i32 1
  store i32 %10, i32* %12, align 8
  br label %bb3
}

; core::ptr::real_drop_in_place
; Function Attrs: uwtable
define internal void @_ZN4core3ptr18real_drop_in_place17h0f77ff3c5227182aE(i8** align 8 dereferenceable(8) %arg0) unnamed_addr #0 {
start:
  ret void
}

; <() as std::process::Termination>::report
; Function Attrs: inlinehint uwtable
define internal i32 @"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hc979d3212291c67fE"() unnamed_addr #1 {
start:
; call <std::process::ExitCode as std::process::Termination>::report
  %0 = call i32 @"_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h2c688f82862566dcE"(i8 0)
  br label %bb1

bb1:                                              ; preds = %start
  ret i32 %0
}

; <std::process::ExitCode as std::process::Termination>::report
; Function Attrs: inlinehint uwtable
define internal i32 @"_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h2c688f82862566dcE"(i8) unnamed_addr #1 {
start:
  %self = alloca i8, align 1
  store i8 %0, i8* %self, align 1
; call std::sys::unix::process::process_common::ExitCode::as_i32
  %1 = call i32 @_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb8d66a3e42967b1aE(i8* noalias readonly align 1 dereferenceable(1) %self)
  br label %bb1

bb1:                                              ; preds = %start
  ret i32 %1
}

; fibo::fibonacci
; Function Attrs: uwtable
define internal i32 @_ZN4fibo9fibonacci17h9588196176dec41aE(i32 %n) unnamed_addr #0 {
start:
  %_0 = alloca i32, align 4
  switch i32 %n, label %bb1 [
    i32 0, label %bb2
    i32 1, label %bb3
  ]

bb1:                                              ; preds = %start
  %0 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %n, i32 1)
  %1 = extractvalue { i32, i1 } %0, 0
  %2 = extractvalue { i32, i1 } %0, 1
  %3 = call i1 @llvm.expect.i1(i1 %2, i1 false)
  br i1 %3, label %panic, label %bb4

bb2:                                              ; preds = %start
  store i32 1, i32* %_0, align 4
  br label %bb9

bb3:                                              ; preds = %start
  store i32 1, i32* %_0, align 4
  br label %bb9

bb4:                                              ; preds = %bb1
; call fibo::fibonacci
  %4 = call i32 @_ZN4fibo9fibonacci17h9588196176dec41aE(i32 %1)
  br label %bb5

bb5:                                              ; preds = %bb4
  %5 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %n, i32 2)
  %6 = extractvalue { i32, i1 } %5, 0
  %7 = extractvalue { i32, i1 } %5, 1
  %8 = call i1 @llvm.expect.i1(i1 %7, i1 false)
  br i1 %8, label %panic1, label %bb6

bb6:                                              ; preds = %bb5
; call fibo::fibonacci
  %9 = call i32 @_ZN4fibo9fibonacci17h9588196176dec41aE(i32 %6)
  br label %bb7

bb7:                                              ; preds = %bb6
  %10 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %4, i32 %9)
  %11 = extractvalue { i32, i1 } %10, 0
  %12 = extractvalue { i32, i1 } %10, 1
  %13 = call i1 @llvm.expect.i1(i1 %12, i1 false)
  br i1 %13, label %panic2, label %bb8

bb8:                                              ; preds = %bb7
  store i32 %11, i32* %_0, align 4
  br label %bb9

bb9:                                              ; preds = %bb2, %bb3, %bb8
  %14 = load i32, i32* %_0, align 4
  ret i32 %14

panic:                                            ; preds = %bb1
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h4434bd97a078578dE({ [0 x i64], { [0 x i8]*, i64 }, [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }* noalias readonly align 8 dereferenceable(40) bitcast ({ { [0 x i8]*, i64 }, { [0 x i8]*, i64 }, i32, i32 }* @panic_loc.3 to { [0 x i64], { [0 x i8]*, i64 }, [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }*))
  unreachable

panic1:                                           ; preds = %bb5
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h4434bd97a078578dE({ [0 x i64], { [0 x i8]*, i64 }, [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }* noalias readonly align 8 dereferenceable(40) bitcast ({ { [0 x i8]*, i64 }, { [0 x i8]*, i64 }, i32, i32 }* @panic_loc.4 to { [0 x i64], { [0 x i8]*, i64 }, [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }*))
  unreachable

panic2:                                           ; preds = %bb7
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h4434bd97a078578dE({ [0 x i64], { [0 x i8]*, i64 }, [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }* noalias readonly align 8 dereferenceable(40) bitcast ({ { [0 x i8]*, i64 }, { [0 x i8]*, i64 }, i32, i32 }* @panic_loc.6 to { [0 x i64], { [0 x i8]*, i64 }, [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }*))
  unreachable
}

; fibo::main
; Function Attrs: uwtable
define internal void @_ZN4fibo4main17h43c90ec5000c59a5E() unnamed_addr #0 {
start:
  %_52 = alloca i32, align 4
  %_50 = alloca i32*, align 8
  %_49 = alloca [1 x { i8*, i8* }], align 8
  %_42 = alloca %"core::fmt::Arguments", align 8
  %_36 = alloca i32, align 4
  %_34 = alloca i32*, align 8
  %_33 = alloca [1 x { i8*, i8* }], align 8
  %_26 = alloca %"core::fmt::Arguments", align 8
  %_20 = alloca i32, align 4
  %_18 = alloca i32*, align 8
  %_17 = alloca [1 x { i8*, i8* }], align 8
  %_10 = alloca %"core::fmt::Arguments", align 8
  %_2 = alloca %"core::fmt::Arguments", align 8
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117hf74f6ad6c995f455E(%"core::fmt::Arguments"* noalias nocapture sret dereferenceable(48) %_2, [0 x { [0 x i8]*, i64 }]* noalias nonnull readonly align 8 bitcast (<{ i8*, [8 x i8] }>* @1 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i8* }]* noalias nonnull readonly align 8 bitcast (<{ [0 x i8] }>* @2 to [0 x { i8*, i8* }]*), i64 0)
  br label %bb1

bb1:                                              ; preds = %start
; call std::io::stdio::_print
  call void @_ZN3std2io5stdio6_print17h892069777c4438d7E(%"core::fmt::Arguments"* noalias nocapture dereferenceable(48) %_2)
  br label %bb2

bb2:                                              ; preds = %bb1
; call fibo::fibonacci
  %0 = call i32 @_ZN4fibo9fibonacci17h9588196176dec41aE(i32 1)
  store i32 %0, i32* %_20, align 4
  br label %bb3

bb3:                                              ; preds = %bb2
  store i32* %_20, i32** %_18, align 8
  %1 = load i32*, i32** %_18, align 8, !nonnull !1
; call core::fmt::ArgumentV1::new
  %2 = call { i8*, i8* } @_ZN4core3fmt10ArgumentV13new17hb0f9838d92845ed7E(i32* noalias readonly align 4 dereferenceable(4) %1, i1 (i32*, %"core::fmt::Formatter"*)* nonnull @"_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4544a0594dbb03adE")
  %3 = extractvalue { i8*, i8* } %2, 0
  %4 = extractvalue { i8*, i8* } %2, 1
  br label %bb4

bb4:                                              ; preds = %bb3
  %5 = bitcast [1 x { i8*, i8* }]* %_17 to { i8*, i8* }*
  %6 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %5, i32 0, i32 0
  store i8* %3, i8** %6, align 8
  %7 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %5, i32 0, i32 1
  store i8* %4, i8** %7, align 8
  %8 = bitcast [1 x { i8*, i8* }]* %_17 to [0 x { i8*, i8* }]*
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117hf74f6ad6c995f455E(%"core::fmt::Arguments"* noalias nocapture sret dereferenceable(48) %_10, [0 x { [0 x i8]*, i64 }]* noalias nonnull readonly align 8 bitcast (<{ i8*, [8 x i8], i8*, [8 x i8] }>* @4 to [0 x { [0 x i8]*, i64 }]*), i64 2, [0 x { i8*, i8* }]* noalias nonnull readonly align 8 %8, i64 1)
  br label %bb5

bb5:                                              ; preds = %bb4
; call std::io::stdio::_print
  call void @_ZN3std2io5stdio6_print17h892069777c4438d7E(%"core::fmt::Arguments"* noalias nocapture dereferenceable(48) %_10)
  br label %bb6

bb6:                                              ; preds = %bb5
; call fibo::fibonacci
  %9 = call i32 @_ZN4fibo9fibonacci17h9588196176dec41aE(i32 3)
  store i32 %9, i32* %_36, align 4
  br label %bb7

bb7:                                              ; preds = %bb6
  store i32* %_36, i32** %_34, align 8
  %10 = load i32*, i32** %_34, align 8, !nonnull !1
; call core::fmt::ArgumentV1::new
  %11 = call { i8*, i8* } @_ZN4core3fmt10ArgumentV13new17hb0f9838d92845ed7E(i32* noalias readonly align 4 dereferenceable(4) %10, i1 (i32*, %"core::fmt::Formatter"*)* nonnull @"_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4544a0594dbb03adE")
  %12 = extractvalue { i8*, i8* } %11, 0
  %13 = extractvalue { i8*, i8* } %11, 1
  br label %bb8

bb8:                                              ; preds = %bb7
  %14 = bitcast [1 x { i8*, i8* }]* %_33 to { i8*, i8* }*
  %15 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %14, i32 0, i32 0
  store i8* %12, i8** %15, align 8
  %16 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %14, i32 0, i32 1
  store i8* %13, i8** %16, align 8
  %17 = bitcast [1 x { i8*, i8* }]* %_33 to [0 x { i8*, i8* }]*
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117hf74f6ad6c995f455E(%"core::fmt::Arguments"* noalias nocapture sret dereferenceable(48) %_26, [0 x { [0 x i8]*, i64 }]* noalias nonnull readonly align 8 bitcast (<{ i8*, [8 x i8], i8*, [8 x i8] }>* @4 to [0 x { [0 x i8]*, i64 }]*), i64 2, [0 x { i8*, i8* }]* noalias nonnull readonly align 8 %17, i64 1)
  br label %bb9

bb9:                                              ; preds = %bb8
; call std::io::stdio::_print
  call void @_ZN3std2io5stdio6_print17h892069777c4438d7E(%"core::fmt::Arguments"* noalias nocapture dereferenceable(48) %_26)
  br label %bb10

bb10:                                             ; preds = %bb9
; call fibo::fibonacci
  %18 = call i32 @_ZN4fibo9fibonacci17h9588196176dec41aE(i32 5)
  store i32 %18, i32* %_52, align 4
  br label %bb11

bb11:                                             ; preds = %bb10
  store i32* %_52, i32** %_50, align 8
  %19 = load i32*, i32** %_50, align 8, !nonnull !1
; call core::fmt::ArgumentV1::new
  %20 = call { i8*, i8* } @_ZN4core3fmt10ArgumentV13new17hb0f9838d92845ed7E(i32* noalias readonly align 4 dereferenceable(4) %19, i1 (i32*, %"core::fmt::Formatter"*)* nonnull @"_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4544a0594dbb03adE")
  %21 = extractvalue { i8*, i8* } %20, 0
  %22 = extractvalue { i8*, i8* } %20, 1
  br label %bb12

bb12:                                             ; preds = %bb11
  %23 = bitcast [1 x { i8*, i8* }]* %_49 to { i8*, i8* }*
  %24 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %23, i32 0, i32 0
  store i8* %21, i8** %24, align 8
  %25 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %23, i32 0, i32 1
  store i8* %22, i8** %25, align 8
  %26 = bitcast [1 x { i8*, i8* }]* %_49 to [0 x { i8*, i8* }]*
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117hf74f6ad6c995f455E(%"core::fmt::Arguments"* noalias nocapture sret dereferenceable(48) %_42, [0 x { [0 x i8]*, i64 }]* noalias nonnull readonly align 8 bitcast (<{ i8*, [8 x i8], i8*, [8 x i8] }>* @4 to [0 x { [0 x i8]*, i64 }]*), i64 2, [0 x { i8*, i8* }]* noalias nonnull readonly align 8 %26, i64 1)
  br label %bb13

bb13:                                             ; preds = %bb12
; call std::io::stdio::_print
  call void @_ZN3std2io5stdio6_print17h892069777c4438d7E(%"core::fmt::Arguments"* noalias nocapture dereferenceable(48) %_42)
  br label %bb14

bb14:                                             ; preds = %bb13
  ret void
}

; std::rt::lang_start_internal
; Function Attrs: uwtable
declare i64 @_ZN3std2rt19lang_start_internal17ha688fd553625ef6fE({}* nonnull align 1, [3 x i64]* noalias readonly align 8 dereferenceable(24), i64, i8**) unnamed_addr #0

; Function Attrs: nounwind uwtable
declare i32 @rust_eh_personality(i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*) unnamed_addr #2

; Function Attrs: nounwind readnone speculatable
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #3

; Function Attrs: nounwind readnone
declare i1 @llvm.expect.i1(i1, i1) #4

; core::panicking::panic
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking5panic17h4434bd97a078578dE({ [0 x i64], { [0 x i8]*, i64 }, [0 x i64], { [0 x i8]*, i64 }, [0 x i32], i32, [0 x i32], i32, [0 x i32] }* noalias readonly align 8 dereferenceable(40)) unnamed_addr #5

; Function Attrs: nounwind readnone speculatable
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #3

; std::io::stdio::_print
; Function Attrs: uwtable
declare void @_ZN3std2io5stdio6_print17h892069777c4438d7E(%"core::fmt::Arguments"* noalias nocapture dereferenceable(48)) unnamed_addr #0

; core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt
; Function Attrs: uwtable
declare zeroext i1 @"_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4544a0594dbb03adE"(i32* noalias readonly align 4 dereferenceable(4), %"core::fmt::Formatter"* align 8 dereferenceable(96)) unnamed_addr #0

define i32 @main(i32, i8**) unnamed_addr #6 {
top:
  %2 = sext i32 %0 to i64
; call std::rt::lang_start
  %3 = call i64 @_ZN3std2rt10lang_start17ha21c46746ba77dd7E(void ()* @_ZN4fibo4main17h43c90ec5000c59a5E, i64 %2, i8** %1)
  %4 = trunc i64 %3 to i32
  ret i32 %4
}

attributes #0 = { uwtable "no-frame-pointer-elim"="true" "probe-stack"="__rust_probestack" "target-cpu"="core2" }
attributes #1 = { inlinehint uwtable "no-frame-pointer-elim"="true" "probe-stack"="__rust_probestack" "target-cpu"="core2" }
attributes #2 = { nounwind uwtable "no-frame-pointer-elim"="true" "probe-stack"="__rust_probestack" "target-cpu"="core2" }
attributes #3 = { nounwind readnone speculatable }
attributes #4 = { nounwind readnone }
attributes #5 = { cold noinline noreturn uwtable "no-frame-pointer-elim"="true" "probe-stack"="__rust_probestack" "target-cpu"="core2" }
attributes #6 = { "no-frame-pointer-elim"="true" "target-cpu"="core2" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
!1 = !{}
