(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func))
  (type (;4;) (func (param i32 i32 i32 i32)))
  (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;6;) (func (result i32)))
  (import "env" "malloc" (func $malloc (type 0)))
  (import "env" "fputc" (func $fputc (type 1)))
  (import "env" "fgetc" (func $fgetc (type 0)))
  (import "env" "free" (func $free (type 2)))
  (import "env" "fopen" (func $fopen (type 1)))
  (import "env" "fclose" (func $fclose (type 0)))
  (import "env" "printf" (func $printf (type 1)))
  (func $__wasm_call_ctors (type 3))
  (func $b_attach (type 0) (param i32) (result i32)
    (local i32)
    i32.const 12
    call $malloc
    local.tee 1
    i64.const 0
    i64.store offset=4 align=4
    local.get 1
    local.get 0
    i32.store
    local.get 1)
  (func $b_write (type 4) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 3
    i32.load offset=8
    local.set 4
    local.get 3
    i32.load offset=4
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 4
        i32.const 8
        i32.lt_s
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 7
      i32.and
      local.set 6
      local.get 0
      local.get 2
      i32.const 3
      i32.shr_u
      i32.add
      local.set 7
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.const 8
                  i32.ge_s
                  br_if 0 (;@7;)
                  local.get 4
                  local.set 8
                  local.get 1
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
                local.get 4
                i32.const 8
                i32.add
                local.tee 2
                local.get 4
                i32.const 15
                local.get 4
                i32.const 15
                i32.lt_s
                select
                i32.const -1
                i32.xor
                i32.add
                local.set 8
                loop  ;; label = @7
                  local.get 5
                  local.get 2
                  i32.const -16
                  i32.add
                  local.tee 0
                  i32.shr_u
                  local.get 3
                  i32.load
                  call $fputc
                  drop
                  local.get 5
                  i32.const -1
                  local.get 0
                  i32.shl
                  i32.const -1
                  i32.xor
                  i32.and
                  local.set 5
                  local.get 2
                  i32.const -8
                  i32.add
                  local.tee 2
                  i32.const 15
                  i32.gt_s
                  br_if 0 (;@7;)
                end
                local.get 4
                i32.const -8
                i32.add
                local.get 8
                i32.const -8
                i32.and
                i32.sub
                local.set 8
                local.get 1
                i32.eqz
                br_if 1 (;@5;)
              end
              local.get 8
              i32.const 7
              i32.le_s
              br_if 1 (;@4;)
            end
            local.get 8
            local.set 4
            local.get 1
            i32.eqz
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 7
          local.set 2
          local.get 6
          local.set 0
          local.get 1
          local.set 9
          block  ;; label = @4
            loop  ;; label = @5
              local.get 2
              i32.const 1
              i32.add
              local.get 2
              local.get 0
              i32.const 1
              i32.add
              local.tee 4
              i32.const 8
              i32.eq
              local.tee 1
              select
              local.set 7
              i32.const 0
              local.get 4
              local.get 1
              select
              local.set 6
              i32.const 128
              local.get 0
              i32.shr_u
              local.get 2
              i32.load8_u
              i32.and
              i32.const 7
              local.get 0
              i32.sub
              i32.shr_u
              local.get 5
              i32.const 1
              i32.shl
              i32.or
              local.set 5
              local.get 8
              i32.const 1
              i32.add
              local.set 4
              local.get 9
              i32.const -1
              i32.add
              local.set 1
              local.get 9
              i32.const 1
              i32.eq
              br_if 1 (;@4;)
              local.get 8
              i32.const 7
              i32.lt_s
              local.set 10
              local.get 4
              local.set 8
              local.get 7
              local.set 2
              local.get 6
              local.set 0
              local.get 1
              local.set 9
              local.get 10
              br_if 0 (;@5;)
            end
          end
          local.get 1
          br_if 1 (;@2;)
        end
        local.get 4
        i32.const 7
        i32.gt_s
        br_if 0 (;@2;)
      end
    end
    local.get 3
    i32.const 8
    i32.add
    local.get 4
    i32.store
    local.get 3
    i32.const 4
    i32.add
    local.get 5
    i32.store)
  (func $b_read (type 5) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    local.get 3
    i32.load offset=8
    local.set 4
    local.get 3
    i32.load offset=4
    local.set 5
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 7
      i32.and
      local.set 6
      local.get 0
      local.get 2
      i32.const 3
      i32.shr_u
      i32.add
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          br 1 (;@2;)
        end
        i32.const 1
        local.set 0
      end
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  br_table 1 (;@6;) 0 (;@7;) 0 (;@7;)
                end
                local.get 4
                i32.const -1
                i32.add
                local.set 0
                loop  ;; label = @7
                  local.get 1
                  local.set 4
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 1
                      local.get 0
                      i32.shl
                      local.get 5
                      i32.and
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const 128
                      local.get 6
                      i32.shr_u
                      local.get 2
                      i32.load8_u
                      i32.or
                      local.set 7
                      br 1 (;@8;)
                    end
                    i32.const -129
                    local.get 6
                    i32.shr_s
                    local.get 2
                    i32.load8_u
                    i32.and
                    local.set 7
                  end
                  local.get 2
                  local.get 7
                  i32.store8
                  local.get 2
                  i32.const 1
                  i32.add
                  local.get 2
                  local.get 6
                  i32.const 1
                  i32.add
                  local.tee 6
                  i32.const 7
                  i32.gt_u
                  local.tee 7
                  select
                  local.set 2
                  i32.const 0
                  local.get 6
                  local.get 7
                  select
                  local.set 6
                  local.get 0
                  i32.const -1
                  i32.add
                  local.set 7
                  local.get 4
                  i32.const -1
                  i32.add
                  local.set 1
                  block  ;; label = @8
                    local.get 0
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 7
                    local.set 0
                    local.get 4
                    i32.const 1
                    i32.ne
                    br_if 1 (;@7;)
                  end
                end
                local.get 4
                i32.const 1
                i32.eq
                br_if 2 (;@4;)
                local.get 7
                i32.const 1
                i32.add
                local.set 0
                br 1 (;@5;)
              end
              i32.const 0
              local.set 0
            end
            local.get 3
            i32.load
            call $fgetc
            local.get 5
            i32.const 8
            i32.shl
            i32.or
            local.set 5
            local.get 0
            i32.const 8
            i32.add
            local.tee 4
            i32.eqz
            br_if 1 (;@3;)
            i32.const 1
            local.set 0
            br 2 (;@2;)
          end
          local.get 7
          i32.const 1
          i32.add
          local.set 4
          br 2 (;@1;)
        end
        i32.const 0
        local.set 0
        br 0 (;@2;)
      end
    end
    local.get 3
    i32.const 8
    i32.add
    local.get 4
    i32.store
    local.get 3
    i32.const 4
    i32.add
    local.get 5
    i32.store
    i32.const 0)
  (func $b_detach (type 2) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load offset=4
      i32.const 8
      local.get 1
      i32.sub
      i32.shl
      local.tee 1
      i32.store offset=4
      local.get 1
      local.get 0
      i32.load
      call $fputc
      drop
    end
    local.get 0
    call $free)
  (func $__original_main (type 6) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    i32.const 0
    i32.load offset=1032 align=1
    i32.store
    local.get 0
    i32.const 0
    i64.load offset=1024 align=1
    i64.store offset=32
    local.get 0
    i32.const 0
    i32.store offset=23 align=1
    local.get 0
    i64.const 0
    i64.store offset=16
    i32.const 1036
    i32.const 1045
    call $fopen
    local.set 1
    i32.const 0
    local.set 2
    i32.const 0
    local.set 3
    i32.const 0
    local.set 4
    i32.const 0
    local.set 5
    loop (result i32)  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  br_table 0 (;@7;) 1 (;@6;) 1 (;@6;)
                end
                local.get 0
                i32.const 32
                i32.add
                local.get 4
                i32.add
                local.set 6
                i32.const 1
                local.set 7
                i32.const 7
                local.set 8
                br 1 (;@5;)
              end
              local.get 0
              i32.const 16
              i32.add
              local.get 26
              i32.add
              local.set 27
              i32.const 7
              local.set 28
              i32.const 1
              local.set 29
              local.get 24
              br_if 2 (;@3;)
              br 1 (;@4;)
            end
            i32.const 0
            local.set 5
            br 2 (;@2;)
          end
          i32.const 1
          local.set 5
          br 1 (;@2;)
        end
        i32.const 2
        local.set 5
      end
      loop (result i32)  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 5
                            br_table 0 (;@12;) 1 (;@11;) 2 (;@10;) 2 (;@10;)
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 2
                                    i32.const 8
                                    i32.ge_s
                                    br_if 0 (;@16;)
                                    local.get 2
                                    local.set 9
                                    local.get 8
                                    br_if 1 (;@15;)
                                    br 2 (;@14;)
                                  end
                                  local.get 2
                                  i32.const 8
                                  i32.add
                                  local.set 5
                                  local.get 2
                                  i32.const 15
                                  local.get 2
                                  i32.const 15
                                  i32.lt_s
                                  select
                                  i32.const -1
                                  i32.xor
                                  local.set 9
                                  loop  ;; label = @16
                                    local.get 3
                                    local.get 5
                                    i32.const -16
                                    i32.add
                                    local.tee 10
                                    i32.shr_u
                                    local.get 1
                                    call $fputc
                                    drop
                                    local.get 3
                                    i32.const -1
                                    local.get 10
                                    i32.shl
                                    i32.const -1
                                    i32.xor
                                    i32.and
                                    local.set 3
                                    local.get 5
                                    i32.const -8
                                    i32.add
                                    local.tee 5
                                    i32.const 15
                                    i32.gt_s
                                    br_if 0 (;@16;)
                                  end
                                  local.get 2
                                  i32.const -8
                                  i32.add
                                  local.get 2
                                  local.get 9
                                  i32.add
                                  i32.const 8
                                  i32.add
                                  i32.const -8
                                  i32.and
                                  i32.sub
                                  local.set 9
                                  local.get 8
                                  i32.eqz
                                  br_if 1 (;@14;)
                                end
                                local.get 9
                                i32.const 7
                                i32.le_s
                                br_if 1 (;@13;)
                              end
                              local.get 9
                              local.set 2
                              local.get 8
                              i32.eqz
                              br_if 1 (;@12;)
                              i32.const 0
                              local.set 5
                              br 11 (;@2;)
                            end
                            local.get 6
                            local.set 5
                            local.get 7
                            local.set 10
                            local.get 8
                            local.set 11
                            block  ;; label = @13
                              loop  ;; label = @14
                                local.get 5
                                i32.const 1
                                i32.add
                                local.get 5
                                local.get 10
                                i32.const 1
                                i32.add
                                local.tee 2
                                i32.const 8
                                i32.eq
                                local.tee 8
                                select
                                local.set 6
                                i32.const 0
                                local.get 2
                                local.get 8
                                select
                                local.set 7
                                i32.const 128
                                local.get 10
                                i32.shr_u
                                local.get 5
                                i32.load8_u
                                i32.and
                                i32.const 7
                                local.get 10
                                i32.sub
                                i32.shr_u
                                local.get 3
                                i32.const 1
                                i32.shl
                                i32.or
                                local.set 3
                                local.get 9
                                i32.const 1
                                i32.add
                                local.set 2
                                local.get 11
                                i32.const -1
                                i32.add
                                local.set 8
                                local.get 9
                                i32.const 6
                                i32.gt_s
                                br_if 1 (;@13;)
                                local.get 11
                                i32.const 1
                                i32.ne
                                local.set 12
                                local.get 2
                                local.set 9
                                local.get 6
                                local.set 5
                                local.get 7
                                local.set 10
                                local.get 8
                                local.set 11
                                local.get 12
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 8
                            br_if 7 (;@5;)
                          end
                          local.get 2
                          i32.const 7
                          i32.gt_s
                          br_if 7 (;@4;)
                          local.get 4
                          i32.const 1
                          i32.add
                          local.tee 4
                          i32.const 10
                          i32.ne
                          br_if 4 (;@7;)
                          block  ;; label = @12
                            local.get 2
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 3
                            i32.const 8
                            local.get 2
                            i32.sub
                            i32.shl
                            local.get 1
                            call $fputc
                            drop
                          end
                          local.get 1
                          call $fclose
                          drop
                          i32.const 1036
                          i32.const 1048
                          call $fopen
                          local.set 13
                          i32.const 12
                          call $malloc
                          local.tee 14
                          i64.const 0
                          i64.store offset=4 align=4
                          local.get 14
                          local.get 13
                          i32.store
                          i32.const 0
                          local.set 15
                          i32.const 8
                          local.set 16
                          i32.const -1
                          local.set 17
                          i32.const 1
                          local.set 18
                          i32.const -129
                          local.set 19
                          i32.const 7
                          local.set 20
                          local.get 14
                          i32.const 4
                          i32.add
                          local.set 21
                          i32.const 10
                          local.set 22
                          i32.const 128
                          local.set 23
                          i32.const 0
                          local.set 24
                          i32.const 0
                          local.set 25
                          i32.const 0
                          local.set 26
                          i32.const 1
                          local.set 5
                          br 10 (;@1;)
                        end
                        i32.const 0
                        local.set 24
                        br 1 (;@9;)
                      end
                      local.get 24
                      local.get 17
                      i32.add
                      local.set 10
                      loop  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 18
                            local.get 10
                            local.tee 5
                            i32.shl
                            local.get 25
                            i32.and
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 23
                            local.get 29
                            i32.shr_u
                            local.get 27
                            i32.load8_u
                            i32.or
                            local.set 10
                            br 1 (;@11;)
                          end
                          local.get 19
                          local.get 29
                          i32.shr_s
                          local.get 27
                          i32.load8_u
                          i32.and
                          local.set 10
                        end
                        local.get 27
                        local.get 10
                        i32.store8
                        local.get 27
                        local.get 18
                        i32.add
                        local.get 27
                        local.get 29
                        local.get 18
                        i32.add
                        local.tee 29
                        local.get 20
                        i32.gt_u
                        local.tee 10
                        select
                        local.set 27
                        local.get 15
                        local.get 29
                        local.get 10
                        select
                        local.set 29
                        local.get 5
                        local.get 17
                        i32.add
                        local.set 10
                        local.get 28
                        local.get 17
                        i32.add
                        local.set 9
                        block  ;; label = @11
                          local.get 28
                          local.get 18
                          i32.eq
                          local.tee 11
                          br_if 0 (;@11;)
                          local.get 9
                          local.set 28
                          local.get 5
                          br_if 1 (;@10;)
                        end
                      end
                      local.get 10
                      local.get 18
                      i32.add
                      local.set 24
                      local.get 11
                      br_if 1 (;@8;)
                      local.get 9
                      local.set 28
                    end
                    local.get 14
                    i32.load
                    call $fgetc
                    local.get 25
                    local.get 16
                    i32.shl
                    i32.or
                    local.set 25
                    local.get 24
                    local.get 16
                    i32.add
                    local.tee 24
                    i32.eqz
                    br_if 5 (;@3;)
                    i32.const 2
                    local.set 5
                    br 6 (;@2;)
                  end
                  local.get 14
                  local.get 16
                  i32.add
                  local.get 24
                  i32.store
                  local.get 21
                  local.get 25
                  i32.store
                  local.get 26
                  local.get 18
                  i32.add
                  local.tee 26
                  local.get 22
                  i32.ne
                  br_if 1 (;@6;)
                  block  ;; label = @8
                    local.get 24
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 14
                    i32.const 4
                    i32.add
                    local.get 25
                    i32.const 8
                    local.get 24
                    i32.sub
                    i32.shl
                    local.tee 27
                    i32.store
                    local.get 27
                    local.get 14
                    i32.load
                    call $fputc
                    drop
                  end
                  local.get 14
                  call $free
                  local.get 13
                  call $fclose
                  drop
                  local.get 0
                  local.get 0
                  i32.const 16
                  i32.add
                  i32.store
                  i32.const 1051
                  local.get 0
                  call $printf
                  drop
                  local.get 0
                  i32.const 48
                  i32.add
                  global.set 0
                  i32.const 0
                  return
                end
                i32.const 0
                local.set 5
                br 5 (;@1;)
              end
              i32.const 1
              local.set 5
              br 4 (;@1;)
            end
            i32.const 0
            local.set 5
            br 2 (;@2;)
          end
          i32.const 0
          local.set 5
          br 1 (;@2;)
        end
        i32.const 1
        local.set 5
        br 0 (;@2;)
      end
    end)
  (func $main (type 1) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66608))
  (global (;1;) i32 (i32.const 66608))
  (global (;2;) i32 (i32.const 1057))
  (global (;3;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "b_attach" (func $b_attach))
  (export "b_write" (func $b_write))
  (export "b_read" (func $b_read))
  (export "b_detach" (func $b_detach))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "abcdefghijk\00test.bin\00wb\00rb\00%10s\0a\00"))
