(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func))
  (import "env" "_malloc" (func (;0;) (type 0)))
  (import "env" "_perror" (func (;1;) (type 1)))
  (import "env" "_printf" (func (;2;) (type 2)))
  (import "env" "_putchar" (func (;3;) (type 0)))
  (import "env" "_puts" (func (;4;) (type 0)))
  (import "env" "_rand" (func (;5;) (type 3)))
  (import "env" "_scanf" (func (;6;) (type 2)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;7;) (type 4) (param i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 5242992
    i32.add
    i32.const 1
    i32.store
    i32.const 1
    local.set 2
    loop  ;; label = @1
      global.get 0
      i32.const 5242996
      i32.add
      i32.const 0
      i32.store
      i32.const 0
      local.set 4
      loop  ;; label = @2
        local.get 2
        i32.const 2
        i32.shl
        local.get 1
        i32.add
        i32.load
        local.get 4
        i32.const 2
        i32.shl
        i32.add
        local.get 2
        i32.const 2
        i32.shl
        local.get 0
        i32.add
        i32.load
        local.get 4
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 5242996
        i32.add
        global.get 0
        i32.const 5242996
        i32.add
        i32.load
        i32.const 1
        i32.add
        local.tee 4
        i32.store
        global.get 0
        i32.const 5242992
        i32.add
        i32.load
        local.set 3
        local.get 4
        i32.const 3
        i32.lt_s
        if  ;; label = @3
          local.get 3
          local.set 2
          br 1 (;@2;)
        end
      end
      global.get 0
      i32.const 5242992
      i32.add
      local.get 3
      i32.const 1
      i32.add
      local.tee 2
      i32.store
      local.get 3
      i32.const 3
      i32.lt_s
      br_if 0 (;@1;)
    end
    global.get 0
    i32.const 5242992
    i32.add
    i32.const 1
    i32.store
    call 5
    global.get 0
    i32.const 5242992
    i32.add
    i32.const 0
    i32.store
    i32.const 3
    i32.rem_s
    i32.const 2
    i32.add
    i32.const 2
    i32.shl
    local.get 1
    i32.add
    i32.load
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 2
      i32.shl
      local.get 3
      i32.add
      local.tee 0
      local.get 0
      i32.load
      i32.eqz
      i32.store
      global.get 0
      i32.const 5242992
      i32.add
      global.get 0
      i32.const 5242992
      i32.add
      i32.load
      i32.const 1
      i32.add
      local.tee 0
      i32.store
      local.get 0
      i32.const 3
      i32.lt_s
      br_if 0 (;@1;)
    end
    global.get 0
    i32.const 5242992
    i32.add
    i32.const 0
    i32.store
    loop  ;; label = @1
      call 5
      i32.const 3
      i32.rem_s
      local.set 3
      global.get 0
      i32.const 5242992
      i32.add
      i32.const 1
      i32.store
      i32.const 1
      local.set 0
      loop  ;; label = @2
        local.get 0
        i32.const 2
        i32.shl
        local.get 1
        i32.add
        i32.load
        local.get 3
        i32.const 2
        i32.shl
        i32.add
        local.tee 0
        local.get 0
        i32.load
        i32.eqz
        i32.store
        global.get 0
        i32.const 5242992
        i32.add
        global.get 0
        i32.const 5242992
        i32.add
        i32.load
        local.tee 2
        i32.const 1
        i32.add
        local.tee 0
        i32.store
        local.get 2
        i32.const 3
        i32.lt_s
        br_if 0 (;@2;)
      end
      global.get 0
      i32.const 5242992
      i32.add
      local.get 2
      i32.const 2
      i32.add
      local.tee 0
      i32.store
      local.get 0
      i32.const 3
      i32.lt_s
      br_if 0 (;@1;)
    end)
  (func (;8;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get 1
    local.set 2
    global.get 1
    i32.const 32
    i32.add
    global.set 1
    i32.const 32
    call 3
    drop
    global.get 0
    i32.const 5242992
    i32.add
    i32.const 0
    i32.store
    loop  ;; label = @1
      local.get 2
      local.get 1
      i32.store
      global.get 0
      local.get 2
      call 2
      drop
      global.get 0
      i32.const 5242992
      i32.add
      global.get 0
      i32.const 5242992
      i32.add
      i32.load
      i32.const 1
      i32.add
      local.tee 1
      i32.store
      local.get 1
      i32.const 3
      i32.lt_s
      br_if 0 (;@1;)
    end
    i32.const 10
    call 3
    drop
    global.get 0
    i32.const 5242992
    i32.add
    i32.const 1
    i32.store
    local.get 2
    i32.const 16
    i32.add
    local.set 3
    local.get 2
    i32.const 8
    i32.add
    local.set 4
    i32.const 1
    local.set 1
    loop  ;; label = @1
      local.get 4
      local.get 1
      i32.const -1
      i32.add
      i32.store
      global.get 0
      i32.const 4
      i32.add
      local.get 4
      call 2
      drop
      global.get 0
      i32.const 5242996
      i32.add
      i32.const 0
      i32.store
      i32.const 0
      local.set 1
      loop  ;; label = @2
        local.get 3
        global.get 0
        i32.const 5242992
        i32.add
        i32.load
        i32.const 2
        i32.shl
        local.get 0
        i32.add
        i32.load
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        global.get 0
        local.get 3
        call 2
        drop
        global.get 0
        i32.const 5242996
        i32.add
        global.get 0
        i32.const 5242996
        i32.add
        i32.load
        i32.const 1
        i32.add
        local.tee 1
        i32.store
        local.get 1
        i32.const 3
        i32.lt_s
        br_if 0 (;@2;)
      end
      i32.const 10
      call 3
      drop
      global.get 0
      i32.const 5242992
      i32.add
      global.get 0
      i32.const 5242992
      i32.add
      i32.load
      local.tee 5
      i32.const 1
      i32.add
      local.tee 1
      i32.store
      local.get 5
      i32.const 3
      i32.lt_s
      br_if 0 (;@1;)
    end
    i32.const 10
    call 3
    drop
    local.get 2
    global.set 1)
  (func (;9;) (type 5)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 2
    global.get 1
    i32.const 48
    i32.add
    global.set 1
    i32.const 15
    call 0
    local.tee 5
    i32.const 12
    call 0
    local.tee 3
    i32.store offset=4
    local.get 5
    i32.const 12
    call 0
    local.tee 6
    i32.store offset=8
    local.get 5
    i32.const 12
    call 0
    local.tee 7
    i32.store offset=12
    i32.const 15
    call 0
    local.tee 4
    i32.const 12
    call 0
    local.tee 1
    i32.store offset=4
    local.get 4
    i32.const 12
    call 0
    local.tee 8
    i32.store offset=8
    local.get 4
    i32.const 12
    call 0
    local.tee 9
    i32.store offset=12
    global.get 0
    i32.const 5242992
    i32.add
    i32.const 1
    i32.store
    loop  ;; label = @1
      global.get 0
      i32.const 5242996
      i32.add
      i32.const 0
      i32.store
      loop  ;; label = @2
        call 5
        i32.const 2
        i32.rem_s
        local.set 0
        global.get 0
        i32.const 5242992
        i32.add
        i32.load
        i32.const 2
        i32.shl
        local.get 5
        i32.add
        i32.load
        global.get 0
        i32.const 5242996
        i32.add
        i32.load
        i32.const 2
        i32.shl
        i32.add
        local.get 0
        i32.store
        global.get 0
        i32.const 5242996
        i32.add
        global.get 0
        i32.const 5242996
        i32.add
        i32.load
        local.tee 0
        i32.const 1
        i32.add
        i32.store
        local.get 0
        i32.const 2
        i32.lt_s
        br_if 0 (;@2;)
      end
      global.get 0
      i32.const 5242992
      i32.add
      global.get 0
      i32.const 5242992
      i32.add
      i32.load
      local.tee 0
      i32.const 1
      i32.add
      i32.store
      local.get 0
      i32.const 3
      i32.lt_s
      br_if 0 (;@1;)
    end
    local.get 5
    local.get 4
    call 7
    global.get 0
    i32.const 5242992
    i32.add
    i32.const 1
    i32.store
    global.get 0
    i32.const 5242996
    i32.add
    i32.const 0
    i32.store
    local.get 1
    i32.load
    local.get 3
    i32.load
    i32.eq
    if  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 1
          i32.store
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=4
          i32.ne
          br_if 0 (;@3;)
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 2
          i32.store
          local.get 1
          i32.load offset=8
          local.get 3
          i32.load offset=8
          i32.ne
          br_if 0 (;@3;)
          global.get 0
          i32.const 5242992
          i32.add
          i32.const 2
          i32.store
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 0
          i32.store
          local.get 8
          i32.load
          local.get 6
          i32.load
          i32.ne
          br_if 0 (;@3;)
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 1
          i32.store
          local.get 8
          i32.load offset=4
          local.get 6
          i32.load offset=4
          i32.ne
          br_if 0 (;@3;)
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 2
          i32.store
          local.get 8
          i32.load offset=8
          local.get 6
          i32.load offset=8
          i32.ne
          br_if 0 (;@3;)
          global.get 0
          i32.const 5242992
          i32.add
          i32.const 3
          i32.store
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 0
          i32.store
          local.get 9
          i32.load
          local.get 7
          i32.load
          i32.ne
          br_if 0 (;@3;)
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 1
          i32.store
          local.get 9
          i32.load offset=4
          local.get 7
          i32.load offset=4
          i32.ne
          br_if 0 (;@3;)
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 2
          i32.store
          local.get 9
          i32.load offset=8
          local.get 7
          i32.load offset=8
          i32.ne
          br_if 0 (;@3;)
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 3
          i32.store
          global.get 0
          i32.const 5242992
          i32.add
          i32.const 4
          i32.store
          local.get 5
          local.get 4
          call 7
          global.get 0
          i32.const 5242992
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 0
          i32.store
          local.get 1
          i32.load
          local.get 3
          i32.load
          i32.eq
          br_if 1 (;@2;)
        end
      end
    end
    local.get 2
    i32.const 24
    i32.add
    local.set 13
    local.get 2
    i32.const 16
    i32.add
    local.set 14
    local.get 2
    i32.const 8
    i32.add
    local.set 15
    local.get 2
    local.tee 10
    i32.const 32
    i32.add
    local.set 16
    local.get 10
    i32.const 28
    i32.add
    local.set 17
    i32.const 0
    local.set 2
    loop  ;; label = @1
      block  ;; label = @2
        global.get 0
        i32.const 79
        i32.add
        call 4
        drop
        local.get 5
        call 8
        global.get 0
        i32.const 88
        i32.add
        call 4
        drop
        local.get 4
        call 8
        global.get 0
        i32.const 7
        i32.add
        local.get 10
        call 2
        drop
        local.get 15
        local.get 16
        i32.store
        global.get 0
        i32.const 22
        i32.add
        local.get 15
        call 6
        drop
        local.get 14
        local.get 17
        i32.store
        global.get 0
        local.get 14
        call 6
        drop
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 10
                i32.load8_s offset=32
                i32.const 99
                i32.sub
                br_table 1 (;@5;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 2 (;@4;) 0 (;@6;) 2 (;@4;)
              end
              local.get 10
              i32.load offset=28
              global.get 0
              i32.const 5242992
              i32.add
              i32.const 0
              i32.store
              i32.const 1
              i32.add
              i32.const 2
              i32.shl
              local.get 4
              i32.add
              i32.load
              local.set 11
              i32.const 0
              local.set 0
              loop  ;; label = @6
                local.get 0
                i32.const 2
                i32.shl
                local.get 11
                i32.add
                local.tee 0
                local.get 0
                i32.load
                i32.eqz
                i32.store
                global.get 0
                i32.const 5242992
                i32.add
                global.get 0
                i32.const 5242992
                i32.add
                i32.load
                local.tee 12
                i32.const 1
                i32.add
                local.tee 0
                i32.store
                local.get 12
                i32.const 2
                i32.lt_s
                br_if 0 (;@6;)
              end
              br 2 (;@3;)
            end
            local.get 10
            i32.load offset=28
            local.set 11
            global.get 0
            i32.const 5242992
            i32.add
            i32.const 1
            i32.store
            local.get 11
            i32.const 2
            i32.shl
            local.get 1
            i32.add
            local.tee 0
            local.get 0
            i32.load
            i32.eqz
            i32.store
            global.get 0
            i32.const 5242992
            i32.add
            i32.const 2
            i32.store
            i32.const 2
            local.set 0
            loop  ;; label = @5
              local.get 0
              i32.const 2
              i32.shl
              local.get 4
              i32.add
              i32.load
              local.get 11
              i32.const 2
              i32.shl
              i32.add
              local.tee 0
              local.get 0
              i32.load
              i32.eqz
              i32.store
              global.get 0
              i32.const 5242992
              i32.add
              global.get 0
              i32.const 5242992
              i32.add
              i32.load
              local.tee 12
              i32.const 1
              i32.add
              local.tee 0
              i32.store
              local.get 12
              i32.const 3
              i32.lt_s
              br_if 0 (;@5;)
            end
            br 1 (;@3;)
          end
          global.get 0
          i32.const 26
          i32.add
          call 1
        end
        local.get 13
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        i32.store
        global.get 0
        i32.const 62
        i32.add
        local.get 13
        call 2
        drop
        global.get 0
        i32.const 5242992
        i32.add
        i32.const 1
        i32.store
        global.get 0
        i32.const 5242996
        i32.add
        i32.const 0
        i32.store
        local.get 1
        i32.load
        local.get 3
        i32.load
        i32.eq
        if  ;; label = @3
          global.get 0
          i32.const 5242996
          i32.add
          i32.const 1
          i32.store
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=4
          i32.eq
          if  ;; label = @4
            global.get 0
            i32.const 5242996
            i32.add
            i32.const 2
            i32.store
            local.get 1
            i32.load offset=8
            local.get 3
            i32.load offset=8
            i32.eq
            if  ;; label = @5
              global.get 0
              i32.const 5242992
              i32.add
              i32.const 2
              i32.store
              global.get 0
              i32.const 5242996
              i32.add
              i32.const 0
              i32.store
              local.get 8
              i32.load
              local.get 6
              i32.load
              i32.eq
              if  ;; label = @6
                global.get 0
                i32.const 5242996
                i32.add
                i32.const 1
                i32.store
                local.get 8
                i32.load offset=4
                local.get 6
                i32.load offset=4
                i32.eq
                if  ;; label = @7
                  global.get 0
                  i32.const 5242996
                  i32.add
                  i32.const 2
                  i32.store
                  local.get 8
                  i32.load offset=8
                  local.get 6
                  i32.load offset=8
                  i32.eq
                  if  ;; label = @8
                    global.get 0
                    i32.const 5242992
                    i32.add
                    i32.const 3
                    i32.store
                    global.get 0
                    i32.const 5242996
                    i32.add
                    i32.const 0
                    i32.store
                    local.get 9
                    i32.load
                    local.get 7
                    i32.load
                    i32.eq
                    if  ;; label = @9
                      global.get 0
                      i32.const 5242996
                      i32.add
                      i32.const 1
                      i32.store
                      local.get 9
                      i32.load offset=4
                      local.get 7
                      i32.load offset=4
                      i32.eq
                      if  ;; label = @10
                        global.get 0
                        i32.const 5242996
                        i32.add
                        i32.const 2
                        i32.store
                        local.get 9
                        i32.load offset=8
                        local.get 7
                        i32.load offset=8
                        i32.eq
                        br_if 8 (;@2;)
                      end
                    end
                  end
                end
              end
            end
          end
        end
        br 1 (;@1;)
      end
    end
    global.get 0
    i32.const 5242996
    i32.add
    i32.const 3
    i32.store
    global.get 0
    i32.const 5242992
    i32.add
    i32.const 4
    i32.store
    global.get 0
    i32.const 96
    i32.add
    call 4
    drop
    local.get 10
    global.set 1)
  (func (;10;) (type 5)
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
  (global (;3;) i32 (i32.const 5242992))
  (global (;4;) i32 (i32.const 5242996))
  (global (;5;) i32 (i32.const 79))
  (export "__post_instantiate" (func 10))
  (export "_main" (func 9))
  (export "_i" (global 3))
  (export "_j" (global 4))
  (export "_str" (global 5))
  (data (;0;) (global.get 0) " %d\00%d\00What to flip: \00 %c\00Please specify r or c and an number\00Moves Taken: %d\0a\00Target: \00Board: \00You win!"))
