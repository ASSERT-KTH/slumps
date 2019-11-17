	.text
	.intel_syntax noprefix
	.file	"fact.cpp"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_0:
	.quad	4607182418800017408
	.text
	.globl	_Z4facti
	.p2align	4, 0x90
	.type	_Z4facti,@function
_Z4facti:
	.cfi_startproc
	test	edi, edi
	jle	.LBB0_1
	movsxd	rax, edi
	inc	rax
	mov	ecx, 1
	.p2align	4, 0x90
.LBB0_3:
	dec	rax
	imul	rcx, rax
	cmp	rax, 1
	jg	.LBB0_3
	cvtsi2sd	xmm0, rcx
	ret
.LBB0_1:
	movsd	xmm0, qword ptr [rip + .LCPI0_0]
	ret
.Lfunc_end0:
	.size	_Z4facti, .Lfunc_end0-_Z4facti
	.cfi_endproc


	.ident	"clang version 5.0.0 (https://chromium.googlesource.com/external/github.com/llvm-mirror/clang e4de58127fa1d8d22ee8043cef9b4d8a807b6cde) (https://chromium.googlesource.com/external/github.com/llvm-mirror/llvm 08b86793476e08fc0937e70058e2a94808c988e7)"
	.section	".note.GNU-stack","",@progbits
