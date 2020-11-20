(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func))
  (type (;5;) (func (param i32 i32)))
  (type (;6;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;7;) (func (param i32 i32 i32 i32 i32 i32 i32)))
  (type (;8;) (func (param i32 i32 i32)))
  (type (;9;) (func (param i32 i32 i32 i32)))
  (type (;10;) (func (result i32)))
  (import "env" "malloc" (func $malloc (type 0)))
  (import "env" "free" (func $free (type 1)))
  (import "env" "printf" (func $printf (type 2)))
  (import "env" "puts" (func $puts (type 0)))
  (import "env" "putchar" (func $putchar (type 0)))
  (import "env" "memcpy" (func $memcpy (type 3)))
  (func $__wasm_call_ctors (type 4))
  (func $reverse (type 5) (param i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const -1
      i32.add
      local.tee 2
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 2
      i32.shl
      i32.add
      i32.const -4
      i32.add
      local.set 1
      i32.const 1
      local.set 3
      loop  ;; label = @2
        local.get 0
        i32.load
        local.set 4
        local.get 0
        local.get 1
        i32.load
        i32.store
        local.get 1
        local.get 4
        i32.store
        local.get 0
        i32.const 4
        i32.add
        local.set 0
        local.get 1
        i32.const -4
        i32.add
        local.set 1
        local.get 3
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        i32.lt_s
        local.set 4
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 4
        br_if 0 (;@2;)
      end
    end)
  (func $checkSeq (type 6) (param i32 i32 i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 5
        i32.gt_s
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.tee 6
        local.get 3
        i32.le_s
        br_if 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=4
      local.get 0
      local.get 5
      i32.store
      return
    end
    block  ;; label = @1
      local.get 6
      local.get 3
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      local.get 4
      i32.const 2
      i32.shl
      local.tee 5
      call $malloc
      local.tee 3
      i32.store offset=1024
      local.get 3
      local.get 2
      local.get 5
      call $memcpy
      drop
      local.get 0
      i32.const 1
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
      i32.const 0
      local.get 4
      i32.store offset=1028
      return
    end
    block  ;; label = @1
      local.get 1
      local.get 5
      i32.ge_s
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      call $tryPerm
      return
    end
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    local.get 5
    i32.store)
  (func $tryPerm (type 7) (param i32 i32 i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 7
    global.set 0
    i32.const 0
    local.set 8
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.gt_s
      br_if 0 (;@1;)
      local.get 5
      i32.const 1
      i32.add
      local.tee 9
      i32.const 2
      i32.shl
      local.tee 10
      call $malloc
      local.tee 11
      i32.const 4
      i32.add
      local.get 3
      local.get 5
      i32.const 2
      i32.shl
      call $memcpy
      drop
      local.get 11
      local.get 3
      local.get 1
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.get 3
      i32.load
      i32.add
      local.tee 8
      i32.store
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          local.get 6
          i32.ge_s
          br_if 0 (;@3;)
          local.get 8
          local.get 4
          i32.gt_s
          br_if 0 (;@3;)
          local.get 2
          i32.const 1
          i32.add
          local.set 12
          block  ;; label = @4
            local.get 8
            local.get 4
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 10
            call $malloc
            local.tee 6
            i32.store offset=1024
            local.get 6
            local.get 11
            local.get 10
            call $memcpy
            drop
            i32.const 0
            local.get 9
            i32.store offset=1028
            i32.const 1
            local.set 10
            local.get 7
            i32.const 1
            i32.store offset=12
            local.get 7
            local.get 12
            i32.store offset=8
            local.get 12
            local.set 6
            br 2 (;@2;)
          end
          local.get 12
          local.get 6
          i32.ge_s
          br_if 0 (;@3;)
          local.get 7
          i32.const 8
          i32.add
          i32.const 0
          local.get 12
          local.get 11
          local.get 4
          local.get 9
          local.get 6
          call $tryPerm
          local.get 7
          i32.load offset=12
          local.set 10
          local.get 7
          i32.load offset=8
          local.set 6
          br 1 (;@2;)
        end
        i32.const 0
        local.set 10
        local.get 7
        i32.const 0
        i32.store offset=12
        local.get 7
        local.get 6
        i32.store offset=8
      end
      local.get 7
      i32.const 8
      i32.add
      local.get 1
      i32.const 1
      i32.add
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      local.get 6
      call $tryPerm
      local.get 7
      i32.load offset=12
      local.set 8
      local.get 7
      i32.load offset=8
      local.set 2
      local.get 11
      call $free
      block  ;; label = @2
        local.get 2
        local.get 6
        i32.ge_s
        br_if 0 (;@2;)
        local.get 2
        local.set 6
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        local.get 6
        i32.ne
        br_if 0 (;@2;)
        local.get 8
        local.get 10
        i32.add
        local.set 8
        br 1 (;@1;)
      end
      i32.const 1032
      call $puts
      drop
      i32.const 0
      local.set 6
      i32.const 0
      local.set 8
    end
    local.get 0
    local.get 8
    i32.store offset=4
    local.get 0
    local.get 6
    i32.store
    local.get 7
    i32.const 16
    i32.add
    global.set 0)
  (func $initTryPerm (type 8) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 0
    i32.const 0
    local.get 3
    i32.const 12
    i32.add
    local.get 1
    i32.const 1
    local.get 2
    call $tryPerm
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func $printArray (type 5) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    i32.const 91
    call $putchar
    drop
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.load
        i32.store
        i32.const 1049
        local.get 2
        call $printf
        drop
        local.get 0
        i32.const 4
        i32.add
        local.set 0
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        br_if 0 (;@2;)
      end
    end
    i32.const 1053
    call $puts
    drop
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func $isBrauer (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    i32.const 1
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 3
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        i32.const 4
        i32.add
        local.set 3
        local.get 0
        i32.load offset=4
        local.set 4
        i32.const 2
        local.set 5
        loop  ;; label = @3
          local.get 0
          local.get 5
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.set 6
          local.get 3
          local.set 2
          local.get 5
          local.set 7
          block  ;; label = @4
            loop  ;; label = @5
              local.get 2
              i32.load
              local.get 4
              i32.add
              local.get 6
              i32.eq
              br_if 1 (;@4;)
              local.get 2
              i32.const -4
              i32.add
              local.set 2
              local.get 7
              i32.const -1
              i32.add
              local.tee 7
              i32.const 1
              i32.ge_s
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
          end
          local.get 3
          i32.const 4
          i32.add
          local.set 3
          i32.const 1
          local.set 2
          local.get 6
          local.set 4
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          local.get 1
          i32.lt_s
          br_if 0 (;@3;)
        end
      end
      local.get 2
      return
    end
    i32.const 0)
  (func $isAdditionChain (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 1
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const 3
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      local.set 3
      local.get 0
      i32.load offset=4
      local.tee 4
      local.set 5
      i32.const 2
      local.set 6
      i32.const 0
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    br_table 0 (;@8;) 1 (;@7;) 1 (;@7;)
                  end
                  local.get 5
                  i32.const 1
                  i32.shl
                  local.set 2
                  local.get 0
                  local.get 6
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  local.tee 5
                  local.get 2
                  i32.gt_s
                  br_if 1 (;@6;)
                  local.get 3
                  local.set 7
                  local.get 6
                  local.set 8
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 0
                      local.get 8
                      i32.const -1
                      i32.add
                      local.tee 9
                      i32.const 2
                      i32.shl
                      i32.add
                      i32.load
                      local.tee 10
                      i32.const 1
                      i32.shl
                      local.get 5
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 7
                      local.set 2
                      block  ;; label = @10
                        loop  ;; label = @11
                          local.get 8
                          i32.const -1
                          i32.add
                          local.tee 8
                          i32.const 1
                          i32.lt_s
                          br_if 1 (;@10;)
                          local.get 2
                          i32.load
                          local.set 11
                          local.get 2
                          i32.const -4
                          i32.add
                          local.set 2
                          local.get 11
                          local.get 10
                          i32.add
                          local.get 5
                          i32.ne
                          br_if 0 (;@11;)
                          br 3 (;@8;)
                        end
                      end
                      local.get 7
                      i32.const -4
                      i32.add
                      local.set 7
                      i32.const 0
                      local.set 2
                      local.get 9
                      local.set 8
                      local.get 9
                      i32.const 0
                      i32.gt_s
                      br_if 0 (;@9;)
                      br 8 (;@1;)
                    end
                  end
                  local.get 3
                  i32.const 4
                  i32.add
                  local.set 3
                  local.get 6
                  i32.const 1
                  i32.add
                  local.tee 6
                  local.get 1
                  i32.lt_s
                  br_if 3 (;@4;)
                  i32.const 1
                  local.set 2
                  i32.const 0
                  i32.load offset=1024
                  br_if 6 (;@1;)
                  i32.const 4
                  local.set 12
                  local.get 0
                  i32.const 4
                  i32.add
                  local.set 13
                  i32.const 2
                  local.set 14
                  i32.const -1
                  local.set 15
                  i32.const -4
                  local.set 16
                  i32.const 1
                  local.set 17
                  i32.const 2
                  local.set 18
                  i32.const 1
                  local.set 2
                  br 5 (;@2;)
                end
                local.get 0
                local.get 18
                local.get 14
                i32.shl
                i32.add
                i32.load
                local.set 11
                local.get 13
                local.set 2
                local.get 18
                local.set 8
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 2
                    i32.load
                    local.get 4
                    i32.add
                    local.get 11
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 2
                    local.get 16
                    i32.add
                    local.set 2
                    local.get 8
                    local.get 15
                    i32.add
                    local.tee 8
                    local.get 17
                    i32.ge_s
                    br_if 0 (;@8;)
                    br 3 (;@5;)
                  end
                end
                local.get 13
                local.get 12
                i32.add
                local.set 13
                i32.const 1
                local.set 2
                local.get 11
                local.set 4
                local.get 18
                i32.const 1
                i32.add
                local.tee 18
                local.get 1
                i32.lt_s
                br_if 3 (;@3;)
                br 5 (;@1;)
              end
              i32.const 0
              return
            end
            i32.const 0
            local.get 1
            i32.const 2
            i32.shl
            local.tee 2
            call $malloc
            local.tee 8
            i32.store offset=1024
            local.get 8
            local.get 0
            local.get 2
            call $memcpy
            drop
            i32.const 0
            local.get 1
            i32.store offset=1028
            i32.const 1
            local.set 2
            br 3 (;@1;)
          end
          i32.const 0
          local.set 2
          br 1 (;@2;)
        end
        i32.const 1
        local.set 2
        br 0 (;@2;)
      end
    end
    local.get 2)
  (func $nextChains (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 1
    i32.const 2
    i32.shl
    local.set 4
    local.get 0
    i32.const 1
    i32.add
    local.set 5
    local.get 0
    i32.const -1
    i32.xor
    local.get 1
    i32.add
    local.set 6
    local.get 2
    local.get 0
    i32.const 2
    i32.shl
    i32.add
    local.set 7
    local.get 2
    local.get 1
    i32.const -1
    i32.add
    local.tee 8
    i32.const 2
    i32.shl
    i32.add
    local.set 9
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 8
          local.get 0
          i32.le_s
          br_if 0 (;@3;)
          local.get 5
          local.get 1
          local.get 2
          local.get 3
          call $nextChains
          local.get 6
          local.get 7
          i32.load
          local.tee 10
          i32.add
          local.get 9
          i32.load
          i32.ge_s
          br_if 2 (;@1;)
          i32.const 4
          local.set 11
          local.get 2
          i32.const 4
          i32.add
          local.set 12
          local.get 1
          i32.const -2
          i32.add
          local.get 0
          i32.sub
          local.set 13
          i32.const 2
          local.set 14
          local.get 2
          local.get 0
          i32.const 2
          i32.shl
          i32.add
          i32.const 4
          i32.add
          local.set 15
          i32.const 1
          local.set 16
          i32.const -1
          local.set 17
          local.get 1
          i32.const 3
          i32.lt_s
          local.set 18
          i32.const 0
          local.set 19
          i32.const -4
          local.set 20
          i32.const 1
          local.set 0
          br 1 (;@2;)
        end
        local.get 6
        local.get 7
        i32.load
        local.tee 32
        i32.add
        local.get 9
        i32.load
        i32.ge_s
        br_if 1 (;@1;)
        i32.const 4
        local.set 33
        local.get 2
        i32.const 4
        i32.add
        local.set 34
        local.get 1
        i32.const -2
        i32.add
        local.get 0
        i32.sub
        local.set 35
        i32.const 2
        local.set 36
        local.get 2
        local.get 0
        i32.const 2
        i32.shl
        i32.add
        i32.const 4
        i32.add
        local.set 37
        i32.const 1
        local.set 38
        i32.const -1
        local.set 39
        local.get 1
        i32.const 3
        i32.lt_s
        local.set 40
        i32.const 0
        local.set 41
        i32.const -4
        local.set 42
        i32.const 0
        local.set 0
      end
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      br_table 1 (;@8;) 0 (;@9;) 0 (;@9;)
                    end
                    local.get 7
                    local.get 10
                    local.get 16
                    i32.add
                    i32.store
                    block  ;; label = @9
                      local.get 5
                      local.get 8
                      i32.ge_s
                      br_if 0 (;@9;)
                      local.get 10
                      local.get 14
                      i32.add
                      local.set 0
                      local.get 15
                      local.set 21
                      local.get 13
                      local.set 22
                      loop  ;; label = @10
                        local.get 21
                        local.get 0
                        i32.store
                        local.get 21
                        local.get 11
                        i32.add
                        local.set 21
                        local.get 0
                        local.get 16
                        i32.add
                        local.set 0
                        local.get 22
                        local.get 17
                        i32.add
                        local.tee 22
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 18
                    br_if 4 (;@4;)
                    i32.const 2
                    local.set 23
                    local.get 2
                    local.set 24
                    local.get 2
                    local.get 11
                    i32.add
                    i32.load
                    local.tee 25
                    local.set 26
                    i32.const 0
                    local.set 0
                    br 1 (;@7;)
                  end
                  local.get 7
                  local.get 32
                  local.get 38
                  i32.add
                  i32.store
                  block  ;; label = @8
                    local.get 5
                    local.get 8
                    i32.ge_s
                    br_if 0 (;@8;)
                    local.get 32
                    local.get 36
                    i32.add
                    local.set 0
                    local.get 37
                    local.set 21
                    local.get 35
                    local.set 22
                    loop  ;; label = @9
                      local.get 21
                      local.get 0
                      i32.store
                      local.get 21
                      local.get 33
                      i32.add
                      local.set 21
                      local.get 0
                      local.get 38
                      i32.add
                      local.set 0
                      local.get 22
                      local.get 39
                      i32.add
                      local.tee 22
                      br_if 0 (;@9;)
                    end
                  end
                  local.get 40
                  br_if 1 (;@6;)
                  i32.const 2
                  local.set 43
                  local.get 2
                  local.set 44
                  local.get 2
                  local.get 33
                  i32.add
                  i32.load
                  local.tee 45
                  local.set 46
                  i32.const 2
                  local.set 0
                end
                loop  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                br_table 0 (;@14;) 1 (;@13;) 2 (;@12;) 3 (;@11;) 3 (;@11;)
                              end
                              local.get 26
                              local.get 16
                              i32.shl
                              local.set 0
                              local.get 2
                              local.get 23
                              local.get 14
                              i32.shl
                              i32.add
                              i32.load
                              local.tee 26
                              local.get 0
                              i32.gt_s
                              br_if 10 (;@3;)
                              local.get 24
                              local.set 27
                              local.get 23
                              local.set 28
                              i32.const 0
                              local.set 0
                              br 5 (;@8;)
                            end
                            local.get 2
                            local.get 30
                            local.get 14
                            i32.shl
                            i32.add
                            i32.load
                            local.set 22
                            local.get 31
                            local.set 0
                            local.get 30
                            local.set 21
                            block  ;; label = @13
                              block  ;; label = @14
                                loop  ;; label = @15
                                  local.get 0
                                  i32.load
                                  local.get 25
                                  i32.add
                                  local.get 22
                                  i32.eq
                                  br_if 1 (;@14;)
                                  local.get 0
                                  local.get 20
                                  i32.add
                                  local.set 0
                                  local.get 21
                                  local.get 17
                                  i32.add
                                  local.tee 21
                                  local.get 19
                                  i32.gt_s
                                  br_if 0 (;@15;)
                                  br 2 (;@13;)
                                end
                              end
                              local.get 31
                              local.get 11
                              i32.add
                              local.set 31
                              local.get 22
                              local.set 25
                              local.get 30
                              local.get 16
                              i32.add
                              local.tee 30
                              local.get 1
                              i32.lt_s
                              br_if 3 (;@10;)
                              br 9 (;@4;)
                            end
                            local.get 19
                            local.get 4
                            call $malloc
                            local.tee 0
                            i32.store offset=1024
                            local.get 0
                            local.get 2
                            local.get 4
                            call $memcpy
                            drop
                            local.get 19
                            local.get 1
                            i32.store offset=1028
                            br 8 (;@4;)
                          end
                          local.get 46
                          local.get 38
                          i32.shl
                          local.set 0
                          local.get 2
                          local.get 43
                          local.get 36
                          i32.shl
                          i32.add
                          i32.load
                          local.tee 46
                          local.get 0
                          i32.gt_s
                          br_if 6 (;@5;)
                          local.get 44
                          local.set 47
                          local.get 43
                          local.set 48
                          i32.const 1
                          local.set 0
                          br 3 (;@8;)
                        end
                        local.get 2
                        local.get 49
                        local.get 36
                        i32.shl
                        i32.add
                        i32.load
                        local.set 22
                        local.get 50
                        local.set 0
                        local.get 49
                        local.set 21
                        block  ;; label = @11
                          block  ;; label = @12
                            loop  ;; label = @13
                              local.get 0
                              i32.load
                              local.get 45
                              i32.add
                              local.get 22
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 0
                              local.get 42
                              i32.add
                              local.set 0
                              local.get 21
                              local.get 39
                              i32.add
                              local.tee 21
                              local.get 38
                              i32.ge_s
                              br_if 0 (;@13;)
                              br 2 (;@11;)
                            end
                          end
                          local.get 50
                          local.get 33
                          i32.add
                          local.set 50
                          local.get 22
                          local.set 45
                          local.get 49
                          local.get 38
                          i32.add
                          local.tee 49
                          local.get 1
                          i32.lt_s
                          br_if 2 (;@9;)
                          br 5 (;@6;)
                        end
                        local.get 41
                        local.get 4
                        call $malloc
                        local.tee 0
                        i32.store offset=1024
                        local.get 0
                        local.get 2
                        local.get 4
                        call $memcpy
                        drop
                        local.get 41
                        local.get 1
                        i32.store offset=1028
                        br 4 (;@6;)
                      end
                      i32.const 1
                      local.set 0
                      br 2 (;@7;)
                    end
                    i32.const 3
                    local.set 0
                    br 1 (;@7;)
                  end
                  loop  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                br_table 0 (;@14;) 1 (;@13;) 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 2
                                local.get 28
                                local.get 17
                                i32.add
                                local.tee 29
                                local.get 14
                                i32.shl
                                i32.add
                                i32.load
                                local.tee 22
                                local.get 16
                                i32.shl
                                local.get 26
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 27
                                local.set 0
                                block  ;; label = @15
                                  loop  ;; label = @16
                                    local.get 28
                                    local.get 17
                                    i32.add
                                    local.tee 28
                                    local.get 19
                                    i32.le_s
                                    br_if 1 (;@15;)
                                    local.get 0
                                    i32.load
                                    local.set 21
                                    local.get 0
                                    local.get 20
                                    i32.add
                                    local.set 0
                                    local.get 21
                                    local.get 22
                                    i32.add
                                    local.get 26
                                    i32.ne
                                    br_if 0 (;@16;)
                                    br 2 (;@14;)
                                  end
                                end
                                local.get 27
                                local.get 20
                                i32.add
                                local.set 27
                                local.get 29
                                local.set 28
                                local.get 29
                                local.get 19
                                i32.gt_s
                                br_if 4 (;@10;)
                                br 11 (;@3;)
                              end
                              local.get 24
                              local.get 11
                              i32.add
                              local.set 24
                              local.get 23
                              local.get 16
                              i32.add
                              local.tee 23
                              local.get 1
                              i32.lt_s
                              br_if 1 (;@12;)
                              local.get 19
                              i32.load offset=1024
                              br_if 9 (;@4;)
                              i32.const 2
                              local.set 30
                              local.get 12
                              local.set 31
                              i32.const 1
                              local.set 0
                              br 6 (;@7;)
                            end
                            block  ;; label = @13
                              local.get 2
                              local.get 48
                              local.get 39
                              i32.add
                              local.tee 29
                              local.get 36
                              i32.shl
                              i32.add
                              i32.load
                              local.tee 22
                              local.get 38
                              i32.shl
                              local.get 46
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 47
                              local.set 0
                              block  ;; label = @14
                                loop  ;; label = @15
                                  local.get 48
                                  local.get 39
                                  i32.add
                                  local.tee 48
                                  local.get 38
                                  i32.lt_s
                                  br_if 1 (;@14;)
                                  local.get 0
                                  i32.load
                                  local.set 21
                                  local.get 0
                                  local.get 42
                                  i32.add
                                  local.set 0
                                  local.get 21
                                  local.get 22
                                  i32.add
                                  local.get 46
                                  i32.ne
                                  br_if 0 (;@15;)
                                  br 2 (;@13;)
                                end
                              end
                              local.get 47
                              local.get 42
                              i32.add
                              local.set 47
                              local.get 29
                              local.set 48
                              local.get 29
                              local.get 41
                              i32.gt_s
                              br_if 4 (;@9;)
                              br 8 (;@5;)
                            end
                            local.get 44
                            local.get 33
                            i32.add
                            local.set 44
                            local.get 43
                            local.get 38
                            i32.add
                            local.tee 43
                            local.get 1
                            i32.lt_s
                            br_if 1 (;@11;)
                            local.get 41
                            i32.load offset=1024
                            br_if 6 (;@6;)
                            i32.const 2
                            local.set 49
                            local.get 34
                            local.set 50
                            i32.const 3
                            local.set 0
                            br 5 (;@7;)
                          end
                          i32.const 0
                          local.set 0
                          br 4 (;@7;)
                        end
                        i32.const 2
                        local.set 0
                        br 3 (;@7;)
                      end
                      i32.const 0
                      local.set 0
                      br 1 (;@8;)
                    end
                    i32.const 1
                    local.set 0
                    br 0 (;@8;)
                  end
                end
              end
              local.get 3
              local.get 3
              i32.load
              local.get 38
              i32.add
              i32.store
            end
            local.get 6
            local.get 7
            i32.load
            local.tee 32
            i32.add
            local.get 9
            i32.load
            i32.ge_s
            br_if 3 (;@1;)
            i32.const 0
            local.set 0
            br 2 (;@2;)
          end
          local.get 3
          local.get 3
          i32.load
          local.get 16
          i32.add
          i32.store
        end
        local.get 5
        local.get 1
        local.get 2
        local.get 3
        call $nextChains
        local.get 6
        local.get 7
        i32.load
        local.tee 10
        i32.add
        local.get 9
        i32.load
        i32.ge_s
        br_if 1 (;@1;)
        i32.const 1
        local.set 0
        br 0 (;@2;)
      end
    end)
  (func $findNonBrauer (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 0
    i32.store offset=12
    i32.const 2
    local.set 4
    local.get 1
    i32.const 2
    i32.shl
    local.tee 5
    call $malloc
    local.tee 6
    i32.const 1
    i32.store
    local.get 6
    local.get 1
    i32.const -1
    i32.add
    local.tee 7
    i32.const 2
    i32.shl
    i32.add
    local.get 0
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 7
        i32.const 2
        i32.lt_s
        br_if 0 (;@2;)
        local.get 6
        i32.const 4
        i32.add
        local.set 0
        local.get 6
        i32.load
        local.set 7
        loop  ;; label = @3
          local.get 0
          local.get 7
          local.get 4
          i32.add
          i32.const -1
          i32.add
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          local.get 4
          i32.const 1
          i32.add
          local.tee 4
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 1
        i32.const 3
        i32.lt_s
        br_if 0 (;@2;)
        local.get 6
        local.set 8
        local.get 6
        i32.load offset=4
        local.tee 9
        local.set 10
        i32.const 2
        local.set 11
        i32.const 0
        local.set 4
        loop  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  br_table 0 (;@7;) 1 (;@6;) 1 (;@6;)
                end
                local.get 10
                i32.const 1
                i32.shl
                local.set 4
                local.get 6
                local.get 11
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 10
                local.get 4
                i32.gt_s
                br_if 5 (;@1;)
                local.get 8
                local.set 12
                local.get 11
                local.set 0
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 6
                    local.get 0
                    i32.const -1
                    i32.add
                    local.tee 13
                    i32.const 2
                    i32.shl
                    i32.add
                    i32.load
                    local.tee 14
                    i32.const 1
                    i32.shl
                    local.get 10
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 12
                    local.set 4
                    block  ;; label = @9
                      loop  ;; label = @10
                        local.get 0
                        i32.const -1
                        i32.add
                        local.tee 0
                        i32.const 1
                        i32.lt_s
                        br_if 1 (;@9;)
                        local.get 4
                        i32.load
                        local.set 7
                        local.get 4
                        i32.const -4
                        i32.add
                        local.set 4
                        local.get 7
                        local.get 14
                        i32.add
                        local.get 10
                        i32.ne
                        br_if 0 (;@10;)
                        br 3 (;@7;)
                      end
                    end
                    local.get 12
                    i32.const -4
                    i32.add
                    local.set 12
                    local.get 13
                    local.set 0
                    local.get 13
                    i32.const 0
                    i32.gt_s
                    br_if 0 (;@8;)
                    br 7 (;@1;)
                  end
                end
                local.get 8
                i32.const 4
                i32.add
                local.set 8
                local.get 11
                i32.const 1
                i32.add
                local.tee 11
                local.get 1
                i32.lt_s
                br_if 1 (;@5;)
                i32.const 0
                i32.load offset=1024
                br_if 4 (;@2;)
                i32.const 4
                local.set 15
                local.get 6
                i32.const 4
                i32.add
                local.set 16
                i32.const 2
                local.set 17
                i32.const -1
                local.set 18
                i32.const 1
                local.set 19
                i32.const -4
                local.set 20
                i32.const 2
                local.set 21
                i32.const 1
                local.set 4
                br 3 (;@3;)
              end
              local.get 6
              local.get 21
              local.get 17
              i32.shl
              i32.add
              i32.load
              local.set 7
              local.get 16
              local.set 4
              local.get 21
              local.set 0
              block  ;; label = @6
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 4
                    i32.load
                    local.get 9
                    i32.add
                    local.get 7
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 4
                    local.get 20
                    i32.add
                    local.set 4
                    local.get 0
                    local.get 18
                    i32.add
                    local.tee 0
                    local.get 19
                    i32.ge_s
                    br_if 0 (;@8;)
                    br 2 (;@6;)
                  end
                end
                local.get 16
                local.get 15
                i32.add
                local.set 16
                local.get 7
                local.set 9
                local.get 21
                local.get 19
                i32.add
                local.tee 21
                local.get 1
                i32.lt_s
                br_if 2 (;@4;)
                br 4 (;@2;)
              end
              i32.const 0
              local.get 5
              call $malloc
              local.tee 4
              i32.store offset=1024
              local.get 4
              local.get 6
              local.get 5
              call $memcpy
              drop
              i32.const 0
              local.get 1
              i32.store offset=1028
              br 3 (;@2;)
            end
            i32.const 0
            local.set 4
            br 1 (;@3;)
          end
          i32.const 1
          local.set 4
          br 0 (;@3;)
        end
      end
      local.get 3
      i32.const 1
      i32.store offset=12
    end
    i32.const 2
    local.get 1
    local.get 6
    local.get 3
    i32.const 12
    i32.add
    call $nextChains
    local.get 6
    call $free
    local.get 3
    i32.load offset=12
    local.set 4
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 4
    local.get 2
    i32.sub)
  (func $findBrauer (type 8) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 1
    i32.store offset=108
    local.get 3
    i32.const 96
    i32.add
    i32.const 0
    i32.const 0
    local.get 3
    i32.const 108
    i32.add
    local.get 0
    i32.const 1
    local.get 1
    call $tryPerm
    local.get 3
    local.get 0
    i32.store offset=80
    local.get 3
    i32.load offset=100
    local.set 4
    local.get 3
    i32.load offset=96
    local.set 5
    i32.const 1056
    local.get 3
    i32.const 80
    i32.add
    call $printf
    drop
    local.get 3
    local.get 5
    i32.store offset=68
    local.get 3
    local.get 0
    i32.store offset=64
    i32.const 1065
    local.get 3
    i32.const 64
    i32.add
    call $printf
    drop
    local.get 3
    local.get 4
    i32.store offset=48
    i32.const 1104
    local.get 3
    i32.const 48
    i32.add
    call $printf
    drop
    block  ;; label = @1
      local.get 4
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 1149
      i32.const 0
      call $printf
      drop
      i32.const 0
      i32.load offset=1024
      local.set 6
      block  ;; label = @2
        i32.const 0
        i32.load offset=1028
        local.tee 1
        i32.const -1
        i32.add
        local.tee 7
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        local.get 6
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.const -4
        i32.add
        local.set 1
        local.get 6
        local.set 8
        i32.const 1
        local.set 9
        loop  ;; label = @3
          local.get 8
          i32.load
          local.set 10
          local.get 8
          local.get 1
          i32.load
          i32.store
          local.get 1
          local.get 10
          i32.store
          local.get 8
          i32.const 4
          i32.add
          local.set 8
          local.get 1
          i32.const -4
          i32.add
          local.set 1
          local.get 9
          local.get 7
          i32.const -1
          i32.add
          local.tee 7
          i32.lt_s
          local.set 10
          local.get 9
          i32.const 1
          i32.add
          local.set 9
          local.get 10
          br_if 0 (;@3;)
        end
        i32.const 0
        i32.load offset=1028
        local.set 1
      end
      i32.const 91
      call $putchar
      drop
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          local.get 6
          i32.load
          i32.store offset=32
          i32.const 1049
          local.get 3
          i32.const 32
          i32.add
          call $printf
          drop
          local.get 6
          i32.const 4
          i32.add
          local.set 6
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          br_if 0 (;@3;)
        end
      end
      i32.const 1053
      call $puts
      drop
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=1024
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      call $free
      i32.const 0
      i32.const 0
      i32.store offset=1028
      i32.const 0
      i32.const 0
      i32.store offset=1024
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 2
        i32.le_s
        br_if 0 (;@2;)
        i32.const 1238
        call $puts
        drop
        br 1 (;@1;)
      end
      local.get 3
      local.get 0
      local.get 5
      i32.const 1
      i32.add
      local.get 4
      call $findNonBrauer
      local.tee 1
      i32.store offset=16
      i32.const 1167
      local.get 3
      i32.const 16
      i32.add
      call $printf
      drop
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 1216
        i32.const 0
        call $printf
        drop
        i32.const 0
        i32.load offset=1024
        local.set 1
        i32.const 0
        i32.load offset=1028
        local.set 8
        i32.const 91
        call $putchar
        drop
        block  ;; label = @3
          local.get 8
          i32.const 1
          i32.lt_s
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 3
            local.get 1
            i32.load
            i32.store
            i32.const 1049
            local.get 3
            call $printf
            drop
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 8
            i32.const -1
            i32.add
            local.tee 8
            br_if 0 (;@4;)
          end
        end
        i32.const 1053
        call $puts
        drop
      end
      i32.const 0
      i32.load offset=1024
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      call $free
      i32.const 0
      i32.const 0
      i32.store offset=1028
      i32.const 0
      i32.const 0
      i32.store offset=1024
    end
    local.get 3
    i32.const 112
    i32.add
    global.set 0)
  (func $__original_main (type 10) (result i32)
    i32.const 1269
    call $puts
    drop
    i32.const 7
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 14
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 21
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 29
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 32
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 42
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 64
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 47
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 79
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 191
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 382
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 379
    i32.const 12
    i32.const 79
    call $findBrauer
    i32.const 0)
  (func $main (type 2) (param i32 i32) (result i32)
    call $__original_main)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66864))
  (global (;1;) i32 (i32.const 66864))
  (global (;2;) i32 (i32.const 1327))
  (global (;3;) i32 (i32.const 1024))
  (global (;4;) i32 (i32.const 1024))
  (global (;5;) i32 (i32.const 1028))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "__dso_handle" (global 3))
  (export "reverse" (func $reverse))
  (export "checkSeq" (func $checkSeq))
  (export "tryPerm" (func $tryPerm))
  (export "initTryPerm" (func $initTryPerm))
  (export "printArray" (func $printArray))
  (export "isBrauer" (func $isBrauer))
  (export "isAdditionChain" (func $isAdditionChain))
  (export "nextChains" (func $nextChains))
  (export "findNonBrauer" (func $findNonBrauer))
  (export "findBrauer" (func $findBrauer))
  (export "main" (func $main))
  (export "example" (global 4))
  (export "exampleLen" (global 5))
  (export "__original_main" (func $__original_main))
  (data (;0;) (i32.const 1024) "\00\00\00\00\00\00\00\00")
  (data (;1;) (i32.const 1032) "Error in tryPerm\00%d \00\08]\00\0aN = %d\0a\00Minimum length of chains : L(%d) = %d\0a\00Number of minimum length Brauer chains : %d\0a\00Brauer example : \00Number of minimum length non-Brauer chains : %d\0a\00Non-Brauer example : \00Non-Brauer analysis suppressed\00Searching for Brauer chains up to a minimum length of 12:\00"))
