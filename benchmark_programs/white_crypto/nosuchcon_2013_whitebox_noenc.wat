(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func))
  (import "env" "strtoul" (func $strtoul (type 0)))
  (import "env" "fopen" (func $fopen (type 1)))
  (import "env" "fread" (func $fread (type 2)))
  (import "env" "fclose" (func $fclose (type 3)))
  (import "env" "printf" (func $printf (type 1)))
  (import "env" "putchar" (func $putchar (type 3)))
  (func $__wasm_call_ctors (type 4))
  (func $is_hex_char (type 3) (param i32) (result i32)
    (local i32)
    i32.const 1
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.const -48
      i32.add
      i32.const 255
      i32.and
      i32.const 10
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const -97
      i32.add
      i32.const 255
      i32.and
      i32.const 6
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const -65
      i32.add
      i32.const 255
      i32.and
      i32.const 6
      i32.lt_u
      local.set 1
    end
    local.get 1)
  (func $main (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 350416
    i32.sub
    local.tee 2
    global.set 0
    i32.const 0
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.get 3
          i32.add
          local.tee 4
          i32.load8_u
          local.tee 5
          i32.const -48
          i32.add
          i32.const 255
          i32.and
          i32.const 10
          i32.lt_u
          br_if 0 (;@3;)
          i32.const 1
          local.set 6
          local.get 5
          i32.const -65
          i32.add
          local.tee 7
          i32.const 37
          i32.gt_u
          br_if 2 (;@1;)
          local.get 7
          br_table 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 1
          i32.add
          i32.load8_u
          local.tee 4
          i32.const -48
          i32.add
          i32.const 255
          i32.and
          i32.const 10
          i32.lt_u
          br_if 0 (;@3;)
          i32.const 1
          local.set 6
          local.get 4
          i32.const -65
          i32.add
          local.tee 7
          i32.const 37
          i32.gt_u
          br_if 2 (;@1;)
          local.get 7
          br_table 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 2 (;@1;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;) 0 (;@3;)
        end
        local.get 2
        local.get 4
        i32.store8 offset=1233
        local.get 2
        local.get 5
        i32.store8 offset=1232
        local.get 2
        i32.const 0
        i32.store8 offset=1234
        local.get 2
        i32.const 1024
        i32.add
        local.get 3
        i32.const 1
        i32.shr_u
        i32.add
        local.get 2
        i32.const 1232
        i32.add
        i32.const 0
        i32.const 16
        call $strtoul
        i32.store8
        local.get 3
        i32.const 2
        i32.add
        i32.const 255
        i32.and
        local.tee 3
        i32.const 32
        i32.lt_u
        br_if 0 (;@2;)
      end
      local.get 2
      i32.const 1232
      i32.add
      i32.const 1
      i32.const 349184
      i32.const 1024
      i32.const 1034
      call $fopen
      local.tee 3
      call $fread
      drop
      local.get 3
      call $fclose
      drop
      i32.const 1037
      i32.const 0
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1024
      local.tee 5
      i32.store offset=1008
      i32.const 1048
      local.get 2
      i32.const 1008
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1025
      local.tee 4
      i32.store offset=992
      i32.const 1048
      local.get 2
      i32.const 992
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1026
      local.tee 6
      i32.store offset=976
      i32.const 1048
      local.get 2
      i32.const 976
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1027
      local.tee 1
      i32.store offset=960
      i32.const 1048
      local.get 2
      i32.const 960
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1028
      local.tee 7
      i32.store offset=944
      i32.const 1048
      local.get 2
      i32.const 944
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1029
      local.tee 8
      i32.store offset=928
      i32.const 1048
      local.get 2
      i32.const 928
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1030
      local.tee 9
      i32.store offset=912
      i32.const 1048
      local.get 2
      i32.const 912
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1031
      local.tee 10
      i32.store offset=896
      i32.const 1048
      local.get 2
      i32.const 896
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1032
      local.tee 11
      i32.store offset=880
      i32.const 1048
      local.get 2
      i32.const 880
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1033
      local.tee 12
      i32.store offset=864
      i32.const 1048
      local.get 2
      i32.const 864
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1034
      local.tee 13
      i32.store offset=848
      i32.const 1048
      local.get 2
      i32.const 848
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1035
      local.tee 14
      i32.store offset=832
      i32.const 1048
      local.get 2
      i32.const 832
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1036
      local.tee 15
      i32.store offset=816
      i32.const 1048
      local.get 2
      i32.const 816
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1037
      local.tee 16
      i32.store offset=800
      i32.const 1048
      local.get 2
      i32.const 800
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1038
      local.tee 17
      i32.store offset=784
      i32.const 1048
      local.get 2
      i32.const 784
      i32.add
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1039
      local.tee 18
      i32.store offset=768
      i32.const 1048
      local.get 2
      i32.const 768
      i32.add
      call $printf
      drop
      i32.const 10
      call $putchar
      drop
      local.get 2
      local.get 5
      local.get 2
      i32.const 1488
      i32.add
      local.tee 3
      i32.add
      i32.load8_u
      local.tee 5
      i32.store8 offset=1040
      local.get 2
      local.get 3
      local.get 4
      i32.add
      i32.load8_u
      local.tee 4
      i32.store8 offset=1044
      local.get 2
      local.get 3
      local.get 6
      i32.add
      i32.load8_u
      local.tee 6
      i32.store8 offset=1048
      local.get 2
      local.get 3
      local.get 1
      i32.add
      i32.load8_u
      local.tee 1
      i32.store8 offset=1052
      local.get 2
      local.get 3
      local.get 7
      i32.add
      i32.load8_u
      local.tee 7
      i32.store8 offset=1041
      local.get 2
      local.get 3
      local.get 8
      i32.add
      i32.load8_u
      local.tee 8
      i32.store8 offset=1045
      local.get 2
      local.get 3
      local.get 9
      i32.add
      i32.load8_u
      local.tee 9
      i32.store8 offset=1049
      local.get 2
      local.get 3
      local.get 10
      i32.add
      i32.load8_u
      local.tee 10
      i32.store8 offset=1053
      local.get 2
      local.get 3
      local.get 11
      i32.add
      i32.load8_u
      local.tee 11
      i32.store8 offset=1042
      local.get 2
      local.get 3
      local.get 12
      i32.add
      i32.load8_u
      local.tee 12
      i32.store8 offset=1046
      local.get 2
      local.get 3
      local.get 13
      i32.add
      i32.load8_u
      local.tee 13
      i32.store8 offset=1050
      local.get 2
      local.get 3
      local.get 14
      i32.add
      i32.load8_u
      local.tee 14
      i32.store8 offset=1054
      local.get 2
      local.get 3
      local.get 15
      i32.add
      i32.load8_u
      local.tee 15
      i32.store8 offset=1043
      local.get 2
      local.get 3
      local.get 16
      i32.add
      i32.load8_u
      local.tee 16
      i32.store8 offset=1047
      local.get 2
      local.get 3
      local.get 17
      i32.add
      i32.load8_u
      local.tee 17
      i32.store8 offset=1051
      local.get 2
      local.get 3
      local.get 18
      i32.add
      i32.load8_u
      local.tee 3
      i32.store8 offset=1055
      i32.const 1054
      i32.const 0
      call $printf
      drop
      local.get 2
      local.get 5
      i32.store offset=752
      i32.const 1048
      local.get 2
      i32.const 752
      i32.add
      call $printf
      drop
      local.get 2
      local.get 7
      i32.store offset=736
      i32.const 1048
      local.get 2
      i32.const 736
      i32.add
      call $printf
      drop
      local.get 2
      local.get 11
      i32.store offset=720
      i32.const 1048
      local.get 2
      i32.const 720
      i32.add
      call $printf
      drop
      local.get 2
      local.get 15
      i32.store offset=704
      i32.const 1048
      local.get 2
      i32.const 704
      i32.add
      call $printf
      drop
      local.get 2
      local.get 4
      i32.store offset=688
      i32.const 1048
      local.get 2
      i32.const 688
      i32.add
      call $printf
      drop
      local.get 2
      local.get 8
      i32.store offset=672
      i32.const 1048
      local.get 2
      i32.const 672
      i32.add
      call $printf
      drop
      local.get 2
      local.get 12
      i32.store offset=656
      i32.const 1048
      local.get 2
      i32.const 656
      i32.add
      call $printf
      drop
      local.get 2
      local.get 16
      i32.store offset=640
      i32.const 1048
      local.get 2
      i32.const 640
      i32.add
      call $printf
      drop
      local.get 2
      local.get 6
      i32.store offset=624
      i32.const 1048
      local.get 2
      i32.const 624
      i32.add
      call $printf
      drop
      local.get 2
      local.get 9
      i32.store offset=608
      i32.const 1048
      local.get 2
      i32.const 608
      i32.add
      call $printf
      drop
      local.get 2
      local.get 13
      i32.store offset=592
      i32.const 1048
      local.get 2
      i32.const 592
      i32.add
      call $printf
      drop
      local.get 2
      local.get 17
      i32.store offset=576
      i32.const 1048
      local.get 2
      i32.const 576
      i32.add
      call $printf
      drop
      local.get 2
      local.get 1
      i32.store offset=560
      i32.const 1048
      local.get 2
      i32.const 560
      i32.add
      call $printf
      drop
      local.get 2
      local.get 10
      i32.store offset=544
      i32.const 1048
      local.get 2
      i32.const 544
      i32.add
      call $printf
      drop
      local.get 2
      local.get 14
      i32.store offset=528
      i32.const 1048
      local.get 2
      i32.const 528
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      i32.store offset=512
      i32.const 1048
      local.get 2
      i32.const 512
      i32.add
      call $printf
      drop
      i32.const 10
      call $putchar
      drop
      local.get 2
      i32.const 199632
      i32.add
      local.set 9
      local.get 2
      i32.const 1040
      i32.add
      i32.const 16
      i32.add
      local.set 7
      i32.const 1
      local.set 10
      loop  ;; label = @2
        local.get 10
        i32.const -1
        i32.add
        local.set 8
        local.get 9
        local.set 3
        i32.const 0
        local.set 5
        loop  ;; label = @3
          local.get 7
          local.get 5
          i32.add
          local.get 2
          i32.const 1232
          i32.add
          i32.const 1024
          i32.add
          local.tee 6
          local.get 6
          local.get 3
          local.get 2
          i32.const 1040
          i32.add
          local.get 8
          i32.const 4
          i32.shl
          i32.add
          local.tee 4
          local.get 5
          i32.const 3
          i32.and
          i32.or
          i32.load8_u
          i32.add
          i32.const -768
          i32.add
          i32.load8_u
          i32.const 8
          i32.shl
          local.get 3
          local.get 5
          i32.const 1
          i32.add
          local.tee 1
          i32.const 3
          i32.and
          local.get 4
          i32.or
          i32.load8_u offset=4
          i32.add
          i32.const -512
          i32.add
          i32.load8_u
          i32.or
          i32.add
          i32.load8_u
          i32.const 8
          i32.shl
          local.get 6
          local.get 3
          local.get 5
          i32.const 2
          i32.add
          i32.const 3
          i32.and
          local.get 4
          i32.or
          i32.load8_u offset=8
          i32.add
          i32.const -256
          i32.add
          i32.load8_u
          i32.const 8
          i32.shl
          local.get 3
          local.get 5
          i32.const -1
          i32.add
          i32.const 3
          i32.and
          local.get 4
          i32.or
          i32.load8_u offset=12
          i32.add
          i32.load8_u
          i32.or
          i32.add
          i32.const 65536
          i32.add
          i32.load8_u
          i32.or
          i32.add
          i32.const 131072
          i32.add
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 1024
          i32.add
          local.set 3
          local.get 1
          local.set 5
          local.get 1
          i32.const 16
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 9
        i32.const 16384
        i32.add
        local.set 9
        local.get 7
        i32.const 16
        i32.add
        local.set 7
        local.get 10
        i32.const 1
        i32.add
        local.tee 10
        i32.const 10
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 2
      i32.const 1204
      i32.add
      local.tee 7
      local.get 2
      i32.const 346320
      i32.add
      local.tee 3
      local.get 2
      i32.const 1185
      i32.add
      i32.load8_u
      i32.add
      i32.const 256
      i32.add
      i32.load8_u
      i32.store8
      local.get 2
      i32.const 1208
      i32.add
      local.tee 8
      local.get 3
      local.get 2
      i32.const 1186
      i32.add
      i32.load8_u
      i32.add
      i32.const 512
      i32.add
      i32.load8_u
      i32.store8
      local.get 2
      i32.const 1212
      i32.add
      local.tee 9
      local.get 3
      local.get 2
      i32.const 1187
      i32.add
      i32.load8_u
      i32.add
      i32.const 768
      i32.add
      i32.load8_u
      i32.store8
      local.get 2
      i32.const 1201
      i32.add
      local.tee 10
      local.get 3
      local.get 2
      i32.const 1189
      i32.add
      i32.load8_u
      i32.add
      i32.const 1024
      i32.add
      i32.load8_u
      local.tee 11
      i32.store8
      local.get 2
      local.get 3
      local.get 2
      i32.load8_u offset=1184
      i32.add
      i32.load8_u
      i32.store8 offset=1200
      local.get 2
      i32.const 1205
      i32.add
      local.tee 12
      local.get 3
      local.get 2
      i32.const 1190
      i32.add
      i32.load8_u
      i32.add
      i32.const 1280
      i32.add
      i32.load8_u
      local.tee 13
      i32.store8
      local.get 2
      i32.const 1209
      i32.add
      local.tee 14
      local.get 3
      local.get 2
      i32.const 1191
      i32.add
      i32.load8_u
      i32.add
      i32.const 1536
      i32.add
      i32.load8_u
      local.tee 15
      i32.store8
      local.get 2
      i32.const 1213
      i32.add
      local.tee 16
      local.get 3
      local.get 2
      i32.const 1188
      i32.add
      i32.load8_u
      i32.add
      i32.const 1792
      i32.add
      i32.load8_u
      local.tee 17
      i32.store8
      local.get 2
      i32.const 1202
      i32.add
      local.get 3
      local.get 2
      i32.const 1194
      i32.add
      i32.load8_u
      i32.add
      i32.const 2048
      i32.add
      i32.load8_u
      local.tee 5
      i32.store8
      local.get 2
      i32.const 1206
      i32.add
      local.tee 18
      local.get 3
      local.get 2
      i32.const 1195
      i32.add
      i32.load8_u
      i32.add
      i32.const 2304
      i32.add
      i32.load8_u
      local.tee 19
      i32.store8
      local.get 2
      i32.const 1210
      i32.add
      local.tee 20
      local.get 3
      local.get 2
      i32.const 1192
      i32.add
      i32.load8_u
      i32.add
      i32.const 2560
      i32.add
      i32.load8_u
      local.tee 21
      i32.store8
      local.get 2
      i32.const 1214
      i32.add
      local.tee 22
      local.get 3
      local.get 2
      i32.const 1193
      i32.add
      i32.load8_u
      i32.add
      i32.const 2816
      i32.add
      i32.load8_u
      local.tee 23
      i32.store8
      local.get 2
      i32.const 1203
      i32.add
      local.get 3
      local.get 2
      i32.const 1199
      i32.add
      i32.load8_u
      i32.add
      i32.const 3072
      i32.add
      i32.load8_u
      local.tee 4
      i32.store8
      local.get 2
      i32.const 1207
      i32.add
      local.get 3
      local.get 2
      i32.const 1196
      i32.add
      i32.load8_u
      i32.add
      i32.const 3328
      i32.add
      i32.load8_u
      local.tee 1
      i32.store8
      local.get 2
      i32.const 1211
      i32.add
      local.tee 24
      local.get 3
      local.get 2
      i32.const 1197
      i32.add
      i32.load8_u
      i32.add
      i32.const 3584
      i32.add
      i32.load8_u
      local.tee 25
      i32.store8
      local.get 2
      i32.const 1215
      i32.add
      local.tee 26
      local.get 3
      local.get 2
      i32.const 1198
      i32.add
      i32.load8_u
      i32.add
      i32.const 3840
      i32.add
      i32.load8_u
      local.tee 3
      i32.store8
      i32.const 0
      local.set 6
      i32.const 1065
      i32.const 0
      call $printf
      drop
      local.get 2
      local.get 2
      i32.load8_u offset=1200
      local.tee 27
      i32.store offset=496
      i32.const 1048
      local.get 2
      i32.const 496
      i32.add
      call $printf
      drop
      local.get 2
      local.get 11
      i32.store offset=480
      i32.const 1048
      local.get 2
      i32.const 480
      i32.add
      call $printf
      drop
      local.get 2
      local.get 5
      i32.store offset=464
      i32.const 1048
      local.get 2
      i32.const 464
      i32.add
      call $printf
      drop
      local.get 2
      local.get 4
      i32.store offset=448
      i32.const 1048
      local.get 2
      i32.const 448
      i32.add
      call $printf
      drop
      local.get 2
      local.get 7
      i32.load8_u
      local.tee 7
      i32.store offset=432
      i32.const 1048
      local.get 2
      i32.const 432
      i32.add
      call $printf
      drop
      local.get 2
      local.get 13
      i32.store offset=416
      i32.const 1048
      local.get 2
      i32.const 416
      i32.add
      call $printf
      drop
      local.get 2
      local.get 19
      i32.store offset=400
      i32.const 1048
      local.get 2
      i32.const 400
      i32.add
      call $printf
      drop
      local.get 2
      local.get 1
      i32.store offset=384
      i32.const 1048
      local.get 2
      i32.const 384
      i32.add
      call $printf
      drop
      local.get 2
      local.get 8
      i32.load8_u
      local.tee 8
      i32.store offset=368
      i32.const 1048
      local.get 2
      i32.const 368
      i32.add
      call $printf
      drop
      local.get 2
      local.get 15
      i32.store offset=352
      i32.const 1048
      local.get 2
      i32.const 352
      i32.add
      call $printf
      drop
      local.get 2
      local.get 21
      i32.store offset=336
      i32.const 1048
      local.get 2
      i32.const 336
      i32.add
      call $printf
      drop
      local.get 2
      local.get 25
      i32.store offset=320
      i32.const 1048
      local.get 2
      i32.const 320
      i32.add
      call $printf
      drop
      local.get 2
      local.get 9
      i32.load8_u
      local.tee 9
      i32.store offset=304
      i32.const 1048
      local.get 2
      i32.const 304
      i32.add
      call $printf
      drop
      local.get 2
      local.get 17
      i32.store offset=288
      i32.const 1048
      local.get 2
      i32.const 288
      i32.add
      call $printf
      drop
      local.get 2
      local.get 23
      i32.store offset=272
      i32.const 1048
      local.get 2
      i32.const 272
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      i32.store offset=256
      i32.const 1048
      local.get 2
      i32.const 256
      i32.add
      call $printf
      drop
      i32.const 10
      call $putchar
      drop
      i32.const 1076
      i32.const 0
      call $printf
      drop
      local.get 2
      local.get 27
      local.get 2
      i32.const 1232
      i32.add
      i32.const 768
      i32.add
      local.tee 3
      i32.add
      i32.load8_u
      i32.store offset=240
      i32.const 1048
      local.get 2
      i32.const 240
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 10
      i32.load8_u
      i32.add
      i32.load8_u
      i32.store offset=224
      i32.const 1048
      local.get 2
      i32.const 224
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 5
      i32.add
      i32.load8_u
      i32.store offset=208
      i32.const 1048
      local.get 2
      i32.const 208
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 4
      i32.add
      i32.load8_u
      i32.store offset=192
      i32.const 1048
      local.get 2
      i32.const 192
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 7
      i32.add
      i32.load8_u
      i32.store offset=176
      i32.const 1048
      local.get 2
      i32.const 176
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 12
      i32.load8_u
      i32.add
      i32.load8_u
      i32.store offset=160
      i32.const 1048
      local.get 2
      i32.const 160
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 18
      i32.load8_u
      i32.add
      i32.load8_u
      i32.store offset=144
      i32.const 1048
      local.get 2
      i32.const 144
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 1
      i32.add
      i32.load8_u
      i32.store offset=128
      i32.const 1048
      local.get 2
      i32.const 128
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 8
      i32.add
      i32.load8_u
      i32.store offset=112
      i32.const 1048
      local.get 2
      i32.const 112
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 14
      i32.load8_u
      i32.add
      i32.load8_u
      i32.store offset=96
      i32.const 1048
      local.get 2
      i32.const 96
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 20
      i32.load8_u
      i32.add
      i32.load8_u
      i32.store offset=80
      i32.const 1048
      local.get 2
      i32.const 80
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 24
      i32.load8_u
      i32.add
      i32.load8_u
      i32.store offset=64
      i32.const 1048
      local.get 2
      i32.const 64
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 9
      i32.add
      i32.load8_u
      i32.store offset=48
      i32.const 1048
      local.get 2
      i32.const 48
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 16
      i32.load8_u
      i32.add
      i32.load8_u
      i32.store offset=32
      i32.const 1048
      local.get 2
      i32.const 32
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 22
      i32.load8_u
      i32.add
      i32.load8_u
      i32.store offset=16
      i32.const 1048
      local.get 2
      i32.const 16
      i32.add
      call $printf
      drop
      local.get 2
      local.get 3
      local.get 26
      i32.load8_u
      i32.add
      i32.load8_u
      i32.store
      i32.const 1048
      local.get 2
      call $printf
      drop
      i32.const 10
      call $putchar
      drop
    end
    local.get 2
    i32.const 350416
    i32.add
    global.set 0
    local.get 6)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66624))
  (global (;1;) i32 (i32.const 1087))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66624))
  (global (;4;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__data_end" (global 1))
  (export "__global_base" (global 2))
  (export "__heap_base" (global 3))
  (export "__dso_handle" (global 4))
  (export "is_hex_char" (func $is_hex_char))
  (export "main" (func $main))
  (data (;0;) (i32.const 1024) "wbt_noenc\00rb\00Input:    \00%02X \00Enc in:   \00Enc out:  \00Output:   \00"))
