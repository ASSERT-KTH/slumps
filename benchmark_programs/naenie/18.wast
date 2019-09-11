(module 
	
	;;(2.0 * y / size) - 1.0
	
	;;Subtree size 7
	
	(func $Aascoaokauo (param  i32) (param  i32) (result f32) 
		i32.const 2
		
		;;y
		get_local 0
		i32.mul
		f32.convert_s/i32
		
		;;size
		get_local 1
		f32.convert_s/i32
		f32.div
		i32.const 1
		f32.convert_s/i32
		f32.sub
		
	)
	(export "Aascoaokauo" (func $Aascoaokauo))
)