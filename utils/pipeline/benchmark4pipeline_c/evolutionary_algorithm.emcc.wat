(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (result i32)))
  (type (;2;) (func))
  (import "env" "_printf" (func (;0;) (type 0)))
  (import "env" "_rand" (func (;1;) (type 1)))
  (import "env" "_strcpy" (func (;2;) (type 0)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;3;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 6
    global.get 1
    i32.const 896
    i32.add
    global.set 1
    local.get 6
    i32.const 872
    i32.add
    local.set 5
    local.get 6
    local.set 0
    loop  ;; label = @1
      loop  ;; label = @2
        call 1
        local.tee 1
        i32.const 2147483637
        i32.ge_s
        br_if 0 (;@2;)
      end
      local.get 0
      local.get 2
      i32.add
      global.get 0
      i32.const 32
      i32.add
      local.get 1
      i32.const 79536431
      i32.div_s
      i32.add
      i32.load8_s
      i32.store8
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      i32.const 28
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 0
    i32.const 0
    i32.store8 offset=28
    i32.const 0
    local.set 1
    loop  ;; label = @1
      i32.const 1
      local.set 4
      loop  ;; label = @2
        local.get 0
        i32.load8_s
        if  ;; label = @3
          local.get 0
          local.set 2
          i32.const 0
          local.set 3
          loop  ;; label = @4
            loop  ;; label = @5
              call 1
              local.tee 8
              i32.const 2147483640
              i32.ge_s
              br_if 0 (;@5;)
            end
            local.get 8
            i32.const 143165575
            i32.add
            i32.const 286331151
            i32.lt_u
            if  ;; label = @5
              loop  ;; label = @6
                call 1
                local.tee 2
                i32.const 2147483637
                i32.ge_s
                br_if 0 (;@6;)
              end
              global.get 0
              i32.const 32
              i32.add
              local.get 2
              i32.const 79536431
              i32.div_s
              i32.add
              local.set 2
            end
            local.get 3
            local.get 4
            i32.const 29
            i32.mul
            local.get 0
            i32.add
            i32.add
            local.get 2
            i32.load8_s
            i32.store8
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            local.get 0
            i32.add
            local.tee 2
            i32.load8_s
            br_if 0 (;@4;)
          end
        else
          i32.const 0
          local.set 3
        end
        local.get 3
        local.get 4
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.add
        i32.const 0
        i32.store8
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.const 30
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 1
      local.set 2
      i32.const 0
      local.set 3
      i32.const 0
      local.set 1
      loop  ;; label = @2
        local.get 3
        local.get 1
        local.get 1
        i32.const 0
        i32.ne
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s
        i32.const 77
        i32.ne
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=1
        i32.const 69
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=2
        i32.const 84
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=3
        i32.const 72
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=4
        i32.const 73
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=5
        i32.const 78
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=6
        i32.const 75
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=7
        i32.const 83
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=8
        i32.const 32
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=9
        i32.const 73
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=10
        i32.const 84
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=11
        i32.const 32
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=12
        i32.const 73
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=13
        i32.const 83
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=14
        i32.const 32
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=15
        i32.const 76
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=16
        i32.const 73
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=17
        i32.const 75
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=18
        i32.const 69
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=19
        i32.const 32
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=20
        i32.const 65
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=21
        i32.const 32
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=22
        i32.const 87
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=23
        i32.const 69
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=24
        i32.const 65
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=25
        i32.const 83
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=26
        i32.const 69
        i32.ne
        i32.add
        local.get 1
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        i32.load8_s offset=27
        i32.const 76
        i32.ne
        i32.add
        local.tee 4
        local.get 2
        i32.ge_s
        i32.and
        local.tee 8
        select
        local.set 3
        local.get 2
        local.get 4
        local.get 8
        select
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.const 30
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 3
      if  ;; label = @2
        local.get 0
        local.get 3
        i32.const 29
        i32.mul
        local.get 0
        i32.add
        call 2
        drop
      end
      local.get 7
      i32.const 1
      i32.add
      local.set 3
      local.get 5
      local.get 7
      i32.store
      local.get 5
      local.get 2
      i32.store offset=4
      local.get 5
      local.get 0
      i32.store offset=8
      global.get 0
      i32.const -64
      i32.sub
      local.get 5
      call 0
      drop
      local.get 2
      if  ;; label = @2
        local.get 2
        local.set 1
        local.get 3
        local.set 7
        br 1 (;@1;)
      end
    end
    local.get 6
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
  (global (;3;) i32 (i32.const 0))
  (global (;4;) i32 (i32.const 32))
  (export "__post_instantiate" (func 4))
  (export "_main" (func 3))
  (export "_target" (global 3))
  (export "_tbl" (global 4))
  (data (;0;) (global.get 0) "METHINKS IT IS LIKE A WEASEL\00\00\00\00ABCDEFGHIJKLMNOPQRSTUVWXYZ \00\00\00\00\00iter %d, score %d: %s\0a"))
