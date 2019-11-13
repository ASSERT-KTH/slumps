	.text
	.file	"aes.cpp"
	.section	.text._ZN3AESC2Ei,"",@
	.globl	_ZN3AESC2Ei             # -- Begin function _ZN3AESC2Ei
	.p2align	1
	.type	_ZN3AESC2Ei,@function
_ZN3AESC2Ei:                            # @_ZN3AESC2Ei
	.functype	_ZN3AESC2Ei (i32, i32) -> ()
# %bb.0:                                # %entry
	local.get	0
	i32.const	4
	i32.store	0
	block   	
	block   	
	block   	
	local.get	1
	i32.const	256
	i32.eq  
	br_if   	0               # 0: down to label2
# %bb.1:                                # %entry
	block   	
	local.get	1
	i32.const	192
	i32.eq  
	br_if   	0               # 0: down to label3
# %bb.2:                                # %entry
	local.get	1
	i32.const	128
	i32.ne  
	br_if   	3               # 3: down to label0
# %bb.3:                                # %sw.bb
	local.get	0
	i64.const	42949672964
	i64.store	4:p2align=2
	br      	2               # 2: down to label1
.LBB0_4:                                # %sw.bb2
	end_block                       # label3:
	local.get	0
	i64.const	51539607558
	i64.store	4:p2align=2
	br      	1               # 1: down to label1
.LBB0_5:                                # %sw.bb5
	end_block                       # label2:
	local.get	0
	i64.const	60129542152
	i64.store	4:p2align=2
.LBB0_6:                                # %sw.epilog
	end_block                       # label1:
	local.get	0
	local.get	0
	i32.load	0
	i32.const	2
	i32.shl 
	i64.extend_i32_u
	i64.store32	12
	return
.LBB0_7:                                # %sw.default
	end_block                       # label0:
	i64.const	8
	i32.call	__cxa_allocate_exception@FUNCTION
	local.tee	0
	i32.const	.L.str
	i32.store	0
	local.get	0
	i32.const	_ZTIPKc
	i32.const	0
	call	__cxa_throw@FUNCTION
	unreachable
	end_function
.Lfunc_end0:
	.size	_ZN3AESC2Ei, .Lfunc_end0-_ZN3AESC2Ei
                                        # -- End function
	.section	.text._ZN3AESC1Ei,"",@
	.globl	_ZN3AESC1Ei             # -- Begin function _ZN3AESC1Ei
	.p2align	1
	.type	_ZN3AESC1Ei,@function
_ZN3AESC1Ei:                            # @_ZN3AESC1Ei
	.functype	_ZN3AESC1Ei (i32, i32) -> ()
# %bb.0:                                # %entry
	local.get	0
	local.get	1
	call	_ZN3AESC2Ei@FUNCTION
                                        # fallthrough-return-void
	end_function
.Lfunc_end1:
	.size	_ZN3AESC1Ei, .Lfunc_end1-_ZN3AESC1Ei
                                        # -- End function
	.section	.text._ZN3AES10EncryptECBEPhjS0_Rj,"",@
	.globl	_ZN3AES10EncryptECBEPhjS0_Rj # -- Begin function _ZN3AES10EncryptECBEPhjS0_Rj
	.p2align	1
	.type	_ZN3AES10EncryptECBEPhjS0_Rj,@function
_ZN3AES10EncryptECBEPhjS0_Rj:           # @_ZN3AES10EncryptECBEPhjS0_Rj
	.functype	_ZN3AES10EncryptECBEPhjS0_Rj (i32, i32, i32, i32, i32) -> (i32)
	.local  	i32
# %bb.0:                                # %entry
	local.get	4
	local.get	0
	local.get	2
	i32.call	_ZN3AES16GetPaddingLengthEj@FUNCTION
	local.tee	5
	i32.store	0
	local.get	0
	local.get	1
	local.get	2
	local.get	5
	i32.call	_ZN3AES12PaddingNullsEPhjj@FUNCTION
	local.set	1
	local.get	4
	i64.load32_u	0
	i32.call	_Znam@FUNCTION
	local.set	5
	i32.const	0
	local.set	2
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label5:
	local.get	2
	local.get	4
	i32.load	0
	i32.ge_u
	br_if   	1               # 1: down to label4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	local.get	0
	local.get	1
	local.get	2
	i32.add 
	local.get	5
	local.get	2
	i32.add 
	local.get	3
	call	_ZN3AES12EncryptBlockEPhS0_S0_@FUNCTION
	local.get	2
	local.get	0
	i32.load	12
	i32.add 
	local.set	2
	br      	0               # 0: up to label5
.LBB2_3:                                # %for.end
	end_loop
	end_block                       # label4:
	block   	
	local.get	1
	i32.eqz
	br_if   	0               # 0: down to label6
# %bb.4:                                # %delete.notnull
	local.get	1
	call	_ZdaPv@FUNCTION
.LBB2_5:                                # %delete.end
	end_block                       # label6:
	local.get	5
                                        # fallthrough-return-value
	end_function
.Lfunc_end2:
	.size	_ZN3AES10EncryptECBEPhjS0_Rj, .Lfunc_end2-_ZN3AES10EncryptECBEPhjS0_Rj
                                        # -- End function
	.section	.text._ZN3AES16GetPaddingLengthEj,"",@
	.globl	_ZN3AES16GetPaddingLengthEj # -- Begin function _ZN3AES16GetPaddingLengthEj
	.p2align	1
	.type	_ZN3AES16GetPaddingLengthEj,@function
_ZN3AES16GetPaddingLengthEj:            # @_ZN3AES16GetPaddingLengthEj
	.functype	_ZN3AES16GetPaddingLengthEj (i32, i32) -> (i32)
	.local  	i32, i32
# %bb.0:                                # %entry
	local.get	1
	local.get	0
	i32.load	12
	local.tee	2
	i32.div_u
	local.set	3
	block   	
	local.get	1
	local.get	2
	i32.rem_u
	i32.eqz
	br_if   	0               # 0: down to label7
# %bb.1:                                # %if.then
	local.get	3
	i32.const	1
	i32.add 
	local.set	3
.LBB3_2:                                # %if.end
	end_block                       # label7:
	local.get	3
	local.get	0
	i32.load	12
	i32.mul 
                                        # fallthrough-return-value
	end_function
.Lfunc_end3:
	.size	_ZN3AES16GetPaddingLengthEj, .Lfunc_end3-_ZN3AES16GetPaddingLengthEj
                                        # -- End function
	.section	.text._ZN3AES12PaddingNullsEPhjj,"",@
	.globl	_ZN3AES12PaddingNullsEPhjj # -- Begin function _ZN3AES12PaddingNullsEPhjj
	.p2align	1
	.type	_ZN3AES12PaddingNullsEPhjj,@function
_ZN3AES12PaddingNullsEPhjj:             # @_ZN3AES12PaddingNullsEPhjj
	.functype	_ZN3AES12PaddingNullsEPhjj (i32, i32, i32, i32) -> (i32)
# %bb.0:                                # %entry
	local.get	3
	i64.extend_i32_u
	i32.call	_Znam@FUNCTION
	local.get	1
	local.get	2
	i32.call	memcpy@FUNCTION
	local.tee	1
	local.get	2
	i32.add 
	i32.const	0
	local.get	3
	local.get	2
	i32.sub 
	i32.call	memset@FUNCTION
	drop
	local.get	1
                                        # fallthrough-return-value
	end_function
.Lfunc_end4:
	.size	_ZN3AES12PaddingNullsEPhjj, .Lfunc_end4-_ZN3AES12PaddingNullsEPhjj
                                        # -- End function
	.section	.text._ZN3AES12EncryptBlockEPhS0_S0_,"",@
	.globl	_ZN3AES12EncryptBlockEPhS0_S0_ # -- Begin function _ZN3AES12EncryptBlockEPhS0_S0_
	.p2align	1
	.type	_ZN3AES12EncryptBlockEPhS0_S0_,@function
_ZN3AES12EncryptBlockEPhS0_S0_:         # @_ZN3AES12EncryptBlockEPhS0_S0_
	.functype	_ZN3AES12EncryptBlockEPhS0_S0_ (i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, i32, i32, i32
# %bb.0:                                # %entry
	local.get	0
	local.get	3
	local.get	0
	i32.load	0
	local.get	0
	i32.load	8
	i32.const	1
	i32.add 
	i32.mul 
	i32.const	2
	i32.shl 
	i64.extend_i32_s
	i32.call	_Znam@FUNCTION
	local.tee	4
	call	_ZN3AES12KeyExpansionEPhS0_@FUNCTION
	i64.const	32
	i32.call	_Znam@FUNCTION
	local.tee	3
	local.get	0
	i32.load	0
	i32.const	2
	i32.shl 
	i64.extend_i32_s
	i32.call	_Znam@FUNCTION
	i32.store	0
	i32.const	0
	local.set	5
	local.get	3
	local.set	6
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label8
.LBB5_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label9:
	local.get	6
	local.get	3
	i32.load	0
	local.get	0
	i32.load	0
	local.get	5
	i32.mul 
	i32.add 
	i32.store	0
	local.get	6
	i32.const	4
	i32.add 
	local.set	6
	local.get	5
	i32.const	1
	i32.add 
	local.tee	5
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label9
.LBB5_2:                                # %for.end
	end_loop
	end_block                       # label8:
	i32.const	0
	local.set	7
	block   	
	block   	
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label12
# %bb.3:
	i32.const	0
	local.set	8
	br      	1               # 1: down to label11
.LBB5_4:
	end_block                       # label12:
	i32.const	0
	local.set	5
	br      	1               # 1: down to label10
.LBB5_5:
	end_block                       # label11:
	i32.const	1
	local.set	5
.LBB5_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_16 Depth 2
                                        #     Child Loop BB5_13 Depth 2
                                        #     Child Loop BB5_8 Depth 2
	end_block                       # label10:
	loop    	                # label13:
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	local.get	5
	br_table 	{0, 1, 1}       # 1: down to label19
.LBB5_7:                                # %for.end32
                                        #   in Loop: Header=BB5_6 Depth=1
	end_block                       # label20:
	local.get	0
	local.get	3
	local.get	4
	call	_ZN3AES11AddRoundKeyEPPhS0_@FUNCTION
	i32.const	4
	local.set	6
	i32.const	1
	local.set	5
.LBB5_8:                                # %for.cond33
                                        #   Parent Loop BB5_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	block   	
	loop    	                # label22:
	local.get	5
	local.get	0
	i32.load	8
	i32.const	-1
	i32.add 
	i32.gt_s
	br_if   	1               # 1: down to label21
# %bb.9:                                # %for.body36
                                        #   in Loop: Header=BB5_8 Depth=2
	local.get	0
	local.get	3
	call	_ZN3AES8SubBytesEPPh@FUNCTION
	local.get	0
	local.get	3
	call	_ZN3AES9ShiftRowsEPPh@FUNCTION
	local.get	0
	local.get	3
	call	_ZN3AES10MixColumnsEPPh@FUNCTION
	local.get	0
	local.get	3
	local.get	4
	local.get	6
	local.get	0
	i32.load	0
	i32.mul 
	i32.add 
	call	_ZN3AES11AddRoundKeyEPPhS0_@FUNCTION
	local.get	6
	i32.const	4
	i32.add 
	local.set	6
	local.get	5
	i32.const	1
	i32.add 
	local.set	5
	br      	0               # 0: up to label22
.LBB5_10:                               # %for.end44
                                        #   in Loop: Header=BB5_6 Depth=1
	end_loop
	end_block                       # label21:
	local.get	0
	local.get	3
	call	_ZN3AES8SubBytesEPPh@FUNCTION
	local.get	0
	local.get	3
	call	_ZN3AES9ShiftRowsEPPh@FUNCTION
	i32.const	2
	local.set	9
	local.get	0
	local.get	3
	local.get	4
	local.get	0
	i32.load	8
	local.get	0
	i32.load	0
	i32.mul 
	i32.const	2
	i32.shl 
	i32.add 
	call	_ZN3AES11AddRoundKeyEPPhS0_@FUNCTION
	i32.const	0
	local.set	10
	i32.const	3
	local.set	11
	i32.const	4
	local.set	12
	i32.const	1
	local.set	13
	i32.const	0
	i32.const	3
	i32.le_s
	br_if   	1               # 1: down to label18
	br      	3               # 3: down to label16
.LBB5_11:                               #   in Loop: Header=BB5_6 Depth=1
	end_block                       # label19:
	block   	
	block   	
	local.get	8
	br_table 	{0, 1, 1}       # 1: down to label23
.LBB5_12:                               # %for.body14
                                        #   in Loop: Header=BB5_6 Depth=1
	end_block                       # label24:
	i32.const	0
	local.set	5
	local.get	7
	local.set	6
.LBB5_13:                               # %for.cond15
                                        #   Parent Loop BB5_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label25:
	local.get	5
	local.get	0
	i32.load	0
	i32.ge_s
	br_if   	6               # 6: down to label14
# %bb.14:                               # %for.body18
                                        #   in Loop: Header=BB5_13 Depth=2
	local.get	3
	local.get	7
	i32.const	2
	i32.shl 
	i32.add 
	i32.load	0
	local.get	5
	i32.add 
	local.get	1
	local.get	6
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	6
	i32.const	4
	i32.add 
	local.set	6
	local.get	5
	i32.const	1
	i32.add 
	local.set	5
	br      	0               # 0: up to label25
.LBB5_15:                               # %for.body53
                                        #   in Loop: Header=BB5_6 Depth=1
	end_loop
	end_block                       # label23:
	i32.const	0
	local.set	5
	local.get	10
	local.set	6
.LBB5_16:                               # %for.cond54
                                        #   Parent Loop BB5_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label26:
	local.get	5
	local.get	0
	i32.load	0
	i32.ge_s
	br_if   	2               # 2: down to label17
# %bb.17:                               # %for.body57
                                        #   in Loop: Header=BB5_16 Depth=2
	local.get	2
	local.get	6
	i32.add 
	local.get	3
	local.get	10
	local.get	9
	i32.shl 
	i32.add 
	i32.load	0
	local.get	5
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	6
	local.get	12
	i32.add 
	local.set	6
	local.get	5
	local.get	13
	i32.add 
	local.set	5
	br      	0               # 0: up to label26
.LBB5_18:                               #   in Loop: Header=BB5_6 Depth=1
	end_loop
	end_block                       # label18:
	i32.const	1
	local.set	8
# %bb.19:                               #   in Loop: Header=BB5_6 Depth=1
	i32.const	1
	local.set	5
	br      	4               # 4: up to label13
.LBB5_20:                               # %for.end68
                                        #   in Loop: Header=BB5_6 Depth=1
	end_block                       # label17:
	local.get	10
	local.get	13
	i32.add 
	local.tee	10
	local.get	11
	i32.gt_s
	br_if   	0               # 0: down to label16
# %bb.21:                               #   in Loop: Header=BB5_6 Depth=1
	i32.const	1
	local.set	8
	br      	1               # 1: down to label15
.LBB5_22:                               # %for.end71
	end_block                       # label16:
	block   	
	local.get	3
	i32.load	0
	local.tee	0
	i32.eqz
	br_if   	0               # 0: down to label27
# %bb.23:                               # %delete.notnull
	local.get	0
	call	_ZdaPv@FUNCTION
.LBB5_24:                               # %delete.end
	end_block                       # label27:
	block   	
	local.get	3
	i32.eqz
	br_if   	0               # 0: down to label28
# %bb.25:                               # %delete.notnull74
	local.get	3
	call	_ZdaPv@FUNCTION
.LBB5_26:                               # %delete.end75
	end_block                       # label28:
	block   	
	local.get	4
	i32.eqz
	br_if   	0               # 0: down to label29
# %bb.27:                               # %delete.notnull77
	local.get	4
	call	_ZdaPv@FUNCTION
.LBB5_28:                               # %delete.end78
	end_block                       # label29:
	return
.LBB5_29:                               #   in Loop: Header=BB5_6 Depth=1
	end_block                       # label15:
	i32.const	1
	local.set	5
	br      	1               # 1: up to label13
.LBB5_30:                               # %for.end29
                                        #   in Loop: Header=BB5_6 Depth=1
	end_block                       # label14:
	block   	
	block   	
	local.get	7
	i32.const	1
	i32.add 
	local.tee	7
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label31
# %bb.31:                               #   in Loop: Header=BB5_6 Depth=1
	i32.const	0
	local.set	8
	br      	1               # 1: down to label30
.LBB5_32:                               #   in Loop: Header=BB5_6 Depth=1
	end_block                       # label31:
	i32.const	0
	local.set	5
	br      	1               # 1: up to label13
.LBB5_33:                               #   in Loop: Header=BB5_6 Depth=1
	end_block                       # label30:
	i32.const	1
	local.set	5
	br      	0               # 0: up to label13
.LBB5_34:
	end_loop
	end_function
.Lfunc_end5:
	.size	_ZN3AES12EncryptBlockEPhS0_S0_, .Lfunc_end5-_ZN3AES12EncryptBlockEPhS0_S0_
                                        # -- End function
	.section	.text._ZN3AES10DecryptECBEPhjS0_,"",@
	.globl	_ZN3AES10DecryptECBEPhjS0_ # -- Begin function _ZN3AES10DecryptECBEPhjS0_
	.p2align	1
	.type	_ZN3AES10DecryptECBEPhjS0_,@function
_ZN3AES10DecryptECBEPhjS0_:             # @_ZN3AES10DecryptECBEPhjS0_
	.functype	_ZN3AES10DecryptECBEPhjS0_ (i32, i32, i32, i32) -> (i32)
	.local  	i32, i32
# %bb.0:                                # %entry
	local.get	2
	i64.extend_i32_u
	i32.call	_Znam@FUNCTION
	local.set	4
	i32.const	0
	local.set	5
	block   	
	i32.const	0
	local.get	2
	i32.ge_u
	br_if   	0               # 0: down to label32
.LBB6_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label33:
	local.get	0
	local.get	1
	local.get	5
	i32.add 
	local.get	4
	local.get	5
	i32.add 
	local.get	3
	call	_ZN3AES12DecryptBlockEPhS0_S0_@FUNCTION
	local.get	5
	local.get	0
	i32.load	12
	i32.add 
	local.tee	5
	local.get	2
	i32.lt_u
	br_if   	0               # 0: up to label33
.LBB6_2:                                # %for.end
	end_loop
	end_block                       # label32:
	local.get	4
                                        # fallthrough-return-value
	end_function
.Lfunc_end6:
	.size	_ZN3AES10DecryptECBEPhjS0_, .Lfunc_end6-_ZN3AES10DecryptECBEPhjS0_
                                        # -- End function
	.section	.text._ZN3AES12DecryptBlockEPhS0_S0_,"",@
	.globl	_ZN3AES12DecryptBlockEPhS0_S0_ # -- Begin function _ZN3AES12DecryptBlockEPhS0_S0_
	.p2align	1
	.type	_ZN3AES12DecryptBlockEPhS0_S0_,@function
_ZN3AES12DecryptBlockEPhS0_S0_:         # @_ZN3AES12DecryptBlockEPhS0_S0_
	.functype	_ZN3AES12DecryptBlockEPhS0_S0_ (i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, i32, i32, i32
# %bb.0:                                # %entry
	local.get	0
	local.get	3
	local.get	0
	i32.load	0
	local.get	0
	i32.load	8
	i32.const	1
	i32.add 
	i32.mul 
	i32.const	2
	i32.shl 
	i64.extend_i32_s
	i32.call	_Znam@FUNCTION
	local.tee	4
	call	_ZN3AES12KeyExpansionEPhS0_@FUNCTION
	i64.const	32
	i32.call	_Znam@FUNCTION
	local.tee	3
	local.get	0
	i32.load	0
	i32.const	2
	i32.shl 
	i64.extend_i32_s
	i32.call	_Znam@FUNCTION
	i32.store	0
	i32.const	0
	local.set	5
	local.get	3
	local.set	6
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label34
.LBB7_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label35:
	local.get	6
	local.get	3
	i32.load	0
	local.get	0
	i32.load	0
	local.get	5
	i32.mul 
	i32.add 
	i32.store	0
	local.get	6
	i32.const	4
	i32.add 
	local.set	6
	local.get	5
	i32.const	1
	i32.add 
	local.tee	5
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label35
.LBB7_2:                                # %for.end
	end_loop
	end_block                       # label34:
	i32.const	0
	local.set	7
	block   	
	block   	
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label38
# %bb.3:
	i32.const	0
	local.set	8
	br      	1               # 1: down to label37
.LBB7_4:
	end_block                       # label38:
	i32.const	0
	local.set	5
	br      	1               # 1: down to label36
.LBB7_5:
	end_block                       # label37:
	i32.const	1
	local.set	5
.LBB7_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_15 Depth 2
                                        #     Child Loop BB7_12 Depth 2
                                        #     Child Loop BB7_8 Depth 2
	end_block                       # label36:
	loop    	                # label39:
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	block   	
	local.get	5
	br_table 	{0, 1, 1}       # 1: down to label45
.LBB7_7:                                # %for.end32
                                        #   in Loop: Header=BB7_6 Depth=1
	end_block                       # label46:
	local.get	0
	local.get	3
	local.get	4
	local.get	0
	i32.load	8
	local.get	0
	i32.load	0
	i32.mul 
	i32.const	2
	i32.shl 
	i32.add 
	call	_ZN3AES11AddRoundKeyEPPhS0_@FUNCTION
	local.get	0
	i32.load	8
	local.tee	6
	i32.const	2
	i32.shl 
	i32.const	-4
	i32.add 
	local.set	5
	block   	
	local.get	6
	i32.const	-1
	i32.add 
	local.tee	6
	i32.const	1
	i32.lt_s
	br_if   	0               # 0: down to label47
.LBB7_8:                                # %for.body42
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label48:
	local.get	0
	local.get	3
	call	_ZN3AES11InvSubBytesEPPh@FUNCTION
	local.get	0
	local.get	3
	call	_ZN3AES12InvShiftRowsEPPh@FUNCTION
	local.get	0
	local.get	3
	local.get	4
	local.get	5
	local.get	0
	i32.load	0
	i32.mul 
	i32.add 
	call	_ZN3AES11AddRoundKeyEPPhS0_@FUNCTION
	local.get	0
	local.get	3
	call	_ZN3AES13InvMixColumnsEPPh@FUNCTION
	local.get	5
	i32.const	-4
	i32.add 
	local.set	5
	local.get	6
	i32.const	-1
	i32.add 
	local.tee	6
	i32.const	1
	i32.ge_s
	br_if   	0               # 0: up to label48
.LBB7_9:                                # %for.end49
                                        #   in Loop: Header=BB7_6 Depth=1
	end_loop
	end_block                       # label47:
	local.get	0
	local.get	3
	call	_ZN3AES11InvSubBytesEPPh@FUNCTION
	local.get	0
	local.get	3
	call	_ZN3AES12InvShiftRowsEPPh@FUNCTION
	local.get	0
	local.get	3
	local.get	4
	call	_ZN3AES11AddRoundKeyEPPhS0_@FUNCTION
	i32.const	0
	local.set	9
	i32.const	3
	local.set	10
	i32.const	2
	local.set	11
	i32.const	4
	local.set	12
	i32.const	1
	local.set	13
	i32.const	0
	i32.const	3
	i32.le_s
	br_if   	1               # 1: down to label44
	br      	3               # 3: down to label42
.LBB7_10:                               #   in Loop: Header=BB7_6 Depth=1
	end_block                       # label45:
	block   	
	block   	
	local.get	8
	br_table 	{0, 1, 1}       # 1: down to label49
.LBB7_11:                               # %for.body14
                                        #   in Loop: Header=BB7_6 Depth=1
	end_block                       # label50:
	i32.const	0
	local.set	5
	local.get	7
	local.set	6
.LBB7_12:                               # %for.cond15
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label51:
	local.get	5
	local.get	0
	i32.load	0
	i32.ge_s
	br_if   	6               # 6: down to label40
# %bb.13:                               # %for.body18
                                        #   in Loop: Header=BB7_12 Depth=2
	local.get	3
	local.get	7
	i32.const	2
	i32.shl 
	i32.add 
	i32.load	0
	local.get	5
	i32.add 
	local.get	1
	local.get	6
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	6
	i32.const	4
	i32.add 
	local.set	6
	local.get	5
	i32.const	1
	i32.add 
	local.set	5
	br      	0               # 0: up to label51
.LBB7_14:                               # %for.body52
                                        #   in Loop: Header=BB7_6 Depth=1
	end_loop
	end_block                       # label49:
	i32.const	0
	local.set	5
	local.get	9
	local.set	6
.LBB7_15:                               # %for.cond53
                                        #   Parent Loop BB7_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label52:
	local.get	5
	local.get	0
	i32.load	0
	i32.ge_s
	br_if   	2               # 2: down to label43
# %bb.16:                               # %for.body56
                                        #   in Loop: Header=BB7_15 Depth=2
	local.get	2
	local.get	6
	i32.add 
	local.get	3
	local.get	9
	local.get	11
	i32.shl 
	i32.add 
	i32.load	0
	local.get	5
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	6
	local.get	12
	i32.add 
	local.set	6
	local.get	5
	local.get	13
	i32.add 
	local.set	5
	br      	0               # 0: up to label52
.LBB7_17:                               #   in Loop: Header=BB7_6 Depth=1
	end_loop
	end_block                       # label44:
	i32.const	1
	local.set	8
# %bb.18:                               #   in Loop: Header=BB7_6 Depth=1
	i32.const	1
	local.set	5
	br      	4               # 4: up to label39
.LBB7_19:                               # %for.end67
                                        #   in Loop: Header=BB7_6 Depth=1
	end_block                       # label43:
	local.get	9
	local.get	13
	i32.add 
	local.tee	9
	local.get	10
	i32.gt_s
	br_if   	0               # 0: down to label42
# %bb.20:                               #   in Loop: Header=BB7_6 Depth=1
	i32.const	1
	local.set	8
	br      	1               # 1: down to label41
.LBB7_21:                               # %for.end70
	end_block                       # label42:
	block   	
	local.get	3
	i32.load	0
	local.tee	0
	i32.eqz
	br_if   	0               # 0: down to label53
# %bb.22:                               # %delete.notnull
	local.get	0
	call	_ZdaPv@FUNCTION
.LBB7_23:                               # %delete.end
	end_block                       # label53:
	block   	
	local.get	3
	i32.eqz
	br_if   	0               # 0: down to label54
# %bb.24:                               # %delete.notnull73
	local.get	3
	call	_ZdaPv@FUNCTION
.LBB7_25:                               # %delete.end74
	end_block                       # label54:
	block   	
	local.get	4
	i32.eqz
	br_if   	0               # 0: down to label55
# %bb.26:                               # %delete.notnull76
	local.get	4
	call	_ZdaPv@FUNCTION
.LBB7_27:                               # %delete.end77
	end_block                       # label55:
	return
.LBB7_28:                               #   in Loop: Header=BB7_6 Depth=1
	end_block                       # label41:
	i32.const	1
	local.set	5
	br      	1               # 1: up to label39
.LBB7_29:                               # %for.end29
                                        #   in Loop: Header=BB7_6 Depth=1
	end_block                       # label40:
	block   	
	block   	
	local.get	7
	i32.const	1
	i32.add 
	local.tee	7
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label57
# %bb.30:                               #   in Loop: Header=BB7_6 Depth=1
	i32.const	0
	local.set	8
	br      	1               # 1: down to label56
.LBB7_31:                               #   in Loop: Header=BB7_6 Depth=1
	end_block                       # label57:
	i32.const	0
	local.set	5
	br      	1               # 1: up to label39
.LBB7_32:                               #   in Loop: Header=BB7_6 Depth=1
	end_block                       # label56:
	i32.const	1
	local.set	5
	br      	0               # 0: up to label39
.LBB7_33:
	end_loop
	end_function
.Lfunc_end7:
	.size	_ZN3AES12DecryptBlockEPhS0_S0_, .Lfunc_end7-_ZN3AES12DecryptBlockEPhS0_S0_
                                        # -- End function
	.section	.text._ZN3AES10EncryptCBCEPhjS0_S0_Rj,"",@
	.globl	_ZN3AES10EncryptCBCEPhjS0_S0_Rj # -- Begin function _ZN3AES10EncryptCBCEPhjS0_S0_Rj
	.p2align	1
	.type	_ZN3AES10EncryptCBCEPhjS0_S0_Rj,@function
_ZN3AES10EncryptCBCEPhjS0_S0_Rj:        # @_ZN3AES10EncryptCBCEPhjS0_S0_Rj
	.functype	_ZN3AES10EncryptCBCEPhjS0_S0_Rj (i32, i32, i32, i32, i32, i32) -> (i32)
	.local  	i32, i32
# %bb.0:                                # %entry
	local.get	5
	local.get	0
	local.get	2
	i32.call	_ZN3AES16GetPaddingLengthEj@FUNCTION
	local.tee	6
	i32.store	0
	local.get	0
	local.get	1
	local.get	2
	local.get	6
	i32.call	_ZN3AES12PaddingNullsEPhjj@FUNCTION
	local.set	6
	local.get	5
	i64.load32_u	0
	i32.call	_Znam@FUNCTION
	local.set	7
	local.get	0
	i64.load32_u	12
	i32.call	_Znam@FUNCTION
	local.get	4
	local.get	0
	i32.load	12
	i32.call	memcpy@FUNCTION
	local.set	4
	i32.const	0
	local.set	2
.LBB8_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label59:
	local.get	2
	local.get	5
	i32.load	0
	i32.ge_u
	br_if   	1               # 1: down to label58
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB8_1 Depth=1
	local.get	0
	local.get	4
	local.get	6
	local.get	2
	i32.add 
	local.get	4
	local.get	0
	i32.load	12
	call	_ZN3AES9XorBlocksEPhS0_S0_j@FUNCTION
	local.get	0
	local.get	4
	local.get	7
	local.get	2
	i32.add 
	local.tee	1
	local.get	3
	call	_ZN3AES12EncryptBlockEPhS0_S0_@FUNCTION
	local.get	4
	local.get	1
	local.get	0
	i32.load	12
	i32.call	memcpy@FUNCTION
	drop
	local.get	2
	local.get	0
	i32.load	12
	i32.add 
	local.set	2
	br      	0               # 0: up to label59
.LBB8_3:                                # %for.end
	end_loop
	end_block                       # label58:
	block   	
	local.get	4
	i32.eqz
	br_if   	0               # 0: down to label60
# %bb.4:                                # %delete.notnull
	local.get	4
	call	_ZdaPv@FUNCTION
.LBB8_5:                                # %delete.end
	end_block                       # label60:
	block   	
	local.get	6
	i32.eqz
	br_if   	0               # 0: down to label61
# %bb.6:                                # %delete.notnull17
	local.get	6
	call	_ZdaPv@FUNCTION
.LBB8_7:                                # %delete.end18
	end_block                       # label61:
	local.get	7
                                        # fallthrough-return-value
	end_function
.Lfunc_end8:
	.size	_ZN3AES10EncryptCBCEPhjS0_S0_Rj, .Lfunc_end8-_ZN3AES10EncryptCBCEPhjS0_S0_Rj
                                        # -- End function
	.section	.text._ZN3AES9XorBlocksEPhS0_S0_j,"",@
	.globl	_ZN3AES9XorBlocksEPhS0_S0_j # -- Begin function _ZN3AES9XorBlocksEPhS0_S0_j
	.p2align	1
	.type	_ZN3AES9XorBlocksEPhS0_S0_j,@function
_ZN3AES9XorBlocksEPhS0_S0_j:            # @_ZN3AES9XorBlocksEPhS0_S0_j
	.functype	_ZN3AES9XorBlocksEPhS0_S0_j (i32, i32, i32, i32, i32) -> ()
	.local  	i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	5
	block   	
	i32.const	0
	local.get	4
	i32.ge_u
	br_if   	0               # 0: down to label62
.LBB9_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label63:
	local.get	3
	local.get	5
	i32.add 
	local.get	1
	local.get	5
	i32.add 
	i32.load8_u	0
	local.get	2
	local.get	5
	i32.add 
	i32.load8_u	0
	i32.xor 
	i32.store8	0
	local.get	5
	i32.const	1
	i32.add 
	local.tee	5
	local.get	4
	i32.lt_u
	br_if   	0               # 0: up to label63
.LBB9_2:                                # %for.end
	end_loop
	end_block                       # label62:
                                        # fallthrough-return-void
	end_function
.Lfunc_end9:
	.size	_ZN3AES9XorBlocksEPhS0_S0_j, .Lfunc_end9-_ZN3AES9XorBlocksEPhS0_S0_j
                                        # -- End function
	.section	.text._ZN3AES10DecryptCBCEPhjS0_S0_,"",@
	.globl	_ZN3AES10DecryptCBCEPhjS0_S0_ # -- Begin function _ZN3AES10DecryptCBCEPhjS0_S0_
	.p2align	1
	.type	_ZN3AES10DecryptCBCEPhjS0_S0_,@function
_ZN3AES10DecryptCBCEPhjS0_S0_:          # @_ZN3AES10DecryptCBCEPhjS0_S0_
	.functype	_ZN3AES10DecryptCBCEPhjS0_S0_ (i32, i32, i32, i32, i32) -> (i32)
	.local  	i32, i32, i32, i32
# %bb.0:                                # %entry
	local.get	2
	i64.extend_i32_u
	i32.call	_Znam@FUNCTION
	local.set	5
	local.get	0
	i64.load32_u	12
	i32.call	_Znam@FUNCTION
	local.get	4
	local.get	0
	i32.load	12
	i32.call	memcpy@FUNCTION
	local.set	6
	i32.const	0
	local.set	4
	block   	
	i32.const	0
	local.get	2
	i32.ge_u
	br_if   	0               # 0: down to label64
.LBB10_1:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label65:
	local.get	0
	local.get	1
	local.get	4
	i32.add 
	local.tee	7
	local.get	5
	local.get	4
	i32.add 
	local.tee	8
	local.get	3
	call	_ZN3AES12DecryptBlockEPhS0_S0_@FUNCTION
	local.get	0
	local.get	6
	local.get	8
	local.get	8
	local.get	0
	i32.load	12
	call	_ZN3AES9XorBlocksEPhS0_S0_j@FUNCTION
	local.get	6
	local.get	7
	local.get	0
	i32.load	12
	i32.call	memcpy@FUNCTION
	drop
	local.get	4
	local.get	0
	i32.load	12
	i32.add 
	local.tee	4
	local.get	2
	i32.lt_u
	br_if   	0               # 0: up to label65
.LBB10_2:                               # %for.end
	end_loop
	end_block                       # label64:
	block   	
	local.get	6
	i32.eqz
	br_if   	0               # 0: down to label66
# %bb.3:                                # %delete.notnull
	local.get	6
	call	_ZdaPv@FUNCTION
.LBB10_4:                               # %delete.end
	end_block                       # label66:
	local.get	5
                                        # fallthrough-return-value
	end_function
.Lfunc_end10:
	.size	_ZN3AES10DecryptCBCEPhjS0_S0_, .Lfunc_end10-_ZN3AES10DecryptCBCEPhjS0_S0_
                                        # -- End function
	.section	.text._ZN3AES10EncryptCFBEPhjS0_S0_Rj,"",@
	.globl	_ZN3AES10EncryptCFBEPhjS0_S0_Rj # -- Begin function _ZN3AES10EncryptCFBEPhjS0_S0_Rj
	.p2align	1
	.type	_ZN3AES10EncryptCFBEPhjS0_S0_Rj,@function
_ZN3AES10EncryptCFBEPhjS0_S0_Rj:        # @_ZN3AES10EncryptCFBEPhjS0_S0_Rj
	.functype	_ZN3AES10EncryptCFBEPhjS0_S0_Rj (i32, i32, i32, i32, i32, i32) -> (i32)
	.local  	i32, i32, i32
# %bb.0:                                # %entry
	local.get	5
	local.get	0
	local.get	2
	i32.call	_ZN3AES16GetPaddingLengthEj@FUNCTION
	local.tee	6
	i32.store	0
	local.get	0
	local.get	1
	local.get	2
	local.get	6
	i32.call	_ZN3AES12PaddingNullsEPhjj@FUNCTION
	local.set	7
	local.get	5
	i64.load32_u	0
	i32.call	_Znam@FUNCTION
	local.set	8
	local.get	0
	i64.load32_u	12
	i32.call	_Znam@FUNCTION
	local.set	2
	local.get	0
	i64.load32_u	12
	i32.call	_Znam@FUNCTION
	local.set	1
	local.get	2
	local.get	4
	local.get	0
	i32.load	12
	i32.call	memcpy@FUNCTION
	local.set	4
	i32.const	0
	local.set	2
.LBB11_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label68:
	local.get	2
	local.get	5
	i32.load	0
	i32.ge_u
	br_if   	1               # 1: down to label67
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB11_1 Depth=1
	local.get	0
	local.get	4
	local.get	1
	local.get	3
	call	_ZN3AES12EncryptBlockEPhS0_S0_@FUNCTION
	local.get	0
	local.get	7
	local.get	2
	i32.add 
	local.get	1
	local.get	8
	local.get	2
	i32.add 
	local.tee	6
	local.get	0
	i32.load	12
	call	_ZN3AES9XorBlocksEPhS0_S0_j@FUNCTION
	local.get	4
	local.get	6
	local.get	0
	i32.load	12
	i32.call	memcpy@FUNCTION
	drop
	local.get	2
	local.get	0
	i32.load	12
	i32.add 
	local.set	2
	br      	0               # 0: up to label68
.LBB11_3:                               # %for.end
	end_loop
	end_block                       # label67:
	block   	
	local.get	4
	i32.eqz
	br_if   	0               # 0: down to label69
# %bb.4:                                # %delete.notnull
	local.get	4
	call	_ZdaPv@FUNCTION
.LBB11_5:                               # %delete.end
	end_block                       # label69:
	block   	
	local.get	1
	i32.eqz
	br_if   	0               # 0: down to label70
# %bb.6:                                # %delete.notnull20
	local.get	1
	call	_ZdaPv@FUNCTION
.LBB11_7:                               # %delete.end21
	end_block                       # label70:
	block   	
	local.get	7
	i32.eqz
	br_if   	0               # 0: down to label71
# %bb.8:                                # %delete.notnull23
	local.get	7
	call	_ZdaPv@FUNCTION
.LBB11_9:                               # %delete.end24
	end_block                       # label71:
	local.get	8
                                        # fallthrough-return-value
	end_function
.Lfunc_end11:
	.size	_ZN3AES10EncryptCFBEPhjS0_S0_Rj, .Lfunc_end11-_ZN3AES10EncryptCFBEPhjS0_S0_Rj
                                        # -- End function
	.section	.text._ZN3AES10DecryptCFBEPhjS0_S0_,"",@
	.globl	_ZN3AES10DecryptCFBEPhjS0_S0_ # -- Begin function _ZN3AES10DecryptCFBEPhjS0_S0_
	.p2align	1
	.type	_ZN3AES10DecryptCFBEPhjS0_S0_,@function
_ZN3AES10DecryptCFBEPhjS0_S0_:          # @_ZN3AES10DecryptCFBEPhjS0_S0_
	.functype	_ZN3AES10DecryptCFBEPhjS0_S0_ (i32, i32, i32, i32, i32) -> (i32)
	.local  	i32, i32, i32, i32
# %bb.0:                                # %entry
	local.get	2
	i64.extend_i32_u
	i32.call	_Znam@FUNCTION
	local.set	5
	local.get	0
	i64.load32_u	12
	i32.call	_Znam@FUNCTION
	local.set	6
	local.get	0
	i64.load32_u	12
	i32.call	_Znam@FUNCTION
	local.set	7
	local.get	6
	local.get	4
	local.get	0
	i32.load	12
	i32.call	memcpy@FUNCTION
	local.set	6
	i32.const	0
	local.set	4
	block   	
	i32.const	0
	local.get	2
	i32.ge_u
	br_if   	0               # 0: down to label72
.LBB12_1:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label73:
	local.get	0
	local.get	6
	local.get	7
	local.get	3
	call	_ZN3AES12EncryptBlockEPhS0_S0_@FUNCTION
	local.get	0
	local.get	1
	local.get	4
	i32.add 
	local.tee	8
	local.get	7
	local.get	5
	local.get	4
	i32.add 
	local.get	0
	i32.load	12
	call	_ZN3AES9XorBlocksEPhS0_S0_j@FUNCTION
	local.get	6
	local.get	8
	local.get	0
	i32.load	12
	i32.call	memcpy@FUNCTION
	drop
	local.get	4
	local.get	0
	i32.load	12
	i32.add 
	local.tee	4
	local.get	2
	i32.lt_u
	br_if   	0               # 0: up to label73
.LBB12_2:                               # %for.end
	end_loop
	end_block                       # label72:
	block   	
	local.get	6
	i32.eqz
	br_if   	0               # 0: down to label74
# %bb.3:                                # %delete.notnull
	local.get	6
	call	_ZdaPv@FUNCTION
.LBB12_4:                               # %delete.end
	end_block                       # label74:
	block   	
	local.get	7
	i32.eqz
	br_if   	0               # 0: down to label75
# %bb.5:                                # %delete.notnull18
	local.get	7
	call	_ZdaPv@FUNCTION
.LBB12_6:                               # %delete.end19
	end_block                       # label75:
	local.get	5
                                        # fallthrough-return-value
	end_function
.Lfunc_end12:
	.size	_ZN3AES10DecryptCFBEPhjS0_S0_, .Lfunc_end12-_ZN3AES10DecryptCFBEPhjS0_S0_
                                        # -- End function
	.section	.text._ZN3AES12KeyExpansionEPhS0_,"",@
	.globl	_ZN3AES12KeyExpansionEPhS0_ # -- Begin function _ZN3AES12KeyExpansionEPhS0_
	.p2align	1
	.type	_ZN3AES12KeyExpansionEPhS0_,@function
_ZN3AES12KeyExpansionEPhS0_:            # @_ZN3AES12KeyExpansionEPhS0_
	.functype	_ZN3AES12KeyExpansionEPhS0_ (i32, i32, i32) -> ()
	.local  	i32, i32, i32
# %bb.0:                                # %entry
	i64.const	4
	i32.call	_Znam@FUNCTION
	local.set	3
	i64.const	4
	i32.call	_Znam@FUNCTION
	local.set	4
	i32.const	0
	local.set	5
.LBB13_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label77:
	local.get	5
	local.get	0
	i32.load	4
	i32.const	2
	i32.shl 
	i32.ge_s
	br_if   	1               # 1: down to label76
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB13_1 Depth=1
	local.get	2
	local.get	5
	i32.add 
	local.get	1
	local.get	5
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	5
	i32.const	1
	i32.add 
	local.set	5
	br      	0               # 0: up to label77
.LBB13_3:                               # %while.end
	end_loop
	end_block                       # label76:
	local.get	0
	i32.load	4
	i32.const	2
	i32.shl 
	local.set	5
.LBB13_4:                               # %while.cond7
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label79:
	local.get	5
	local.get	0
	i32.load	0
	local.get	0
	i32.load	8
	i32.const	1
	i32.add 
	i32.mul 
	i32.const	2
	i32.shl 
	i32.ge_s
	br_if   	1               # 1: down to label78
# %bb.5:                                # %while.body11
                                        #   in Loop: Header=BB13_4 Depth=1
	local.get	3
	local.get	2
	local.get	5
	i32.add 
	local.tee	1
	i32.const	-4
	i32.add 
	i32.load	0:p2align=0
	i32.store	0:p2align=0
	block   	
	block   	
	local.get	5
	i32.const	4
	i32.div_s
	local.get	0
	i32.load	4
	i32.rem_s
	i32.eqz
	br_if   	0               # 0: down to label81
# %bb.6:                                # %if.else
                                        #   in Loop: Header=BB13_4 Depth=1
	local.get	0
	i32.load	4
	i32.const	7
	i32.lt_s
	br_if   	1               # 1: down to label80
# %bb.7:                                # %land.lhs.true
                                        #   in Loop: Header=BB13_4 Depth=1
	local.get	5
	i32.const	4
	i32.div_s
	local.get	0
	i32.load	4
	i32.rem_s
	i32.const	4
	i32.ne  
	br_if   	1               # 1: down to label80
# %bb.8:                                # %if.then42
                                        #   in Loop: Header=BB13_4 Depth=1
	local.get	0
	local.get	3
	call	_ZN3AES7SubWordEPh@FUNCTION
	br      	1               # 1: down to label80
.LBB13_9:                               # %if.then
                                        #   in Loop: Header=BB13_4 Depth=1
	end_block                       # label81:
	local.get	0
	local.get	3
	call	_ZN3AES7RotWordEPh@FUNCTION
	local.get	0
	local.get	3
	call	_ZN3AES7SubWordEPh@FUNCTION
	local.get	0
	local.get	4
	local.get	5
	local.get	0
	i32.load	4
	i32.const	2
	i32.shl 
	i32.div_s
	call	_ZN3AES4RconEPhi@FUNCTION
	local.get	0
	local.get	3
	local.get	4
	local.get	3
	call	_ZN3AES8XorWordsEPhS0_S0_@FUNCTION
.LBB13_10:                              # %if.end43
                                        #   in Loop: Header=BB13_4 Depth=1
	end_block                       # label80:
	local.get	1
	local.get	2
	local.get	5
	local.get	0
	i32.load	4
	i32.const	2
	i32.shl 
	i32.sub 
	i32.add 
	i32.load8_u	0
	local.get	3
	i32.load8_u	0
	i32.xor 
	i32.store8	0
	local.get	1
	i32.const	1
	i32.add 
	local.get	2
	local.get	5
	local.get	0
	i32.load	4
	i32.const	2
	i32.shl 
	i32.sub 
	i32.add 
	i32.const	1
	i32.add 
	i32.load8_u	0
	local.get	3
	i32.load8_u	1
	i32.xor 
	i32.store8	0
	local.get	1
	i32.const	2
	i32.add 
	local.get	2
	local.get	5
	local.get	0
	i32.load	4
	i32.const	2
	i32.shl 
	i32.sub 
	i32.add 
	i32.const	2
	i32.add 
	i32.load8_u	0
	local.get	3
	i32.load8_u	2
	i32.xor 
	i32.store8	0
	local.get	1
	i32.const	3
	i32.add 
	local.get	2
	local.get	5
	local.get	0
	i32.load	4
	i32.const	2
	i32.shl 
	i32.sub 
	i32.add 
	i32.const	3
	i32.add 
	i32.load8_u	0
	local.get	3
	i32.load8_u	3
	i32.xor 
	i32.store8	0
	local.get	5
	i32.const	4
	i32.add 
	local.set	5
	br      	0               # 0: up to label79
.LBB13_11:                              # %while.end98
	end_loop
	end_block                       # label78:
	block   	
	local.get	4
	i32.eqz
	br_if   	0               # 0: down to label82
# %bb.12:                               # %delete.notnull
	local.get	4
	call	_ZdaPv@FUNCTION
.LBB13_13:                              # %delete.end
	end_block                       # label82:
	block   	
	local.get	3
	i32.eqz
	br_if   	0               # 0: down to label83
# %bb.14:                               # %delete.notnull100
	local.get	3
	call	_ZdaPv@FUNCTION
.LBB13_15:                              # %delete.end101
	end_block                       # label83:
                                        # fallthrough-return-void
	end_function
.Lfunc_end13:
	.size	_ZN3AES12KeyExpansionEPhS0_, .Lfunc_end13-_ZN3AES12KeyExpansionEPhS0_
                                        # -- End function
	.section	.text._ZN3AES11AddRoundKeyEPPhS0_,"",@
	.globl	_ZN3AES11AddRoundKeyEPPhS0_ # -- Begin function _ZN3AES11AddRoundKeyEPPhS0_
	.p2align	1
	.type	_ZN3AES11AddRoundKeyEPPhS0_,@function
_ZN3AES11AddRoundKeyEPPhS0_:            # @_ZN3AES11AddRoundKeyEPPhS0_
	.functype	_ZN3AES11AddRoundKeyEPPhS0_ (i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	3
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label84
.LBB14_1:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB14_2 Depth 2
	loop    	                # label85:
	i32.const	0
	local.set	4
	local.get	3
	local.set	5
.LBB14_2:                               # %for.cond2
                                        #   Parent Loop BB14_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	block   	
	loop    	                # label87:
	local.get	4
	local.get	0
	i32.load	0
	i32.ge_s
	br_if   	1               # 1: down to label86
# %bb.3:                                # %for.body4
                                        #   in Loop: Header=BB14_2 Depth=2
	local.get	1
	local.get	3
	i32.const	2
	i32.shl 
	i32.add 
	i32.load	0
	local.get	4
	i32.add 
	local.tee	6
	local.get	6
	i32.load8_u	0
	local.get	2
	local.get	5
	i32.add 
	i32.load8_u	0
	i32.xor 
	i32.store8	0
	local.get	5
	i32.const	4
	i32.add 
	local.set	5
	local.get	4
	i32.const	1
	i32.add 
	local.set	4
	br      	0               # 0: up to label87
.LBB14_4:                               # %for.end
                                        #   in Loop: Header=BB14_1 Depth=1
	end_loop
	end_block                       # label86:
	local.get	3
	i32.const	1
	i32.add 
	local.tee	3
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label85
.LBB14_5:                               # %for.end17
	end_loop
	end_block                       # label84:
                                        # fallthrough-return-void
	end_function
.Lfunc_end14:
	.size	_ZN3AES11AddRoundKeyEPPhS0_, .Lfunc_end14-_ZN3AES11AddRoundKeyEPPhS0_
                                        # -- End function
	.section	.text._ZN3AES8SubBytesEPPh,"",@
	.globl	_ZN3AES8SubBytesEPPh    # -- Begin function _ZN3AES8SubBytesEPPh
	.p2align	1
	.type	_ZN3AES8SubBytesEPPh,@function
_ZN3AES8SubBytesEPPh:                   # @_ZN3AES8SubBytesEPPh
	.functype	_ZN3AES8SubBytesEPPh (i32, i32) -> ()
	.local  	i32, i32, i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	2
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label88
.LBB15_1:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_2 Depth 2
	loop    	                # label89:
	i32.const	0
	local.set	3
.LBB15_2:                               # %for.cond2
                                        #   Parent Loop BB15_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	block   	
	loop    	                # label91:
	local.get	3
	local.get	0
	i32.load	0
	i32.ge_s
	br_if   	1               # 1: down to label90
# %bb.3:                                # %for.body4
                                        #   in Loop: Header=BB15_2 Depth=2
	local.get	1
	local.get	2
	i32.const	2
	i32.shl 
	i32.add 
	i32.load	0
	local.get	3
	i32.add 
	local.tee	4
	local.get	4
	i32.load8_u	0
	i32.const	_ZL4sbox
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	3
	i32.const	1
	i32.add 
	local.set	3
	br      	0               # 0: up to label91
.LBB15_4:                               # %for.end
                                        #   in Loop: Header=BB15_1 Depth=1
	end_loop
	end_block                       # label90:
	local.get	2
	i32.const	1
	i32.add 
	local.tee	2
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label89
.LBB15_5:                               # %for.end18
	end_loop
	end_block                       # label88:
                                        # fallthrough-return-void
	end_function
.Lfunc_end15:
	.size	_ZN3AES8SubBytesEPPh, .Lfunc_end15-_ZN3AES8SubBytesEPPh
                                        # -- End function
	.section	.text._ZN3AES9ShiftRowsEPPh,"",@
	.globl	_ZN3AES9ShiftRowsEPPh   # -- Begin function _ZN3AES9ShiftRowsEPPh
	.p2align	1
	.type	_ZN3AES9ShiftRowsEPPh,@function
_ZN3AES9ShiftRowsEPPh:                  # @_ZN3AES9ShiftRowsEPPh
	.functype	_ZN3AES9ShiftRowsEPPh (i32, i32) -> ()
# %bb.0:                                # %entry
	local.get	0
	local.get	1
	i32.const	1
	i32.const	1
	call	_ZN3AES8ShiftRowEPPhii@FUNCTION
	local.get	0
	local.get	1
	i32.const	2
	i32.const	2
	call	_ZN3AES8ShiftRowEPPhii@FUNCTION
	local.get	0
	local.get	1
	i32.const	3
	i32.const	3
	call	_ZN3AES8ShiftRowEPPhii@FUNCTION
                                        # fallthrough-return-void
	end_function
.Lfunc_end16:
	.size	_ZN3AES9ShiftRowsEPPh, .Lfunc_end16-_ZN3AES9ShiftRowsEPPh
                                        # -- End function
	.section	.text._ZN3AES10MixColumnsEPPh,"",@
	.globl	_ZN3AES10MixColumnsEPPh # -- Begin function _ZN3AES10MixColumnsEPPh
	.p2align	1
	.type	_ZN3AES10MixColumnsEPPh,@function
_ZN3AES10MixColumnsEPPh:                # @_ZN3AES10MixColumnsEPPh
	.functype	_ZN3AES10MixColumnsEPPh (i32, i32) -> ()
	.local  	i32, i32, i32, i32
# %bb.0:                                # %entry
	global.get	__stack_pointer@GLOBAL
	i32.const	16
	i32.sub 
	local.tee	2
	global.set	__stack_pointer@GLOBAL
	i32.const	0
	local.set	3
.LBB17_1:                               # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB17_3 Depth 2
                                        #     Child Loop BB17_5 Depth 2
	loop    	                # label92:
	block   	
	block   	
	local.get	3
	local.get	0
	i32.load	0
	i32.ge_s
	br_if   	0               # 0: down to label94
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB17_1 Depth=1
	i32.const	0
	local.set	4
	local.get	1
	local.set	5
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label95
.LBB17_3:                               # %for.body4
                                        #   Parent Loop BB17_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label96:
	local.get	2
	i32.const	12
	i32.add 
	local.get	4
	i32.add 
	local.get	5
	i32.load	0
	local.get	3
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	5
	i32.const	4
	i32.add 
	local.set	5
	local.get	4
	i32.const	1
	i32.add 
	local.tee	4
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label96
.LBB17_4:                               # %for.end
                                        #   in Loop: Header=BB17_1 Depth=1
	end_loop
	end_block                       # label95:
	local.get	2
	local.get	0
	i32.const	2
	local.get	2
	i32.load8_u	12
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	local.get	0
	i32.const	3
	local.get	2
	i32.load8_u	13
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	2
	i32.load8_u	14
	i32.xor 
	local.get	2
	i32.load8_u	15
	i32.xor 
	i32.store8	8
	local.get	2
	local.get	2
	i32.load8_u	12
	local.get	0
	i32.const	2
	local.get	2
	i32.load8_u	13
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	3
	local.get	2
	i32.load8_u	14
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	2
	i32.load8_u	15
	i32.xor 
	i32.store8	9
	local.get	2
	local.get	2
	i32.load8_u	12
	local.get	2
	i32.load8_u	13
	i32.xor 
	local.get	0
	i32.const	2
	local.get	2
	i32.load8_u	14
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	3
	local.get	2
	i32.load8_u	15
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	i32.store8	10
	local.get	2
	local.get	0
	i32.const	3
	local.get	2
	i32.load8_u	12
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	local.get	2
	i32.load8_u	13
	i32.xor 
	local.get	2
	i32.load8_u	14
	i32.xor 
	local.get	0
	i32.const	2
	local.get	2
	i32.load8_u	15
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	i32.store8	11
	i32.const	0
	local.set	4
	local.get	1
	local.set	5
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	1               # 1: down to label93
.LBB17_5:                               # %for.body68
                                        #   Parent Loop BB17_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label97:
	local.get	5
	i32.load	0
	local.get	3
	i32.add 
	local.get	2
	i32.const	8
	i32.add 
	local.get	4
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	5
	i32.const	4
	i32.add 
	local.set	5
	local.get	4
	i32.const	1
	i32.add 
	local.tee	4
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label97
	br      	2               # 2: down to label93
.LBB17_6:                               # %for.end80
	end_loop
	end_block                       # label94:
	local.get	2
	i32.const	16
	i32.add 
	global.set	__stack_pointer@GLOBAL
	return
.LBB17_7:                               # %for.end77
                                        #   in Loop: Header=BB17_1 Depth=1
	end_block                       # label93:
	local.get	3
	i32.const	1
	i32.add 
	local.set	3
	br      	0               # 0: up to label92
.LBB17_8:
	end_loop
	end_function
.Lfunc_end17:
	.size	_ZN3AES10MixColumnsEPPh, .Lfunc_end17-_ZN3AES10MixColumnsEPPh
                                        # -- End function
	.section	.text._ZN3AES11InvSubBytesEPPh,"",@
	.globl	_ZN3AES11InvSubBytesEPPh # -- Begin function _ZN3AES11InvSubBytesEPPh
	.p2align	1
	.type	_ZN3AES11InvSubBytesEPPh,@function
_ZN3AES11InvSubBytesEPPh:               # @_ZN3AES11InvSubBytesEPPh
	.functype	_ZN3AES11InvSubBytesEPPh (i32, i32) -> ()
	.local  	i32, i32, i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	2
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label98
.LBB18_1:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB18_2 Depth 2
	loop    	                # label99:
	i32.const	0
	local.set	3
.LBB18_2:                               # %for.cond2
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	block   	
	loop    	                # label101:
	local.get	3
	local.get	0
	i32.load	0
	i32.ge_s
	br_if   	1               # 1: down to label100
# %bb.3:                                # %for.body4
                                        #   in Loop: Header=BB18_2 Depth=2
	local.get	1
	local.get	2
	i32.const	2
	i32.shl 
	i32.add 
	i32.load	0
	local.get	3
	i32.add 
	local.tee	4
	local.get	4
	i32.load8_u	0
	i32.const	_ZL8inv_sbox
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	3
	i32.const	1
	i32.add 
	local.set	3
	br      	0               # 0: up to label101
.LBB18_4:                               # %for.end
                                        #   in Loop: Header=BB18_1 Depth=1
	end_loop
	end_block                       # label100:
	local.get	2
	i32.const	1
	i32.add 
	local.tee	2
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label99
.LBB18_5:                               # %for.end18
	end_loop
	end_block                       # label98:
                                        # fallthrough-return-void
	end_function
.Lfunc_end18:
	.size	_ZN3AES11InvSubBytesEPPh, .Lfunc_end18-_ZN3AES11InvSubBytesEPPh
                                        # -- End function
	.section	.text._ZN3AES12InvShiftRowsEPPh,"",@
	.globl	_ZN3AES12InvShiftRowsEPPh # -- Begin function _ZN3AES12InvShiftRowsEPPh
	.p2align	1
	.type	_ZN3AES12InvShiftRowsEPPh,@function
_ZN3AES12InvShiftRowsEPPh:              # @_ZN3AES12InvShiftRowsEPPh
	.functype	_ZN3AES12InvShiftRowsEPPh (i32, i32) -> ()
# %bb.0:                                # %entry
	local.get	0
	local.get	1
	i32.const	1
	local.get	0
	i32.load	0
	i32.const	-1
	i32.add 
	call	_ZN3AES8ShiftRowEPPhii@FUNCTION
	local.get	0
	local.get	1
	i32.const	2
	local.get	0
	i32.load	0
	i32.const	-2
	i32.add 
	call	_ZN3AES8ShiftRowEPPhii@FUNCTION
	local.get	0
	local.get	1
	i32.const	3
	local.get	0
	i32.load	0
	i32.const	-3
	i32.add 
	call	_ZN3AES8ShiftRowEPPhii@FUNCTION
                                        # fallthrough-return-void
	end_function
.Lfunc_end19:
	.size	_ZN3AES12InvShiftRowsEPPh, .Lfunc_end19-_ZN3AES12InvShiftRowsEPPh
                                        # -- End function
	.section	.text._ZN3AES13InvMixColumnsEPPh,"",@
	.globl	_ZN3AES13InvMixColumnsEPPh # -- Begin function _ZN3AES13InvMixColumnsEPPh
	.p2align	1
	.type	_ZN3AES13InvMixColumnsEPPh,@function
_ZN3AES13InvMixColumnsEPPh:             # @_ZN3AES13InvMixColumnsEPPh
	.functype	_ZN3AES13InvMixColumnsEPPh (i32, i32) -> ()
	.local  	i32, i32, i32, i32
# %bb.0:                                # %entry
	global.get	__stack_pointer@GLOBAL
	i32.const	16
	i32.sub 
	local.tee	2
	global.set	__stack_pointer@GLOBAL
	i32.const	0
	local.set	3
.LBB20_1:                               # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_3 Depth 2
                                        #     Child Loop BB20_5 Depth 2
	loop    	                # label102:
	block   	
	block   	
	local.get	3
	local.get	0
	i32.load	0
	i32.ge_s
	br_if   	0               # 0: down to label104
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB20_1 Depth=1
	i32.const	0
	local.set	4
	local.get	1
	local.set	5
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label105
.LBB20_3:                               # %for.body4
                                        #   Parent Loop BB20_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label106:
	local.get	2
	i32.const	12
	i32.add 
	local.get	4
	i32.add 
	local.get	5
	i32.load	0
	local.get	3
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	5
	i32.const	4
	i32.add 
	local.set	5
	local.get	4
	i32.const	1
	i32.add 
	local.tee	4
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label106
.LBB20_4:                               # %for.end
                                        #   in Loop: Header=BB20_1 Depth=1
	end_loop
	end_block                       # label105:
	local.get	2
	local.get	0
	i32.const	14
	local.get	2
	i32.load8_u	12
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	local.get	0
	i32.const	11
	local.get	2
	i32.load8_u	13
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	13
	local.get	2
	i32.load8_u	14
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	9
	local.get	2
	i32.load8_u	15
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	i32.store8	8
	local.get	2
	local.get	0
	i32.const	9
	local.get	2
	i32.load8_u	12
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	local.get	0
	i32.const	14
	local.get	2
	i32.load8_u	13
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	11
	local.get	2
	i32.load8_u	14
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	13
	local.get	2
	i32.load8_u	15
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	i32.store8	9
	local.get	2
	local.get	0
	i32.const	13
	local.get	2
	i32.load8_u	12
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	local.get	0
	i32.const	9
	local.get	2
	i32.load8_u	13
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	14
	local.get	2
	i32.load8_u	14
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	11
	local.get	2
	i32.load8_u	15
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	i32.store8	10
	local.get	2
	local.get	0
	i32.const	11
	local.get	2
	i32.load8_u	12
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	local.get	0
	i32.const	13
	local.get	2
	i32.load8_u	13
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	9
	local.get	2
	i32.load8_u	14
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	local.get	0
	i32.const	14
	local.get	2
	i32.load8_u	15
	i32.call	_ZN3AES9mul_bytesEhh@FUNCTION
	i32.xor 
	i32.store8	11
	i32.const	0
	local.set	4
	local.get	1
	local.set	5
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	1               # 1: down to label103
.LBB20_5:                               # %for.body76
                                        #   Parent Loop BB20_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label107:
	local.get	5
	i32.load	0
	local.get	3
	i32.add 
	local.get	2
	i32.const	8
	i32.add 
	local.get	4
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	5
	i32.const	4
	i32.add 
	local.set	5
	local.get	4
	i32.const	1
	i32.add 
	local.tee	4
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label107
	br      	2               # 2: down to label103
.LBB20_6:                               # %for.end88
	end_loop
	end_block                       # label104:
	local.get	2
	i32.const	16
	i32.add 
	global.set	__stack_pointer@GLOBAL
	return
.LBB20_7:                               # %for.end85
                                        #   in Loop: Header=BB20_1 Depth=1
	end_block                       # label103:
	local.get	3
	i32.const	1
	i32.add 
	local.set	3
	br      	0               # 0: up to label102
.LBB20_8:
	end_loop
	end_function
.Lfunc_end20:
	.size	_ZN3AES13InvMixColumnsEPPh, .Lfunc_end20-_ZN3AES13InvMixColumnsEPPh
                                        # -- End function
	.section	.text._ZN3AES8ShiftRowEPPhii,"",@
	.globl	_ZN3AES8ShiftRowEPPhii  # -- Begin function _ZN3AES8ShiftRowEPPhii
	.p2align	1
	.type	_ZN3AES8ShiftRowEPPhii,@function
_ZN3AES8ShiftRowEPPhii:                 # @_ZN3AES8ShiftRowEPPhii
	.functype	_ZN3AES8ShiftRowEPPhii (i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	4
	local.get	1
	local.get	2
	i32.const	2
	i32.shl 
	i32.add 
	local.set	5
	block   	
	i32.const	0
	local.get	3
	i32.ge_s
	br_if   	0               # 0: down to label108
.LBB21_1:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB21_2 Depth 2
	loop    	                # label109:
	local.get	5
	i32.load	0
	i32.load8_u	0
	local.set	6
	i32.const	0
	local.set	1
.LBB21_2:                               # %for.cond3
                                        #   Parent Loop BB21_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	block   	
	loop    	                # label111:
	local.get	1
	local.get	0
	i32.load	0
	i32.const	-1
	i32.add 
	i32.ge_s
	br_if   	1               # 1: down to label110
# %bb.3:                                # %for.body5
                                        #   in Loop: Header=BB21_2 Depth=2
	local.get	5
	i32.load	0
	local.tee	2
	local.get	1
	i32.add 
	local.get	2
	local.get	1
	i32.const	1
	i32.add 
	local.tee	1
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	1
	local.set	1
	br      	0               # 0: up to label111
.LBB21_4:                               # %for.end
                                        #   in Loop: Header=BB21_1 Depth=1
	end_loop
	end_block                       # label110:
	local.get	5
	i32.load	0
	local.get	0
	i32.load	0
	i32.add 
	i32.const	-1
	i32.add 
	local.get	6
	i32.store8	0
	local.get	4
	i32.const	1
	i32.add 
	local.tee	4
	local.get	3
	i32.lt_s
	br_if   	0               # 0: up to label109
.LBB21_5:                               # %for.end22
	end_loop
	end_block                       # label108:
                                        # fallthrough-return-void
	end_function
.Lfunc_end21:
	.size	_ZN3AES8ShiftRowEPPhii, .Lfunc_end21-_ZN3AES8ShiftRowEPPhii
                                        # -- End function
	.section	.text._ZN3AES5xtimeEh,"",@
	.globl	_ZN3AES5xtimeEh         # -- Begin function _ZN3AES5xtimeEh
	.p2align	1
	.type	_ZN3AES5xtimeEh,@function
_ZN3AES5xtimeEh:                        # @_ZN3AES5xtimeEh
	.functype	_ZN3AES5xtimeEh (i32, i32) -> (i32)
	.local  	i32
# %bb.0:                                # %entry
	local.get	1
	i32.const	1
	i32.shl 
	local.set	2
	block   	
	local.get	1
	i32.const	128
	i32.and 
	i32.eqz
	br_if   	0               # 0: down to label112
# %bb.1:                                # %if.then
	local.get	2
	i32.const	255
	i32.and 
	i32.const	27
	i32.xor 
	local.set	2
.LBB22_2:                               # %if.end
	end_block                       # label112:
	local.get	2
	i32.const	255
	i32.and 
                                        # fallthrough-return-value
	end_function
.Lfunc_end22:
	.size	_ZN3AES5xtimeEh, .Lfunc_end22-_ZN3AES5xtimeEh
                                        # -- End function
	.section	.text._ZN3AES9mul_bytesEhh,"",@
	.globl	_ZN3AES9mul_bytesEhh    # -- Begin function _ZN3AES9mul_bytesEhh
	.p2align	1
	.type	_ZN3AES9mul_bytesEhh,@function
_ZN3AES9mul_bytesEhh:                   # @_ZN3AES9mul_bytesEhh
	.functype	_ZN3AES9mul_bytesEhh (i32, i32, i32) -> (i32)
	.local  	i32, i32, i32, i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	3
	i32.const	0
	local.set	4
	block   	
	i32.const	0
	i32.const	7
	i32.gt_s
	br_if   	0               # 0: down to label113
.LBB23_1:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB23_3 Depth 2
	loop    	                # label114:
	block   	
	local.get	2
	i32.const	1
	i32.and 
	i32.eqz
	br_if   	0               # 0: down to label115
# %bb.2:                                # %if.then
                                        #   in Loop: Header=BB23_1 Depth=1
	i32.const	0
	local.set	5
	local.get	1
	local.set	6
	block   	
	i32.const	0
	local.get	4
	i32.ge_s
	br_if   	0               # 0: down to label116
.LBB23_3:                               # %for.body6
                                        #   Parent Loop BB23_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label117:
	local.get	0
	local.get	6
	i32.const	255
	i32.and 
	i32.call	_ZN3AES5xtimeEh@FUNCTION
	local.set	6
	local.get	5
	i32.const	1
	i32.add 
	local.tee	5
	local.get	4
	i32.lt_s
	br_if   	0               # 0: up to label117
.LBB23_4:                               # %for.end
                                        #   in Loop: Header=BB23_1 Depth=1
	end_loop
	end_block                       # label116:
	local.get	3
	local.get	6
	i32.xor 
	i32.const	255
	i32.and 
	local.set	3
.LBB23_5:                               # %if.end
                                        #   in Loop: Header=BB23_1 Depth=1
	end_block                       # label115:
	local.get	2
	i32.const	254
	i32.and 
	i32.const	1
	i32.shr_u
	local.set	2
	local.get	4
	i32.const	1
	i32.add 
	local.tee	4
	i32.const	7
	i32.le_s
	br_if   	0               # 0: up to label114
.LBB23_6:                               # %for.end14
	end_loop
	end_block                       # label113:
	local.get	3
	i32.const	255
	i32.and 
                                        # fallthrough-return-value
	end_function
.Lfunc_end23:
	.size	_ZN3AES9mul_bytesEhh, .Lfunc_end23-_ZN3AES9mul_bytesEhh
                                        # -- End function
	.section	.text._ZN3AES7SubWordEPh,"",@
	.globl	_ZN3AES7SubWordEPh      # -- Begin function _ZN3AES7SubWordEPh
	.p2align	1
	.type	_ZN3AES7SubWordEPh,@function
_ZN3AES7SubWordEPh:                     # @_ZN3AES7SubWordEPh
	.functype	_ZN3AES7SubWordEPh (i32, i32) -> ()
	.local  	i32, i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	2
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label118
.LBB24_1:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label119:
	local.get	1
	local.get	2
	i32.add 
	local.tee	3
	local.get	3
	i32.load8_u	0
	i32.const	_ZL4sbox
	i32.add 
	i32.load8_u	0
	i32.store8	0
	local.get	2
	i32.const	1
	i32.add 
	local.tee	2
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label119
.LBB24_2:                               # %for.end
	end_loop
	end_block                       # label118:
                                        # fallthrough-return-void
	end_function
.Lfunc_end24:
	.size	_ZN3AES7SubWordEPh, .Lfunc_end24-_ZN3AES7SubWordEPh
                                        # -- End function
	.section	.text._ZN3AES7RotWordEPh,"",@
	.globl	_ZN3AES7RotWordEPh      # -- Begin function _ZN3AES7RotWordEPh
	.p2align	1
	.type	_ZN3AES7RotWordEPh,@function
_ZN3AES7RotWordEPh:                     # @_ZN3AES7RotWordEPh
	.functype	_ZN3AES7RotWordEPh (i32, i32) -> ()
	.local  	i32
# %bb.0:                                # %entry
	local.get	1
	i32.load8_u	0
	local.set	2
	local.get	1
	local.get	1
	i32.load8_u	1
	i32.store8	0
	local.get	1
	local.get	1
	i32.load16_u	2:p2align=0
	i32.store16	1:p2align=0
	local.get	1
	local.get	2
	i32.store8	3
                                        # fallthrough-return-void
	end_function
.Lfunc_end25:
	.size	_ZN3AES7RotWordEPh, .Lfunc_end25-_ZN3AES7RotWordEPh
                                        # -- End function
	.section	.text._ZN3AES8XorWordsEPhS0_S0_,"",@
	.globl	_ZN3AES8XorWordsEPhS0_S0_ # -- Begin function _ZN3AES8XorWordsEPhS0_S0_
	.p2align	1
	.type	_ZN3AES8XorWordsEPhS0_S0_,@function
_ZN3AES8XorWordsEPhS0_S0_:              # @_ZN3AES8XorWordsEPhS0_S0_
	.functype	_ZN3AES8XorWordsEPhS0_S0_ (i32, i32, i32, i32) -> ()
	.local  	i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	4
	block   	
	i32.const	0
	i32.const	3
	i32.gt_s
	br_if   	0               # 0: down to label120
.LBB26_1:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label121:
	local.get	3
	local.get	4
	i32.add 
	local.get	1
	local.get	4
	i32.add 
	i32.load8_u	0
	local.get	2
	local.get	4
	i32.add 
	i32.load8_u	0
	i32.xor 
	i32.store8	0
	local.get	4
	i32.const	1
	i32.add 
	local.tee	4
	i32.const	3
	i32.le_s
	br_if   	0               # 0: up to label121
.LBB26_2:                               # %for.end
	end_loop
	end_block                       # label120:
                                        # fallthrough-return-void
	end_function
.Lfunc_end26:
	.size	_ZN3AES8XorWordsEPhS0_S0_, .Lfunc_end26-_ZN3AES8XorWordsEPhS0_S0_
                                        # -- End function
	.section	.text._ZN3AES4RconEPhi,"",@
	.globl	_ZN3AES4RconEPhi        # -- Begin function _ZN3AES4RconEPhi
	.p2align	1
	.type	_ZN3AES4RconEPhi,@function
_ZN3AES4RconEPhi:                       # @_ZN3AES4RconEPhi
	.functype	_ZN3AES4RconEPhi (i32, i32, i32) -> ()
	.local  	i32, i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	3
	i32.const	1
	local.set	4
	block   	
	i32.const	0
	local.get	2
	i32.const	-1
	i32.add 
	local.tee	2
	i32.ge_s
	br_if   	0               # 0: down to label122
.LBB27_1:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label123:
	local.get	0
	local.get	4
	i32.const	255
	i32.and 
	i32.call	_ZN3AES5xtimeEh@FUNCTION
	local.set	4
	local.get	3
	i32.const	1
	i32.add 
	local.tee	3
	local.get	2
	i32.lt_s
	br_if   	0               # 0: up to label123
.LBB27_2:                               # %for.end
	end_loop
	end_block                       # label122:
	local.get	1
	i32.const	0
	i32.store8	3
	local.get	1
	local.get	4
	i32.store8	0
	local.get	1
	i32.const	0
	i32.store16	1:p2align=0
                                        # fallthrough-return-void
	end_function
.Lfunc_end27:
	.size	_ZN3AES4RconEPhi, .Lfunc_end27-_ZN3AES4RconEPhi
                                        # -- End function
	.section	.text._ZN3AES13printHexArrayEPhj,"",@
	.globl	_ZN3AES13printHexArrayEPhj # -- Begin function _ZN3AES13printHexArrayEPhj
	.p2align	1
	.type	_ZN3AES13printHexArrayEPhj,@function
_ZN3AES13printHexArrayEPhj:             # @_ZN3AES13printHexArrayEPhj
	.functype	_ZN3AES13printHexArrayEPhj (i32, i32, i32) -> ()
	.local  	i32
# %bb.0:                                # %entry
	i32.const	0
	local.set	3
	block   	
	i32.const	0
	local.get	2
	i32.ge_u
	br_if   	0               # 0: down to label124
.LBB28_1:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	loop    	                # label125:
	local.get	3
	i32.const	1
	i32.add 
	local.tee	3
	local.get	2
	i32.lt_u
	br_if   	0               # 0: up to label125
.LBB28_2:                               # %for.end
	end_loop
	end_block                       # label124:
                                        # fallthrough-return-void
	end_function
.Lfunc_end28:
	.size	_ZN3AES13printHexArrayEPhj, .Lfunc_end28-_ZN3AES13printHexArrayEPhj
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata..L.str,"",@
.L.str:
	.asciz	"Incorrect key length"
	.size	.L.str, 21

	.type	_ZL4sbox,@object        # @_ZL4sbox
	.section	.rodata._ZL4sbox,"",@
	.p2align	4
_ZL4sbox:
	.ascii	"c|w{\362ko\3050\001g+\376\327\253v"
	.ascii	"\312\202\311}\372YG\360\255\324\242\257\234\244r\300"
	.ascii	"\267\375\223&6?\367\3144\245\345\361q\3301\025"
	.ascii	"\004\307#\303\030\226\005\232\007\022\200\342\353'\262u"
	.ascii	"\t\203,\032\033nZ\240R;\326\263)\343/\204"
	.ascii	"S\321\000\355 \374\261[j\313\2769JLX\317"
	.ascii	"\320\357\252\373CM3\205E\371\002\177P<\237\250"
	.ascii	"Q\243@\217\222\2358\365\274\266\332!\020\377\363\322"
	.ascii	"\315\f\023\354_\227D\027\304\247~=d]\031s"
	.ascii	"`\201O\334\"*\220\210F\356\270\024\336^\013\333"
	.ascii	"\3402:\nI\006$\\\302\323\254b\221\225\344y"
	.ascii	"\347\3107m\215\325N\251lV\364\352ez\256\b"
	.ascii	"\272x%.\034\246\264\306\350\335t\037K\275\213\212"
	.ascii	"p>\265fH\003\366\016a5W\271\206\301\035\236"
	.ascii	"\341\370\230\021i\331\216\224\233\036\207\351\316U(\337"
	.ascii	"\214\241\211\r\277\346BhA\231-\017\260T\273\026"
	.size	_ZL4sbox, 256

	.type	_ZL8inv_sbox,@object    # @_ZL8inv_sbox
	.section	.rodata._ZL8inv_sbox,"",@
	.p2align	4
_ZL8inv_sbox:
	.ascii	"R\tj\32506\2458\277@\243\236\201\363\327\373"
	.ascii	"|\3439\202\233/\377\2074\216CD\304\336\351\313"
	.ascii	"T{\2242\246\302#=\356L\225\013B\372\303N"
	.ascii	"\b.\241f(\331$\262v[\242Im\213\321%"
	.ascii	"r\370\366d\206h\230\026\324\244\\\314]e\266\222"
	.ascii	"lpHP\375\355\271\332^\025FW\247\215\235\204"
	.ascii	"\220\330\253\000\214\274\323\n\367\344X\005\270\263E\006"
	.ascii	"\320,\036\217\312?\017\002\301\257\275\003\001\023\212k"
	.ascii	":\221\021AOg\334\352\227\362\317\316\360\264\346s"
	.ascii	"\226\254t\"\347\2555\205\342\3717\350\034u\337n"
	.ascii	"G\361\032q\035)\305\211o\267b\016\252\030\276\033"
	.ascii	"\374V>K\306\322y \232\333\300\376x\315Z\364"
	.ascii	"\037\335\2503\210\007\3071\261\022\020Y'\200\354_"
	.ascii	"`Q\177\251\031\265J\r-\345z\237\223\311\234\357"
	.ascii	"\240\340;M\256*\365\260\310\353\273<\203S\231a"
	.ascii	"\027+\004~\272w\326&\341i\024cU!\f}"
	.size	_ZL8inv_sbox, 256


	.ident	"clang version 8.0.0 (tags/RELEASE_800/final 375507)"
	.globaltype	__stack_pointer, i32
	.functype	__cxa_allocate_exception (i64) -> (i32)
	.functype	__cxa_throw (i32, i32, i32) -> ()
	.functype	_Znam (i64) -> (i32)
	.functype	_ZdaPv (i32) -> ()
	.size	_ZTIPKc, 4
