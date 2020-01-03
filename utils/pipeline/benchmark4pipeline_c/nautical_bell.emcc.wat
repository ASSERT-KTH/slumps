(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (result i32)))
  (type (;3;) (func))
  (import "env" "_localtime" (func (;0;) (type 0)))
  (import "env" "_printf" (func (;1;) (type 1)))
  (import "env" "_putchar" (func (;2;) (type 0)))
  (import "env" "_sleep" (func (;3;) (type 0)))
  (import "env" "_time" (func (;4;) (type 0)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;5;) (type 2) (result i32)
    (local i32 i32)
    global.get 1
    local.set 0
    global.get 1
    i32.const 32
    i32.add
    global.set 1
    local.get 0
    i32.const 20
    i32.add
    local.set 1
    loop  ;; label = @1
      local.get 1
      call 4
      drop
      local.get 1
      call 0
      drop
      local.get 0
      i32.const 12
      i32.store
      local.get 0
      i32.const 0
      i32.store offset=4
      local.get 0
      i32.const 0
      i32.store offset=8
      local.get 0
      global.get 0
      i32.const 51
      i32.add
      i32.store offset=12
      local.get 0
      i32.const 8
      i32.store offset=16
      global.get 0
      local.get 0
      call 1
      drop
      i32.const 7
      call 2
      drop
      i32.const 1000
      call 3
      drop
      i32.const 7
      call 2
      drop
      i32.const 2000
      call 3
      drop
      i32.const 7
      call 2
      drop
      i32.const 1000
      call 3
      drop
      i32.const 7
      call 2
      drop
      i32.const 2000
      call 3
      drop
      i32.const 7
      call 2
      drop
      i32.const 1000
      call 3
      drop
      i32.const 7
      call 2
      drop
      i32.const 2000
      call 3
      drop
      i32.const 7
      call 2
      drop
      i32.const 1000
      call 3
      drop
      i32.const 7
      call 2
      drop
      i32.const 2000
      call 3
      drop
      br 0 (;@1;)
    end
    unreachable)
  (func (;6;) (type 3)
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
  (export "__post_instantiate" (func 6))
  (export "_main" (func 5))
  (data (;0;) (global.get 0) "\0aIt is now %d:%d%d %s. Sounding the bell %d times.\00PM"))
