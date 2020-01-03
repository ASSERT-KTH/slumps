(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func))
  (import "env" "_free" (func (;0;) (type 0)))
  (import "env" "_malloc" (func (;1;) (type 1)))
  (import "env" "_printf" (func (;2;) (type 2)))
  (import "env" "_putchar" (func (;3;) (type 1)))
  (import "env" "_rand" (func (;4;) (type 3)))
  (import "env" "_srand" (func (;5;) (type 0)))
  (import "env" "_time" (func (;6;) (type 1)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;7;) (type 3) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 4
    global.get 1
    i32.const 80
    i32.add
    global.set 1
    local.get 4
    i32.const 72
    i32.add
    local.set 6
    local.get 4
    i32.const -64
    i32.sub
    local.set 7
    local.get 4
    i32.const 56
    i32.add
    local.set 8
    local.get 4
    i32.const 48
    i32.add
    local.set 9
    local.get 4
    i32.const 40
    i32.add
    local.set 10
    local.get 4
    i32.const 32
    i32.add
    local.set 11
    local.get 4
    i32.const 24
    i32.add
    local.set 12
    local.get 4
    i32.const 16
    i32.add
    local.set 13
    local.get 4
    i32.const 8
    i32.add
    local.set 14
    i32.const 0
    call 6
    call 5
    i32.const 40
    call 1
    local.set 2
    i32.const 40
    call 1
    local.tee 3
    local.tee 0
    i32.const 40
    i32.add
    local.set 5
    loop  ;; label = @1
      local.get 0
      i32.const 0
      i32.store
      local.get 0
      i32.const 4
      i32.add
      local.tee 0
      local.get 5
      i32.lt_s
      br_if 0 (;@1;)
    end
    local.get 2
    i32.const 0
    i32.store
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i32.const 2
    i32.store offset=8
    local.get 2
    i32.const 3
    i32.store offset=12
    local.get 2
    i32.const 4
    i32.store offset=16
    local.get 2
    i32.const 5
    i32.store offset=20
    local.get 2
    i32.const 6
    i32.store offset=24
    local.get 2
    i32.const 7
    i32.store offset=28
    local.get 2
    i32.const 8
    i32.store offset=32
    local.get 2
    i32.const 9
    i32.store offset=36
    i32.const 0
    local.set 5
    loop  ;; label = @1
      i32.const 12
      call 1
      local.tee 1
      local.get 2
      i32.load8_u
      local.get 2
      i32.load8_u offset=1
      i32.const 8
      i32.shl
      i32.or
      local.get 2
      i32.load8_u offset=2
      i32.const 16
      i32.shl
      i32.or
      local.get 2
      i32.load8_u offset=3
      i32.const 24
      i32.shl
      i32.or
      local.tee 0
      i32.store8
      local.get 1
      local.get 0
      i32.const 8
      i32.shr_s
      i32.store8 offset=1
      local.get 1
      local.get 0
      i32.const 16
      i32.shr_s
      i32.store8 offset=2
      local.get 1
      local.get 0
      i32.const 24
      i32.shr_s
      i32.store8 offset=3
      local.get 1
      i32.const 1
      i32.store8 offset=4
      local.get 1
      i32.const 0
      i32.store8 offset=5
      local.get 1
      i32.const 0
      i32.store8 offset=6
      local.get 1
      i32.const 0
      i32.store8 offset=7
      local.get 1
      i32.const 2
      i32.store8 offset=8
      local.get 1
      i32.const 0
      i32.store8 offset=9
      local.get 1
      i32.const 0
      i32.store8 offset=10
      local.get 1
      i32.const 0
      i32.store8 offset=11
      call 4
      i32.const 3
      i32.and
      i32.const 3
      i32.ne
      if  ;; label = @2
        local.get 1
        call 4
        i32.const 3
        i32.rem_u
        i32.const 2
        i32.shl
        i32.add
        local.tee 0
        i32.const 3
        i32.store8
        local.get 0
        i32.const 0
        i32.store8 offset=1
        local.get 0
        i32.const 0
        i32.store8 offset=2
        local.get 0
        i32.const 0
        i32.store8 offset=3
      end
      call 4
      i32.const 5
      i32.rem_u
      i32.const 3
      i32.lt_u
      if  ;; label = @2
        local.get 1
        call 4
        i32.const 3
        i32.rem_u
        i32.const 2
        i32.shl
        i32.add
        local.tee 0
        i32.const 4
        i32.store8
        local.get 0
        i32.const 0
        i32.store8 offset=1
        local.get 0
        i32.const 0
        i32.store8 offset=2
        local.get 0
        i32.const 0
        i32.store8 offset=3
      end
      call 4
      i32.const 6
      i32.rem_u
      i32.const 3
      i32.lt_u
      if  ;; label = @2
        local.get 1
        call 4
        i32.const 3
        i32.rem_u
        i32.const 2
        i32.shl
        i32.add
        local.tee 0
        i32.const 5
        i32.store8
        local.get 0
        i32.const 0
        i32.store8 offset=1
        local.get 0
        i32.const 0
        i32.store8 offset=2
        local.get 0
        i32.const 0
        i32.store8 offset=3
      end
      call 4
      i32.const 7
      i32.rem_u
      i32.const 3
      i32.lt_u
      if  ;; label = @2
        local.get 1
        call 4
        i32.const 3
        i32.rem_u
        i32.const 2
        i32.shl
        i32.add
        local.tee 0
        i32.const 6
        i32.store8
        local.get 0
        i32.const 0
        i32.store8 offset=1
        local.get 0
        i32.const 0
        i32.store8 offset=2
        local.get 0
        i32.const 0
        i32.store8 offset=3
      end
      call 4
      i32.const 7
      i32.and
      i32.const 3
      i32.lt_u
      if  ;; label = @2
        local.get 1
        call 4
        i32.const 3
        i32.rem_u
        i32.const 2
        i32.shl
        i32.add
        local.tee 0
        i32.const 7
        i32.store8
        local.get 0
        i32.const 0
        i32.store8 offset=1
        local.get 0
        i32.const 0
        i32.store8 offset=2
        local.get 0
        i32.const 0
        i32.store8 offset=3
      end
      call 4
      i32.const 9
      i32.rem_u
      i32.const 3
      i32.lt_u
      if  ;; label = @2
        local.get 1
        call 4
        i32.const 3
        i32.rem_u
        i32.const 2
        i32.shl
        i32.add
        local.tee 0
        i32.const 8
        i32.store8
        local.get 0
        i32.const 0
        i32.store8 offset=1
        local.get 0
        i32.const 0
        i32.store8 offset=2
        local.get 0
        i32.const 0
        i32.store8 offset=3
      end
      call 4
      i32.const 10
      i32.rem_u
      i32.const 3
      i32.lt_u
      if  ;; label = @2
        local.get 1
        call 4
        i32.const 3
        i32.rem_u
        i32.const 2
        i32.shl
        i32.add
        local.tee 0
        i32.const 9
        i32.store8
        local.get 0
        i32.const 0
        i32.store8 offset=1
        local.get 0
        i32.const 0
        i32.store8 offset=2
        local.get 0
        i32.const 0
        i32.store8 offset=3
      end
      local.get 1
      i32.load
      i32.const 2
      i32.shl
      local.get 3
      i32.add
      local.tee 0
      local.get 0
      i32.load
      i32.const 1
      i32.add
      i32.store
      local.get 1
      i32.load offset=4
      i32.const 2
      i32.shl
      local.get 3
      i32.add
      local.tee 0
      local.get 0
      i32.load
      i32.const 1
      i32.add
      i32.store
      local.get 1
      i32.load offset=8
      i32.const 2
      i32.shl
      local.get 3
      i32.add
      local.tee 0
      local.get 0
      i32.load
      i32.const 1
      i32.add
      i32.store
      local.get 1
      call 0
      local.get 5
      i32.const 1
      i32.add
      local.tee 5
      i32.const 100000
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 4
    local.get 3
    i32.load
    i32.store
    global.get 0
    local.get 4
    call 2
    drop
    local.get 14
    local.get 3
    i32.load offset=4
    i32.store
    global.get 0
    local.get 14
    call 2
    drop
    local.get 13
    local.get 3
    i32.load offset=8
    i32.store
    global.get 0
    local.get 13
    call 2
    drop
    local.get 12
    local.get 3
    i32.load offset=12
    i32.store
    global.get 0
    local.get 12
    call 2
    drop
    local.get 11
    local.get 3
    i32.load offset=16
    i32.store
    global.get 0
    local.get 11
    call 2
    drop
    local.get 10
    local.get 3
    i32.load offset=20
    i32.store
    global.get 0
    local.get 10
    call 2
    drop
    local.get 9
    local.get 3
    i32.load offset=24
    i32.store
    global.get 0
    local.get 9
    call 2
    drop
    local.get 8
    local.get 3
    i32.load offset=28
    i32.store
    global.get 0
    local.get 8
    call 2
    drop
    local.get 7
    local.get 3
    i32.load offset=32
    i32.store
    global.get 0
    local.get 7
    call 2
    drop
    local.get 6
    local.get 3
    i32.load offset=36
    i32.store
    global.get 0
    local.get 6
    call 2
    drop
    i32.const 10
    call 3
    drop
    local.get 4
    global.set 1
    i32.const 0)
  (func (;8;) (type 4)
    global.get 0
    i32.const 16
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 8))
  (export "_main" (func 7))
  (data (;0;) (global.get 0) " %d"))
