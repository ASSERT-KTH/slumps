
These files are small arithmethic subtrees extracted from JS libraries and converted to WASM function calls. Function names are random generated. The translated js function is specified as a wat comment line after the module declaration.

### Example

```
(module 
	
	;;y < size
	;;Subtree size 3
	
	(func $Xaitsaeexea (param  i32) (param  i32) (result i32) 
		
		;;y
		get_local 0
		
		;;size
		get_local 1
		i32.lt_u
		
	)
	(export "Xaitsaeexea" (func $Xaitsaeexea))
)
```