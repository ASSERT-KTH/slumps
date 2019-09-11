(module 
	
	;;(2.0 * x / size) - 1.5
	
	;;Subtree size 7
	
	(func $Booiqoeeoi (param  i32) (param  i32) (result f32) 
		i32.const 2
		
		;;x
		get_local 0
		i32.mul
		f32.convert_s/i32
		
		;;size
		get_local 1
		f32.convert_s/i32
		f32.div
		f32.const 1.5
		f32.sub
		
	)
	(export "Booiqoeeoi" (func $Booiqoeeoi))
)