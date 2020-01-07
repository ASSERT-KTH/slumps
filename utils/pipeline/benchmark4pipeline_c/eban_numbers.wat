(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (result i32)))
  (import "env" "printf" (func $printf (type 0)))
  (import "env" "putchar" (func $putchar (type 1)))
  (func $__wasm_call_ctors (type 2))
  (func $__original_main (type 3) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 0
    global.set 0
    i32.const 0
    local.set 1
    loop  ;; label = @1
      local.get 1
      i32.const 12
      i32.mul
      local.tee 2
      i32.const 1028
      i32.add
      i32.load
      local.set 3
      local.get 2
      i32.const 1024
      i32.add
      i32.load
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          i32.store offset=36
          local.get 0
          local.get 2
          i32.store offset=32
          i32.const 1158
          local.get 0
          i32.const 32
          i32.add
          call $printf
          drop
          br 1 (;@2;)
        end
        local.get 0
        local.get 3
        i32.store offset=48
        i32.const 1120
        local.get 0
        i32.const 48
        i32.add
        call $printf
        drop
      end
      i32.const 0
      local.set 4
      block  ;; label = @2
        local.get 2
        local.get 3
        i32.gt_s
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 1
          i32.const 2
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          loop  ;; label = @4
            local.get 2
            i32.const 1000000
            i32.rem_s
            local.tee 5
            local.get 5
            i32.const 1000
            i32.div_s
            local.tee 6
            i32.const -1000
            i32.mul
            i32.add
            local.tee 7
            i32.const 10
            i32.rem_s
            local.set 8
            local.get 6
            i32.const 10
            i32.rem_s
            local.set 9
            local.get 2
            i32.const 1000000000
            i32.rem_s
            local.tee 10
            i32.const 1000000
            i32.div_s
            local.set 11
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.const 1999999999
                i32.gt_s
                br_if 0 (;@6;)
                local.get 2
                i32.const 999999999
                i32.add
                i32.const 1999999998
                i32.gt_u
                br_if 1 (;@5;)
              end
              local.get 11
              i32.const 10
              i32.rem_s
              local.get 11
              local.get 10
              i32.const -30000000
              i32.add
              i32.const 37000000
              i32.lt_u
              select
              local.tee 11
              i32.const 6
              i32.gt_u
              br_if 0 (;@5;)
              i32.const 1
              local.get 11
              i32.shl
              i32.const 85
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 9
              local.get 6
              local.get 5
              i32.const -30000
              i32.add
              i32.const 37000
              i32.lt_u
              select
              local.tee 5
              i32.const 6
              i32.gt_u
              br_if 0 (;@5;)
              i32.const 1
              local.get 5
              i32.shl
              i32.const 85
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 8
              local.get 7
              local.get 7
              i32.const -30
              i32.add
              i32.const 37
              i32.lt_u
              select
              local.tee 5
              i32.const 6
              i32.gt_u
              br_if 0 (;@5;)
              i32.const 1
              local.get 5
              i32.shl
              i32.const 85
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.get 2
              i32.store offset=16
              i32.const 1202
              local.get 0
              i32.const 16
              i32.add
              call $printf
              drop
              local.get 4
              i32.const 1
              i32.add
              local.set 4
            end
            local.get 2
            i32.const 2
            i32.add
            local.tee 2
            local.get 3
            i32.le_s
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        i32.const 0
        local.set 4
        loop  ;; label = @3
          local.get 2
          i32.const 1000000
          i32.rem_s
          local.tee 5
          local.get 5
          i32.const 1000
          i32.div_s
          local.tee 6
          i32.const -1000
          i32.mul
          i32.add
          local.tee 7
          i32.const 10
          i32.rem_s
          local.set 8
          local.get 6
          i32.const 10
          i32.rem_s
          local.set 9
          local.get 2
          i32.const 1000000000
          i32.rem_s
          local.tee 10
          i32.const 1000000
          i32.div_s
          local.set 11
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 1999999999
              i32.gt_s
              br_if 0 (;@5;)
              local.get 2
              i32.const 999999999
              i32.add
              i32.const 1999999998
              i32.gt_u
              br_if 1 (;@4;)
            end
            local.get 11
            i32.const 10
            i32.rem_s
            local.get 11
            local.get 10
            i32.const -30000000
            i32.add
            i32.const 37000000
            i32.lt_u
            select
            local.tee 11
            i32.const 6
            i32.gt_u
            br_if 0 (;@4;)
            i32.const 1
            local.get 11
            i32.shl
            i32.const 85
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 9
            local.get 6
            local.get 5
            i32.const -30000
            i32.add
            i32.const 37000
            i32.lt_u
            select
            local.tee 5
            i32.const 6
            i32.gt_u
            br_if 0 (;@4;)
            i32.const 1
            local.get 5
            i32.shl
            i32.const 85
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 8
            local.get 7
            local.get 7
            i32.const -30
            i32.add
            i32.const 37
            i32.lt_u
            select
            local.tee 5
            i32.const 6
            i32.gt_u
            br_if 0 (;@4;)
            i32.const 1
            local.get 5
            i32.shl
            i32.const 85
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.const 1
            i32.add
            local.set 4
          end
          local.get 2
          i32.const 2
          i32.add
          local.tee 2
          local.get 3
          i32.le_s
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 10
        call $putchar
        drop
      end
      local.get 0
      local.get 4
      i32.store
      i32.const 1206
      local.get 0
      call $printf
      drop
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.const 8
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 0
    i32.const 64
    i32.add
    global.set 0
    i32.const 0)
  (func $main (type 0) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66768))
  (global (;1;) i32 (i32.const 66768))
  (global (;2;) i32 (i32.const 1219))
  (global (;3;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "\02\00\00\00\e8\03\00\00\01\00\00\00\e8\03\00\00\a0\0f\00\00\01\00\00\00\02\00\00\00\10'\00\00\00\00\00\00\02\00\00\00\a0\86\01\00\00\00\00\00\02\00\00\00@B\0f\00\00\00\00\00\02\00\00\00\80\96\98\00\00\00\00\00\02\00\00\00\00\e1\f5\05\00\00\00\00\02\00\00\00\00\ca\9a;\00\00\00\00eban numbers up to and including %d:\0a\00eban numbers between %d and %d (inclusive:)\00%d \00count = %d\0a\0a\00"))
