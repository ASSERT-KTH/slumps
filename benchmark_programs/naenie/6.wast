(module 
	
	;;(byte_acc << 1) | escape
	
	;;Subtree size 5
	
	(func $Zuoiukroiswa (param  i32) (param  i32) (result i32) 
		
		;;byte_acc
		get_local 0
		i32.const 1
		i32.shl
		
		;;escape
		get_local 1
		i32.or
		
	)
	(export "Zuoiukroiswa" (func $Zuoiukroiswa))
)