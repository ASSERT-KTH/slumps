(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i64 i64) (result i64)))
  (type (;3;) (func (param i64 i64 i64 i64 i64)))
  (type (;4;) (func (param i32)))
  (type (;5;) (func (result i32)))
  (import "env" "printf" (func $printf (type 0)))
  (func $__wasm_call_ctors (type 1))
  (func $choose (type 2) (param i64 i64) (result i64)
    (local i64 i64 i64)
    block  ;; label = @1
      local.get 1
      i64.const 2
      i64.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.set 2
      i64.const 1
      local.set 3
      loop  ;; label = @2
        local.get 2
        local.get 0
        local.get 3
        i64.add
        i64.mul
        local.get 3
        i64.const 1
        i64.add
        local.tee 4
        i64.div_u
        local.set 2
        local.get 4
        local.set 3
        local.get 1
        local.get 4
        i64.ne
        br_if 0 (;@2;)
      end
      local.get 2
      return
    end
    local.get 0)
  (func $tree (type 3) (param i64 i64 i64 i64 i64)
    (local i64 i64 i32 i64 i64 i64 i64 i64 i32 i64 i64 i64 i32 i64 i64 i64 i64 i64 i64 i64 i64 i32 i64 i64)
    block  ;; label = @1
      local.get 0
      i64.const 1
      i64.add
      local.tee 5
      i64.const 4
      i64.gt_u
      br_if 0 (;@1;)
      local.get 4
      i64.const 1
      i64.shl
      local.set 6
      local.get 1
      i32.wrap_i64
      i32.const 3
      i32.shl
      i32.const 1024
      i32.add
      local.set 7
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i64.const -1
          i64.add
          local.tee 8
          i64.eqz
          br_if 0 (;@3;)
          i64.const 0
          local.set 9
          i64.const 32
          local.set 10
          i64.const 2
          local.set 11
          i64.const 1
          local.set 12
          i32.const 1296
          local.set 13
          i64.const 4
          local.set 14
          i64.const 5
          local.set 15
          i64.const 0
          local.set 16
          i32.const 0
          local.set 17
          br 1 (;@2;)
        end
        i64.const 0
        local.set 22
        i64.const 32
        local.set 23
        i64.const 2
        local.set 24
        i64.const 1
        local.set 25
        i32.const 1296
        local.set 26
        i64.const 4
        local.set 27
        i64.const 5
        local.set 28
        i32.const 1
        local.set 17
      end
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 17
                br_table 0 (;@6;) 1 (;@5;) 1 (;@5;)
              end
              local.get 5
              local.get 0
              i64.sub
              local.tee 18
              local.get 1
              i64.mul
              local.get 3
              i64.add
              local.tee 19
              local.get 10
              i64.gt_u
              br_if 4 (;@1;)
              local.get 7
              i64.load
              local.set 20
              block  ;; label = @6
                local.get 18
                local.get 11
                i64.lt_u
                br_if 0 (;@6;)
                local.get 20
                local.get 12
                i64.add
                local.set 21
                i64.const 0
                local.set 18
                loop  ;; label = @7
                  local.get 21
                  local.get 18
                  i64.add
                  local.get 20
                  i64.mul
                  local.get 18
                  local.get 11
                  i64.add
                  i64.div_u
                  local.set 20
                  local.get 16
                  local.get 18
                  local.get 12
                  i64.add
                  local.tee 18
                  i64.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 20
              local.get 2
              i64.mul
              local.set 20
              block  ;; label = @6
                local.get 6
                local.get 19
                i64.ge_u
                br_if 0 (;@6;)
                local.get 19
                i32.wrap_i64
                i32.const 3
                i32.shl
                local.get 13
                i32.add
                local.tee 17
                local.get 17
                i64.load
                local.get 20
                i64.add
                i64.store
              end
              local.get 5
              local.get 14
              i64.eq
              br_if 4 (;@1;)
              local.get 19
              i32.wrap_i64
              i32.const 3
              i32.shl
              i32.const 1024
              i32.add
              local.tee 17
              local.get 17
              i64.load
              local.get 20
              i64.add
              i64.store
              local.get 8
              local.set 18
              loop  ;; label = @6
                local.get 5
                local.get 18
                local.get 20
                local.get 19
                local.get 4
                call $tree
                local.get 18
                i64.const -1
                i64.add
                local.tee 18
                local.get 9
                i64.ne
                br_if 0 (;@6;)
              end
              local.get 16
              local.get 12
              i64.add
              local.set 16
              local.get 5
              local.get 12
              i64.add
              local.tee 5
              local.get 15
              i64.lt_u
              br_if 1 (;@4;)
              br 4 (;@1;)
            end
            local.get 5
            local.get 0
            i64.sub
            local.tee 18
            local.get 1
            i64.mul
            local.get 3
            i64.add
            local.tee 21
            local.get 23
            i64.gt_u
            br_if 3 (;@1;)
            local.get 7
            i64.load
            local.set 19
            block  ;; label = @5
              local.get 18
              local.get 24
              i64.lt_u
              br_if 0 (;@5;)
              local.get 19
              local.get 25
              i64.add
              local.set 20
              i64.const 0
              local.set 18
              loop  ;; label = @6
                local.get 20
                local.get 18
                i64.add
                local.get 19
                i64.mul
                local.get 18
                local.get 24
                i64.add
                i64.div_u
                local.set 19
                local.get 22
                local.get 18
                local.get 25
                i64.add
                local.tee 18
                i64.ne
                br_if 0 (;@6;)
              end
            end
            local.get 19
            local.get 2
            i64.mul
            local.set 18
            block  ;; label = @5
              local.get 6
              local.get 21
              i64.ge_u
              br_if 0 (;@5;)
              local.get 21
              i32.wrap_i64
              i32.const 3
              i32.shl
              local.get 26
              i32.add
              local.tee 17
              local.get 17
              i64.load
              local.get 18
              i64.add
              i64.store
            end
            local.get 5
            local.get 27
            i64.eq
            br_if 3 (;@1;)
            local.get 21
            i32.wrap_i64
            i32.const 3
            i32.shl
            i32.const 1024
            i32.add
            local.tee 17
            local.get 17
            i64.load
            local.get 18
            i64.add
            i64.store
            local.get 22
            local.get 25
            i64.add
            local.set 22
            local.get 5
            local.get 25
            i64.add
            local.tee 5
            local.get 28
            i64.lt_u
            br_if 1 (;@3;)
            br 3 (;@1;)
          end
          i32.const 0
          local.set 17
          br 1 (;@2;)
        end
        i32.const 1
        local.set 17
        br 0 (;@2;)
      end
    end)
  (func $bicenter (type 4) (param i32)
    (local i32 i64)
    block  ;; label = @1
      local.get 0
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const 3
      i32.shl
      i32.const 1296
      i32.add
      local.tee 1
      local.get 0
      i32.const 2
      i32.div_s
      i32.const 3
      i32.shl
      i32.const 1024
      i32.add
      i64.load
      local.tee 2
      i64.const 1
      i64.add
      local.get 2
      i64.mul
      i64.const 1
      i64.shr_u
      local.get 1
      i64.load
      i64.add
      i64.store
    end)
  (func $__original_main (type 5) (result i32)
    (local i32 i32 i32 i64 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    i32.const 1304
    local.set 1
    i32.const 1
    local.set 2
    i64.const 1
    local.set 3
    loop  ;; label = @1
      i64.const 0
      local.get 3
      i64.const 1
      i64.const 1
      local.get 3
      call $tree
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          i32.const 2
          i32.shl
          i32.const -8
          i32.and
          i32.const 1024
          i32.add
          i64.load
          local.tee 4
          i64.const 1
          i64.add
          local.get 4
          i64.mul
          i64.const 1
          i64.shr_u
          local.get 1
          i64.load
          i64.add
          local.tee 4
          i64.store
          br 1 (;@2;)
        end
        local.get 1
        i64.load
        local.set 4
      end
      local.get 0
      local.get 4
      i64.store offset=8
      local.get 0
      local.get 3
      i64.store
      i32.const 1560
      local.get 0
      call $printf
      drop
      local.get 2
      i32.const 1
      i32.add
      local.set 2
      local.get 1
      i32.const 8
      i32.add
      local.set 1
      local.get 3
      i64.const 1
      i64.add
      local.tee 3
      i64.const 33
      i64.ne
      br_if 0 (;@1;)
    end
    local.get 0
    i32.const 16
    i32.add
    global.set 0
    i32.const 0)
  (func $main (type 0) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 67120))
  (global (;1;) i32 (i32.const 67120))
  (global (;2;) i32 (i32.const 1572))
  (global (;3;) i32 (i32.const 1024))
  (global (;4;) i32 (i32.const 1024))
  (global (;5;) i32 (i32.const 1296))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "choose" (func $choose))
  (export "tree" (func $tree))
  (export "bicenter" (func $bicenter))
  (export "main" (func $main))
  (export "rooted" (global 4))
  (export "unrooted" (global 5))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data (;1;) (i32.const 1560) "%llu: %llu\0a\00"))
