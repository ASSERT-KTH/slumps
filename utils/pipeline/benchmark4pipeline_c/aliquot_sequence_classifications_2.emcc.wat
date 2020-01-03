(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32)))
  (type (;6;) (func))
  (import "env" "getTempRet0" (func (;0;) (type 0)))
  (import "env" "___muldi3" (func (;1;) (type 1)))
  (import "env" "___udivdi3" (func (;2;) (type 1)))
  (import "env" "___uremdi3" (func (;3;) (type 1)))
  (import "env" "_bitshift64Lshr" (func (;4;) (type 2)))
  (import "env" "_bitshift64Shl" (func (;5;) (type 2)))
  (import "env" "_fclose" (func (;6;) (type 3)))
  (import "env" "_fgets" (func (;7;) (type 2)))
  (import "env" "_fopen" (func (;8;) (type 4)))
  (import "env" "_i64Add" (func (;9;) (type 1)))
  (import "env" "_i64Subtract" (func (;10;) (type 1)))
  (import "env" "_printf" (func (;11;) (type 4)))
  (import "env" "_strchr" (func (;12;) (type 4)))
  (import "env" "_strtoull" (func (;13;) (type 2)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;14;) (type 5) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 2
    global.get 1
    i32.const 224
    i32.add
    global.set 1
    local.get 2
    i32.const 216
    i32.add
    local.set 19
    local.get 2
    i32.const 208
    i32.add
    local.set 20
    local.get 2
    i32.const 192
    i32.add
    local.set 16
    local.get 2
    i32.const 184
    i32.add
    local.set 21
    local.get 2
    i32.const 176
    i32.add
    local.set 22
    local.get 2
    i32.const 160
    i32.add
    local.set 17
    local.get 2
    i32.const 152
    i32.add
    local.set 23
    local.get 2
    i32.const 144
    i32.add
    local.set 24
    local.get 2
    i32.const 128
    i32.add
    local.set 18
    local.get 2
    local.tee 9
    local.get 0
    i32.store
    local.get 2
    i32.const 4
    i32.add
    local.get 1
    i32.store
    local.get 1
    local.set 13
    local.get 0
    local.set 10
    i32.const 1
    local.set 12
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 10
            i32.const 1
            i32.and
            if (result i32)  ;; label = @5
              i32.const 1
              local.set 3
              local.get 13
              local.set 2
              local.get 10
              local.set 6
              i32.const 0
            else
              i32.const 0
              local.set 7
              i32.const 0
              local.set 4
              local.get 10
              local.set 3
              local.get 13
              local.set 2
              loop  ;; label = @6
                local.get 7
                local.get 4
                i32.const 1
                i32.const 0
                call 9
                local.set 5
                call 0
                local.set 8
                local.get 3
                local.get 2
                i32.const 1
                call 4
                local.set 6
                call 0
                local.set 2
                local.get 3
                i32.const 2
                i32.and
                i32.eqz
                if  ;; label = @7
                  local.get 5
                  local.set 7
                  local.get 8
                  local.set 4
                  local.get 6
                  local.set 3
                  br 1 (;@6;)
                end
              end
              local.get 5
              local.get 8
              i32.or
              if (result i32)  ;; label = @6
                local.get 7
                local.get 4
                i32.const 2
                i32.const 0
                call 9
                local.tee 11
                call 0
                local.tee 8
                i32.or
                if (result i32)  ;; label = @7
                  i32.const 1
                  local.set 3
                  i32.const 0
                  local.set 7
                  i32.const 0
                  local.set 4
                  i32.const 0
                  local.set 5
                  loop  ;; label = @8
                    local.get 3
                    local.get 7
                    i32.const 1
                    call 5
                    local.set 3
                    call 0
                    local.set 7
                    local.get 4
                    local.get 5
                    i32.const 1
                    i32.const 0
                    call 9
                    local.set 4
                    call 0
                    local.tee 5
                    local.get 8
                    i32.lt_u
                    local.get 5
                    local.get 8
                    i32.eq
                    local.get 4
                    local.get 11
                    i32.lt_u
                    i32.and
                    i32.or
                    br_if 0 (;@8;)
                  end
                  local.get 3
                  local.get 7
                  i32.const -1
                  i32.const -1
                  call 9
                  local.set 3
                  call 0
                else
                  i32.const 0
                  local.set 3
                  i32.const 0
                end
              else
                i32.const 1
                local.set 3
                i32.const 0
              end
            end
            local.set 7
            local.get 2
            i32.eqz
            local.get 6
            i32.const 9
            i32.lt_u
            i32.and
            local.get 2
            i32.const 0
            i32.lt_u
            i32.or
            i32.eqz
            if  ;; label = @5
              i32.const 3
              local.set 8
              i32.const 0
              local.set 11
              loop  ;; label = @6
                local.get 6
                local.get 2
                local.get 8
                local.get 11
                call 3
                call 0
                i32.or
                i32.eqz
                if  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    local.set 5
                    i32.const 0
                    local.set 4
                    loop  ;; label = @9
                      local.get 5
                      local.get 4
                      i32.const 1
                      i32.const 0
                      call 9
                      local.set 14
                      call 0
                      local.set 15
                      local.get 6
                      local.get 2
                      local.get 8
                      local.get 11
                      call 2
                      local.tee 6
                      call 0
                      local.tee 2
                      local.get 8
                      local.get 11
                      call 3
                      call 0
                      i32.or
                      i32.eqz
                      if  ;; label = @10
                        local.get 14
                        local.set 5
                        local.get 15
                        local.set 4
                        br 1 (;@9;)
                      end
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 5
                          i32.const -1
                          i32.sub
                          br_table 1 (;@10;) 0 (;@11;) 2 (;@9;)
                        end
                        local.get 4
                        i32.eqz
                        if  ;; label = @11
                          local.get 3
                          local.get 7
                          local.get 8
                          local.get 11
                          i32.const 1
                          i32.const 0
                          call 9
                          call 0
                          call 1
                          local.set 3
                          call 0
                          local.set 7
                          br 3 (;@8;)
                        end
                        br 1 (;@9;)
                      end
                      local.get 4
                      i32.const -1
                      i32.eq
                      br_if 1 (;@8;)
                    end
                    local.get 5
                    local.get 4
                    i32.const 2
                    i32.const 0
                    call 9
                    local.tee 26
                    call 0
                    local.tee 25
                    i32.or
                    if  ;; label = @9
                      i32.const 1
                      local.set 4
                      i32.const 0
                      local.set 5
                      i32.const 0
                      local.set 14
                      i32.const 0
                      local.set 15
                      loop  ;; label = @10
                        local.get 4
                        local.get 5
                        local.get 8
                        local.get 11
                        call 1
                        local.set 4
                        call 0
                        local.set 5
                        local.get 14
                        local.get 15
                        i32.const 1
                        i32.const 0
                        call 9
                        local.set 14
                        call 0
                        local.tee 15
                        local.get 25
                        i32.lt_u
                        local.get 15
                        local.get 25
                        i32.eq
                        local.get 14
                        local.get 26
                        i32.lt_u
                        i32.and
                        i32.or
                        br_if 0 (;@10;)
                      end
                    else
                      i32.const 0
                      local.set 5
                      i32.const 1
                      local.set 4
                    end
                    local.get 4
                    local.get 5
                    i32.const -1
                    i32.const -1
                    call 9
                    call 0
                    local.get 8
                    local.get 11
                    i32.const -1
                    i32.const -1
                    call 9
                    call 0
                    call 2
                    call 0
                    local.get 3
                    local.get 7
                    call 1
                    local.set 3
                    call 0
                    local.set 7
                  end
                end
                local.get 8
                local.get 11
                i32.const 2
                i32.const 0
                call 9
                local.tee 8
                call 0
                local.tee 11
                local.get 8
                local.get 11
                call 1
                local.set 4
                call 0
                local.tee 5
                local.get 2
                i32.gt_u
                local.get 2
                local.get 5
                i32.eq
                local.get 4
                local.get 6
                i32.gt_u
                i32.and
                i32.or
                i32.eqz
                br_if 0 (;@6;)
              end
            end
            local.get 6
            local.get 2
            i32.const 1
            i32.const 0
            call 9
            i32.const 1
            local.get 2
            i32.eqz
            local.get 6
            i32.const 2
            i32.gt_u
            i32.and
            local.get 2
            i32.const 0
            i32.gt_u
            i32.or
            local.tee 2
            select
            call 0
            i32.const 0
            local.get 2
            select
            local.get 3
            local.get 7
            call 1
            call 0
            local.get 10
            local.get 13
            call 10
            local.set 2
            call 0
            local.set 6
            local.get 12
            i32.const 3
            i32.shl
            local.get 9
            i32.add
            local.tee 3
            local.get 2
            i32.store
            local.get 3
            i32.const 4
            i32.add
            local.get 6
            i32.store
            local.get 2
            local.get 10
            i32.ne
            local.get 6
            local.get 13
            i32.ne
            i32.or
            local.get 2
            local.get 6
            i32.or
            i32.eqz
            local.tee 7
            local.get 0
            local.get 2
            i32.eq
            local.get 1
            local.get 6
            i32.eq
            i32.and
            local.tee 3
            i32.or
            i32.const 1
            i32.xor
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 12
            i32.const 1
            i32.gt_u
            if  ;; label = @5
              i32.const 1
              local.set 10
              loop  ;; label = @6
                local.get 2
                local.get 10
                i32.const 3
                i32.shl
                local.get 9
                i32.add
                local.tee 13
                i32.load
                i32.eq
                local.get 6
                local.get 13
                i32.const 4
                i32.add
                i32.load
                i32.eq
                i32.and
                br_if 4 (;@2;)
                local.get 10
                i32.const 1
                i32.add
                local.tee 10
                local.get 12
                i32.lt_u
                br_if 0 (;@6;)
              end
            end
            local.get 12
            i32.const 1
            i32.add
            local.tee 12
            i32.const 16
            i32.ge_u
            br_if 3 (;@1;)
            local.get 6
            local.set 13
            local.get 2
            local.set 10
            br 1 (;@3;)
          end
        end
        local.get 9
        i32.const 4
        i32.add
        i32.load
        local.set 1
        local.get 18
        local.get 9
        i32.load
        local.tee 0
        i32.store
        local.get 18
        i32.const 4
        i32.add
        local.get 1
        i32.store
        local.get 18
        local.get 7
        if (result i32)  ;; label = @3
          global.get 0
          i32.const 50
          i32.add
        else
          local.get 3
          local.get 12
          i32.const 1
          i32.eq
          i32.and
          if (result i32)  ;; label = @4
            global.get 0
            i32.const 62
            i32.add
          else
            global.get 0
            i32.const 70
            i32.add
            global.get 0
            i32.const 88
            i32.add
            global.get 0
            i32.const 79
            i32.add
            local.get 3
            select
            global.get 0
            i32.const 88
            i32.add
            local.get 2
            local.get 10
            i32.eq
            local.get 6
            local.get 13
            i32.eq
            i32.and
            select
            local.get 3
            local.get 12
            i32.const 2
            i32.eq
            i32.and
            select
          end
        end
        i32.store offset=8
        global.get 0
        local.get 18
        call 11
        drop
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 24
          local.get 0
          i32.store
          local.get 24
          i32.const 4
          i32.add
          local.get 1
          i32.store
          global.get 0
          i32.const 38
          i32.add
          local.get 24
          call 11
          drop
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          i32.const 3
          i32.shl
          local.get 9
          i32.add
          local.tee 1
          i32.load
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          i32.load
          local.set 1
          local.get 2
          local.get 12
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 23
        local.get 0
        i32.store
        local.get 23
        i32.const 4
        i32.add
        local.get 1
        i32.store
        global.get 0
        i32.const 45
        i32.add
        local.get 23
        call 11
        drop
        local.get 9
        global.set 1
        return
      end
      local.get 9
      i32.const 4
      i32.add
      i32.load
      local.set 1
      local.get 17
      local.get 9
      i32.load
      local.tee 0
      i32.store
      local.get 17
      i32.const 4
      i32.add
      local.get 1
      i32.store
      local.get 17
      global.get 0
      i32.const 97
      i32.add
      i32.store offset=8
      global.get 0
      local.get 17
      call 11
      drop
      i32.const 0
      local.set 2
      loop  ;; label = @2
        local.get 22
        local.get 0
        i32.store
        local.get 22
        i32.const 4
        i32.add
        local.get 1
        i32.store
        global.get 0
        i32.const 38
        i32.add
        local.get 22
        call 11
        drop
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        i32.const 3
        i32.shl
        local.get 9
        i32.add
        local.tee 1
        i32.load
        local.set 0
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.set 1
        local.get 2
        local.get 12
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 21
      local.get 0
      i32.store
      local.get 21
      i32.const 4
      i32.add
      local.get 1
      i32.store
      global.get 0
      i32.const 45
      i32.add
      local.get 21
      call 11
      drop
      local.get 9
      global.set 1
      return
    end
    local.get 9
    i32.const 4
    i32.add
    i32.load
    local.set 1
    local.get 16
    local.get 9
    i32.load
    local.tee 0
    i32.store
    local.get 16
    i32.const 4
    i32.add
    local.get 1
    i32.store
    local.get 16
    global.get 0
    i32.const 104
    i32.add
    i32.store offset=8
    global.get 0
    local.get 16
    call 11
    drop
    i32.const 0
    local.set 2
    loop  ;; label = @1
      local.get 20
      local.get 0
      i32.store
      local.get 20
      i32.const 4
      i32.add
      local.get 1
      i32.store
      global.get 0
      i32.const 38
      i32.add
      local.get 20
      call 11
      drop
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      i32.const 3
      i32.shl
      local.get 9
      i32.add
      local.tee 1
      i32.load
      local.set 0
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.set 1
      local.get 2
      local.get 12
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 19
    local.get 0
    i32.store
    local.get 19
    i32.const 4
    i32.add
    local.get 1
    i32.store
    global.get 0
    i32.const 45
    i32.add
    local.get 19
    call 11
    drop
    local.get 9
    global.set 1)
  (func (;15;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 1
    local.set 2
    global.get 1
    i32.const 32
    i32.add
    global.set 1
    local.get 2
    i32.const 24
    i32.add
    local.set 3
    local.get 0
    i32.const 2
    i32.ne
    if  ;; label = @1
      local.get 3
      local.get 1
      i32.load
      i32.store
      global.get 0
      i32.const 122
      i32.add
      local.get 3
      call 11
      drop
      local.get 2
      global.set 1
      i32.const 0
      return
    end
    local.get 1
    i32.load offset=4
    local.tee 0
    i32.const 46
    call 12
    i32.eqz
    if  ;; label = @1
      local.get 0
      i32.const 0
      i32.const 10
      call 13
      call 0
      call 14
      local.get 2
      global.set 1
      i32.const 0
      return
    end
    local.get 2
    i32.const 21
    local.get 0
    global.get 0
    i32.const 120
    i32.add
    call 8
    local.tee 0
    call 7
    if  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.const 0
        i32.const 10
        call 13
        call 0
        call 14
        local.get 2
        i32.const 21
        local.get 0
        call 7
        br_if 0 (;@2;)
      end
    end
    local.get 0
    call 6
    drop
    local.get 2
    global.set 1
    i32.const 0)
  (func (;16;) (type 6)
    global.get 0
    i32.const 160
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "__post_instantiate" (func 16))
  (export "_main" (func 15))
  (data (;0;) (global.get 0) "\0aInteger : %llu, Type : %s, Series : \00%llu, \00%llu\00Terminating\00Perfect\00Amicable\00Aspiring\00Sociable\00Cyclic\00Non-Terminating\00r\00Usage : %s <positive integer>"))
