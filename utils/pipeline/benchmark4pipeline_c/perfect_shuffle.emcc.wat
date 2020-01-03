(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func))
  (import "env" "_free" (func (;0;) (type 0)))
  (import "env" "_fwrite" (func (;1;) (type 1)))
  (import "env" "_malloc" (func (;2;) (type 2)))
  (import "env" "_memcpy" (func (;3;) (type 3)))
  (import "env" "_printf" (func (;4;) (type 4)))
  (import "env" "g$_stderr" (func (;5;) (type 5)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;6;) (type 5) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    call 5
    local.set 10
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          global.get 0
          local.get 6
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 3
          i32.const 2
          i32.shl
          local.tee 8
          call 2
          local.tee 1
          if  ;; label = @4
            i32.const 0
            local.set 0
            loop  ;; label = @5
              local.get 0
              i32.const 2
              i32.shl
              local.get 1
              i32.add
              local.get 0
              i32.store
              local.get 0
              i32.const 1
              i32.add
              local.tee 0
              local.get 3
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 3
            i32.const 2
            i32.div_s
            local.set 9
            i32.const 0
            local.set 7
            loop  ;; label = @5
              block  ;; label = @6
                local.get 8
                call 2
                local.tee 4
                if  ;; label = @7
                  local.get 4
                  local.get 1
                  local.get 8
                  call 3
                  drop
                  i32.const 0
                  local.set 0
                  i32.const 0
                  local.set 5
                  loop  ;; label = @8
                    local.get 5
                    i32.const 2
                    i32.shl
                    local.get 1
                    i32.add
                    local.get 0
                    i32.const 2
                    i32.shl
                    local.get 4
                    i32.add
                    i32.load
                    i32.store
                    local.get 5
                    i32.const 1
                    i32.or
                    i32.const 2
                    i32.shl
                    local.get 1
                    i32.add
                    local.get 0
                    local.get 9
                    i32.add
                    i32.const 2
                    i32.shl
                    local.get 4
                    i32.add
                    i32.load
                    i32.store
                    local.get 5
                    i32.const 2
                    i32.add
                    local.set 5
                    local.get 0
                    i32.const 1
                    i32.add
                    local.tee 0
                    local.get 9
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 4
                  call 0
                end
                local.get 7
                i32.const 1
                i32.add
                local.set 7
                i32.const 0
                local.set 0
                loop  ;; label = @7
                  local.get 0
                  i32.const 2
                  i32.shl
                  local.get 1
                  i32.add
                  i32.load
                  local.get 0
                  i32.eq
                  if  ;; label = @8
                    local.get 0
                    i32.const 1
                    i32.add
                    local.tee 0
                    local.get 3
                    i32.ge_s
                    br_if 2 (;@6;)
                    br 1 (;@7;)
                  end
                end
                br 1 (;@5;)
              end
            end
            local.get 2
            local.get 3
            i32.store
            local.get 2
            local.get 7
            i32.store offset=4
            global.get 0
            i32.const 57
            i32.add
            local.get 2
            call 4
            drop
            local.get 1
            call 0
            local.get 6
            i32.const 1
            i32.add
            local.tee 6
            i32.const 7
            i32.ge_u
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
        end
        br 1 (;@1;)
      end
      local.get 2
      global.set 1
      i32.const 0
      return
    end
    global.get 0
    i32.const 32
    i32.add
    i32.const 24
    i32.const 1
    local.get 10
    i32.load
    call 1
    drop
    local.get 2
    global.set 1
    i32.const 1)
  (func (;7;) (type 6)
    global.get 0
    i32.const 112
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) i32 (i32.const 0))
  (export "__post_instantiate" (func 7))
  (export "_main" (func 6))
  (export "_kDecks" (global 3))
  (data (;0;) (global.get 0) "\08\00\00\00\18\00\00\004\00\00\00d\00\00\00\fc\03\00\00\00\04\00\00\10'\00\00\00\00\00\00Error: malloc() failed!\0a\00Cards count: %d, shuffles required: %d.\0a"))
