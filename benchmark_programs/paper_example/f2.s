	.text
	.file	"f2.c"
	.section	.text.f,"",@
	.globl	f                       # -- Begin function f
	.type	f,@function
f:                                      # @f
	.functype	f (i32) -> (i32)
# %bb.0:
	local.get	0
	local.get	0
	i32.const	1
	i32.shl 
	i32.add 
                                        # fallthrough-return
	end_function
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
                                        # -- End function
	.ident	"Apple LLVM version 10.0.1 (clang-1001.0.46.4)"
	.section	.custom_section.producers,"",@
	.int8	1
	.int8	12
	.ascii	"processed-by"
	.int8	1
	.int8	10
	.ascii	"Apple LLVM"
	.int8	26
	.ascii	"10.0.1 (clang-1001.0.46.4)"
	.section	.text.f,"",@
