(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32)))
  (type (;5;) (func))
  (import "env" "printf" (func $printf (type 0)))
  (import "env" "usleep" (func $usleep (type 1)))
  (import "env" "rand" (func $rand (type 2)))
  (import "env" "tcgetattr" (func $tcgetattr (type 0)))
  (import "env" "tcsetattr" (func $tcsetattr (type 3)))
  (import "env" "srand" (func $srand (type 4)))
  (import "env" "time" (func $time (type 1)))
  (import "env" "_IO_getc" (func $_IO_getc (type 1)))
  (import "env" "putchar" (func $putchar (type 1)))
  (import "env" "puts" (func $puts (type 1)))
  (func $__wasm_call_ctors (type 5))
  (func $do_draw (type 5)
    (local i32 i32 i32)
    global.get 0
    i32.const 160
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 0
    i32.load offset=1092
    i32.store offset=144
    i32.const 1232
    local.get 0
    i32.const 144
    i32.add
    call $printf
    drop
    block  ;; label = @1
      i32.const 0
      i32.load offset=1096
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store offset=128
      i32.const 1250
      local.get 0
      i32.const 128
      i32.add
      call $printf
      drop
    end
    i32.const 10
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 10
    call $putchar
    drop
    i32.const -16
    local.set 1
    loop  ;; label = @1
      i32.const 124
      call $putchar
      drop
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 1040
          i32.add
          i32.load
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.store offset=116
          local.get 0
          local.get 2
          i32.const 2
          i32.shl
          local.tee 2
          i32.const 1264
          i32.add
          i32.load
          i32.store offset=120
          local.get 0
          local.get 2
          i32.const 1408
          i32.add
          i32.load
          i32.store offset=112
          i32.const 1312
          local.get 0
          i32.const 112
          i32.add
          call $printf
          drop
          br 1 (;@2;)
        end
        local.get 0
        i32.const 1338
        i32.store offset=100
        local.get 0
        i32.const 4
        i32.store offset=96
        i32.const 1332
        local.get 0
        i32.const 96
        i32.add
        call $printf
        drop
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 1056
          i32.add
          i32.load
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.store offset=84
          local.get 0
          local.get 2
          i32.const 2
          i32.shl
          local.tee 2
          i32.const 1264
          i32.add
          i32.load
          i32.store offset=88
          local.get 0
          local.get 2
          i32.const 1408
          i32.add
          i32.load
          i32.store offset=80
          i32.const 1312
          local.get 0
          i32.const 80
          i32.add
          call $printf
          drop
          br 1 (;@2;)
        end
        local.get 0
        i32.const 1338
        i32.store offset=68
        local.get 0
        i32.const 4
        i32.store offset=64
        i32.const 1332
        local.get 0
        i32.const 64
        i32.add
        call $printf
        drop
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 1072
          i32.add
          i32.load
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.store offset=52
          local.get 0
          local.get 2
          i32.const 2
          i32.shl
          local.tee 2
          i32.const 1264
          i32.add
          i32.load
          i32.store offset=56
          local.get 0
          local.get 2
          i32.const 1408
          i32.add
          i32.load
          i32.store offset=48
          i32.const 1312
          local.get 0
          i32.const 48
          i32.add
          call $printf
          drop
          br 1 (;@2;)
        end
        local.get 0
        i32.const 1338
        i32.store offset=36
        local.get 0
        i32.const 4
        i32.store offset=32
        i32.const 1332
        local.get 0
        i32.const 32
        i32.add
        call $printf
        drop
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 1088
          i32.add
          i32.load
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.store offset=20
          local.get 0
          local.get 2
          i32.const 2
          i32.shl
          local.tee 2
          i32.const 1264
          i32.add
          i32.load
          i32.store offset=24
          local.get 0
          local.get 2
          i32.const 1408
          i32.add
          i32.load
          i32.store offset=16
          i32.const 1312
          local.get 0
          i32.const 16
          i32.add
          call $printf
          drop
          br 1 (;@2;)
        end
        local.get 0
        i32.const 1338
        i32.store offset=4
        local.get 0
        i32.const 4
        i32.store
        i32.const 1332
        local.get 0
        call $printf
        drop
      end
      i32.const 10
      call $putchar
      drop
      local.get 1
      i32.const 4
      i32.add
      local.tee 1
      br_if 0 (;@1;)
    end
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 45
    call $putchar
    drop
    i32.const 10
    call $putchar
    drop
    local.get 0
    i32.const 160
    i32.add
    global.set 0)
  (func $do_merge (type 4) (param i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    i32.const 0
    i32.store offset=1096
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.add
      local.tee 0
      i32.const 3
      i32.gt_u
      br_if 0 (;@1;)
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
                          local.get 0
                          br_table 0 (;@11;) 3 (;@8;) 1 (;@10;) 2 (;@9;) 0 (;@11;)
                        end
                        i32.const 0
                        i32.load offset=1028
                        local.set 1
                        i32.const 0
                        i32.load offset=1024
                        local.tee 2
                        i32.eqz
                        br_if 3 (;@7;)
                        i32.const 0
                        local.set 0
                        local.get 2
                        local.get 1
                        i32.ne
                        br_if 4 (;@6;)
                        i32.const 0
                        local.set 1
                        i32.const 0
                        i32.const 1
                        i32.store offset=1088
                        i32.const 0
                        local.get 2
                        i32.const 1
                        i32.add
                        local.tee 0
                        i32.store offset=1024
                        i32.const 0
                        i32.const 0
                        i32.load offset=1100
                        i32.const -1
                        i32.add
                        i32.store offset=1100
                        i32.const 0
                        local.get 0
                        i32.const 2
                        i32.shl
                        i32.const 1264
                        i32.add
                        i32.load
                        local.tee 0
                        i32.store offset=1096
                        i32.const 0
                        i32.const 0
                        i32.load offset=1092
                        local.get 0
                        i32.add
                        i32.store offset=1092
                        i32.const 0
                        i32.const 0
                        i32.store offset=1028
                        br 4 (;@6;)
                      end
                      i32.const 0
                      local.set 0
                      i32.const 0
                      local.set 1
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.const 1072
                          i32.add
                          local.tee 2
                          i32.load
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 3
                          local.get 0
                          i32.const 1056
                          i32.add
                          local.tee 4
                          i32.load
                          i32.ne
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.const 1
                          i32.store offset=1088
                          local.get 2
                          local.get 2
                          i32.load
                          i32.const 1
                          i32.add
                          local.tee 3
                          i32.store
                          i32.const 0
                          i32.const 0
                          i32.load offset=1100
                          i32.const -1
                          i32.add
                          i32.store offset=1100
                          i32.const 0
                          local.get 1
                          local.get 3
                          i32.const 2
                          i32.shl
                          i32.const 1264
                          i32.add
                          i32.load
                          local.tee 2
                          i32.add
                          local.tee 1
                          i32.store offset=1096
                          local.get 4
                          i32.const 0
                          i32.store
                          i32.const 0
                          i32.const 0
                          i32.load offset=1092
                          local.get 2
                          i32.add
                          i32.store offset=1092
                        end
                        block  ;; label = @11
                          local.get 0
                          i32.const 1076
                          i32.add
                          local.tee 3
                          i32.load
                          local.tee 2
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 2
                          local.get 0
                          i32.const 1060
                          i32.add
                          local.tee 4
                          i32.load
                          i32.ne
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.const 1
                          i32.store offset=1088
                          local.get 3
                          local.get 2
                          i32.const 1
                          i32.add
                          local.tee 2
                          i32.store
                          i32.const 0
                          i32.const 0
                          i32.load offset=1100
                          i32.const -1
                          i32.add
                          i32.store offset=1100
                          i32.const 0
                          local.get 1
                          local.get 2
                          i32.const 2
                          i32.shl
                          i32.const 1264
                          i32.add
                          i32.load
                          local.tee 2
                          i32.add
                          local.tee 1
                          i32.store offset=1096
                          local.get 4
                          i32.const 0
                          i32.store
                          i32.const 0
                          i32.const 0
                          i32.load offset=1092
                          local.get 2
                          i32.add
                          i32.store offset=1092
                        end
                        block  ;; label = @11
                          local.get 0
                          i32.const 1080
                          i32.add
                          local.tee 3
                          i32.load
                          local.tee 2
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 2
                          local.get 0
                          i32.const 1064
                          i32.add
                          local.tee 4
                          i32.load
                          i32.ne
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.const 1
                          i32.store offset=1088
                          local.get 3
                          local.get 2
                          i32.const 1
                          i32.add
                          local.tee 2
                          i32.store
                          i32.const 0
                          i32.const 0
                          i32.load offset=1100
                          i32.const -1
                          i32.add
                          i32.store offset=1100
                          i32.const 0
                          local.get 1
                          local.get 2
                          i32.const 2
                          i32.shl
                          i32.const 1264
                          i32.add
                          i32.load
                          local.tee 2
                          i32.add
                          local.tee 1
                          i32.store offset=1096
                          local.get 4
                          i32.const 0
                          i32.store
                          i32.const 0
                          i32.const 0
                          i32.load offset=1092
                          local.get 2
                          i32.add
                          i32.store offset=1092
                        end
                        block  ;; label = @11
                          local.get 0
                          i32.const 1084
                          i32.add
                          local.tee 3
                          i32.load
                          local.tee 2
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 2
                          local.get 0
                          i32.const 1068
                          i32.add
                          local.tee 4
                          i32.load
                          i32.ne
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.const 1
                          i32.store offset=1088
                          local.get 3
                          local.get 2
                          i32.const 1
                          i32.add
                          i32.store
                          i32.const 0
                          i32.const 0
                          i32.load offset=1100
                          i32.const -1
                          i32.add
                          i32.store offset=1100
                          local.get 4
                          i32.const 0
                          i32.store
                          i32.const 0
                          local.get 1
                          local.get 3
                          i32.load
                          i32.const 2
                          i32.shl
                          i32.const 1264
                          i32.add
                          i32.load
                          local.tee 2
                          i32.add
                          local.tee 1
                          i32.store offset=1096
                          i32.const 0
                          i32.const 0
                          i32.load offset=1092
                          local.get 2
                          i32.add
                          i32.store offset=1092
                        end
                        local.get 0
                        i32.const -16
                        i32.add
                        local.tee 0
                        i32.const -48
                        i32.ne
                        br_if 0 (;@10;)
                        br 9 (;@1;)
                      end
                    end
                    i32.const 0
                    i32.load offset=1040
                    local.set 1
                    i32.const 0
                    i32.load offset=1024
                    local.tee 2
                    i32.eqz
                    br_if 3 (;@5;)
                    i32.const 0
                    local.set 0
                    local.get 2
                    local.get 1
                    i32.ne
                    br_if 4 (;@4;)
                    i32.const 0
                    local.set 1
                    i32.const 0
                    i32.const 1
                    i32.store offset=1088
                    i32.const 0
                    local.get 2
                    i32.const 1
                    i32.add
                    local.tee 0
                    i32.store offset=1024
                    i32.const 0
                    i32.const 0
                    i32.load offset=1100
                    i32.const -1
                    i32.add
                    i32.store offset=1100
                    i32.const 0
                    local.get 0
                    i32.const 2
                    i32.shl
                    i32.const 1264
                    i32.add
                    i32.load
                    local.tee 0
                    i32.store offset=1096
                    i32.const 0
                    i32.const 0
                    i32.load offset=1092
                    local.get 0
                    i32.add
                    i32.store offset=1092
                    i32.const 0
                    i32.const 0
                    i32.store offset=1040
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load offset=1032
                  local.set 1
                  i32.const 0
                  i32.load offset=1036
                  local.tee 2
                  i32.eqz
                  br_if 4 (;@3;)
                  i32.const 0
                  local.set 0
                  local.get 2
                  local.get 1
                  i32.ne
                  br_if 5 (;@2;)
                  i32.const 0
                  local.set 1
                  i32.const 0
                  i32.const 1
                  i32.store offset=1088
                  i32.const 0
                  local.get 2
                  i32.const 1
                  i32.add
                  local.tee 0
                  i32.store offset=1036
                  i32.const 0
                  i32.const 0
                  i32.load offset=1100
                  i32.const -1
                  i32.add
                  i32.store offset=1100
                  i32.const 0
                  local.get 0
                  i32.const 2
                  i32.shl
                  i32.const 1264
                  i32.add
                  i32.load
                  local.tee 0
                  i32.store offset=1096
                  i32.const 0
                  i32.const 0
                  i32.load offset=1092
                  local.get 0
                  i32.add
                  i32.store offset=1092
                  i32.const 0
                  i32.const 0
                  i32.store offset=1032
                  br 5 (;@2;)
                end
                i32.const 0
                local.set 0
              end
              i32.const 0
              i32.load offset=1044
              local.set 2
              block  ;; label = @6
                i32.const 0
                i32.load offset=1040
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                local.get 2
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 2
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 3
                i32.const 1
                i32.add
                local.tee 3
                i32.store offset=1040
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 3
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 3
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 3
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1044
              end
              i32.const 0
              i32.load offset=1060
              local.set 3
              block  ;; label = @6
                i32.const 0
                i32.load offset=1056
                local.tee 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                local.get 3
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 3
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 4
                i32.const 1
                i32.add
                local.tee 4
                i32.store offset=1056
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 4
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 4
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 4
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1060
              end
              i32.const 0
              i32.load offset=1076
              local.set 4
              block  ;; label = @6
                i32.const 0
                i32.load offset=1072
                local.tee 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 4
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 5
                i32.const 1
                i32.add
                local.tee 5
                i32.store offset=1072
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 5
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 5
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 5
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1076
              end
              i32.const 0
              i32.load offset=1032
              local.set 5
              block  ;; label = @6
                local.get 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                local.get 5
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 5
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store offset=1028
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 1
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 1
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1032
              end
              i32.const 0
              i32.load offset=1048
              local.set 1
              block  ;; label = @6
                local.get 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                local.get 1
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 1
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 2
                i32.const 1
                i32.add
                local.tee 2
                i32.store offset=1044
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 2
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 2
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 2
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1048
              end
              i32.const 0
              i32.load offset=1064
              local.set 2
              block  ;; label = @6
                local.get 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                local.get 2
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 2
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 3
                i32.const 1
                i32.add
                local.tee 3
                i32.store offset=1060
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 3
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 3
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 3
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1064
              end
              i32.const 0
              i32.load offset=1080
              local.set 3
              block  ;; label = @6
                local.get 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                local.get 3
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 3
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 4
                i32.const 1
                i32.add
                local.tee 4
                i32.store offset=1076
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 4
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 4
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 4
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1080
              end
              block  ;; label = @6
                local.get 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                i32.const 0
                i32.load offset=1036
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 5
                i32.const 1
                i32.add
                local.tee 4
                i32.store offset=1032
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 4
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 4
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 4
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1036
              end
              block  ;; label = @6
                local.get 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.const 0
                i32.load offset=1052
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store offset=1048
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 1
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 1
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1052
              end
              block  ;; label = @6
                local.get 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                i32.const 0
                i32.load offset=1068
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 2
                i32.const 1
                i32.add
                local.tee 1
                i32.store offset=1064
                i32.const 0
                i32.const 0
                i32.load offset=1100
                i32.const -1
                i32.add
                i32.store offset=1100
                i32.const 0
                local.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.const 1264
                i32.add
                i32.load
                local.tee 1
                i32.add
                local.tee 0
                i32.store offset=1096
                i32.const 0
                i32.const 0
                i32.load offset=1092
                local.get 1
                i32.add
                i32.store offset=1092
                i32.const 0
                i32.const 0
                i32.store offset=1068
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 3
              i32.const 0
              i32.load offset=1084
              i32.ne
              br_if 4 (;@1;)
              i32.const 0
              i64.const 4294967296
              i64.store offset=1084 align=4
              i32.const 0
              local.get 3
              i32.const 1
              i32.add
              local.tee 1
              i32.store offset=1080
              i32.const 0
              i32.const 0
              i32.load offset=1100
              i32.const -1
              i32.add
              i32.store offset=1100
              i32.const 0
              local.get 0
              local.get 1
              i32.const 2
              i32.shl
              i32.const 1264
              i32.add
              i32.load
              local.tee 1
              i32.add
              i32.store offset=1096
              i32.const 0
              i32.const 0
              i32.load offset=1092
              local.get 1
              i32.add
              i32.store offset=1092
              br 4 (;@1;)
            end
            i32.const 0
            local.set 0
          end
          i32.const 0
          i32.load offset=1044
          local.set 2
          block  ;; label = @4
            i32.const 0
            i32.load offset=1028
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 2
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 2
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.store offset=1028
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 3
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 3
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 3
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1044
          end
          i32.const 0
          i32.load offset=1048
          local.set 3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1032
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.get 3
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 3
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.store offset=1032
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 4
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 4
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 4
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1048
          end
          i32.const 0
          i32.load offset=1052
          local.set 4
          block  ;; label = @4
            i32.const 0
            i32.load offset=1036
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            local.get 4
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 5
            i32.const 1
            i32.add
            local.tee 5
            i32.store offset=1036
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 5
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 5
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 5
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1052
          end
          i32.const 0
          i32.load offset=1056
          local.set 5
          block  ;; label = @4
            local.get 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            local.get 5
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.store offset=1040
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 1
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 1
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1056
          end
          i32.const 0
          i32.load offset=1060
          local.set 1
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            i32.store offset=1044
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 2
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 2
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 2
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1060
          end
          i32.const 0
          i32.load offset=1064
          local.set 2
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 2
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 2
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.store offset=1048
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 3
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 3
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 3
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1064
          end
          i32.const 0
          i32.load offset=1068
          local.set 3
          block  ;; label = @4
            local.get 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.get 3
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 3
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.store offset=1052
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 4
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 4
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 4
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1068
          end
          block  ;; label = @4
            local.get 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.const 0
            i32.load offset=1072
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 5
            i32.const 1
            i32.add
            local.tee 4
            i32.store offset=1056
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 4
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 4
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 4
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1072
          end
          block  ;; label = @4
            local.get 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 0
            i32.load offset=1076
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.store offset=1060
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 1
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 1
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1076
          end
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.load offset=1080
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 2
            i32.const 1
            i32.add
            local.tee 1
            i32.store offset=1064
            i32.const 0
            i32.const 0
            i32.load offset=1100
            i32.const -1
            i32.add
            i32.store offset=1100
            i32.const 0
            local.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.const 1264
            i32.add
            i32.load
            local.tee 1
            i32.add
            local.tee 0
            i32.store offset=1096
            i32.const 0
            i32.const 0
            i32.load offset=1092
            local.get 1
            i32.add
            i32.store offset=1092
            i32.const 0
            i32.const 0
            i32.store offset=1080
          end
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 0
          i32.load offset=1084
          i32.ne
          br_if 2 (;@1;)
          i32.const 0
          i64.const 4294967296
          i64.store offset=1084 align=4
          i32.const 0
          local.get 3
          i32.const 1
          i32.add
          local.tee 1
          i32.store offset=1068
          i32.const 0
          i32.const 0
          i32.load offset=1100
          i32.const -1
          i32.add
          i32.store offset=1100
          i32.const 0
          local.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.const 1264
          i32.add
          i32.load
          local.tee 1
          i32.add
          i32.store offset=1096
          i32.const 0
          i32.const 0
          i32.load offset=1092
          local.get 1
          i32.add
          i32.store offset=1092
          return
        end
        i32.const 0
        local.set 0
      end
      i32.const 0
      i32.load offset=1048
      local.set 2
      block  ;; label = @2
        i32.const 0
        i32.load offset=1052
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.store offset=1052
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 3
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 3
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 3
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1048
      end
      i32.const 0
      i32.load offset=1064
      local.set 3
      block  ;; label = @2
        i32.const 0
        i32.load offset=1068
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        local.get 3
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.store offset=1068
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 4
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 4
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 4
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1064
      end
      i32.const 0
      i32.load offset=1080
      local.set 4
      block  ;; label = @2
        i32.const 0
        i32.load offset=1084
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        local.get 4
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 5
        i32.const 1
        i32.add
        local.tee 5
        i32.store offset=1084
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 5
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 5
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 5
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1080
      end
      i32.const 0
      i32.load offset=1028
      local.set 5
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 5
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 5
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.store offset=1032
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 1
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 1
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1028
      end
      i32.const 0
      i32.load offset=1044
      local.set 1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        i32.store offset=1048
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 2
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 2
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 2
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1044
      end
      i32.const 0
      i32.load offset=1060
      local.set 2
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.store offset=1064
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 3
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 3
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 3
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1060
      end
      i32.const 0
      i32.load offset=1076
      local.set 3
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        local.get 3
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.store offset=1080
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 4
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 4
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 4
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1076
      end
      block  ;; label = @2
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.const 0
        i32.load offset=1024
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 5
        i32.const 1
        i32.add
        local.tee 4
        i32.store offset=1028
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 4
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 4
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 4
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1024
      end
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.load offset=1040
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.store offset=1044
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 1
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 1
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1040
      end
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.load offset=1056
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store offset=1088
        i32.const 0
        local.get 2
        i32.const 1
        i32.add
        local.tee 1
        i32.store offset=1060
        i32.const 0
        i32.const 0
        i32.load offset=1100
        i32.const -1
        i32.add
        i32.store offset=1100
        i32.const 0
        local.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.const 1264
        i32.add
        i32.load
        local.tee 1
        i32.add
        local.tee 0
        i32.store offset=1096
        i32.const 0
        i32.const 0
        i32.load offset=1092
        local.get 1
        i32.add
        i32.store offset=1092
        i32.const 0
        i32.const 0
        i32.store offset=1056
      end
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 0
      i32.load offset=1072
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      i32.const 1
      i32.store offset=1088
      i32.const 0
      local.get 3
      i32.const 1
      i32.add
      local.tee 1
      i32.store offset=1076
      i32.const 0
      i32.const 0
      i32.load offset=1100
      i32.const -1
      i32.add
      i32.store offset=1100
      i32.const 0
      local.get 0
      local.get 1
      i32.const 2
      i32.shl
      i32.const 1264
      i32.add
      i32.load
      local.tee 1
      i32.add
      i32.store offset=1096
      i32.const 0
      i32.const 0
      i32.load offset=1092
      local.get 1
      i32.add
      i32.store offset=1092
      i32.const 0
      i32.const 0
      i32.store offset=1072
      return
    end)
  (func $do_gravity (type 4) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.add
      local.tee 0
      i32.const 3
      i32.gt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;) 0 (;@5;)
            end
            loop  ;; label = @5
              i32.const 1
              local.set 0
              block  ;; label = @6
                i32.const 0
                i32.load offset=1024
                br_if 0 (;@6;)
                i32.const 1
                local.set 0
                i32.const 0
                i32.load offset=1028
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1024
                i32.const 0
                i32.const 0
                i32.store offset=1028
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1040
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1044
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1040
                i32.const 0
                i32.const 0
                i32.store offset=1044
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1056
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1060
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1056
                i32.const 0
                i32.const 0
                i32.store offset=1060
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1072
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1076
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1072
                i32.const 0
                i32.const 0
                i32.store offset=1076
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1028
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1032
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1028
                i32.const 0
                i32.const 0
                i32.store offset=1032
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1044
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1048
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1044
                i32.const 0
                i32.const 0
                i32.store offset=1048
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1060
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1064
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1060
                i32.const 0
                i32.const 0
                i32.store offset=1064
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1076
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1080
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1076
                i32.const 0
                i32.const 0
                i32.store offset=1080
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1032
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1036
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1032
                i32.const 0
                i32.const 0
                i32.store offset=1036
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1048
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1052
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1048
                i32.const 0
                i32.const 0
                i32.store offset=1052
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1064
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1068
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 1
                i32.store offset=1088
                i32.const 0
                local.get 1
                i32.store offset=1064
                i32.const 0
                i32.const 0
                i32.store offset=1068
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1080
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1084
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                i64.const 4294967296
                i64.store offset=1084 align=4
                i32.const 0
                local.get 1
                i32.store offset=1080
              end
              call $do_draw
              i32.const 40000
              call $usleep
              drop
              local.get 0
              i32.eqz
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
          end
          loop  ;; label = @4
            i32.const 1
            local.set 0
            block  ;; label = @5
              i32.const 0
              i32.load offset=1036
              br_if 0 (;@5;)
              i32.const 1
              local.set 0
              i32.const 0
              i32.load offset=1032
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1036
              i32.const 0
              i32.const 0
              i32.store offset=1032
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1052
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1048
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1052
              i32.const 0
              i32.const 0
              i32.store offset=1048
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1068
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1064
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1068
              i32.const 0
              i32.const 0
              i32.store offset=1064
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1084
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1080
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1084
              i32.const 0
              i32.const 0
              i32.store offset=1080
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1032
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1028
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1032
              i32.const 0
              i32.const 0
              i32.store offset=1028
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1048
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1044
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1048
              i32.const 0
              i32.const 0
              i32.store offset=1044
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1064
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1060
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1064
              i32.const 0
              i32.const 0
              i32.store offset=1060
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1080
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1076
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1080
              i32.const 0
              i32.const 0
              i32.store offset=1076
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1028
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1024
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1028
              i32.const 0
              i32.const 0
              i32.store offset=1024
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1044
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1040
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1044
              i32.const 0
              i32.const 0
              i32.store offset=1040
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1060
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1056
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1060
              i32.const 0
              i32.const 0
              i32.store offset=1056
            end
            block  ;; label = @5
              i32.const 0
              i32.load offset=1076
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1072
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              i32.const 0
              i32.const 1
              i32.store offset=1088
              i32.const 0
              local.get 1
              i32.store offset=1076
              i32.const 0
              i32.const 0
              i32.store offset=1072
            end
            call $do_draw
            i32.const 40000
            call $usleep
            drop
            local.get 0
            i32.eqz
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        loop  ;; label = @3
          i32.const 1
          local.set 0
          block  ;; label = @4
            i32.const 0
            i32.load offset=1072
            br_if 0 (;@4;)
            i32.const 1
            local.set 0
            i32.const 0
            i32.load offset=1056
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1072
            i32.const 0
            i32.const 0
            i32.store offset=1056
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1076
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1060
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1076
            i32.const 0
            i32.const 0
            i32.store offset=1060
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1080
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1064
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1080
            i32.const 0
            i32.const 0
            i32.store offset=1064
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1084
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1068
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1084
            i32.const 0
            i32.const 0
            i32.store offset=1068
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1056
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1040
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1056
            i32.const 0
            i32.const 0
            i32.store offset=1040
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1060
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1044
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1060
            i32.const 0
            i32.const 0
            i32.store offset=1044
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1064
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1048
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1064
            i32.const 0
            i32.const 0
            i32.store offset=1048
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1068
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1052
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1068
            i32.const 0
            i32.const 0
            i32.store offset=1052
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1040
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1024
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1040
            i32.const 0
            i32.const 0
            i32.store offset=1024
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1044
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1028
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1044
            i32.const 0
            i32.const 0
            i32.store offset=1028
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1048
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1032
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1048
            i32.const 0
            i32.const 0
            i32.store offset=1032
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1052
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1036
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 0
            i32.const 0
            i32.const 1
            i32.store offset=1088
            i32.const 0
            local.get 1
            i32.store offset=1052
            i32.const 0
            i32.const 0
            i32.store offset=1036
          end
          call $do_draw
          i32.const 40000
          call $usleep
          drop
          local.get 0
          i32.eqz
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      loop  ;; label = @2
        i32.const 1
        local.set 0
        block  ;; label = @3
          i32.const 0
          i32.load offset=1024
          br_if 0 (;@3;)
          i32.const 1
          local.set 0
          i32.const 0
          i32.load offset=1040
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1024
          i32.const 0
          i32.const 0
          i32.store offset=1040
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1028
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1044
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1028
          i32.const 0
          i32.const 0
          i32.store offset=1044
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1032
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1048
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1032
          i32.const 0
          i32.const 0
          i32.store offset=1048
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1036
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1052
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1036
          i32.const 0
          i32.const 0
          i32.store offset=1052
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1040
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1056
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1040
          i32.const 0
          i32.const 0
          i32.store offset=1056
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1044
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1060
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1044
          i32.const 0
          i32.const 0
          i32.store offset=1060
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1048
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1064
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1048
          i32.const 0
          i32.const 0
          i32.store offset=1064
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1052
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1068
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1052
          i32.const 0
          i32.const 0
          i32.store offset=1068
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1056
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1072
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1056
          i32.const 0
          i32.const 0
          i32.store offset=1072
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1060
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1076
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1060
          i32.const 0
          i32.const 0
          i32.store offset=1076
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1064
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1080
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i32.const 1
          i32.store offset=1088
          i32.const 0
          local.get 1
          i32.store offset=1064
          i32.const 0
          i32.const 0
          i32.store offset=1080
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1068
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1084
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          i32.const 0
          i64.const 4294967296
          i64.store offset=1084 align=4
          i32.const 0
          local.get 1
          i32.store offset=1068
        end
        call $do_draw
        i32.const 40000
        call $usleep
        drop
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
      end
    end)
  (func $do_check_end_condition (type 2) (result i32)
    (local i32 i32 i32 i32)
    i32.const 1
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1024
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          i32.const 0
          i32.load offset=1040
          i32.eq
          br_if 0 (;@3;)
          i32.const -1
          local.set 2
          local.get 1
          i32.const 0
          i32.load offset=1028
          local.tee 3
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        i32.load offset=1028
        local.set 3
        i32.const 0
        local.set 2
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 3
          i32.const 0
          i32.load offset=1044
          i32.eq
          br_if 0 (;@3;)
          local.get 3
          i32.const 0
          i32.load offset=1032
          local.tee 1
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        i32.load offset=1032
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          i32.const 0
          i32.load offset=1048
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.load offset=1036
          local.tee 3
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        i32.load offset=1036
        local.set 3
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 3
          i32.const 0
          i32.load offset=1052
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
      end
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1040
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          i32.const 0
          i32.load offset=1056
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.load offset=1044
          local.tee 3
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        i32.load offset=1044
        local.set 3
        i32.const 0
        local.set 2
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 3
          i32.const 0
          i32.load offset=1060
          i32.eq
          br_if 0 (;@3;)
          local.get 3
          i32.const 0
          i32.load offset=1048
          local.tee 1
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        i32.load offset=1048
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          i32.const 0
          i32.load offset=1064
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.load offset=1052
          local.tee 3
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        i32.load offset=1052
        local.set 3
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 3
          i32.const 0
          i32.load offset=1068
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
      end
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1056
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          i32.const 0
          i32.load offset=1072
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.load offset=1060
          local.tee 3
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        i32.load offset=1060
        local.set 3
        i32.const 0
        local.set 2
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 3
          i32.const 0
          i32.load offset=1076
          i32.eq
          br_if 0 (;@3;)
          local.get 3
          i32.const 0
          i32.load offset=1064
          local.tee 1
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        i32.load offset=1064
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          i32.const 0
          i32.load offset=1080
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.load offset=1068
          local.tee 3
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        i32.const 0
        i32.load offset=1068
        local.set 3
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 11
          i32.eq
          br_if 2 (;@1;)
          local.get 3
          i32.const 0
          i32.load offset=1084
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
      end
      i32.const 0
      i32.load offset=1072
      local.tee 3
      i32.const 11
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1076
            local.set 3
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.load offset=1076
          local.tee 1
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        local.get 3
        local.set 1
      end
      local.get 1
      i32.const 11
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1080
            local.set 1
            br 1 (;@3;)
          end
          local.get 1
          i32.const 0
          i32.load offset=1080
          local.tee 3
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        local.get 1
        local.set 3
      end
      local.get 3
      i32.const 11
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1084
            local.set 3
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.load offset=1084
          local.tee 1
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 2
        local.get 3
        local.set 1
      end
      local.get 1
      i32.const 11
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
      end
      local.get 2
      local.set 0
    end
    local.get 0)
  (func $do_tick (type 1) (param i32) (result i32)
    i32.const 0
    i32.const 0
    i32.store offset=1088
    local.get 0
    call $do_gravity
    local.get 0
    call $do_merge
    local.get 0
    call $do_gravity
    i32.const 0
    i32.load offset=1088)
  (func $do_newblock (type 5)
    (local i32 i32 i32)
    i32.const 0
    local.set 0
    block  ;; label = @1
      i32.const 0
      i32.load offset=1100
      i32.const 15
      i32.gt_s
      br_if 0 (;@1;)
      call $rand
      i32.const 16
      i32.const 0
      i32.load offset=1100
      i32.sub
      i32.rem_s
      local.set 1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1024
                br_if 0 (;@6;)
                i32.const 1
                local.set 0
                local.get 1
                i32.eqz
                br_if 1 (;@5;)
              end
              block  ;; label = @6
                i32.const 0
                i32.load offset=1028
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1032
                br_if 3 (;@3;)
                br 2 (;@4;)
              end
              i32.const 1028
              local.set 2
              local.get 0
              local.get 1
              i32.eq
              br_if 3 (;@2;)
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              i32.const 0
              i32.load offset=1032
              i32.eqz
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
            i32.const 1024
            local.set 2
            br 2 (;@2;)
          end
          i32.const 1032
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1036
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1040
              br_if 2 (;@3;)
              br 1 (;@4;)
            end
            i32.const 1036
            local.set 2
            local.get 0
            local.get 1
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            i32.const 0
            i32.load offset=1040
            br_if 1 (;@3;)
          end
          i32.const 1040
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1044
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1048
              br_if 2 (;@3;)
              br 1 (;@4;)
            end
            i32.const 1044
            local.set 2
            local.get 0
            local.get 1
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            i32.const 0
            i32.load offset=1048
            br_if 1 (;@3;)
          end
          i32.const 1048
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1052
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1056
              br_if 2 (;@3;)
              br 1 (;@4;)
            end
            i32.const 1052
            local.set 2
            local.get 0
            local.get 1
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            i32.const 0
            i32.load offset=1056
            br_if 1 (;@3;)
          end
          i32.const 1056
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1060
          br_if 0 (;@3;)
          i32.const 1060
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1064
          br_if 0 (;@3;)
          i32.const 1064
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1068
          br_if 0 (;@3;)
          i32.const 1068
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1072
          br_if 0 (;@3;)
          i32.const 1072
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1076
          br_if 0 (;@3;)
          i32.const 1076
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1080
          br_if 0 (;@3;)
          i32.const 1080
          local.set 2
          local.get 0
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
        end
        i32.const 0
        i32.load offset=1084
        br_if 1 (;@1;)
        i32.const 1084
        local.set 2
        local.get 0
        local.get 1
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 2
      i32.const 1
      i32.const 2
      call $rand
      i32.const 10
      i32.rem_s
      select
      i32.store
      i32.const 0
      i32.const 0
      i32.load offset=1100
      i32.const 1
      i32.add
      i32.store offset=1100
      return
    end)
  (func $__original_main (type 2) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    i32.const 1104
    call $tcgetattr
    drop
    i32.const 0
    i32.const 0
    i64.load offset=1112 align=4
    i64.store offset=1172 align=4
    i32.const 0
    i32.const 0
    i32.load offset=1160
    i32.store offset=1220
    i32.const 0
    i32.const 0
    i64.load offset=1152 align=4
    i64.store offset=1212 align=4
    i32.const 0
    i32.const 0
    i64.load offset=1144 align=4
    i64.store offset=1204 align=4
    i32.const 0
    i32.const 0
    i64.load offset=1136 align=4
    i64.store offset=1196 align=4
    i32.const 0
    i32.const 0
    i64.load offset=1128 align=4
    i64.store offset=1188 align=4
    i32.const 0
    i32.const 0
    i64.load offset=1120 align=4
    i64.store offset=1180 align=4
    i32.const 0
    i32.const 0
    i64.load offset=1104 align=4
    i64.store offset=1164 align=4
    i32.const 0
    i32.const 0
    i32.load offset=1176
    i32.const -11
    i32.and
    i32.store offset=1176
    i32.const 0
    i32.const 0
    i32.const 1164
    call $tcsetattr
    drop
    i32.const 0
    call $time
    call $srand
    call $do_newblock
    call $do_newblock
    call $do_draw
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          i32.const 0
          i32.load
          call $_IO_getc
          i32.const -27
          i32.add
          local.tee 0
          i32.const 92
          i32.gt_u
          br_if 0 (;@3;)
          i32.const 2
          local.set 1
          i32.const 3
          local.set 2
          i32.const 4
          local.set 3
          i32.const 1
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    br_table 0 (;@8;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 4 (;@4;) 5 (;@3;) 5 (;@3;) 3 (;@5;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 4 (;@4;) 5 (;@3;) 1 (;@7;) 2 (;@6;) 3 (;@5;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 7 (;@1;) 5 (;@3;) 1 (;@7;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 2 (;@6;) 0 (;@8;)
                  end
                  i32.const -1
                  local.set 3
                  i32.const 0
                  i32.load
                  call $_IO_getc
                  i32.const 91
                  i32.ne
                  br_if 3 (;@4;)
                  i32.const 3
                  local.set 1
                  i32.const 0
                  i32.load
                  call $_IO_getc
                  i32.const -65
                  i32.add
                  local.tee 0
                  i32.const 3
                  i32.gt_u
                  br_if 4 (;@3;)
                  i32.const 4
                  local.set 4
                  i32.const 2
                  local.set 2
                  i32.const 1
                  local.set 3
                  local.get 0
                  br_table 3 (;@4;) 2 (;@5;) 0 (;@7;) 1 (;@6;) 3 (;@4;)
                end
                local.get 1
                local.set 3
                br 2 (;@4;)
              end
              local.get 4
              local.set 3
              br 1 (;@4;)
            end
            local.get 2
            local.set 3
          end
          i32.const 0
          i32.const 0
          i32.store offset=1088
          local.get 3
          call $do_gravity
          local.get 3
          call $do_merge
          local.get 3
          call $do_gravity
          block  ;; label = @4
            i32.const 0
            i32.load offset=1088
            i32.eqz
            br_if 0 (;@4;)
            call $do_newblock
          end
          call $do_draw
          call $do_check_end_condition
          local.tee 3
          i32.const 1
          i32.eq
          br_if 1 (;@2;)
          local.get 3
          i32.const -1
          i32.ne
          br_if 0 (;@3;)
        end
        i32.const 1375
        call $puts
        drop
        br 1 (;@1;)
      end
      i32.const 1385
      call $puts
      drop
    end
    i32.const 0
    i32.const 0
    i32.const 1104
    call $tcsetattr
    drop
    i32.const 0)
  (func $main (type 0) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66992))
  (global (;1;) i32 (i32.const 66992))
  (global (;2;) i32 (i32.const 1456))
  (global (;3;) i32 (i32.const 1024))
  (global (;4;) i32 (i32.const 1264))
  (global (;5;) i32 (i32.const 1408))
  (global (;6;) i32 (i32.const 1024))
  (global (;7;) i32 (i32.const 1104))
  (global (;8;) i32 (i32.const 1164))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "do_draw" (func $do_draw))
  (export "do_merge" (func $do_merge))
  (export "do_gravity" (func $do_gravity))
  (export "do_check_end_condition" (func $do_check_end_condition))
  (export "do_tick" (func $do_tick))
  (export "do_newblock" (func $do_newblock))
  (export "main" (func $main))
  (export "values" (global 4))
  (export "colors" (global 5))
  (export "game" (global 6))
  (export "oldt" (global 7))
  (export "newt" (global 8))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data (;1;) (i32.const 1232) "\1b[2J\1b[HScore: %ld\00 (+%ld)\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\04\00\00\00\08\00\00\00\10\00\00\00 \00\00\00@\00\00\00\80\00\00\00\00\01\00\00\00\02\00\00\00\04\00\00\00\08\00\00\1b[7m\1b[%sm%*zd \1b[0m|\00%*s |\00\0039\0031\0032\0033\0034\0035\0036\0037\0091\0092\0093\0094\00You lose!\00You win!\00")
  (data (;2;) (i32.const 1408) ";\05\00\00>\05\00\00A\05\00\00D\05\00\00G\05\00\00J\05\00\00M\05\00\00P\05\00\00S\05\00\00V\05\00\00Y\05\00\00\5c\05\00\00"))
