(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (result i32)))
  (type (;3;) (func))
  (import "env" "_printf" (func (;0;) (type 0)))
  (import "env" "_putchar" (func (;1;) (type 1)))
  (import "env" "_puts" (func (;2;) (type 1)))
  (import "env" "_scanf" (func (;3;) (type 0)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;4;) (type 2) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    global.get 1
    i32.const 544
    i32.add
    global.set 1
    local.tee 1
    i32.const -64
    i32.sub
    local.tee 6
    i32.const 0
    i32.store
    local.get 6
    i32.const 0
    i32.store offset=4
    local.get 6
    i32.const 0
    i32.store offset=8
    local.get 6
    i32.const 0
    i32.store offset=12
    local.get 6
    i32.const 0
    i32.store offset=16
    global.get 0
    local.get 1
    i32.const 344
    i32.add
    call 0
    drop
    local.get 1
    i32.const 352
    i32.add
    local.tee 0
    local.get 1
    i32.const 528
    i32.add
    i32.store
    global.get 0
    i32.const 33
    i32.add
    local.get 0
    call 3
    drop
    global.get 0
    i32.const 36
    i32.add
    local.get 1
    i32.const 360
    i32.add
    call 0
    drop
    local.get 1
    i32.const 368
    i32.add
    local.tee 0
    local.get 1
    i32.const 524
    i32.add
    i32.store
    global.get 0
    i32.const 33
    i32.add
    local.get 0
    call 3
    drop
    local.get 1
    i32.load offset=524
    local.tee 2
    i32.const 0
    i32.gt_s
    if (result i32)  ;; label = @1
      i32.const 0
      local.set 0
      loop (result i32)  ;; label = @2
        local.get 0
        i32.const 2
        i32.shl
        local.get 1
        i32.add
        i32.const 1
        i32.store
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 2
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
      end
    else
      i32.const 0
    end
    local.set 4
    local.get 1
    i32.const 384
    i32.add
    local.set 2
    local.get 1
    i32.const 32
    i32.add
    local.set 7
    global.get 0
    i32.const 69
    i32.add
    local.get 1
    i32.const 376
    i32.add
    call 0
    drop
    local.get 1
    i32.load offset=528
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.const 2
        i32.shl
        local.get 7
        i32.add
        i32.store
        global.get 0
        i32.const 33
        i32.add
        local.get 2
        call 3
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 1
        i32.load offset=528
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 400
    i32.add
    local.set 5
    local.get 1
    i32.const 240
    i32.add
    local.set 9
    global.get 0
    i32.const 91
    i32.add
    local.get 1
    i32.const 392
    i32.add
    call 0
    drop
    local.get 1
    i32.load offset=524
    local.tee 0
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      local.get 1
      i32.load offset=528
      local.set 2
      loop  ;; label = @2
        local.get 2
        i32.const 0
        i32.gt_s
        if  ;; label = @3
          i32.const 0
          local.set 0
          loop  ;; label = @4
            local.get 5
            local.get 3
            i32.const 20
            i32.mul
            local.get 9
            i32.add
            local.get 0
            i32.const 2
            i32.shl
            i32.add
            i32.store
            global.get 0
            i32.const 33
            i32.add
            local.get 5
            call 3
            drop
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            local.get 1
            i32.load offset=528
            local.tee 2
            i32.lt_s
            br_if 0 (;@4;)
          end
          local.get 1
          i32.load offset=524
          local.set 0
        end
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        local.get 0
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 416
    i32.add
    local.set 5
    local.get 1
    i32.const 128
    i32.add
    local.set 10
    global.get 0
    i32.const 125
    i32.add
    local.get 1
    i32.const 408
    i32.add
    call 0
    drop
    local.get 1
    i32.load offset=524
    local.tee 0
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      local.get 1
      i32.load offset=528
      local.set 2
      i32.const 0
      local.set 3
      loop  ;; label = @2
        local.get 2
        i32.const 0
        i32.gt_s
        if  ;; label = @3
          i32.const 0
          local.set 0
          loop  ;; label = @4
            local.get 5
            local.get 3
            i32.const 20
            i32.mul
            local.get 10
            i32.add
            local.get 0
            i32.const 2
            i32.shl
            i32.add
            i32.store
            global.get 0
            i32.const 33
            i32.add
            local.get 5
            call 3
            drop
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            local.get 1
            i32.load offset=528
            local.tee 2
            i32.lt_s
            br_if 0 (;@4;)
          end
          local.get 1
          i32.load offset=524
          local.set 0
        end
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        local.get 0
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 432
    i32.add
    local.set 2
    global.get 0
    i32.const 154
    i32.add
    local.get 1
    i32.const 424
    i32.add
    call 0
    drop
    local.get 1
    i32.load offset=528
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.const 2
        i32.shl
        local.get 7
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 177
        i32.add
        local.get 2
        call 0
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 1
        i32.load offset=528
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 440
    i32.add
    local.set 3
    global.get 0
    i32.const 344
    i32.add
    call 2
    drop
    local.get 1
    i32.load offset=524
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 1
        i32.load offset=528
        i32.const 0
        i32.gt_s
        if  ;; label = @3
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 3
            local.get 0
            i32.const 20
            i32.mul
            local.get 9
            i32.add
            local.get 2
            i32.const 2
            i32.shl
            i32.add
            i32.load
            i32.store
            global.get 0
            i32.const 181
            i32.add
            local.get 3
            call 0
            drop
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            local.get 1
            i32.load offset=528
            i32.lt_s
            br_if 0 (;@4;)
          end
        end
        i32.const 10
        call 1
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 1
        i32.load offset=524
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 448
    i32.add
    local.set 3
    global.get 0
    i32.const 375
    i32.add
    call 2
    drop
    local.get 1
    i32.load offset=524
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 1
        i32.load offset=528
        i32.const 0
        i32.gt_s
        if  ;; label = @3
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 3
            local.get 0
            i32.const 20
            i32.mul
            local.get 10
            i32.add
            local.get 2
            i32.const 2
            i32.shl
            i32.add
            i32.load
            i32.store
            global.get 0
            i32.const 181
            i32.add
            local.get 3
            call 0
            drop
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            local.get 1
            i32.load offset=528
            i32.lt_s
            br_if 0 (;@4;)
          end
        end
        i32.const 10
        call 1
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 1
        i32.load offset=524
        local.tee 5
        i32.lt_s
        br_if 0 (;@2;)
      end
      local.get 5
      i32.const 0
      i32.gt_s
      if  ;; label = @2
        local.get 1
        i32.load offset=528
        local.tee 3
        i32.const 0
        i32.gt_s
        if  ;; label = @3
          i32.const 0
          local.set 2
          loop  ;; label = @4
            i32.const 0
            local.set 0
            loop  ;; label = @5
              local.get 0
              i32.const 2
              i32.shl
              local.get 6
              i32.add
              local.tee 8
              local.get 2
              i32.const 20
              i32.mul
              local.get 9
              i32.add
              local.get 0
              i32.const 2
              i32.shl
              i32.add
              i32.load
              local.get 8
              i32.load
              i32.add
              i32.store
              local.get 0
              i32.const 1
              i32.add
              local.tee 0
              local.get 3
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            local.get 5
            i32.ne
            br_if 0 (;@4;)
          end
        end
      end
    end
    local.get 1
    i32.const 464
    i32.add
    local.set 2
    local.get 1
    i32.const 96
    i32.add
    local.set 5
    global.get 0
    i32.const 185
    i32.add
    local.get 1
    i32.const 456
    i32.add
    call 0
    drop
    local.get 1
    i32.load offset=528
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.const 2
        i32.shl
        local.get 6
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 177
        i32.add
        local.get 2
        call 0
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 1
        i32.load offset=528
        local.tee 3
        i32.lt_s
        br_if 0 (;@2;)
      end
      local.get 3
      i32.const 0
      i32.gt_s
      if  ;; label = @2
        i32.const 0
        local.set 0
        loop  ;; label = @3
          local.get 0
          i32.const 2
          i32.shl
          local.get 5
          i32.add
          local.get 0
          i32.const 2
          i32.shl
          local.get 7
          i32.add
          i32.load
          local.get 0
          i32.const 2
          i32.shl
          local.get 6
          i32.add
          i32.load
          i32.sub
          i32.store
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          local.get 3
          i32.ne
          br_if 0 (;@3;)
        end
      end
    end
    local.get 1
    i32.const 480
    i32.add
    local.set 2
    global.get 0
    i32.const 208
    i32.add
    local.get 1
    i32.const 472
    i32.add
    call 0
    drop
    local.get 1
    i32.load offset=528
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.const 2
        i32.shl
        local.get 5
        i32.add
        i32.load
        i32.store
        global.get 0
        i32.const 177
        i32.add
        local.get 2
        call 0
        drop
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 1
        i32.load offset=528
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    i32.const 10
    call 1
    drop
    local.get 4
    i32.eqz
    if  ;; label = @1
      local.get 1
      global.set 1
      i32.const 0
      return
    end
    local.get 1
    i32.const 520
    i32.add
    local.set 6
    local.get 1
    i32.const 512
    i32.add
    local.set 11
    local.get 1
    i32.const 504
    i32.add
    local.set 12
    local.get 1
    i32.const 496
    i32.add
    local.set 13
    local.get 1
    i32.const 488
    i32.add
    local.set 7
    local.get 4
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load offset=524
            local.tee 8
            i32.const 0
            i32.le_s
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 1
              i32.load offset=528
              local.tee 14
              i32.const 0
              i32.gt_s
              if  ;; label = @6
                i32.const 0
                local.set 0
                loop  ;; label = @7
                  local.get 0
                  i32.const 2
                  i32.shl
                  local.get 1
                  i32.add
                  local.tee 3
                  i32.load
                  if  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      local.set 4
                      loop  ;; label = @10
                        local.get 0
                        i32.const 20
                        i32.mul
                        local.get 10
                        i32.add
                        local.get 4
                        i32.const 2
                        i32.shl
                        i32.add
                        i32.load
                        local.get 0
                        i32.const 20
                        i32.mul
                        local.get 9
                        i32.add
                        local.get 4
                        i32.const 2
                        i32.shl
                        i32.add
                        i32.load
                        i32.sub
                        local.get 4
                        i32.const 2
                        i32.shl
                        local.get 5
                        i32.add
                        i32.load
                        i32.gt_s
                        br_if 1 (;@9;)
                        local.get 4
                        i32.const 1
                        i32.add
                        local.tee 4
                        local.get 14
                        i32.lt_s
                        br_if 0 (;@10;)
                      end
                      local.get 3
                      local.set 4
                      br 4 (;@5;)
                    end
                  end
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  local.get 8
                  i32.lt_s
                  br_if 0 (;@7;)
                end
                br 2 (;@4;)
              else
                i32.const 0
                local.set 0
                loop  ;; label = @7
                  local.get 0
                  i32.const 2
                  i32.shl
                  local.get 1
                  i32.add
                  local.tee 4
                  i32.load
                  br_if 2 (;@5;)
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  local.get 8
                  i32.lt_s
                  br_if 0 (;@7;)
                end
                br 2 (;@4;)
              end
              unreachable
            end
            local.get 7
            local.get 0
            i32.const 1
            i32.add
            i32.store
            global.get 0
            i32.const 231
            i32.add
            local.get 7
            call 0
            drop
            local.get 4
            i32.const 0
            i32.store
            local.get 1
            i32.load offset=528
            local.tee 3
            i32.const 0
            i32.gt_s
            if  ;; label = @5
              i32.const 0
              local.set 4
              loop  ;; label = @6
                local.get 4
                i32.const 2
                i32.shl
                local.get 5
                i32.add
                local.tee 8
                local.get 0
                i32.const 20
                i32.mul
                local.get 9
                i32.add
                local.get 4
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.get 8
                i32.load
                i32.add
                i32.store
                local.get 4
                i32.const 1
                i32.add
                local.tee 4
                local.get 3
                i32.lt_s
                br_if 0 (;@6;)
              end
            end
            global.get 0
            i32.const 293
            i32.add
            local.get 12
            call 0
            drop
            global.get 0
            i32.const 324
            i32.add
            local.get 11
            call 0
            drop
            local.get 1
            i32.load offset=528
            i32.const 0
            i32.gt_s
            if  ;; label = @5
              i32.const 0
              local.set 0
              loop  ;; label = @6
                local.get 6
                local.get 0
                i32.const 2
                i32.shl
                local.get 5
                i32.add
                i32.load
                i32.store
                global.get 0
                i32.const 177
                i32.add
                local.get 6
                call 0
                drop
                local.get 0
                i32.const 1
                i32.add
                local.tee 0
                local.get 1
                i32.load offset=528
                i32.lt_s
                br_if 0 (;@6;)
              end
            end
            local.get 2
            i32.const -1
            i32.add
            local.tee 2
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
        end
        br 1 (;@1;)
      end
      local.get 1
      global.set 1
      i32.const 0
      return
    end
    global.get 0
    i32.const 257
    i32.add
    local.get 13
    call 0
    drop
    local.get 1
    global.set 1
    i32.const 0)
  (func (;5;) (type 3)
    global.get 0
    i32.const 416
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) i32 (i32.const 344))
  (export "__post_instantiate" (func 5))
  (export "_main" (func 4))
  (export "_str" (global 3))
  (data (;0;) (global.get 0) "\0aEnter the number of resources: \00%d\00\0aEnter the number of processes: \00\0aEnter Claim Vector: \00\0aEnter Allocated Resource Table: \00\0aEnter Maximum Claim table: \00\0aThe Claim Vector is: \00%d \00\09%d\00\0aAllocated resources: \00\0aAvailable resources: \00\0aProcess%d is executing.\0a\00\0aThe processes are in unsafe state.\00\0aThe process is in safe state.\00\0aAvailable vector: \00\0aThe Allocated Resource Table:\00\0aThe Maximum Claim Table:"))
