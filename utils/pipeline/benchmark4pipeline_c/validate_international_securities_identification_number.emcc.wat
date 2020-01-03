(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (result i32)))
  (type (;2;) (func))
  (import "env" "_printf" (func (;0;) (type 0)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;1;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 4
    global.get 1
    i32.const 112
    i32.add
    global.set 1
    local.get 4
    i32.const 96
    i32.add
    local.set 7
    loop  ;; label = @1
      global.get 0
      local.get 5
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee 8
      i32.load8_s
      local.set 0
      i32.const 0
      local.set 1
      i32.const 0
      local.set 2
      local.get 7
      block (result i32)  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 0
            i32.const 24
            i32.shl
            i32.const 24
            i32.shr_s
            local.set 3
            local.get 0
            i32.const -48
            i32.add
            i32.const 24
            i32.shl
            i32.const 24
            i32.shr_s
            i32.const 255
            i32.and
            i32.const 10
            i32.lt_s
            if (result i32)  ;; label = @5
              local.get 1
              i32.const 2
              i32.lt_u
              br_if 2 (;@3;)
              i32.const 1
              local.set 6
              local.get 3
              i32.const -48
              i32.add
              local.set 3
              local.get 2
            else
              local.get 1
              i32.const 11
              i32.eq
              if (result i32)  ;; label = @6
                i32.const 1
              else
                local.get 0
                i32.const -65
                i32.add
                i32.const 24
                i32.shl
                i32.const 24
                i32.shr_s
                i32.const 255
                i32.and
                i32.const 25
                i32.gt_s
              end
              br_if 2 (;@3;)
              local.get 2
              i32.const 2
              i32.shl
              local.get 4
              i32.add
              local.get 3
              i32.const -55
              i32.add
              local.tee 3
              i32.const 10
              i32.div_s
              local.tee 0
              i32.store
              i32.const 2
              local.set 6
              local.get 3
              local.get 0
              i32.const 10
              i32.mul
              i32.sub
              local.set 3
              local.get 2
              i32.const 1
              i32.add
            end
            local.get 2
            local.get 6
            i32.add
            local.set 2
            i32.const 2
            i32.shl
            local.get 4
            i32.add
            local.get 3
            i32.store
            local.get 8
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.add
            i32.load8_s
            local.set 0
            local.get 1
            i32.const 12
            i32.lt_u
            br_if 0 (;@4;)
          end
          local.get 0
          br_if 0 (;@3;)
          local.get 2
          i32.const 1
          i32.gt_u
          if  ;; label = @4
            local.get 2
            local.set 0
            i32.const 0
            local.set 1
            loop  ;; label = @5
              local.get 0
              i32.const -2
              i32.add
              local.tee 3
              i32.const 2
              i32.shl
              local.get 4
              i32.add
              i32.load
              local.tee 6
              i32.const 1
              i32.shl
              local.tee 8
              i32.const -9
              i32.add
              local.get 8
              local.get 6
              i32.const 4
              i32.gt_s
              select
              local.get 1
              i32.add
              local.set 1
              local.get 0
              i32.const 3
              i32.gt_s
              if  ;; label = @6
                local.get 3
                local.set 0
                br 1 (;@5;)
              end
            end
          else
            i32.const 0
            local.set 1
          end
          local.get 2
          i32.const -1
          i32.add
          local.set 0
          local.get 1
          local.set 2
          loop  ;; label = @4
            local.get 0
            i32.const 2
            i32.shl
            local.get 4
            i32.add
            i32.load
            local.get 2
            i32.add
            local.set 2
            local.get 0
            i32.const -2
            i32.add
            local.set 1
            local.get 0
            i32.const 1
            i32.gt_s
            if  ;; label = @5
              local.get 1
              local.set 0
              br 1 (;@4;)
            end
          end
          local.get 2
          i32.const 10
          i32.rem_s
          br_if 0 (;@3;)
          i32.const 84
          br 1 (;@2;)
        end
        i32.const 70
      end
      i32.store
      local.get 7
      i32.const 10
      i32.const 32
      local.get 5
      i32.const 6
      i32.eq
      select
      i32.store offset=4
      global.get 0
      i32.const 124
      i32.add
      local.get 7
      call 0
      drop
      local.get 5
      i32.const 1
      i32.add
      local.tee 5
      i32.const 7
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 4
    global.set 1
    i32.const 0)
  (func (;2;) (type 2)
    global.get 0
    global.get 0
    i32.load
    global.get 0
    i32.const 32
    i32.add
    i32.add
    i32.store
    global.get 0
    global.get 0
    i32.load offset=4
    global.get 0
    i32.const 45
    i32.add
    i32.add
    i32.store offset=4
    global.get 0
    global.get 0
    i32.load offset=8
    global.get 0
    i32.const 58
    i32.add
    i32.add
    i32.store offset=8
    global.get 0
    global.get 0
    i32.load offset=12
    global.get 0
    i32.const 71
    i32.add
    i32.add
    i32.store offset=12
    global.get 0
    global.get 0
    i32.load offset=16
    global.get 0
    i32.const 85
    i32.add
    i32.add
    i32.store offset=16
    global.get 0
    global.get 0
    i32.load offset=20
    global.get 0
    i32.const 98
    i32.add
    i32.add
    i32.store offset=20
    global.get 0
    global.get 0
    i32.load offset=24
    global.get 0
    i32.const 111
    i32.add
    i32.add
    i32.store offset=24)
  (func (;3;) (type 2)
    global.get 0
    i32.const 144
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2
    call 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 3))
  (export "_main" (func 1))
  (data (;0;) (global.get 0) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00US0378331005\00US0373831005\00U50378331005\00US03378331005\00AU0000XVGZA3\00AU0000VXGZA3\00FR0000988040\00%c%c"))
