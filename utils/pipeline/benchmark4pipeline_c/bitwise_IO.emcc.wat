(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func))
  (import "env" "_fclose" (func (;0;) (type 0)))
  (import "env" "_fgetc" (func (;1;) (type 0)))
  (import "env" "_fopen" (func (;2;) (type 1)))
  (import "env" "_fputc" (func (;3;) (type 1)))
  (import "env" "_free" (func (;4;) (type 2)))
  (import "env" "_malloc" (func (;5;) (type 0)))
  (import "env" "_printf" (func (;6;) (type 1)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;7;) (type 3) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 8
    global.get 1
    i32.const 32
    i32.add
    global.set 1
    local.get 8
    i32.const 4
    i32.add
    local.set 10
    global.get 0
    local.set 1
    local.get 8
    i32.const 16
    i32.add
    local.tee 12
    local.tee 0
    i32.const 12
    i32.add
    local.set 5
    loop  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_s
      i32.store8
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 5
      i32.lt_s
      br_if 0 (;@1;)
    end
    local.get 10
    local.tee 0
    i32.const 11
    i32.add
    local.set 1
    loop  ;; label = @1
      local.get 0
      i32.const 0
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 1
      i32.lt_s
      br_if 0 (;@1;)
    end
    global.get 0
    i32.const 12
    i32.add
    global.get 0
    i32.const 21
    i32.add
    call 2
    local.set 11
    i32.const 12
    call 5
    local.tee 6
    i32.const 0
    i32.store offset=4
    local.get 6
    i32.const 0
    i32.store offset=8
    local.get 6
    local.get 11
    i32.store
    i32.const 0
    local.set 0
    i32.const 0
    local.set 1
    loop  ;; label = @1
      local.get 9
      local.get 12
      i32.add
      local.set 7
      i32.const 7
      local.set 5
      i32.const 1
      local.set 4
      loop  ;; label = @2
        local.get 0
        i32.const 7
        i32.gt_s
        if  ;; label = @3
          local.get 0
          i32.const 8
          i32.add
          local.get 0
          i32.const -1
          i32.xor
          local.tee 3
          i32.const -16
          local.get 3
          i32.const -16
          i32.gt_s
          select
          i32.add
          local.set 13
          local.get 0
          local.set 3
          loop  ;; label = @4
            local.get 1
            local.get 3
            i32.const -8
            i32.add
            local.tee 2
            i32.shr_u
            local.get 11
            call 3
            drop
            local.get 1
            i32.const 1
            local.get 2
            i32.shl
            i32.const -1
            i32.add
            i32.and
            local.set 1
            local.get 3
            i32.const 15
            i32.gt_s
            if  ;; label = @5
              local.get 2
              local.set 3
              br 1 (;@4;)
            end
          end
          local.get 0
          i32.const -8
          i32.add
          local.get 13
          i32.const -8
          i32.and
          i32.sub
          local.set 0
        end
        local.get 5
        i32.const 0
        i32.ne
        local.get 0
        i32.const 8
        i32.lt_s
        i32.and
        if  ;; label = @3
          loop (result i32)  ;; label = @4
            local.get 1
            i32.const 1
            i32.shl
            local.get 7
            i32.load8_u
            i32.const 128
            local.get 4
            i32.shr_u
            i32.and
            i32.const 7
            local.get 4
            i32.sub
            i32.shr_u
            i32.or
            local.set 1
            local.get 0
            i32.const 1
            i32.add
            local.set 3
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.const 8
            i32.eq
            local.set 2
            i32.const 0
            local.get 4
            local.get 2
            select
            local.set 4
            local.get 7
            i32.const 1
            i32.add
            local.get 7
            local.get 2
            select
            local.set 7
            local.get 5
            i32.const -1
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.get 0
            i32.const 7
            i32.lt_s
            i32.and
            if (result i32)  ;; label = @5
              local.get 3
              local.set 0
              br 1 (;@4;)
            else
              local.get 3
            end
          end
          local.set 0
        end
        local.get 0
        i32.const 7
        i32.gt_s
        local.get 5
        i32.or
        br_if 0 (;@2;)
      end
      local.get 6
      local.get 1
      i32.store offset=4
      local.get 6
      local.get 0
      i32.store offset=8
      local.get 9
      i32.const 1
      i32.add
      local.tee 9
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 0
    if  ;; label = @1
      local.get 6
      local.get 1
      i32.const 8
      local.get 0
      i32.sub
      i32.shl
      local.tee 0
      i32.store offset=4
      local.get 0
      local.get 6
      i32.load
      call 3
      drop
    end
    local.get 6
    call 4
    local.get 11
    call 0
    drop
    global.get 0
    i32.const 12
    i32.add
    global.get 0
    i32.const 24
    i32.add
    call 2
    local.set 6
    i32.const 12
    call 5
    local.tee 2
    i32.const 0
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store offset=8
    local.get 2
    local.get 6
    i32.store
    i32.const 0
    local.set 0
    i32.const 0
    local.set 1
    i32.const 0
    local.set 9
    loop  ;; label = @1
      local.get 9
      local.get 10
      i32.add
      local.set 7
      i32.const 7
      local.set 5
      i32.const 1
      local.set 4
      loop  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.const 0
          i32.ne
          local.tee 3
          local.get 0
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            loop  ;; label = @5
              local.get 7
              local.get 1
              i32.const 1
              local.get 0
              i32.const -1
              i32.add
              local.tee 0
              i32.shl
              i32.and
              if (result i32)  ;; label = @6
                local.get 7
                i32.load8_u
                i32.const 128
                local.get 4
                i32.shr_u
                i32.or
              else
                local.get 7
                i32.load8_u
                i32.const -129
                local.get 4
                i32.shr_s
                i32.and
              end
              i32.store8
              local.get 4
              i32.const 1
              i32.add
              local.tee 4
              i32.const 7
              i32.gt_u
              local.set 3
              i32.const 0
              local.get 4
              local.get 3
              select
              local.set 4
              local.get 7
              i32.const 1
              i32.add
              local.get 7
              local.get 3
              select
              local.set 7
              local.get 5
              i32.const -1
              i32.add
              local.tee 5
              i32.const 0
              i32.ne
              local.tee 3
              local.get 0
              i32.const 0
              i32.ne
              i32.and
              br_if 0 (;@5;)
            end
          end
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.load
          call 1
          local.get 1
          i32.const 8
          i32.shl
          i32.or
          local.set 1
          local.get 0
          i32.const 8
          i32.add
          local.set 0
          local.get 5
          br_if 1 (;@2;)
        end
      end
      local.get 2
      local.get 1
      i32.store offset=4
      local.get 2
      local.get 0
      i32.store offset=8
      local.get 9
      i32.const 1
      i32.add
      local.tee 9
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 0
    i32.eqz
    if  ;; label = @1
      local.get 2
      call 4
      local.get 6
      call 0
      drop
      local.get 8
      local.get 10
      i32.store
      global.get 0
      i32.const 27
      i32.add
      local.get 8
      call 6
      drop
      local.get 8
      global.set 1
      i32.const 0
      return
    end
    local.get 2
    local.get 1
    i32.const 8
    local.get 0
    i32.sub
    i32.shl
    local.tee 0
    i32.store offset=4
    local.get 0
    local.get 2
    i32.load
    call 3
    drop
    local.get 2
    call 4
    local.get 6
    call 0
    drop
    local.get 8
    local.get 10
    i32.store
    global.get 0
    i32.const 27
    i32.add
    local.get 8
    call 6
    drop
    local.get 8
    global.set 1
    i32.const 0)
  (func (;8;) (type 4)
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
  (export "__post_instantiate" (func 8))
  (export "_main" (func 7))
  (data (;0;) (global.get 0) "abcdefghijk\00test.bin\00wb\00rb\00%10s\0a"))
