(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func))
  (type (;2;) (func (result i32)))
  (import "env" "printf" (func $printf (type 0)))
  (func $__wasm_call_ctors (type 1))
  (func $__original_main (type 2) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 0
    i32.store offset=12
    local.get 0
    i32.const 0
    i32.store offset=8
    loop  ;; label = @1
      i32.const 0
      local.set 1
      local.get 0
      local.get 0
      i32.load offset=8
      local.get 0
      i32.load offset=8
      i32.mul
      local.tee 2
      i32.store offset=4
      block  ;; label = @2
        local.get 2
        i32.const 1000000
        i32.rem_s
        i32.const 269696
        i32.ne
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        i32.const 2147483647
        i32.lt_s
        local.set 1
      end
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 0
        i32.load offset=8
        i32.const 1
        i32.add
        i32.store offset=8
        br 1 (;@1;)
      end
    end
    local.get 0
    local.get 0
    i32.load offset=8
    i32.store
    i32.const 1024
    local.get 0
    call $printf
    drop
    local.get 0
    i32.const 16
    i32.add
    global.set 0
    i32.const 0)
  (func $main (type 0) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66624))
  (global (;1;) i32 (i32.const 66624))
  (global (;2;) i32 (i32.const 1079))
  (global (;3;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "The smallest number whose square ends in 269696 is %d\0a\00"))
