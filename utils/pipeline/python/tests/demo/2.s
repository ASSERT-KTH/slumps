	.text
	.file	"2.ll"
	.section	.text.foo,"",@
	.globl	foo                     # -- Begin function foo
	.type	foo,@function
foo:                                    # @foo
	.functype	foo (i32) -> (i32)
# %bb.0:                                # %entry
	local.get	0
	i32.const	1
	i32.shl 
                                        # fallthrough-return-value
	end_function
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo
                                        # -- End function

