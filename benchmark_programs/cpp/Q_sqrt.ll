	.text
	.intel_syntax noprefix
	.file	"Q_sqrt.cpp"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI0_0:
	.long	1056964608
.LCPI0_1:
	.long	1069547520
	.text
	.globl	_Z7Q_rsqrtf
	.p2align	4, 0x90
	.type	_Z7Q_rsqrtf,@function
_Z7Q_rsqrtf:
	.cfi_startproc
	movd	eax, xmm0
	mulss	xmm0, dword ptr [rip + .LCPI0_0]
	shr	eax
	mov	ecx, 1597463007
	sub	ecx, eax
	movd	xmm2, ecx
	movaps	xmm3, xmm0
	mulss	xmm3, xmm2
	mulss	xmm3, xmm2
	movss	xmm1, dword ptr [rip + .LCPI0_1]
	movaps	xmm4, xmm1
	subss	xmm4, xmm3
	mulss	xmm4, xmm2
	mulss	xmm0, xmm4
	mulss	xmm0, xmm4
	subss	xmm1, xmm0
	mulss	xmm1, xmm4
	movaps	xmm0, xmm1
	ret
.Lfunc_end0:
	.size	_Z7Q_rsqrtf, .Lfunc_end0-_Z7Q_rsqrtf
	.cfi_endproc


	.ident	"clang version 5.0.0 (https://chromium.googlesource.com/external/github.com/llvm-mirror/clang e4de58127fa1d8d22ee8043cef9b4d8a807b6cde) (https://chromium.googlesource.com/external/github.com/llvm-mirror/llvm 08b86793476e08fc0937e70058e2a94808c988e7)"
	.section	".note.GNU-stack","",@progbits
