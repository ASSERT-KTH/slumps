	.text
	.file	"paper.c"
	.section	.text.g,"",@
	.globl	g                       # -- Begin function g
	.type	g,@function
g:                                      # @g
	.functype	g (i32) -> (i32)
	.local  	i32
# %bb.0:
	global.get	__stack_pointer@GLOBAL
	i32.const	16
	i32.sub 
	local.tee	1
	local.get	0
	i32.store	12
	block   	
	block   	
	block   	
	block   	
	local.get	1
	i32.load	12
	i32.const	3
	i32.and 
	local.tee	0
	i32.eqz
	br_if   	0               # 0: down to label3
# %bb.1:
	local.get	0
	i32.const	1
	i32.eq  
	br_if   	1               # 1: down to label2
# %bb.2:
	local.get	0
	i32.const	2
	i32.eq  
	br_if   	2               # 2: down to label1
	br      	3               # 3: down to label0
.LBB0_3:
	end_block                       # label3:
	local.get	1
	local.get	1
	i32.load	12
	i32.const	3
	i32.add 
	i32.store	12
	br      	2               # 2: down to label0
.LBB0_4:
	end_block                       # label2:
	local.get	1
	local.get	1
	i32.load	12
	i32.const	2
	i32.add 
	i32.store	12
	br      	1               # 1: down to label0
.LBB0_5:
	end_block                       # label1:
	local.get	1
	local.get	1
	i32.load	12
	i32.const	1
	i32.add 
	i32.store	12
.LBB0_6:
	end_block                       # label0:
	local.get	1
	i32.load	12
	i32.const	3
	i32.and 
                                        # fallthrough-return-value
	end_function
.Lfunc_end0:
	.size	g, .Lfunc_end0-g
                                        # -- End function

	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.globaltype	__stack_pointer, i32
