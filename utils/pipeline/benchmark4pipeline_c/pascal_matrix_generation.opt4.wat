(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32 i32)))
  (import "env" "calloc" (func $calloc (type 0)))
  (import "env" "printf" (func $printf (type 0)))
  (import "env" "puts" (func $puts (type 1)))
  (func $__wasm_call_ctors (type 2))
  (func $pascal_low (type 3) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 0
      local.set 2
      loop  ;; label = @2
        local.get 0
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        local.tee 3
        i32.const -4
        i32.add
        local.set 4
        local.get 3
        i32.load
        local.set 5
        i32.const 0
        local.set 3
        i32.const 0
        local.set 6
        loop  ;; label = @3
          i32.const 0
          local.set 7
          block  ;; label = @4
            local.get 2
            local.get 6
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 1
            local.set 7
            local.get 2
            local.get 6
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.load
            local.get 3
            i32.add
            local.tee 7
            i32.load
            local.get 7
            i32.const -4
            i32.add
            i32.load
            i32.add
            local.set 7
          end
          local.get 5
          local.get 3
          i32.add
          local.get 7
          i32.store
          local.get 3
          i32.const 4
          i32.add
          local.set 3
          local.get 1
          local.get 6
          i32.const 1
          i32.add
          local.tee 6
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        local.get 1
        i32.ne
        br_if 0 (;@2;)
      end
    end)
  (func $pascal_upp (type 3) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 0
      local.set 2
      loop  ;; label = @2
        local.get 0
        local.get 2
        i32.const 2
        i32.shl
        local.tee 3
        i32.add
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.const -4
            i32.add
            local.set 5
            i32.const 0
            local.set 6
            i32.const -4
            local.set 7
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  local.get 6
                  i32.le_u
                  br_if 0 (;@7;)
                  local.get 4
                  i32.load
                  local.get 6
                  i32.const 2
                  i32.shl
                  i32.add
                  local.set 8
                  i32.const 0
                  local.set 9
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 2
                  local.get 6
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 4
                  i32.load
                  local.get 3
                  i32.add
                  local.set 8
                  i32.const 1
                  local.set 9
                  br 1 (;@6;)
                end
                local.get 4
                i32.load
                local.get 7
                i32.add
                local.tee 8
                i32.load
                local.get 5
                i32.load
                local.get 7
                i32.add
                i32.load
                i32.add
                local.set 9
                local.get 8
                i32.const 4
                i32.add
                local.set 8
              end
              local.get 8
              local.get 9
              i32.store
              local.get 7
              i32.const 4
              i32.add
              local.set 7
              local.get 1
              local.get 6
              i32.const 1
              i32.add
              local.tee 6
              i32.ne
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 4
          i32.load
          local.set 6
          local.get 1
          local.set 7
          loop  ;; label = @4
            local.get 6
            i32.const 1
            i32.store
            local.get 6
            i32.const 4
            i32.add
            local.set 6
            local.get 7
            i32.const -1
            i32.add
            local.tee 7
            br_if 0 (;@4;)
          end
        end
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        local.get 1
        i32.ne
        br_if 0 (;@2;)
      end
    end)
  (func $pascal_sym (type 3) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 0
      local.set 2
      loop  ;; label = @2
        local.get 0
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.const -4
            i32.add
            local.set 4
            i32.const 0
            local.set 5
            local.get 1
            local.set 6
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load
                  local.get 5
                  i32.add
                  local.tee 7
                  local.get 7
                  i32.const -4
                  i32.add
                  i32.load
                  local.get 4
                  i32.load
                  local.get 5
                  i32.add
                  i32.load
                  i32.add
                  i32.store
                  br 1 (;@6;)
                end
                local.get 3
                i32.load
                i32.const 1
                i32.store
              end
              local.get 5
              i32.const 4
              i32.add
              local.set 5
              local.get 6
              i32.const -1
              i32.add
              local.tee 6
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 3
          i32.load
          local.set 5
          local.get 1
          local.set 6
          loop  ;; label = @4
            local.get 5
            i32.const 1
            i32.store
            local.get 5
            i32.const 4
            i32.add
            local.set 5
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            br_if 0 (;@4;)
          end
        end
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        local.get 1
        i32.ne
        br_if 0 (;@2;)
      end
    end)
  (func $main (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 1200
    i32.sub
    local.tee 2
    global.set 0
    i32.const 5
    i32.const 4
    call $calloc
    local.tee 3
    i32.const 5
    i32.const 4
    call $calloc
    local.tee 4
    i32.store
    local.get 3
    i32.const 5
    i32.const 4
    call $calloc
    local.tee 5
    i32.store offset=4
    local.get 3
    i32.const 5
    i32.const 4
    call $calloc
    local.tee 6
    i32.store offset=8
    local.get 3
    i32.const 5
    i32.const 4
    call $calloc
    local.tee 7
    i32.store offset=12
    local.get 3
    i32.const 5
    i32.const 4
    call $calloc
    local.tee 8
    i32.store offset=16
    i32.const 1024
    call $puts
    drop
    local.get 8
    i64.const 0
    i64.store offset=8 align=4
    local.get 8
    i64.const 0
    i64.store align=4
    local.get 4
    i32.const 1
    i32.store offset=16
    local.get 4
    i64.const 4294967297
    i64.store offset=8 align=4
    local.get 4
    i64.const 4294967297
    i64.store align=4
    local.get 5
    i32.const 4
    i32.store offset=16
    local.get 5
    i64.const 12884901890
    i64.store offset=8 align=4
    local.get 5
    i64.const 4294967296
    i64.store align=4
    local.get 6
    i32.const 6
    i32.store offset=16
    local.get 6
    i64.const 12884901889
    i64.store offset=8 align=4
    local.get 6
    i64.const 0
    i64.store align=4
    local.get 7
    i32.const 4
    i32.store offset=16
    local.get 7
    i64.const 4294967296
    i64.store offset=8 align=4
    local.get 7
    i64.const 0
    i64.store align=4
    local.get 8
    i32.const 1
    i32.store offset=16
    local.get 2
    i64.const 137438953473
    i64.store offset=1184
    i32.const 1052
    local.get 2
    i32.const 1184
    i32.add
    call $printf
    drop
    local.get 4
    i32.load offset=4
    local.set 9
    local.get 2
    i32.const 32
    i32.store offset=1172
    local.get 2
    local.get 9
    i32.store offset=1168
    i32.const 1052
    local.get 2
    i32.const 1168
    i32.add
    call $printf
    drop
    local.get 4
    i32.load offset=8
    local.set 9
    local.get 2
    i32.const 32
    i32.store offset=1156
    local.get 2
    local.get 9
    i32.store offset=1152
    i32.const 1052
    local.get 2
    i32.const 1152
    i32.add
    call $printf
    drop
    local.get 4
    i32.load offset=12
    local.set 9
    local.get 2
    i32.const 32
    i32.store offset=1140
    local.get 2
    local.get 9
    i32.store offset=1136
    i32.const 1052
    local.get 2
    i32.const 1136
    i32.add
    call $printf
    drop
    local.get 4
    i32.load offset=16
    local.set 4
    local.get 2
    i32.const 10
    i32.store offset=1124
    local.get 2
    local.get 4
    i32.store offset=1120
    i32.const 1052
    local.get 2
    i32.const 1120
    i32.add
    call $printf
    drop
    local.get 5
    i32.load
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=1108
    local.get 2
    local.get 4
    i32.store offset=1104
    i32.const 1052
    local.get 2
    i32.const 1104
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=4
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=1092
    local.get 2
    local.get 4
    i32.store offset=1088
    i32.const 1052
    local.get 2
    i32.const 1088
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=8
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=1076
    local.get 2
    local.get 4
    i32.store offset=1072
    i32.const 1052
    local.get 2
    i32.const 1072
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=12
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=1060
    local.get 2
    local.get 4
    i32.store offset=1056
    i32.const 1052
    local.get 2
    i32.const 1056
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=16
    local.set 5
    local.get 2
    i32.const 10
    i32.store offset=1044
    local.get 2
    local.get 5
    i32.store offset=1040
    i32.const 1052
    local.get 2
    i32.const 1040
    i32.add
    call $printf
    drop
    local.get 6
    i32.load
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=1028
    local.get 2
    local.get 5
    i32.store offset=1024
    i32.const 1052
    local.get 2
    i32.const 1024
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=4
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=1012
    local.get 2
    local.get 5
    i32.store offset=1008
    i32.const 1052
    local.get 2
    i32.const 1008
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=8
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=996
    local.get 2
    local.get 5
    i32.store offset=992
    i32.const 1052
    local.get 2
    i32.const 992
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=12
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=980
    local.get 2
    local.get 5
    i32.store offset=976
    i32.const 1052
    local.get 2
    i32.const 976
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=16
    local.set 5
    local.get 2
    i32.const 10
    i32.store offset=964
    local.get 2
    local.get 5
    i32.store offset=960
    i32.const 1052
    local.get 2
    i32.const 960
    i32.add
    call $printf
    drop
    local.get 7
    i32.load
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=948
    local.get 2
    local.get 5
    i32.store offset=944
    i32.const 1052
    local.get 2
    i32.const 944
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=4
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=932
    local.get 2
    local.get 5
    i32.store offset=928
    i32.const 1052
    local.get 2
    i32.const 928
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=8
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=916
    local.get 2
    local.get 5
    i32.store offset=912
    i32.const 1052
    local.get 2
    i32.const 912
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=12
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=900
    local.get 2
    local.get 5
    i32.store offset=896
    i32.const 1052
    local.get 2
    i32.const 896
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=16
    local.set 5
    local.get 2
    i32.const 10
    i32.store offset=884
    local.get 2
    local.get 5
    i32.store offset=880
    i32.const 1052
    local.get 2
    i32.const 880
    i32.add
    call $printf
    drop
    local.get 8
    i32.load
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=868
    local.get 2
    local.get 5
    i32.store offset=864
    i32.const 1052
    local.get 2
    i32.const 864
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=4
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=852
    local.get 2
    local.get 5
    i32.store offset=848
    i32.const 1052
    local.get 2
    i32.const 848
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=8
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=836
    local.get 2
    local.get 5
    i32.store offset=832
    i32.const 1052
    local.get 2
    i32.const 832
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=12
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=820
    local.get 2
    local.get 5
    i32.store offset=816
    i32.const 1052
    local.get 2
    i32.const 816
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=16
    local.set 5
    local.get 2
    i32.const 10
    i32.store offset=804
    local.get 2
    local.get 5
    i32.store offset=800
    i32.const 1052
    local.get 2
    i32.const 800
    i32.add
    call $printf
    drop
    i32.const 1058
    call $puts
    drop
    local.get 3
    i32.load
    local.tee 4
    i64.const 0
    i64.store offset=12 align=4
    local.get 4
    i64.const 0
    i64.store offset=4 align=4
    local.get 4
    i32.const 1
    i32.store
    local.get 3
    i32.load offset=4
    local.tee 7
    i32.const 0
    i32.store offset=16
    local.get 7
    i64.const 0
    i64.store offset=8 align=4
    local.get 7
    i64.const 4294967297
    i64.store align=4
    local.get 3
    i32.load offset=8
    local.tee 6
    i32.const 1
    i32.store
    local.get 7
    i32.load
    local.set 5
    local.get 7
    i32.load offset=4
    local.set 8
    local.get 6
    i32.const 0
    i32.store offset=16
    local.get 6
    i64.const 1
    i64.store offset=8 align=4
    local.get 6
    local.get 8
    local.get 5
    i32.add
    i32.store offset=4
    local.get 3
    i32.load offset=12
    local.tee 5
    i32.const 1
    i32.store
    local.get 5
    local.get 6
    i32.load offset=4
    local.get 6
    i32.load
    i32.add
    i32.store offset=4
    local.get 6
    i32.load offset=8
    local.set 8
    local.get 6
    i32.load offset=4
    local.set 9
    local.get 5
    i64.const 1
    i64.store offset=12 align=4
    local.get 5
    local.get 8
    local.get 9
    i32.add
    i32.store offset=8
    local.get 3
    i32.load offset=16
    local.tee 8
    i32.const 1
    i32.store
    local.get 8
    local.get 5
    i32.load offset=4
    local.get 5
    i32.load
    i32.add
    i32.store offset=4
    local.get 8
    local.get 5
    i32.load offset=8
    local.get 5
    i32.load offset=4
    i32.add
    i32.store offset=8
    local.get 5
    i32.load offset=12
    local.set 9
    local.get 5
    i32.load offset=8
    local.set 10
    local.get 8
    i32.const 1
    i32.store offset=16
    local.get 8
    local.get 9
    local.get 10
    i32.add
    i32.store offset=12
    local.get 4
    i32.load
    local.set 9
    local.get 2
    i32.const 32
    i32.store offset=788
    local.get 2
    local.get 9
    i32.store offset=784
    i32.const 1052
    local.get 2
    i32.const 784
    i32.add
    call $printf
    drop
    local.get 4
    i32.load offset=4
    local.set 9
    local.get 2
    i32.const 32
    i32.store offset=772
    local.get 2
    local.get 9
    i32.store offset=768
    i32.const 1052
    local.get 2
    i32.const 768
    i32.add
    call $printf
    drop
    local.get 4
    i32.load offset=8
    local.set 9
    local.get 2
    i32.const 32
    i32.store offset=756
    local.get 2
    local.get 9
    i32.store offset=752
    i32.const 1052
    local.get 2
    i32.const 752
    i32.add
    call $printf
    drop
    local.get 4
    i32.load offset=12
    local.set 9
    local.get 2
    i32.const 32
    i32.store offset=740
    local.get 2
    local.get 9
    i32.store offset=736
    i32.const 1052
    local.get 2
    i32.const 736
    i32.add
    call $printf
    drop
    local.get 4
    i32.load offset=16
    local.set 4
    local.get 2
    i32.const 10
    i32.store offset=724
    local.get 2
    local.get 4
    i32.store offset=720
    i32.const 1052
    local.get 2
    i32.const 720
    i32.add
    call $printf
    drop
    local.get 7
    i32.load
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=708
    local.get 2
    local.get 4
    i32.store offset=704
    i32.const 1052
    local.get 2
    i32.const 704
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=4
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=692
    local.get 2
    local.get 4
    i32.store offset=688
    i32.const 1052
    local.get 2
    i32.const 688
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=8
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=676
    local.get 2
    local.get 4
    i32.store offset=672
    i32.const 1052
    local.get 2
    i32.const 672
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=12
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=660
    local.get 2
    local.get 4
    i32.store offset=656
    i32.const 1052
    local.get 2
    i32.const 656
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=16
    local.set 7
    local.get 2
    i32.const 10
    i32.store offset=644
    local.get 2
    local.get 7
    i32.store offset=640
    i32.const 1052
    local.get 2
    i32.const 640
    i32.add
    call $printf
    drop
    local.get 6
    i32.load
    local.set 7
    local.get 2
    i32.const 32
    i32.store offset=628
    local.get 2
    local.get 7
    i32.store offset=624
    i32.const 1052
    local.get 2
    i32.const 624
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=4
    local.set 7
    local.get 2
    i32.const 32
    i32.store offset=612
    local.get 2
    local.get 7
    i32.store offset=608
    i32.const 1052
    local.get 2
    i32.const 608
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=8
    local.set 7
    local.get 2
    i32.const 32
    i32.store offset=596
    local.get 2
    local.get 7
    i32.store offset=592
    i32.const 1052
    local.get 2
    i32.const 592
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=12
    local.set 7
    local.get 2
    i32.const 32
    i32.store offset=580
    local.get 2
    local.get 7
    i32.store offset=576
    i32.const 1052
    local.get 2
    i32.const 576
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=16
    local.set 6
    local.get 2
    i32.const 10
    i32.store offset=564
    local.get 2
    local.get 6
    i32.store offset=560
    i32.const 1052
    local.get 2
    i32.const 560
    i32.add
    call $printf
    drop
    local.get 5
    i32.load
    local.set 6
    local.get 2
    i32.const 32
    i32.store offset=548
    local.get 2
    local.get 6
    i32.store offset=544
    i32.const 1052
    local.get 2
    i32.const 544
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=4
    local.set 6
    local.get 2
    i32.const 32
    i32.store offset=532
    local.get 2
    local.get 6
    i32.store offset=528
    i32.const 1052
    local.get 2
    i32.const 528
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=8
    local.set 6
    local.get 2
    i32.const 32
    i32.store offset=516
    local.get 2
    local.get 6
    i32.store offset=512
    i32.const 1052
    local.get 2
    i32.const 512
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=12
    local.set 6
    local.get 2
    i32.const 32
    i32.store offset=500
    local.get 2
    local.get 6
    i32.store offset=496
    i32.const 1052
    local.get 2
    i32.const 496
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=16
    local.set 5
    local.get 2
    i32.const 10
    i32.store offset=484
    local.get 2
    local.get 5
    i32.store offset=480
    i32.const 1052
    local.get 2
    i32.const 480
    i32.add
    call $printf
    drop
    local.get 8
    i32.load
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=468
    local.get 2
    local.get 5
    i32.store offset=464
    i32.const 1052
    local.get 2
    i32.const 464
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=4
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=452
    local.get 2
    local.get 5
    i32.store offset=448
    i32.const 1052
    local.get 2
    i32.const 448
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=8
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=436
    local.get 2
    local.get 5
    i32.store offset=432
    i32.const 1052
    local.get 2
    i32.const 432
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=12
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=420
    local.get 2
    local.get 5
    i32.store offset=416
    i32.const 1052
    local.get 2
    i32.const 416
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=16
    local.set 5
    local.get 2
    i32.const 10
    i32.store offset=404
    local.get 2
    local.get 5
    i32.store offset=400
    i32.const 1052
    local.get 2
    i32.const 400
    i32.add
    call $printf
    drop
    i32.const 1086
    call $puts
    drop
    local.get 3
    i32.load
    local.tee 8
    i32.const 1
    i32.store offset=16
    local.get 8
    i64.const 4294967297
    i64.store offset=8 align=4
    local.get 8
    i64.const 4294967297
    i64.store align=4
    local.get 3
    i32.load offset=4
    local.tee 5
    i32.const 1
    i32.store
    local.get 5
    local.get 8
    i32.load offset=4
    i32.const 1
    i32.add
    local.tee 6
    i32.store offset=4
    local.get 5
    local.get 6
    local.get 8
    i32.load offset=8
    i32.add
    local.tee 6
    i32.store offset=8
    local.get 5
    local.get 6
    local.get 8
    i32.load offset=12
    i32.add
    local.tee 6
    i32.store offset=12
    local.get 5
    local.get 6
    local.get 8
    i32.load offset=16
    i32.add
    i32.store offset=16
    local.get 3
    i32.load offset=8
    local.tee 6
    i32.const 1
    i32.store
    local.get 6
    local.get 5
    i32.load offset=4
    i32.const 1
    i32.add
    local.tee 7
    i32.store offset=4
    local.get 6
    local.get 7
    local.get 5
    i32.load offset=8
    i32.add
    local.tee 7
    i32.store offset=8
    local.get 6
    local.get 7
    local.get 5
    i32.load offset=12
    i32.add
    local.tee 7
    i32.store offset=12
    local.get 6
    local.get 7
    local.get 5
    i32.load offset=16
    i32.add
    i32.store offset=16
    local.get 3
    i32.load offset=12
    local.tee 7
    i32.const 1
    i32.store
    local.get 7
    local.get 6
    i32.load offset=4
    i32.const 1
    i32.add
    local.tee 4
    i32.store offset=4
    local.get 7
    local.get 4
    local.get 6
    i32.load offset=8
    i32.add
    local.tee 4
    i32.store offset=8
    local.get 7
    local.get 4
    local.get 6
    i32.load offset=12
    i32.add
    local.tee 4
    i32.store offset=12
    local.get 7
    local.get 4
    local.get 6
    i32.load offset=16
    i32.add
    i32.store offset=16
    local.get 3
    i32.load offset=16
    local.tee 3
    i32.const 1
    i32.store
    local.get 3
    local.get 7
    i32.load offset=4
    i32.const 1
    i32.add
    local.tee 4
    i32.store offset=4
    local.get 3
    local.get 4
    local.get 7
    i32.load offset=8
    i32.add
    local.tee 4
    i32.store offset=8
    local.get 3
    local.get 4
    local.get 7
    i32.load offset=12
    i32.add
    local.tee 4
    i32.store offset=12
    local.get 3
    local.get 4
    local.get 7
    i32.load offset=16
    i32.add
    i32.store offset=16
    local.get 8
    i32.load
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=388
    local.get 2
    local.get 4
    i32.store offset=384
    i32.const 1052
    local.get 2
    i32.const 384
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=4
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=372
    local.get 2
    local.get 4
    i32.store offset=368
    i32.const 1052
    local.get 2
    i32.const 368
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=8
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=356
    local.get 2
    local.get 4
    i32.store offset=352
    i32.const 1052
    local.get 2
    i32.const 352
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=12
    local.set 4
    local.get 2
    i32.const 32
    i32.store offset=340
    local.get 2
    local.get 4
    i32.store offset=336
    i32.const 1052
    local.get 2
    i32.const 336
    i32.add
    call $printf
    drop
    local.get 8
    i32.load offset=16
    local.set 8
    local.get 2
    i32.const 10
    i32.store offset=324
    local.get 2
    local.get 8
    i32.store offset=320
    i32.const 1052
    local.get 2
    i32.const 320
    i32.add
    call $printf
    drop
    local.get 5
    i32.load
    local.set 8
    local.get 2
    i32.const 32
    i32.store offset=308
    local.get 2
    local.get 8
    i32.store offset=304
    i32.const 1052
    local.get 2
    i32.const 304
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=4
    local.set 8
    local.get 2
    i32.const 32
    i32.store offset=292
    local.get 2
    local.get 8
    i32.store offset=288
    i32.const 1052
    local.get 2
    i32.const 288
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=8
    local.set 8
    local.get 2
    i32.const 32
    i32.store offset=276
    local.get 2
    local.get 8
    i32.store offset=272
    i32.const 1052
    local.get 2
    i32.const 272
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=12
    local.set 8
    local.get 2
    i32.const 32
    i32.store offset=260
    local.get 2
    local.get 8
    i32.store offset=256
    i32.const 1052
    local.get 2
    i32.const 256
    i32.add
    call $printf
    drop
    local.get 5
    i32.load offset=16
    local.set 5
    local.get 2
    i32.const 10
    i32.store offset=244
    local.get 2
    local.get 5
    i32.store offset=240
    i32.const 1052
    local.get 2
    i32.const 240
    i32.add
    call $printf
    drop
    local.get 6
    i32.load
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=228
    local.get 2
    local.get 5
    i32.store offset=224
    i32.const 1052
    local.get 2
    i32.const 224
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=4
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=212
    local.get 2
    local.get 5
    i32.store offset=208
    i32.const 1052
    local.get 2
    i32.const 208
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=8
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=196
    local.get 2
    local.get 5
    i32.store offset=192
    i32.const 1052
    local.get 2
    i32.const 192
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=12
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=180
    local.get 2
    local.get 5
    i32.store offset=176
    i32.const 1052
    local.get 2
    i32.const 176
    i32.add
    call $printf
    drop
    local.get 6
    i32.load offset=16
    local.set 5
    local.get 2
    i32.const 10
    i32.store offset=164
    local.get 2
    local.get 5
    i32.store offset=160
    i32.const 1052
    local.get 2
    i32.const 160
    i32.add
    call $printf
    drop
    local.get 7
    i32.load
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=148
    local.get 2
    local.get 5
    i32.store offset=144
    i32.const 1052
    local.get 2
    i32.const 144
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=4
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=132
    local.get 2
    local.get 5
    i32.store offset=128
    i32.const 1052
    local.get 2
    i32.const 128
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=8
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=116
    local.get 2
    local.get 5
    i32.store offset=112
    i32.const 1052
    local.get 2
    i32.const 112
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=12
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=100
    local.get 2
    local.get 5
    i32.store offset=96
    i32.const 1052
    local.get 2
    i32.const 96
    i32.add
    call $printf
    drop
    local.get 7
    i32.load offset=16
    local.set 5
    local.get 2
    i32.const 10
    i32.store offset=84
    local.get 2
    local.get 5
    i32.store offset=80
    i32.const 1052
    local.get 2
    i32.const 80
    i32.add
    call $printf
    drop
    local.get 3
    i32.load
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=68
    local.get 2
    local.get 5
    i32.store offset=64
    i32.const 1052
    local.get 2
    i32.const 64
    i32.add
    call $printf
    drop
    local.get 3
    i32.load offset=4
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=52
    local.get 2
    local.get 5
    i32.store offset=48
    i32.const 1052
    local.get 2
    i32.const 48
    i32.add
    call $printf
    drop
    local.get 3
    i32.load offset=8
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=36
    local.get 2
    local.get 5
    i32.store offset=32
    i32.const 1052
    local.get 2
    i32.const 32
    i32.add
    call $printf
    drop
    local.get 3
    i32.load offset=12
    local.set 5
    local.get 2
    i32.const 32
    i32.store offset=20
    local.get 2
    local.get 5
    i32.store offset=16
    i32.const 1052
    local.get 2
    i32.const 16
    i32.add
    call $printf
    drop
    local.get 3
    i32.load offset=16
    local.set 3
    local.get 2
    i32.const 10
    i32.store offset=4
    local.get 2
    local.get 3
    i32.store
    i32.const 1052
    local.get 2
    call $printf
    drop
    local.get 2
    i32.const 1200
    i32.add
    global.set 0
    i32.const 0)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66656))
  (global (;1;) i32 (i32.const 66656))
  (global (;2;) i32 (i32.const 1118))
  (global (;3;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "pascal_low" (func $pascal_low))
  (export "pascal_upp" (func $pascal_upp))
  (export "pascal_sym" (func $pascal_sym))
  (export "main" (func $main))
  (data (;0;) (i32.const 1024) "=== Pascal upper matrix ===\00%4d%c\00=== Pascal lower matrix ===\00=== Pascal symmetric matrix ===\00"))
