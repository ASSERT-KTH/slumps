(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func))
  (type (;4;) (func (param i32)))
  (type (;5;) (func (result i32)))
  (import "env" "printf" (func $printf (type 0)))
  (import "env" "puts" (func $puts (type 1)))
  (import "env" "memcpy" (func $memcpy (type 2)))
  (import "env" "memset" (func $memset (type 2)))
  (func $__wasm_call_ctors (type 3))
  (func $printHouses (type 4) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 192
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 160
    i32.add
    i32.const 20
    i32.add
    i32.const 1103
    i32.store
    local.get 1
    i32.const 160
    i32.add
    i32.const 16
    i32.add
    i32.const 1096
    i32.store
    local.get 1
    i32.const 1090
    i32.store offset=172
    local.get 1
    i32.const 1086
    i32.store offset=168
    local.get 1
    i32.const 1080
    i32.store offset=164
    local.get 1
    i32.const 1074
    i32.store offset=160
    i32.const 1024
    local.get 1
    i32.const 160
    i32.add
    call $printf
    drop
    i32.const 0
    local.set 2
    i32.const 0
    local.set 3
    loop  ;; label = @1
      local.get 1
      local.get 3
      i32.store offset=144
      i32.const 1109
      local.get 1
      i32.const 144
      i32.add
      call $printf
      drop
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          local.get 2
          i32.add
          local.tee 4
          i32.load
          local.tee 5
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 1
          local.get 5
          i32.const 2
          i32.shl
          i32.const 1120
          i32.add
          i32.load
          i32.store offset=112
          i32.const 1140
          local.get 1
          i32.const 112
          i32.add
          call $printf
          drop
          br 1 (;@2;)
        end
        local.get 1
        i32.const 1149
        i32.store offset=128
        i32.const 1140
        local.get 1
        i32.const 128
        i32.add
        call $printf
        drop
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 4
          i32.add
          i32.load
          local.tee 5
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 1
          local.get 5
          i32.const 2
          i32.shl
          i32.const 1152
          i32.add
          i32.load
          i32.store offset=80
          i32.const 1140
          local.get 1
          i32.const 80
          i32.add
          call $printf
          drop
          br 1 (;@2;)
        end
        local.get 1
        i32.const 1149
        i32.store offset=96
        i32.const 1140
        local.get 1
        i32.const 96
        i32.add
        call $printf
        drop
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 8
          i32.add
          i32.load
          local.tee 5
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 1
          local.get 5
          i32.const 2
          i32.shl
          i32.const 1184
          i32.add
          i32.load
          i32.store offset=48
          i32.const 1140
          local.get 1
          i32.const 48
          i32.add
          call $printf
          drop
          br 1 (;@2;)
        end
        local.get 1
        i32.const 1149
        i32.store offset=64
        i32.const 1140
        local.get 1
        i32.const 64
        i32.add
        call $printf
        drop
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 12
          i32.add
          i32.load
          local.tee 5
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 1
          local.get 5
          i32.const 2
          i32.shl
          i32.const 1216
          i32.add
          i32.load
          i32.store offset=16
          i32.const 1140
          local.get 1
          i32.const 16
          i32.add
          call $printf
          drop
          br 1 (;@2;)
        end
        local.get 1
        i32.const 1149
        i32.store offset=32
        i32.const 1140
        local.get 1
        i32.const 32
        i32.add
        call $printf
        drop
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 16
          i32.add
          i32.load
          local.tee 4
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 1
          local.get 4
          i32.const 2
          i32.shl
          i32.const 1248
          i32.add
          i32.load
          i32.store
          i32.const 1268
          local.get 1
          call $printf
          drop
          br 1 (;@2;)
        end
        i32.const 1149
        call $puts
        drop
      end
      local.get 3
      i32.const 1
      i32.add
      local.set 3
      local.get 2
      i32.const 20
      i32.add
      local.tee 2
      i32.const 100
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 1
    i32.const 192
    i32.add
    global.set 0)
  (func $checkHouses (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 48
        i32.add
        i32.load
        local.tee 2
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 2
        i32.const 2
        i32.ne
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 1
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 2
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 2
        i32.const 4
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 0
      i32.const 72
      i32.add
      local.set 3
      local.get 0
      i32.const 68
      i32.add
      local.set 4
      local.get 0
      i32.const 28
      i32.add
      local.set 5
      i32.const 0
      local.set 6
      i32.const 0
      local.set 7
      i32.const 0
      local.set 8
      i32.const 0
      local.set 9
      i32.const 0
      local.set 10
      i32.const 0
      local.set 11
      i32.const 0
      local.set 12
      i32.const 0
      local.set 13
      i32.const 0
      local.set 14
      i32.const 0
      local.set 15
      i32.const 0
      local.set 16
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 6
            i32.const 20
            i32.mul
            i32.add
            local.tee 2
            i32.load
            local.tee 17
            i32.const 0
            i32.lt_s
            local.tee 18
            br_if 0 (;@4;)
            i32.const 1
            local.get 17
            i32.shl
            local.tee 1
            local.get 15
            i32.or
            local.set 15
            local.get 1
            local.get 16
            i32.add
            local.set 16
          end
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            local.tee 19
            i32.const 0
            i32.lt_s
            local.tee 20
            br_if 0 (;@4;)
            i32.const 1
            local.get 19
            i32.shl
            local.tee 1
            local.get 13
            i32.or
            local.set 13
            local.get 1
            local.get 14
            i32.add
            local.set 14
          end
          block  ;; label = @4
            local.get 2
            i32.load offset=8
            local.tee 21
            i32.const 0
            i32.lt_s
            local.tee 22
            br_if 0 (;@4;)
            i32.const 1
            local.get 21
            i32.shl
            local.tee 1
            local.get 11
            i32.or
            local.set 11
            local.get 1
            local.get 12
            i32.add
            local.set 12
          end
          block  ;; label = @4
            local.get 2
            i32.load offset=12
            local.tee 23
            i32.const 0
            i32.lt_s
            local.tee 24
            br_if 0 (;@4;)
            i32.const 1
            local.get 23
            i32.shl
            local.tee 1
            local.get 9
            i32.or
            local.set 9
            local.get 1
            local.get 10
            i32.add
            local.set 10
          end
          block  ;; label = @4
            local.get 2
            i32.load offset=16
            local.tee 25
            i32.const 0
            i32.lt_s
            local.tee 26
            br_if 0 (;@4;)
            i32.const 1
            local.get 25
            i32.shl
            local.tee 1
            local.get 7
            i32.or
            local.set 7
            local.get 1
            local.get 8
            i32.add
            local.set 8
          end
          block  ;; label = @4
            local.get 20
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 18
              br_if 0 (;@5;)
              i32.const 0
              local.set 1
              block  ;; label = @6
                local.get 17
                i32.eqz
                br_if 0 (;@6;)
                local.get 19
                i32.eqz
                br_if 5 (;@1;)
              end
              local.get 19
              i32.eqz
              br_if 0 (;@5;)
              local.get 17
              i32.eqz
              br_if 4 (;@1;)
            end
            block  ;; label = @5
              local.get 24
              br_if 0 (;@5;)
              i32.const 0
              local.set 1
              block  ;; label = @6
                local.get 19
                i32.const 1
                i32.ne
                br_if 0 (;@6;)
                local.get 23
                br_if 5 (;@1;)
              end
              local.get 19
              i32.const 1
              i32.eq
              br_if 0 (;@5;)
              local.get 23
              i32.eqz
              br_if 4 (;@1;)
            end
            local.get 22
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            block  ;; label = @5
              local.get 19
              i32.const 2
              i32.ne
              br_if 0 (;@5;)
              local.get 21
              br_if 4 (;@1;)
            end
            local.get 19
            i32.const 2
            i32.eq
            br_if 0 (;@4;)
            local.get 21
            i32.eqz
            br_if 3 (;@1;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 6
                i32.eqz
                br_if 0 (;@6;)
                local.get 18
                br_if 2 (;@4;)
                local.get 2
                i32.const -20
                i32.add
                i32.load
                local.set 27
                i32.const 0
                local.set 1
                block  ;; label = @7
                  local.get 17
                  i32.const 2
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 27
                  i32.const 1
                  i32.eq
                  br_if 6 (;@1;)
                end
                block  ;; label = @7
                  local.get 27
                  i32.const 1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 17
                  i32.const 2
                  i32.eq
                  br_if 6 (;@1;)
                end
                local.get 22
                i32.eqz
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              local.get 21
              local.get 17
              i32.or
              i32.const 0
              i32.lt_s
              br_if 1 (;@4;)
            end
            i32.const 0
            local.set 1
            block  ;; label = @5
              local.get 17
              i32.const 1
              i32.ne
              br_if 0 (;@5;)
              local.get 21
              i32.const 1
              i32.ne
              br_if 4 (;@1;)
            end
            local.get 17
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            local.get 21
            i32.const 1
            i32.eq
            br_if 3 (;@1;)
          end
          i32.const 0
          local.set 27
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 25
                  i32.const 0
                  i32.lt_s
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 24
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 1
                    block  ;; label = @9
                      local.get 23
                      i32.const 1
                      i32.eq
                      local.tee 23
                      br_if 0 (;@9;)
                      local.get 25
                      i32.eqz
                      br_if 8 (;@1;)
                    end
                    local.get 25
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 23
                    br_if 7 (;@1;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 18
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 1
                            block  ;; label = @13
                              local.get 17
                              i32.const 3
                              i32.eq
                              local.tee 17
                              br_if 0 (;@13;)
                              local.get 25
                              i32.const 1
                              i32.eq
                              br_if 12 (;@1;)
                            end
                            local.get 25
                            i32.const 1
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 17
                            br_if 11 (;@1;)
                          end
                          local.get 25
                          i32.const 1
                          i32.eq
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 1
                          local.get 25
                          i32.const 2
                          i32.ne
                          br_if 3 (;@8;)
                          local.get 6
                          i32.const 2147483647
                          i32.and
                          local.tee 1
                          i32.const 4
                          i32.eq
                          br_if 1 (;@10;)
                          local.get 1
                          br_if 2 (;@9;)
                          i32.const 0
                          local.set 1
                          local.get 0
                          i32.const 32
                          i32.add
                          i32.load
                          local.tee 17
                          i32.const 0
                          i32.lt_s
                          br_if 2 (;@9;)
                          local.get 17
                          i32.const 2
                          i32.eq
                          br_if 2 (;@9;)
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 6
                            i32.const 2147483647
                            i32.and
                            local.tee 1
                            i32.const 4
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 1
                            br_if 1 (;@11;)
                            i32.const 0
                            local.set 1
                            local.get 0
                            i32.const 32
                            i32.add
                            i32.load
                            local.tee 17
                            i32.const 0
                            i32.lt_s
                            br_if 1 (;@11;)
                            local.get 17
                            i32.const 3
                            i32.eq
                            br_if 1 (;@11;)
                            br 11 (;@1;)
                          end
                          local.get 3
                          i32.load
                          i32.const 3
                          i32.ne
                          br_if 9 (;@2;)
                        end
                        i32.const 0
                        local.set 1
                        local.get 2
                        i32.const 32
                        i32.add
                        i32.load
                        local.tee 17
                        i32.const 0
                        i32.lt_s
                        br_if 2 (;@8;)
                        local.get 17
                        i32.const 3
                        i32.eq
                        br_if 2 (;@8;)
                        i32.const 0
                        local.set 1
                        local.get 2
                        i32.const -8
                        i32.add
                        i32.load
                        i32.const 3
                        i32.eq
                        br_if 2 (;@8;)
                        br 9 (;@1;)
                      end
                      local.get 3
                      i32.load
                      i32.const 2
                      i32.ne
                      br_if 7 (;@2;)
                    end
                    i32.const 1
                    local.set 1
                    local.get 2
                    i32.const 32
                    i32.add
                    i32.load
                    local.tee 17
                    i32.const 0
                    i32.lt_s
                    br_if 0 (;@8;)
                    local.get 17
                    i32.const 2
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const -8
                    i32.add
                    i32.load
                    i32.const 2
                    i32.ne
                    br_if 6 (;@2;)
                  end
                  local.get 22
                  br_if 1 (;@6;)
                  block  ;; label = @8
                    local.get 21
                    i32.const 3
                    i32.eq
                    local.tee 17
                    br_if 0 (;@8;)
                    local.get 25
                    i32.const 3
                    i32.eq
                    br_if 6 (;@2;)
                  end
                  local.get 25
                  i32.const 3
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 1
                  local.set 27
                  i32.const 0
                  local.set 1
                  local.get 17
                  br_if 6 (;@1;)
                end
                local.get 20
                br_if 2 (;@4;)
                br 1 (;@5;)
              end
              local.get 1
              local.set 27
              local.get 20
              br_if 1 (;@4;)
            end
            block  ;; label = @5
              local.get 26
              br_if 0 (;@5;)
              i32.const 0
              local.set 1
              block  ;; label = @6
                local.get 19
                i32.const 3
                i32.ne
                br_if 0 (;@6;)
                local.get 25
                i32.const 4
                i32.ne
                br_if 5 (;@1;)
              end
              local.get 19
              i32.const 3
              i32.eq
              br_if 1 (;@4;)
              local.get 25
              i32.const 4
              i32.eq
              br_if 4 (;@1;)
            end
            local.get 19
            i32.const 4
            i32.ne
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 6
              i32.const 3
              i32.gt_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 1
              local.get 2
              i32.const 20
              i32.add
              i32.load
              local.tee 25
              i32.const 0
              i32.lt_s
              br_if 0 (;@5;)
              local.get 25
              i32.const 4
              i32.ne
              br_if 4 (;@1;)
            end
            local.get 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.const -20
            i32.add
            i32.load
            i32.const 4
            i32.ne
            br_if 2 (;@2;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 27
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 2147483647
                  i32.and
                  local.tee 1
                  i32.const 4
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 1
                  br_if 2 (;@5;)
                  i32.const 0
                  local.set 1
                  local.get 5
                  i32.load
                  local.tee 25
                  i32.const 0
                  i32.lt_s
                  br_if 2 (;@5;)
                  local.get 25
                  i32.const 4
                  i32.eq
                  br_if 2 (;@5;)
                  br 6 (;@1;)
                end
                local.get 6
                i32.const 1
                i32.add
                local.tee 6
                i32.const 5
                i32.lt_u
                br_if 3 (;@3;)
                br 2 (;@4;)
              end
              local.get 4
              i32.load
              i32.const 4
              i32.ne
              br_if 3 (;@2;)
            end
            block  ;; label = @5
              local.get 0
              local.get 6
              i32.const 1
              i32.add
              local.tee 6
              i32.const 20
              i32.mul
              i32.add
              i32.load offset=8
              local.tee 1
              i32.const 0
              i32.lt_s
              br_if 0 (;@5;)
              local.get 1
              i32.const 4
              i32.eq
              br_if 0 (;@5;)
              local.get 2
              i32.const -12
              i32.add
              i32.load
              i32.const 4
              i32.ne
              br_if 3 (;@2;)
            end
            local.get 6
            i32.const 5
            i32.lt_u
            br_if 1 (;@3;)
          end
        end
        i32.const 0
        local.set 1
        local.get 16
        local.get 15
        i32.ne
        br_if 1 (;@1;)
        local.get 14
        local.get 13
        i32.ne
        br_if 1 (;@1;)
        local.get 12
        local.get 11
        i32.ne
        br_if 1 (;@1;)
        local.get 10
        local.get 9
        i32.ne
        br_if 1 (;@1;)
        local.get 8
        local.get 7
        i32.ne
        br_if 1 (;@1;)
        i32.const 1
        i32.const 1
        i32.const 1
        i32.const 1
        i32.const 1
        i32.const 2
        local.get 8
        i32.const 31
        i32.ne
        select
        local.get 10
        i32.const 31
        i32.ne
        select
        local.get 12
        i32.const 31
        i32.ne
        select
        local.get 14
        i32.const 31
        i32.ne
        select
        local.get 16
        i32.const 31
        i32.ne
        select
        return
      end
      i32.const 0
      return
    end
    local.get 1)
  (func $bruteFill (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      local.get 0
      call $checkHouses
      local.tee 4
      i32.const 2
      i32.or
      i32.const 2
      i32.eq
      br_if 0 (;@1;)
      local.get 3
      local.get 0
      i32.const 100
      call $memcpy
      local.tee 5
      local.get 1
      i32.const 20
      i32.mul
      i32.add
      local.get 2
      i32.const 2
      i32.shl
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i32.const 1
      i32.add
      i32.const 0
      local.get 2
      i32.const 4
      i32.lt_s
      select
      local.set 6
      local.get 2
      i32.const 3
      i32.gt_s
      local.get 1
      i32.add
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          call $checkHouses
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 2
          local.get 6
          call $bruteFill
          local.tee 1
          br_if 1 (;@2;)
        end
        local.get 4
        i32.const 1
        i32.store
        block  ;; label = @3
          local.get 5
          call $checkHouses
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 2
          local.get 6
          call $bruteFill
          local.tee 1
          br_if 1 (;@2;)
        end
        local.get 4
        i32.const 2
        i32.store
        block  ;; label = @3
          local.get 5
          call $checkHouses
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 2
          local.get 6
          call $bruteFill
          local.tee 1
          br_if 1 (;@2;)
        end
        local.get 4
        i32.const 3
        i32.store
        block  ;; label = @3
          local.get 5
          call $checkHouses
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 2
          local.get 6
          call $bruteFill
          local.tee 1
          br_if 1 (;@2;)
        end
        local.get 4
        i32.const 4
        i32.store
        i32.const 0
        local.set 4
        local.get 5
        call $checkHouses
        i32.eqz
        br_if 1 (;@1;)
        local.get 5
        local.get 2
        local.get 6
        call $bruteFill
        local.tee 1
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 5
      i32.const 100
      call $memcpy
      drop
      local.get 1
      local.set 4
    end
    local.get 3
    i32.const 112
    i32.add
    global.set 0
    local.get 4)
  (func $__original_main (type 5) (result i32)
    (local i32)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 255
    i32.const 100
    call $memset
    local.tee 0
    i32.const 0
    i32.const 0
    call $bruteFill
    drop
    local.get 0
    call $printHouses
    local.get 0
    i32.const 112
    i32.add
    global.set 0
    i32.const 0)
  (func $main (type 0) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66976))
  (global (;1;) i32 (i32.const 66976))
  (global (;2;) i32 (i32.const 1437))
  (global (;3;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "printHouses" (func $printHouses))
  (export "checkHouses" (func $checkHouses))
  (export "bruteFill" (func $bruteFill))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s\0a\00House\00Color\00Man\00Drink\00Animal\00Smoke\00%-10d\00\00\00\00\00\00\81\05\00\00\85\05\00\00\8b\05\00\00\91\05\00\00\98\05\00\00%-10.10s\00-\00\00]\05\00\00e\05\00\00k\05\00\00p\05\00\00w\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00B\05\00\00F\05\00\00M\05\00\00R\05\00\00W\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00'\05\00\00+\05\00\001\05\00\006\05\00\00<\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\fe\04\00\00\07\05\00\00\0f\05\00\00\15\05\00\00 \05\00\00%-10.10s\0a\00PallMall\00Dunhill\00Blend\00BlueMaster\00Prince\00Dog\00Birds\00Cats\00Horse\00Zebra\00Tea\00Coffee\00Milk\00Beer\00Water\00English\00Swede\00Dane\00German\00Norwegian\00Red\00Green\00White\00Yellow\00Blue\00"))
