(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (result i32)))
  (import "env" "putchar" (func $putchar (type 0)))
  (import "env" "printf" (func $printf (type 1)))
  (func $__wasm_call_ctors (type 2))
  (func $__original_main (type 3) (result i32)
    (local i32 i32 i32)
    i32.const 15
    local.set 0
    i32.const 1
    local.set 1
    loop  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 2
        loop  ;; label = @3
          i32.const 32
          call $putchar
          drop
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.set 2
      loop  ;; label = @2
        i32.const 1027
        i32.const 1024
        local.get 2
        local.get 0
        i32.and
        select
        i32.const 0
        call $printf
        drop
        local.get 1
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        i32.ne
        br_if 0 (;@2;)
      end
      i32.const 10
      call $putchar
      drop
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.const 17
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 0)
  (func $main (type 1) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66576))
  (global (;1;) i32 (i32.const 1030))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66576))
  (global (;4;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__data_end" (global 1))
  (export "__global_base" (global 2))
  (export "__heap_base" (global 3))
  (export "__dso_handle" (global 4))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "* \00  \00"))
