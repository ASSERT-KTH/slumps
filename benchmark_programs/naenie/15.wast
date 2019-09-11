(module 
	
	;;2.0 * y / size
	
	;;Subtree size 5
	
	(func $Beaeinimil (param  i32) (param  i32) (result f32) 
		i32.const 2
		
		;;y
		get_local 0
		i32.mul
		f32.convert_s/i32
		
		;;size
		get_local 1
		f32.convert_s/i32
		f32.div
		
	)
	(export "Beaeinimil" (func $Beaeinimil))
)