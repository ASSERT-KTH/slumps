(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32)))
  (type (;4;) (func))
  (type (;5;) (func (param i32 i32 i32)))
  (type (;6;) (func (param i32 i32)))
  (type (;7;) (func (param i32 i32 i32) (result i32)))
  (import "env" "rand" (func $rand (type 0)))
  (import "env" "printf" (func $printf (type 1)))
  (import "env" "malloc" (func $malloc (type 2)))
  (import "env" "__isoc99_scanf" (func $__isoc99_scanf (type 1)))
  (import "env" "perror" (func $perror (type 3)))
  (import "env" "putchar" (func $putchar (type 2)))
  (import "env" "puts" (func $puts (type 2)))
  (func $__wasm_call_ctors (type 4))
  (func $fliprow (type 5) (param i32 i32 i32)
    i32.const 0
    i32.const 0
    i32.store offset=1024
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2
      i32.shl
      i32.add
      i32.const 4
      i32.add
      i32.load
      local.set 2
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.const 2
        i32.shl
        i32.add
        local.tee 0
        local.get 0
        i32.load
        i32.eqz
        i32.store
        i32.const 0
        i32.const 0
        i32.load offset=1024
        i32.const 1
        i32.add
        local.tee 0
        i32.store offset=1024
        local.get 0
        local.get 1
        i32.lt_s
        br_if 0 (;@2;)
      end
    end)
  (func $flipcol (type 5) (param i32 i32 i32)
    (local i32 i32)
    i32.const 0
    i32.const 1
    i32.store offset=1024
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      local.get 2
      i32.const 2
      i32.shl
      local.set 3
      i32.const 1
      local.set 2
      loop  ;; label = @2
        local.get 0
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.get 3
        i32.add
        local.tee 2
        local.get 2
        i32.load
        i32.eqz
        i32.store
        i32.const 0
        i32.const 0
        i32.load offset=1024
        local.tee 4
        i32.const 1
        i32.add
        local.tee 2
        i32.store offset=1024
        local.get 4
        local.get 1
        i32.lt_s
        br_if 0 (;@2;)
      end
    end)
  (func $initt (type 6) (param i32 i32)
    (local i32)
    i32.const 0
    i32.const 1
    i32.store offset=1024
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      loop  ;; label = @2
        i32.const 0
        i32.const 0
        i32.store offset=1028
        loop  ;; label = @3
          call $rand
          local.set 2
          local.get 0
          i32.const 0
          i32.load offset=1024
          i32.const 2
          i32.shl
          i32.add
          i32.load
          i32.const 0
          i32.load offset=1028
          i32.const 2
          i32.shl
          i32.add
          local.get 2
          i32.const 2
          i32.rem_s
          i32.store
          i32.const 0
          i32.const 0
          i32.load offset=1028
          i32.const 1
          i32.add
          local.tee 2
          i32.store offset=1028
          local.get 2
          local.get 1
          i32.lt_s
          br_if 0 (;@3;)
        end
        i32.const 0
        i32.const 0
        i32.load offset=1024
        local.tee 2
        i32.const 1
        i32.add
        i32.store offset=1024
        local.get 2
        local.get 1
        i32.lt_s
        br_if 0 (;@2;)
      end
    end)
  (func $initb (type 5) (param i32 i32 i32)
    (local i32 i32 i32)
    i32.const 0
    i32.const 1
    i32.store offset=1024
    block  ;; label = @1
      local.get 2
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 1
      local.set 3
      loop  ;; label = @2
        i32.const 0
        local.set 4
        i32.const 0
        i32.const 0
        i32.store offset=1028
        loop  ;; label = @3
          local.get 1
          local.get 3
          i32.const 2
          i32.shl
          local.tee 3
          i32.add
          i32.load
          local.get 4
          i32.const 2
          i32.shl
          local.tee 4
          i32.add
          local.get 0
          local.get 3
          i32.add
          i32.load
          local.get 4
          i32.add
          i32.load
          i32.store
          i32.const 0
          i32.const 0
          i32.load offset=1028
          i32.const 1
          i32.add
          local.tee 4
          i32.store offset=1028
          i32.const 0
          i32.load offset=1024
          local.set 3
          local.get 4
          local.get 2
          i32.lt_s
          br_if 0 (;@3;)
        end
        i32.const 0
        local.get 3
        i32.const 1
        i32.add
        local.tee 4
        i32.store offset=1024
        local.get 3
        local.get 2
        i32.lt_s
        local.set 5
        local.get 4
        local.set 3
        local.get 5
        br_if 0 (;@2;)
      end
      i32.const 0
      i32.const 1
      i32.store offset=1024
      call $rand
      local.set 4
      i32.const 0
      i32.const 0
      i32.store offset=1024
      local.get 1
      local.get 4
      local.get 2
      i32.rem_s
      i32.const 2
      i32.shl
      i32.add
      i32.const 8
      i32.add
      i32.load
      local.set 3
      i32.const 0
      local.set 4
      loop  ;; label = @2
        local.get 3
        local.get 4
        i32.const 2
        i32.shl
        i32.add
        local.tee 4
        local.get 4
        i32.load
        i32.eqz
        i32.store
        i32.const 0
        i32.const 0
        i32.load offset=1024
        i32.const 1
        i32.add
        local.tee 4
        i32.store offset=1024
        local.get 4
        local.get 2
        i32.lt_s
        br_if 0 (;@2;)
      end
      i32.const 0
      i32.const 0
      i32.store offset=1024
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        call $rand
        local.set 4
        i32.const 0
        i32.const 1
        i32.store offset=1024
        local.get 4
        local.get 2
        i32.rem_s
        i32.const 2
        i32.shl
        local.set 0
        i32.const 1
        local.set 4
        loop  ;; label = @3
          local.get 1
          local.get 4
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.get 0
          i32.add
          local.tee 4
          local.get 4
          i32.load
          i32.eqz
          i32.store
          i32.const 0
          i32.const 0
          i32.load offset=1024
          local.tee 3
          i32.const 1
          i32.add
          local.tee 4
          i32.store offset=1024
          local.get 3
          local.get 2
          i32.lt_s
          br_if 0 (;@3;)
        end
        i32.const 0
        local.get 3
        i32.const 2
        i32.add
        i32.store offset=1024
      end
      return
    end
    i32.const 0
    i32.const 0
    i32.store offset=1024)
  (func $printb (type 6) (param i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 2
    global.set 0
    i32.const 32
    call $putchar
    drop
    i32.const 0
    i32.const 0
    i32.store offset=1024
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 2
          local.get 3
          i32.store offset=32
          i32.const 1032
          local.get 2
          i32.const 32
          i32.add
          call $printf
          drop
          i32.const 0
          i32.const 0
          i32.load offset=1024
          i32.const 1
          i32.add
          local.tee 3
          i32.store offset=1024
          local.get 3
          local.get 1
          i32.lt_s
          br_if 0 (;@3;)
        end
        i32.const 10
        call $putchar
        drop
        i32.const 0
        i32.const 1
        i32.store offset=1024
        local.get 1
        i32.const 1
        i32.lt_s
        br_if 1 (;@1;)
        i32.const 1
        local.set 3
        loop  ;; label = @3
          local.get 2
          local.get 3
          i32.const -1
          i32.add
          i32.store offset=16
          i32.const 1036
          local.get 2
          i32.const 16
          i32.add
          call $printf
          drop
          i32.const 0
          local.set 3
          i32.const 0
          i32.const 0
          i32.store offset=1028
          loop  ;; label = @4
            local.get 2
            local.get 0
            i32.const 0
            i32.load offset=1024
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.get 3
            i32.const 2
            i32.shl
            i32.add
            i32.load
            i32.store
            i32.const 1032
            local.get 2
            call $printf
            drop
            i32.const 0
            i32.const 0
            i32.load offset=1028
            i32.const 1
            i32.add
            local.tee 3
            i32.store offset=1028
            local.get 3
            local.get 1
            i32.lt_s
            br_if 0 (;@4;)
          end
          i32.const 10
          call $putchar
          drop
          i32.const 0
          i32.const 0
          i32.load offset=1024
          local.tee 4
          i32.const 1
          i32.add
          local.tee 3
          i32.store offset=1024
          local.get 4
          local.get 1
          i32.lt_s
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      i32.const 10
      call $putchar
      drop
      i32.const 0
      i32.const 1
      i32.store offset=1024
    end
    i32.const 10
    call $putchar
    drop
    local.get 2
    i32.const 48
    i32.add
    global.set 0)
  (func $eq (type 7) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 1
    local.set 3
    i32.const 0
    i32.const 1
    i32.store offset=1024
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        loop  ;; label = @3
          i32.const 0
          i32.const 0
          i32.store offset=1028
          local.get 0
          local.get 4
          i32.const 2
          i32.shl
          local.tee 3
          i32.add
          i32.load
          local.set 5
          local.get 1
          local.get 3
          i32.add
          i32.load
          local.set 6
          i32.const 1
          local.set 3
          loop  ;; label = @4
            local.get 6
            i32.load
            local.get 5
            i32.load
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            local.get 3
            i32.store offset=1028
            local.get 6
            i32.const 4
            i32.add
            local.set 6
            local.get 5
            i32.const 4
            i32.add
            local.set 5
            local.get 3
            local.get 2
            i32.ge_s
            local.set 7
            local.get 3
            i32.const 1
            i32.add
            local.set 3
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          local.set 3
          i32.const 0
          local.get 4
          i32.const 1
          i32.add
          local.tee 5
          i32.store offset=1024
          local.get 4
          local.get 2
          i32.lt_s
          local.set 6
          local.get 5
          local.set 4
          local.get 6
          br_if 0 (;@3;)
        end
      end
      local.get 3
      return
    end
    i32.const 0)
  (func $main (type 4)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    i32.const 15
    call $malloc
    local.tee 1
    i32.const 12
    call $malloc
    local.tee 2
    i32.store offset=4
    local.get 1
    i32.const 12
    call $malloc
    local.tee 3
    i32.store offset=8
    local.get 1
    i32.const 12
    call $malloc
    local.tee 4
    i32.store offset=12
    i32.const 15
    call $malloc
    local.tee 5
    i32.const 12
    call $malloc
    local.tee 6
    i32.store offset=4
    local.get 5
    i32.const 12
    call $malloc
    local.tee 7
    i32.store offset=8
    local.get 5
    i32.const 12
    call $malloc
    local.tee 8
    i32.store offset=12
    i32.const 0
    i32.const 1
    i32.store offset=1024
    i32.const 0
    local.set 9
    loop  ;; label = @1
      block  ;; label = @2
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
                              block  ;; label = @14
                                local.get 9
                                br_table 0 (;@14;) 1 (;@13;) 1 (;@13;)
                              end
                              i32.const 0
                              i32.const 0
                              i32.store offset=1028
                              loop  ;; label = @14
                                call $rand
                                local.set 9
                                local.get 1
                                i32.const 0
                                i32.load offset=1024
                                i32.const 2
                                i32.shl
                                i32.add
                                i32.load
                                i32.const 0
                                i32.load offset=1028
                                i32.const 2
                                i32.shl
                                i32.add
                                local.get 9
                                i32.const 2
                                i32.rem_s
                                i32.store
                                i32.const 0
                                i32.const 0
                                i32.load offset=1028
                                i32.const 1
                                i32.add
                                local.tee 9
                                i32.store offset=1028
                                local.get 9
                                i32.const 3
                                i32.lt_s
                                br_if 0 (;@14;)
                              end
                              i32.const 0
                              i32.const 0
                              i32.load offset=1024
                              local.tee 9
                              i32.const 1
                              i32.add
                              i32.store offset=1024
                              local.get 9
                              i32.const 3
                              i32.lt_s
                              br_if 1 (;@12;)
                              i32.const 3
                              local.set 10
                              local.get 1
                              local.get 5
                              i32.const 3
                              call $initb
                              i32.const 1
                              local.set 11
                              i32.const 0
                              local.set 12
                              i32.const 0
                              i32.const 1
                              i32.store offset=1024
                              i32.const 0
                              i32.const 0
                              i32.store offset=1028
                              block  ;; label = @14
                                local.get 6
                                i32.load
                                local.get 2
                                i32.load
                                i32.ne
                                br_if 0 (;@14;)
                                loop  ;; label = @15
                                  i32.const 0
                                  i32.const 1
                                  i32.store offset=1028
                                  local.get 6
                                  i32.const 4
                                  i32.add
                                  i32.load
                                  local.get 2
                                  i32.const 4
                                  i32.add
                                  i32.load
                                  i32.ne
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  i32.const 2
                                  i32.store offset=1028
                                  local.get 6
                                  i32.const 8
                                  i32.add
                                  i32.load
                                  local.get 2
                                  i32.const 8
                                  i32.add
                                  i32.load
                                  i32.ne
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  i32.const 2
                                  i32.store offset=1024
                                  i32.const 0
                                  i32.const 0
                                  i32.store offset=1028
                                  local.get 7
                                  i32.load
                                  local.get 3
                                  i32.load
                                  i32.ne
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  i32.const 1
                                  i32.store offset=1028
                                  local.get 7
                                  i32.const 4
                                  i32.add
                                  i32.load
                                  local.get 3
                                  i32.const 4
                                  i32.add
                                  i32.load
                                  i32.ne
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  i32.const 2
                                  i32.store offset=1028
                                  local.get 7
                                  i32.const 8
                                  i32.add
                                  i32.load
                                  local.get 3
                                  i32.const 8
                                  i32.add
                                  i32.load
                                  i32.ne
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  i32.const 3
                                  i32.store offset=1024
                                  i32.const 0
                                  i32.const 0
                                  i32.store offset=1028
                                  local.get 8
                                  i32.load
                                  local.get 4
                                  i32.load
                                  i32.ne
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  i32.const 1
                                  i32.store offset=1028
                                  local.get 8
                                  i32.const 4
                                  i32.add
                                  i32.load
                                  local.get 4
                                  i32.const 4
                                  i32.add
                                  i32.load
                                  i32.ne
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  i32.const 2
                                  i32.store offset=1028
                                  local.get 8
                                  i32.const 8
                                  i32.add
                                  i32.load
                                  local.get 4
                                  i32.const 8
                                  i32.add
                                  i32.load
                                  i32.ne
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  i32.const 4
                                  i32.store offset=1024
                                  i32.const 0
                                  i32.const 3
                                  i32.store offset=1028
                                  local.get 1
                                  local.get 5
                                  i32.const 3
                                  call $initb
                                  i32.const 0
                                  i32.const 1
                                  i32.store offset=1024
                                  i32.const 0
                                  i32.const 0
                                  i32.store offset=1028
                                  local.get 6
                                  i32.load
                                  local.get 2
                                  i32.load
                                  i32.eq
                                  br_if 0 (;@15;)
                                end
                              end
                              i32.const 1039
                              local.set 13
                              i32.const 1048
                              local.set 14
                              i32.const 1056
                              local.set 15
                              i32.const 1071
                              local.set 16
                              i32.const 1032
                              local.set 17
                              i32.const 99
                              local.set 18
                              i32.const 2
                              local.set 19
                              i32.const 1111
                              local.set 20
                              i32.const 4
                              local.set 21
                              i32.const 8
                              local.set 22
                              i32.const 114
                              local.set 23
                              i32.const 1075
                              local.set 24
                              i32.const 0
                              local.set 25
                              br 2 (;@11;)
                            end
                            local.get 13
                            call $puts
                            drop
                            local.get 1
                            local.get 10
                            call $printb
                            local.get 14
                            call $puts
                            drop
                            local.get 5
                            local.get 10
                            call $printb
                            local.get 15
                            local.get 12
                            call $printf
                            drop
                            local.get 0
                            local.get 0
                            i32.const 47
                            i32.add
                            i32.store offset=32
                            local.get 16
                            local.get 0
                            i32.const 32
                            i32.add
                            call $__isoc99_scanf
                            drop
                            local.get 0
                            local.get 0
                            i32.const 40
                            i32.add
                            i32.store offset=16
                            local.get 17
                            local.get 0
                            i32.const 16
                            i32.add
                            call $__isoc99_scanf
                            drop
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                i32.load8_s offset=47
                                local.tee 9
                                local.get 18
                                i32.eq
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  local.get 9
                                  local.get 23
                                  i32.eq
                                  br_if 0 (;@15;)
                                  local.get 24
                                  call $perror
                                  br 2 (;@13;)
                                end
                                i32.const 0
                                local.set 9
                                i32.const 0
                                i32.const 0
                                i32.store offset=1024
                                local.get 5
                                local.get 0
                                i32.load offset=40
                                local.get 19
                                i32.shl
                                i32.add
                                local.get 21
                                i32.add
                                i32.load
                                local.set 26
                                loop  ;; label = @15
                                  local.get 26
                                  local.get 9
                                  local.get 19
                                  i32.shl
                                  i32.add
                                  local.tee 9
                                  local.get 9
                                  i32.load
                                  i32.eqz
                                  i32.store
                                  local.get 12
                                  local.get 12
                                  i32.load offset=1024
                                  local.get 11
                                  i32.add
                                  local.tee 9
                                  i32.store offset=1024
                                  local.get 9
                                  local.get 10
                                  i32.lt_s
                                  br_if 0 (;@15;)
                                  br 2 (;@13;)
                                end
                              end
                              i32.const 2
                              local.set 9
                              local.get 12
                              i32.const 2
                              i32.store offset=1024
                              local.get 6
                              local.get 0
                              i32.load offset=40
                              local.tee 27
                              i32.const 2
                              i32.shl
                              i32.add
                              local.tee 26
                              local.get 26
                              i32.load
                              i32.eqz
                              i32.store
                              loop  ;; label = @14
                                local.get 5
                                local.get 9
                                local.get 19
                                i32.shl
                                i32.add
                                i32.load
                                local.get 27
                                local.get 19
                                i32.shl
                                i32.add
                                local.tee 9
                                local.get 9
                                i32.load
                                i32.eqz
                                i32.store
                                local.get 12
                                local.get 12
                                i32.load offset=1024
                                local.tee 26
                                local.get 11
                                i32.add
                                local.tee 9
                                i32.store offset=1024
                                local.get 26
                                local.get 10
                                i32.lt_s
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 0
                            local.get 25
                            local.get 11
                            i32.add
                            local.tee 25
                            i32.store
                            local.get 20
                            local.get 0
                            call $printf
                            drop
                            local.get 12
                            local.get 11
                            i32.store offset=1024
                            local.get 12
                            local.get 12
                            i32.store offset=1028
                            local.get 6
                            i32.load
                            local.get 2
                            i32.load
                            i32.ne
                            br_if 2 (;@10;)
                            local.get 12
                            local.get 11
                            i32.store offset=1028
                            local.get 6
                            local.get 21
                            i32.add
                            i32.load
                            local.get 2
                            local.get 21
                            i32.add
                            i32.load
                            i32.ne
                            br_if 3 (;@9;)
                            local.get 12
                            local.get 19
                            i32.store offset=1028
                            local.get 6
                            local.get 22
                            i32.add
                            i32.load
                            local.get 2
                            local.get 22
                            i32.add
                            i32.load
                            i32.ne
                            br_if 4 (;@8;)
                            local.get 12
                            local.get 19
                            i32.store offset=1024
                            local.get 12
                            local.get 12
                            i32.store offset=1028
                            local.get 7
                            i32.load
                            local.get 3
                            i32.load
                            i32.ne
                            br_if 5 (;@7;)
                            local.get 12
                            local.get 11
                            i32.store offset=1028
                            local.get 7
                            local.get 21
                            i32.add
                            i32.load
                            local.get 3
                            local.get 21
                            i32.add
                            i32.load
                            i32.ne
                            br_if 6 (;@6;)
                            local.get 12
                            local.get 19
                            i32.store offset=1028
                            local.get 7
                            local.get 22
                            i32.add
                            i32.load
                            local.get 3
                            local.get 22
                            i32.add
                            i32.load
                            i32.ne
                            br_if 7 (;@5;)
                            local.get 12
                            local.get 10
                            i32.store offset=1024
                            local.get 12
                            local.get 12
                            i32.store offset=1028
                            local.get 8
                            i32.load
                            local.get 4
                            i32.load
                            i32.ne
                            br_if 8 (;@4;)
                            local.get 12
                            local.get 11
                            i32.store offset=1028
                            local.get 8
                            local.get 21
                            i32.add
                            i32.load
                            local.get 4
                            local.get 21
                            i32.add
                            i32.load
                            i32.ne
                            br_if 9 (;@3;)
                            local.get 12
                            local.get 19
                            i32.store offset=1028
                            local.get 8
                            local.get 22
                            i32.add
                            i32.load
                            local.get 4
                            local.get 22
                            i32.add
                            i32.load
                            i32.ne
                            br_if 10 (;@2;)
                            i32.const 0
                            i32.const 4
                            i32.store offset=1024
                            i32.const 0
                            i32.const 3
                            i32.store offset=1028
                            i32.const 1128
                            call $puts
                            drop
                            local.get 0
                            i32.const 48
                            i32.add
                            global.set 0
                            return
                          end
                          i32.const 0
                          local.set 9
                          br 10 (;@1;)
                        end
                        i32.const 1
                        local.set 9
                        br 9 (;@1;)
                      end
                      i32.const 1
                      local.set 9
                      br 8 (;@1;)
                    end
                    i32.const 1
                    local.set 9
                    br 7 (;@1;)
                  end
                  i32.const 1
                  local.set 9
                  br 6 (;@1;)
                end
                i32.const 1
                local.set 9
                br 5 (;@1;)
              end
              i32.const 1
              local.set 9
              br 4 (;@1;)
            end
            i32.const 1
            local.set 9
            br 3 (;@1;)
          end
          i32.const 1
          local.set 9
          br 2 (;@1;)
        end
        i32.const 1
        local.set 9
        br 1 (;@1;)
      end
      i32.const 1
      local.set 9
      br 0 (;@1;)
    end)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66688))
  (global (;1;) i32 (i32.const 66688))
  (global (;2;) i32 (i32.const 1137))
  (global (;3;) i32 (i32.const 1024))
  (global (;4;) i32 (i32.const 1024))
  (global (;5;) i32 (i32.const 1028))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "fliprow" (func $fliprow))
  (export "flipcol" (func $flipcol))
  (export "initt" (func $initt))
  (export "initb" (func $initb))
  (export "printb" (func $printb))
  (export "eq" (func $eq))
  (export "main" (func $main))
  (export "i" (global 4))
  (export "j" (global 5))
  (data (;0;) (i32.const 1024) "\00\00\00\00\00\00\00\00")
  (data (;1;) (i32.const 1032) " %d\00%d\00Target: \00Board: \00What to flip: \00 %c\00Please specify r or c and an number\00Moves Taken: %d\0a\00You win!\00"))
