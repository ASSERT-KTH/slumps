	.text
	.intel_syntax noprefix
	.file	"virtual.cpp"
	.globl	_Z4ctorv
	.p2align	4, 0x90
	.type	_Z4ctorv,@function
_Z4ctorv:
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 3, __gxx_personality_v0
	.cfi_lsda 3, .Lexception0
	push	r14
.Lcfi0:
	.cfi_def_cfa_offset 16
	push	rbx
.Lcfi1:
	.cfi_def_cfa_offset 24
	push	rax
.Lcfi2:
	.cfi_def_cfa_offset 32
.Lcfi3:
	.cfi_offset rbx, -24
.Lcfi4:
	.cfi_offset r14, -16
	mov	edi, 8
	call	_Znwm
	mov	rbx, rax
.Ltmp0:
	mov	rdi, rbx
	call	_ZN1AC1Ev
.Ltmp1:
	mov	rax, rbx
	add	rsp, 8
	pop	rbx
	pop	r14
	ret
.LBB0_2:
.Ltmp2:
	mov	r14, rax
	mov	rdi, rbx
	call	_ZdlPv
	mov	rdi, r14
	call	_Unwind_Resume
.Lfunc_end0:
	.size	_Z4ctorv, .Lfunc_end0-_Z4ctorv
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2
GCC_except_table0:
.Lexception0:
	.byte	255
	.byte	3
	.byte	41
	.byte	3
	.byte	39
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp0-.Lfunc_begin0
	.long	0
	.byte	0
	.long	.Ltmp0-.Lfunc_begin0
	.long	.Ltmp1-.Ltmp0
	.long	.Ltmp2-.Lfunc_begin0
	.byte	0
	.long	.Ltmp1-.Lfunc_begin0
	.long	.Lfunc_end0-.Ltmp1
	.long	0
	.byte	0
	.p2align	2

	.text
	.globl	_Z4dtorP1A
	.p2align	4, 0x90
	.type	_Z4dtorP1A,@function
_Z4dtorP1A:
	.cfi_startproc
	push	rbx
.Lcfi5:
	.cfi_def_cfa_offset 16
.Lcfi6:
	.cfi_offset rbx, -16
	mov	rbx, rdi
	test	rbx, rbx
	je	.LBB1_1
	mov	rdi, rbx
	call	_ZN1AD1Ev
	mov	rdi, rbx
	pop	rbx
	jmp	_ZdlPv
.LBB1_1:
	pop	rbx
	ret
.Lfunc_end1:
	.size	_Z4dtorP1A, .Lfunc_end1-_Z4dtorP1A
	.cfi_endproc

	.globl	_Z20call_member_functionP1A
	.p2align	4, 0x90
	.type	_Z20call_member_functionP1A,@function
_Z20call_member_functionP1A:
	.cfi_startproc
	mov	rax, qword ptr [rdi]
	jmp	qword ptr [rax]
.Lfunc_end2:
	.size	_Z20call_member_functionP1A, .Lfunc_end2-_Z20call_member_functionP1A
	.cfi_endproc


	.ident	"clang version 5.0.0 (https://chromium.googlesource.com/external/github.com/llvm-mirror/clang e4de58127fa1d8d22ee8043cef9b4d8a807b6cde) (https://chromium.googlesource.com/external/github.com/llvm-mirror/llvm 08b86793476e08fc0937e70058e2a94808c988e7)"
	.section	".note.GNU-stack","",@progbits
