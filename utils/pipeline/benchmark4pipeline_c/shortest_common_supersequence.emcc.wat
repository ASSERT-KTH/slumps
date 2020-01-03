(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func))
  (import "env" "_printf" (func (;0;) (type 0)))
  (import "env" "_strlen" (func (;1;) (type 1)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;2;) (type 2) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 6
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    local.get 0
    call 1
    local.set 7
    local.get 1
    call 1
    local.set 5
    global.get 1
    local.set 10
    global.get 1
    local.get 7
    i32.const 1
    i32.add
    local.tee 11
    local.get 5
    i32.const 1
    i32.add
    i32.mul
    i32.const 12
    i32.mul
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    i32.add
    global.set 1
    local.get 5
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.get 3
        i32.add
        i32.load8_s
        local.set 9
        local.get 3
        local.get 11
        i32.mul
        i32.const 12
        i32.mul
        local.get 10
        i32.add
        local.get 7
        i32.const 12
        i32.mul
        i32.add
        local.tee 4
        local.get 5
        local.get 3
        i32.sub
        i32.store
        local.get 4
        local.get 9
        i32.store8 offset=4
        local.get 4
        local.get 6
        i32.load8_s offset=6
        i32.store8 offset=5
        local.get 4
        local.get 6
        i32.load8_s offset=7
        i32.store8 offset=6
        local.get 4
        local.get 6
        i32.load8_s offset=8
        i32.store8 offset=7
        local.get 4
        local.get 11
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.mul
        i32.const 12
        i32.mul
        local.get 10
        i32.add
        local.get 7
        i32.const 12
        i32.mul
        i32.add
        i32.store offset=8
        local.get 3
        local.get 5
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 5
    local.get 11
    i32.mul
    i32.const 12
    i32.mul
    local.get 10
    i32.add
    local.set 9
    local.get 7
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 3
      loop  ;; label = @2
        local.get 0
        local.get 3
        i32.add
        i32.load8_s
        local.set 8
        local.get 3
        i32.const 12
        i32.mul
        local.get 9
        i32.add
        local.tee 4
        local.get 7
        local.get 3
        i32.sub
        i32.store
        local.get 4
        local.get 8
        i32.store8 offset=4
        local.get 4
        local.get 6
        i32.load8_s offset=3
        i32.store8 offset=5
        local.get 4
        local.get 6
        i32.load8_s offset=4
        i32.store8 offset=6
        local.get 4
        local.get 6
        i32.load8_s offset=5
        i32.store8 offset=7
        local.get 4
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.const 12
        i32.mul
        local.get 9
        i32.add
        i32.store offset=8
        local.get 3
        local.get 7
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 7
    i32.const 12
    i32.mul
    local.get 9
    i32.add
    local.tee 3
    i32.const 0
    i32.store
    local.get 3
    i32.const 0
    i32.store8 offset=4
    local.get 3
    local.get 6
    i32.load8_s
    i32.store8 offset=5
    local.get 3
    local.get 6
    i32.load8_s offset=1
    i32.store8 offset=6
    local.get 3
    local.get 6
    i32.load8_s offset=2
    i32.store8 offset=7
    local.get 3
    i32.const 0
    i32.store offset=8
    local.get 7
    i32.eqz
    local.get 5
    i32.eqz
    i32.or
    i32.eqz
    if  ;; label = @1
      local.get 5
      local.set 3
      loop  ;; label = @2
        local.get 11
        local.get 3
        i32.const -1
        i32.add
        local.tee 4
        i32.mul
        i32.const 12
        i32.mul
        local.get 10
        i32.add
        local.set 13
        local.get 3
        local.get 11
        i32.mul
        i32.const 12
        i32.mul
        local.get 10
        i32.add
        local.set 14
        local.get 1
        local.get 4
        i32.add
        i32.load8_s
        local.set 12
        local.get 7
        local.set 3
        loop  ;; label = @3
          local.get 3
          i32.const -1
          i32.add
          local.tee 5
          i32.const 12
          i32.mul
          local.get 13
          i32.add
          local.set 8
          local.get 12
          local.get 0
          local.get 5
          i32.add
          i32.load8_s
          local.tee 15
          i32.eq
          if  ;; label = @4
            local.get 8
            local.get 3
            i32.const 12
            i32.mul
            local.get 14
            i32.add
            local.tee 3
            i32.store offset=8
            local.get 8
            local.get 12
            i32.store8 offset=4
          else
            local.get 3
            i32.const 12
            i32.mul
            local.get 13
            i32.add
            local.tee 3
            i32.load
            local.get 5
            i32.const 12
            i32.mul
            local.get 14
            i32.add
            local.tee 9
            i32.load
            i32.lt_s
            if  ;; label = @5
              local.get 8
              local.get 3
              i32.store offset=8
              local.get 8
              local.get 15
              i32.store8 offset=4
            else
              local.get 8
              local.get 9
              i32.store offset=8
              local.get 8
              local.get 12
              i32.store8 offset=4
              local.get 9
              local.set 3
            end
          end
          local.get 8
          local.get 3
          i32.load
          i32.const 1
          i32.add
          i32.store
          local.get 5
          if  ;; label = @4
            local.get 5
            local.set 3
            br 1 (;@3;)
          end
        end
        local.get 4
        if  ;; label = @3
          local.get 4
          local.set 3
          br 1 (;@2;)
        end
      end
    end
    local.get 10
    local.set 0
    loop  ;; label = @1
      local.get 2
      i32.const 1
      i32.add
      local.set 1
      local.get 2
      local.get 0
      i32.load8_s offset=4
      i32.store8
      local.get 0
      i32.load offset=8
      local.tee 0
      if  ;; label = @2
        local.get 1
        local.set 2
        br 1 (;@1;)
      end
    end
    local.get 6
    global.set 1)
  (func (;3;) (type 3) (result i32)
    (local i32 i32 i32 i32)
    global.get 1
    local.set 1
    global.get 1
    i32.const 160
    i32.add
    global.set 1
    local.get 1
    i32.const 128
    i32.add
    local.tee 3
    local.tee 0
    i32.const 1650680417
    i32.store
    local.get 0
    i32.const 4
    i32.add
    i32.const 6447460
    i32.store
    local.get 1
    i32.const 148
    i32.add
    local.tee 0
    global.get 0
    i32.load8_s
    i32.store8
    local.get 0
    global.get 0
    i32.load8_s offset=1
    i32.store8 offset=1
    local.get 0
    global.get 0
    i32.load8_s offset=2
    i32.store8 offset=2
    local.get 0
    global.get 0
    i32.load8_s offset=3
    i32.store8 offset=3
    local.get 0
    global.get 0
    i32.load8_s offset=4
    i32.store8 offset=4
    local.get 0
    global.get 0
    i32.load8_s offset=5
    i32.store8 offset=5
    local.get 0
    global.get 0
    i32.load8_s offset=6
    i32.store8 offset=6
    local.get 3
    local.get 0
    local.get 1
    call 2
    local.get 1
    i32.const 136
    i32.add
    local.tee 2
    local.get 3
    i32.store
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 2
    local.get 1
    i32.store offset=8
    global.get 0
    i32.const 7
    i32.add
    local.get 2
    call 0
    drop
    local.get 1
    global.set 1
    i32.const 0)
  (func (;4;) (type 4)
    global.get 0
    i32.const 32
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 4))
  (export "_main" (func 3))
  (data (;0;) (global.get 0) "bdcaba\00SCS(%s, %s) -> %s\0a"))
