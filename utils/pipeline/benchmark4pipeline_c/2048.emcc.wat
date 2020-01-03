(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func))
  (import "env" "_getchar" (func (;0;) (type 0)))
  (import "env" "_printf" (func (;1;) (type 1)))
  (import "env" "_putchar" (func (;2;) (type 2)))
  (import "env" "_puts" (func (;3;) (type 2)))
  (import "env" "_rand" (func (;4;) (type 0)))
  (import "env" "_srand" (func (;5;) (type 3)))
  (import "env" "_tcgetattr" (func (;6;) (type 1)))
  (import "env" "_tcsetattr" (func (;7;) (type 4)))
  (import "env" "_time" (func (;8;) (type 2)))
  (import "env" "_usleep" (func (;9;) (type 2)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;10;) (type 5)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 0
    global.get 1
    i32.const 112
    i32.add
    global.set 1
    local.get 0
    i32.const 8
    i32.add
    local.set 2
    local.get 0
    global.get 0
    i32.const 5243156
    i32.add
    i32.load
    i32.store
    global.get 0
    i32.const 132
    i32.add
    local.get 0
    call 1
    drop
    global.get 0
    i32.const 5243160
    i32.add
    i32.load
    local.tee 4
    if  ;; label = @1
      local.get 2
      local.get 4
      i32.store
      global.get 0
      i32.const 150
      i32.add
      local.get 2
      call 1
      drop
    end
    local.get 0
    i32.const 104
    i32.add
    local.set 8
    local.get 0
    i32.const 88
    i32.add
    local.set 4
    local.get 0
    i32.const 80
    i32.add
    local.set 9
    local.get 0
    i32.const -64
    i32.sub
    local.set 5
    local.get 0
    i32.const 56
    i32.add
    local.set 10
    local.get 0
    i32.const 40
    i32.add
    local.set 6
    local.get 0
    i32.const 32
    i32.add
    local.set 11
    local.get 0
    i32.const 16
    i32.add
    local.set 7
    i32.const 10
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 10
    call 2
    drop
    i32.const 0
    local.set 2
    loop  ;; label = @1
      i32.const 124
      call 2
      drop
      global.get 0
      i32.const 5243088
      i32.add
      local.get 2
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee 1
      if  ;; label = @2
        global.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.set 3
        local.get 7
        global.get 0
        i32.const 48
        i32.add
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        local.get 7
        i32.const 4
        i32.store offset=4
        local.get 7
        local.get 3
        i32.store offset=8
        global.get 0
        i32.const 158
        i32.add
        local.get 7
        call 1
        drop
      else
        local.get 11
        i32.const 4
        i32.store
        local.get 11
        global.get 0
        i32.const 5243288
        i32.add
        i32.store offset=4
        global.get 0
        i32.const 178
        i32.add
        local.get 11
        call 1
        drop
      end
      global.get 0
      i32.const 5243104
      i32.add
      local.get 2
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee 1
      if  ;; label = @2
        global.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.set 3
        local.get 6
        global.get 0
        i32.const 48
        i32.add
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        local.get 6
        i32.const 4
        i32.store offset=4
        local.get 6
        local.get 3
        i32.store offset=8
        global.get 0
        i32.const 158
        i32.add
        local.get 6
        call 1
        drop
      else
        local.get 10
        i32.const 4
        i32.store
        local.get 10
        global.get 0
        i32.const 5243288
        i32.add
        i32.store offset=4
        global.get 0
        i32.const 178
        i32.add
        local.get 10
        call 1
        drop
      end
      global.get 0
      i32.const 5243120
      i32.add
      local.get 2
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee 1
      if  ;; label = @2
        global.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.set 3
        local.get 5
        global.get 0
        i32.const 48
        i32.add
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        local.get 5
        i32.const 4
        i32.store offset=4
        local.get 5
        local.get 3
        i32.store offset=8
        global.get 0
        i32.const 158
        i32.add
        local.get 5
        call 1
        drop
      else
        local.get 9
        i32.const 4
        i32.store
        local.get 9
        global.get 0
        i32.const 5243288
        i32.add
        i32.store offset=4
        global.get 0
        i32.const 178
        i32.add
        local.get 9
        call 1
        drop
      end
      global.get 0
      i32.const 5243136
      i32.add
      local.get 2
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.tee 1
      if  ;; label = @2
        global.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.set 3
        local.get 4
        global.get 0
        i32.const 48
        i32.add
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.store
        local.get 4
        i32.const 4
        i32.store offset=4
        local.get 4
        local.get 3
        i32.store offset=8
        global.get 0
        i32.const 158
        i32.add
        local.get 4
        call 1
        drop
      else
        local.get 8
        i32.const 4
        i32.store
        local.get 8
        global.get 0
        i32.const 5243288
        i32.add
        i32.store offset=4
        global.get 0
        i32.const 178
        i32.add
        local.get 8
        call 1
        drop
      end
      i32.const 10
      call 2
      drop
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      i32.const 4
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 45
    call 2
    drop
    i32.const 10
    call 2
    drop
    local.get 0
    global.set 1)
  (func (;11;) (type 3) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 5243160
    i32.add
    i32.const 0
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 1
                i32.sub
                br_table 3 (;@3;) 2 (;@4;) 1 (;@5;) 0 (;@6;) 4 (;@2;)
              end
              global.get 0
              i32.const 5243088
              i32.add
              i32.load
              local.tee 0
              global.get 0
              i32.const 5243104
              i32.add
              i32.load
              i32.eq
              local.get 0
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243088
                i32.add
                global.get 0
                i32.const 5243088
                i32.add
                i32.load
                i32.const 1
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243104
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 0
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 0
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              else
                i32.const 0
                local.set 0
              end
              global.get 0
              i32.const 5243092
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243108
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243092
                i32.add
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243108
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243096
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243112
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243096
                i32.add
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243112
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243100
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243116
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243100
                i32.add
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243116
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243104
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243120
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243104
                i32.add
                global.get 0
                i32.const 5243104
                i32.add
                i32.load
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243120
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243108
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243124
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243108
                i32.add
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243124
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243112
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243128
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243112
                i32.add
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243128
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243116
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243132
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243116
                i32.add
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243132
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243120
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243136
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243120
                i32.add
                global.get 0
                i32.const 5243120
                i32.add
                i32.load
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243136
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243124
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243140
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243124
                i32.add
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243140
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243128
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243144
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              if  ;; label = @6
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                global.get 0
                i32.const 5243128
                i32.add
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                i32.store
                global.get 0
                i32.const 5243164
                i32.add
                global.get 0
                i32.const 5243164
                i32.add
                i32.load
                i32.const -1
                i32.add
                i32.store
                global.get 0
                i32.const 5243144
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243160
                i32.add
                global.get 0
                local.get 1
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                local.get 0
                i32.add
                local.tee 0
                i32.store
                global.get 0
                i32.const 5243156
                i32.add
                local.get 1
                global.get 0
                i32.const 5243156
                i32.add
                i32.load
                i32.add
                i32.store
              end
              global.get 0
              i32.const 5243132
              i32.add
              i32.load
              local.tee 1
              global.get 0
              i32.const 5243148
              i32.add
              i32.load
              i32.eq
              local.get 1
              i32.const 0
              i32.ne
              i32.and
              i32.eqz
              if  ;; label = @6
                return
              end
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              global.get 0
              i32.const 5243132
              i32.add
              local.get 1
              i32.const 1
              i32.add
              local.tee 1
              i32.store
              global.get 0
              i32.const 5243164
              i32.add
              global.get 0
              i32.const 5243164
              i32.add
              i32.load
              i32.const -1
              i32.add
              i32.store
              global.get 0
              i32.const 5243148
              i32.add
              i32.const 0
              i32.store
              br 4 (;@1;)
            end
            local.get 0
            local.set 3
            loop  ;; label = @5
              local.get 3
              i32.const -1
              i32.add
              local.set 4
              global.get 0
              i32.const 5243088
              i32.add
              local.get 3
              i32.const 4
              i32.shl
              i32.add
              local.tee 0
              i32.load
              local.tee 2
              if  ;; label = @6
                local.get 2
                global.get 0
                i32.const 5243088
                i32.add
                local.get 4
                i32.const 4
                i32.shl
                i32.add
                local.tee 2
                i32.load
                i32.eq
                if  ;; label = @7
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  local.get 0
                  local.get 0
                  i32.load
                  i32.const 1
                  i32.add
                  local.tee 0
                  i32.store
                  global.get 0
                  i32.const 5243164
                  i32.add
                  global.get 0
                  i32.const 5243164
                  i32.add
                  i32.load
                  i32.const -1
                  i32.add
                  i32.store
                  local.get 2
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243160
                  i32.add
                  global.get 0
                  local.get 0
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  local.tee 2
                  local.get 1
                  i32.add
                  local.tee 0
                  i32.store
                  global.get 0
                  i32.const 5243156
                  i32.add
                  local.get 2
                  global.get 0
                  i32.const 5243156
                  i32.add
                  i32.load
                  i32.add
                  i32.store
                else
                  local.get 1
                  local.set 0
                end
              else
                local.get 1
                local.set 0
              end
              global.get 0
              local.get 3
              i32.const 4
              i32.shl
              i32.add
              i32.const 5243092
              i32.add
              local.tee 2
              i32.load
              local.tee 1
              if  ;; label = @6
                local.get 1
                global.get 0
                local.get 4
                i32.const 4
                i32.shl
                i32.add
                i32.const 5243092
                i32.add
                local.tee 5
                i32.load
                i32.eq
                if  ;; label = @7
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  local.get 2
                  local.get 1
                  i32.const 1
                  i32.add
                  local.tee 1
                  i32.store
                  global.get 0
                  i32.const 5243164
                  i32.add
                  global.get 0
                  i32.const 5243164
                  i32.add
                  i32.load
                  i32.const -1
                  i32.add
                  i32.store
                  local.get 5
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243160
                  i32.add
                  global.get 0
                  local.get 1
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  local.tee 1
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store
                  global.get 0
                  i32.const 5243156
                  i32.add
                  local.get 1
                  global.get 0
                  i32.const 5243156
                  i32.add
                  i32.load
                  i32.add
                  i32.store
                end
              end
              global.get 0
              local.get 3
              i32.const 4
              i32.shl
              i32.add
              i32.const 5243096
              i32.add
              local.tee 2
              i32.load
              local.tee 1
              if  ;; label = @6
                local.get 1
                global.get 0
                local.get 4
                i32.const 4
                i32.shl
                i32.add
                i32.const 5243096
                i32.add
                local.tee 5
                i32.load
                i32.eq
                if  ;; label = @7
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  local.get 2
                  local.get 1
                  i32.const 1
                  i32.add
                  local.tee 1
                  i32.store
                  global.get 0
                  i32.const 5243164
                  i32.add
                  global.get 0
                  i32.const 5243164
                  i32.add
                  i32.load
                  i32.const -1
                  i32.add
                  i32.store
                  local.get 5
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243160
                  i32.add
                  global.get 0
                  local.get 1
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  local.tee 1
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store
                  global.get 0
                  i32.const 5243156
                  i32.add
                  local.get 1
                  global.get 0
                  i32.const 5243156
                  i32.add
                  i32.load
                  i32.add
                  i32.store
                end
              end
              global.get 0
              local.get 3
              i32.const 4
              i32.shl
              i32.add
              i32.const 5243100
              i32.add
              local.tee 1
              i32.load
              local.tee 2
              if  ;; label = @6
                local.get 2
                global.get 0
                local.get 4
                i32.const 4
                i32.shl
                i32.add
                i32.const 5243100
                i32.add
                local.tee 5
                i32.load
                i32.eq
                if  ;; label = @7
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  local.get 1
                  local.get 2
                  i32.const 1
                  i32.add
                  i32.store
                  global.get 0
                  i32.const 5243164
                  i32.add
                  global.get 0
                  i32.const 5243164
                  i32.add
                  i32.load
                  i32.const -1
                  i32.add
                  i32.store
                  local.get 5
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243160
                  i32.add
                  global.get 0
                  local.get 1
                  i32.load
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  local.tee 1
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store
                  global.get 0
                  i32.const 5243156
                  i32.add
                  local.get 1
                  global.get 0
                  i32.const 5243156
                  i32.add
                  i32.load
                  i32.add
                  i32.store
                end
              end
              local.get 3
              i32.const 1
              i32.gt_u
              if  ;; label = @6
                local.get 0
                local.set 1
                local.get 4
                local.set 3
                br 1 (;@5;)
              end
            end
            return
          end
          global.get 0
          i32.const 5243100
          i32.add
          i32.load
          local.tee 0
          global.get 0
          i32.const 5243096
          i32.add
          i32.load
          i32.eq
          local.get 0
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243100
            i32.add
            global.get 0
            i32.const 5243100
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243096
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 0
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 0
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          else
            i32.const 0
            local.set 0
          end
          global.get 0
          i32.const 5243116
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243112
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243116
            i32.add
            global.get 0
            i32.const 5243116
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243112
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243132
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243128
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243132
            i32.add
            global.get 0
            i32.const 5243132
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243128
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243148
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243144
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243148
            i32.add
            global.get 0
            i32.const 5243148
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243144
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243096
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243092
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243096
            i32.add
            global.get 0
            i32.const 5243096
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243092
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243112
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243108
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243112
            i32.add
            global.get 0
            i32.const 5243112
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243108
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243128
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243124
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243128
            i32.add
            global.get 0
            i32.const 5243128
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243124
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243144
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243140
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243144
            i32.add
            global.get 0
            i32.const 5243144
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243140
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243092
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243088
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243092
            i32.add
            global.get 0
            i32.const 5243092
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243088
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243108
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243104
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243108
            i32.add
            global.get 0
            i32.const 5243108
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243104
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243124
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243120
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          if  ;; label = @4
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            global.get 0
            i32.const 5243124
            i32.add
            global.get 0
            i32.const 5243124
            i32.add
            i32.load
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            global.get 0
            i32.const 5243164
            i32.add
            global.get 0
            i32.const 5243164
            i32.add
            i32.load
            i32.const -1
            i32.add
            i32.store
            global.get 0
            i32.const 5243120
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243160
            i32.add
            global.get 0
            local.get 1
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.add
            local.tee 0
            i32.store
            global.get 0
            i32.const 5243156
            i32.add
            local.get 1
            global.get 0
            i32.const 5243156
            i32.add
            i32.load
            i32.add
            i32.store
          end
          global.get 0
          i32.const 5243140
          i32.add
          i32.load
          local.tee 1
          global.get 0
          i32.const 5243136
          i32.add
          i32.load
          i32.eq
          local.get 1
          i32.const 0
          i32.ne
          i32.and
          i32.eqz
          if  ;; label = @4
            return
          end
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243140
          i32.add
          global.get 0
          i32.const 5243140
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243136
          i32.add
          i32.const 0
          i32.store
          br 2 (;@1;)
        end
        global.get 0
        i32.const 5243088
        i32.add
        i32.load
        local.tee 0
        global.get 0
        i32.const 5243092
        i32.add
        i32.load
        i32.eq
        local.get 0
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243088
          i32.add
          global.get 0
          i32.const 5243088
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243092
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 0
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 0
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        else
          i32.const 0
          local.set 0
        end
        global.get 0
        i32.const 5243104
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243108
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243104
          i32.add
          global.get 0
          i32.const 5243104
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243108
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 1
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243120
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243124
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243120
          i32.add
          global.get 0
          i32.const 5243120
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243124
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          local.get 1
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243136
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243140
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243136
          i32.add
          global.get 0
          i32.const 5243136
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243140
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 1
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243092
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243096
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243092
          i32.add
          global.get 0
          i32.const 5243092
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243096
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 1
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243108
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243112
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243108
          i32.add
          global.get 0
          i32.const 5243108
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243112
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 1
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243124
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243128
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243124
          i32.add
          global.get 0
          i32.const 5243124
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243128
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 1
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243140
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243144
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243140
          i32.add
          global.get 0
          i32.const 5243140
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243144
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 1
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243096
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243100
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243096
          i32.add
          global.get 0
          i32.const 5243096
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243100
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 1
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243112
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243116
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243112
          i32.add
          global.get 0
          i32.const 5243112
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243116
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 1
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243128
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243132
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          global.get 0
          i32.const 5243152
          i32.add
          i32.const 1
          i32.store
          global.get 0
          i32.const 5243128
          i32.add
          global.get 0
          i32.const 5243128
          i32.add
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          global.get 0
          i32.const 5243164
          i32.add
          global.get 0
          i32.const 5243164
          i32.add
          i32.load
          i32.const -1
          i32.add
          i32.store
          global.get 0
          i32.const 5243132
          i32.add
          i32.const 0
          i32.store
          global.get 0
          i32.const 5243160
          i32.add
          global.get 0
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 1
          local.get 0
          i32.add
          local.tee 0
          i32.store
          global.get 0
          i32.const 5243156
          i32.add
          local.get 1
          global.get 0
          i32.const 5243156
          i32.add
          i32.load
          i32.add
          i32.store
        end
        global.get 0
        i32.const 5243144
        i32.add
        i32.load
        local.tee 1
        global.get 0
        i32.const 5243148
        i32.add
        i32.load
        i32.eq
        local.get 1
        i32.const 0
        i32.ne
        i32.and
        i32.eqz
        if  ;; label = @3
          return
        end
        global.get 0
        i32.const 5243152
        i32.add
        i32.const 1
        i32.store
        global.get 0
        i32.const 5243144
        i32.add
        global.get 0
        i32.const 5243144
        i32.add
        i32.load
        i32.const 1
        i32.add
        local.tee 1
        i32.store
        global.get 0
        i32.const 5243164
        i32.add
        global.get 0
        i32.const 5243164
        i32.add
        i32.load
        i32.const -1
        i32.add
        i32.store
        global.get 0
        i32.const 5243148
        i32.add
        i32.const 0
        i32.store
        global.get 0
        i32.const 5243160
        i32.add
        global.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee 1
        local.get 0
        i32.add
        i32.store
        global.get 0
        i32.const 5243156
        i32.add
        local.get 1
        global.get 0
        i32.const 5243156
        i32.add
        i32.load
        i32.add
        i32.store
      end
      return
    end
    global.get 0
    i32.const 5243160
    i32.add
    global.get 0
    local.get 1
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee 1
    local.get 0
    i32.add
    i32.store
    global.get 0
    i32.const 5243156
    i32.add
    local.get 1
    global.get 0
    i32.const 5243156
    i32.add
    i32.load
    i32.add
    i32.store)
  (func (;12;) (type 3) (param i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 1
              i32.sub
              br_table 3 (;@2;) 2 (;@3;) 1 (;@4;) 0 (;@5;) 4 (;@1;)
            end
            loop  ;; label = @5
              global.get 0
              i32.const 5243088
              i32.add
              i32.load
              if (result i32)  ;; label = @6
                i32.const 1
              else
                global.get 0
                i32.const 5243104
                i32.add
                i32.load
                local.tee 0
                if (result i32)  ;; label = @7
                  global.get 0
                  i32.const 5243088
                  i32.add
                  local.get 0
                  i32.store
                  global.get 0
                  i32.const 5243104
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                else
                  i32.const 1
                end
              end
              local.set 0
              global.get 0
              i32.const 5243092
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243108
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243092
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243108
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243096
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243112
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243096
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243112
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243100
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243116
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243100
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243116
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243104
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243120
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243104
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243120
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243108
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243124
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243108
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243124
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243112
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243128
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243112
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243128
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243116
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243132
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243116
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243132
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243120
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243136
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243120
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243136
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243124
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243140
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243124
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243140
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243128
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243144
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243128
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243144
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              global.get 0
              i32.const 5243132
              i32.add
              i32.load
              i32.eqz
              if  ;; label = @6
                global.get 0
                i32.const 5243148
                i32.add
                i32.load
                local.tee 1
                if  ;; label = @7
                  global.get 0
                  i32.const 5243132
                  i32.add
                  local.get 1
                  i32.store
                  global.get 0
                  i32.const 5243148
                  i32.add
                  i32.const 0
                  i32.store
                  global.get 0
                  i32.const 5243152
                  i32.add
                  i32.const 1
                  i32.store
                  i32.const 0
                  local.set 0
                end
              end
              call 10
              i32.const 40000
              call 9
              drop
              local.get 0
              i32.eqz
              br_if 0 (;@5;)
            end
            return
          end
          loop  ;; label = @4
            global.get 0
            i32.const 5243136
            i32.add
            i32.load
            if (result i32)  ;; label = @5
              i32.const 1
            else
              global.get 0
              i32.const 5243120
              i32.add
              i32.load
              local.tee 0
              if (result i32)  ;; label = @6
                global.get 0
                i32.const 5243136
                i32.add
                local.get 0
                i32.store
                global.get 0
                i32.const 5243120
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
              else
                i32.const 1
              end
            end
            local.set 0
            global.get 0
            i32.const 5243140
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243124
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243140
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243124
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243144
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243128
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243144
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243128
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243148
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243132
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243148
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243132
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243120
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243104
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243120
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243104
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243124
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243108
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243124
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243108
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243128
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243112
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243128
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243112
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243132
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243116
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243132
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243116
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243104
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243088
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243104
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243088
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243108
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243092
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243108
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243092
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243112
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243096
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243112
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243096
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            global.get 0
            i32.const 5243116
            i32.add
            i32.load
            i32.eqz
            if  ;; label = @5
              global.get 0
              i32.const 5243100
              i32.add
              i32.load
              local.tee 1
              if  ;; label = @6
                global.get 0
                i32.const 5243116
                i32.add
                local.get 1
                i32.store
                global.get 0
                i32.const 5243100
                i32.add
                i32.const 0
                i32.store
                global.get 0
                i32.const 5243152
                i32.add
                i32.const 1
                i32.store
                i32.const 0
                local.set 0
              end
            end
            call 10
            i32.const 40000
            call 9
            drop
            local.get 0
            i32.eqz
            br_if 0 (;@4;)
          end
          return
        end
        loop  ;; label = @3
          global.get 0
          i32.const 5243100
          i32.add
          i32.load
          if (result i32)  ;; label = @4
            i32.const 1
          else
            global.get 0
            i32.const 5243096
            i32.add
            i32.load
            local.tee 0
            if (result i32)  ;; label = @5
              global.get 0
              i32.const 5243100
              i32.add
              local.get 0
              i32.store
              global.get 0
              i32.const 5243096
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
            else
              i32.const 1
            end
          end
          local.set 0
          global.get 0
          i32.const 5243116
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243112
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243116
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243112
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243132
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243128
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243132
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243128
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243148
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243144
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243148
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243144
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243096
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243092
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243096
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243092
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243112
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243108
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243112
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243108
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243128
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243124
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243128
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243124
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243144
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243140
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243144
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243140
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243092
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243088
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243092
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243088
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243108
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243104
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243108
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243104
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243124
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243120
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243124
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243120
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          global.get 0
          i32.const 5243140
          i32.add
          i32.load
          i32.eqz
          if  ;; label = @4
            global.get 0
            i32.const 5243136
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              global.get 0
              i32.const 5243140
              i32.add
              local.get 1
              i32.store
              global.get 0
              i32.const 5243136
              i32.add
              i32.const 0
              i32.store
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 1
              i32.store
              i32.const 0
              local.set 0
            end
          end
          call 10
          i32.const 40000
          call 9
          drop
          local.get 0
          i32.eqz
          br_if 0 (;@3;)
        end
        return
      end
      loop  ;; label = @2
        global.get 0
        i32.const 5243088
        i32.add
        i32.load
        if (result i32)  ;; label = @3
          i32.const 1
        else
          global.get 0
          i32.const 5243092
          i32.add
          i32.load
          local.tee 0
          if (result i32)  ;; label = @4
            global.get 0
            i32.const 5243088
            i32.add
            local.get 0
            i32.store
            global.get 0
            i32.const 5243092
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
          else
            i32.const 1
          end
        end
        local.set 0
        global.get 0
        i32.const 5243104
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243108
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243104
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243108
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243120
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243124
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243120
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243124
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243136
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243140
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243136
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243140
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243092
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243096
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243092
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243096
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243108
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243112
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243108
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243112
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243124
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243128
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243124
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243128
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243140
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243144
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243140
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243144
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243096
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243100
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243096
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243100
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243112
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243116
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243112
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243116
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243128
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243132
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243128
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243132
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        global.get 0
        i32.const 5243144
        i32.add
        i32.load
        i32.eqz
        if  ;; label = @3
          global.get 0
          i32.const 5243148
          i32.add
          i32.load
          local.tee 1
          if  ;; label = @4
            global.get 0
            i32.const 5243144
            i32.add
            local.get 1
            i32.store
            global.get 0
            i32.const 5243148
            i32.add
            i32.const 0
            i32.store
            global.get 0
            i32.const 5243152
            i32.add
            i32.const 1
            i32.store
            i32.const 0
            local.set 0
          end
        end
        call 10
        i32.const 40000
        call 9
        drop
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
      end
    end)
  (func (;13;) (type 0) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block (result i32)  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            global.get 0
            i32.const 5243088
            i32.add
            i32.load
            local.tee 1
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 1
          global.get 0
          i32.const 5243104
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          global.get 0
          i32.const 5243092
          i32.add
          i32.load
          local.tee 1
          i32.eq
          br_if 0 (;@3;)
          i32.const -1
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243092
        i32.add
        i32.load
        local.set 1
        i32.const 0
      end
      local.set 2
      block (result i32)  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 1
          global.get 0
          i32.const 5243108
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          global.get 0
          i32.const 5243096
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243096
        i32.add
        i32.load
        local.set 0
        i32.const 0
      end
      local.set 1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243112
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          global.get 0
          i32.const 5243100
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243100
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243116
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            global.get 0
            i32.const 5243104
            i32.add
            i32.load
            local.tee 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243120
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          global.get 0
          i32.const 5243108
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243108
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243124
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          global.get 0
          i32.const 5243112
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243112
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243128
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          global.get 0
          i32.const 5243116
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243116
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243132
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            global.get 0
            i32.const 5243120
            i32.add
            i32.load
            local.tee 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243136
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          global.get 0
          i32.const 5243124
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243124
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243140
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          global.get 0
          i32.const 5243128
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243128
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243144
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          global.get 0
          i32.const 5243132
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243132
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243148
          i32.add
          i32.load
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            global.get 0
            i32.const 5243136
            i32.add
            i32.load
            local.tee 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243140
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243140
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243144
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243144
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 1 (;@3;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 0 (;@4;) 3 (;@1;) 0 (;@4;)
          end
          local.get 0
          global.get 0
          i32.const 5243148
          i32.add
          i32.load
          local.tee 0
          i32.eq
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        global.get 0
        i32.const 5243148
        i32.add
        i32.load
        local.set 0
        i32.const 0
        local.set 1
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          br_table 0 (;@3;) 1 (;@2;) 1 (;@2;) 1 (;@2;) 1 (;@2;) 1 (;@2;) 1 (;@2;) 1 (;@2;) 1 (;@2;) 1 (;@2;) 1 (;@2;) 2 (;@1;) 1 (;@2;)
        end
        i32.const 0
        local.set 1
      end
      local.get 1
      return
    end
    i32.const 1)
  (func (;14;) (type 5)
    (local i32 i32)
    global.get 0
    i32.const 5243164
    i32.add
    i32.load
    i32.const 15
    i32.gt_s
    if  ;; label = @1
      return
    end
    call 4
    i32.const 16
    global.get 0
    i32.const 5243164
    i32.add
    i32.load
    i32.sub
    i32.rem_s
    local.set 1
    block (result i32)  ;; label = @1
      block  ;; label = @2
        global.get 0
        i32.const 5243088
        i32.add
        i32.load
        if (result i32)  ;; label = @3
          br 1 (;@2;)
        else
          local.get 1
          if (result i32)  ;; label = @4
            i32.const 1
            local.set 0
            br 2 (;@2;)
          else
            global.get 0
            i32.const 5243088
            i32.add
          end
        end
        br 1 (;@1;)
      end
      global.get 0
      i32.const 5243092
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243092
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243096
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243096
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243100
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243100
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243104
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243104
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243108
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243108
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243112
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243112
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243116
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243116
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243120
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243120
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243124
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243124
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243128
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243128
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243132
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243132
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243136
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243136
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243140
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243140
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243144
      i32.add
      i32.load
      i32.eqz
      if  ;; label = @2
        global.get 0
        i32.const 5243144
        i32.add
        local.get 0
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
      end
      global.get 0
      i32.const 5243148
      i32.add
      i32.load
      i32.eqz
      local.get 0
      local.get 1
      i32.eq
      i32.and
      if (result i32)  ;; label = @2
        global.get 0
        i32.const 5243148
        i32.add
      else
        return
      end
    end
    i32.const 1
    i32.const 2
    call 4
    i32.const 10
    i32.rem_s
    select
    i32.store
    global.get 0
    i32.const 5243164
    i32.add
    global.get 0
    i32.const 5243164
    i32.add
    i32.load
    i32.const 1
    i32.add
    i32.store)
  (func (;15;) (type 0) (result i32)
    (local i32 i32 i32)
    i32.const 0
    global.get 0
    i32.const 5243168
    i32.add
    call 6
    drop
    global.get 0
    i32.const 5243168
    i32.add
    local.set 0
    global.get 0
    i32.const 5243228
    i32.add
    local.tee 1
    i32.const 60
    i32.add
    local.set 2
    loop  ;; label = @1
      local.get 1
      local.get 0
      i32.load
      i32.store
      local.get 0
      i32.const 4
      i32.add
      local.set 0
      local.get 1
      i32.const 4
      i32.add
      local.tee 1
      local.get 2
      i32.lt_s
      br_if 0 (;@1;)
    end
    global.get 0
    i32.const 5243240
    i32.add
    global.get 0
    i32.const 5243240
    i32.add
    i32.load
    i32.const -11
    i32.and
    i32.store
    i32.const 0
    i32.const 0
    global.get 0
    i32.const 5243228
    i32.add
    call 7
    drop
    i32.const 0
    call 8
    call 5
    call 14
    call 14
    call 10
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          call 0
                          i32.const 27
                          i32.sub
                          br_table 4 (;@7;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 0 (;@11;) 7 (;@4;) 7 (;@4;) 1 (;@10;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 0 (;@11;) 7 (;@4;) 2 (;@9;) 3 (;@8;) 1 (;@10;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 10 (;@1;) 7 (;@4;) 2 (;@9;) 7 (;@4;) 7 (;@4;) 7 (;@4;) 3 (;@8;) 7 (;@4;)
                        end
                        i32.const 4
                        local.set 0
                        br 4 (;@6;)
                      end
                      i32.const 3
                      local.set 0
                      br 3 (;@6;)
                    end
                    i32.const 2
                    local.set 0
                    br 2 (;@6;)
                  end
                  i32.const 1
                  local.set 0
                  br 1 (;@6;)
                end
                call 0
                i32.const 91
                i32.eq
                if  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            call 0
                            i32.const 65
                            i32.sub
                            br_table 0 (;@12;) 1 (;@11;) 2 (;@10;) 3 (;@9;) 4 (;@8;)
                          end
                          i32.const 1
                          local.set 0
                          br 5 (;@6;)
                        end
                        i32.const 2
                        local.set 0
                        br 4 (;@6;)
                      end
                      i32.const 3
                      local.set 0
                      br 3 (;@6;)
                    end
                    i32.const 4
                    local.set 0
                    br 2 (;@6;)
                  end
                else
                  i32.const -1
                  local.set 0
                  br 1 (;@6;)
                end
                br 2 (;@4;)
              end
              global.get 0
              i32.const 5243152
              i32.add
              i32.const 0
              i32.store
              local.get 0
              call 12
              local.get 0
              call 11
              local.get 0
              call 12
              global.get 0
              i32.const 5243152
              i32.add
              i32.load
              if  ;; label = @6
                call 14
              end
              call 10
              block  ;; label = @6
                i32.const 10
                i32.const 11
                i32.const 0
                call 13
                local.tee 0
                i32.const 1
                i32.eq
                select
                local.get 0
                i32.const -1
                i32.eq
                select
                i32.const 15
                i32.and
                br_table 0 (;@6;) 4 (;@2;) 4 (;@2;) 4 (;@2;) 4 (;@2;) 4 (;@2;) 4 (;@2;) 4 (;@2;) 4 (;@2;) 4 (;@2;) 1 (;@5;) 3 (;@3;) 4 (;@2;)
              end
              br 1 (;@4;)
            end
          end
          global.get 0
          i32.const 193
          i32.add
          call 3
          drop
          br 2 (;@1;)
        end
        global.get 0
        i32.const 184
        i32.add
        call 3
        drop
        br 1 (;@1;)
      end
      i32.const 0
      return
    end
    i32.const 0
    i32.const 0
    global.get 0
    i32.const 5243168
    i32.add
    call 7
    drop
    i32.const 0)
  (func (;16;) (type 5)
    global.get 0
    global.get 0
    i32.load offset=48
    global.get 0
    i32.const 96
    i32.add
    i32.add
    i32.store offset=48
    global.get 0
    global.get 0
    i32.load offset=52
    global.get 0
    i32.const 99
    i32.add
    i32.add
    i32.store offset=52
    global.get 0
    global.get 0
    i32.load offset=56
    global.get 0
    i32.const 102
    i32.add
    i32.add
    i32.store offset=56
    global.get 0
    global.get 0
    i32.load offset=60
    global.get 0
    i32.const 105
    i32.add
    i32.add
    i32.store offset=60
    global.get 0
    i32.const -64
    i32.sub
    global.get 0
    i32.const -64
    i32.sub
    i32.load
    global.get 0
    i32.const 108
    i32.add
    i32.add
    i32.store
    global.get 0
    global.get 0
    i32.load offset=68
    global.get 0
    i32.const 111
    i32.add
    i32.add
    i32.store offset=68
    global.get 0
    global.get 0
    i32.load offset=72
    global.get 0
    i32.const 114
    i32.add
    i32.add
    i32.store offset=72
    global.get 0
    global.get 0
    i32.load offset=76
    global.get 0
    i32.const 117
    i32.add
    i32.add
    i32.store offset=76
    global.get 0
    global.get 0
    i32.load offset=80
    global.get 0
    i32.const 120
    i32.add
    i32.add
    i32.store offset=80
    global.get 0
    global.get 0
    i32.load offset=84
    global.get 0
    i32.const 123
    i32.add
    i32.add
    i32.store offset=84
    global.get 0
    global.get 0
    i32.load offset=88
    global.get 0
    i32.const 126
    i32.add
    i32.add
    i32.store offset=88
    global.get 0
    global.get 0
    i32.load offset=92
    global.get 0
    i32.const 129
    i32.add
    i32.add
    i32.store offset=92)
  (func (;17;) (type 5)
    global.get 0
    i32.const 208
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2
    call 16)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) i32 (i32.const 48))
  (global (;4;) i32 (i32.const 5243088))
  (global (;5;) i32 (i32.const 5243228))
  (global (;6;) i32 (i32.const 5243168))
  (global (;7;) i32 (i32.const 184))
  (global (;8;) i32 (i32.const 0))
  (export "__post_instantiate" (func 17))
  (export "_main" (func 15))
  (export "_colors" (global 3))
  (export "_game" (global 4))
  (export "_newt" (global 5))
  (export "_oldt" (global 6))
  (export "_str" (global 7))
  (export "_values" (global 8))
  (data (;0;) (global.get 0) "\00\00\00\00\02\00\00\00\04\00\00\00\08\00\00\00\10\00\00\00 \00\00\00@\00\00\00\80\00\00\00\00\01\00\00\00\02\00\00\00\04\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0039\0031\0032\0033\0034\0035\0036\0037\0091\0092\0093\0094\00\1b[2J\1b[HScore: %ld\00 (+%ld)\00\1b[7m\1b[%sm%*zd \1b[0m|\00%*s |\00You win!\00You lose!"))
