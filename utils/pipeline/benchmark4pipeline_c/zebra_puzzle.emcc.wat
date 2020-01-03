(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func))
  (import "env" "_printf" (func (;0;) (type 0)))
  (import "env" "_puts" (func (;1;) (type 1)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;2;) (type 2) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 1
    global.get 1
    i32.const 112
    i32.add
    global.set 1
    local.get 1
    i32.const 96
    i32.add
    local.set 4
    local.get 1
    i32.const 88
    i32.add
    local.set 5
    local.get 1
    i32.const 80
    i32.add
    local.set 6
    local.get 1
    i32.const 72
    i32.add
    local.set 7
    local.get 1
    i32.const -64
    i32.sub
    local.set 8
    local.get 1
    i32.const 56
    i32.add
    local.set 9
    local.get 1
    i32.const 48
    i32.add
    local.set 10
    local.get 1
    i32.const 40
    i32.add
    local.set 11
    local.get 1
    i32.const 32
    i32.add
    local.set 12
    local.get 1
    i32.const 24
    i32.add
    local.set 13
    local.get 1
    global.get 0
    i32.const 481
    i32.add
    i32.store
    local.get 1
    global.get 0
    i32.const 487
    i32.add
    i32.store offset=4
    local.get 1
    global.get 0
    i32.const 493
    i32.add
    i32.store offset=8
    local.get 1
    global.get 0
    i32.const 497
    i32.add
    i32.store offset=12
    local.get 1
    global.get 0
    i32.const 503
    i32.add
    i32.store offset=16
    local.get 1
    global.get 0
    i32.const 510
    i32.add
    i32.store offset=20
    global.get 0
    i32.const 431
    i32.add
    local.get 1
    call 0
    drop
    loop  ;; label = @1
      local.get 13
      local.get 3
      i32.store
      global.get 0
      i32.const 516
      i32.add
      local.get 13
      call 0
      drop
      local.get 3
      i32.const 20
      i32.mul
      local.get 0
      i32.add
      i32.load
      local.tee 2
      i32.const -1
      i32.gt_s
      if  ;; label = @2
        local.get 12
        global.get 0
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 522
        i32.add
        local.get 12
        call 0
        drop
      else
        local.get 11
        global.get 0
        i32.const 541
        i32.add
        i32.store
        global.get 0
        i32.const 522
        i32.add
        local.get 11
        call 0
        drop
      end
      local.get 3
      i32.const 20
      i32.mul
      local.get 0
      i32.add
      i32.load offset=4
      local.tee 2
      i32.const -1
      i32.gt_s
      if  ;; label = @2
        local.get 10
        global.get 0
        i32.const 32
        i32.add
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 522
        i32.add
        local.get 10
        call 0
        drop
      else
        local.get 9
        global.get 0
        i32.const 541
        i32.add
        i32.store
        global.get 0
        i32.const 522
        i32.add
        local.get 9
        call 0
        drop
      end
      local.get 3
      i32.const 20
      i32.mul
      local.get 0
      i32.add
      i32.load offset=8
      local.tee 2
      i32.const -1
      i32.gt_s
      if  ;; label = @2
        local.get 8
        global.get 0
        i32.const -64
        i32.sub
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 522
        i32.add
        local.get 8
        call 0
        drop
      else
        local.get 7
        global.get 0
        i32.const 541
        i32.add
        i32.store
        global.get 0
        i32.const 522
        i32.add
        local.get 7
        call 0
        drop
      end
      local.get 3
      i32.const 20
      i32.mul
      local.get 0
      i32.add
      i32.load offset=12
      local.tee 2
      i32.const -1
      i32.gt_s
      if  ;; label = @2
        local.get 6
        global.get 0
        i32.const 96
        i32.add
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 522
        i32.add
        local.get 6
        call 0
        drop
      else
        local.get 5
        global.get 0
        i32.const 541
        i32.add
        i32.store
        global.get 0
        i32.const 522
        i32.add
        local.get 5
        call 0
        drop
      end
      local.get 3
      i32.const 20
      i32.mul
      local.get 0
      i32.add
      i32.load offset=16
      local.tee 2
      i32.const -1
      i32.gt_s
      if  ;; label = @2
        local.get 4
        global.get 0
        i32.const 128
        i32.add
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 531
        i32.add
        local.get 4
        call 0
        drop
      else
        global.get 0
        i32.const 541
        i32.add
        call 1
        drop
      end
      local.get 3
      i32.const 1
      i32.add
      local.tee 3
      i32.const 5
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 1
    global.set 1)
  (func (;3;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=48
    local.tee 1
    i32.const 0
    i32.lt_s
    local.get 1
    i32.const 2
    i32.eq
    i32.or
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    i32.load offset=4
    local.tee 4
    i32.const 4
    i32.eq
    local.get 4
    i32.const 0
    i32.lt_s
    i32.or
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.const 20
        i32.mul
        local.get 0
        i32.add
        i32.load
        local.tee 1
        i32.const -1
        i32.gt_s
        local.set 13
        i32.const 1
        local.get 1
        i32.shl
        i32.const 0
        local.get 13
        select
        local.tee 3
        local.get 9
        i32.add
        local.set 9
        local.get 3
        local.get 16
        i32.or
        local.set 16
        i32.const 1
        local.get 4
        i32.shl
        i32.const 0
        local.get 4
        i32.const -1
        i32.gt_s
        local.tee 23
        select
        local.tee 3
        local.get 11
        i32.add
        local.set 11
        local.get 3
        local.get 18
        i32.or
        local.set 18
        local.get 2
        i32.const 20
        i32.mul
        local.get 0
        i32.add
        i32.load offset=8
        local.tee 6
        i32.const -1
        i32.gt_s
        local.set 14
        i32.const 1
        local.get 6
        i32.shl
        i32.const 0
        local.get 14
        select
        local.tee 3
        local.get 10
        i32.add
        local.set 10
        local.get 3
        local.get 17
        i32.or
        local.set 17
        local.get 2
        i32.const 20
        i32.mul
        local.get 0
        i32.add
        i32.load offset=12
        local.tee 7
        i32.const -1
        i32.gt_s
        local.set 20
        local.get 8
        i32.const 1
        local.get 7
        i32.shl
        i32.const 0
        local.get 20
        select
        local.tee 3
        i32.add
        local.set 8
        local.get 3
        local.get 15
        i32.or
        local.set 15
        local.get 2
        i32.const 20
        i32.mul
        local.get 0
        i32.add
        i32.load offset=16
        local.tee 3
        i32.const -1
        i32.gt_s
        local.set 21
        i32.const 1
        local.get 3
        i32.shl
        i32.const 0
        local.get 21
        select
        local.tee 5
        local.get 12
        i32.add
        local.set 12
        local.get 5
        local.get 19
        i32.or
        local.set 19
        local.get 23
        if  ;; label = @3
          local.get 13
          if  ;; label = @4
            local.get 1
            i32.eqz
            local.tee 5
            local.get 4
            i32.const 0
            i32.ne
            i32.or
            i32.eqz
            br_if 3 (;@1;)
            local.get 4
            i32.eqz
            local.get 5
            i32.const 1
            i32.xor
            i32.or
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 20
          if  ;; label = @4
            local.get 7
            i32.eqz
            local.tee 5
            local.get 4
            i32.const 1
            i32.ne
            i32.or
            i32.eqz
            br_if 3 (;@1;)
            local.get 5
            i32.const 1
            i32.xor
            local.get 4
            i32.const 1
            i32.eq
            i32.or
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 14
          if  ;; label = @4
            local.get 6
            i32.eqz
            local.tee 5
            local.get 4
            i32.const 2
            i32.ne
            i32.or
            i32.eqz
            br_if 3 (;@1;)
            local.get 5
            i32.const 1
            i32.xor
            local.get 4
            i32.const 2
            i32.eq
            i32.or
            i32.eqz
            br_if 3 (;@1;)
          end
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 0
            i32.ne
            local.tee 5
            if  ;; label = @5
              local.get 13
              if  ;; label = @6
                local.get 1
                i32.const 2
                i32.eq
                local.tee 24
                local.get 2
                i32.const -1
                i32.add
                i32.const 20
                i32.mul
                local.get 0
                i32.add
                i32.load
                local.tee 22
                i32.const 1
                i32.ne
                i32.or
                i32.eqz
                br_if 5 (;@1;)
                local.get 24
                i32.const 1
                i32.xor
                local.get 22
                i32.const 1
                i32.eq
                i32.or
                i32.eqz
                br_if 5 (;@1;)
                local.get 14
                br_if 2 (;@4;)
              end
            else
              local.get 1
              local.get 6
              i32.or
              i32.const 0
              i32.ge_s
              br_if 1 (;@4;)
            end
            br 1 (;@3;)
          end
          local.get 6
          i32.const 1
          i32.eq
          local.tee 22
          local.get 1
          i32.const 1
          i32.ne
          i32.or
          i32.eqz
          br_if 2 (;@1;)
          local.get 22
          i32.const 1
          i32.xor
          local.get 1
          i32.const 1
          i32.eq
          i32.or
          i32.eqz
          br_if 2 (;@1;)
        end
        local.get 21
        if  ;; label = @3
          local.get 20
          if  ;; label = @4
            local.get 7
            i32.const 1
            i32.eq
            local.tee 7
            local.get 3
            i32.const 0
            i32.ne
            i32.or
            i32.eqz
            br_if 3 (;@1;)
            local.get 3
            i32.eqz
            local.get 7
            i32.const 1
            i32.xor
            i32.or
            i32.eqz
            br_if 3 (;@1;)
          end
          block (result i32)  ;; label = @4
            block  ;; label = @5
              local.get 13
              if  ;; label = @6
                local.get 1
                i32.const 3
                i32.eq
                local.tee 1
                local.get 3
                i32.const 1
                i32.ne
                i32.or
                i32.eqz
                br_if 5 (;@1;)
                local.get 3
                i32.const 1
                i32.eq
                br_if 1 (;@5;)
                local.get 1
                br_if 5 (;@1;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 1
                  i32.sub
                  br_table 2 (;@5;) 1 (;@6;) 0 (;@7;)
                end
                i32.const 0
                br 2 (;@4;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    i32.const 2147483647
                    i32.and
                    br_table 0 (;@8;) 2 (;@6;) 2 (;@6;) 2 (;@6;) 1 (;@7;) 2 (;@6;)
                  end
                  local.get 2
                  i32.const 1
                  i32.add
                  i32.const 20
                  i32.mul
                  local.get 0
                  i32.add
                  i32.load offset=12
                  local.tee 1
                  i32.const 0
                  i32.lt_s
                  local.get 1
                  i32.const 2
                  i32.eq
                  i32.or
                  i32.eqz
                  br_if 6 (;@1;)
                  br 1 (;@6;)
                end
                local.get 2
                i32.const -1
                i32.add
                i32.const 20
                i32.mul
                local.get 0
                i32.add
                i32.load offset=12
                i32.const 2
                i32.ne
                br_if 5 (;@1;)
              end
              local.get 2
              i32.const 1
              i32.add
              i32.const 20
              i32.mul
              local.get 0
              i32.add
              i32.load offset=12
              local.tee 1
              i32.const 0
              i32.lt_s
              local.get 1
              i32.const 2
              i32.eq
              i32.or
              if (result i32)  ;; label = @6
                i32.const 1
              else
                local.get 2
                i32.const -1
                i32.add
                i32.const 20
                i32.mul
                local.get 0
                i32.add
                i32.load offset=12
                i32.const 2
                i32.eq
                if (result i32)  ;; label = @7
                  i32.const 1
                else
                  br 6 (;@1;)
                end
              end
              br 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  i32.const 2147483647
                  i32.and
                  br_table 0 (;@7;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 1 (;@6;) 2 (;@5;)
                end
                local.get 2
                i32.const 1
                i32.add
                i32.const 20
                i32.mul
                local.get 0
                i32.add
                i32.load offset=12
                local.tee 1
                i32.const 0
                i32.lt_s
                local.get 1
                i32.const 3
                i32.eq
                i32.or
                i32.eqz
                br_if 5 (;@1;)
                br 1 (;@5;)
              end
              local.get 2
              i32.const -1
              i32.add
              i32.const 20
              i32.mul
              local.get 0
              i32.add
              i32.load offset=12
              i32.const 3
              i32.ne
              br_if 4 (;@1;)
            end
            local.get 2
            i32.const 1
            i32.add
            i32.const 20
            i32.mul
            local.get 0
            i32.add
            i32.load offset=12
            local.tee 1
            i32.const 0
            i32.lt_s
            local.get 1
            i32.const 3
            i32.eq
            i32.or
            if (result i32)  ;; label = @5
              i32.const 0
            else
              local.get 2
              i32.const -1
              i32.add
              i32.const 20
              i32.mul
              local.get 0
              i32.add
              i32.load offset=12
              i32.const 3
              i32.eq
              if (result i32)  ;; label = @6
                i32.const 0
              else
                br 5 (;@1;)
              end
            end
          end
          local.set 1
          local.get 14
          if  ;; label = @4
            local.get 6
            i32.const 3
            i32.eq
            local.tee 6
            local.get 3
            i32.const 3
            i32.ne
            i32.or
            i32.eqz
            br_if 3 (;@1;)
            local.get 6
            i32.const 1
            i32.xor
            local.get 3
            i32.const 3
            i32.eq
            i32.or
            i32.eqz
            br_if 3 (;@1;)
          end
        else
          i32.const 0
          local.set 1
        end
        local.get 23
        if  ;; label = @3
          block  ;; label = @4
            local.get 21
            if  ;; label = @5
              local.get 3
              i32.const 4
              i32.eq
              local.tee 3
              local.get 4
              i32.const 3
              i32.ne
              i32.or
              i32.eqz
              br_if 4 (;@1;)
              local.get 4
              i32.const 3
              i32.eq
              br_if 1 (;@4;)
              local.get 3
              br_if 4 (;@1;)
            end
            local.get 4
            i32.const 4
            i32.eq
            if  ;; label = @5
              local.get 2
              i32.const 4
              i32.lt_u
              if  ;; label = @6
                local.get 2
                i32.const 1
                i32.add
                i32.const 20
                i32.mul
                local.get 0
                i32.add
                i32.load
                local.tee 4
                i32.const 0
                i32.lt_s
                local.get 4
                i32.const 4
                i32.eq
                i32.or
                i32.eqz
                br_if 5 (;@1;)
              end
              local.get 5
              if  ;; label = @6
                local.get 2
                i32.const -1
                i32.add
                i32.const 20
                i32.mul
                local.get 0
                i32.add
                i32.load
                i32.const 4
                i32.ne
                br_if 5 (;@1;)
              end
            end
          end
        end
        local.get 1
        if  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.const 2147483647
                i32.and
                br_table 0 (;@6;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 1 (;@5;) 2 (;@4;)
              end
              local.get 2
              i32.const 1
              i32.add
              i32.const 20
              i32.mul
              local.get 0
              i32.add
              i32.load offset=8
              local.tee 1
              i32.const 0
              i32.lt_s
              local.get 1
              i32.const 4
              i32.eq
              i32.or
              i32.eqz
              br_if 4 (;@1;)
              br 1 (;@4;)
            end
            local.get 2
            i32.const -1
            i32.add
            i32.const 20
            i32.mul
            local.get 0
            i32.add
            i32.load offset=8
            i32.const 4
            i32.ne
            br_if 3 (;@1;)
          end
          local.get 2
          i32.const 1
          i32.add
          local.tee 1
          i32.const 20
          i32.mul
          local.get 0
          i32.add
          i32.load offset=8
          local.tee 4
          i32.const 0
          i32.lt_s
          local.get 4
          i32.const 4
          i32.eq
          i32.or
          i32.eqz
          if  ;; label = @4
            local.get 2
            i32.const -1
            i32.add
            i32.const 20
            i32.mul
            local.get 0
            i32.add
            i32.load offset=8
            i32.const 4
            i32.ne
            br_if 3 (;@1;)
          end
        else
          local.get 2
          i32.const 1
          i32.add
          local.set 1
        end
        local.get 1
        i32.const 5
        i32.lt_u
        if  ;; label = @3
          local.get 1
          i32.const 20
          i32.mul
          local.get 0
          i32.add
          i32.load offset=4
          local.set 4
          local.get 1
          local.set 2
          br 1 (;@2;)
        end
      end
      local.get 9
      local.get 16
      i32.eq
      local.get 11
      local.get 18
      i32.eq
      i32.and
      local.get 10
      local.get 17
      i32.eq
      i32.and
      local.get 8
      local.get 15
      i32.eq
      i32.and
      local.get 12
      local.get 19
      i32.eq
      i32.and
      i32.eqz
      if  ;; label = @2
        i32.const 0
        return
      end
      i32.const 1
      i32.const 2
      local.get 9
      i32.const 31
      i32.ne
      local.get 11
      i32.const 31
      i32.ne
      i32.or
      local.get 10
      i32.const 31
      i32.ne
      i32.or
      local.get 8
      i32.const 31
      i32.ne
      i32.or
      local.get 12
      i32.const 31
      i32.ne
      i32.or
      select
      return
    end
    i32.const 0)
  (func (;4;) (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 1
    local.set 6
    global.get 1
    i32.const 112
    i32.add
    global.set 1
    local.get 0
    call 3
    local.tee 3
    i32.const 2
    i32.or
    i32.const 2
    i32.eq
    if  ;; label = @1
      local.get 6
      global.set 1
      local.get 3
      return
    end
    local.get 0
    local.set 3
    local.get 6
    local.tee 5
    local.tee 4
    i32.const 100
    i32.add
    local.set 7
    loop  ;; label = @1
      local.get 4
      local.get 3
      i32.load
      i32.store
      local.get 3
      i32.const 4
      i32.add
      local.set 3
      local.get 4
      i32.const 4
      i32.add
      local.tee 4
      local.get 7
      i32.lt_s
      br_if 0 (;@1;)
    end
    local.get 1
    local.get 2
    i32.const 4
    i32.lt_s
    local.tee 3
    i32.const 1
    i32.xor
    i32.add
    local.set 4
    local.get 2
    i32.const 1
    i32.add
    i32.const 0
    local.get 3
    select
    local.set 3
    local.get 1
    i32.const 20
    i32.mul
    local.get 5
    i32.add
    local.get 2
    i32.const 2
    i32.shl
    i32.add
    local.tee 2
    i32.const 0
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        call 3
        if  ;; label = @3
          local.get 5
          local.get 4
          local.get 3
          call 4
          local.tee 1
          br_if 1 (;@2;)
        end
        local.get 2
        i32.const 1
        i32.store
        local.get 5
        call 3
        if  ;; label = @3
          local.get 5
          local.get 4
          local.get 3
          call 4
          local.tee 1
          br_if 1 (;@2;)
        end
        local.get 2
        i32.const 2
        i32.store
        local.get 5
        call 3
        if  ;; label = @3
          local.get 5
          local.get 4
          local.get 3
          call 4
          local.tee 1
          br_if 1 (;@2;)
        end
        local.get 2
        i32.const 3
        i32.store
        local.get 5
        call 3
        if  ;; label = @3
          local.get 5
          local.get 4
          local.get 3
          call 4
          local.tee 1
          br_if 1 (;@2;)
        end
        local.get 2
        i32.const 4
        i32.store
        local.get 5
        call 3
        if (result i32)  ;; label = @3
          local.get 5
          local.get 4
          local.get 3
          call 4
          local.tee 1
          if (result i32)  ;; label = @4
            br 2 (;@2;)
          else
            i32.const 0
          end
        else
          i32.const 0
        end
        local.set 1
        br 1 (;@1;)
      end
      local.get 5
      local.set 3
      local.get 0
      local.tee 4
      i32.const 100
      i32.add
      local.set 0
      loop  ;; label = @2
        local.get 4
        local.get 3
        i32.load
        i32.store
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        local.get 4
        i32.const 4
        i32.add
        local.tee 4
        local.get 0
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 6
    global.set 1
    local.get 1)
  (func (;5;) (type 4) (result i32)
    (local i32 i32 i32 i32)
    global.get 1
    local.set 0
    global.get 1
    i32.const 112
    i32.add
    global.set 1
    global.get 0
    i32.const 160
    i32.add
    local.set 1
    local.get 0
    local.tee 2
    i32.const 100
    i32.add
    local.set 3
    loop  ;; label = @1
      local.get 2
      local.get 1
      i32.load
      i32.store
      local.get 1
      i32.const 4
      i32.add
      local.set 1
      local.get 2
      i32.const 4
      i32.add
      local.tee 2
      local.get 3
      i32.lt_s
      br_if 0 (;@1;)
    end
    local.get 0
    i32.const 0
    i32.const 0
    call 4
    drop
    local.get 0
    call 2
    local.get 0
    global.set 1
    i32.const 0)
  (func (;6;) (type 5)
    global.get 0
    global.get 0
    i32.load
    global.get 0
    i32.const 272
    i32.add
    i32.add
    i32.store
    global.get 0
    global.get 0
    i32.load offset=4
    global.get 0
    i32.const 276
    i32.add
    i32.add
    i32.store offset=4
    global.get 0
    global.get 0
    i32.load offset=8
    global.get 0
    i32.const 282
    i32.add
    i32.add
    i32.store offset=8
    global.get 0
    global.get 0
    i32.load offset=12
    global.get 0
    i32.const 288
    i32.add
    i32.add
    i32.store offset=12
    global.get 0
    global.get 0
    i32.load offset=16
    global.get 0
    i32.const 295
    i32.add
    i32.add
    i32.store offset=16
    global.get 0
    global.get 0
    i32.load offset=32
    global.get 0
    i32.const 300
    i32.add
    i32.add
    i32.store offset=32
    global.get 0
    global.get 0
    i32.load offset=36
    global.get 0
    i32.const 308
    i32.add
    i32.add
    i32.store offset=36
    global.get 0
    global.get 0
    i32.load offset=40
    global.get 0
    i32.const 314
    i32.add
    i32.add
    i32.store offset=40
    global.get 0
    global.get 0
    i32.load offset=44
    global.get 0
    i32.const 319
    i32.add
    i32.add
    i32.store offset=44
    global.get 0
    global.get 0
    i32.load offset=48
    global.get 0
    i32.const 326
    i32.add
    i32.add
    i32.store offset=48
    global.get 0
    i32.const -64
    i32.sub
    global.get 0
    i32.const -64
    i32.sub
    i32.load
    global.get 0
    i32.const 336
    i32.add
    i32.add
    i32.store
    global.get 0
    global.get 0
    i32.load offset=68
    global.get 0
    i32.const 340
    i32.add
    i32.add
    i32.store offset=68
    global.get 0
    global.get 0
    i32.load offset=72
    global.get 0
    i32.const 347
    i32.add
    i32.add
    i32.store offset=72
    global.get 0
    global.get 0
    i32.load offset=76
    global.get 0
    i32.const 352
    i32.add
    i32.add
    i32.store offset=76
    global.get 0
    global.get 0
    i32.load offset=80
    global.get 0
    i32.const 357
    i32.add
    i32.add
    i32.store offset=80
    global.get 0
    global.get 0
    i32.load offset=96
    global.get 0
    i32.const 363
    i32.add
    i32.add
    i32.store offset=96
    global.get 0
    global.get 0
    i32.load offset=100
    global.get 0
    i32.const 367
    i32.add
    i32.add
    i32.store offset=100
    global.get 0
    global.get 0
    i32.load offset=104
    global.get 0
    i32.const 373
    i32.add
    i32.add
    i32.store offset=104
    global.get 0
    global.get 0
    i32.load offset=108
    global.get 0
    i32.const 378
    i32.add
    i32.add
    i32.store offset=108
    global.get 0
    global.get 0
    i32.load offset=112
    global.get 0
    i32.const 384
    i32.add
    i32.add
    i32.store offset=112
    global.get 0
    global.get 0
    i32.load offset=128
    global.get 0
    i32.const 390
    i32.add
    i32.add
    i32.store offset=128
    global.get 0
    global.get 0
    i32.load offset=132
    global.get 0
    i32.const 399
    i32.add
    i32.add
    i32.store offset=132
    global.get 0
    global.get 0
    i32.load offset=136
    global.get 0
    i32.const 407
    i32.add
    i32.add
    i32.store offset=136
    global.get 0
    global.get 0
    i32.load offset=140
    global.get 0
    i32.const 413
    i32.add
    i32.add
    i32.store offset=140
    global.get 0
    global.get 0
    i32.load offset=144
    global.get 0
    i32.const 424
    i32.add
    i32.add
    i32.store offset=144)
  (func (;7;) (type 5)
    global.get 0
    i32.const 544
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2
    call 6)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) i32 (i32.const 541))
  (export "__post_instantiate" (func 7))
  (export "_main" (func 5))
  (export "_str" (global 3))
  (data (;0;) (global.get 0) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00Red\00Green\00White\00Yellow\00Blue\00English\00Swede\00Dane\00German\00Norwegian\00Tea\00Coffee\00Milk\00Beer\00Water\00Dog\00Birds\00Cats\00Horse\00Zebra\00PallMall\00Dunhill\00Blend\00BlueMaster\00Prince\00%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s%-10.10s\0a\00House\00Color\00Man\00Drink\00Animal\00Smoke\00%-10d\00%-10.10s\00%-10.10s\0a\00-"))
