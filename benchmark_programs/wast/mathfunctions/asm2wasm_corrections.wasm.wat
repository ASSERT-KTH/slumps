(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32)))
  (type (;6;) (func (param i64 i32 i32) (result i32)))
  (type (;7;) (func (param i64 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32 i32)))
  (type (;9;) (func (param i32 f64 i32 i32 i32 i32) (result i32)))
  (type (;10;) (func (param f64 i32) (result f64)))
  (import "env" "memory" (memory (;0;) 4096 4096))
  (import "env" "table" (table (;0;) 6 6 funcref))
  (import "env" "tableBase" (global (;0;) i32))
  (import "env" "STACKTOP" (global (;1;) i32))
  (import "env" "abort" (func (;0;) (type 2)))
  (import "env" "___syscall140" (func (;1;) (type 3)))
  (import "env" "___syscall146" (func (;2;) (type 3)))
  (import "env" "___syscall54" (func (;3;) (type 3)))
  (import "env" "___syscall6" (func (;4;) (type 3)))
  (import "env" "_emscripten_memcpy_big" (func (;5;) (type 0)))
  (func (;6;) (type 5) (param i32 i32 i32)
    local.get 0
    i32.load
    i32.const 32
    i32.and
    i32.eqz
    if  ;; label = @1
      local.get 1
      local.get 2
      local.get 0
      call 24
      drop
    end)
  (func (;7;) (type 8) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get 2
    local.set 5
    global.get 2
    i32.const 256
    i32.add
    global.set 2
    local.get 2
    local.get 3
    i32.gt_s
    local.get 4
    i32.const 73728
    i32.and
    i32.eqz
    i32.and
    if  ;; label = @1
      local.get 5
      local.get 1
      i32.const 24
      i32.shl
      i32.const 24
      i32.shr_s
      local.get 2
      local.get 3
      i32.sub
      local.tee 1
      i32.const 256
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 1
      else
        i32.const 256
      end
      call 10
      drop
      local.get 1
      i32.const 255
      i32.gt_u
      if  ;; label = @2
        local.get 2
        local.get 3
        i32.sub
        local.set 2
        loop  ;; label = @3
          local.get 0
          local.get 5
          i32.const 256
          call 6
          local.get 1
          i32.const -256
          i32.add
          local.tee 1
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
        end
        local.get 2
        i32.const 255
        i32.and
        local.set 1
      end
      local.get 0
      local.get 5
      local.get 1
      call 6
    end
    local.get 5
    global.set 2)
  (func (;8;) (type 3) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    call 22
    local.set 2
    local.get 1
    if (result i32)  ;; label = @1
      local.get 2
    else
      local.get 0
    end)
  (func (;9;) (type 7) (param i64 i32) (result i32)
    (local i32 i32 i64)
    local.get 0
    i32.wrap_i64
    local.set 2
    local.get 0
    i64.const 4294967295
    i64.gt_u
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 0
        i64.const 10
        i64.rem_u
        i32.wrap_i64
        i32.const 255
        i32.and
        i32.const 48
        i32.or
        i32.store8
        local.get 0
        i64.const 10
        i64.div_u
        local.set 4
        local.get 0
        i64.const 42949672959
        i64.gt_u
        if  ;; label = @3
          local.get 4
          local.set 0
          br 1 (;@2;)
        end
      end
      local.get 4
      i32.wrap_i64
      local.set 2
    end
    local.get 2
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 2
        i32.const 10
        i32.rem_u
        i32.const 48
        i32.or
        i32.store8
        local.get 2
        i32.const 10
        i32.div_u
        local.set 3
        local.get 2
        i32.const 10
        i32.ge_u
        if  ;; label = @3
          local.get 3
          local.set 2
          br 1 (;@2;)
        end
      end
    end
    local.get 1)
  (func (;10;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    local.get 0
    local.get 2
    i32.add
    local.set 4
    local.get 1
    i32.const 255
    i32.and
    local.set 1
    local.get 2
    i32.const 67
    i32.ge_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.store8
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          br 1 (;@2;)
        end
      end
      local.get 4
      i32.const -4
      i32.and
      local.tee 5
      i32.const -64
      i32.add
      local.set 6
      local.get 1
      local.get 1
      i32.const 8
      i32.shl
      i32.or
      local.get 1
      i32.const 16
      i32.shl
      i32.or
      local.get 1
      i32.const 24
      i32.shl
      i32.or
      local.set 3
      loop  ;; label = @2
        local.get 0
        local.get 6
        i32.le_s
        if  ;; label = @3
          local.get 0
          local.get 3
          i32.store
          local.get 0
          local.get 3
          i32.store offset=4
          local.get 0
          local.get 3
          i32.store offset=8
          local.get 0
          local.get 3
          i32.store offset=12
          local.get 0
          local.get 3
          i32.store offset=16
          local.get 0
          local.get 3
          i32.store offset=20
          local.get 0
          local.get 3
          i32.store offset=24
          local.get 0
          local.get 3
          i32.store offset=28
          local.get 0
          local.get 3
          i32.store offset=32
          local.get 0
          local.get 3
          i32.store offset=36
          local.get 0
          local.get 3
          i32.store offset=40
          local.get 0
          local.get 3
          i32.store offset=44
          local.get 0
          local.get 3
          i32.store offset=48
          local.get 0
          local.get 3
          i32.store offset=52
          local.get 0
          local.get 3
          i32.store offset=56
          local.get 0
          local.get 3
          i32.store offset=60
          local.get 0
          i32.const -64
          i32.sub
          local.set 0
          br 1 (;@2;)
        end
      end
      loop  ;; label = @2
        local.get 0
        local.get 5
        i32.lt_s
        if  ;; label = @3
          local.get 0
          local.get 3
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          br 1 (;@2;)
        end
      end
    end
    loop  ;; label = @1
      local.get 0
      local.get 4
      i32.lt_s
      if  ;; label = @2
        local.get 0
        local.get 1
        i32.store8
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end
    local.get 4
    local.get 2
    i32.sub)
  (func (;11;) (type 4) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get 2
    local.set 11
    global.get 2
    i32.const -64
    i32.sub
    global.set 2
    local.get 11
    i32.const 20
    i32.add
    local.set 19
    local.get 11
    i32.const 16
    i32.add
    local.tee 13
    local.get 1
    i32.store
    local.get 0
    i32.const 0
    i32.ne
    local.set 18
    local.get 11
    i32.const 24
    i32.add
    local.tee 1
    i32.const 40
    i32.add
    local.tee 16
    local.set 21
    local.get 1
    i32.const 39
    i32.add
    local.set 22
    local.get 11
    i32.const 8
    i32.add
    local.tee 20
    i32.const 4
    i32.add
    local.set 24
    i32.const 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 12
            i32.const -1
            i32.gt_s
            if  ;; label = @5
              local.get 5
              i32.const 2147483647
              local.get 12
              i32.sub
              i32.gt_s
              if (result i32)  ;; label = @6
                i32.const 4412
                i32.const 75
                i32.store
                i32.const -1
              else
                local.get 5
                local.get 12
                i32.add
              end
              local.set 12
            end
            local.get 13
            i32.load
            local.tee 9
            i32.load8_s
            local.tee 6
            i32.eqz
            br_if 2 (;@2;)
            local.get 9
            local.set 5
            block  ;; label = @5
              block  ;; label = @6
                loop  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 6
                          i32.const 24
                          i32.shl
                          i32.const 24
                          i32.shr_s
                          br_table 1 (;@10;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 2 (;@9;) 0 (;@11;) 2 (;@9;)
                        end
                        local.get 5
                        local.set 6
                        br 4 (;@6;)
                      end
                      br 1 (;@8;)
                    end
                    local.get 13
                    local.get 5
                    i32.const 1
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 5
                    i32.load8_s
                    local.set 6
                    br 1 (;@7;)
                  end
                end
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 6
                i32.load8_s offset=1
                i32.const 37
                i32.ne
                br_if 1 (;@5;)
                local.get 5
                i32.const 1
                i32.add
                local.set 5
                local.get 13
                local.get 6
                i32.const 2
                i32.add
                local.tee 6
                i32.store
                local.get 6
                i32.load8_s
                i32.const 37
                i32.eq
                br_if 0 (;@6;)
              end
            end
            local.get 5
            local.get 9
            i32.sub
            local.set 5
            local.get 18
            if  ;; label = @5
              local.get 0
              local.get 9
              local.get 5
              call 6
            end
            local.get 5
            br_if 1 (;@3;)
            local.get 13
            local.get 13
            i32.load
            local.tee 5
            local.get 13
            i32.load
            i32.load8_s offset=1
            i32.const -48
            i32.add
            i32.const 10
            i32.lt_u
            i32.eqz
            if (result i32)  ;; label = @5
              i32.const -1
              local.set 10
              i32.const 1
            else
              local.get 5
              i32.load8_s offset=2
              i32.const 36
              i32.eq
              if (result i32)  ;; label = @6
                local.get 5
                i32.load8_s offset=1
                i32.const -48
                i32.add
                local.set 10
                i32.const 1
                local.set 1
                i32.const 3
              else
                i32.const -1
                local.set 10
                i32.const 1
              end
            end
            i32.add
            local.tee 5
            i32.store
            local.get 5
            i32.load8_s
            local.tee 8
            i32.const -32
            i32.add
            local.tee 6
            i32.const 31
            i32.gt_u
            i32.const 1
            local.get 6
            i32.shl
            i32.const 75913
            i32.and
            i32.eqz
            i32.or
            if  ;; label = @5
              i32.const 0
              local.set 6
            else
              i32.const 0
              local.set 7
              local.get 8
              local.set 6
              loop  ;; label = @6
                i32.const 1
                local.get 6
                i32.const 24
                i32.shl
                i32.const 24
                i32.shr_s
                i32.const -32
                i32.add
                i32.shl
                local.get 7
                i32.or
                local.set 6
                local.get 13
                local.get 5
                i32.const 1
                i32.add
                local.tee 5
                i32.store
                local.get 5
                i32.load8_s
                local.tee 8
                i32.const -32
                i32.add
                local.tee 7
                i32.const 31
                i32.gt_u
                i32.const 1
                local.get 7
                i32.shl
                i32.const 75913
                i32.and
                i32.eqz
                i32.or
                i32.eqz
                if  ;; label = @7
                  local.get 6
                  local.set 7
                  local.get 8
                  local.set 6
                  br 1 (;@6;)
                end
              end
            end
            block  ;; label = @5
              local.get 8
              i32.const 255
              i32.and
              i32.const 42
              i32.eq
              if (result i32)  ;; label = @6
                block (result i32)  ;; label = @7
                  block  ;; label = @8
                    local.get 5
                    i32.load8_s offset=1
                    i32.const -48
                    i32.add
                    i32.const 10
                    i32.lt_u
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 13
                    i32.load
                    local.tee 5
                    i32.load8_s offset=2
                    i32.const 36
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 5
                    i32.const 1
                    i32.add
                    local.tee 1
                    i32.load8_s
                    i32.const -48
                    i32.add
                    i32.const 2
                    i32.shl
                    i32.add
                    i32.const 10
                    i32.store
                    local.get 3
                    local.get 1
                    i32.load8_s
                    i32.const -48
                    i32.add
                    i32.const 3
                    i32.shl
                    i32.add
                    i64.load
                    i32.wrap_i64
                    local.set 1
                    i32.const 1
                    local.set 7
                    local.get 5
                    i32.const 3
                    i32.add
                    br 1 (;@7;)
                  end
                  local.get 1
                  if  ;; label = @8
                    i32.const -1
                    local.set 12
                    br 4 (;@4;)
                  end
                  local.get 18
                  if  ;; label = @8
                    local.get 2
                    i32.load
                    i32.const 3
                    i32.add
                    i32.const -4
                    i32.and
                    local.tee 5
                    i32.load
                    local.set 1
                    local.get 2
                    local.get 5
                    i32.const 4
                    i32.add
                    i32.store
                  else
                    i32.const 0
                    local.set 1
                  end
                  i32.const 0
                  local.set 7
                  local.get 13
                  i32.load
                  i32.const 1
                  i32.add
                end
                local.set 5
                local.get 13
                local.get 5
                i32.store
                local.get 6
                i32.const 8192
                i32.or
                local.set 8
                i32.const 0
                local.get 1
                i32.sub
                local.set 15
                local.get 1
                i32.const 0
                i32.lt_s
                local.tee 14
                i32.eqz
                if  ;; label = @7
                  local.get 6
                  local.set 8
                end
                local.get 14
                i32.eqz
                if  ;; label = @7
                  local.get 1
                  local.set 15
                end
                local.get 7
                local.set 1
                local.get 5
              else
                local.get 13
                call 16
                local.tee 15
                i32.const 0
                i32.lt_s
                if  ;; label = @7
                  i32.const -1
                  local.set 12
                  br 3 (;@4;)
                end
                local.get 6
                local.set 8
                local.get 13
                i32.load
              end
              local.tee 6
              i32.load8_s
              i32.const 46
              i32.eq
              if  ;; label = @6
                local.get 6
                i32.load8_s offset=1
                i32.const 42
                i32.ne
                if  ;; label = @7
                  local.get 13
                  local.get 6
                  i32.const 1
                  i32.add
                  i32.store
                  local.get 13
                  call 16
                  local.set 5
                  local.get 13
                  i32.load
                  local.set 6
                  br 2 (;@5;)
                end
                local.get 6
                i32.load8_s offset=2
                i32.const -48
                i32.add
                i32.const 10
                i32.lt_u
                if  ;; label = @7
                  local.get 13
                  i32.load
                  local.tee 6
                  i32.load8_s offset=3
                  i32.const 36
                  i32.eq
                  if  ;; label = @8
                    local.get 4
                    local.get 6
                    i32.const 2
                    i32.add
                    local.tee 5
                    i32.load8_s
                    i32.const -48
                    i32.add
                    i32.const 2
                    i32.shl
                    i32.add
                    i32.const 10
                    i32.store
                    local.get 3
                    local.get 5
                    i32.load8_s
                    i32.const -48
                    i32.add
                    i32.const 3
                    i32.shl
                    i32.add
                    i64.load
                    i32.wrap_i64
                    local.set 5
                    local.get 13
                    local.get 6
                    i32.const 4
                    i32.add
                    local.tee 6
                    i32.store
                    br 3 (;@5;)
                  end
                end
                local.get 1
                if  ;; label = @7
                  i32.const -1
                  local.set 12
                  br 3 (;@4;)
                end
                local.get 18
                if  ;; label = @7
                  local.get 2
                  i32.load
                  i32.const 3
                  i32.add
                  i32.const -4
                  i32.and
                  local.tee 6
                  i32.load
                  local.set 5
                  local.get 2
                  local.get 6
                  i32.const 4
                  i32.add
                  i32.store
                else
                  i32.const 0
                  local.set 5
                end
                local.get 13
                local.get 13
                i32.load
                i32.const 2
                i32.add
                local.tee 6
                i32.store
              else
                i32.const -1
                local.set 5
              end
            end
            i32.const 0
            local.set 14
            loop  ;; label = @5
              local.get 6
              i32.load8_s
              i32.const -65
              i32.add
              i32.const 57
              i32.gt_u
              if  ;; label = @6
                i32.const -1
                local.set 12
                br 2 (;@4;)
              end
              local.get 13
              local.get 6
              i32.const 1
              i32.add
              local.tee 7
              i32.store
              local.get 14
              i32.const 58
              i32.mul
              local.get 6
              i32.load8_s
              i32.add
              i32.const 1358
              i32.add
              i32.load8_s
              local.tee 17
              i32.const 255
              i32.and
              local.tee 6
              i32.const -1
              i32.add
              i32.const 8
              i32.lt_u
              if  ;; label = @6
                local.get 6
                local.set 14
                local.get 7
                local.set 6
                br 1 (;@5;)
              end
            end
            local.get 17
            i32.eqz
            if  ;; label = @5
              i32.const -1
              local.set 12
              br 1 (;@4;)
            end
            local.get 10
            i32.const -1
            i32.gt_s
            local.set 23
            block  ;; label = @5
              block  ;; label = @6
                local.get 17
                i32.const 19
                i32.eq
                if  ;; label = @7
                  local.get 23
                  if  ;; label = @8
                    i32.const -1
                    local.set 12
                    br 4 (;@4;)
                  else
                    br 2 (;@6;)
                  end
                  unreachable
                else
                  local.get 23
                  if  ;; label = @8
                    local.get 4
                    local.get 10
                    i32.const 2
                    i32.shl
                    i32.add
                    local.get 6
                    i32.store
                    local.get 11
                    local.get 3
                    local.get 10
                    i32.const 3
                    i32.shl
                    i32.add
                    i64.load
                    i64.store
                    br 2 (;@6;)
                  end
                  local.get 18
                  i32.eqz
                  if  ;; label = @8
                    i32.const 0
                    local.set 12
                    br 4 (;@4;)
                  end
                  local.get 11
                  local.get 6
                  local.get 2
                  call 15
                  local.get 13
                  i32.load
                  local.set 7
                end
                br 1 (;@5;)
              end
              local.get 18
              i32.eqz
              if  ;; label = @6
                i32.const 0
                local.set 5
                br 3 (;@3;)
              end
            end
            local.get 7
            i32.const -1
            i32.add
            i32.load8_s
            local.tee 6
            i32.const -33
            i32.and
            local.set 7
            local.get 14
            i32.const 0
            i32.ne
            local.get 6
            i32.const 15
            i32.and
            i32.const 3
            i32.eq
            i32.and
            i32.eqz
            if  ;; label = @5
              local.get 6
              local.set 7
            end
            local.get 8
            i32.const -65537
            i32.and
            local.set 10
            local.get 8
            i32.const 8192
            i32.and
            if (result i32)  ;; label = @5
              local.get 10
            else
              local.get 8
            end
            local.set 6
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    local.get 7
                                                    i32.const 65
                                                    i32.sub
                                                    br_table 11 (;@13;) 12 (;@12;) 9 (;@15;) 12 (;@12;) 11 (;@13;) 11 (;@13;) 11 (;@13;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 10 (;@14;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 2 (;@22;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 11 (;@13;) 12 (;@12;) 6 (;@18;) 4 (;@20;) 11 (;@13;) 11 (;@13;) 11 (;@13;) 12 (;@12;) 4 (;@20;) 12 (;@12;) 12 (;@12;) 12 (;@12;) 7 (;@17;) 0 (;@24;) 3 (;@21;) 1 (;@23;) 12 (;@12;) 12 (;@12;) 8 (;@16;) 12 (;@12;) 5 (;@19;) 12 (;@12;) 12 (;@12;) 2 (;@22;) 12 (;@12;)
                                                  end
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  local.get 14
                                                                  i32.const 255
                                                                  i32.and
                                                                  i32.const 24
                                                                  i32.shl
                                                                  i32.const 24
                                                                  i32.shr_s
                                                                  br_table 0 (;@31;) 1 (;@30;) 2 (;@29;) 3 (;@28;) 4 (;@27;) 7 (;@24;) 5 (;@26;) 6 (;@25;) 7 (;@24;)
                                                                end
                                                                local.get 11
                                                                i32.load
                                                                local.get 12
                                                                i32.store
                                                                i32.const 0
                                                                local.set 5
                                                                br 27 (;@3;)
                                                              end
                                                              local.get 11
                                                              i32.load
                                                              local.get 12
                                                              i32.store
                                                              i32.const 0
                                                              local.set 5
                                                              br 26 (;@3;)
                                                            end
                                                            local.get 11
                                                            i32.load
                                                            local.get 12
                                                            i64.extend_i32_s
                                                            i64.store
                                                            i32.const 0
                                                            local.set 5
                                                            br 25 (;@3;)
                                                          end
                                                          local.get 11
                                                          i32.load
                                                          local.get 12
                                                          i32.store16
                                                          i32.const 0
                                                          local.set 5
                                                          br 24 (;@3;)
                                                        end
                                                        local.get 11
                                                        i32.load
                                                        local.get 12
                                                        i32.store8
                                                        i32.const 0
                                                        local.set 5
                                                        br 23 (;@3;)
                                                      end
                                                      local.get 11
                                                      i32.load
                                                      local.get 12
                                                      i32.store
                                                      i32.const 0
                                                      local.set 5
                                                      br 22 (;@3;)
                                                    end
                                                    local.get 11
                                                    i32.load
                                                    local.get 12
                                                    i64.extend_i32_s
                                                    i64.store
                                                    i32.const 0
                                                    local.set 5
                                                    br 21 (;@3;)
                                                  end
                                                  i32.const 0
                                                  local.set 5
                                                  br 20 (;@3;)
                                                end
                                                i32.const 120
                                                local.set 7
                                                local.get 5
                                                i32.const 8
                                                i32.le_u
                                                if  ;; label = @23
                                                  i32.const 8
                                                  local.set 5
                                                end
                                                local.get 6
                                                i32.const 8
                                                i32.or
                                                local.set 6
                                                br 11 (;@11;)
                                              end
                                              br 10 (;@11;)
                                            end
                                            local.get 21
                                            local.get 11
                                            i64.load
                                            local.tee 25
                                            local.get 16
                                            call 31
                                            local.tee 8
                                            i32.sub
                                            local.tee 10
                                            i32.const 1
                                            i32.add
                                            local.set 14
                                            i32.const 0
                                            local.set 9
                                            i32.const 1887
                                            local.set 7
                                            local.get 6
                                            i32.const 8
                                            i32.and
                                            i32.eqz
                                            local.get 5
                                            local.get 10
                                            i32.gt_s
                                            i32.or
                                            i32.eqz
                                            if  ;; label = @21
                                              local.get 14
                                              local.set 5
                                            end
                                            br 13 (;@7;)
                                          end
                                          local.get 11
                                          i64.load
                                          local.tee 25
                                          i64.const 0
                                          i64.lt_s
                                          if  ;; label = @20
                                            local.get 11
                                            i64.const 0
                                            local.get 25
                                            i64.sub
                                            local.tee 25
                                            i64.store
                                            i32.const 1
                                            local.set 9
                                            i32.const 1887
                                            local.set 7
                                          else
                                            local.get 6
                                            i32.const 2048
                                            i32.and
                                            i32.eqz
                                            local.set 8
                                            local.get 6
                                            i32.const 1
                                            i32.and
                                            if (result i32)  ;; label = @21
                                              i32.const 1889
                                            else
                                              i32.const 1887
                                            end
                                            local.set 7
                                            local.get 6
                                            i32.const 2049
                                            i32.and
                                            i32.const 0
                                            i32.ne
                                            local.set 9
                                            local.get 8
                                            i32.eqz
                                            if  ;; label = @21
                                              i32.const 1888
                                              local.set 7
                                            end
                                          end
                                          br 9 (;@10;)
                                        end
                                        i32.const 0
                                        local.set 9
                                        i32.const 1887
                                        local.set 7
                                        local.get 11
                                        i64.load
                                        local.set 25
                                        br 8 (;@10;)
                                      end
                                      local.get 22
                                      local.get 11
                                      i64.load
                                      i64.store8
                                      local.get 22
                                      local.set 8
                                      i32.const 0
                                      local.set 9
                                      i32.const 1887
                                      local.set 14
                                      local.get 16
                                      local.set 7
                                      i32.const 1
                                      local.set 5
                                      local.get 10
                                      local.set 6
                                      br 12 (;@5;)
                                    end
                                    i32.const 4412
                                    i32.load
                                    i32.const 1152
                                    i32.load offset=188
                                    call 27
                                    local.set 8
                                    br 7 (;@9;)
                                  end
                                  local.get 11
                                  i32.load
                                  local.tee 8
                                  i32.eqz
                                  if  ;; label = @16
                                    i32.const 1897
                                    local.set 8
                                  end
                                  br 6 (;@9;)
                                end
                                local.get 20
                                local.get 11
                                i64.load
                                i64.store32
                                local.get 24
                                i32.const 0
                                i32.store
                                local.get 11
                                local.get 20
                                i32.store
                                i32.const -1
                                local.set 10
                                local.get 20
                                local.set 8
                                br 6 (;@8;)
                              end
                              local.get 11
                              i32.load
                              local.set 8
                              local.get 5
                              if  ;; label = @14
                                local.get 5
                                local.set 10
                                br 6 (;@8;)
                              else
                                local.get 0
                                i32.const 32
                                local.get 15
                                i32.const 0
                                local.get 6
                                call 7
                                i32.const 0
                                local.set 5
                                br 8 (;@6;)
                              end
                              unreachable
                            end
                            local.get 0
                            local.get 11
                            f64.load
                            local.get 15
                            local.get 5
                            local.get 6
                            local.get 7
                            call 29
                            local.set 5
                            br 9 (;@3;)
                          end
                          local.get 9
                          local.set 8
                          i32.const 0
                          local.set 9
                          i32.const 1887
                          local.set 14
                          local.get 16
                          local.set 7
                          br 6 (;@5;)
                        end
                        local.get 11
                        i64.load
                        local.tee 25
                        local.get 16
                        local.get 7
                        i32.const 32
                        i32.and
                        call 32
                        local.set 8
                        local.get 7
                        i32.const 4
                        i32.shr_s
                        i32.const 1887
                        i32.add
                        local.set 7
                        local.get 6
                        i32.const 8
                        i32.and
                        i32.eqz
                        local.get 25
                        i64.const 0
                        i64.eq
                        i32.or
                        local.tee 9
                        if  ;; label = @11
                          i32.const 1887
                          local.set 7
                        end
                        local.get 9
                        if (result i32)  ;; label = @11
                          i32.const 0
                        else
                          i32.const 2
                        end
                        local.set 9
                        br 3 (;@7;)
                      end
                      local.get 25
                      local.get 16
                      call 9
                      local.set 8
                      br 2 (;@7;)
                    end
                    local.get 8
                    i32.const 0
                    local.get 5
                    call 30
                    local.tee 6
                    i32.eqz
                    local.set 17
                    local.get 6
                    local.get 8
                    i32.sub
                    local.set 9
                    local.get 8
                    local.get 5
                    i32.add
                    local.set 7
                    local.get 17
                    i32.eqz
                    if  ;; label = @9
                      local.get 9
                      local.set 5
                    end
                    i32.const 0
                    local.set 9
                    i32.const 1887
                    local.set 14
                    local.get 17
                    i32.eqz
                    if  ;; label = @9
                      local.get 6
                      local.set 7
                    end
                    local.get 10
                    local.set 6
                    br 3 (;@5;)
                  end
                  local.get 8
                  local.set 9
                  i32.const 0
                  local.set 5
                  i32.const 0
                  local.set 7
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 9
                      i32.load
                      local.tee 14
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 19
                      local.get 14
                      call 14
                      local.tee 7
                      i32.const 0
                      i32.lt_s
                      local.get 7
                      local.get 10
                      local.get 5
                      i32.sub
                      i32.gt_u
                      i32.or
                      br_if 0 (;@9;)
                      local.get 9
                      i32.const 4
                      i32.add
                      local.set 9
                      local.get 10
                      local.get 7
                      local.get 5
                      i32.add
                      local.tee 5
                      i32.gt_u
                      br_if 1 (;@8;)
                    end
                  end
                  local.get 7
                  i32.const 0
                  i32.lt_s
                  if  ;; label = @8
                    i32.const -1
                    local.set 12
                    br 4 (;@4;)
                  end
                  local.get 0
                  i32.const 32
                  local.get 15
                  local.get 5
                  local.get 6
                  call 7
                  local.get 5
                  if  ;; label = @8
                    i32.const 0
                    local.set 7
                    loop  ;; label = @9
                      local.get 8
                      i32.load
                      local.tee 9
                      i32.eqz
                      br_if 3 (;@6;)
                      local.get 19
                      local.get 9
                      call 14
                      local.tee 9
                      local.get 7
                      i32.add
                      local.tee 7
                      local.get 5
                      i32.gt_s
                      br_if 3 (;@6;)
                      local.get 8
                      i32.const 4
                      i32.add
                      local.set 8
                      local.get 0
                      local.get 19
                      local.get 9
                      call 6
                      local.get 7
                      local.get 5
                      i32.lt_u
                      br_if 0 (;@9;)
                      br 3 (;@6;)
                    end
                    unreachable
                  else
                    i32.const 0
                    local.set 5
                    br 2 (;@6;)
                  end
                  unreachable
                end
                local.get 6
                i32.const -65537
                i32.and
                local.set 10
                local.get 5
                i32.const -1
                i32.gt_s
                if  ;; label = @7
                  local.get 10
                  local.set 6
                end
                local.get 5
                i32.const 0
                i32.ne
                local.get 25
                i64.const 0
                i64.ne
                local.tee 10
                i32.or
                local.set 14
                local.get 5
                local.get 21
                local.get 8
                i32.sub
                local.get 10
                i32.const 1
                i32.xor
                i32.const 1
                i32.and
                i32.add
                local.tee 10
                i32.gt_s
                if  ;; label = @7
                  local.get 5
                  local.set 10
                end
                local.get 14
                if  ;; label = @7
                  local.get 10
                  local.set 5
                end
                local.get 14
                i32.eqz
                if  ;; label = @7
                  local.get 16
                  local.set 8
                end
                local.get 7
                local.set 14
                local.get 16
                local.set 7
                br 1 (;@5;)
              end
              local.get 0
              i32.const 32
              local.get 15
              local.get 5
              local.get 6
              i32.const 8192
              i32.xor
              call 7
              local.get 15
              local.get 5
              i32.gt_s
              if  ;; label = @6
                local.get 15
                local.set 5
              end
              br 2 (;@3;)
            end
            local.get 0
            i32.const 32
            local.get 15
            local.get 5
            local.get 7
            local.get 8
            i32.sub
            local.tee 10
            i32.lt_s
            if (result i32)  ;; label = @5
              local.get 10
            else
              local.get 5
            end
            local.tee 17
            local.get 9
            i32.add
            local.tee 7
            i32.lt_s
            if (result i32)  ;; label = @5
              local.get 7
            else
              local.get 15
            end
            local.tee 5
            local.get 7
            local.get 6
            call 7
            local.get 0
            local.get 14
            local.get 9
            call 6
            local.get 0
            i32.const 48
            local.get 5
            local.get 7
            local.get 6
            i32.const 65536
            i32.xor
            call 7
            local.get 0
            i32.const 48
            local.get 17
            local.get 10
            i32.const 0
            call 7
            local.get 0
            local.get 8
            local.get 10
            call 6
            local.get 0
            i32.const 32
            local.get 5
            local.get 7
            local.get 6
            i32.const 8192
            i32.xor
            call 7
            br 1 (;@3;)
          end
        end
        br 1 (;@1;)
      end
      local.get 0
      i32.eqz
      if  ;; label = @2
        local.get 1
        if  ;; label = @3
          i32.const 1
          local.set 0
          loop  ;; label = @4
            local.get 4
            local.get 0
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.tee 1
            if  ;; label = @5
              local.get 3
              local.get 0
              i32.const 3
              i32.shl
              i32.add
              local.get 1
              local.get 2
              call 15
              local.get 0
              i32.const 1
              i32.add
              local.set 1
              local.get 0
              i32.const 9
              i32.lt_s
              if  ;; label = @6
                local.get 1
                local.set 0
                br 2 (;@4;)
              else
                local.get 1
                local.set 0
              end
            end
          end
          local.get 0
          i32.const 10
          i32.lt_s
          if  ;; label = @4
            loop  ;; label = @5
              local.get 4
              local.get 0
              i32.const 2
              i32.shl
              i32.add
              i32.load
              if  ;; label = @6
                i32.const -1
                local.set 12
                br 5 (;@1;)
              end
              local.get 0
              i32.const 1
              i32.add
              local.set 1
              local.get 0
              i32.const 9
              i32.lt_s
              if  ;; label = @6
                local.get 1
                local.set 0
                br 1 (;@5;)
              else
                i32.const 1
                local.set 12
              end
            end
          else
            i32.const 1
            local.set 12
          end
        else
          i32.const 0
          local.set 12
        end
      end
    end
    local.get 11
    global.set 2
    local.get 12)
  (func (;12;) (type 3) (param i32 i32) (result i32)
    (local i32)
    global.get 2
    local.set 2
    global.get 2
    i32.const 16
    i32.add
    global.set 2
    local.get 2
    local.get 1
    i32.store
    i32.const 1024
    i32.load
    local.get 0
    local.get 2
    call 33
    local.set 0
    local.get 2
    global.set 2
    local.get 0)
  (func (;13;) (type 10) (param f64 i32) (result f64)
    (local i32 i64 i64)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i64.reinterpret_f64
          local.tee 3
          i64.const 52
          i64.shr_u
          local.tee 4
          i32.wrap_i64
          i32.const 2047
          i32.and
          local.tee 2
          if  ;; label = @4
            local.get 2
            i32.const 2047
            i32.eq
            if  ;; label = @5
              br 4 (;@1;)
            else
              br 3 (;@2;)
            end
            unreachable
          end
          local.get 1
          local.get 0
          f64.const 0x0p+0 (;=0;)
          f64.ne
          if (result i32)  ;; label = @4
            local.get 0
            f64.const 0x1p+64 (;=1.84467e+19;)
            f64.mul
            local.get 1
            call 13
            local.set 0
            local.get 1
            i32.load
            i32.const -64
            i32.add
          else
            i32.const 0
          end
          local.tee 2
          i32.store
          br 2 (;@1;)
          unreachable
        end
        unreachable
        unreachable
      end
      local.get 1
      local.get 4
      i32.wrap_i64
      i32.const 2047
      i32.and
      i32.const -1022
      i32.add
      i32.store
      local.get 3
      i64.const -9218868437227405313
      i64.and
      i64.const 4602678819172646912
      i64.or
      f64.reinterpret_i64
      local.set 0
    end
    local.get 0)
  (func (;14;) (type 3) (param i32 i32) (result i32)
    local.get 0
    if (result i32)  ;; label = @1
      local.get 0
      local.get 1
      i32.const 0
      call 28
    else
      i32.const 0
    end)
  (func (;15;) (type 5) (param i32 i32 i32)
    (local i32 i64 f64)
    block  ;; label = @1
      local.get 1
      i32.const 20
      i32.le_u
      if  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 1
                              i32.const 9
                              i32.sub
                              br_table 0 (;@13;) 1 (;@12;) 2 (;@11;) 3 (;@10;) 4 (;@9;) 5 (;@8;) 6 (;@7;) 7 (;@6;) 8 (;@5;) 9 (;@4;) 10 (;@3;)
                            end
                            local.get 2
                            i32.load
                            i32.const 3
                            i32.add
                            i32.const -4
                            i32.and
                            local.tee 1
                            i32.load
                            local.set 3
                            local.get 2
                            local.get 1
                            i32.const 4
                            i32.add
                            i32.store
                            local.get 0
                            local.get 3
                            i32.store
                            br 11 (;@1;)
                          end
                          local.get 2
                          i32.load
                          i32.const 3
                          i32.add
                          i32.const -4
                          i32.and
                          local.tee 1
                          i32.load
                          local.set 3
                          local.get 2
                          local.get 1
                          i32.const 4
                          i32.add
                          i32.store
                          local.get 0
                          local.get 3
                          i64.extend_i32_s
                          i64.store
                          br 10 (;@1;)
                        end
                        local.get 2
                        i32.load
                        i32.const 3
                        i32.add
                        i32.const -4
                        i32.and
                        local.tee 1
                        i32.load
                        local.set 3
                        local.get 2
                        local.get 1
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 0
                        local.get 3
                        i64.extend_i32_u
                        i64.store
                        br 9 (;@1;)
                      end
                      local.get 2
                      i32.load
                      i32.const 7
                      i32.add
                      i32.const -8
                      i32.and
                      local.tee 1
                      i64.load
                      local.set 4
                      local.get 2
                      local.get 1
                      i32.const 8
                      i32.add
                      i32.store
                      local.get 0
                      local.get 4
                      i64.store
                      br 8 (;@1;)
                    end
                    local.get 2
                    i32.load
                    i32.const 3
                    i32.add
                    i32.const -4
                    i32.and
                    local.tee 1
                    i32.load
                    local.set 3
                    local.get 2
                    local.get 1
                    i32.const 4
                    i32.add
                    i32.store
                    local.get 0
                    local.get 3
                    i32.const 65535
                    i32.and
                    i32.const 16
                    i32.shl
                    i32.const 16
                    i32.shr_s
                    i64.extend_i32_s
                    i64.store
                    br 7 (;@1;)
                  end
                  local.get 2
                  i32.load
                  i32.const 3
                  i32.add
                  i32.const -4
                  i32.and
                  local.tee 1
                  i32.load
                  local.set 3
                  local.get 2
                  local.get 1
                  i32.const 4
                  i32.add
                  i32.store
                  local.get 0
                  local.get 3
                  i32.const 65535
                  i32.and
                  i64.extend_i32_u
                  i64.store
                  br 6 (;@1;)
                end
                local.get 2
                i32.load
                i32.const 3
                i32.add
                i32.const -4
                i32.and
                local.tee 1
                i32.load
                local.set 3
                local.get 2
                local.get 1
                i32.const 4
                i32.add
                i32.store
                local.get 0
                local.get 3
                i32.const 255
                i32.and
                i32.const 24
                i32.shl
                i32.const 24
                i32.shr_s
                i64.extend_i32_s
                i64.store
                br 5 (;@1;)
              end
              local.get 2
              i32.load
              i32.const 3
              i32.add
              i32.const -4
              i32.and
              local.tee 1
              i32.load
              local.set 3
              local.get 2
              local.get 1
              i32.const 4
              i32.add
              i32.store
              local.get 0
              local.get 3
              i32.const 255
              i32.and
              i64.extend_i32_u
              i64.store
              br 4 (;@1;)
            end
            local.get 2
            i32.load
            i32.const 7
            i32.add
            i32.const -8
            i32.and
            local.tee 1
            f64.load
            local.set 5
            local.get 2
            local.get 1
            i32.const 8
            i32.add
            i32.store
            local.get 0
            local.get 5
            f64.store
            br 3 (;@1;)
          end
          local.get 2
          i32.load
          i32.const 7
          i32.add
          i32.const -8
          i32.and
          local.tee 1
          f64.load
          local.set 5
          local.get 2
          local.get 1
          i32.const 8
          i32.add
          i32.store
          local.get 0
          local.get 5
          f64.store
        end
      end
    end)
  (func (;16;) (type 1) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load
    i32.load8_s
    local.tee 1
    i32.const -48
    i32.add
    i32.const 10
    i32.lt_u
    if  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.const 10
        i32.mul
        i32.const -48
        i32.add
        local.get 0
        i32.load
        local.tee 1
        i32.load8_s
        i32.add
        local.set 2
        local.get 0
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.store
        local.get 1
        i32.load8_s
        local.tee 1
        i32.const -48
        i32.add
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func (;17;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 2
    local.set 6
    global.get 2
    i32.const 48
    i32.add
    global.set 2
    local.get 6
    i32.const 16
    i32.add
    local.set 7
    local.get 6
    i32.const 32
    i32.add
    local.tee 3
    local.get 0
    i32.const 28
    i32.add
    local.tee 9
    i32.load
    local.tee 4
    i32.store
    local.get 3
    local.get 0
    i32.const 20
    i32.add
    local.tee 10
    i32.load
    local.get 4
    i32.sub
    local.tee 4
    i32.store offset=4
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 6
    local.tee 8
    local.get 0
    i32.const 60
    i32.add
    local.tee 12
    i32.load
    i32.store
    local.get 8
    local.get 3
    i32.store offset=4
    local.get 8
    i32.const 2
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        local.get 2
        i32.add
        local.tee 6
        i32.const 146
        local.get 8
        call 2
        local.tee 1
        i32.const -4096
        i32.gt_u
        if (result i32)  ;; label = @3
          i32.const 4412
          i32.const 0
          local.get 1
          i32.sub
          i32.store
          i32.const -1
        else
          local.get 1
        end
        local.tee 5
        i32.eq
        br_if 0 (;@2;)
        i32.const 2
        local.set 4
        local.get 3
        local.set 1
        local.get 5
        local.set 3
        loop  ;; label = @3
          local.get 3
          i32.const 0
          i32.ge_s
          if  ;; label = @4
            local.get 6
            local.get 3
            i32.sub
            local.set 6
            local.get 1
            i32.const 8
            i32.add
            local.set 5
            local.get 3
            local.get 1
            i32.load offset=4
            local.tee 13
            i32.gt_u
            local.tee 11
            if  ;; label = @5
              local.get 5
              local.set 1
            end
            local.get 4
            local.get 11
            i32.const 31
            i32.shl
            i32.const 31
            i32.shr_s
            i32.add
            local.set 4
            local.get 1
            local.get 1
            i32.load
            local.get 3
            local.get 11
            if (result i32)  ;; label = @5
              local.get 13
            else
              i32.const 0
            end
            i32.sub
            local.tee 3
            i32.add
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.tee 5
            local.get 5
            i32.load
            local.get 3
            i32.sub
            i32.store
            local.get 7
            local.get 12
            i32.load
            i32.store
            local.get 7
            local.get 1
            i32.store offset=4
            local.get 7
            local.get 4
            i32.store offset=8
            local.get 6
            i32.const 146
            local.get 7
            call 2
            local.tee 5
            i32.const -4096
            i32.gt_u
            if (result i32)  ;; label = @5
              i32.const 4412
              i32.const 0
              local.get 5
              i32.sub
              i32.store
              i32.const -1
            else
              local.get 5
            end
            local.tee 3
            i32.eq
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
        end
        local.get 0
        i32.const 0
        i32.store offset=16
        local.get 9
        i32.const 0
        i32.store
        local.get 10
        i32.const 0
        i32.store
        local.get 0
        local.get 0
        i32.load
        i32.const 32
        i32.or
        i32.store
        local.get 4
        i32.const 2
        i32.eq
        if (result i32)  ;; label = @3
          i32.const 0
        else
          local.get 2
          local.get 1
          i32.load offset=4
          i32.sub
        end
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      local.get 0
      i32.load offset=44
      local.tee 1
      local.get 0
      i32.load offset=48
      i32.add
      i32.store offset=16
      local.get 9
      local.get 1
      i32.store
      local.get 10
      local.get 1
      i32.store
    end
    local.get 8
    global.set 2
    local.get 2)
  (func (;18;) (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 2
    local.set 2
    global.get 2
    i32.const 16
    i32.add
    global.set 2
    local.get 2
    i32.const 8
    i32.add
    local.set 5
    local.get 2
    local.set 3
    block (result i32)  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 1
        i32.le_s
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 1
                      i32.load offset=4
                      i32.load8_s
                      local.tee 0
                      i32.const 48
                      i32.sub
                      br_table 5 (;@4;) 0 (;@9;) 2 (;@7;) 1 (;@8;) 3 (;@6;) 4 (;@5;) 6 (;@3;)
                    end
                    i32.const 550
                    br 7 (;@1;)
                  end
                  br 5 (;@2;)
                end
                i32.const 3500
                br 5 (;@1;)
              end
              i32.const 35000
              br 4 (;@1;)
            end
            i32.const 70000
            br 3 (;@1;)
          end
          local.get 3
          global.set 2
          i32.const 0
          return
        end
        local.get 3
        local.get 0
        i32.const -48
        i32.add
        i32.store
        i32.const 1396
        local.get 3
        call 12
        drop
        local.get 3
        global.set 2
        i32.const -1
        return
      end
      i32.const 7000
    end
    local.set 7
    i32.const 0
    local.set 1
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 4
      i32.const 5
      i32.rem_s
      i32.const 1
      i32.add
      local.set 8
      local.get 4
      i32.const 3
      i32.rem_s
      i32.const 1
      i32.add
      local.set 9
      i32.const 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 8
        i32.div_s
        local.get 0
        i32.add
        local.tee 0
        i32.const 1000
        i32.gt_u
        if  ;; label = @3
          local.get 0
          local.get 9
          i32.div_u
          local.set 0
        end
        local.get 2
        i32.const 3
        i32.and
        i32.eqz
        local.set 6
        local.get 2
        i32.const 7
        i32.and
        if (result i32)  ;; label = @3
          i32.const -1
        else
          i32.const 1
        end
        local.get 2
        i32.mul
        local.set 10
        local.get 0
        local.get 6
        if (result i32)  ;; label = @3
          local.get 10
        else
          i32.const 0
        end
        i32.add
        local.tee 0
        i32.const 16
        i32.shl
        i32.const 16
        i32.shr_s
        local.tee 6
        local.get 6
        i32.mul
        i32.const 255
        i32.and
        local.get 1
        i32.const 65535
        i32.and
        i32.add
        local.set 1
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        i32.const 20000
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 4
      i32.const 1
      i32.add
      local.tee 4
      local.get 7
      i32.lt_s
      br_if 0 (;@1;)
    end
    local.get 5
    local.get 0
    i32.store
    local.get 5
    local.get 1
    i32.const 65535
    i32.and
    i32.store offset=4
    i32.const 1408
    local.get 5
    call 12
    drop
    local.get 3
    global.set 2
    i32.const 0)
  (func (;19;) (type 0) (param i32 i32 i32) (result i32)
    i32.const 1
    call 0
    i32.const 0)
  (func (;20;) (type 1) (param i32) (result i32)
    i32.const 0
    call 0
    i32.const 0)
  (func (;21;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 2
    i32.const 8192
    i32.ge_s
    if  ;; label = @1
      local.get 0
      local.get 1
      local.get 2
      call 5
      return
    end
    local.get 0
    local.set 4
    local.get 0
    local.get 2
    i32.add
    local.set 3
    local.get 0
    i32.const 3
    i32.and
    local.get 1
    i32.const 3
    i32.and
    i32.eq
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        if  ;; label = @3
          local.get 2
          i32.eqz
          if  ;; label = @4
            local.get 4
            return
          end
          local.get 0
          local.get 1
          i32.load8_s
          i32.store8
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.const 1
          i32.sub
          local.set 2
          br 1 (;@2;)
        end
      end
      local.get 3
      i32.const -4
      i32.and
      local.tee 2
      i32.const -64
      i32.add
      local.set 5
      loop  ;; label = @2
        local.get 0
        local.get 5
        i32.le_s
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.load
          i32.store
          local.get 0
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 0
          local.get 1
          i32.load offset=8
          i32.store offset=8
          local.get 0
          local.get 1
          i32.load offset=12
          i32.store offset=12
          local.get 0
          local.get 1
          i32.load offset=16
          i32.store offset=16
          local.get 0
          local.get 1
          i32.load offset=20
          i32.store offset=20
          local.get 0
          local.get 1
          i32.load offset=24
          i32.store offset=24
          local.get 0
          local.get 1
          i32.load offset=28
          i32.store offset=28
          local.get 0
          local.get 1
          i32.load offset=32
          i32.store offset=32
          local.get 0
          local.get 1
          i32.load offset=36
          i32.store offset=36
          local.get 0
          local.get 1
          i32.load offset=40
          i32.store offset=40
          local.get 0
          local.get 1
          i32.load offset=44
          i32.store offset=44
          local.get 0
          local.get 1
          i32.load offset=48
          i32.store offset=48
          local.get 0
          local.get 1
          i32.load offset=52
          i32.store offset=52
          local.get 0
          local.get 1
          i32.load offset=56
          i32.store offset=56
          local.get 0
          local.get 1
          i32.load offset=60
          i32.store offset=60
          local.get 0
          i32.const -64
          i32.sub
          local.set 0
          local.get 1
          i32.const -64
          i32.sub
          local.set 1
          br 1 (;@2;)
        end
      end
      loop  ;; label = @2
        local.get 0
        local.get 2
        i32.lt_s
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.load
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          br 1 (;@2;)
        end
      end
    else
      local.get 3
      i32.const 4
      i32.sub
      local.set 2
      loop  ;; label = @2
        local.get 0
        local.get 2
        i32.lt_s
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.load8_s
          i32.store8
          local.get 0
          local.get 1
          i32.load8_s offset=1
          i32.store8 offset=1
          local.get 0
          local.get 1
          i32.load8_s offset=2
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.load8_s offset=3
          i32.store8 offset=3
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          br 1 (;@2;)
        end
      end
    end
    loop  ;; label = @1
      local.get 0
      local.get 3
      i32.lt_s
      if  ;; label = @2
        local.get 0
        local.get 1
        i32.load8_s
        i32.store8
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        br 1 (;@1;)
      end
    end
    local.get 4)
  (func (;22;) (type 1) (param i32) (result i32)
    local.get 0
    i32.const 255
    i32.and
    i32.const 24
    i32.shl
    local.get 0
    i32.const 8
    i32.shr_s
    i32.const 255
    i32.and
    i32.const 16
    i32.shl
    i32.or
    local.get 0
    i32.const 16
    i32.shr_s
    i32.const 255
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 0
    i32.const 24
    i32.shr_u
    i32.or)
  (func (;23;) (type 1) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.const 74
    i32.add
    local.tee 2
    i32.load8_s
    local.set 1
    local.get 2
    local.get 1
    i32.const 255
    i32.add
    local.get 1
    i32.or
    i32.store8
    local.get 0
    i32.load
    local.tee 1
    i32.const 8
    i32.and
    if (result i32)  ;; label = @1
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
    else
      local.get 0
      i32.const 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=4
      local.get 0
      local.get 0
      i32.load offset=44
      local.tee 1
      i32.store offset=28
      local.get 0
      local.get 1
      i32.store offset=20
      local.get 0
      local.get 1
      local.get 0
      i32.load offset=48
      i32.add
      i32.store offset=16
      i32.const 0
    end
    local.tee 0)
  (func (;24;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 16
        i32.add
        local.tee 4
        i32.load
        local.tee 3
        br_if 0 (;@2;)
        local.get 2
        call 23
        if  ;; label = @3
          i32.const 0
          local.set 2
        else
          local.get 4
          i32.load
          local.set 3
          br 1 (;@2;)
        end
        br 1 (;@1;)
      end
      local.get 3
      local.get 2
      i32.const 20
      i32.add
      local.tee 5
      i32.load
      local.tee 4
      i32.sub
      local.get 1
      i32.lt_u
      if  ;; label = @2
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.load offset=36
        i32.const 3
        i32.and
        i32.const 2
        i32.add
        call_indirect (type 0)
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        i32.load8_s offset=75
        i32.const -1
        i32.gt_s
        if  ;; label = @3
          local.get 1
          local.set 3
          loop  ;; label = @4
            local.get 3
            i32.eqz
            if  ;; label = @5
              i32.const 0
              local.set 3
              br 3 (;@2;)
            end
            local.get 0
            local.get 3
            i32.const -1
            i32.add
            local.tee 6
            i32.add
            i32.load8_s
            i32.const 10
            i32.ne
            if  ;; label = @5
              local.get 6
              local.set 3
              br 1 (;@4;)
            end
          end
          local.get 2
          local.get 0
          local.get 3
          local.get 2
          i32.load offset=36
          i32.const 3
          i32.and
          i32.const 2
          i32.add
          call_indirect (type 0)
          local.tee 2
          local.get 3
          i32.lt_u
          br_if 2 (;@1;)
          local.get 0
          local.get 3
          i32.add
          local.set 0
          local.get 1
          local.get 3
          i32.sub
          local.set 1
          local.get 5
          i32.load
          local.set 4
        else
          i32.const 0
          local.set 3
        end
      end
      local.get 4
      local.get 0
      local.get 1
      call 21
      drop
      local.get 5
      local.get 5
      i32.load
      local.get 1
      i32.add
      i32.store
      local.get 3
      local.get 1
      i32.add
      local.set 2
    end
    local.get 2)
  (func (;25;) (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load8_s
    local.tee 2
    i32.eqz
    local.get 2
    local.get 1
    i32.load8_s
    local.tee 3
    i32.ne
    i32.or
    if  ;; label = @1
      local.get 3
      local.set 0
      local.get 2
      local.set 1
    else
      loop  ;; label = @2
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        i32.load8_s
        local.tee 2
        i32.eqz
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.load8_s
        local.tee 3
        i32.ne
        i32.or
        if  ;; label = @3
          local.get 3
          local.set 0
          local.get 2
          local.set 1
        else
          br 1 (;@2;)
        end
      end
    end
    local.get 1
    i32.const 255
    i32.and
    local.get 0
    i32.const 255
    i32.and
    i32.sub)
  (func (;26;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load
    i32.const 1794895138
    i32.add
    local.tee 6
    call 8
    local.set 4
    local.get 0
    i32.load offset=12
    local.get 6
    call 8
    local.set 3
    local.get 0
    i32.load offset=16
    local.get 6
    call 8
    local.set 7
    block  ;; label = @1
      local.get 4
      local.get 1
      i32.const 2
      i32.shr_u
      i32.lt_u
      if  ;; label = @2
        local.get 3
        local.get 1
        local.get 4
        i32.const 2
        i32.shl
        i32.sub
        local.tee 5
        i32.lt_u
        local.get 7
        local.get 5
        i32.lt_u
        i32.and
        if  ;; label = @3
          local.get 7
          local.get 3
          i32.or
          i32.const 3
          i32.and
          if  ;; label = @4
            i32.const 0
            local.set 1
          else
            local.get 3
            i32.const 2
            i32.shr_u
            local.set 10
            local.get 7
            i32.const 2
            i32.shr_u
            local.set 11
            i32.const 0
            local.set 5
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                local.get 5
                local.get 4
                i32.const 1
                i32.shr_u
                local.tee 7
                i32.add
                local.tee 12
                i32.const 1
                i32.shl
                local.tee 8
                local.get 10
                i32.add
                local.tee 3
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.get 6
                call 8
                local.set 9
                local.get 0
                local.get 3
                i32.const 1
                i32.add
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.get 6
                call 8
                local.tee 3
                local.get 1
                i32.lt_u
                local.get 9
                local.get 1
                local.get 3
                i32.sub
                i32.lt_u
                i32.and
                i32.eqz
                if  ;; label = @7
                  i32.const 0
                  local.set 1
                  br 6 (;@1;)
                end
                local.get 0
                local.get 3
                local.get 9
                i32.add
                i32.add
                i32.load8_s
                if  ;; label = @7
                  i32.const 0
                  local.set 1
                  br 6 (;@1;)
                end
                local.get 2
                local.get 0
                local.get 3
                i32.add
                call 25
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                i32.const 1
                i32.eq
                local.set 8
                local.get 4
                local.get 7
                i32.sub
                local.set 4
                local.get 3
                i32.const 0
                i32.lt_s
                local.tee 3
                if  ;; label = @7
                  local.get 7
                  local.set 4
                end
                local.get 3
                i32.eqz
                if  ;; label = @7
                  local.get 12
                  local.set 5
                end
                local.get 8
                i32.eqz
                br_if 1 (;@5;)
                i32.const 0
                local.set 1
                br 5 (;@1;)
              end
            end
            local.get 0
            local.get 8
            local.get 11
            i32.add
            local.tee 2
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.get 6
            call 8
            local.set 5
            local.get 0
            local.get 2
            i32.const 1
            i32.add
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.get 6
            call 8
            local.tee 2
            local.get 1
            i32.lt_u
            local.get 5
            local.get 1
            local.get 2
            i32.sub
            i32.lt_u
            i32.and
            if  ;; label = @5
              local.get 0
              local.get 2
              i32.add
              local.set 1
              local.get 0
              local.get 2
              local.get 5
              i32.add
              i32.add
              i32.load8_s
              if  ;; label = @6
                i32.const 0
                local.set 1
              end
            else
              i32.const 0
              local.set 1
            end
          end
        else
          i32.const 0
          local.set 1
        end
      else
        i32.const 0
        local.set 1
      end
    end
    local.get 1)
  (func (;27;) (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 2
            i32.const 1957
            i32.add
            i32.load8_u
            local.get 0
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            i32.const 87
            i32.ne
            br_if 0 (;@4;)
            i32.const 2045
            local.set 0
            i32.const 87
            local.set 2
            br 2 (;@2;)
          end
          unreachable
        end
        local.get 2
        if  ;; label = @3
          i32.const 2045
          local.set 0
          br 1 (;@2;)
        else
          i32.const 2045
          local.set 0
        end
        br 1 (;@1;)
      end
      loop  ;; label = @2
        local.get 0
        local.set 3
        loop  ;; label = @3
          local.get 3
          i32.const 1
          i32.add
          local.set 0
          local.get 3
          i32.load8_s
          if  ;; label = @4
            local.get 0
            local.set 3
            br 1 (;@3;)
          end
        end
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.load offset=20
    local.tee 1
    if (result i32)  ;; label = @1
      local.get 1
      i32.load
      local.get 1
      i32.load offset=4
      local.get 0
      call 26
    else
      i32.const 0
    end
    local.tee 1
    if (result i32)  ;; label = @1
      local.get 1
    else
      local.get 0
    end)
  (func (;28;) (type 0) (param i32 i32 i32) (result i32)
    block (result i32)  ;; label = @1
      local.get 0
      if (result i32)  ;; label = @2
        local.get 1
        i32.const 128
        i32.lt_u
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.store8
          i32.const 1
          br 2 (;@1;)
        end
        i32.const 1152
        i32.load offset=188
        i32.load
        i32.eqz
        if  ;; label = @3
          local.get 1
          i32.const -128
          i32.and
          i32.const 57216
          i32.eq
          if  ;; label = @4
            local.get 0
            local.get 1
            i32.store8
            i32.const 1
            br 3 (;@1;)
          else
            i32.const 4412
            i32.const 84
            i32.store
            i32.const -1
            br 3 (;@1;)
          end
          unreachable
        end
        local.get 1
        i32.const 2048
        i32.lt_u
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 192
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i32.const 2
          br 2 (;@1;)
        end
        local.get 1
        i32.const 55296
        i32.lt_u
        local.get 1
        i32.const -8192
        i32.and
        i32.const 57344
        i32.eq
        i32.or
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 224
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          i32.const 3
          br 2 (;@1;)
        end
        local.get 1
        i32.const -65536
        i32.add
        i32.const 1048576
        i32.lt_u
        if (result i32)  ;; label = @3
          local.get 0
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const 240
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=3
          i32.const 4
        else
          i32.const 4412
          i32.const 84
          i32.store
          i32.const -1
        end
      else
        i32.const 1
      end
    end)
  (func (;29;) (type 9) (param i32 f64 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 f64 f64 f64)
    global.get 2
    local.set 13
    global.get 2
    i32.const 560
    i32.add
    global.set 2
    local.get 13
    i32.const 0
    i32.store
    local.get 1
    local.tee 27
    i64.reinterpret_f64
    i64.const 0
    i64.lt_s
    if  ;; label = @1
      local.get 1
      f64.neg
      local.set 1
      i32.const 1
      local.set 17
      i32.const 1904
      local.set 14
    else
      local.get 4
      i32.const 2048
      i32.and
      i32.eqz
      local.set 6
      local.get 4
      i32.const 1
      i32.and
      if (result i32)  ;; label = @2
        i32.const 1910
      else
        i32.const 1905
      end
      local.set 14
      local.get 4
      i32.const 2049
      i32.and
      i32.const 0
      i32.ne
      local.set 17
      local.get 6
      i32.eqz
      if  ;; label = @2
        i32.const 1907
        local.set 14
      end
    end
    local.get 13
    i32.const 8
    i32.add
    local.set 9
    local.get 13
    i32.const 524
    i32.add
    local.tee 15
    local.set 18
    local.get 13
    i32.const 512
    i32.add
    local.tee 8
    i32.const 12
    i32.add
    local.set 19
    block (result i32)  ;; label = @1
      local.get 1
      local.tee 27
      i64.reinterpret_f64
      i64.const 9218868437227405312
      i64.and
      i64.const 9218868437227405312
      i64.eq
      if (result i32)  ;; label = @2
        local.get 5
        i32.const 32
        i32.and
        i32.const 0
        i32.ne
        local.tee 3
        if (result i32)  ;; label = @3
          i32.const 1923
        else
          i32.const 1927
        end
        local.set 5
        local.get 1
        local.get 1
        f64.ne
        local.set 6
        local.get 3
        if (result i32)  ;; label = @3
          i32.const 1931
        else
          i32.const 1935
        end
        local.set 9
        local.get 0
        i32.const 32
        local.get 2
        local.get 17
        i32.const 3
        i32.add
        local.tee 3
        local.get 4
        i32.const -65537
        i32.and
        call 7
        local.get 0
        local.get 14
        local.get 17
        call 6
        local.get 0
        local.get 6
        if (result i32)  ;; label = @3
          local.get 9
        else
          local.get 5
        end
        i32.const 3
        call 6
        local.get 0
        i32.const 32
        local.get 2
        local.get 3
        local.get 4
        i32.const 8192
        i32.xor
        call 7
        local.get 3
      else
        local.get 1
        local.get 13
        local.tee 6
        call 13
        f64.const 0x1p+1 (;=2;)
        f64.mul
        local.tee 1
        f64.const 0x0p+0 (;=0;)
        f64.ne
        local.tee 6
        if  ;; label = @3
          local.get 13
          local.get 13
          i32.load
          i32.const -1
          i32.add
          i32.store
        end
        local.get 5
        i32.const 32
        i32.or
        local.tee 11
        i32.const 97
        i32.eq
        if  ;; label = @3
          local.get 14
          i32.const 9
          i32.add
          local.set 6
          local.get 5
          i32.const 32
          i32.and
          local.tee 7
          if  ;; label = @4
            local.get 6
            local.set 14
          end
          local.get 3
          i32.const 11
          i32.gt_u
          i32.const 12
          local.get 3
          i32.sub
          local.tee 6
          i32.eqz
          i32.or
          i32.eqz
          if  ;; label = @4
            f64.const 0x1p+3 (;=8;)
            local.set 27
            loop  ;; label = @5
              local.get 27
              f64.const 0x1p+4 (;=16;)
              f64.mul
              local.set 27
              local.get 6
              i32.const -1
              i32.add
              local.tee 6
              br_if 0 (;@5;)
            end
            local.get 14
            i32.load8_s
            i32.const 45
            i32.eq
            if (result f64)  ;; label = @5
              local.get 27
              local.get 1
              f64.neg
              local.get 27
              f64.sub
              f64.add
              f64.neg
            else
              local.get 1
              local.get 27
              f64.add
              local.get 27
              f64.sub
            end
            local.set 1
          end
          i32.const 0
          local.get 13
          i32.load
          local.tee 9
          i32.sub
          local.set 6
          local.get 9
          i32.const 0
          i32.lt_s
          if (result i32)  ;; label = @4
            local.get 6
          else
            local.get 9
          end
          i64.extend_i32_s
          local.get 19
          call 9
          local.tee 6
          local.get 19
          i32.eq
          if  ;; label = @4
            local.get 8
            i32.const 11
            i32.add
            local.tee 6
            i32.const 48
            i32.store8
          end
          local.get 17
          i32.const 2
          i32.or
          local.set 8
          local.get 6
          i32.const -1
          i32.add
          local.get 9
          i32.const 31
          i32.shr_s
          i32.const 2
          i32.and
          i32.const 43
          i32.add
          i32.store8
          local.get 6
          i32.const -2
          i32.add
          local.tee 9
          local.get 5
          i32.const 15
          i32.add
          i32.store8
          local.get 3
          i32.const 1
          i32.lt_s
          local.set 10
          local.get 4
          i32.const 8
          i32.and
          i32.eqz
          local.set 12
          local.get 15
          local.set 5
          loop  ;; label = @4
            local.get 5
            local.get 7
            local.get 1
            i32.trunc_f64_s
            local.tee 6
            i32.const 1939
            i32.add
            i32.load8_u
            i32.or
            i32.store8
            local.get 1
            local.get 6
            f64.convert_i32_s
            f64.sub
            f64.const 0x1p+4 (;=16;)
            f64.mul
            local.set 1
            local.get 5
            i32.const 1
            i32.add
            local.tee 6
            local.get 18
            i32.sub
            i32.const 1
            i32.eq
            if (result i32)  ;; label = @5
              local.get 12
              local.get 10
              local.get 1
              f64.const 0x0p+0 (;=0;)
              f64.eq
              i32.and
              i32.and
              if (result i32)  ;; label = @6
                local.get 6
              else
                local.get 6
                i32.const 46
                i32.store8
                local.get 5
                i32.const 2
                i32.add
              end
            else
              local.get 6
            end
            local.set 5
            local.get 1
            f64.const 0x0p+0 (;=0;)
            f64.ne
            br_if 0 (;@4;)
          end
          block (result i32)  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              i32.const -2
              local.get 18
              i32.sub
              local.get 5
              i32.add
              local.get 3
              i32.ge_s
              br_if 0 (;@5;)
              local.get 3
              i32.const 2
              i32.add
              local.set 3
              local.get 5
              local.get 18
              i32.sub
              br 1 (;@4;)
            end
            local.get 5
            local.get 18
            i32.sub
            local.tee 3
          end
          local.set 6
          local.get 0
          i32.const 32
          local.get 2
          local.get 19
          local.get 9
          i32.sub
          local.tee 7
          local.get 8
          i32.add
          local.get 3
          i32.add
          local.tee 5
          local.get 4
          call 7
          local.get 0
          local.get 14
          local.get 8
          call 6
          local.get 0
          i32.const 48
          local.get 2
          local.get 5
          local.get 4
          i32.const 65536
          i32.xor
          call 7
          local.get 0
          local.get 15
          local.get 6
          call 6
          local.get 0
          i32.const 48
          local.get 3
          local.get 6
          i32.sub
          i32.const 0
          i32.const 0
          call 7
          local.get 0
          local.get 9
          local.get 7
          call 6
          local.get 0
          i32.const 32
          local.get 2
          local.get 5
          local.get 4
          i32.const 8192
          i32.xor
          call 7
          local.get 5
          br 2 (;@1;)
        end
        local.get 6
        if  ;; label = @3
          local.get 13
          local.get 13
          i32.load
          i32.const -28
          i32.add
          local.tee 7
          i32.store
          local.get 1
          f64.const 0x1p+28 (;=2.68435e+08;)
          f64.mul
          local.set 1
        else
          local.get 13
          i32.load
          local.set 7
        end
        local.get 9
        i32.const 288
        i32.add
        local.set 6
        local.get 7
        i32.const 0
        i32.lt_s
        if (result i32)  ;; label = @3
          local.get 9
        else
          local.get 6
          local.tee 9
        end
        local.set 8
        loop  ;; label = @3
          local.get 8
          local.get 1
          i32.trunc_f64_u
          local.tee 6
          i32.store
          local.get 8
          i32.const 4
          i32.add
          local.set 8
          local.get 1
          local.get 6
          f64.convert_i32_u
          f64.sub
          f64.const 0x1.dcd65p+29 (;=1e+09;)
          f64.mul
          local.tee 1
          f64.const 0x0p+0 (;=0;)
          f64.ne
          br_if 0 (;@3;)
        end
        local.get 7
        i32.const 0
        i32.gt_s
        if  ;; label = @3
          local.get 9
          local.set 6
          loop  ;; label = @4
            local.get 7
            i32.const 29
            i32.lt_s
            if (result i32)  ;; label = @5
              local.get 7
            else
              i32.const 29
            end
            local.set 12
            local.get 8
            i32.const -4
            i32.add
            local.tee 7
            local.get 6
            i32.ge_u
            if  ;; label = @5
              local.get 12
              i64.extend_i32_u
              local.set 25
              i32.const 0
              local.set 10
              loop  ;; label = @6
                local.get 7
                local.get 7
                i32.load
                i64.extend_i32_u
                local.get 25
                i64.shl
                local.get 10
                i64.extend_i32_u
                i64.add
                local.tee 26
                i64.const 1000000000
                i64.rem_u
                i64.store32
                local.get 26
                i64.const 1000000000
                i64.div_u
                i32.wrap_i64
                local.set 10
                local.get 7
                i32.const -4
                i32.add
                local.tee 7
                local.get 6
                i32.ge_u
                br_if 0 (;@6;)
              end
              local.get 10
              if  ;; label = @6
                local.get 6
                i32.const -4
                i32.add
                local.tee 6
                local.get 10
                i32.store
              end
            end
            loop  ;; label = @5
              local.get 8
              local.get 6
              i32.gt_u
              if  ;; label = @6
                local.get 8
                i32.const -4
                i32.add
                local.tee 7
                i32.load
                i32.eqz
                if  ;; label = @7
                  local.get 7
                  local.set 8
                  br 2 (;@5;)
                end
              end
            end
            local.get 13
            local.get 13
            i32.load
            local.get 12
            i32.sub
            local.tee 7
            i32.store
            local.get 7
            i32.const 0
            i32.gt_s
            br_if 0 (;@4;)
          end
        else
          local.get 9
          local.set 6
        end
        local.get 3
        i32.const 0
        i32.lt_s
        if (result i32)  ;; label = @3
          i32.const 6
        else
          local.get 3
        end
        local.set 10
        local.get 7
        i32.const 0
        i32.lt_s
        if  ;; label = @3
          local.get 10
          i32.const 25
          i32.add
          i32.const 9
          i32.div_s
          i32.const 1
          i32.add
          local.set 16
          local.get 11
          i32.const 102
          i32.eq
          local.set 21
          local.get 6
          local.set 3
          local.get 8
          local.set 6
          loop  ;; label = @4
            i32.const 0
            local.get 7
            i32.sub
            local.tee 12
            i32.const 9
            i32.ge_s
            if  ;; label = @5
              i32.const 9
              local.set 12
            end
            local.get 3
            local.get 6
            i32.lt_u
            if  ;; label = @5
              i32.const 1
              local.get 12
              i32.shl
              i32.const -1
              i32.add
              local.set 22
              i32.const 1000000000
              local.get 12
              i32.shr_u
              local.set 20
              i32.const 0
              local.set 7
              local.get 3
              local.set 8
              loop  ;; label = @6
                local.get 8
                local.get 8
                i32.load
                local.tee 23
                local.get 12
                i32.shr_u
                local.get 7
                i32.add
                i32.store
                local.get 23
                local.get 22
                i32.and
                local.get 20
                i32.mul
                local.set 7
                local.get 8
                i32.const 4
                i32.add
                local.tee 8
                local.get 6
                i32.lt_u
                br_if 0 (;@6;)
              end
              local.get 3
              i32.const 4
              i32.add
              local.set 8
              local.get 3
              i32.load
              i32.eqz
              if  ;; label = @6
                local.get 8
                local.set 3
              end
              local.get 7
              if  ;; label = @6
                local.get 6
                local.get 7
                i32.store
                local.get 6
                i32.const 4
                i32.add
                local.set 6
              end
            else
              local.get 3
              i32.const 4
              i32.add
              local.set 8
              local.get 3
              i32.load
              i32.eqz
              if  ;; label = @6
                local.get 8
                local.set 3
              end
            end
            local.get 21
            if (result i32)  ;; label = @5
              local.get 9
            else
              local.get 3
            end
            local.tee 8
            local.get 16
            i32.const 2
            i32.shl
            i32.add
            local.set 7
            local.get 6
            local.get 8
            i32.sub
            i32.const 2
            i32.shr_s
            local.get 16
            i32.gt_s
            if  ;; label = @5
              local.get 7
              local.set 6
            end
            local.get 13
            local.get 13
            i32.load
            local.get 12
            i32.add
            local.tee 7
            i32.store
            local.get 7
            i32.const 0
            i32.lt_s
            br_if 0 (;@4;)
            local.get 6
            local.set 7
          end
        else
          local.get 6
          local.set 3
          local.get 8
          local.set 7
        end
        local.get 9
        local.set 12
        local.get 3
        local.get 7
        i32.lt_u
        if  ;; label = @3
          local.get 12
          local.get 3
          i32.sub
          i32.const 2
          i32.shr_s
          i32.const 9
          i32.mul
          local.set 6
          local.get 3
          i32.load
          local.tee 8
          i32.const 10
          i32.ge_u
          if  ;; label = @4
            i32.const 10
            local.set 9
            loop  ;; label = @5
              local.get 6
              i32.const 1
              i32.add
              local.set 6
              local.get 8
              local.get 9
              i32.const 10
              i32.mul
              local.tee 9
              i32.ge_u
              br_if 0 (;@5;)
            end
          end
        else
          i32.const 0
          local.set 6
        end
        local.get 11
        i32.const 103
        i32.eq
        local.set 21
        local.get 10
        i32.const 0
        i32.ne
        local.set 22
        local.get 10
        local.get 11
        i32.const 102
        i32.ne
        if (result i32)  ;; label = @3
          local.get 6
        else
          i32.const 0
        end
        i32.sub
        local.get 22
        local.get 21
        i32.and
        i32.const 31
        i32.shl
        i32.const 31
        i32.shr_s
        i32.add
        local.tee 9
        local.get 7
        local.get 12
        i32.sub
        i32.const 2
        i32.shr_s
        i32.const 9
        i32.mul
        i32.const -9
        i32.add
        i32.lt_s
        if (result i32)  ;; label = @3
          local.get 9
          i32.const 9216
          i32.add
          local.tee 9
          i32.const 9
          i32.div_s
          local.set 16
          local.get 9
          i32.const 9
          i32.rem_s
          local.tee 9
          i32.const 8
          i32.lt_s
          if  ;; label = @4
            i32.const 10
            local.set 8
            loop  ;; label = @5
              local.get 9
              i32.const 1
              i32.add
              local.set 11
              local.get 8
              i32.const 10
              i32.mul
              local.set 8
              local.get 9
              i32.const 7
              i32.lt_s
              if  ;; label = @6
                local.get 11
                local.set 9
                br 1 (;@5;)
              end
            end
          else
            i32.const 10
            local.set 8
          end
          local.get 12
          local.get 16
          i32.const 2
          i32.shl
          i32.add
          i32.const -4092
          i32.add
          local.tee 9
          i32.load
          local.tee 16
          local.get 8
          i32.rem_u
          local.set 11
          local.get 9
          i32.const 4
          i32.add
          local.get 7
          i32.eq
          local.tee 20
          local.get 11
          i32.eqz
          i32.and
          i32.eqz
          if  ;; label = @4
            local.get 16
            local.get 8
            i32.div_u
            i32.const 1
            i32.and
            if (result f64)  ;; label = @5
              f64.const 0x1.0000000000001p+53 (;=9.0072e+15;)
            else
              f64.const 0x1p+53 (;=9.0072e+15;)
            end
            local.set 28
            local.get 11
            local.get 8
            i32.const 2
            i32.div_s
            local.tee 23
            i32.lt_u
            local.set 24
            local.get 20
            local.get 11
            local.get 23
            i32.eq
            i32.and
            if (result f64)  ;; label = @5
              f64.const 0x1p+0 (;=1;)
            else
              f64.const 0x1.8p+0 (;=1.5;)
            end
            local.set 1
            local.get 24
            if  ;; label = @5
              f64.const 0x1p-1 (;=0.5;)
              local.set 1
            end
            local.get 17
            if (result f64)  ;; label = @5
              local.get 28
              f64.neg
              local.set 27
              local.get 1
              f64.neg
              local.set 29
              local.get 14
              i32.load8_s
              i32.const 45
              i32.eq
              local.tee 20
              if  ;; label = @6
                local.get 27
                local.set 28
              end
              local.get 20
              if (result f64)  ;; label = @6
                local.get 29
              else
                local.get 1
              end
            else
              local.get 1
            end
            local.set 27
            local.get 9
            local.get 16
            local.get 11
            i32.sub
            local.tee 11
            i32.store
            local.get 28
            local.tee 1
            local.get 27
            f64.add
            local.get 1
            f64.ne
            if  ;; label = @5
              local.get 9
              local.get 11
              local.get 8
              i32.add
              local.tee 6
              i32.store
              local.get 6
              i32.const 999999999
              i32.gt_u
              if  ;; label = @6
                loop  ;; label = @7
                  local.get 9
                  i32.const 0
                  i32.store
                  local.get 9
                  i32.const -4
                  i32.add
                  local.tee 9
                  local.get 3
                  i32.lt_u
                  if  ;; label = @8
                    local.get 3
                    i32.const -4
                    i32.add
                    local.tee 3
                    i32.const 0
                    i32.store
                  end
                  local.get 9
                  local.get 9
                  i32.load
                  i32.const 1
                  i32.add
                  local.tee 6
                  i32.store
                  local.get 6
                  i32.const 999999999
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 12
              local.get 3
              i32.sub
              i32.const 2
              i32.shr_s
              i32.const 9
              i32.mul
              local.set 6
              local.get 3
              i32.load
              local.tee 11
              i32.const 10
              i32.ge_u
              if  ;; label = @6
                i32.const 10
                local.set 8
                loop  ;; label = @7
                  local.get 6
                  i32.const 1
                  i32.add
                  local.set 6
                  local.get 11
                  local.get 8
                  i32.const 10
                  i32.mul
                  local.tee 8
                  i32.ge_u
                  br_if 0 (;@7;)
                end
              end
            end
          end
          local.get 6
          local.set 8
          local.get 7
          local.get 9
          i32.const 4
          i32.add
          local.tee 6
          i32.le_u
          if  ;; label = @4
            local.get 7
            local.set 6
          end
          local.get 3
        else
          local.get 6
          local.set 8
          local.get 7
          local.set 6
          local.get 3
        end
        local.set 9
        loop  ;; label = @3
          block  ;; label = @4
            local.get 6
            local.get 9
            i32.le_u
            if  ;; label = @5
              i32.const 0
              local.set 16
              br 1 (;@4;)
            end
            local.get 6
            i32.const -4
            i32.add
            local.tee 3
            i32.load
            if  ;; label = @5
              i32.const 1
              local.set 16
            else
              local.get 3
              local.set 6
              br 2 (;@3;)
            end
          end
        end
        i32.const 0
        local.get 8
        i32.sub
        local.set 20
        local.get 21
        if  ;; label = @3
          local.get 10
          local.get 22
          i32.const 1
          i32.xor
          i32.const 1
          i32.and
          i32.add
          local.tee 3
          local.get 8
          i32.gt_s
          local.get 8
          i32.const -5
          i32.gt_s
          i32.and
          if (result i32)  ;; label = @4
            local.get 5
            i32.const -1
            i32.add
            local.set 5
            local.get 3
            i32.const -1
            i32.add
            local.get 8
            i32.sub
          else
            local.get 5
            i32.const -2
            i32.add
            local.set 5
            local.get 3
            i32.const -1
            i32.add
          end
          local.set 3
          local.get 4
          i32.const 8
          i32.and
          local.tee 10
          i32.eqz
          if  ;; label = @4
            local.get 16
            if  ;; label = @5
              local.get 6
              i32.const -4
              i32.add
              i32.load
              local.tee 11
              if  ;; label = @6
                local.get 11
                i32.const 10
                i32.rem_u
                if  ;; label = @7
                  i32.const 0
                  local.set 7
                else
                  i32.const 0
                  local.set 7
                  i32.const 10
                  local.set 10
                  loop  ;; label = @8
                    local.get 7
                    i32.const 1
                    i32.add
                    local.set 7
                    local.get 11
                    local.get 10
                    i32.const 10
                    i32.mul
                    local.tee 10
                    i32.rem_u
                    i32.eqz
                    br_if 0 (;@8;)
                  end
                end
              else
                i32.const 9
                local.set 7
              end
            else
              i32.const 9
              local.set 7
            end
            local.get 6
            local.get 12
            i32.sub
            i32.const 2
            i32.shr_s
            i32.const 9
            i32.mul
            i32.const -9
            i32.add
            local.set 10
            local.get 5
            i32.const 32
            i32.or
            i32.const 102
            i32.eq
            if  ;; label = @5
              local.get 3
              local.get 10
              local.get 7
              i32.sub
              local.tee 7
              i32.const 0
              i32.gt_s
              if (result i32)  ;; label = @6
                local.get 7
              else
                i32.const 0
                local.tee 7
              end
              i32.ge_s
              if  ;; label = @6
                local.get 7
                local.set 3
              end
            else
              local.get 3
              local.get 10
              local.get 8
              i32.add
              local.get 7
              i32.sub
              local.tee 7
              i32.const 0
              i32.gt_s
              if (result i32)  ;; label = @6
                local.get 7
              else
                i32.const 0
                local.tee 7
              end
              i32.ge_s
              if  ;; label = @6
                local.get 7
                local.set 3
              end
            end
            i32.const 0
            local.set 10
          end
        else
          local.get 10
          local.set 3
          local.get 4
          i32.const 8
          i32.and
          local.set 10
        end
        local.get 5
        i32.const 32
        i32.or
        i32.const 102
        i32.eq
        local.tee 21
        if  ;; label = @3
          i32.const 0
          local.set 7
          local.get 8
          i32.const 0
          i32.le_s
          if  ;; label = @4
            i32.const 0
            local.set 8
          end
        else
          local.get 19
          local.get 8
          i32.const 0
          i32.lt_s
          if (result i32)  ;; label = @4
            local.get 20
          else
            local.get 8
          end
          i64.extend_i32_s
          local.get 19
          call 9
          local.tee 7
          i32.sub
          i32.const 2
          i32.lt_s
          if  ;; label = @4
            loop  ;; label = @5
              local.get 7
              i32.const -1
              i32.add
              local.tee 7
              i32.const 48
              i32.store8
              local.get 19
              local.get 7
              i32.sub
              i32.const 2
              i32.lt_s
              br_if 0 (;@5;)
            end
          end
          local.get 7
          i32.const -1
          i32.add
          local.get 8
          i32.const 31
          i32.shr_s
          i32.const 2
          i32.and
          i32.const 43
          i32.add
          i32.store8
          local.get 7
          i32.const -2
          i32.add
          local.tee 7
          local.get 5
          i32.store8
          local.get 19
          local.get 7
          i32.sub
          local.set 8
        end
        local.get 0
        i32.const 32
        local.get 2
        local.get 17
        i32.const 1
        i32.add
        local.get 3
        i32.add
        local.get 3
        local.get 10
        i32.or
        local.tee 22
        i32.const 0
        i32.ne
        i32.add
        local.get 8
        i32.add
        local.tee 11
        local.get 4
        call 7
        local.get 0
        local.get 14
        local.get 17
        call 6
        local.get 0
        i32.const 48
        local.get 2
        local.get 11
        local.get 4
        i32.const 65536
        i32.xor
        call 7
        local.get 21
        if  ;; label = @3
          local.get 15
          i32.const 9
          i32.add
          local.tee 14
          local.set 10
          local.get 15
          i32.const 8
          i32.add
          local.set 8
          local.get 9
          local.get 12
          i32.gt_u
          if (result i32)  ;; label = @4
            local.get 12
          else
            local.get 9
          end
          local.tee 7
          local.set 9
          loop  ;; label = @4
            local.get 9
            i32.load
            i64.extend_i32_u
            local.get 14
            call 9
            local.set 5
            local.get 9
            local.get 7
            i32.eq
            if  ;; label = @5
              local.get 5
              local.get 14
              i32.eq
              if  ;; label = @6
                local.get 8
                i32.const 48
                i32.store8
                local.get 8
                local.set 5
              end
            else
              local.get 5
              local.get 15
              i32.gt_u
              if  ;; label = @6
                local.get 15
                i32.const 48
                local.get 5
                local.get 18
                i32.sub
                call 10
                drop
                loop  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  local.get 15
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
            end
            local.get 0
            local.get 5
            local.get 10
            local.get 5
            i32.sub
            call 6
            local.get 9
            i32.const 4
            i32.add
            local.tee 5
            local.get 12
            i32.le_u
            if  ;; label = @5
              local.get 5
              local.set 9
              br 1 (;@4;)
            end
          end
          local.get 22
          if  ;; label = @4
            local.get 0
            i32.const 1955
            i32.const 1
            call 6
          end
          local.get 5
          local.get 6
          i32.lt_u
          local.get 3
          i32.const 0
          i32.gt_s
          i32.and
          if  ;; label = @4
            loop  ;; label = @5
              local.get 5
              i32.load
              i64.extend_i32_u
              local.get 14
              call 9
              local.tee 9
              local.get 15
              i32.gt_u
              if  ;; label = @6
                local.get 15
                i32.const 48
                local.get 9
                local.get 18
                i32.sub
                call 10
                drop
                loop  ;; label = @7
                  local.get 9
                  i32.const -1
                  i32.add
                  local.tee 9
                  local.get 15
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              local.get 9
              local.get 3
              i32.const 9
              i32.lt_s
              if (result i32)  ;; label = @6
                local.get 3
              else
                i32.const 9
              end
              call 6
              local.get 3
              i32.const -9
              i32.add
              local.set 9
              local.get 5
              i32.const 4
              i32.add
              local.tee 5
              local.get 6
              i32.lt_u
              local.get 3
              i32.const 9
              i32.gt_s
              i32.and
              if  ;; label = @6
                local.get 9
                local.set 3
                br 1 (;@5;)
              else
                local.get 9
                local.set 3
              end
            end
          end
          local.get 0
          i32.const 48
          local.get 3
          i32.const 9
          i32.add
          i32.const 9
          i32.const 0
          call 7
        else
          local.get 9
          i32.const 4
          i32.add
          local.set 5
          local.get 16
          if (result i32)  ;; label = @4
            local.get 6
          else
            local.get 5
          end
          local.set 12
          local.get 3
          i32.const -1
          i32.gt_s
          if  ;; label = @4
            local.get 10
            i32.eqz
            local.set 17
            local.get 15
            i32.const 9
            i32.add
            local.tee 10
            local.set 16
            i32.const 0
            local.get 18
            i32.sub
            local.set 18
            local.get 15
            i32.const 8
            i32.add
            local.set 14
            local.get 3
            local.set 5
            local.get 9
            local.set 6
            loop  ;; label = @5
              local.get 6
              i32.load
              i64.extend_i32_u
              local.get 10
              call 9
              local.tee 3
              local.get 10
              i32.eq
              if  ;; label = @6
                local.get 14
                i32.const 48
                i32.store8
                local.get 14
                local.set 3
              end
              block  ;; label = @6
                local.get 6
                local.get 9
                i32.eq
                if  ;; label = @7
                  local.get 3
                  i32.const 1
                  i32.add
                  local.set 8
                  local.get 0
                  local.get 3
                  i32.const 1
                  call 6
                  local.get 17
                  local.get 5
                  i32.const 1
                  i32.lt_s
                  i32.and
                  if  ;; label = @8
                    local.get 8
                    local.set 3
                    br 2 (;@6;)
                  end
                  local.get 0
                  i32.const 1955
                  i32.const 1
                  call 6
                  local.get 8
                  local.set 3
                else
                  local.get 3
                  local.get 15
                  i32.le_u
                  br_if 1 (;@6;)
                  local.get 15
                  i32.const 48
                  local.get 3
                  local.get 18
                  i32.add
                  call 10
                  drop
                  loop  ;; label = @8
                    local.get 3
                    i32.const -1
                    i32.add
                    local.tee 3
                    local.get 15
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                end
              end
              local.get 0
              local.get 3
              local.get 5
              local.get 16
              local.get 3
              i32.sub
              local.tee 3
              i32.gt_s
              if (result i32)  ;; label = @6
                local.get 3
              else
                local.get 5
              end
              call 6
              local.get 6
              i32.const 4
              i32.add
              local.tee 6
              local.get 12
              i32.lt_u
              local.get 5
              local.get 3
              i32.sub
              local.tee 5
              i32.const -1
              i32.gt_s
              i32.and
              br_if 0 (;@5;)
              local.get 5
              local.set 3
            end
          end
          local.get 0
          i32.const 48
          local.get 3
          i32.const 18
          i32.add
          i32.const 18
          i32.const 0
          call 7
          local.get 0
          local.get 7
          local.get 19
          local.get 7
          i32.sub
          call 6
        end
        local.get 0
        i32.const 32
        local.get 2
        local.get 11
        local.get 4
        i32.const 8192
        i32.xor
        call 7
        local.get 11
      end
    end
    local.set 0
    local.get 13
    global.set 2
    local.get 0
    local.get 2
    i32.lt_s
    if (result i32)  ;; label = @1
      local.get 2
    else
      local.get 0
    end)
  (func (;30;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 1
    i32.const 255
    i32.and
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 0
        i32.ne
        local.tee 3
        local.get 0
        i32.const 3
        i32.and
        i32.const 0
        i32.ne
        i32.and
        if  ;; label = @3
          local.get 1
          i32.const 255
          i32.and
          local.set 5
          loop  ;; label = @4
            local.get 0
            i32.load8_u
            local.get 5
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -1
            i32.add
            local.tee 2
            i32.const 0
            i32.ne
            local.tee 3
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            i32.const 3
            i32.and
            i32.const 0
            i32.ne
            i32.and
            br_if 0 (;@4;)
          end
        end
        local.get 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      i32.load8_u
      local.get 1
      i32.const 255
      i32.and
      local.tee 3
      i32.eq
      if  ;; label = @2
        local.get 2
        local.set 1
      else
        local.get 4
        i32.const 16843009
        i32.mul
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 3
            i32.gt_u
            if  ;; label = @5
              local.get 2
              local.set 1
              loop  ;; label = @6
                local.get 0
                i32.load
                local.get 4
                i32.xor
                local.tee 2
                i32.const -2139062144
                i32.and
                i32.const -2139062144
                i32.xor
                local.get 2
                i32.const -16843009
                i32.add
                i32.and
                i32.eqz
                if  ;; label = @7
                  local.get 0
                  i32.const 4
                  i32.add
                  local.set 0
                  local.get 1
                  i32.const -4
                  i32.add
                  local.tee 1
                  i32.const 3
                  i32.gt_u
                  br_if 1 (;@6;)
                  br 3 (;@4;)
                end
              end
            else
              local.get 2
              local.set 1
              br 1 (;@4;)
            end
            br 1 (;@3;)
          end
          local.get 1
          i32.eqz
          if  ;; label = @4
            i32.const 0
            local.set 1
            br 3 (;@1;)
          end
        end
        loop  ;; label = @3
          local.get 0
          i32.load8_u
          local.get 3
          i32.eq
          br_if 2 (;@1;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
        end
      end
    end
    local.get 1
    if (result i32)  ;; label = @1
      local.get 0
    else
      i32.const 0
    end)
  (func (;31;) (type 7) (param i64 i32) (result i32)
    local.get 0
    i64.const 0
    i64.ne
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 0
        i32.wrap_i64
        i32.const 7
        i32.and
        i32.const 48
        i32.or
        i32.store8
        local.get 0
        i64.const 3
        i64.shr_u
        local.tee 0
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func (;32;) (type 6) (param i64 i32 i32) (result i32)
    local.get 0
    i64.const 0
    i64.ne
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 0
        i32.wrap_i64
        i32.const 15
        i32.and
        i32.const 1939
        i32.add
        i32.load8_u
        local.get 2
        i32.or
        i32.store8
        local.get 0
        i64.const 4
        i64.shr_u
        local.tee 0
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func (;33;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 2
    local.set 4
    global.get 2
    i32.const 224
    i32.add
    global.set 2
    local.get 4
    i32.const 136
    i32.add
    local.set 5
    local.get 4
    i32.const 80
    i32.add
    local.tee 3
    i64.const 0
    i64.store align=4
    local.get 3
    i64.const 0
    i64.store offset=8 align=4
    local.get 3
    i64.const 0
    i64.store offset=16 align=4
    local.get 3
    i64.const 0
    i64.store offset=24 align=4
    local.get 3
    i64.const 0
    i64.store offset=32 align=4
    local.get 4
    i32.const 120
    i32.add
    local.tee 6
    local.get 2
    i32.load
    i32.store
    i32.const 0
    local.get 1
    local.get 6
    local.get 4
    local.get 3
    call 11
    i32.const 0
    i32.lt_s
    if  ;; label = @1
      i32.const -1
      local.set 1
    else
      local.get 0
      i32.load offset=76
      i32.const -1
      i32.gt_s
      if (result i32)  ;; label = @2
        i32.const 0
      else
        i32.const 0
      end
      local.set 2
      local.get 0
      i32.load
      local.set 7
      local.get 0
      i32.load8_s offset=74
      i32.const 1
      i32.lt_s
      if  ;; label = @2
        local.get 0
        local.get 7
        i32.const -33
        i32.and
        i32.store
      end
      local.get 0
      i32.const 48
      i32.add
      local.tee 8
      i32.load
      if  ;; label = @2
        local.get 0
        local.get 1
        local.get 6
        local.get 4
        local.get 3
        call 11
        local.set 1
      else
        local.get 0
        i32.const 44
        i32.add
        local.tee 9
        i32.load
        local.set 10
        local.get 9
        local.get 5
        i32.store
        local.get 0
        i32.const 28
        i32.add
        local.tee 12
        local.get 5
        i32.store
        local.get 0
        i32.const 20
        i32.add
        local.tee 11
        local.get 5
        i32.store
        local.get 8
        i32.const 80
        i32.store
        local.get 0
        i32.const 16
        i32.add
        local.tee 13
        local.get 5
        i32.const 80
        i32.add
        i32.store
        local.get 0
        local.get 1
        local.get 6
        local.get 4
        local.get 3
        call 11
        local.set 1
        local.get 10
        if  ;; label = @3
          local.get 0
          i32.const 0
          i32.const 0
          local.get 0
          i32.load offset=36
          i32.const 3
          i32.and
          i32.const 2
          i32.add
          call_indirect (type 0)
          drop
          local.get 11
          i32.load
          i32.eqz
          if  ;; label = @4
            i32.const -1
            local.set 1
          end
          local.get 9
          local.get 10
          i32.store
          local.get 8
          i32.const 0
          i32.store
          local.get 13
          i32.const 0
          i32.store
          local.get 12
          i32.const 0
          i32.store
          local.get 11
          i32.const 0
          i32.store
        end
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 3
      local.get 7
      i32.const 32
      i32.and
      i32.or
      i32.store
      local.get 3
      i32.const 32
      i32.and
      if  ;; label = @2
        i32.const -1
        local.set 1
      end
    end
    local.get 4
    global.set 2
    local.get 1)
  (func (;34;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get 2
    local.set 3
    global.get 2
    i32.const 32
    i32.add
    global.set 2
    local.get 3
    i32.const 16
    i32.add
    local.set 4
    local.get 0
    i32.const 3
    i32.store offset=36
    local.get 0
    i32.load
    i32.const 64
    i32.and
    i32.eqz
    if  ;; label = @1
      local.get 3
      local.get 0
      i32.load offset=60
      i32.store
      local.get 3
      i32.const 21523
      i32.store offset=4
      local.get 3
      local.get 4
      i32.store offset=8
      i32.const 54
      local.get 3
      call 3
      if  ;; label = @2
        local.get 0
        i32.const -1
        i32.store8 offset=75
      end
    end
    local.get 0
    local.get 1
    local.get 2
    call 17
    local.set 0
    local.get 3
    global.set 2
    local.get 0)
  (func (;35;) (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    global.get 2
    local.set 3
    global.get 2
    i32.const 32
    i32.add
    global.set 2
    local.get 3
    local.get 0
    i32.load offset=60
    i32.store
    local.get 3
    i32.const 0
    i32.store offset=4
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 3
    i32.const 20
    i32.add
    local.tee 0
    i32.store offset=12
    local.get 3
    local.get 2
    i32.store offset=16
    i32.const 140
    local.get 3
    call 1
    local.tee 1
    i32.const -4096
    i32.gt_u
    if (result i32)  ;; label = @1
      i32.const 4412
      i32.const 0
      local.get 1
      i32.sub
      i32.store
      i32.const -1
    else
      local.get 1
    end
    i32.const 0
    i32.lt_s
    if (result i32)  ;; label = @1
      local.get 0
      i32.const -1
      i32.store
      i32.const -1
    else
      local.get 0
      i32.load
    end
    local.set 0
    local.get 3
    global.set 2
    local.get 0)
  (func (;36;) (type 1) (param i32) (result i32)
    (local i32)
    global.get 2
    local.set 1
    global.get 2
    i32.const 16
    i32.add
    global.set 2
    local.get 1
    local.get 0
    i32.load offset=60
    i32.store
    i32.const 6
    local.get 1
    call 4
    local.tee 0
    i32.const -4096
    i32.gt_u
    if (result i32)  ;; label = @1
      i32.const 4412
      i32.const 0
      local.get 0
      i32.sub
      i32.store
      i32.const -1
    else
      local.get 0
    end
    local.set 0
    local.get 1
    global.set 2
    local.get 0)
  (func (;37;) (type 1) (param i32) (result i32)
    (local i32)
    global.get 2
    local.set 1
    global.get 2
    local.get 0
    i32.add
    global.set 2
    global.get 2
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set 2
    local.get 1)
  (global (;2;) (mut i32) (global.get 1))
  (export "_main" (func 18))
  (export "stackAlloc" (func 37))
  (elem (;0;) (global.get 0) 20 36 19 34 35 17)
  (data (;0;) (i32.const 1024) "\04\04\00\00\05")
  (data (;1;) (i32.const 1040) "\01")
  (data (;2;) (i32.const 1064) "\01\00\00\00\02\00\00\00H\11\00\00\00\04")
  (data (;3;) (i32.const 1088) "\01")
  (data (;4;) (i32.const 1103) "\0a\ff\ff\ff\ff")
  (data (;5;) (i32.const 1340) "$\11")
  (data (;6;) (i32.const 1396) "error: %d\5cn\00final: %d:%d.\0a\00\11\00\0a\00\11\11\11\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b")
  (data (;7;) (i32.const 1455) "\11\00\0f\0a\11\11\11\03\0a\07\00\01\13\09\0b\0b\00\00\09\06\0b\00\00\0b\00\06\11\00\00\00\11\11\11")
  (data (;8;) (i32.const 1504) "\0b")
  (data (;9;) (i32.const 1513) "\11\00\0a\0a\11\11\11\00\0a\00\00\02\00\09\0b\00\00\00\09\00\0b\00\00\0b")
  (data (;10;) (i32.const 1562) "\0c")
  (data (;11;) (i32.const 1574) "\0c\00\00\00\00\0c\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c")
  (data (;12;) (i32.const 1620) "\0e")
  (data (;13;) (i32.const 1632) "\0d\00\00\00\04\0d\00\00\00\00\09\0e\00\00\00\00\00\0e\00\00\0e")
  (data (;14;) (i32.const 1678) "\10")
  (data (;15;) (i32.const 1690) "\0f\00\00\00\00\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\12\00\00\00\12\12\12")
  (data (;16;) (i32.const 1745) "\12\00\00\00\12\12\12\00\00\00\00\00\00\09")
  (data (;17;) (i32.const 1794) "\0b")
  (data (;18;) (i32.const 1806) "\0a\00\00\00\00\0a\00\00\00\00\09\0b\00\00\00\00\00\0b\00\00\0b")
  (data (;19;) (i32.const 1852) "\0c")
  (data (;20;) (i32.const 1864) "\0c\00\00\00\00\0c\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\00-+   0X0x\00(null)\00-0X+0X 0X-0x+0x 0x\00inf\00INF\00nan\00NAN\000123456789ABCDEF.\00T!\22\19\0d\01\02\03\11K\1c\0c\10\04\0b\1d\12\1e'hnopqb \05\06\0f\13\14\15\1a\08\16\07($\17\18\09\0a\0e\1b\1f%#\83\82}&*+<=>?CGJMXYZ[\5c]^_`acdefgijklrstyz{|\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is down\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00Block device required\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Device not a stream\00No data available\00Device timeout\00Out of streams resources\00Link has been severed\00Protocol error\00Bad message\00File descriptor in bad state\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Socket type not supported\00Not supported\00Protocol family not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Cannot send after socket shutdown\00Operation already in progress\00Operation in progress\00Stale file handle\00Remote I/O error\00Quota exceeded\00No medium found\00Wrong medium type\00No error information"))
