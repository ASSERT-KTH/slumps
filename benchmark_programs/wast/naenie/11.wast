(module 
	
	;;2.0 * zr * zi
	
	;;Subtree size 5
	
	(func $Cuutououwe (param  f32) (param  f32) (result f32) 
		i32.const 2
		f32.convert_s/i32
		
		;;zr
		get_local 0
		f32.mul
		
		;;zi
		get_local 1
		f32.mul
		
	)
	(export "Cuutououwe" (func $Cuutououwe))
)