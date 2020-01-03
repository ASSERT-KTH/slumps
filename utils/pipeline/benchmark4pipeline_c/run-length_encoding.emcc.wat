(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32 i32)))
  (type (;6;) (func (param i32 i32 i32) (result i32)))
  (type (;7;) (func (result f64)))
  (import "env" "abort" (func (;0;) (type 3)))
  (import "env" "_fputc" (func (;1;) (type 0)))
  (import "env" "g$_stdout" (func (;2;) (type 4)))
  (import "env" "fp$_file_put$iii" (func (;3;) (type 4)))
  (import "env" "fp$_sget$ii" (func (;4;) (type 4)))
  (import "env" "fp$_sput$iii" (func (;5;) (type 4)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "__table_base" (global (;1;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (import "env" "table" (table (;0;) 2 funcref))
  (func (;6;) (type 1) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load offset=12
    local.tee 1
    local.get 0
    i32.load offset=8
    i32.add
    i32.load8_s
    local.tee 2
    i32.eqz
    if  ;; label = @1
      i32.const -1
      return
    end
    local.get 0
    local.get 1
    i32.const 1
    i32.add
    i32.store offset=12
    local.get 2
    i32.const 255
    i32.and)
  (func (;7;) (type 0) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load offset=8
    local.get 0
    local.get 0
    i32.load offset=12
    local.tee 3
    i32.const 1
    i32.add
    i32.store offset=12
    local.get 3
    i32.add
    i32.const 0
    local.get 1
    i32.const 255
    i32.and
    local.get 1
    i32.const -1
    i32.eq
    local.tee 1
    select
    i32.store8
    local.get 1
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    i32.const 0
    i32.store offset=12
    i32.const 0)
  (func (;8;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load offset=8
    call 1)
  (func (;9;) (type 5) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 2
    local.set 4
    global.get 2
    i32.const 256
    i32.add
    global.set 2
    local.get 0
    i32.load
    local.set 9
    local.get 1
    i32.load offset=4
    local.set 7
    loop  ;; label = @1
      local.get 0
      local.get 9
      call_indirect (type 1)
      local.tee 6
      i32.const -1
      i32.eq
      if (result i32)  ;; label = @2
        i32.const 1
      else
        block (result i32)  ;; label = @3
          local.get 2
          local.set 5
          loop (result i32)  ;; label = @4
            local.get 5
            i32.const 1
            i32.add
            local.set 2
            local.get 4
            local.get 5
            i32.add
            local.get 6
            i32.store8
            i32.const 0
            local.get 5
            i32.const 1
            i32.ge_s
            br_if 1 (;@3;)
            drop
            local.get 0
            local.get 9
            call_indirect (type 1)
            local.tee 6
            i32.const -1
            i32.eq
            if (result i32)  ;; label = @5
              i32.const 1
            else
              local.get 2
              local.set 5
              br 1 (;@4;)
            end
          end
        end
      end
      local.set 6
      local.get 4
      local.get 2
      i32.const -1
      i32.add
      local.tee 10
      i32.add
      i32.load8_s
      local.tee 8
      local.get 4
      local.get 2
      i32.const -2
      i32.add
      local.tee 11
      i32.add
      i32.load8_s
      i32.eq
      local.set 5
      local.get 3
      if  ;; label = @2
        local.get 6
        local.get 3
        i32.const 0
        local.get 5
        select
        local.tee 5
        i32.eqz
        local.get 2
        i32.const 129
        i32.eq
        i32.or
        i32.or
        if  ;; label = @3
          local.get 1
          local.get 2
          local.get 10
          local.get 6
          select
          local.get 7
          call_indirect (type 0)
          drop
          local.get 1
          local.get 4
          i32.load8_u
          local.get 7
          call_indirect (type 0)
          drop
          local.get 4
          local.get 8
          i32.store8
          i32.const 1
          local.set 2
          local.get 5
          local.set 3
        end
      else
        block  ;; label = @3
          local.get 5
          if (result i32)  ;; label = @4
            local.get 2
            i32.const 2
            i32.le_s
            if  ;; label = @5
              i32.const 1
              local.set 3
              br 2 (;@3;)
            end
            local.get 1
            local.get 2
            i32.const 126
            i32.add
            local.get 1
            i32.load offset=4
            call_indirect (type 0)
            drop
            i32.const 0
            local.set 2
            loop  ;; label = @5
              local.get 1
              local.get 2
              local.get 4
              i32.add
              i32.load8_u
              local.get 1
              i32.load offset=4
              call_indirect (type 0)
              drop
              local.get 11
              local.get 2
              i32.const 1
              i32.add
              local.tee 2
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 4
            local.get 8
            i32.store8 offset=1
            local.get 4
            local.get 8
            i32.store8
            i32.const 1
            local.set 3
            i32.const 2
          else
            local.get 6
            local.get 2
            i32.const 128
            i32.eq
            i32.or
            i32.eqz
            if  ;; label = @5
              i32.const 0
              local.set 3
              br 2 (;@3;)
            end
            local.get 1
            local.get 2
            i32.const 128
            i32.add
            local.get 1
            i32.load offset=4
            call_indirect (type 0)
            drop
            local.get 2
            i32.const 0
            i32.le_s
            if  ;; label = @5
              i32.const 0
              local.set 2
              i32.const 0
              local.set 3
              br 2 (;@3;)
            end
            i32.const 0
            local.set 3
            loop (result i32)  ;; label = @5
              local.get 1
              local.get 3
              local.get 4
              i32.add
              i32.load8_u
              local.get 1
              i32.load offset=4
              call_indirect (type 0)
              drop
              local.get 2
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              local.set 3
              i32.const 0
            end
          end
          local.set 2
        end
      end
      local.get 6
      i32.eqz
      br_if 0 (;@1;)
    end
    local.get 1
    i32.const -1
    local.get 7
    call_indirect (type 0)
    drop
    local.get 4
    global.set 2)
  (func (;10;) (type 4) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 2
    local.set 3
    global.get 2
    i32.const 304
    i32.add
    global.set 2
    call 2
    local.set 4
    call 3
    local.set 5
    call 4
    local.set 2
    call 5
    local.set 6
    local.get 3
    i32.const 288
    i32.add
    local.tee 0
    global.get 0
    i32.load
    i32.store
    local.get 0
    global.get 0
    i32.load offset=4
    i32.store offset=4
    local.get 0
    global.get 0
    i32.load offset=8
    i32.store offset=8
    local.get 0
    global.get 0
    i32.load offset=12
    i32.store offset=12
    local.get 3
    i32.const 272
    i32.add
    local.tee 1
    local.get 2
    i32.store
    local.get 1
    local.get 6
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store offset=8
    local.get 1
    i32.const 0
    i32.store offset=12
    local.get 3
    i32.const 256
    i32.add
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 5
    i32.store offset=4
    local.get 2
    local.get 4
    i32.load
    i32.store offset=8
    local.get 0
    local.get 1
    call 9
    local.get 1
    local.get 1
    i32.load
    call_indirect (type 1)
    local.tee 0
    i32.const -1
    i32.eq
    if  ;; label = @1
      local.get 3
      global.set 2
      i32.const 0
      return
    end
    loop  ;; label = @1
      local.get 0
      i32.const 128
      i32.gt_s
      if  ;; label = @2
        local.get 0
        i32.const -128
        i32.add
        local.set 4
        i32.const 0
        local.set 0
        loop  ;; label = @3
          local.get 2
          i32.load offset=4
          local.set 5
          local.get 2
          local.get 1
          local.get 1
          i32.load
          call_indirect (type 1)
          local.get 5
          call_indirect (type 0)
          drop
          local.get 4
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          i32.ne
          br_if 0 (;@3;)
        end
      else
        local.get 1
        local.get 1
        i32.load
        call_indirect (type 1)
        local.set 5
        local.get 0
        i32.const 0
        i32.gt_s
        if  ;; label = @3
          i32.const 0
          local.set 4
          loop  ;; label = @4
            local.get 2
            local.get 5
            local.get 2
            i32.load offset=4
            call_indirect (type 0)
            drop
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            local.get 0
            i32.ne
            br_if 0 (;@4;)
          end
        end
      end
      local.get 1
      local.get 1
      i32.load
      call_indirect (type 1)
      local.tee 0
      i32.const -1
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 3
    global.set 2
    i32.const 0)
  (func (;11;) (type 2)
    global.get 0
    i32.const 96
    i32.add
    global.set 2
    global.get 2
    i32.const 5242880
    i32.add
    global.set 3
    global.get 0
    global.get 1
    i32.const 1
    i32.add
    i32.store
    global.get 0
    global.get 0
    i32.load offset=8
    global.get 0
    i32.const 16
    i32.add
    i32.add
    i32.store offset=8)
  (func (;12;) (type 3) (param i32)
    local.get 0
    call_indirect (type 2))
  (func (;13;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    call_indirect (type 1))
  (func (;14;) (type 6) (param i32 i32 i32) (result i32)
    local.get 1
    local.get 2
    local.get 0
    call_indirect (type 0))
  (func (;15;) (type 7) (result f64)
    i32.const 0
    call 0
    f64.const 0x0p+0 (;=0;))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 11))
  (export "_file_put" (func 8))
  (export "_main" (func 10))
  (export "_sget" (func 6))
  (export "_sput" (func 7))
  (export "dynCall_X" (func 12))
  (export "dynCall_ii" (func 13))
  (export "dynCall_iii" (func 14))
  (elem (;0;) (global.get 1) 15 6)
  (data (;0;) (global.get 0) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW"))
