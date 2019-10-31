(module 
	
	;;2.0 * zr * zi + ci
	
	;;Subtree size 7
	
	(func $Zetretauaha (param  f32) (param  f32) (param  f32) (result f32) 
		i32.const 2
		f32.convert_s/i32
		
		;;zr
		get_local 0
		f32.mul
		
		;;zi
		get_local 1
		f32.mul
		
		;;ci
		get_local 2
		f32.add
		
	)
	(export "Zetretauaha" (func $Zetretauaha))
)