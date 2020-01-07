(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (result i32)))
  (import "env" "printf" (func $printf (type 0)))
  (import "env" "__isoc99_scanf" (func $__isoc99_scanf (type 0)))
  (import "env" "puts" (func $puts (type 1)))
  (import "env" "putchar" (func $putchar (type 1)))
  (func $__wasm_call_ctors (type 2))
  (func $__original_main (type 3) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 544
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 272
    i32.add
    i32.const 0
    i32.store
    local.get 0
    i64.const 0
    i64.store offset=264
    local.get 0
    i64.const 0
    i64.store offset=256
    i32.const 1024
    i32.const 0
    call $printf
    drop
    local.get 0
    local.get 0
    i32.const 188
    i32.add
    i32.store offset=176
    i32.const 1057
    local.get 0
    i32.const 176
    i32.add
    call $__isoc99_scanf
    drop
    i32.const 1060
    i32.const 0
    call $printf
    drop
    local.get 0
    local.get 0
    i32.const 184
    i32.add
    i32.store offset=160
    i32.const 1057
    local.get 0
    i32.const 160
    i32.add
    call $__isoc99_scanf
    drop
    i32.const 0
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.load offset=184
      local.tee 2
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      local.get 0
      i32.const 192
      i32.add
      local.set 3
      loop  ;; label = @2
        local.get 3
        i32.const 1
        i32.store
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.ne
        br_if 0 (;@2;)
      end
    end
    i32.const 1093
    i32.const 0
    call $printf
    drop
    block  ;; label = @1
      local.get 0
      i32.load offset=188
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 0
      local.set 2
      local.get 0
      i32.const 224
      i32.add
      local.set 3
      loop  ;; label = @2
        local.get 0
        local.get 3
        i32.store offset=144
        i32.const 1057
        local.get 0
        i32.const 144
        i32.add
        call $__isoc99_scanf
        drop
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        local.get 0
        i32.load offset=188
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    i32.const 1115
    i32.const 0
    call $printf
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=184
          local.tee 4
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          local.get 0
          i32.const 432
          i32.add
          local.set 5
          local.get 0
          i32.load offset=188
          local.set 6
          i32.const 1057
          local.set 7
          i32.const 4
          local.set 8
          i32.const 20
          local.set 9
          i32.const 0
          local.set 10
          i32.const 0
          local.set 11
          br 1 (;@2;)
        end
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      i32.const 1
      local.set 3
    end
    loop (result i32)  ;; label = @1
      block  ;; label = @2
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
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            local.get 3
                                                            br_table 0 (;@28;) 1 (;@27;) 1 (;@27;)
                                                          end
                                                          i32.const 1149
                                                          i32.const 0
                                                          call $printf
                                                          drop
                                                          local.get 0
                                                          i32.load offset=184
                                                          local.tee 12
                                                          i32.const 1
                                                          i32.lt_s
                                                          br_if 1 (;@26;)
                                                          i32.const 0
                                                          local.set 13
                                                          local.get 0
                                                          i32.const 320
                                                          i32.add
                                                          local.set 14
                                                          local.get 0
                                                          i32.load offset=188
                                                          local.set 15
                                                          i32.const 1
                                                          local.set 16
                                                          i32.const 1057
                                                          local.set 17
                                                          i32.const 4
                                                          local.set 18
                                                          i32.const 20
                                                          local.set 19
                                                          i32.const 1
                                                          local.set 11
                                                          br 16 (;@11;)
                                                        end
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            local.get 11
                                                            br_table 0 (;@28;) 1 (;@27;) 3 (;@25;) 5 (;@23;) 6 (;@22;) 8 (;@20;) 8 (;@20;)
                                                          end
                                                          block  ;; label = @28
                                                            local.get 6
                                                            i32.const 1
                                                            i32.lt_s
                                                            br_if 0 (;@28;)
                                                            i32.const 0
                                                            local.set 2
                                                            local.get 5
                                                            local.set 3
                                                            loop  ;; label = @29
                                                              local.get 0
                                                              local.get 3
                                                              i32.store offset=128
                                                              local.get 7
                                                              local.get 0
                                                              i32.const 128
                                                              i32.add
                                                              call $__isoc99_scanf
                                                              drop
                                                              local.get 3
                                                              local.get 8
                                                              i32.add
                                                              local.set 3
                                                              local.get 2
                                                              i32.const 1
                                                              i32.add
                                                              local.tee 2
                                                              local.get 0
                                                              i32.load offset=188
                                                              local.tee 6
                                                              i32.lt_s
                                                              br_if 0 (;@29;)
                                                            end
                                                            local.get 0
                                                            i32.load offset=184
                                                            local.set 4
                                                          end
                                                          local.get 5
                                                          local.get 9
                                                          i32.add
                                                          local.set 5
                                                          local.get 10
                                                          i32.const 1
                                                          i32.add
                                                          local.tee 10
                                                          local.get 4
                                                          i32.lt_s
                                                          br_if 9 (;@18;)
                                                          i32.const 0
                                                          local.set 3
                                                          br 26 (;@1;)
                                                        end
                                                        block  ;; label = @27
                                                          local.get 15
                                                          local.get 16
                                                          i32.lt_s
                                                          br_if 0 (;@27;)
                                                          i32.const 0
                                                          local.set 2
                                                          local.get 14
                                                          local.set 3
                                                          loop  ;; label = @28
                                                            local.get 0
                                                            local.get 3
                                                            i32.store offset=112
                                                            local.get 17
                                                            local.get 0
                                                            i32.const 112
                                                            i32.add
                                                            call $__isoc99_scanf
                                                            drop
                                                            local.get 3
                                                            local.get 18
                                                            i32.add
                                                            local.set 3
                                                            local.get 2
                                                            local.get 16
                                                            i32.add
                                                            local.tee 2
                                                            local.get 0
                                                            i32.load offset=188
                                                            local.tee 15
                                                            i32.lt_s
                                                            br_if 0 (;@28;)
                                                          end
                                                          local.get 0
                                                          i32.load offset=184
                                                          local.set 12
                                                        end
                                                        local.get 14
                                                        local.get 19
                                                        i32.add
                                                        local.set 14
                                                        local.get 13
                                                        local.get 16
                                                        i32.add
                                                        local.tee 13
                                                        local.get 12
                                                        i32.lt_s
                                                        br_if 9 (;@17;)
                                                      end
                                                      i32.const 0
                                                      local.set 2
                                                      i32.const 1178
                                                      i32.const 0
                                                      call $printf
                                                      drop
                                                      block  ;; label = @26
                                                        local.get 0
                                                        i32.load offset=188
                                                        i32.const 1
                                                        i32.lt_s
                                                        br_if 0 (;@26;)
                                                        local.get 0
                                                        i32.const 224
                                                        i32.add
                                                        local.set 3
                                                        loop  ;; label = @27
                                                          local.get 0
                                                          local.get 3
                                                          i32.load
                                                          i32.store offset=96
                                                          i32.const 1201
                                                          local.get 0
                                                          i32.const 96
                                                          i32.add
                                                          call $printf
                                                          drop
                                                          local.get 3
                                                          i32.const 4
                                                          i32.add
                                                          local.set 3
                                                          local.get 2
                                                          i32.const 1
                                                          i32.add
                                                          local.tee 2
                                                          local.get 0
                                                          i32.load offset=188
                                                          i32.lt_s
                                                          br_if 0 (;@27;)
                                                        end
                                                      end
                                                      i32.const 1205
                                                      call $puts
                                                      drop
                                                      local.get 0
                                                      i32.load offset=184
                                                      i32.const 1
                                                      i32.lt_s
                                                      br_if 1 (;@24;)
                                                      i32.const 0
                                                      local.set 20
                                                      local.get 0
                                                      i32.const 432
                                                      i32.add
                                                      local.set 21
                                                      i32.const 1
                                                      local.set 22
                                                      i32.const 1236
                                                      local.set 23
                                                      i32.const 4
                                                      local.set 24
                                                      i32.const 10
                                                      local.set 25
                                                      i32.const 20
                                                      local.set 26
                                                      i32.const 2
                                                      local.set 11
                                                      br 16 (;@9;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 0
                                                      i32.load offset=188
                                                      local.get 22
                                                      i32.lt_s
                                                      br_if 0 (;@25;)
                                                      i32.const 0
                                                      local.set 2
                                                      local.get 21
                                                      local.set 3
                                                      loop  ;; label = @26
                                                        local.get 0
                                                        local.get 3
                                                        i32.load
                                                        i32.store offset=80
                                                        local.get 23
                                                        local.get 0
                                                        i32.const 80
                                                        i32.add
                                                        call $printf
                                                        drop
                                                        local.get 3
                                                        local.get 24
                                                        i32.add
                                                        local.set 3
                                                        local.get 2
                                                        local.get 22
                                                        i32.add
                                                        local.tee 2
                                                        local.get 0
                                                        i32.load offset=188
                                                        i32.lt_s
                                                        br_if 0 (;@26;)
                                                      end
                                                    end
                                                    local.get 25
                                                    call $putchar
                                                    drop
                                                    local.get 21
                                                    local.get 26
                                                    i32.add
                                                    local.set 21
                                                    local.get 20
                                                    local.get 22
                                                    i32.add
                                                    local.tee 20
                                                    local.get 0
                                                    i32.load offset=184
                                                    i32.lt_s
                                                    br_if 8 (;@16;)
                                                  end
                                                  i32.const 1240
                                                  call $puts
                                                  drop
                                                  i32.const 1
                                                  local.set 27
                                                  local.get 0
                                                  i32.load offset=184
                                                  i32.const 1
                                                  i32.lt_s
                                                  br_if 2 (;@21;)
                                                  i32.const 0
                                                  local.set 28
                                                  local.get 0
                                                  i32.const 320
                                                  i32.add
                                                  local.set 29
                                                  i32.const 1236
                                                  local.set 30
                                                  i32.const 4
                                                  local.set 31
                                                  i32.const 10
                                                  local.set 32
                                                  i32.const 20
                                                  local.set 33
                                                  i32.const 3
                                                  local.set 11
                                                  br 16 (;@7;)
                                                end
                                                block  ;; label = @23
                                                  local.get 0
                                                  i32.load offset=188
                                                  local.get 27
                                                  i32.lt_s
                                                  br_if 0 (;@23;)
                                                  i32.const 0
                                                  local.set 2
                                                  local.get 29
                                                  local.set 3
                                                  loop  ;; label = @24
                                                    local.get 0
                                                    local.get 3
                                                    i32.load
                                                    i32.store offset=64
                                                    local.get 30
                                                    local.get 0
                                                    i32.const 64
                                                    i32.add
                                                    call $printf
                                                    drop
                                                    local.get 3
                                                    local.get 31
                                                    i32.add
                                                    local.set 3
                                                    local.get 2
                                                    local.get 27
                                                    i32.add
                                                    local.tee 2
                                                    local.get 0
                                                    i32.load offset=188
                                                    i32.lt_s
                                                    br_if 0 (;@24;)
                                                  end
                                                end
                                                local.get 32
                                                call $putchar
                                                drop
                                                local.get 29
                                                local.get 33
                                                i32.add
                                                local.set 29
                                                local.get 28
                                                local.get 27
                                                i32.add
                                                local.tee 28
                                                local.get 0
                                                i32.load offset=184
                                                local.tee 34
                                                i32.lt_s
                                                br_if 7 (;@15;)
                                                local.get 34
                                                i32.const 1
                                                i32.lt_s
                                                br_if 1 (;@21;)
                                                local.get 0
                                                i32.load offset=188
                                                local.tee 35
                                                i32.const 1
                                                i32.lt_s
                                                br_if 1 (;@21;)
                                                i32.const 0
                                                local.set 36
                                                local.get 0
                                                i32.const 432
                                                i32.add
                                                local.set 37
                                                i32.const 4
                                                local.set 38
                                                i32.const -1
                                                local.set 39
                                                i32.const 20
                                                local.set 40
                                                i32.const 1
                                                local.set 41
                                                i32.const 4
                                                local.set 11
                                                br 17 (;@5;)
                                              end
                                              local.get 0
                                              i32.const 256
                                              i32.add
                                              local.set 3
                                              local.get 37
                                              local.set 2
                                              local.get 35
                                              local.set 11
                                              loop  ;; label = @22
                                                local.get 3
                                                local.get 3
                                                i32.load
                                                local.get 2
                                                i32.load
                                                i32.add
                                                i32.store
                                                local.get 2
                                                local.get 38
                                                i32.add
                                                local.set 2
                                                local.get 3
                                                local.get 38
                                                i32.add
                                                local.set 3
                                                local.get 11
                                                local.get 39
                                                i32.add
                                                local.tee 11
                                                br_if 0 (;@22;)
                                              end
                                              local.get 37
                                              local.get 40
                                              i32.add
                                              local.set 37
                                              local.get 36
                                              local.get 41
                                              i32.add
                                              local.tee 36
                                              local.get 34
                                              i32.ne
                                              br_if 7 (;@14;)
                                            end
                                            i32.const 1266
                                            i32.const 0
                                            call $printf
                                            drop
                                            block  ;; label = @21
                                              local.get 0
                                              i32.load offset=188
                                              local.get 27
                                              i32.lt_s
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 256
                                              i32.add
                                              local.set 3
                                              i32.const 0
                                              local.set 2
                                              loop  ;; label = @22
                                                local.get 0
                                                local.get 3
                                                i32.load
                                                i32.store offset=48
                                                i32.const 1201
                                                local.get 0
                                                i32.const 48
                                                i32.add
                                                call $printf
                                                drop
                                                local.get 3
                                                i32.const 4
                                                i32.add
                                                local.set 3
                                                local.get 2
                                                i32.const 1
                                                i32.add
                                                local.tee 2
                                                local.get 0
                                                i32.load offset=188
                                                local.tee 42
                                                i32.lt_s
                                                br_if 0 (;@22;)
                                              end
                                              local.get 42
                                              i32.const 1
                                              i32.lt_s
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 288
                                              i32.add
                                              local.set 3
                                              local.get 0
                                              i32.const 256
                                              i32.add
                                              local.set 2
                                              local.get 0
                                              i32.const 224
                                              i32.add
                                              local.set 11
                                              loop  ;; label = @22
                                                local.get 3
                                                local.get 11
                                                i32.load
                                                local.get 2
                                                i32.load
                                                i32.sub
                                                i32.store
                                                local.get 11
                                                i32.const 4
                                                i32.add
                                                local.set 11
                                                local.get 2
                                                i32.const 4
                                                i32.add
                                                local.set 2
                                                local.get 3
                                                i32.const 4
                                                i32.add
                                                local.set 3
                                                local.get 42
                                                i32.const -1
                                                i32.add
                                                local.tee 42
                                                br_if 0 (;@22;)
                                              end
                                            end
                                            i32.const 1289
                                            i32.const 0
                                            call $printf
                                            drop
                                            block  ;; label = @21
                                              local.get 0
                                              i32.load offset=188
                                              i32.const 1
                                              i32.lt_s
                                              br_if 0 (;@21;)
                                              i32.const 0
                                              local.set 42
                                              local.get 0
                                              i32.const 288
                                              i32.add
                                              local.set 3
                                              loop  ;; label = @22
                                                local.get 0
                                                local.get 3
                                                i32.load
                                                i32.store offset=32
                                                i32.const 1201
                                                local.get 0
                                                i32.const 32
                                                i32.add
                                                call $printf
                                                drop
                                                local.get 3
                                                i32.const 4
                                                i32.add
                                                local.set 3
                                                local.get 42
                                                i32.const 1
                                                i32.add
                                                local.tee 42
                                                local.get 0
                                                i32.load offset=188
                                                i32.lt_s
                                                br_if 0 (;@22;)
                                              end
                                            end
                                            i32.const 10
                                            call $putchar
                                            drop
                                            local.get 1
                                            i32.eqz
                                            br_if 1 (;@19;)
                                            i32.const 1
                                            local.set 43
                                            i32.const 0
                                            local.set 44
                                            i32.const 2
                                            local.set 45
                                            i32.const 20
                                            local.set 46
                                            i32.const 4
                                            local.set 42
                                            i32.const 1312
                                            local.set 47
                                            i32.const -1
                                            local.set 48
                                            i32.const 1374
                                            local.set 49
                                            i32.const 1405
                                            local.set 50
                                            i32.const 1201
                                            local.set 51
                                            i32.const 5
                                            local.set 11
                                            br 18 (;@2;)
                                          end
                                          block  ;; label = @20
                                            local.get 0
                                            i32.load offset=184
                                            local.tee 52
                                            local.get 43
                                            i32.lt_s
                                            br_if 0 (;@20;)
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                local.get 0
                                                i32.load offset=188
                                                local.tee 53
                                                local.get 44
                                                i32.le_s
                                                br_if 0 (;@22;)
                                                i32.const 0
                                                local.set 54
                                                local.get 0
                                                i32.const 432
                                                i32.add
                                                local.set 55
                                                local.get 0
                                                i32.const 320
                                                i32.add
                                                local.set 56
                                                loop  ;; label = @23
                                                  block  ;; label = @24
                                                    local.get 0
                                                    i32.const 192
                                                    i32.add
                                                    local.get 54
                                                    local.get 45
                                                    i32.shl
                                                    i32.add
                                                    local.tee 57
                                                    i32.load
                                                    i32.eqz
                                                    br_if 0 (;@24;)
                                                    i32.const 0
                                                    local.set 58
                                                    local.get 0
                                                    i32.const 288
                                                    i32.add
                                                    local.set 3
                                                    local.get 56
                                                    local.set 2
                                                    local.get 55
                                                    local.set 11
                                                    loop  ;; label = @25
                                                      local.get 2
                                                      i32.load
                                                      local.get 11
                                                      i32.load
                                                      i32.sub
                                                      local.get 3
                                                      i32.load
                                                      i32.gt_s
                                                      br_if 1 (;@24;)
                                                      local.get 2
                                                      local.get 42
                                                      i32.add
                                                      local.set 2
                                                      local.get 11
                                                      local.get 42
                                                      i32.add
                                                      local.set 11
                                                      local.get 3
                                                      local.get 42
                                                      i32.add
                                                      local.set 3
                                                      local.get 58
                                                      local.get 43
                                                      i32.add
                                                      local.tee 58
                                                      local.get 53
                                                      i32.lt_s
                                                      br_if 0 (;@25;)
                                                      br 4 (;@21;)
                                                    end
                                                  end
                                                  local.get 56
                                                  local.get 46
                                                  i32.add
                                                  local.set 56
                                                  local.get 55
                                                  local.get 46
                                                  i32.add
                                                  local.set 55
                                                  local.get 54
                                                  local.get 43
                                                  i32.add
                                                  local.tee 54
                                                  local.get 52
                                                  i32.lt_s
                                                  br_if 0 (;@23;)
                                                  br 3 (;@20;)
                                                end
                                              end
                                              i32.const 0
                                              local.set 54
                                              local.get 0
                                              i32.const 192
                                              i32.add
                                              local.set 57
                                              loop  ;; label = @22
                                                local.get 57
                                                i32.load
                                                br_if 1 (;@21;)
                                                local.get 57
                                                local.get 42
                                                i32.add
                                                local.set 57
                                                local.get 54
                                                local.get 43
                                                i32.add
                                                local.tee 54
                                                local.get 52
                                                i32.lt_s
                                                br_if 0 (;@22;)
                                                br 2 (;@20;)
                                              end
                                            end
                                            local.get 0
                                            local.get 54
                                            local.get 43
                                            i32.add
                                            i32.store offset=16
                                            local.get 47
                                            local.get 0
                                            i32.const 16
                                            i32.add
                                            call $printf
                                            drop
                                            local.get 57
                                            local.get 44
                                            i32.store
                                            block  ;; label = @21
                                              local.get 0
                                              i32.load offset=188
                                              local.tee 11
                                              local.get 43
                                              i32.lt_s
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 432
                                              i32.add
                                              local.get 54
                                              local.get 46
                                              i32.mul
                                              i32.add
                                              local.set 2
                                              local.get 0
                                              i32.const 288
                                              i32.add
                                              local.set 3
                                              loop  ;; label = @22
                                                local.get 3
                                                local.get 3
                                                i32.load
                                                local.get 2
                                                i32.load
                                                i32.add
                                                i32.store
                                                local.get 2
                                                local.get 42
                                                i32.add
                                                local.set 2
                                                local.get 3
                                                local.get 42
                                                i32.add
                                                local.set 3
                                                local.get 11
                                                local.get 48
                                                i32.add
                                                local.tee 11
                                                br_if 0 (;@22;)
                                              end
                                            end
                                            local.get 1
                                            local.get 48
                                            i32.add
                                            local.set 1
                                            local.get 49
                                            local.get 44
                                            call $printf
                                            drop
                                            local.get 50
                                            local.get 44
                                            call $printf
                                            drop
                                            block  ;; label = @21
                                              local.get 0
                                              i32.load offset=188
                                              local.get 43
                                              i32.lt_s
                                              br_if 0 (;@21;)
                                              i32.const 0
                                              local.set 2
                                              local.get 0
                                              i32.const 288
                                              i32.add
                                              local.set 3
                                              loop  ;; label = @22
                                                local.get 0
                                                local.get 3
                                                i32.load
                                                i32.store
                                                local.get 51
                                                local.get 0
                                                call $printf
                                                drop
                                                local.get 3
                                                local.get 42
                                                i32.add
                                                local.set 3
                                                local.get 2
                                                local.get 43
                                                i32.add
                                                local.tee 2
                                                local.get 0
                                                i32.load offset=188
                                                i32.lt_s
                                                br_if 0 (;@22;)
                                              end
                                            end
                                            local.get 1
                                            br_if 7 (;@13;)
                                            br 1 (;@19;)
                                          end
                                          i32.const 1338
                                          i32.const 0
                                          call $printf
                                          drop
                                        end
                                        local.get 0
                                        i32.const 544
                                        i32.add
                                        global.set 0
                                        i32.const 0
                                        return
                                      end
                                      i32.const 0
                                      local.set 11
                                      br 5 (;@12;)
                                    end
                                    i32.const 1
                                    local.set 11
                                    br 6 (;@10;)
                                  end
                                  i32.const 2
                                  local.set 11
                                  br 7 (;@8;)
                                end
                                i32.const 3
                                local.set 11
                                br 8 (;@6;)
                              end
                              i32.const 4
                              local.set 11
                              br 9 (;@4;)
                            end
                            i32.const 5
                            local.set 11
                            br 9 (;@3;)
                          end
                          i32.const 1
                          local.set 3
                          br 10 (;@1;)
                        end
                        i32.const 1
                        local.set 3
                        br 9 (;@1;)
                      end
                      i32.const 1
                      local.set 3
                      br 8 (;@1;)
                    end
                    i32.const 1
                    local.set 3
                    br 7 (;@1;)
                  end
                  i32.const 1
                  local.set 3
                  br 6 (;@1;)
                end
                i32.const 1
                local.set 3
                br 5 (;@1;)
              end
              i32.const 1
              local.set 3
              br 4 (;@1;)
            end
            i32.const 1
            local.set 3
            br 3 (;@1;)
          end
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        i32.const 1
        local.set 3
        br 1 (;@1;)
      end
      i32.const 1
      local.set 3
      br 0 (;@1;)
    end)
  (func $main (type 0) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66976))
  (global (;1;) i32 (i32.const 66976))
  (global (;2;) i32 (i32.const 1425))
  (global (;3;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "\0aEnter the number of resources: \00%d\00\0aEnter the number of processes: \00\0aEnter Claim Vector: \00\0aEnter Allocated Resource Table: \00\0aEnter Maximum Claim table: \00\0aThe Claim Vector is: \00%d \00\0aThe Allocated Resource Table:\00\09%d\00\0aThe Maximum Claim Table:\00\0aAllocated resources: \00\0aAvailable resources: \00\0aProcess%d is executing.\0a\00\0aThe processes are in unsafe state.\00\0aThe process is in safe state.\00\0aAvailable vector: \00"))
