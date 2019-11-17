	.text
	.intel_syntax noprefix
	.file	"popcnt.cpp"
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:
	.cfi_startproc
	mov	eax, edi
	shr	eax
	and	eax, 1431655765
	sub	edi, eax
	mov	eax, edi
	and	eax, 858993459
	shr	edi, 2
	and	edi, 858993459
	add	edi, eax
	mov	eax, edi
	shr	eax, 4
	add	eax, edi
	and	eax, 252645135
	imul	eax, eax, 16843009
	shr	eax, 23
	and	eax, 510
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.globl	_Z5countj
	.p2align	4, 0x90
	.type	_Z5countj,@function
_Z5countj:
	.cfi_startproc
	xor	eax, eax
	test	edi, edi
	je	.LBB1_2
	.p2align	4, 0x90
.LBB1_1:
	lea	ecx, [rdi - 1]
	inc	eax
	and	edi, ecx
	jne	.LBB1_1
.LBB1_2:
	ret
.Lfunc_end1:
	.size	_Z5countj, .Lfunc_end1-_Z5countj
	.cfi_endproc


	.ident	"clang version 5.0.0 (https://chromium.googlesource.com/external/github.com/llvm-mirror/clang e4de58127fa1d8d22ee8043cef9b4d8a807b6cde) (https://chromium.googlesource.com/external/github.com/llvm-mirror/llvm 08b86793476e08fc0937e70058e2a94808c988e7)"
	.section	".note.GNU-stack","",@progbits
