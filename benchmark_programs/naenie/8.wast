(module 
	
	;;zrzr + zizi > 4.0
	
	;;Subtree size 5
	
	(func $Meebewekwio (param  f32) (param  f32) (result i32) 
		
		;;zrzr
		get_local 0
		
		;;zizi
		get_local 1
		f32.add
		i32.trunc_s/f32
		i32.const 4
		i32.gt_u
		
	)
	(export "Meebewekwio" (func $Meebewekwio))
)