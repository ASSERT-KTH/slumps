(
	module 
	(memory 1)
	(func (export "am_i_spidermonkey") (result i32)
		i32.const 100
		i32.const 0
		i32.const -29
		call $i_am_different
		i32.const -29
		i32.eq
		select
	)
	(func $i_am_different (export "i_am_different") (param $input i32)
		(result i32)
		local.get $input
		f32.reinterpret_i32
		f32.const 0x1.68p-144
		f32.max
		i32.reinterpret_f32
	)
	(export "string" (memory 0))
	(data $d0 (i32.const 0) "Boo!The SpiderMonkey is not here. Poor you!\00")
	(data $d1 (i32.const 100) "Yes!! I am a proud SpiderMonkey!\00")
)