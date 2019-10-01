	.text
	.file	"infer.ll"
	.section	.text.foo,"",@
	.globl	foo                     # -- Begin function foo
	.type	foo,@function
foo:                                    # @foo
	.functype	foo (i32, i64) -> (i32)
# %bb.0:                                # %entry
	i64.const	135637824071393761
	i64.const	135637824071393761
	local.get	1
	local.get	1
	i64.const	135637824071393761
	i64.gt_u
	i64.select
	local.get	0
	i32.const	1
	i32.and 
	i64.select
	i64.const	135637824071393761
	i64.gt_u
                                        # fallthrough-return-value
	end_function
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo
                                        # -- End function

