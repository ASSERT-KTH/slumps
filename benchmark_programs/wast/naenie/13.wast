(module 
	
	;;2.0 * x / size
	
	;;Subtree size 5
	
	(func $Ogoheuiooi (param  i32) (param  i32) (result f32) 
		i32.const 2
		
		;;x
		get_local 0
		i32.mul
		f32.convert_s/i32
		
		;;size
		get_local 1
		f32.convert_s/i32
		f32.div
		
	)
	(export "Ogoheuiooi" (func $Ogoheuiooi))
)