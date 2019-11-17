	.text
	.intel_syntax noprefix
	.file	"duff.cpp"
	.globl	_Z4sendPcS_m
	.p2align	4, 0x90
	.type	_Z4sendPcS_m,@function
_Z4sendPcS_m:
	.cfi_startproc
	lea	rax, [rdx + 7]
	shr	rax, 3
	and	dl, 7
	dec	dl
	cmp	dl, 6
	ja	.LBB0_2
	movzx	ecx, dl
	jmp	qword ptr [8*rcx + .LJTI0_0]
.LBB0_2:
	mov	cl, byte ptr [rsi]
	inc	rsi
	mov	byte ptr [rdi], cl
	inc	rdi
.LBB0_3:
	mov	cl, byte ptr [rsi]
	inc	rsi
	mov	byte ptr [rdi], cl
	inc	rdi
.LBB0_4:
	mov	cl, byte ptr [rsi]
	inc	rsi
	mov	byte ptr [rdi], cl
	inc	rdi
.LBB0_5:
	mov	cl, byte ptr [rsi]
	inc	rsi
	mov	byte ptr [rdi], cl
	inc	rdi
.LBB0_6:
	mov	cl, byte ptr [rsi]
	inc	rsi
	mov	byte ptr [rdi], cl
	inc	rdi
.LBB0_7:
	mov	cl, byte ptr [rsi]
	inc	rsi
	mov	byte ptr [rdi], cl
	inc	rdi
.LBB0_8:
	mov	cl, byte ptr [rsi]
	inc	rsi
	mov	byte ptr [rdi], cl
	inc	rdi
.LBB0_9:
	mov	cl, byte ptr [rsi]
	mov	byte ptr [rdi], cl
	dec	rax
	je	.LBB0_11
	inc	rsi
	inc	rdi
	jmp	.LBB0_2
.LBB0_11:
	ret
.Lfunc_end0:
	.size	_Z4sendPcS_m, .Lfunc_end0-_Z4sendPcS_m
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI0_0:
	.quad	.LBB0_9
	.quad	.LBB0_8
	.quad	.LBB0_7
	.quad	.LBB0_6
	.quad	.LBB0_5
	.quad	.LBB0_4
	.quad	.LBB0_3


	.ident	"clang version 5.0.0 (https://chromium.googlesource.com/external/github.com/llvm-mirror/clang e4de58127fa1d8d22ee8043cef9b4d8a807b6cde) (https://chromium.googlesource.com/external/github.com/llvm-mirror/llvm 08b86793476e08fc0937e70058e2a94808c988e7)"
	.section	".note.GNU-stack","",@progbits
