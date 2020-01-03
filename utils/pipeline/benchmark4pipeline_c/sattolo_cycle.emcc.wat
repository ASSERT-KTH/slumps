(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func))
  (import "env" "_printf" (func (;0;) (type 0)))
  (import "env" "_rand" (func (;1;) (type 1)))
  (import "env" "_srand" (func (;2;) (type 2)))
  (import "env" "_time" (func (;3;) (type 3)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;4;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 0
    global.get 1
    i32.const 240
    i32.add
    global.set 1
    local.get 0
    i32.const 224
    i32.add
    local.set 15
    local.get 0
    i32.const 216
    i32.add
    local.set 16
    local.get 0
    i32.const 208
    i32.add
    local.set 17
    local.get 0
    i32.const 200
    i32.add
    local.set 18
    local.get 0
    i32.const 192
    i32.add
    local.set 19
    local.get 0
    i32.const 184
    i32.add
    local.set 20
    local.get 0
    i32.const 176
    i32.add
    local.set 21
    local.get 0
    i32.const 168
    i32.add
    local.set 22
    local.get 0
    i32.const 160
    i32.add
    local.set 23
    local.get 0
    i32.const 152
    i32.add
    local.set 24
    local.get 0
    i32.const 144
    i32.add
    local.set 25
    local.get 0
    i32.const 136
    i32.add
    local.set 26
    local.get 0
    i32.const 128
    i32.add
    local.set 27
    local.get 0
    i32.const 120
    i32.add
    local.set 6
    local.get 0
    i32.const 112
    i32.add
    local.set 7
    local.get 0
    i32.const 104
    i32.add
    local.set 8
    local.get 0
    i32.const 96
    i32.add
    local.set 12
    local.get 0
    i32.const 88
    i32.add
    local.set 9
    local.get 0
    i32.const 80
    i32.add
    local.set 10
    local.get 0
    i32.const 72
    i32.add
    local.set 13
    local.get 0
    i32.const -64
    i32.sub
    local.set 11
    local.get 0
    i32.const 56
    i32.add
    local.set 3
    local.get 0
    i32.const 48
    i32.add
    local.set 4
    local.get 0
    i32.const 228
    i32.add
    local.tee 2
    global.get 0
    i32.load offset=48
    i32.store
    local.get 2
    global.get 0
    i32.load offset=52
    i32.store offset=4
    local.get 2
    global.get 0
    i32.load offset=56
    i32.store offset=8
    global.get 0
    local.set 14
    local.get 0
    local.tee 5
    i32.const 48
    i32.add
    local.set 1
    loop  ;; label = @1
      local.get 5
      local.get 14
      i32.load
      i32.store
      local.get 14
      i32.const 4
      i32.add
      local.set 14
      local.get 5
      i32.const 4
      i32.add
      local.tee 5
      local.get 1
      i32.lt_s
      br_if 0 (;@1;)
    end
    i32.const 0
    call 3
    call 2
    global.get 0
    i32.const 60
    i32.add
    local.get 4
    call 0
    drop
    global.get 0
    i32.const 79
    i32.add
    local.get 3
    call 0
    drop
    local.get 11
    i32.const 10
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 11
    call 0
    drop
    call 1
    drop
    global.get 0
    i32.const 94
    i32.add
    local.get 13
    call 0
    drop
    local.get 10
    i32.const 20
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 10
    call 0
    drop
    local.get 9
    i32.const 10
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 9
    call 0
    drop
    call 1
    i32.const 2
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 2
    i32.add
    local.tee 1
    i32.load
    local.set 3
    local.get 1
    i32.const 30
    i32.store
    local.get 2
    local.get 3
    i32.store offset=8
    call 1
    drop
    local.get 2
    i32.load
    local.set 4
    local.get 2
    local.get 2
    i32.load offset=4
    local.tee 1
    i32.store
    local.get 2
    local.get 4
    i32.store offset=4
    global.get 0
    i32.const 109
    i32.add
    local.get 12
    call 0
    drop
    local.get 8
    local.get 1
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 8
    call 0
    drop
    local.get 7
    local.get 4
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 7
    call 0
    drop
    local.get 6
    local.get 3
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 6
    call 0
    drop
    call 1
    i32.const 11
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 5
    local.get 1
    i32.const 22
    i32.store
    local.get 0
    local.get 5
    i32.store offset=44
    call 1
    i32.const 10
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 6
    local.get 1
    local.get 0
    i32.load offset=40
    i32.store
    local.get 0
    local.get 6
    i32.store offset=40
    call 1
    i32.const 9
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 7
    local.get 1
    local.get 0
    i32.load offset=36
    i32.store
    local.get 0
    local.get 7
    i32.store offset=36
    call 1
    i32.const 8
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 8
    local.get 1
    local.get 0
    i32.load offset=32
    i32.store
    local.get 0
    local.get 8
    i32.store offset=32
    call 1
    i32.const 7
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 9
    local.get 1
    local.get 0
    i32.load offset=28
    i32.store
    local.get 0
    local.get 9
    i32.store offset=28
    call 1
    i32.const 6
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 10
    local.get 1
    local.get 0
    i32.load offset=24
    i32.store
    local.get 0
    local.get 10
    i32.store offset=24
    call 1
    i32.const 5
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 11
    local.get 1
    local.get 0
    i32.load offset=20
    i32.store
    local.get 0
    local.get 11
    i32.store offset=20
    call 1
    i32.const 4
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 12
    local.get 1
    local.get 0
    i32.load offset=16
    i32.store
    local.get 0
    local.get 12
    i32.store offset=16
    call 1
    i32.const 3
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 13
    local.get 1
    local.get 0
    i32.load offset=12
    i32.store
    local.get 0
    local.get 13
    i32.store offset=12
    call 1
    i32.const 2
    i32.rem_s
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    local.tee 1
    i32.load
    local.set 3
    local.get 1
    local.get 0
    i32.load offset=8
    i32.store
    local.get 0
    local.get 3
    i32.store offset=8
    call 1
    drop
    local.get 0
    i32.load
    local.set 4
    local.get 0
    i32.load offset=4
    local.set 1
    global.get 0
    i32.const 124
    i32.add
    local.get 27
    call 0
    drop
    local.get 26
    local.get 1
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 26
    call 0
    drop
    local.get 25
    local.get 4
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 25
    call 0
    drop
    local.get 24
    local.get 3
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 24
    call 0
    drop
    local.get 23
    local.get 13
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 23
    call 0
    drop
    local.get 22
    local.get 12
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 22
    call 0
    drop
    local.get 21
    local.get 11
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 21
    call 0
    drop
    local.get 20
    local.get 10
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 20
    call 0
    drop
    local.get 19
    local.get 9
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 19
    call 0
    drop
    local.get 18
    local.get 8
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 18
    call 0
    drop
    local.get 17
    local.get 7
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 17
    call 0
    drop
    local.get 16
    local.get 6
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 16
    call 0
    drop
    local.get 15
    local.get 5
    i32.store
    global.get 0
    i32.const 75
    i32.add
    local.get 15
    call 0
    drop
    local.get 0
    global.set 1
    i32.const 0)
  (func (;5;) (type 4)
    global.get 0
    i32.const 144
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 5))
  (export "_main" (func 4))
  (data (;0;) (global.get 0) "\0b\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\0f\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\13\00\00\00\14\00\00\00\15\00\00\00\16\00\00\00\0a\00\00\00\14\00\00\00\1e\00\00\00\0aShuffled a = \00%d \00\0aShuffled b = \00\0aShuffled c = \00\0aShuffled d = \00\0aShuffled e = "))
