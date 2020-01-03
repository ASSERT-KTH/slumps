(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32) (result f64)))
  (type (;3;) (func (param i32) (result f64)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func))
  (import "env" "_calloc" (func (;0;) (type 0)))
  (import "env" "_free" (func (;1;) (type 1)))
  (import "env" "_printf" (func (;2;) (type 0)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;3;) (type 2) (param i32 i32) (result f64)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 f64 f64)
    loop  ;; label = @1
      local.get 2
      i32.const 1
      i32.add
      local.tee 6
      i32.const 10
      i32.lt_s
      local.set 7
      local.get 6
      i32.const 2
      i32.shl
      local.get 0
      i32.add
      local.set 8
      local.get 2
      i32.const 2
      i32.shl
      local.get 0
      i32.add
      i32.load
      local.set 4
      local.get 2
      i32.const 2
      i32.shl
      local.get 1
      i32.add
      i32.load
      local.set 9
      local.get 2
      if  ;; label = @2
        local.get 2
        i32.const -1
        i32.add
        i32.const 2
        i32.shl
        local.get 0
        i32.add
        i32.load
        local.set 10
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 3
          i32.const 4
          i32.shl
          local.get 10
          i32.add
          f64.load
          f64.const 0x0p+0 (;=0;)
          f64.add
          local.set 11
          local.get 3
          if (result i32)  ;; label = @4
            local.get 11
            local.get 3
            i32.const -1
            i32.add
            i32.const 4
            i32.shl
            local.get 4
            i32.add
            f64.load
            f64.add
            local.set 11
            i32.const 2
          else
            i32.const 1
          end
          local.set 2
          local.get 7
          if  ;; label = @4
            local.get 11
            local.get 8
            i32.load
            local.get 3
            i32.const 4
            i32.shl
            i32.add
            f64.load
            f64.add
            local.set 11
            local.get 2
            i32.const 1
            i32.add
            local.set 2
          end
          local.get 3
          i32.const 1
          i32.add
          local.tee 5
          i32.const 10
          i32.lt_s
          if  ;; label = @4
            local.get 11
            local.get 5
            i32.const 4
            i32.shl
            local.get 4
            i32.add
            f64.load
            f64.add
            local.set 11
            local.get 2
            i32.const 1
            i32.add
            local.set 2
          end
          local.get 3
          i32.const 4
          i32.shl
          local.get 9
          i32.add
          local.get 3
          i32.const 4
          i32.shl
          local.get 4
          i32.add
          f64.load
          local.get 11
          local.get 2
          f64.convert_i32_s
          f64.div
          f64.sub
          local.tee 11
          f64.store
          local.get 12
          local.get 12
          local.get 11
          local.get 11
          f64.mul
          f64.add
          local.get 3
          i32.const 4
          i32.shl
          local.get 4
          i32.add
          i32.load offset=8
          select
          local.set 12
          local.get 5
          i32.const 10
          i32.ne
          if  ;; label = @4
            local.get 5
            local.set 3
            br 1 (;@3;)
          end
        end
      else
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 3
          if (result i32)  ;; label = @4
            local.get 3
            i32.const -1
            i32.add
            i32.const 4
            i32.shl
            local.get 4
            i32.add
            f64.load
            f64.const 0x0p+0 (;=0;)
            f64.add
            local.set 11
            i32.const 1
          else
            f64.const 0x0p+0 (;=0;)
            local.set 11
            i32.const 0
          end
          local.set 2
          local.get 7
          if  ;; label = @4
            local.get 11
            local.get 8
            i32.load
            local.get 3
            i32.const 4
            i32.shl
            i32.add
            f64.load
            f64.add
            local.set 11
            local.get 2
            i32.const 1
            i32.add
            local.set 2
          end
          local.get 3
          i32.const 1
          i32.add
          local.tee 5
          i32.const 10
          i32.lt_s
          if  ;; label = @4
            local.get 11
            local.get 5
            i32.const 4
            i32.shl
            local.get 4
            i32.add
            f64.load
            f64.add
            local.set 11
            local.get 2
            i32.const 1
            i32.add
            local.set 2
          end
          local.get 3
          i32.const 4
          i32.shl
          local.get 9
          i32.add
          local.get 3
          i32.const 4
          i32.shl
          local.get 4
          i32.add
          f64.load
          local.get 11
          local.get 2
          f64.convert_i32_s
          f64.div
          f64.sub
          local.tee 11
          f64.store
          local.get 12
          local.get 12
          local.get 11
          local.get 11
          f64.mul
          f64.add
          local.get 3
          i32.const 4
          i32.shl
          local.get 4
          i32.add
          i32.load offset=8
          select
          local.set 12
          local.get 5
          i32.const 10
          i32.ne
          if  ;; label = @4
            local.get 5
            local.set 3
            br 1 (;@3;)
          end
        end
      end
      local.get 6
      i32.const 10
      i32.ne
      if  ;; label = @2
        local.get 6
        local.set 2
        br 1 (;@1;)
      end
    end
    local.get 12)
  (func (;4;) (type 3) (param i32) (result f64)
    (local i32 i32 i32 i32 i32 i32 i32 i32 f64 f64)
    global.get 1
    local.set 3
    global.get 1
    i32.const 32
    i32.add
    global.set 1
    i32.const 1
    i32.const 1640
    call 0
    local.tee 4
    i32.const 40
    i32.add
    local.set 2
    loop  ;; label = @1
      local.get 1
      i32.const 2
      i32.shl
      local.get 4
      i32.add
      local.get 1
      if (result i32)  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        i32.const 2
        i32.shl
        local.get 4
        i32.add
        i32.load
        i32.const 160
        i32.add
      else
        local.get 2
      end
      i32.store
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 3
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
    i32.const 0
    i32.store offset=16
    local.get 3
    i32.const 0
    i32.store offset=20
    loop  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.const 1
      i32.store offset=24
      local.get 1
      f64.const 0x1p+0 (;=1;)
      f64.store offset=16
      local.get 0
      i32.load offset=24
      local.tee 1
      i32.const -1
      i32.store offset=120
      local.get 1
      f64.const -0x1p+0 (;=-1;)
      f64.store offset=112
      local.get 0
      local.get 4
      call 3
      i32.const 0
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 2
        i32.shl
        local.get 4
        i32.add
        i32.load
        local.set 5
        local.get 1
        i32.const 2
        i32.shl
        local.get 0
        i32.add
        i32.load
        local.set 6
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.const 4
          i32.shl
          local.get 6
          i32.add
          local.tee 7
          local.get 7
          f64.load
          local.get 2
          i32.const 4
          i32.shl
          local.get 5
          i32.add
          f64.load
          f64.sub
          f64.store
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.const 10
        i32.ne
        br_if 0 (;@2;)
      end
      f64.const 0x1.357c299a88ea7p-80 (;=1e-24;)
      f64.gt
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 1
    loop  ;; label = @1
      local.get 1
      i32.const 2
      i32.shl
      local.get 4
      i32.add
      i32.load
      local.set 5
      local.get 1
      i32.const 0
      i32.ne
      local.get 1
      i32.const 9
      i32.lt_s
      i32.add
      local.set 6
      local.get 1
      i32.const 2
      i32.shl
      local.get 0
      i32.add
      i32.load
      local.set 7
      i32.const 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        i32.const 4
        i32.shl
        local.get 7
        i32.add
        i32.load offset=8
        i32.const 1
        i32.add
        i32.const 3
        i32.shl
        local.get 3
        i32.add
        local.tee 8
        local.get 2
        i32.const 4
        i32.shl
        local.get 5
        i32.add
        f64.load
        local.get 6
        local.get 2
        i32.const 0
        i32.ne
        i32.add
        local.get 2
        i32.const 9
        i32.lt_s
        i32.add
        f64.convert_i32_s
        f64.mul
        local.get 8
        f64.load
        f64.add
        f64.store
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        i32.const 10
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 3
    f64.load offset=16
    local.get 3
    f64.load
    local.get 4
    call 1
    local.get 3
    global.set 1
    f64.sub
    f64.const 0x1p-1 (;=0.5;)
    f64.mul)
  (func (;5;) (type 4) (result i32)
    (local i32 i32)
    global.get 1
    local.set 1
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    i32.const 1
    i32.const 1640
    call 0
    local.tee 0
    local.get 0
    i32.const 40
    i32.add
    i32.store
    local.get 0
    local.get 0
    i32.const 200
    i32.add
    i32.store offset=4
    local.get 0
    local.get 0
    i32.const 360
    i32.add
    i32.store offset=8
    local.get 0
    local.get 0
    i32.const 520
    i32.add
    i32.store offset=12
    local.get 0
    local.get 0
    i32.const 680
    i32.add
    i32.store offset=16
    local.get 0
    local.get 0
    i32.const 840
    i32.add
    i32.store offset=20
    local.get 0
    local.get 0
    i32.const 1000
    i32.add
    i32.store offset=24
    local.get 0
    local.get 0
    i32.const 1160
    i32.add
    i32.store offset=28
    local.get 0
    local.get 0
    i32.const 1320
    i32.add
    i32.store offset=32
    local.get 0
    local.get 0
    i32.const 1480
    i32.add
    i32.store offset=36
    local.get 1
    f64.const 0x1p+1 (;=2;)
    local.get 0
    call 4
    f64.div
    f64.store
    global.get 0
    local.get 1
    call 2
    drop
    local.get 1
    global.set 1
    i32.const 0)
  (func (;6;) (type 5)
    global.get 0
    i32.const 16
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 6))
  (export "_main" (func 5))
  (data (;0;) (global.get 0) "R = %g\0a"))
