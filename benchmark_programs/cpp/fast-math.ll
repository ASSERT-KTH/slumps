	.text
	.intel_syntax noprefix
	.file	"fast-math.cpp"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_0:
	.quad	4613937818241073152
	.text
	.globl	_Z3food
	.p2align	4, 0x90
	.type	_Z3food,@function
_Z3food:
	.cfi_startproc
	divsd	xmm0, qword ptr [rip + .LCPI0_0]
	ret
.Lfunc_end0:
	.size	_Z3food, .Lfunc_end0-_Z3food
	.cfi_endproc

	.globl	_Z9maybe_mindd
	.p2align	4, 0x90
	.type	_Z9maybe_mindd,@function
_Z9maybe_mindd:
	.cfi_startproc
	minsd	xmm0, xmm1
	ret
.Lfunc_end1:
	.size	_Z9maybe_mindd, .Lfunc_end1-_Z9maybe_mindd
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI2_0:
	.quad	4620693217682128896
	.text
	.globl	_Z8call_powd
	.p2align	4, 0x90
	.type	_Z8call_powd,@function
_Z8call_powd:
	.cfi_startproc
	movsd	xmm1, qword ptr [rip + .LCPI2_0]
	jmp	_Z3powdd
.Lfunc_end2:
	.size	_Z8call_powd, .Lfunc_end2-_Z8call_powd
	.cfi_endproc

	.globl	_Z6do_powd
	.p2align	4, 0x90
	.type	_Z6do_powd,@function
_Z6do_powd:
	.cfi_startproc
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm1
	mulsd	xmm1, xmm0
	mulsd	xmm1, xmm0
	mulsd	xmm1, xmm0
	mulsd	xmm1, xmm0
	mulsd	xmm1, xmm0
	mulsd	xmm1, xmm0
	movapd	xmm0, xmm1
	ret
.Lfunc_end3:
	.size	_Z6do_powd, .Lfunc_end3-_Z6do_powd
	.cfi_endproc

	.globl	_Z6factorddd
	.p2align	4, 0x90
	.type	_Z6factorddd,@function
_Z6factorddd:
	.cfi_startproc
	mulsd	xmm0, xmm2
	mulsd	xmm1, xmm2
	addsd	xmm0, xmm1
	ret
.Lfunc_end4:
	.size	_Z6factorddd, .Lfunc_end4-_Z6factorddd
	.cfi_endproc


	.ident	"clang version 5.0.0 (https://chromium.googlesource.com/external/github.com/llvm-mirror/clang e4de58127fa1d8d22ee8043cef9b4d8a807b6cde) (https://chromium.googlesource.com/external/github.com/llvm-mirror/llvm 08b86793476e08fc0937e70058e2a94808c988e7)"
	.section	".note.GNU-stack","",@progbits
