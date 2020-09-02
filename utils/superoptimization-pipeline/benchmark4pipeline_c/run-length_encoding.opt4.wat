(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32 i32 i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (result i32)))
  (import "env" "fputc" (func $fputc (type 0)))
  (func $__wasm_call_ctors (type 2))
  (func $sget (type 1) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.get 0
      i32.const 12
      i32.add
      local.tee 0
      i32.load
      local.tee 1
      i32.add
      i32.load8_u
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 1
      i32.add
      i32.store
      local.get 2
      return
    end
    i32.const -1)
  (func $sput (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.const 12
    i32.add
    local.tee 2
    local.get 2
    i32.load
    local.tee 3
    i32.const 1
    i32.add
    i32.store
    local.get 3
    local.get 0
    i32.load offset=8
    i32.add
    i32.const 0
    local.get 1
    local.get 1
    i32.const -1
    i32.eq
    select
    i32.store8
    block  ;; label = @1
      local.get 1
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 2
    i32.const 0
    i32.store
    i32.const 0)
  (func $file_put (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load offset=8
    call $fputc)
  (func $output (type 3) (param i32 i32 i32)
    (local i32)
    local.get 0
    local.get 2
    i32.const 128
    i32.add
    local.get 0
    i32.load offset=4
    call_indirect (type 0)
    drop
    block  ;; label = @1
      local.get 2
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      local.set 3
      loop  ;; label = @2
        local.get 0
        local.get 1
        i32.load8_u
        local.get 3
        i32.load
        call_indirect (type 0)
        drop
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end)
  (func $encode (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 256
    i32.sub
    local.tee 2
    global.set 0
    local.get 1
    i32.load offset=4
    local.set 3
    local.get 0
    i32.load
    local.set 4
    local.get 1
    i32.const 4
    i32.add
    local.set 5
    i32.const 0
    local.set 6
    loop  ;; label = @1
      i32.const 0
      local.set 7
      i32.const 0
      local.set 8
      loop  ;; label = @2
        local.get 8
        local.set 10
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              local.get 6
              br_if 1 (;@4;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  local.get 4
                  call_indirect (type 1)
                  local.tee 6
                  i32.const -1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 10
                  i32.add
                  local.get 6
                  i32.store8
                  i32.const 0
                  local.set 6
                  local.get 10
                  i32.const 1
                  i32.add
                  local.tee 10
                  i32.const 2
                  i32.lt_s
                  br_if 2 (;@5;)
                  br 1 (;@6;)
                end
                i32.const 1
                local.set 6
              end
              local.get 2
              local.get 10
              i32.add
              i32.const -2
              i32.add
              i32.load8_u
              local.set 8
              local.get 2
              local.get 10
              i32.const -1
              i32.add
              local.tee 9
              i32.add
              i32.load8_u
              local.set 11
              block  ;; label = @6
                local.get 7
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                local.get 10
                i32.const 129
                i32.eq
                local.get 7
                i32.const 0
                local.get 11
                i32.const 255
                i32.and
                local.get 8
                i32.const 255
                i32.and
                i32.eq
                select
                local.tee 12
                i32.eqz
                i32.or
                i32.or
                i32.const 1
                i32.ne
                br_if 1 (;@5;)
                br 3 (;@3;)
              end
            end
            block  ;; label = @5
              local.get 11
              i32.const 255
              i32.and
              local.get 8
              i32.const 255
              i32.and
              i32.ne
              br_if 0 (;@5;)
              i32.const 1
              local.set 7
              local.get 10
              local.set 8
              local.get 10
              i32.const 3
              i32.lt_s
              br_if 3 (;@2;)
              local.get 1
              local.get 10
              i32.const 126
              i32.add
              local.get 5
              i32.load
              call_indirect (type 0)
              drop
              local.get 10
              i32.const -2
              i32.add
              local.set 8
              local.get 2
              local.set 10
              loop  ;; label = @6
                local.get 1
                local.get 10
                i32.load8_u
                local.get 5
                i32.load
                call_indirect (type 0)
                drop
                local.get 10
                i32.const 1
                i32.add
                local.set 10
                local.get 8
                i32.const -1
                i32.add
                local.tee 8
                br_if 0 (;@6;)
              end
              local.get 2
              local.get 11
              i32.store8
              local.get 2
              local.get 11
              i32.store8 offset=1
              i32.const 2
              local.set 8
              br 3 (;@2;)
            end
            i32.const 0
            local.set 7
            local.get 10
            local.set 8
            local.get 6
            i32.const -1
            i32.xor
            local.get 10
            i32.const 128
            i32.ne
            i32.and
            br_if 2 (;@2;)
            local.get 1
            local.get 10
            i32.const 128
            i32.add
            local.get 5
            i32.load
            call_indirect (type 0)
            drop
            i32.const 0
            local.set 7
            i32.const 0
            local.set 8
            local.get 10
            i32.const 1
            i32.lt_s
            br_if 2 (;@2;)
            local.get 2
            local.set 7
            loop  ;; label = @5
              local.get 1
              local.get 7
              i32.load8_u
              local.get 5
              i32.load
              call_indirect (type 0)
              drop
              local.get 7
              i32.const 1
              i32.add
              local.set 7
              local.get 10
              i32.const -1
              i32.add
              local.tee 10
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
          end
          local.get 1
          i32.const -1
          local.get 3
          call_indirect (type 0)
          drop
          local.get 2
          i32.const 256
          i32.add
          global.set 0
          return
        end
        local.get 1
        local.get 10
        local.get 9
        local.get 6
        select
        local.get 3
        call_indirect (type 0)
        drop
        local.get 1
        local.get 2
        i32.load8_u
        local.get 3
        call_indirect (type 0)
        drop
        local.get 2
        local.get 11
        i32.store8
        i32.const 1
        local.set 8
        local.get 12
        local.set 7
        br 0 (;@2;)
      end
    end)
  (func $decode (type 4) (param i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      local.get 0
      i32.load
      call_indirect (type 1)
      local.tee 2
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      i32.const 4
      i32.add
      local.set 3
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 129
            i32.lt_s
            br_if 0 (;@4;)
            local.get 2
            i32.const -128
            i32.add
            local.set 2
            loop  ;; label = @5
              local.get 3
              i32.load
              local.set 4
              local.get 1
              local.get 0
              local.get 0
              i32.load
              call_indirect (type 1)
              local.get 4
              call_indirect (type 0)
              drop
              local.get 2
              i32.const -1
              i32.add
              local.tee 2
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 0
          local.get 0
          i32.load
          call_indirect (type 1)
          local.set 4
          local.get 2
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 1
            local.get 4
            local.get 3
            i32.load
            call_indirect (type 0)
            drop
            local.get 2
            i32.const -1
            i32.add
            local.tee 2
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 0
        i32.load
        call_indirect (type 1)
        local.tee 2
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
      end
    end)
  (func $__original_main (type 5) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 304
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 40
    i32.add
    i32.const 0
    i64.load offset=1032 align=4
    i64.store
    local.get 0
    i32.const 0
    i64.load offset=1024 align=4
    i64.store offset=32
    local.get 0
    i32.const 0
    i32.store offset=28
    local.get 0
    i32.const 1
    i32.store offset=20
    local.get 0
    i32.const 2
    i32.store offset=16
    local.get 0
    local.get 0
    i32.const 48
    i32.add
    i32.store offset=24
    local.get 0
    i32.const 3
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store
    local.get 0
    i32.const 0
    i32.load
    i32.store offset=8
    local.get 0
    i32.const 32
    i32.add
    local.get 0
    i32.const 16
    i32.add
    call $encode
    block  ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      local.get 0
      i32.load offset=16
      call_indirect (type 1)
      local.tee 1
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 129
            i32.lt_s
            br_if 0 (;@4;)
            local.get 1
            i32.const -128
            i32.add
            local.set 1
            loop  ;; label = @5
              local.get 0
              i32.load offset=4
              local.set 2
              local.get 0
              local.get 0
              i32.const 16
              i32.add
              local.get 0
              i32.load offset=16
              call_indirect (type 1)
              local.get 2
              call_indirect (type 0)
              drop
              local.get 1
              i32.const -1
              i32.add
              local.tee 1
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 0
          i32.const 16
          i32.add
          local.get 0
          i32.load offset=16
          call_indirect (type 1)
          local.set 2
          local.get 1
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 0
            local.get 2
            local.get 0
            i32.load offset=4
            call_indirect (type 0)
            drop
            local.get 1
            i32.const -1
            i32.add
            local.tee 1
            br_if 0 (;@4;)
          end
        end
        local.get 0
        i32.const 16
        i32.add
        local.get 0
        i32.load offset=16
        call_indirect (type 1)
        local.tee 1
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
    i32.const 304
    i32.add
    global.set 0
    i32.const 0)
  (func $main (type 0) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 4 4 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66656))
  (global (;1;) i32 (i32.const 66656))
  (global (;2;) i32 (i32.const 1108))
  (global (;3;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "sget" (func $sget))
  (export "sput" (func $sput))
  (export "file_put" (func $file_put))
  (export "output" (func $output))
  (export "encode" (func $encode))
  (export "decode" (func $decode))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main))
  (elem (;0;) (i32.const 1) $sput $sget $file_put)
  (data (;0;) (i32.const 1024) "\02\00\00\00\00\00\00\00\10\04\00\00\00\00\00\00WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW\00"))
