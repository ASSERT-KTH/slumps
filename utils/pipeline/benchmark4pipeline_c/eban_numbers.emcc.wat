(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (result i32)))
  (type (;3;) (func))
  (import "env" "_printf" (func (;0;) (type 0)))
  (import "env" "_putchar" (func (;1;) (type 1)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;2;) (type 2) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 2
    global.get 1
    i32.const 32
    i32.add
    global.set 1
    local.get 2
    i32.const 24
    i32.add
    local.set 11
    local.get 2
    i32.const 16
    i32.add
    local.set 12
    local.get 2
    i32.const 8
    i32.add
    local.set 7
    local.get 2
    local.set 8
    loop  ;; label = @1
      global.get 0
      local.get 3
      i32.const 12
      i32.mul
      i32.add
      i32.load
      local.set 0
      global.get 0
      local.get 3
      i32.const 12
      i32.mul
      i32.add
      i32.load offset=4
      local.set 4
      local.get 3
      i32.const 1
      i32.eq
      if  ;; label = @2
        local.get 7
        local.get 0
        i32.store
        local.get 7
        local.get 4
        i32.store offset=4
        global.get 0
        i32.const 134
        i32.add
        local.get 7
        call 0
        drop
      else
        local.get 8
        local.get 4
        i32.store
        global.get 0
        i32.const 96
        i32.add
        local.get 8
        call 0
        drop
      end
      local.get 0
      local.get 4
      i32.gt_s
      if  ;; label = @2
        i32.const 0
        local.set 2
      else
        local.get 3
        i32.const 2
        i32.lt_u
        if  ;; label = @3
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 0
            i32.const 1000000000
            i32.rem_s
            local.tee 9
            i32.const 1000000
            i32.div_s
            local.set 5
            local.get 0
            i32.const 1000000
            i32.rem_s
            local.tee 1
            i32.const 1000
            i32.div_s
            local.tee 6
            i32.const 10
            i32.rem_s
            local.get 6
            local.get 1
            i32.const -30000
            i32.add
            i32.const 37000
            i32.lt_u
            select
            local.set 10
            local.get 1
            local.get 6
            i32.const 1000
            i32.mul
            i32.sub
            local.tee 1
            i32.const 10
            i32.rem_s
            local.get 1
            local.get 1
            i32.const -30
            i32.add
            i32.const 37
            i32.lt_u
            select
            local.set 1
            local.get 0
            i32.const 999999999
            i32.add
            i32.const 1999999999
            i32.lt_u
            local.get 0
            i32.const 1999999999
            i32.gt_s
            i32.or
            if  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.const 10
                  i32.rem_s
                  local.get 5
                  local.get 9
                  i32.const -30000000
                  i32.add
                  i32.const 37000000
                  i32.lt_u
                  select
                  br_table 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 10
                  br_table 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 1
                  br_table 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;)
                end
                local.get 12
                local.get 0
                i32.store
                global.get 0
                i32.const 178
                i32.add
                local.get 12
                call 0
                drop
                local.get 2
                i32.const 1
                i32.add
                local.set 2
              end
            end
            local.get 0
            i32.const 2
            i32.add
            local.tee 0
            local.get 4
            i32.le_s
            br_if 0 (;@4;)
          end
        else
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 0
            i32.const 1000000000
            i32.rem_s
            local.tee 9
            i32.const 1000000
            i32.div_s
            local.set 5
            local.get 0
            i32.const 1000000
            i32.rem_s
            local.tee 1
            i32.const 1000
            i32.div_s
            local.tee 6
            i32.const 10
            i32.rem_s
            local.get 6
            local.get 1
            i32.const -30000
            i32.add
            i32.const 37000
            i32.lt_u
            select
            local.set 10
            local.get 1
            local.get 6
            i32.const 1000
            i32.mul
            i32.sub
            local.tee 1
            i32.const 10
            i32.rem_s
            local.get 1
            local.get 1
            i32.const -30
            i32.add
            i32.const 37
            i32.lt_u
            select
            local.set 1
            local.get 0
            i32.const 999999999
            i32.add
            i32.const 1999999999
            i32.lt_u
            local.get 0
            i32.const 1999999999
            i32.gt_s
            i32.or
            if  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.const 10
                  i32.rem_s
                  local.get 5
                  local.get 9
                  i32.const -30000000
                  i32.add
                  i32.const 37000000
                  i32.lt_u
                  select
                  br_table 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 10
                  br_table 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 1
                  br_table 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;)
                end
                local.get 2
                i32.const 1
                i32.add
                local.set 2
              end
            end
            local.get 0
            i32.const 2
            i32.add
            local.tee 0
            local.get 4
            i32.le_s
            br_if 0 (;@4;)
          end
        end
      end
      local.get 3
      i32.const 2
      i32.lt_u
      if  ;; label = @2
        i32.const 10
        call 1
        drop
      end
      local.get 11
      local.get 2
      i32.store
      global.get 0
      i32.const 182
      i32.add
      local.get 11
      call 0
      drop
      local.get 3
      i32.const 1
      i32.add
      local.tee 3
      i32.const 8
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 8
    global.set 1
    i32.const 0)
  (func (;3;) (type 3)
    global.get 0
    i32.const 208
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 3))
  (export "_main" (func 2))
  (data (;0;) (global.get 0) "\02\00\00\00\e8\03\00\00\01\00\00\00\e8\03\00\00\a0\0f\00\00\01\00\00\00\02\00\00\00\10'\00\00\00\00\00\00\02\00\00\00\a0\86\01\00\00\00\00\00\02\00\00\00@B\0f\00\00\00\00\00\02\00\00\00\80\96\98\00\00\00\00\00\02\00\00\00\00\e1\f5\05\00\00\00\00\02\00\00\00\00\ca\9a;\00\00\00\00eban numbers up to and including %d:\0a\00eban numbers between %d and %d (inclusive:)\00%d \00count = %d\0a\0a"))
