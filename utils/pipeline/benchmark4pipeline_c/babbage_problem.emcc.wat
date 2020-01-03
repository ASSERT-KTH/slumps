(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (result i32)))
  (type (;2;) (func))
  (import "env" "_printf" (func (;0;) (type 0)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;1;) (type 1) (result i32)
    (local i32 i32 i32 i32)
    global.get 1
    local.set 1
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    loop  ;; label = @1
      local.get 0
      i32.const 1
      i32.add
      local.set 2
      local.get 0
      local.get 0
      i32.mul
      local.tee 3
      i32.const 1000000
      i32.rem_u
      i32.const 269696
      i32.ne
      local.get 3
      i32.const 2147483647
      i32.ne
      i32.and
      if  ;; label = @2
        local.get 2
        local.set 0
        br 1 (;@1;)
      end
    end
    local.get 1
    local.get 0
    i32.store
    global.get 0
    local.get 1
    call 0
    drop
    local.get 1
    global.set 1
    i32.const 0)
  (func (;2;) (type 2)
    global.get 0
    i32.const -64
    i32.sub
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 2))
  (export "_main" (func 1))
  (data (;0;) (global.get 0) "The smallest number whose square ends in 269696 is %d\0a"))
