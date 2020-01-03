(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func))
  (import "env" "_calloc" (func (;0;) (type 0)))
  (import "env" "_free" (func (;1;) (type 1)))
  (import "env" "_malloc" (func (;2;) (type 2)))
  (import "env" "_memcpy" (func (;3;) (type 3)))
  (import "env" "_printf" (func (;4;) (type 0)))
  (import "env" "_putchar" (func (;5;) (type 2)))
  (import "env" "_puts" (func (;6;) (type 2)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;7;) (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 1
    i32.const 1
    i32.shl
    i32.const 2147483646
    i32.and
    local.tee 2
    call 2
    local.set 6
    local.get 2
    call 2
    local.set 7
    local.get 6
    i32.const 1
    i32.store
    local.get 1
    i32.const 4
    i32.lt_s
    if  ;; label = @1
      i32.const 1
      local.set 2
    else
      i32.const 1
      local.set 2
      i32.const 2
      local.set 3
      loop  ;; label = @2
        local.get 1
        local.get 1
        local.get 3
        i32.div_s
        local.tee 8
        local.get 3
        i32.mul
        i32.sub
        i32.eqz
        if  ;; label = @3
          local.get 2
          i32.const 1
          i32.add
          local.get 2
          i32.const 2
          i32.shl
          local.get 6
          i32.add
          local.get 3
          i32.store
          local.get 3
          local.get 8
          i32.ne
          if  ;; label = @4
            local.get 4
            i32.const 2
            i32.shl
            local.get 7
            i32.add
            local.get 8
            i32.store
            local.get 4
            i32.const 1
            i32.add
            local.set 4
          end
          local.set 2
        end
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        local.get 3
        i32.mul
        local.get 1
        i32.le_s
        br_if 0 (;@2;)
      end
    end
    local.get 2
    local.get 4
    i32.add
    local.tee 3
    i32.const 2
    i32.shl
    call 2
    local.set 5
    local.get 4
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      local.get 5
      local.get 7
      local.get 4
      i32.const 2
      i32.shl
      call 3
      drop
    end
    local.get 2
    i32.const 0
    i32.le_s
    if  ;; label = @1
      local.get 6
      call 1
      local.get 7
      call 1
      local.get 0
      local.get 5
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      return
    end
    local.get 2
    i32.const -1
    i32.add
    local.set 8
    i32.const 0
    local.set 1
    loop  ;; label = @1
      local.get 1
      local.get 4
      i32.add
      i32.const 2
      i32.shl
      local.get 5
      i32.add
      local.get 8
      local.get 1
      i32.sub
      i32.const 2
      i32.shl
      local.get 6
      i32.add
      i32.load
      i32.store
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      local.get 2
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 6
    call 1
    local.get 7
    call 1
    local.get 0
    local.get 5
    i32.store
    local.get 0
    local.get 3
    i32.store offset=4)
  (func (;8;) (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 1
    local.set 2
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    local.get 1
    i32.load offset=4
    local.tee 5
    i32.eqz
    if  ;; label = @1
      local.get 2
      global.set 1
      i32.const 0
      return
    end
    local.get 2
    i32.const 8
    i32.add
    local.set 3
    local.get 1
    i32.load
    local.tee 1
    i32.load
    local.set 4
    local.get 2
    local.get 1
    i32.const 4
    i32.add
    i32.store
    local.get 2
    local.get 5
    i32.const -1
    i32.add
    i32.store offset=4
    local.get 4
    local.get 0
    i32.gt_s
    if (result i32)  ;; label = @1
      local.get 3
      local.get 2
      i32.load
      i32.store
      local.get 3
      local.get 2
      i32.load offset=4
      i32.store offset=4
      local.get 0
      local.get 3
      call 8
    else
      local.get 0
      local.get 4
      i32.eq
      if (result i32)  ;; label = @2
        i32.const 1
      else
        local.get 3
        local.get 2
        i32.load
        i32.store
        local.get 3
        local.get 2
        i32.load offset=4
        i32.store offset=4
        local.get 0
        local.get 4
        i32.sub
        local.get 3
        call 8
        if (result i32)  ;; label = @3
          i32.const 1
        else
          local.get 3
          local.get 2
          i32.load
          i32.store
          local.get 3
          local.get 2
          i32.load offset=4
          i32.store offset=4
          local.get 0
          local.get 3
          call 8
        end
      end
    end
    local.get 2
    global.set 1)
  (func (;9;) (type 5) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 1
    global.get 1
    i32.const 32
    i32.add
    global.set 1
    i32.const 17000
    i32.const 1
    call 0
    local.set 4
    local.get 1
    i32.const 16
    i32.add
    local.set 5
    local.get 1
    i32.const 8
    i32.add
    local.set 3
    i32.const 2
    local.set 0
    loop  ;; label = @1
      local.get 0
      local.get 4
      i32.add
      local.tee 2
      i32.load8_s
      i32.eqz
      if  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 0
          call 7
          local.get 1
          i32.load offset=4
          local.set 6
          local.get 3
          local.get 1
          i32.load
          local.tee 9
          i32.store
          local.get 3
          local.get 6
          i32.store offset=4
          local.get 6
          if  ;; label = @4
            i32.const 0
            local.set 7
            i32.const 0
            local.set 8
            loop  ;; label = @5
              local.get 7
              i32.const 2
              i32.shl
              local.get 9
              i32.add
              i32.load
              local.get 8
              i32.add
              local.set 8
              local.get 7
              i32.const 1
              i32.add
              local.tee 7
              local.get 6
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 8
            local.get 0
            i32.gt_s
            if  ;; label = @5
              local.get 5
              local.get 3
              i32.load
              i32.store
              local.get 5
              local.get 3
              i32.load offset=4
              i32.store offset=4
              local.get 0
              local.get 5
              call 8
              i32.eqz
              br_if 2 (;@3;)
              local.get 0
              local.set 2
              loop  ;; label = @6
                local.get 2
                local.get 4
                i32.add
                i32.const 1
                i32.store8
                local.get 0
                local.get 2
                i32.add
                local.tee 2
                i32.const 17000
                i32.lt_s
                br_if 0 (;@6;)
              end
              br 2 (;@3;)
            end
          end
          local.get 2
          i32.const 1
          i32.store8
        end
      end
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      i32.const 17000
      i32.lt_s
      br_if 0 (;@1;)
    end
    local.get 9
    call 1
    local.get 1
    global.set 1
    local.get 4)
  (func (;10;) (type 5) (result i32)
    (local i32 i32 i32 i32)
    global.get 1
    local.set 1
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    call 9
    local.set 3
    global.get 0
    i32.const 4
    i32.add
    call 6
    drop
    i32.const 2
    local.set 0
    loop  ;; label = @1
      local.get 0
      local.get 3
      i32.add
      i32.load8_s
      i32.eqz
      if  ;; label = @2
        local.get 1
        local.get 0
        i32.store
        global.get 0
        local.get 1
        call 4
        drop
        local.get 2
        i32.const 1
        i32.add
        local.set 2
      end
      local.get 0
      i32.const 2
      i32.add
      local.set 0
      local.get 2
      i32.const 25
      i32.lt_s
      br_if 0 (;@1;)
    end
    i32.const 10
    call 5
    drop
    local.get 3
    call 1
    local.get 1
    global.set 1
    i32.const 0)
  (func (;11;) (type 6)
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
  (global (;3;) i32 (i32.const 4))
  (export "__post_instantiate" (func 11))
  (export "_main" (func 10))
  (export "_str" (global 3))
  (data (;0;) (global.get 0) "%d \00The first 25 weird numbers:"))
