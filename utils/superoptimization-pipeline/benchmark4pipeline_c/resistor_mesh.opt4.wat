(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32 i32 i32 i32) (result f64)))
  (type (;4;) (func (param i32 i32 i32) (result f64)))
  (type (;5;) (func (result i32)))
  (import "env" "calloc" (func $calloc (type 0)))
  (import "env" "free" (func $free (type 1)))
  (import "env" "printf" (func $printf (type 0)))
  (func $__wasm_call_ctors (type 2))
  (func $alloc2 (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 1
    local.get 0
    i32.const 4
    i32.shl
    local.tee 2
    i32.const 4
    i32.or
    local.get 1
    i32.mul
    call $calloc
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      local.get 3
      i32.const -4
      i32.add
      local.set 4
      local.get 3
      local.get 1
      i32.const 2
      i32.shl
      i32.add
      local.set 5
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 5
        local.set 6
        block  ;; label = @3
          local.get 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load
          local.get 2
          i32.add
          local.set 6
        end
        local.get 4
        i32.const 4
        i32.add
        local.tee 4
        local.get 6
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 3)
  (func $set_boundary (type 1) (param i32)
    (local i32)
    local.get 0
    i32.load offset=4
    local.tee 1
    i64.const 4607182418800017408
    i64.store offset=16
    local.get 1
    i32.const 24
    i32.add
    i32.const 1
    i32.store
    local.get 0
    i32.load offset=24
    local.tee 0
    i64.const -4616189618054758400
    i64.store offset=112
    local.get 0
    i32.const 120
    i32.add
    i32.const -1
    i32.store)
  (func $calc_diff (type 3) (param i32 i32 i32 i32) (result f64)
    (local f64 i32 i32 i32 i32 i32 i32 i32 i32 f64 i32)
    block  ;; label = @1
      local.get 3
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      f64.const 0x0p+0 (;=0;)
      local.set 4
      i32.const 0
      local.set 5
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.const 0
                i32.le_s
                br_if 0 (;@6;)
                local.get 0
                local.get 5
                i32.const 1
                i32.add
                local.tee 6
                i32.const 2
                i32.shl
                i32.add
                local.set 7
                local.get 1
                local.get 5
                i32.const 2
                i32.shl
                local.tee 8
                i32.add
                i32.load
                local.set 9
                local.get 0
                local.get 8
                i32.add
                local.tee 8
                i32.load
                local.set 10
                local.get 5
                i32.eqz
                br_if 1 (;@5;)
                local.get 8
                i32.const -4
                i32.add
                i32.load
                local.set 11
                i32.const 0
                local.set 5
                i32.const 0
                local.set 12
                loop  ;; label = @7
                  local.get 11
                  local.get 5
                  i32.add
                  f64.load
                  f64.const 0x0p+0 (;=0;)
                  f64.add
                  local.set 13
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 5
                        br_if 0 (;@10;)
                        i32.const 1
                        local.set 8
                        local.get 6
                        local.get 3
                        i32.lt_s
                        br_if 1 (;@9;)
                        br 2 (;@8;)
                      end
                      local.get 13
                      local.get 10
                      local.get 5
                      i32.add
                      i32.const -16
                      i32.add
                      f64.load
                      f64.add
                      local.set 13
                      i32.const 2
                      local.set 8
                      local.get 6
                      local.get 3
                      i32.ge_s
                      br_if 1 (;@8;)
                    end
                    local.get 8
                    i32.const 1
                    i32.add
                    local.set 8
                    local.get 13
                    local.get 7
                    i32.load
                    local.get 5
                    i32.add
                    f64.load
                    f64.add
                    local.set 13
                  end
                  block  ;; label = @8
                    local.get 12
                    i32.const 1
                    i32.add
                    local.tee 12
                    local.get 2
                    i32.ge_s
                    br_if 0 (;@8;)
                    local.get 8
                    i32.const 1
                    i32.add
                    local.set 8
                    local.get 13
                    local.get 10
                    local.get 5
                    i32.add
                    i32.const 16
                    i32.add
                    f64.load
                    f64.add
                    local.set 13
                  end
                  local.get 9
                  local.get 5
                  i32.add
                  local.get 10
                  local.get 5
                  i32.add
                  local.tee 14
                  f64.load
                  local.get 13
                  local.get 8
                  f64.convert_i32_s
                  f64.div
                  f64.sub
                  local.tee 13
                  f64.store
                  local.get 4
                  local.get 4
                  local.get 13
                  local.get 13
                  f64.mul
                  f64.add
                  local.get 14
                  i32.const 8
                  i32.add
                  i32.load
                  select
                  local.set 4
                  local.get 5
                  i32.const 16
                  i32.add
                  local.set 5
                  local.get 2
                  local.get 12
                  i32.ne
                  br_if 0 (;@7;)
                  br 3 (;@4;)
                end
              end
              local.get 5
              i32.const 1
              i32.add
              local.tee 5
              local.get 3
              i32.ne
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            i32.const 0
            local.set 5
            i32.const 0
            local.set 12
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 5
                    br_if 0 (;@8;)
                    f64.const 0x0p+0 (;=0;)
                    local.set 13
                    i32.const 0
                    local.set 8
                    local.get 6
                    local.get 3
                    i32.lt_s
                    br_if 1 (;@7;)
                    br 2 (;@6;)
                  end
                  local.get 10
                  local.get 5
                  i32.add
                  i32.const -16
                  i32.add
                  f64.load
                  f64.const 0x0p+0 (;=0;)
                  f64.add
                  local.set 13
                  i32.const 1
                  local.set 8
                  local.get 6
                  local.get 3
                  i32.ge_s
                  br_if 1 (;@6;)
                end
                local.get 8
                i32.const 1
                i32.add
                local.set 8
                local.get 13
                local.get 7
                i32.load
                local.get 5
                i32.add
                f64.load
                f64.add
                local.set 13
              end
              block  ;; label = @6
                local.get 12
                i32.const 1
                i32.add
                local.tee 12
                local.get 2
                i32.ge_s
                br_if 0 (;@6;)
                local.get 8
                i32.const 1
                i32.add
                local.set 8
                local.get 13
                local.get 10
                local.get 5
                i32.add
                i32.const 16
                i32.add
                f64.load
                f64.add
                local.set 13
              end
              local.get 9
              local.get 5
              i32.add
              local.get 10
              local.get 5
              i32.add
              local.tee 14
              f64.load
              local.get 13
              local.get 8
              f64.convert_i32_s
              f64.div
              f64.sub
              local.tee 13
              f64.store
              local.get 4
              local.get 4
              local.get 13
              local.get 13
              f64.mul
              f64.add
              local.get 14
              i32.const 8
              i32.add
              i32.load
              select
              local.set 4
              local.get 5
              i32.const 16
              i32.add
              local.set 5
              local.get 2
              local.get 12
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 6
          local.tee 5
          local.get 3
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 4
      return
    end
    f64.const 0x0p+0 (;=0;))
  (func $iter (type 4) (param i32 i32 i32) (result f64)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i64 i32 i32 i32 f64 i32 f64 f64 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    i32.const 1
    local.get 1
    i32.const 4
    i32.shl
    local.tee 4
    i32.const 4
    i32.or
    local.get 2
    i32.mul
    call $calloc
    local.set 5
    block  ;; label = @1
      local.get 2
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      local.get 5
      i32.const -4
      i32.add
      local.set 6
      local.get 5
      local.get 2
      i32.const 2
      i32.shl
      i32.add
      local.set 7
      i32.const 0
      local.set 8
      loop  ;; label = @2
        local.get 7
        local.set 9
        block  ;; label = @3
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.load
          local.get 4
          i32.add
          local.set 9
        end
        local.get 6
        i32.const 4
        i32.add
        local.tee 6
        local.get 9
        i32.store
        local.get 2
        local.get 8
        i32.const 1
        i32.add
        local.tee 8
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 3
    i32.const 16
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i64.const 0
    i64.store offset=8
    local.get 3
    i64.const 0
    i64.store
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 0
          i32.le_s
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.add
          local.set 10
          i64.const 4607182418800017408
          local.set 11
          i32.const 24
          local.set 12
          i32.const 1
          local.set 13
          i64.const -4616189618054758400
          local.set 14
          i32.const 120
          local.set 15
          i32.const -1
          local.set 16
          i32.const 2
          local.set 17
          f64.const 0x1.357c299a88ea7p-80 (;=1e-24;)
          local.set 18
          i32.const 0
          local.set 19
          br 1 (;@2;)
        end
        local.get 0
        i32.const 4
        i32.add
        local.set 6
        loop  ;; label = @3
          local.get 6
          i32.load
          local.tee 8
          i64.const 4607182418800017408
          i64.store offset=16
          local.get 8
          i32.const 24
          i32.add
          i32.const 1
          i32.store
          local.get 0
          i32.const 24
          i32.add
          i32.load
          local.tee 8
          i64.const -4616189618054758400
          i64.store offset=112
          local.get 8
          i32.const 120
          i32.add
          i32.const -1
          i32.store
          local.get 0
          local.get 5
          local.get 1
          local.get 2
          call $calc_diff
          f64.const 0x1.357c299a88ea7p-80 (;=1e-24;)
          f64.gt
          br_if 0 (;@3;)
        end
        i32.const 0
        local.set 8
        br 1 (;@1;)
      end
      i32.const 1
      local.set 8
    end
    loop (result f64)  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 8
                        br_table 0 (;@10;) 1 (;@9;) 1 (;@9;)
                      end
                      f64.const 0x0p+0 (;=0;)
                      local.set 20
                      block  ;; label = @10
                        local.get 2
                        i32.const 1
                        i32.lt_s
                        br_if 0 (;@10;)
                        f64.const 0x0p+0 (;=0;)
                        local.set 21
                        local.get 1
                        i32.const 1
                        i32.lt_s
                        br_if 2 (;@8;)
                        local.get 1
                        i32.const -1
                        i32.add
                        local.set 22
                        local.get 2
                        i32.const -1
                        i32.add
                        local.set 23
                        i32.const 0
                        local.set 24
                        i32.const 2
                        local.set 25
                        i32.const 8
                        local.set 26
                        i32.const 3
                        local.set 27
                        i32.const 16
                        local.set 28
                        i32.const 1
                        local.set 29
                        i32.const 0
                        local.set 30
                        i32.const 1
                        local.set 19
                        br 7 (;@3;)
                      end
                      f64.const 0x0p+0 (;=0;)
                      local.set 21
                      br 1 (;@8;)
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 19
                        br_table 0 (;@10;) 1 (;@9;) 1 (;@9;)
                      end
                      local.get 10
                      i32.load
                      local.tee 8
                      local.get 11
                      i64.store offset=16
                      local.get 8
                      local.get 12
                      i32.add
                      local.get 13
                      i32.store
                      local.get 0
                      local.get 12
                      i32.add
                      i32.load
                      local.tee 8
                      local.get 14
                      i64.store offset=112
                      local.get 8
                      local.get 15
                      i32.add
                      local.get 16
                      i32.store
                      local.get 0
                      local.get 5
                      local.get 1
                      local.get 2
                      call $calc_diff
                      local.set 20
                      block  ;; label = @10
                        local.get 1
                        local.get 13
                        i32.lt_s
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 7
                        loop  ;; label = @11
                          local.get 0
                          local.get 7
                          local.get 17
                          i32.shl
                          local.tee 6
                          i32.add
                          i32.load
                          local.set 8
                          local.get 5
                          local.get 6
                          i32.add
                          i32.load
                          local.set 6
                          local.get 1
                          local.set 9
                          loop  ;; label = @12
                            local.get 8
                            local.get 8
                            f64.load
                            local.get 6
                            f64.load
                            f64.sub
                            f64.store
                            local.get 6
                            i32.const 16
                            i32.add
                            local.set 6
                            local.get 8
                            i32.const 16
                            i32.add
                            local.set 8
                            local.get 9
                            local.get 16
                            i32.add
                            local.tee 9
                            br_if 0 (;@12;)
                          end
                          local.get 7
                          local.get 13
                          i32.add
                          local.tee 7
                          local.get 2
                          i32.ne
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 20
                      local.get 18
                      f64.gt
                      br_if 2 (;@7;)
                      br 4 (;@5;)
                    end
                    local.get 30
                    local.get 23
                    i32.lt_s
                    local.get 30
                    local.get 24
                    i32.ne
                    i32.add
                    local.set 4
                    local.get 0
                    local.get 30
                    local.get 25
                    i32.shl
                    local.tee 8
                    i32.add
                    i32.load
                    local.get 26
                    i32.add
                    local.set 6
                    local.get 5
                    local.get 8
                    i32.add
                    i32.load
                    local.set 9
                    i32.const 0
                    local.set 8
                    loop  ;; label = @9
                      local.get 3
                      local.get 6
                      i32.load
                      local.get 27
                      i32.shl
                      i32.add
                      local.get 26
                      i32.add
                      local.tee 7
                      local.get 9
                      f64.load
                      local.get 4
                      local.get 8
                      local.get 24
                      i32.ne
                      i32.add
                      local.get 8
                      local.get 22
                      i32.lt_s
                      i32.add
                      f64.convert_i32_s
                      f64.mul
                      local.get 7
                      f64.load
                      f64.add
                      f64.store
                      local.get 9
                      local.get 28
                      i32.add
                      local.set 9
                      local.get 6
                      local.get 28
                      i32.add
                      local.set 6
                      local.get 1
                      local.get 8
                      local.get 29
                      i32.add
                      local.tee 8
                      i32.ne
                      br_if 0 (;@9;)
                    end
                    local.get 30
                    local.get 29
                    i32.add
                    local.tee 30
                    local.get 2
                    i32.ne
                    br_if 2 (;@6;)
                    local.get 3
                    f64.load
                    local.set 20
                    local.get 3
                    f64.load offset=16
                    local.set 21
                  end
                  local.get 5
                  call $free
                  local.get 3
                  i32.const 32
                  i32.add
                  global.set 0
                  local.get 21
                  local.get 20
                  f64.sub
                  f64.const 0x1p-1 (;=0.5;)
                  f64.mul
                  return
                end
                i32.const 0
                local.set 19
                br 2 (;@4;)
              end
              i32.const 1
              local.set 19
              br 3 (;@2;)
            end
            i32.const 0
            local.set 8
            br 3 (;@1;)
          end
          i32.const 1
          local.set 8
          br 2 (;@1;)
        end
        i32.const 1
        local.set 8
        br 1 (;@1;)
      end
      i32.const 1
      local.set 8
      br 0 (;@1;)
    end)
  (func $__original_main (type 5) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    i32.const 1
    i32.const 1640
    call $calloc
    local.tee 1
    local.get 1
    i32.const 1480
    i32.add
    i32.store offset=36
    local.get 1
    local.get 1
    i32.const 1320
    i32.add
    i32.store offset=32
    local.get 1
    local.get 1
    i32.const 1160
    i32.add
    i32.store offset=28
    local.get 1
    local.get 1
    i32.const 1000
    i32.add
    i32.store offset=24
    local.get 1
    local.get 1
    i32.const 840
    i32.add
    i32.store offset=20
    local.get 1
    local.get 1
    i32.const 680
    i32.add
    i32.store offset=16
    local.get 1
    local.get 1
    i32.const 520
    i32.add
    i32.store offset=12
    local.get 1
    local.get 1
    i32.const 360
    i32.add
    i32.store offset=8
    local.get 1
    local.get 1
    i32.const 200
    i32.add
    i32.store offset=4
    local.get 1
    local.get 1
    i32.const 40
    i32.add
    i32.store
    local.get 0
    f64.const 0x1p+1 (;=2;)
    local.get 1
    i32.const 10
    i32.const 10
    call $iter
    f64.div
    f64.store
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
  (global (;0;) (mut i32) (i32.const 66576))
  (global (;1;) i32 (i32.const 66576))
  (global (;2;) i32 (i32.const 1032))
  (global (;3;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "alloc2" (func $alloc2))
  (export "set_boundary" (func $set_boundary))
  (export "calc_diff" (func $calc_diff))
  (export "iter" (func $iter))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "R = %g\0a\00"))
