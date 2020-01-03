(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (type (;2;) (func (result i32)))
  (type (;3;) (func))
  (import "env" "_fileno" (func (;0;) (type 0)))
  (import "env" "_putchar" (func (;1;) (type 0)))
  (import "env" "_read" (func (;2;) (type 1)))
  (import "env" "g$_stdin" (func (;3;) (type 2)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;4;) (type 2) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 0
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    call 3
    i32.load
    local.set 5
    loop  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 0
        i32.store8 offset=2
        local.get 0
        i32.const 0
        i32.store8 offset=1
        local.get 5
        call 0
        local.get 0
        i32.const 3
        call 2
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load8_u offset=1
        i32.const 8
        i32.shl
        local.set 3
        local.get 0
        i32.load8_u offset=2
        local.set 4
        global.get 0
        local.get 0
        i32.load8_u
        local.tee 6
        i32.const 2
        i32.shr_u
        i32.add
        i32.load8_s
        call 1
        drop
        global.get 0
        local.get 6
        i32.const 16
        i32.shl
        local.get 3
        i32.or
        i32.const 12
        i32.shr_u
        i32.const 63
        i32.and
        i32.add
        i32.load8_s
        call 1
        drop
        local.get 2
        i32.const 1
        i32.eq
        if (result i32)  ;; label = @3
          i32.const 61
          call 1
          drop
          i32.const 61
        else
          global.get 0
          local.get 3
          local.get 4
          i32.or
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.add
          i32.load8_s
          call 1
          drop
          local.get 2
          i32.const 3
          i32.lt_u
          if (result i32)  ;; label = @4
            i32.const 61
          else
            global.get 0
            local.get 4
            i32.const 63
            i32.and
            i32.add
            i32.load8_s
          end
        end
        call 1
        drop
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.const 19
        i32.eq
        if  ;; label = @3
          i32.const 10
          call 1
          drop
          i32.const 0
          local.set 1
        end
        local.get 2
        i32.const 3
        i32.eq
        br_if 1 (;@1;)
      end
    end
    local.get 1
    i32.eqz
    if  ;; label = @1
      local.get 0
      global.set 1
      i32.const 0
      return
    end
    i32.const 10
    call 1
    drop
    local.get 0
    global.set 1
    i32.const 0)
  (func (;5;) (type 3)
    global.get 0
    i32.const 80
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 5))
  (export "_main" (func 4))
  (data (;0;) (global.get 0) "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"))
