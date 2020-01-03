(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func))
  (type (;4;) (func (result i32)))
  (import "env" "read" (func $read (type 0)))
  (import "env" "fileno" (func $fileno (type 1)))
  (import "env" "_IO_putc" (func $_IO_putc (type 2)))
  (func $__wasm_call_ctors (type 3))
  (func $__original_main (type 4) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 12
    i32.add
    i32.const 1
    i32.add
    local.set 1
    i32.const 0
    local.set 2
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const 0
        i32.store16 align=1
        i32.const 0
        i32.load
        call $fileno
        local.get 0
        i32.const 12
        i32.add
        i32.const 3
        call $read
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 12
        i32.add
        i32.const 2
        i32.add
        i32.load8_u
        local.set 4
        local.get 1
        i32.load8_u
        local.set 5
        local.get 0
        i32.load8_u offset=12
        local.tee 6
        i32.const 2
        i32.shr_u
        i32.const 1024
        i32.add
        i32.load8_s
        i32.const 0
        i32.load
        call $_IO_putc
        drop
        local.get 5
        i32.const 8
        i32.shl
        local.tee 5
        local.get 6
        i32.const 16
        i32.shl
        i32.or
        i32.const 12
        i32.shr_u
        i32.const 63
        i32.and
        i32.const 1024
        i32.add
        i32.load8_s
        i32.const 0
        i32.load
        call $_IO_putc
        drop
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            i32.const 61
            local.set 5
            i32.const 61
            i32.const 0
            i32.load
            call $_IO_putc
            drop
            br 1 (;@3;)
          end
          local.get 5
          local.get 4
          i32.or
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 1024
          i32.add
          i32.load8_s
          i32.const 0
          i32.load
          call $_IO_putc
          drop
          i32.const 61
          local.set 5
          local.get 3
          i32.const 3
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          i32.const 63
          i32.and
          i32.const 1024
          i32.add
          i32.load8_s
          local.set 5
        end
        local.get 5
        i32.const 0
        i32.load
        call $_IO_putc
        drop
        block  ;; label = @3
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          i32.const 19
          i32.eq
          br_if 0 (;@3;)
          local.get 3
          i32.const 3
          i32.eq
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        i32.const 0
        local.set 2
        i32.const 10
        i32.const 0
        i32.load
        call $_IO_putc
        drop
        local.get 3
        i32.const 3
        i32.eq
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      i32.const 10
      i32.const 0
      i32.load
      call $_IO_putc
      drop
    end
    local.get 0
    i32.const 16
    i32.add
    global.set 0
    i32.const 0)
  (func $main (type 2) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66640))
  (global (;1;) i32 (i32.const 66640))
  (global (;2;) i32 (i32.const 1089))
  (global (;3;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00"))
