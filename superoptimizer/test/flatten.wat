(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32)))
  (type (;4;) (func))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32 i32)))
  (import "env" "malloc" (func $malloc (type 0)))
  (import "env" "realloc" (func $realloc (type 1)))
  (import "env" "strtol" (func $strtol (type 2)))
  (import "env" "printf" (func $printf (type 1)))
  (import "env" "free" (func $free (type 3)))
  (func $__wasm_call_ctors (type 4))
  (func $__original_main (type 5) (result i32)
    (local i32)
    i32.const 1024
    i32.const 0
    i32.const 0
    call $from_string
    local.set 0
    i32.const 1070
    i32.const 0
    call $printf
    drop
    local.get 0
    call $show_list
    i32.const 1079
    i32.const 0
    call $printf
    drop
    local.get 0
    i32.const 0
    call $flatten
    local.set 0
    i32.const 1081
    i32.const 0
    call $printf
    drop
    local.get 0
    call $show_list
    i32.const 0)
  (func $from_string (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 0
    i32.store offset=12
    block  ;; label = @1
      local.get 2
      i32.const 0
      i32.ne
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      i32.const 12
      call $malloc
      local.tee 2
      i32.const 0
      i32.store offset=4
      local.get 2
      i32.const 1
      i32.store
      local.get 2
      i32.const 0
      i32.store offset=8
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        local.tee 4
        i32.const 0
        i32.ne
        i32.const 1
        i32.xor
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        loop  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.const 93
            i32.eq
            i32.const 1
            i32.xor
            i32.const 1
            i32.and
            br_if 0 (;@4;)
            local.get 1
            i32.const 0
            i32.ne
            i32.const 1
            i32.xor
            i32.const 1
            i32.and
            br_if 3 (;@1;)
            local.get 1
            local.get 0
            i32.const 1
            i32.add
            i32.store
            br 3 (;@1;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 4
              i32.const 91
              i32.eq
              i32.const 1
              i32.xor
              i32.const 1
              i32.and
              br_if 0 (;@5;)
              i32.const 12
              call $malloc
              local.tee 4
              i32.const 0
              i32.store offset=8
              local.get 4
              i32.const 1
              i32.store
              local.get 4
              i32.const 0
              i32.store offset=4
              local.get 2
              local.get 2
              i32.load offset=8
              local.get 2
              i32.load offset=4
              i32.const 1
              i32.add
              i32.const 4
              i32.mul
              call $realloc
              local.tee 0
              i32.store offset=8
              local.get 2
              local.get 2
              i32.load offset=4
              local.tee 5
              i32.const 1
              i32.add
              i32.store offset=4
              local.get 0
              local.get 5
              i32.const 2
              i32.shl
              i32.add
              local.get 4
              i32.store
              local.get 3
              i32.load offset=12
              i32.const 1
              i32.add
              local.get 3
              i32.const 12
              i32.add
              local.get 4
              call $from_string
              drop
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 4
              i32.const 48
              i32.ge_s
              i32.const 1
              i32.xor
              i32.const 1
              i32.and
              br_if 0 (;@5;)
              local.get 4
              i32.const 57
              i32.le_s
              i32.const 1
              i32.xor
              i32.const 1
              i32.and
              br_if 0 (;@5;)
              i32.const 12
              call $malloc
              local.tee 4
              i32.const 0
              i32.store offset=4
              local.get 4
              i32.const 0
              i32.store offset=8
              local.get 4
              i32.const 0
              i32.store
              local.get 4
              local.get 0
              local.get 3
              i32.const 12
              i32.add
              i32.const 10
              call $strtol
              i32.store offset=4
              local.get 2
              local.get 2
              i32.load offset=8
              local.get 2
              i32.load offset=4
              i32.const 1
              i32.add
              i32.const 4
              i32.mul
              call $realloc
              local.tee 0
              i32.store offset=8
              local.get 2
              local.get 2
              i32.load offset=4
              local.tee 5
              i32.const 1
              i32.add
              i32.store offset=4
              local.get 0
              local.get 5
              i32.const 2
              i32.shl
              i32.add
              local.get 4
              i32.store
              br 1 (;@4;)
            end
            local.get 3
            local.get 0
            i32.const 1
            i32.add
            i32.store offset=12
          end
          local.get 3
          i32.load offset=12
          local.tee 0
          i32.load8_u
          i32.const 24
          i32.shl
          i32.const 24
          i32.shr_s
          local.tee 4
          i32.const 0
          i32.ne
          i32.const 1
          i32.and
          br_if 0 (;@3;)
        end
      end
      local.get 1
      i32.const 0
      i32.ne
      i32.const 1
      i32.xor
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.store
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 2)
  (func $show_list (type 3) (param i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      local.get 0
      i32.const 0
      i32.ne
      i32.const 1
      i32.xor
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load
        i32.const 0
        i32.ne
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        i32.load offset=4
        i32.store
        i32.const 1093
        local.get 1
        call $printf
        drop
        br 1 (;@1;)
      end
      i32.const 1096
      i32.const 0
      call $printf
      drop
      block  ;; label = @2
        i32.const 0
        local.get 0
        i32.load offset=4
        i32.lt_s
        i32.const 1
        i32.xor
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 0
          i32.load offset=8
          local.get 2
          i32.add
          i32.load
          call $show_list
          block  ;; label = @4
            local.get 3
            local.get 0
            i32.load offset=4
            local.tee 4
            i32.const 1
            i32.sub
            i32.lt_s
            i32.const 1
            i32.xor
            i32.const 1
            i32.and
            br_if 0 (;@4;)
            i32.const 1098
            i32.const 0
            call $printf
            drop
            local.get 0
            i32.load offset=4
            local.set 4
          end
          local.get 2
          i32.const 4
          i32.add
          local.set 2
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 4
          i32.lt_s
          i32.const 1
          i32.and
          br_if 0 (;@3;)
        end
      end
      i32.const 1101
      i32.const 0
      call $printf
      drop
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func $flatten (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 0
      i32.ne
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      i32.const 12
      call $malloc
      local.tee 1
      i32.const 0
      i32.store offset=4
      local.get 1
      i32.const 1
      i32.store
      local.get 1
      i32.const 0
      i32.store offset=8
    end
    block  ;; label = @1
      local.get 0
      i32.load
      i32.const 0
      i32.ne
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      i32.const 12
      call $malloc
      local.tee 2
      i32.const 8
      i32.add
      local.get 0
      i32.const 8
      i32.add
      i32.load
      i32.store
      local.get 2
      local.get 0
      i64.load align=4
      i64.store align=4
      local.get 1
      local.get 1
      i32.load offset=8
      local.get 1
      i32.load offset=4
      i32.const 1
      i32.add
      i32.const 4
      i32.mul
      call $realloc
      local.tee 0
      i32.store offset=8
      local.get 1
      local.get 1
      i32.load offset=4
      local.tee 3
      i32.const 1
      i32.add
      i32.store offset=4
      local.get 0
      local.get 3
      i32.const 2
      i32.shl
      i32.add
      local.get 2
      i32.store
      local.get 1
      return
    end
    i32.const 0
    local.set 2
    block  ;; label = @1
      i32.const 0
      local.get 0
      i32.load offset=4
      i32.lt_s
      i32.const 1
      i32.xor
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      i32.const 0
      local.set 3
      loop  ;; label = @2
        local.get 0
        i32.load offset=8
        local.get 2
        i32.add
        i32.load
        local.get 1
        call $flatten
        drop
        local.get 2
        i32.const 4
        i32.add
        local.set 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        local.get 0
        i32.load offset=4
        i32.lt_s
        i32.const 1
        i32.and
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func $new_list (type 5) (result i32)
    (local i32)
    i32.const 12
    call $malloc
    local.tee 0
    i32.const 0
    i32.store offset=4
    local.get 0
    i32.const 1
    i32.store
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0)
  (func $append (type 6) (param i32 i32)
    (local i32 i32)
    local.get 0
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=4
    i32.const 1
    i32.add
    i32.const 4
    i32.mul
    call $realloc
    local.tee 2
    i32.store offset=8
    local.get 0
    local.get 0
    i32.load offset=4
    local.tee 3
    i32.const 1
    i32.add
    i32.store offset=4
    local.get 2
    local.get 3
    i32.const 2
    i32.shl
    i32.add
    local.get 1
    i32.store)
  (func $delete_list (type 3) (param i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 0
      i32.ne
      i32.const 1
      i32.xor
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load
        i32.const 0
        i32.ne
        i32.const 1
        i32.xor
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.const 0
        i32.ne
        i32.const 1
        i32.xor
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 0
          local.get 1
          i32.lt_s
          i32.const 1
          i32.xor
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 0
            i32.load offset=8
            local.get 1
            i32.add
            i32.load
            call $delete_list
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            local.get 0
            i32.load offset=4
            i32.lt_s
            i32.const 1
            i32.and
            br_if 0 (;@4;)
          end
        end
        local.get 0
        i32.load offset=8
        call $free
      end
      local.get 0
      call $free
    end)
  (func $main (type 1) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66640))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1103))
  (global (;3;) i32 (i32.const 1024))
  (global (;4;) i32 (i32.const 66640))
  (global (;5;) i32 (i32.const 0))
  (global (;6;) i32 (i32.const 1))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "new_list" (func $new_list))
  (export "append" (func $append))
  (export "from_string" (func $from_string))
  (export "show_list" (func $show_list))
  (export "flatten" (func $flatten))
  (export "delete_list" (func $delete_list))
  (export "main" (func $main))
  (export "__main_void" (func $__original_main))
  (export "__dso_handle" (global 1))
  (export "__data_end" (global 2))
  (export "__global_base" (global 3))
  (export "__heap_base" (global 4))
  (export "__memory_base" (global 5))
  (export "__table_base" (global 6))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "[1], 2, [[3,4], 5], [[[]]], [[[6]]], 7, 8, []\00Nested: \00\0a\00Flattened: \00%d\00[\00, \00]\00"))
