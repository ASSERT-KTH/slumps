(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func))
  (import "env" "_free" (func (;0;) (type 0)))
  (import "env" "_malloc" (func (;1;) (type 1)))
  (import "env" "_printf" (func (;2;) (type 2)))
  (import "env" "_puts" (func (;3;) (type 1)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;4;) (type 3)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 5
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    i32.const 4
    local.set 4
    loop  ;; label = @1
      i32.const 2
      local.set 0
      i32.const 0
      local.set 2
      local.get 4
      local.set 1
      loop  ;; label = @2
        loop  ;; label = @3
          local.get 1
          local.get 1
          local.get 0
          i32.div_u
          local.tee 3
          local.get 0
          i32.mul
          i32.sub
          if  ;; label = @4
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            br 1 (;@3;)
          end
        end
        local.get 2
        i32.const 1
        i32.add
        local.set 6
        local.get 3
        i32.const 1
        i32.ne
        if  ;; label = @3
          local.get 6
          local.set 2
          local.get 3
          local.set 1
          br 1 (;@2;)
        end
      end
      local.get 6
      i32.const 2
      i32.shl
      call 1
      local.set 7
      local.get 2
      if  ;; label = @2
        i32.const 2
        local.set 0
        i32.const 0
        local.set 2
        local.get 4
        local.set 1
        loop  ;; label = @3
          loop  ;; label = @4
            local.get 1
            local.get 1
            local.get 0
            i32.div_u
            local.tee 3
            local.get 0
            i32.mul
            i32.sub
            if  ;; label = @5
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              br 1 (;@4;)
            end
          end
          local.get 2
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.const 2
          i32.shl
          local.get 7
          i32.add
          local.get 0
          i32.store
          local.get 3
          i32.const 1
          i32.ne
          if  ;; label = @4
            local.get 1
            local.set 2
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
        end
        i32.const 0
        local.set 1
        local.get 4
        local.set 0
        loop  ;; label = @3
          local.get 0
          local.get 0
          i32.const 10
          i32.div_u
          local.tee 2
          i32.const 10
          i32.mul
          i32.sub
          local.get 1
          i32.add
          local.set 3
          local.get 0
          i32.const 10
          i32.ge_u
          if  ;; label = @4
            local.get 3
            local.set 1
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
        end
        i32.const 0
        local.set 2
        i32.const 0
        local.set 8
        loop  ;; label = @3
          local.get 2
          i32.const 2
          i32.shl
          local.get 7
          i32.add
          i32.load
          local.tee 0
          if  ;; label = @4
            i32.const 0
            local.set 1
            loop  ;; label = @5
              local.get 0
              local.get 0
              i32.const 10
              i32.div_u
              local.tee 9
              i32.const 10
              i32.mul
              i32.sub
              local.get 1
              i32.add
              local.set 1
              local.get 0
              i32.const 10
              i32.ge_u
              if  ;; label = @6
                local.get 9
                local.set 0
                br 1 (;@5;)
              end
            end
          else
            i32.const 0
            local.set 1
          end
          local.get 1
          local.get 8
          i32.add
          local.set 8
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          local.get 6
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 8
        i32.eq
        if  ;; label = @3
          local.get 5
          local.get 4
          i32.store
          global.get 0
          local.get 5
          call 2
          drop
        end
        local.get 7
        call 0
      end
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      i32.const 10000
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 5
    global.set 1)
  (func (;5;) (type 2) (param i32 i32) (result i32)
    global.get 0
    i32.const 5
    i32.add
    call 3
    drop
    call 4
    i32.const 0)
  (func (;6;) (type 3)
    global.get 0
    i32.const 48
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) i32 (i32.const 5))
  (export "__post_instantiate" (func 6))
  (export "_main" (func 5))
  (export "_str" (global 3))
  (data (;0;) (global.get 0) "%4u \00All the Smith Numbers < 10000 are:"))
