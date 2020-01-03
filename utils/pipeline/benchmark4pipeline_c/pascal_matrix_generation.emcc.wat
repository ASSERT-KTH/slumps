(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func))
  (import "env" "_calloc" (func (;0;) (type 0)))
  (import "env" "_printf" (func (;1;) (type 0)))
  (import "env" "_puts" (func (;2;) (type 1)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;3;) (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 1
    local.set 0
    global.get 1
    i32.const 608
    i32.add
    global.set 1
    i32.const 5
    i32.const 4
    call 0
    local.tee 1
    i32.const 5
    i32.const 4
    call 0
    i32.store
    local.get 1
    i32.const 5
    i32.const 4
    call 0
    i32.store offset=4
    local.get 1
    i32.const 5
    i32.const 4
    call 0
    i32.store offset=8
    local.get 1
    i32.const 5
    i32.const 4
    call 0
    i32.store offset=12
    local.get 1
    i32.const 5
    i32.const 4
    call 0
    i32.store offset=16
    global.get 0
    i32.const 6
    i32.add
    call 2
    drop
    local.get 1
    i32.load
    local.tee 2
    i32.const 1
    i32.store
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i32.const 1
    i32.store offset=8
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 1
    i32.store offset=16
    local.get 1
    i32.load offset=4
    local.tee 3
    i32.const 0
    i32.store
    local.get 3
    i32.const 1
    i32.store offset=4
    local.get 3
    local.get 2
    i32.load offset=4
    i32.const 1
    i32.add
    local.tee 4
    i32.store offset=8
    local.get 3
    local.get 2
    i32.load offset=8
    local.get 4
    i32.add
    local.tee 4
    i32.store offset=12
    local.get 3
    local.get 2
    i32.load offset=12
    local.get 4
    i32.add
    i32.store offset=16
    local.get 1
    i32.load offset=8
    local.tee 4
    i32.const 0
    i32.store
    local.get 4
    i32.const 0
    i32.store offset=4
    local.get 4
    i32.const 1
    i32.store offset=8
    local.get 4
    local.get 3
    i32.load offset=8
    i32.const 1
    i32.add
    local.tee 5
    i32.store offset=12
    local.get 4
    local.get 3
    i32.load offset=12
    local.get 5
    i32.add
    i32.store offset=16
    local.get 1
    i32.load offset=12
    local.tee 3
    i32.const 0
    i32.store
    local.get 3
    i32.const 0
    i32.store offset=4
    local.get 3
    i32.const 0
    i32.store offset=8
    local.get 3
    i32.const 1
    i32.store offset=12
    local.get 3
    local.get 4
    i32.load offset=12
    i32.const 1
    i32.add
    i32.store offset=16
    local.get 1
    i32.load offset=16
    local.tee 3
    i32.const 0
    i32.store
    local.get 3
    i32.const 0
    i32.store offset=4
    local.get 3
    i32.const 0
    i32.store offset=8
    local.get 3
    i32.const 0
    i32.store offset=12
    local.get 3
    i32.const 1
    i32.store offset=16
    local.get 0
    local.get 2
    i32.load
    i32.store
    local.get 0
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 0
    call 1
    drop
    local.get 0
    i32.const 8
    i32.add
    local.tee 2
    local.get 1
    i32.load
    local.tee 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 16
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 24
    i32.add
    local.tee 2
    local.get 1
    i32.load
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 32
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 40
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=4
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 48
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 56
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const -64
    i32.sub
    local.tee 2
    local.get 1
    i32.load offset=4
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 72
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 80
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=8
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 88
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 96
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 104
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=8
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 112
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 120
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=12
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 128
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 136
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 144
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=12
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 152
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 160
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=16
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 168
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 176
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 184
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=16
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 192
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    global.get 0
    i32.const 34
    i32.add
    call 2
    drop
    local.get 1
    i32.load
    local.tee 4
    i32.const 1
    i32.store
    local.get 4
    i32.const 0
    i32.store offset=4
    local.get 4
    i32.const 0
    i32.store offset=8
    local.get 4
    i32.const 0
    i32.store offset=12
    local.get 4
    i32.const 0
    i32.store offset=16
    local.get 1
    i32.load offset=4
    local.tee 2
    i32.const 1
    i32.store
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store offset=8
    local.get 2
    i32.const 0
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store offset=16
    local.get 1
    i32.load offset=8
    local.tee 3
    i32.const 1
    i32.store
    local.get 3
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    i32.add
    i32.store offset=4
    local.get 3
    i32.const 1
    i32.store offset=8
    local.get 3
    i32.const 0
    i32.store offset=12
    local.get 3
    i32.const 0
    i32.store offset=16
    local.get 1
    i32.load offset=12
    local.tee 2
    i32.const 1
    i32.store
    local.get 2
    local.get 3
    i32.load
    local.get 3
    i32.load offset=4
    i32.add
    i32.store offset=4
    local.get 2
    local.get 3
    i32.load offset=4
    local.get 3
    i32.load offset=8
    i32.add
    i32.store offset=8
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.store offset=16
    local.get 1
    i32.load offset=16
    local.tee 3
    i32.const 1
    i32.store
    local.get 3
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    i32.add
    i32.store offset=4
    local.get 3
    local.get 2
    i32.load offset=4
    local.get 2
    i32.load offset=8
    i32.add
    i32.store offset=8
    local.get 3
    local.get 2
    i32.load offset=8
    local.get 2
    i32.load offset=12
    i32.add
    i32.store offset=12
    local.get 3
    i32.const 1
    i32.store offset=16
    local.get 0
    i32.const 200
    i32.add
    local.tee 2
    local.get 4
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 208
    i32.add
    local.tee 2
    local.get 1
    i32.load
    local.tee 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 216
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 224
    i32.add
    local.tee 2
    local.get 1
    i32.load
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 232
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 240
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=4
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 248
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 256
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 264
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=4
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 272
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 280
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=8
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 288
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 296
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 304
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=8
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 312
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 320
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=12
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 328
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 336
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 344
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=12
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 352
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 360
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=16
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 368
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 376
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 384
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=16
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 392
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    global.get 0
    i32.const 62
    i32.add
    call 2
    drop
    local.get 1
    i32.load
    local.tee 2
    i32.const 1
    i32.store
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i32.const 1
    i32.store offset=8
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 1
    i32.store offset=16
    local.get 1
    i32.load offset=4
    local.tee 3
    i32.const 1
    i32.store
    local.get 3
    local.get 2
    i32.load offset=4
    i32.const 1
    i32.add
    local.tee 4
    i32.store offset=4
    local.get 3
    local.get 2
    i32.load offset=8
    local.get 4
    i32.add
    local.tee 4
    i32.store offset=8
    local.get 3
    local.get 2
    i32.load offset=12
    local.get 4
    i32.add
    local.tee 4
    i32.store offset=12
    local.get 3
    local.get 2
    i32.load offset=16
    local.get 4
    i32.add
    i32.store offset=16
    local.get 1
    i32.load offset=8
    local.tee 4
    i32.const 1
    i32.store
    local.get 4
    local.get 3
    i32.load offset=4
    i32.const 1
    i32.add
    local.tee 5
    i32.store offset=4
    local.get 4
    local.get 3
    i32.load offset=8
    local.get 5
    i32.add
    local.tee 5
    i32.store offset=8
    local.get 4
    local.get 3
    i32.load offset=12
    local.get 5
    i32.add
    local.tee 5
    i32.store offset=12
    local.get 4
    local.get 3
    i32.load offset=16
    local.get 5
    i32.add
    i32.store offset=16
    local.get 1
    i32.load offset=12
    local.tee 3
    i32.const 1
    i32.store
    local.get 3
    local.get 4
    i32.load offset=4
    i32.const 1
    i32.add
    local.tee 5
    i32.store offset=4
    local.get 3
    local.get 4
    i32.load offset=8
    local.get 5
    i32.add
    local.tee 5
    i32.store offset=8
    local.get 3
    local.get 4
    i32.load offset=12
    local.get 5
    i32.add
    local.tee 5
    i32.store offset=12
    local.get 3
    local.get 4
    i32.load offset=16
    local.get 5
    i32.add
    i32.store offset=16
    local.get 1
    i32.load offset=16
    local.tee 4
    i32.const 1
    i32.store
    local.get 4
    local.get 3
    i32.load offset=4
    i32.const 1
    i32.add
    local.tee 5
    i32.store offset=4
    local.get 4
    local.get 3
    i32.load offset=8
    local.get 5
    i32.add
    local.tee 5
    i32.store offset=8
    local.get 4
    local.get 3
    i32.load offset=12
    local.get 5
    i32.add
    local.tee 5
    i32.store offset=12
    local.get 4
    local.get 3
    i32.load offset=16
    local.get 5
    i32.add
    i32.store offset=16
    local.get 0
    i32.const 400
    i32.add
    local.tee 3
    local.get 2
    i32.load
    i32.store
    local.get 3
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 3
    call 1
    drop
    local.get 0
    i32.const 408
    i32.add
    local.tee 2
    local.get 1
    i32.load
    local.tee 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 416
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 424
    i32.add
    local.tee 2
    local.get 1
    i32.load
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 432
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 440
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=4
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 448
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 456
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 464
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=4
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 472
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 480
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=8
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 488
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 496
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 504
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=8
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 512
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 520
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=12
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 528
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 536
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 544
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=12
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 552
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=16
    i32.store
    local.get 2
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 560
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=16
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 568
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=4
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 576
    i32.add
    local.tee 2
    local.get 3
    i32.load offset=8
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 584
    i32.add
    local.tee 2
    local.get 1
    i32.load offset=16
    local.tee 3
    i32.load offset=12
    i32.store
    local.get 2
    i32.const 32
    i32.store offset=4
    global.get 0
    local.get 2
    call 1
    drop
    local.get 0
    i32.const 592
    i32.add
    local.tee 1
    local.get 3
    i32.load offset=16
    i32.store
    local.get 1
    i32.const 10
    i32.store offset=4
    global.get 0
    local.get 1
    call 1
    drop
    local.get 0
    global.set 1
    i32.const 0)
  (func (;4;) (type 2)
    global.get 0
    i32.const 96
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) i32 (i32.const 6))
  (export "__post_instantiate" (func 4))
  (export "_main" (func 3))
  (export "_str" (global 3))
  (data (;0;) (global.get 0) "%4d%c\00=== Pascal upper matrix ===\00=== Pascal lower matrix ===\00=== Pascal symmetric matrix ==="))
