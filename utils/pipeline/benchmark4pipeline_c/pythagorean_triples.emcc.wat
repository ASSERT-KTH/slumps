(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func))
  (import "env" "getTempRet0" (func (;0;) (type 0)))
  (import "env" "___muldi3" (func (;1;) (type 1)))
  (import "env" "_fflush" (func (;2;) (type 2)))
  (import "env" "_i64Add" (func (;3;) (type 1)))
  (import "env" "_printf" (func (;4;) (type 3)))
  (import "env" "g$_stdout" (func (;5;) (type 0)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;6;) (type 0) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 5
    global.get 1
    i32.const 32
    i32.add
    global.set 1
    local.get 5
    i32.const 8
    i32.add
    local.set 6
    call 5
    i32.load
    local.set 13
    i32.const 1
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 0
      local.get 0
      i32.const 0
      call 1
      local.set 14
      call 0
      local.set 15
      local.get 5
      local.get 0
      i32.store
      global.get 0
      local.get 5
      call 4
      drop
      local.get 13
      call 2
      drop
      local.get 0
      i32.const 1
      i32.add
      local.tee 11
      local.set 1
      loop  ;; label = @2
        local.get 0
        local.get 1
        i32.add
        local.set 16
        local.get 1
        i32.const 1
        i32.add
        local.tee 9
        i32.const 50
        i32.lt_u
        if  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 0
            local.get 1
            i32.const 0
            call 1
            call 0
            local.get 14
            local.get 15
            call 3
            local.set 12
            call 0
            local.set 10
            local.get 9
            local.set 3
            loop  ;; label = @5
              local.get 12
              local.get 3
              i32.const 0
              local.get 3
              i32.const 0
              call 1
              local.tee 2
              i32.lt_u
              local.get 10
              call 0
              local.tee 4
              i32.eq
              i32.and
              local.get 10
              local.get 4
              i32.lt_u
              i32.or
              local.get 3
              local.get 16
              i32.add
              i32.const 100
              i32.gt_u
              i32.or
              br_if 1 (;@4;)
              local.get 2
              local.get 12
              i32.eq
              local.get 4
              local.get 10
              i32.eq
              i32.and
              if  ;; label = @6
                local.get 0
                local.set 4
                local.get 1
                local.set 2
                loop  ;; label = @7
                  local.get 4
                  local.get 2
                  i32.rem_u
                  local.tee 17
                  if  ;; label = @8
                    local.get 2
                    local.set 4
                    local.get 17
                    local.set 2
                    br 1 (;@7;)
                  end
                end
                local.get 2
                i32.const 1
                i32.eq
                local.get 7
                i32.add
                local.set 7
                local.get 8
                i32.const 1
                i32.add
                local.set 8
              end
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              i32.const 50
              i32.lt_u
              br_if 0 (;@5;)
            end
          end
        end
        local.get 9
        i32.const 50
        i32.ne
        if  ;; label = @3
          local.get 9
          local.set 1
          br 1 (;@2;)
        end
      end
      local.get 11
      i32.const 34
      i32.ne
      if  ;; label = @2
        local.get 11
        local.set 0
        br 1 (;@1;)
      end
    end
    local.get 6
    i32.const 100
    i32.store
    local.get 6
    local.get 8
    i32.store offset=4
    local.get 6
    local.get 7
    i32.store offset=8
    global.get 0
    i32.const 9
    i32.add
    local.get 6
    call 4
    drop
    local.get 5
    global.set 1
    i32.const 0)
  (func (;7;) (type 4)
    global.get 0
    i32.const 80
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 7))
  (export "_main" (func 6))
  (data (;0;) (global.get 0) "a = %lu\0d\00Up to %lu, there are %lu triples, of which %lu are primitive\0a"))
