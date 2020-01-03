(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func))
  (import "env" "_calloc" (func (;0;) (type 0)))
  (import "env" "_free" (func (;1;) (type 1)))
  (import "env" "_printf" (func (;2;) (type 0)))
  (import "env" "_putchar" (func (;3;) (type 2)))
  (import "env" "_puts" (func (;4;) (type 2)))
  (import "env" "_setlocale" (func (;5;) (type 0)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;6;) (type 3) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 0
    global.get 1
    i32.const 704
    i32.add
    global.set 1
    local.get 0
    i32.const 400
    i32.add
    local.set 30
    local.get 0
    i32.const 392
    i32.add
    local.set 31
    local.get 0
    i32.const 384
    i32.add
    local.set 27
    local.get 0
    i32.const 376
    i32.add
    local.set 28
    local.get 0
    i32.const 368
    i32.add
    local.set 32
    local.get 0
    i32.const 360
    i32.add
    local.set 20
    local.get 0
    i32.const 344
    i32.add
    local.set 18
    local.get 0
    i32.const 304
    i32.add
    local.set 19
    local.get 0
    i32.const 240
    i32.add
    local.set 16
    local.get 0
    i32.const 160
    i32.add
    local.set 15
    local.get 0
    i32.const 48
    i32.add
    local.set 12
    local.get 0
    local.set 1
    i32.const 1000034
    i32.const 1
    call 0
    local.set 5
    i32.const 1
    global.get 0
    i32.const 5243024
    i32.add
    call 5
    drop
    local.get 5
    i32.const 1
    i32.store8
    local.get 5
    i32.const 1
    i32.store8 offset=1
    i32.const 9
    local.set 4
    i32.const 3
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 1
      i32.shl
      local.set 2
      loop  ;; label = @2
        local.get 4
        local.get 5
        i32.add
        i32.const 1
        i32.store8
        local.get 2
        local.get 4
        i32.add
        local.tee 4
        i32.const 1000035
        i32.lt_s
        br_if 0 (;@2;)
      end
      loop  ;; label = @2
        local.get 0
        i32.const 2
        i32.add
        local.tee 0
        local.get 5
        i32.add
        i32.load8_s
        br_if 0 (;@2;)
      end
      local.get 0
      local.get 0
      i32.mul
      local.tee 4
      i32.const 1000035
      i32.lt_u
      br_if 0 (;@1;)
    end
    i32.const 3
    local.set 0
    i32.const 2
    local.set 14
    loop  ;; label = @1
      local.get 0
      i32.const 1000029
      i32.lt_u
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const -6
          i32.add
          local.tee 2
          i32.const 1000023
          i32.ge_u
          br_if 0 (;@3;)
          local.get 0
          local.get 5
          i32.add
          i32.load8_s
          br_if 0 (;@3;)
          local.get 2
          local.get 5
          i32.add
          i32.load8_s
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 6
          i32.add
          local.get 5
          i32.add
          i32.load8_s
          i32.eqz
          br_if 0 (;@3;)
          local.get 14
          i32.const 1
          i32.add
          local.set 14
          br 1 (;@2;)
        end
        local.get 4
        if  ;; label = @3
          local.get 0
          local.get 5
          i32.add
          i32.load8_s
          i32.eqz
          if  ;; label = @4
            local.get 0
            i32.const 6
            i32.add
            local.get 5
            i32.add
            i32.load8_s
            i32.eqz
            if  ;; label = @5
              local.get 7
              i32.const 1
              i32.add
              local.set 7
              local.get 0
              i32.const 1000023
              i32.lt_u
              if  ;; label = @6
                local.get 0
                i32.const 12
                i32.add
                local.get 5
                i32.add
                i32.load8_s
                i32.eqz
                if  ;; label = @7
                  local.get 8
                  i32.const 1
                  i32.add
                  local.set 8
                  local.get 0
                  i32.const 1000017
                  i32.lt_u
                  if  ;; label = @8
                    local.get 0
                    i32.const 18
                    i32.add
                    local.get 5
                    i32.add
                    i32.load8_s
                    i32.eqz
                    if  ;; label = @9
                      local.get 11
                      i32.const 1
                      i32.add
                      local.set 11
                      local.get 0
                      i32.const 1000011
                      i32.lt_u
                      if  ;; label = @10
                        local.get 0
                        i32.const 24
                        i32.add
                        local.get 5
                        i32.add
                        i32.load8_s
                        i32.eqz
                        local.get 13
                        i32.add
                        local.set 13
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      i32.const 1000035
      i32.lt_u
      br_if 0 (;@1;)
    end
    local.get 14
    local.get 14
    i32.const 10
    local.get 14
    i32.const 10
    i32.lt_s
    select
    local.tee 21
    i32.sub
    local.set 33
    local.get 7
    local.get 7
    i32.const 5
    local.get 7
    i32.const 5
    i32.lt_s
    select
    local.tee 22
    i32.sub
    local.set 34
    local.get 22
    local.get 7
    i32.sub
    local.set 35
    local.get 21
    local.get 14
    i32.sub
    local.set 36
    local.get 8
    local.get 8
    i32.const 5
    local.get 8
    i32.const 5
    i32.lt_s
    select
    local.tee 23
    i32.sub
    local.set 37
    local.get 23
    local.get 8
    i32.sub
    local.set 38
    local.get 11
    local.get 11
    i32.const 5
    local.get 11
    i32.const 5
    i32.lt_s
    select
    local.tee 24
    i32.sub
    local.set 39
    local.get 24
    local.get 11
    i32.sub
    local.set 40
    local.get 13
    local.get 13
    i32.const 5
    local.get 13
    i32.const 5
    i32.lt_s
    select
    local.tee 25
    i32.sub
    local.set 41
    local.get 25
    local.get 13
    i32.sub
    local.set 42
    i32.const 3
    local.set 6
    i32.const 0
    local.set 0
    i32.const 0
    local.set 4
    i32.const 0
    local.set 2
    i32.const 2
    local.set 10
    loop  ;; label = @1
      local.get 6
      i32.const 1000029
      i32.lt_u
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 6
          i32.const -6
          i32.add
          local.tee 17
          i32.const 1000023
          i32.ge_u
          br_if 0 (;@3;)
          local.get 5
          local.get 6
          i32.add
          i32.load8_s
          br_if 0 (;@3;)
          local.get 5
          local.get 17
          i32.add
          i32.load8_s
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.const 6
          i32.add
          local.get 5
          i32.add
          i32.load8_s
          i32.eqz
          br_if 0 (;@3;)
          local.get 10
          i32.const 1
          i32.add
          local.get 10
          local.get 33
          i32.ge_s
          if  ;; label = @4
            local.get 10
            local.get 36
            i32.add
            i32.const 2
            i32.shl
            local.get 1
            i32.add
            local.get 6
            i32.store
          end
          local.set 10
          br 1 (;@2;)
        end
        local.get 3
        if  ;; label = @3
          local.get 5
          local.get 6
          i32.add
          i32.load8_s
          i32.eqz
          if  ;; label = @4
            local.get 6
            i32.const 6
            i32.add
            local.tee 17
            local.get 5
            i32.add
            i32.load8_s
            i32.eqz
            if  ;; label = @5
              local.get 0
              local.get 35
              i32.add
              local.set 3
              local.get 0
              local.get 34
              i32.ge_s
              if  ;; label = @6
                local.get 3
                i32.const 3
                i32.shl
                local.get 19
                i32.add
                local.get 6
                i32.store
                local.get 3
                i32.const 3
                i32.shl
                local.get 19
                i32.add
                local.get 17
                i32.store offset=4
              end
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              local.get 6
              i32.const 1000023
              i32.lt_u
              if  ;; label = @6
                local.get 6
                i32.const 12
                i32.add
                local.tee 26
                local.get 5
                i32.add
                i32.load8_s
                i32.eqz
                if  ;; label = @7
                  local.get 9
                  local.get 38
                  i32.add
                  local.set 3
                  local.get 9
                  local.get 37
                  i32.ge_s
                  if  ;; label = @8
                    local.get 3
                    i32.const 12
                    i32.mul
                    local.get 16
                    i32.add
                    local.get 6
                    i32.store
                    local.get 3
                    i32.const 12
                    i32.mul
                    local.get 16
                    i32.add
                    local.get 17
                    i32.store offset=4
                    local.get 3
                    i32.const 12
                    i32.mul
                    local.get 16
                    i32.add
                    local.get 26
                    i32.store offset=8
                  end
                  local.get 9
                  i32.const 1
                  i32.add
                  local.set 9
                  local.get 6
                  i32.const 1000017
                  i32.lt_u
                  if  ;; label = @8
                    local.get 6
                    i32.const 18
                    i32.add
                    local.tee 29
                    local.get 5
                    i32.add
                    i32.load8_s
                    i32.eqz
                    if  ;; label = @9
                      local.get 4
                      local.get 40
                      i32.add
                      local.set 3
                      local.get 4
                      local.get 39
                      i32.ge_s
                      if  ;; label = @10
                        local.get 3
                        i32.const 4
                        i32.shl
                        local.get 15
                        i32.add
                        local.get 6
                        i32.store
                        local.get 3
                        i32.const 4
                        i32.shl
                        local.get 15
                        i32.add
                        local.get 17
                        i32.store offset=4
                        local.get 3
                        i32.const 4
                        i32.shl
                        local.get 15
                        i32.add
                        local.get 26
                        i32.store offset=8
                        local.get 3
                        i32.const 4
                        i32.shl
                        local.get 15
                        i32.add
                        local.get 29
                        i32.store offset=12
                      end
                      local.get 4
                      i32.const 1
                      i32.add
                      local.set 4
                      local.get 6
                      i32.const 1000011
                      i32.lt_u
                      if  ;; label = @10
                        local.get 6
                        i32.const 24
                        i32.add
                        local.tee 43
                        local.get 5
                        i32.add
                        i32.load8_s
                        i32.eqz
                        if  ;; label = @11
                          local.get 2
                          i32.const 1
                          i32.add
                          local.get 2
                          local.get 41
                          i32.ge_s
                          if  ;; label = @12
                            local.get 2
                            local.get 42
                            i32.add
                            local.tee 2
                            i32.const 20
                            i32.mul
                            local.get 12
                            i32.add
                            local.get 6
                            i32.store
                            local.get 2
                            i32.const 20
                            i32.mul
                            local.get 12
                            i32.add
                            local.get 17
                            i32.store offset=4
                            local.get 2
                            i32.const 20
                            i32.mul
                            local.get 12
                            i32.add
                            local.get 26
                            i32.store offset=8
                            local.get 2
                            i32.const 20
                            i32.mul
                            local.get 12
                            i32.add
                            local.get 29
                            i32.store offset=12
                            local.get 2
                            i32.const 20
                            i32.mul
                            local.get 12
                            i32.add
                            local.get 43
                            i32.store offset=16
                          end
                          local.set 2
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      local.get 6
      i32.const 2
      i32.add
      local.tee 6
      i32.const 1000035
      i32.lt_u
      br_if 0 (;@1;)
    end
    global.get 0
    i32.const 26
    i32.add
    global.get 0
    i32.const 29
    i32.add
    local.get 7
    i32.const 1
    i32.eq
    select
    local.set 0
    local.get 18
    global.get 0
    i32.const 14
    i32.add
    i32.store
    local.get 18
    global.get 0
    i32.const 90
    i32.add
    i32.store offset=4
    local.get 18
    i32.const 1000035
    i32.store offset=8
    local.get 18
    local.get 7
    i32.store offset=12
    global.get 0
    i32.const 33
    i32.add
    local.get 18
    call 2
    drop
    local.get 20
    local.get 22
    i32.store
    local.get 20
    local.get 0
    i32.store offset=4
    global.get 0
    i32.const 69
    i32.add
    local.get 20
    call 2
    drop
    global.get 0
    i32.const 96
    i32.add
    local.get 32
    call 2
    drop
    local.get 7
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        i32.const 91
        call 3
        drop
        local.get 28
        local.get 0
        i32.const 3
        i32.shl
        local.get 19
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 28
        call 2
        drop
        local.get 27
        local.get 0
        i32.const 3
        i32.shl
        local.get 19
        i32.add
        i32.load offset=4
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 27
        call 2
        drop
        global.get 0
        i32.const 141
        i32.add
        local.get 31
        call 2
        drop
        global.get 0
        i32.const 100
        i32.add
        local.get 30
        call 2
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 22
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 472
    i32.add
    local.set 10
    local.get 1
    i32.const 464
    i32.add
    local.set 7
    local.get 1
    i32.const 456
    i32.add
    local.set 4
    local.get 1
    i32.const 448
    i32.add
    local.set 2
    local.get 1
    i32.const 440
    i32.add
    local.set 9
    global.get 0
    i32.const 137
    i32.add
    call 4
    drop
    global.get 0
    i32.const 26
    i32.add
    global.get 0
    i32.const 29
    i32.add
    local.get 8
    i32.const 1
    i32.eq
    select
    local.set 3
    local.get 1
    i32.const 408
    i32.add
    local.tee 0
    global.get 0
    i32.const 14
    i32.add
    i32.store
    local.get 0
    global.get 0
    i32.const 104
    i32.add
    i32.store offset=4
    local.get 0
    i32.const 1000035
    i32.store offset=8
    local.get 0
    local.get 8
    i32.store offset=12
    global.get 0
    i32.const 33
    i32.add
    local.get 0
    call 2
    drop
    local.get 1
    i32.const 424
    i32.add
    local.tee 0
    local.get 23
    i32.store
    local.get 0
    local.get 3
    i32.store offset=4
    global.get 0
    i32.const 69
    i32.add
    local.get 0
    call 2
    drop
    global.get 0
    i32.const 96
    i32.add
    local.get 1
    i32.const 432
    i32.add
    call 2
    drop
    local.get 8
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        i32.const 91
        call 3
        drop
        local.get 9
        local.get 0
        i32.const 12
        i32.mul
        local.get 16
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 9
        call 2
        drop
        local.get 2
        local.get 0
        i32.const 12
        i32.mul
        local.get 16
        i32.add
        i32.load offset=4
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 2
        call 2
        drop
        local.get 4
        local.get 0
        i32.const 12
        i32.mul
        local.get 16
        i32.add
        i32.load offset=8
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 4
        call 2
        drop
        global.get 0
        i32.const 141
        i32.add
        local.get 7
        call 2
        drop
        global.get 0
        i32.const 100
        i32.add
        local.get 10
        call 2
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 23
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 552
    i32.add
    local.set 7
    local.get 1
    i32.const 544
    i32.add
    local.set 8
    local.get 1
    i32.const 536
    i32.add
    local.set 4
    local.get 1
    i32.const 528
    i32.add
    local.set 2
    local.get 1
    i32.const 520
    i32.add
    local.set 9
    local.get 1
    i32.const 512
    i32.add
    local.set 10
    global.get 0
    i32.const 137
    i32.add
    call 4
    drop
    global.get 0
    i32.const 26
    i32.add
    global.get 0
    i32.const 29
    i32.add
    local.get 11
    i32.const 1
    i32.eq
    select
    local.set 3
    local.get 1
    i32.const 480
    i32.add
    local.tee 0
    global.get 0
    i32.const 14
    i32.add
    i32.store
    local.get 0
    global.get 0
    i32.const 113
    i32.add
    i32.store offset=4
    local.get 0
    i32.const 1000035
    i32.store offset=8
    local.get 0
    local.get 11
    i32.store offset=12
    global.get 0
    i32.const 33
    i32.add
    local.get 0
    call 2
    drop
    local.get 1
    i32.const 496
    i32.add
    local.tee 0
    local.get 24
    i32.store
    local.get 0
    local.get 3
    i32.store offset=4
    global.get 0
    i32.const 69
    i32.add
    local.get 0
    call 2
    drop
    global.get 0
    i32.const 96
    i32.add
    local.get 1
    i32.const 504
    i32.add
    call 2
    drop
    local.get 11
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        i32.const 91
        call 3
        drop
        local.get 10
        local.get 0
        i32.const 4
        i32.shl
        local.get 15
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 10
        call 2
        drop
        local.get 9
        local.get 0
        i32.const 4
        i32.shl
        local.get 15
        i32.add
        i32.load offset=4
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 9
        call 2
        drop
        local.get 2
        local.get 0
        i32.const 4
        i32.shl
        local.get 15
        i32.add
        i32.load offset=8
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 2
        call 2
        drop
        local.get 4
        local.get 0
        i32.const 4
        i32.shl
        local.get 15
        i32.add
        i32.load offset=12
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 4
        call 2
        drop
        global.get 0
        i32.const 141
        i32.add
        local.get 8
        call 2
        drop
        global.get 0
        i32.const 100
        i32.add
        local.get 7
        call 2
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 24
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 640
    i32.add
    local.set 11
    local.get 1
    i32.const 632
    i32.add
    local.set 8
    local.get 1
    i32.const 624
    i32.add
    local.set 4
    local.get 1
    i32.const 616
    i32.add
    local.set 2
    local.get 1
    i32.const 608
    i32.add
    local.set 9
    local.get 1
    i32.const 600
    i32.add
    local.set 10
    local.get 1
    i32.const 592
    i32.add
    local.set 7
    global.get 0
    i32.const 137
    i32.add
    call 4
    drop
    global.get 0
    i32.const 26
    i32.add
    global.get 0
    i32.const 29
    i32.add
    local.get 13
    i32.const 1
    i32.eq
    select
    local.set 3
    local.get 1
    i32.const 560
    i32.add
    local.tee 0
    global.get 0
    i32.const 14
    i32.add
    i32.store
    local.get 0
    global.get 0
    i32.const 125
    i32.add
    i32.store offset=4
    local.get 0
    i32.const 1000035
    i32.store offset=8
    local.get 0
    local.get 13
    i32.store offset=12
    global.get 0
    i32.const 33
    i32.add
    local.get 0
    call 2
    drop
    local.get 1
    i32.const 576
    i32.add
    local.tee 0
    local.get 25
    i32.store
    local.get 0
    local.get 3
    i32.store offset=4
    global.get 0
    i32.const 69
    i32.add
    local.get 0
    call 2
    drop
    global.get 0
    i32.const 96
    i32.add
    local.get 1
    i32.const 584
    i32.add
    call 2
    drop
    local.get 13
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        i32.const 91
        call 3
        drop
        local.get 7
        local.get 0
        i32.const 20
        i32.mul
        local.get 12
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 7
        call 2
        drop
        local.get 10
        local.get 0
        i32.const 20
        i32.mul
        local.get 12
        i32.add
        i32.load offset=4
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 10
        call 2
        drop
        local.get 9
        local.get 0
        i32.const 20
        i32.mul
        local.get 12
        i32.add
        i32.load offset=8
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 9
        call 2
        drop
        local.get 2
        local.get 0
        i32.const 20
        i32.mul
        local.get 12
        i32.add
        i32.load offset=12
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 2
        call 2
        drop
        local.get 4
        local.get 0
        i32.const 20
        i32.mul
        local.get 12
        i32.add
        i32.load offset=16
        i32.store
        global.get 0
        i32.const 86
        i32.add
        local.get 4
        call 2
        drop
        global.get 0
        i32.const 141
        i32.add
        local.get 8
        call 2
        drop
        global.get 0
        i32.const 100
        i32.add
        local.get 11
        call 2
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 25
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 688
    i32.add
    local.set 4
    global.get 0
    i32.const 137
    i32.add
    call 4
    drop
    global.get 0
    i32.const 26
    i32.add
    global.get 0
    i32.const 29
    i32.add
    local.get 14
    i32.const 1
    i32.eq
    select
    local.set 2
    local.get 1
    i32.const 648
    i32.add
    local.tee 0
    global.get 0
    i32.const 5243024
    i32.add
    i32.store
    local.get 0
    global.get 0
    i32.store offset=4
    local.get 0
    i32.const 1000035
    i32.store offset=8
    local.get 0
    local.get 14
    i32.store offset=12
    global.get 0
    i32.const 33
    i32.add
    local.get 0
    call 2
    drop
    local.get 1
    i32.const 664
    i32.add
    local.tee 0
    local.get 21
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    global.get 0
    i32.const 69
    i32.add
    local.get 0
    call 2
    drop
    global.get 0
    i32.const 96
    i32.add
    local.get 1
    i32.const 672
    i32.add
    call 2
    drop
    i32.const 91
    call 3
    drop
    local.get 14
    i32.const 0
    i32.le_s
    if  ;; label = @1
      global.get 0
      i32.const 141
      i32.add
      local.get 4
      call 2
      drop
      global.get 0
      i32.const 141
      i32.add
      call 4
      drop
      local.get 5
      call 1
      local.get 1
      global.set 1
      i32.const 0
      return
    end
    local.get 1
    i32.const 680
    i32.add
    local.set 2
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.const 2
      i32.shl
      local.get 1
      i32.add
      i32.load
      i32.store
      global.get 0
      i32.const 86
      i32.add
      local.get 2
      call 2
      drop
      local.get 21
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      i32.ne
      br_if 0 (;@1;)
    end
    global.get 0
    i32.const 141
    i32.add
    local.get 4
    call 2
    drop
    global.get 0
    i32.const 141
    i32.add
    call 4
    drop
    local.get 5
    call 1
    local.get 1
    global.set 1
    i32.const 0)
  (func (;7;) (type 4)
    global.get 0
    i32.const 144
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
  (data (;0;) (global.get 0) "unsexy primes\00sexy prime \00is\00are\00Number of %s%s less than %'d = %'d\0a\00The last %d %s:\0a\00%d \00pairs\00  [\00\08] \00triplets\00quadruplets\00quintuplets\00\08]\0a\00\08]"))
