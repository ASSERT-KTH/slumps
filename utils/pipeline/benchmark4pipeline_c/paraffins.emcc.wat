(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;5;) (func))
  (import "env" "getTempRet0" (func (;0;) (type 0)))
  (import "env" "___muldi3" (func (;1;) (type 1)))
  (import "env" "___udivdi3" (func (;2;) (type 1)))
  (import "env" "_bitshift64Lshr" (func (;3;) (type 2)))
  (import "env" "_bitshift64Shl" (func (;4;) (type 2)))
  (import "env" "_i64Add" (func (;5;) (type 1)))
  (import "env" "_i64Subtract" (func (;6;) (type 1)))
  (import "env" "_printf" (func (;7;) (type 3)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;8;) (type 4) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.const 1
    i32.const 0
    call 5
    local.set 12
    call 0
    local.tee 13
    i32.const 0
    i32.lt_u
    local.get 13
    i32.eqz
    local.get 12
    i32.const 5
    i32.lt_u
    i32.and
    i32.or
    i32.eqz
    if  ;; label = @1
      return
    end
    global.get 0
    local.get 2
    i32.const 3
    i32.shl
    i32.add
    local.set 20
    local.get 8
    local.get 9
    i32.const 1
    call 4
    local.set 25
    call 0
    local.set 21
    local.get 2
    local.get 3
    i32.const -1
    i32.const -1
    call 5
    local.tee 18
    call 0
    local.tee 22
    i32.or
    i32.eqz
    if  ;; label = @1
      local.get 12
      local.set 8
      local.get 13
      local.set 9
      loop  ;; label = @2
        block  ;; label = @3
          local.get 8
          local.get 9
          local.get 0
          local.get 1
          call 6
          local.tee 22
          call 0
          local.tee 15
          local.get 2
          local.get 3
          call 1
          call 0
          local.get 6
          local.get 7
          call 5
          local.set 17
          call 0
          local.tee 18
          i32.const 0
          i32.gt_u
          local.get 18
          i32.eqz
          local.get 17
          i32.const 32
          i32.gt_u
          i32.and
          i32.or
          br_if 0 (;@3;)
          local.get 20
          i32.load
          local.set 11
          local.get 20
          i32.const 4
          i32.add
          i32.load
          local.set 10
          local.get 15
          i32.eqz
          local.get 22
          i32.const 1
          i32.gt_u
          i32.and
          local.get 15
          i32.const 0
          i32.gt_u
          i32.or
          if  ;; label = @4
            i32.const 1
            local.set 14
            i32.const 0
            local.set 16
            local.get 11
            local.set 12
            local.get 10
            local.set 13
            loop  ;; label = @5
              local.get 14
              local.get 16
              local.get 11
              local.get 10
              call 5
              call 0
              local.get 12
              local.get 13
              call 1
              call 0
              local.get 14
              local.get 16
              i32.const 1
              i32.const 0
              call 5
              local.tee 14
              call 0
              local.tee 16
              call 2
              local.set 12
              call 0
              local.set 13
              local.get 15
              local.get 16
              i32.eq
              local.get 14
              local.get 22
              i32.lt_u
              i32.and
              local.get 16
              local.get 15
              i32.lt_u
              i32.or
              br_if 0 (;@5;)
            end
          else
            local.get 11
            local.set 12
            local.get 10
            local.set 13
          end
          local.get 12
          local.get 13
          local.get 4
          local.get 5
          call 1
          local.set 12
          call 0
          local.set 13
          local.get 18
          local.get 21
          i32.eq
          local.get 25
          local.get 17
          i32.lt_u
          i32.and
          local.get 21
          local.get 18
          i32.lt_u
          i32.or
          if  ;; label = @4
            global.get 0
            i32.const 272
            i32.add
            local.get 17
            i32.const 3
            i32.shl
            i32.add
            local.tee 11
            local.tee 10
            i32.load
            local.get 10
            i32.const 4
            i32.add
            i32.load
            local.get 12
            local.get 13
            call 5
            local.set 10
            call 0
            local.set 14
            local.get 11
            local.get 10
            i32.store
            local.get 11
            i32.const 4
            i32.add
            local.get 14
            i32.store
          end
          local.get 9
          i32.eqz
          local.get 8
          i32.const 4
          i32.eq
          i32.and
          br_if 0 (;@3;)
          global.get 0
          local.get 17
          i32.const 3
          i32.shl
          i32.add
          local.tee 11
          local.tee 10
          i32.load
          local.get 10
          i32.const 4
          i32.add
          i32.load
          local.get 12
          local.get 13
          call 5
          local.set 12
          call 0
          local.set 13
          local.get 11
          local.get 12
          i32.store
          local.get 11
          i32.const 4
          i32.add
          local.get 13
          i32.store
          local.get 8
          local.get 9
          i32.const 1
          i32.const 0
          call 5
          local.set 8
          call 0
          local.tee 9
          i32.const 0
          i32.lt_u
          local.get 9
          i32.eqz
          local.get 8
          i32.const 5
          i32.lt_u
          i32.and
          i32.or
          br_if 1 (;@2;)
        end
      end
      return
    end
    loop  ;; label = @1
      block  ;; label = @2
        local.get 12
        local.get 13
        local.get 0
        local.get 1
        call 6
        local.tee 26
        call 0
        local.tee 23
        local.get 2
        local.get 3
        call 1
        call 0
        local.get 6
        local.get 7
        call 5
        local.set 19
        call 0
        local.tee 24
        i32.const 0
        i32.gt_u
        local.get 24
        i32.eqz
        local.get 19
        i32.const 32
        i32.gt_u
        i32.and
        i32.or
        br_if 0 (;@2;)
        local.get 20
        i32.load
        local.set 14
        local.get 20
        i32.const 4
        i32.add
        i32.load
        local.set 16
        local.get 23
        i32.eqz
        local.get 26
        i32.const 1
        i32.gt_u
        i32.and
        local.get 23
        i32.const 0
        i32.gt_u
        i32.or
        if  ;; label = @3
          i32.const 1
          local.set 15
          i32.const 0
          local.set 17
          local.get 14
          local.set 11
          local.get 16
          local.set 10
          loop  ;; label = @4
            local.get 15
            local.get 17
            local.get 14
            local.get 16
            call 5
            call 0
            local.get 11
            local.get 10
            call 1
            call 0
            local.get 15
            local.get 17
            i32.const 1
            i32.const 0
            call 5
            local.tee 15
            call 0
            local.tee 17
            call 2
            local.set 11
            call 0
            local.set 10
            local.get 17
            local.get 23
            i32.eq
            local.get 15
            local.get 26
            i32.lt_u
            i32.and
            local.get 17
            local.get 23
            i32.lt_u
            i32.or
            br_if 0 (;@4;)
          end
        else
          local.get 14
          local.set 11
          local.get 16
          local.set 10
        end
        local.get 11
        local.get 10
        local.get 4
        local.get 5
        call 1
        local.set 14
        call 0
        local.set 16
        local.get 21
        local.get 24
        i32.eq
        local.get 25
        local.get 19
        i32.lt_u
        i32.and
        local.get 21
        local.get 24
        i32.lt_u
        i32.or
        if  ;; label = @3
          global.get 0
          i32.const 272
          i32.add
          local.get 19
          i32.const 3
          i32.shl
          i32.add
          local.tee 11
          local.tee 10
          i32.load
          local.get 10
          i32.const 4
          i32.add
          i32.load
          local.get 14
          local.get 16
          call 5
          local.set 10
          call 0
          local.set 15
          local.get 11
          local.get 10
          i32.store
          local.get 11
          i32.const 4
          i32.add
          local.get 15
          i32.store
        end
        local.get 13
        i32.eqz
        local.get 12
        i32.const 4
        i32.eq
        i32.and
        br_if 0 (;@2;)
        global.get 0
        local.get 19
        i32.const 3
        i32.shl
        i32.add
        local.tee 11
        local.tee 10
        i32.load
        local.get 10
        i32.const 4
        i32.add
        i32.load
        local.get 14
        local.get 16
        call 5
        local.set 10
        call 0
        local.set 15
        local.get 11
        local.get 10
        i32.store
        local.get 11
        i32.const 4
        i32.add
        local.get 15
        i32.store
        local.get 18
        local.set 11
        local.get 22
        local.set 10
        loop  ;; label = @3
          local.get 12
          local.get 13
          local.get 11
          local.get 10
          local.get 14
          local.get 16
          local.get 19
          local.get 24
          local.get 8
          local.get 9
          call 8
          local.get 11
          local.get 10
          i32.const -1
          i32.const -1
          call 5
          local.tee 11
          call 0
          local.tee 10
          i32.or
          br_if 0 (;@3;)
        end
        local.get 12
        local.get 13
        i32.const 1
        i32.const 0
        call 5
        local.set 12
        call 0
        local.tee 13
        i32.const 0
        i32.lt_u
        local.get 13
        i32.eqz
        local.get 12
        i32.const 5
        i32.lt_u
        i32.and
        i32.or
        br_if 1 (;@1;)
      end
    end)
  (func (;9;) (type 0) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 4
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    i32.const 1
    local.set 0
    loop  ;; label = @1
      i32.const 0
      i32.const 0
      local.get 0
      local.get 3
      i32.const 1
      i32.const 0
      i32.const 1
      i32.const 0
      local.get 0
      local.get 3
      call 8
      local.get 0
      i32.const 1
      i32.and
      if  ;; label = @2
        global.get 0
        i32.const 272
        i32.add
        local.get 0
        i32.const 3
        i32.shl
        i32.add
        local.tee 2
        i32.load
        local.set 1
        local.get 2
        i32.const 4
        i32.add
        i32.load
        local.set 2
      else
        global.get 0
        local.get 0
        i32.const 1
        i32.shr_u
        i32.const 3
        i32.shl
        i32.add
        local.tee 1
        i32.load
        local.tee 2
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.const 1
        i32.const 0
        call 5
        call 0
        local.get 2
        local.get 1
        call 1
        call 0
        i32.const 1
        call 3
        call 0
        global.get 0
        i32.const 272
        i32.add
        local.get 0
        i32.const 3
        i32.shl
        i32.add
        local.tee 5
        local.tee 1
        i32.load
        local.get 1
        i32.const 4
        i32.add
        i32.load
        call 5
        local.set 1
        call 0
        local.set 2
        local.get 5
        local.get 1
        i32.store
        local.get 5
        i32.const 4
        i32.add
        local.get 2
        i32.store
      end
      local.get 4
      local.get 0
      i32.store
      local.get 4
      i32.const 4
      i32.add
      local.get 3
      i32.store
      local.get 4
      i32.const 8
      i32.add
      local.tee 5
      local.get 1
      i32.store
      local.get 5
      i32.const 4
      i32.add
      local.get 2
      i32.store
      global.get 0
      i32.const 544
      i32.add
      local.get 4
      call 7
      drop
      local.get 0
      local.get 3
      i32.const 1
      i32.const 0
      call 5
      local.set 0
      call 0
      local.tee 3
      i32.const 0
      i32.lt_u
      local.get 3
      i32.eqz
      local.get 0
      i32.const 33
      i32.lt_u
      i32.and
      i32.or
      br_if 0 (;@1;)
    end
    local.get 4
    global.set 1
    i32.const 0)
  (func (;10;) (type 5)
    global.get 0
    i32.const 560
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) i32 (i32.const 0))
  (global (;4;) i32 (i32.const 272))
  (export "__post_instantiate" (func 10))
  (export "_main" (func 9))
  (export "_rooted" (global 3))
  (export "_unrooted" (global 4))
  (data (;0;) (global.get 0) "\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00%llu: %llu\0a"))
