	.text
	.intel_syntax noprefix
	.file	"testfunction.cpp"
	.globl	_Z12testFunctionPii
	.p2align	4, 0x90
	.type	_Z12testFunctionPii,@function
_Z12testFunctionPii:
	.cfi_startproc
	test	esi, esi
	jle	.LBB0_1
	mov	ecx, esi
	cmp	esi, 7
	jbe	.LBB0_3
	and	esi, 7
	mov	r8, rcx
	sub	r8, rsi
	je	.LBB0_3
	lea	rax, [rdi + 16]
	pxor	xmm0, xmm0
	mov	rdx, r8
	pxor	xmm1, xmm1
	.p2align	4, 0x90
.LBB0_8:
	movdqu	xmm2, xmmword ptr [rax - 16]
	movdqu	xmm3, xmmword ptr [rax]
	paddd	xmm0, xmm2
	paddd	xmm1, xmm3
	add	rax, 32
	add	rdx, -8
	jne	.LBB0_8
	paddd	xmm1, xmm0
	pshufd	xmm0, xmm1, 78
	paddd	xmm0, xmm1
	pshufd	xmm1, xmm0, 229
	paddd	xmm1, xmm0
	movd	eax, xmm1
	test	esi, esi
	jne	.LBB0_4
	jmp	.LBB0_10
.LBB0_3:
	xor	r8d, r8d
	xor	eax, eax
.LBB0_4:
	lea	rdx, [rdi + 4*r8]
	sub	rcx, r8
	.p2align	4, 0x90
.LBB0_5:
	add	eax, dword ptr [rdx]
	add	rdx, 4
	dec	rcx
	jne	.LBB0_5
.LBB0_10:
	ret
.LBB0_1:
	xor	eax, eax
	ret
.Lfunc_end0:
	.size	_Z12testFunctionPii, .Lfunc_end0-_Z12testFunctionPii
	.cfi_endproc


	.ident	"clang version 5.0.0 (https://chromium.googlesource.com/external/github.com/llvm-mirror/clang e4de58127fa1d8d22ee8043cef9b4d8a807b6cde) (https://chromium.googlesource.com/external/github.com/llvm-mirror/llvm 08b86793476e08fc0937e70058e2a94808c988e7)"
	.section	".note.GNU-stack","",@progbits
