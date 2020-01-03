(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func))
  (import "env" "_atoi" (func (;0;) (type 0)))
  (import "env" "_exit" (func (;1;) (type 1)))
  (import "env" "_fwrite" (func (;2;) (type 2)))
  (import "env" "_memset" (func (;3;) (type 3)))
  (import "env" "_printf" (func (;4;) (type 4)))
  (import "env" "g$_stderr" (func (;5;) (type 5)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;6;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 4
    global.get 1
    i32.const 528
    i32.add
    global.set 1
    i32.const -1
    i32.const 32
    local.get 0
    i32.sub
    local.tee 1
    i32.shl
    local.set 9
    local.get 4
    i32.const 0
    i32.const 132
    call 3
    drop
    local.get 4
    i32.const 144
    i32.add
    local.tee 10
    local.get 0
    i32.const -3
    i32.add
    local.tee 7
    i32.const 2
    i32.shl
    i32.add
    local.set 16
    local.get 4
    i32.const 400
    i32.add
    local.tee 11
    local.get 7
    i32.const 2
    i32.shl
    i32.add
    local.set 17
    local.get 4
    i32.const 272
    i32.add
    local.tee 12
    local.get 7
    i32.const 2
    i32.shl
    i32.add
    local.set 18
    local.get 4
    i32.const 4
    i32.add
    local.set 13
    i32.const 1
    local.get 1
    i32.shl
    local.set 5
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 5
      i32.const 2
      i32.shl
      local.tee 14
      if  ;; label = @2
        local.get 5
        i32.const 2
        i32.shr_u
        local.set 19
        local.get 14
        local.set 1
        loop  ;; label = @3
          local.get 16
          local.get 1
          local.get 5
          i32.or
          local.tee 3
          i32.store
          local.get 17
          local.get 1
          i32.const 1
          i32.shl
          local.tee 15
          local.get 14
          i32.or
          local.tee 2
          i32.store
          local.get 18
          local.get 19
          local.get 1
          i32.const 1
          i32.shr_u
          i32.or
          local.tee 1
          i32.store
          local.get 13
          local.get 2
          local.get 1
          local.get 3
          i32.or
          i32.or
          i32.const -1
          i32.xor
          local.get 9
          i32.and
          local.tee 2
          i32.store
          local.get 2
          if  ;; label = @4
            local.get 7
            local.set 3
            local.get 13
            local.set 1
            loop  ;; label = @5
              local.get 3
              if  ;; label = @6
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 2
                    i32.const 0
                    local.get 2
                    i32.sub
                    i32.and
                    local.tee 8
                    local.get 2
                    i32.xor
                    local.tee 2
                    if  ;; label = @9
                      local.get 1
                      local.get 2
                      local.get 3
                      i32.or
                      i32.store
                      local.get 1
                      i32.const 4
                      i32.add
                      local.set 1
                    end
                    local.get 3
                    i32.const -1
                    i32.add
                    local.tee 6
                    i32.const 2
                    i32.shl
                    local.get 11
                    i32.add
                    local.get 3
                    i32.const 2
                    i32.shl
                    local.get 11
                    i32.add
                    i32.load
                    local.get 8
                    i32.or
                    i32.const 1
                    i32.shl
                    local.tee 2
                    i32.store
                    local.get 6
                    i32.const 2
                    i32.shl
                    local.get 12
                    i32.add
                    local.get 3
                    i32.const 2
                    i32.shl
                    local.get 12
                    i32.add
                    i32.load
                    local.get 8
                    i32.or
                    i32.const 1
                    i32.shr_u
                    local.tee 20
                    i32.store
                    local.get 6
                    i32.const 2
                    i32.shl
                    local.get 10
                    i32.add
                    local.get 3
                    i32.const 2
                    i32.shl
                    local.get 10
                    i32.add
                    i32.load
                    local.get 8
                    i32.or
                    local.tee 3
                    i32.store
                    local.get 3
                    local.get 2
                    local.get 20
                    i32.or
                    i32.or
                    i32.const -1
                    i32.xor
                    local.get 9
                    i32.and
                    local.tee 2
                    i32.eqz
                    br_if 1 (;@7;)
                    local.get 6
                    if  ;; label = @9
                      local.get 6
                      local.set 3
                      br 1 (;@8;)
                    end
                  end
                  local.get 0
                  i32.const 1
                  i32.add
                  local.set 0
                end
              end
              local.get 1
              i32.const -4
              i32.add
              local.tee 1
              i32.load
              local.tee 2
              i32.const 31
              i32.and
              local.set 3
              local.get 2
              i32.const -32
              i32.and
              local.tee 2
              br_if 0 (;@5;)
            end
          end
          local.get 15
          if  ;; label = @4
            local.get 15
            local.set 1
            br 1 (;@3;)
          end
        end
      end
      local.get 5
      i32.const 1
      i32.shl
      local.tee 5
      br_if 0 (;@1;)
    end
    global.get 0
    i32.const 5242928
    i32.add
    local.get 0
    i32.const 1
    i32.shl
    i32.store
    local.get 4
    global.set 1)
  (func (;7;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 1
    local.set 2
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    call 5
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 2
        i32.lt_s
        if  ;; label = @3
          i32.const 8
          local.set 0
          br 1 (;@2;)
        else
          local.get 1
          i32.load offset=4
          call 0
          local.tee 0
          i32.const 1
          i32.lt_s
          if  ;; label = @4
            i32.const 8
            local.set 0
            br 2 (;@2;)
          else
            local.get 0
            i32.const 27
            i32.gt_s
            if  ;; label = @5
              global.get 0
              i32.const 23
              i32.const 1
              local.get 3
              i32.load
              call 2
              drop
              i32.const 1
              call 1
            end
            local.get 0
            i32.const 4
            i32.ge_s
            br_if 2 (;@2;)
            global.get 0
            i32.const 5242928
            i32.add
            local.get 0
            i32.const 1
            i32.eq
            local.tee 0
            i32.store
          end
        end
        br 1 (;@1;)
      end
      local.get 0
      call 6
      global.get 0
      i32.const 5242928
      i32.add
      i32.load
      local.set 0
    end
    local.get 2
    local.get 0
    i32.store
    global.get 0
    i32.const 24
    i32.add
    local.get 2
    call 4
    drop
    local.get 2
    global.set 1
    i32.const 0)
  (func (;8;) (type 6)
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
  (global (;3;) i32 (i32.const 5242928))
  (export "__post_instantiate" (func 8))
  (export "_main" (func 7))
  (export "_count" (global 3))
  (data (;0;) (global.get 0) "Value too large, abort\0a\00\0aSolutions: %d\0a"))
