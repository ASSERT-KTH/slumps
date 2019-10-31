(module 
	
	;;x == size - 1
	
	;;Subtree size 5
	
	(func $Anisidogeu (param  i32) (param  i32) (result i32) 
		
		;;x
		get_local 0
		
		;;size
		get_local 1
		i32.const 1
		i32.sub
		i32.eq
		
	)
	(export "Anisidogeu" (func $Anisidogeu))
)