(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32 i32 i32 i32 i32)))
  (type (;5;) (func (param i32 i32 i32 i32)))
  (type (;6;) (func (result i32)))
  (type (;7;) (func))
  (import "env" "_free" (func (;0;) (type 0)))
  (import "env" "_malloc" (func (;1;) (type 1)))
  (import "env" "_memcpy" (func (;2;) (type 2)))
  (import "env" "_printf" (func (;3;) (type 3)))
  (import "env" "_putchar" (func (;4;) (type 1)))
  (import "env" "_puts" (func (;5;) (type 1)))
  (import "env" "__memory_base" (global (;0;) i32))
  (import "env" "memory" (memory (;0;) 256))
  (func (;6;) (type 4) (param i32 i32 i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 9
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    local.get 9
    i32.const 8
    i32.add
    local.set 7
    local.get 1
    local.get 2
    i32.gt_s
    if  ;; label = @1
      i32.const 0
      local.set 1
    else
      local.get 5
      i32.const 1
      i32.add
      local.tee 11
      i32.const 2
      i32.shl
      local.tee 12
      call 1
      local.tee 10
      i32.const 4
      i32.add
      local.get 3
      local.get 5
      i32.const 2
      i32.shl
      call 2
      drop
      local.get 10
      local.get 3
      i32.load
      local.get 1
      i32.const 2
      i32.shl
      local.get 3
      i32.add
      i32.load
      i32.add
      local.tee 13
      i32.store
      local.get 2
      i32.const 1
      i32.add
      local.set 8
      local.get 13
      local.get 4
      i32.gt_s
      local.get 2
      local.get 6
      i32.ge_s
      i32.or
      if (result i32)  ;; label = @2
        local.get 7
        local.get 6
        i32.store
        local.get 7
        i32.const 0
        i32.store offset=4
        i32.const 0
      else
        block (result i32)  ;; label = @3
          local.get 4
          local.get 13
          i32.eq
          if  ;; label = @4
            local.get 12
            call 1
            local.set 6
            global.get 0
            i32.const 5243184
            i32.add
            local.get 6
            i32.store
            local.get 6
            local.get 10
            local.get 12
            call 2
            drop
            global.get 0
            i32.const 5243188
            i32.add
            local.get 11
            i32.store
            local.get 7
            local.get 8
            i32.store
            local.get 7
            i32.const 1
            i32.store offset=4
            local.get 8
            local.set 6
            i32.const 1
            br 1 (;@3;)
          end
          local.get 8
          local.get 6
          i32.lt_s
          if (result i32)  ;; label = @4
            local.get 7
            i32.const 0
            local.get 8
            local.get 10
            local.get 4
            local.get 11
            local.get 6
            call 6
            local.get 7
            i32.load
            local.set 6
            local.get 7
            i32.load offset=4
          else
            local.get 7
            local.get 6
            i32.store
            local.get 7
            i32.const 0
            i32.store offset=4
            i32.const 0
          end
        end
      end
      local.set 8
      local.get 9
      local.get 1
      i32.const 1
      i32.add
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      local.get 6
      call 6
      local.get 9
      i32.load
      local.set 2
      local.get 9
      i32.load offset=4
      local.set 1
      local.get 10
      call 0
      local.get 2
      local.get 6
      i32.lt_s
      if  ;; label = @2
        local.get 2
        local.set 6
      else
        local.get 2
        local.get 6
        i32.eq
        if (result i32)  ;; label = @3
          local.get 1
          local.get 8
          i32.add
        else
          global.get 0
          i32.const 186
          i32.add
          call 5
          drop
          i32.const 0
          local.set 6
          i32.const 0
        end
        local.set 1
      end
    end
    local.get 0
    local.get 6
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 9
    global.set 1)
  (func (;7;) (type 5) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.const 2
    i32.shl
    local.get 2
    i32.add
    local.set 8
    local.get 1
    i32.const -1
    i32.add
    local.tee 9
    local.get 0
    i32.sub
    local.set 10
    local.get 9
    i32.const 2
    i32.shl
    local.get 2
    i32.add
    local.set 11
    local.get 0
    i32.const 1
    i32.add
    local.tee 12
    local.get 9
    i32.lt_s
    local.set 16
    local.get 1
    i32.const 2
    i32.gt_s
    local.set 17
    local.get 1
    i32.const 2
    i32.shl
    local.set 13
    local.get 9
    local.get 0
    i32.gt_s
    if  ;; label = @1
      local.get 12
      local.get 1
      local.get 2
      local.get 3
      call 7
      local.get 8
      i32.load
      local.tee 0
      local.get 10
      i32.add
      local.get 11
      i32.load
      i32.ge_s
      if  ;; label = @2
        return
      end
      loop  ;; label = @2
        local.get 8
        local.get 0
        i32.const 1
        i32.add
        local.tee 4
        i32.store
        local.get 16
        if  ;; label = @3
          local.get 12
          local.set 0
          loop  ;; label = @4
            local.get 0
            i32.const 2
            i32.shl
            local.get 2
            i32.add
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.store
            local.get 9
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            i32.ne
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 17
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.load offset=4
            local.tee 14
            local.set 4
            i32.const 2
            local.set 0
            block  ;; label = @5
              loop  ;; label = @6
                local.get 0
                i32.const 2
                i32.shl
                local.get 2
                i32.add
                i32.load
                local.tee 6
                local.get 4
                i32.const 1
                i32.shl
                i32.gt_s
                br_if 1 (;@5;)
                local.get 0
                local.set 4
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    i32.const 0
                    i32.le_s
                    br_if 3 (;@5;)
                    local.get 6
                    local.get 4
                    i32.const -1
                    i32.add
                    local.tee 7
                    i32.const 2
                    i32.shl
                    local.get 2
                    i32.add
                    i32.load
                    local.tee 15
                    i32.const 1
                    i32.shl
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 7
                    local.set 5
                    loop  ;; label = @9
                      local.get 5
                      i32.const 0
                      i32.gt_s
                      if  ;; label = @10
                        local.get 6
                        local.get 5
                        i32.const -1
                        i32.add
                        local.tee 5
                        i32.const 2
                        i32.shl
                        local.get 2
                        i32.add
                        i32.load
                        local.get 15
                        i32.add
                        i32.eq
                        br_if 2 (;@8;)
                        br 1 (;@9;)
                      end
                    end
                    local.get 4
                    i32.const 1
                    i32.le_s
                    br_if 3 (;@5;)
                    local.get 7
                    local.set 4
                    br 1 (;@7;)
                  end
                end
                local.get 0
                i32.const 1
                i32.add
                local.tee 0
                local.get 1
                i32.lt_s
                if  ;; label = @7
                  local.get 6
                  local.set 4
                  br 1 (;@6;)
                end
              end
              global.get 0
              i32.const 5243184
              i32.add
              i32.load
              br_if 1 (;@4;)
              local.get 14
              local.set 5
              i32.const 2
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 2
                  i32.shl
                  local.get 2
                  i32.add
                  i32.load
                  local.set 7
                  local.get 0
                  local.set 4
                  loop  ;; label = @8
                    local.get 4
                    i32.const -1
                    i32.add
                    local.tee 6
                    i32.const 2
                    i32.shl
                    local.get 2
                    i32.add
                    i32.load
                    local.get 5
                    i32.add
                    local.get 7
                    i32.ne
                    if  ;; label = @9
                      local.get 4
                      i32.const 1
                      i32.le_s
                      br_if 2 (;@7;)
                      local.get 6
                      local.set 4
                      br 1 (;@8;)
                    end
                  end
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  local.get 1
                  i32.ge_s
                  br_if 3 (;@4;)
                  local.get 7
                  local.set 5
                  br 1 (;@6;)
                end
              end
              local.get 13
              call 1
              local.set 0
              global.get 0
              i32.const 5243184
              i32.add
              local.get 0
              i32.store
              local.get 0
              local.get 2
              local.get 13
              call 2
              drop
              global.get 0
              i32.const 5243188
              i32.add
              local.get 1
              i32.store
              br 1 (;@4;)
            end
            br 1 (;@3;)
          end
          local.get 3
          local.get 3
          i32.load
          i32.const 1
          i32.add
          i32.store
        end
        local.get 12
        local.get 1
        local.get 2
        local.get 3
        call 7
        local.get 8
        i32.load
        local.tee 0
        local.get 10
        i32.add
        local.get 11
        i32.load
        i32.lt_s
        br_if 0 (;@2;)
      end
    else
      local.get 8
      i32.load
      local.tee 0
      local.get 10
      i32.add
      local.get 11
      i32.load
      i32.ge_s
      if  ;; label = @2
        return
      end
      loop  ;; label = @2
        local.get 8
        local.get 0
        i32.const 1
        i32.add
        local.tee 4
        i32.store
        local.get 16
        if  ;; label = @3
          local.get 12
          local.set 0
          loop  ;; label = @4
            local.get 0
            i32.const 2
            i32.shl
            local.get 2
            i32.add
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.store
            local.get 9
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            i32.ne
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 17
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.load offset=4
            local.tee 14
            local.set 4
            i32.const 2
            local.set 0
            block  ;; label = @5
              loop  ;; label = @6
                local.get 0
                i32.const 2
                i32.shl
                local.get 2
                i32.add
                i32.load
                local.tee 6
                local.get 4
                i32.const 1
                i32.shl
                i32.gt_s
                br_if 1 (;@5;)
                local.get 0
                local.set 4
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    i32.const 0
                    i32.le_s
                    br_if 3 (;@5;)
                    local.get 6
                    local.get 4
                    i32.const -1
                    i32.add
                    local.tee 7
                    i32.const 2
                    i32.shl
                    local.get 2
                    i32.add
                    i32.load
                    local.tee 15
                    i32.const 1
                    i32.shl
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 7
                    local.set 5
                    loop  ;; label = @9
                      local.get 5
                      i32.const 0
                      i32.gt_s
                      if  ;; label = @10
                        local.get 6
                        local.get 5
                        i32.const -1
                        i32.add
                        local.tee 5
                        i32.const 2
                        i32.shl
                        local.get 2
                        i32.add
                        i32.load
                        local.get 15
                        i32.add
                        i32.eq
                        br_if 2 (;@8;)
                        br 1 (;@9;)
                      end
                    end
                    local.get 4
                    i32.const 1
                    i32.le_s
                    br_if 3 (;@5;)
                    local.get 7
                    local.set 4
                    br 1 (;@7;)
                  end
                end
                local.get 0
                i32.const 1
                i32.add
                local.tee 0
                local.get 1
                i32.lt_s
                if  ;; label = @7
                  local.get 6
                  local.set 4
                  br 1 (;@6;)
                end
              end
              global.get 0
              i32.const 5243184
              i32.add
              i32.load
              br_if 1 (;@4;)
              local.get 14
              local.set 5
              i32.const 2
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 2
                  i32.shl
                  local.get 2
                  i32.add
                  i32.load
                  local.set 7
                  local.get 0
                  local.set 4
                  loop  ;; label = @8
                    local.get 4
                    i32.const -1
                    i32.add
                    local.tee 6
                    i32.const 2
                    i32.shl
                    local.get 2
                    i32.add
                    i32.load
                    local.get 5
                    i32.add
                    local.get 7
                    i32.ne
                    if  ;; label = @9
                      local.get 4
                      i32.const 1
                      i32.le_s
                      br_if 2 (;@7;)
                      local.get 6
                      local.set 4
                      br 1 (;@8;)
                    end
                  end
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  local.get 1
                  i32.ge_s
                  br_if 3 (;@4;)
                  local.get 7
                  local.set 5
                  br 1 (;@6;)
                end
              end
              local.get 13
              call 1
              local.set 0
              global.get 0
              i32.const 5243184
              i32.add
              local.get 0
              i32.store
              local.get 0
              local.get 2
              local.get 13
              call 2
              drop
              global.get 0
              i32.const 5243188
              i32.add
              local.get 1
              i32.store
              br 1 (;@4;)
            end
            br 1 (;@3;)
          end
          local.get 3
          local.get 3
          i32.load
          i32.const 1
          i32.add
          i32.store
        end
        local.get 8
        i32.load
        local.tee 0
        local.get 10
        i32.add
        local.get 11
        i32.load
        i32.lt_s
        br_if 0 (;@2;)
      end
    end)
  (func (;8;) (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 7
    global.get 1
    i32.const 16
    i32.add
    global.set 1
    local.get 7
    i32.const 0
    i32.store
    local.get 1
    i32.const 2
    i32.shl
    local.tee 9
    call 1
    local.tee 4
    i32.const 1
    i32.store
    local.get 1
    i32.const -1
    i32.add
    local.tee 5
    i32.const 2
    i32.shl
    local.get 4
    i32.add
    local.get 0
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 2
        i32.gt_s
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load
        local.set 3
        i32.const 1
        local.set 0
        loop  ;; label = @3
          local.get 0
          i32.const 2
          i32.shl
          local.get 4
          i32.add
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.store
          local.get 5
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.load offset=4
        local.tee 10
        local.set 3
        i32.const 2
        local.set 0
        block  ;; label = @3
          loop  ;; label = @4
            local.get 0
            i32.const 2
            i32.shl
            local.get 4
            i32.add
            i32.load
            local.tee 8
            local.get 3
            i32.const 1
            i32.shl
            i32.gt_s
            br_if 1 (;@3;)
            local.get 0
            local.set 3
            loop  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.const 0
                i32.le_s
                br_if 3 (;@3;)
                local.get 8
                local.get 3
                i32.const -1
                i32.add
                local.tee 6
                i32.const 2
                i32.shl
                local.get 4
                i32.add
                i32.load
                local.tee 11
                i32.const 1
                i32.shl
                i32.eq
                br_if 0 (;@6;)
                local.get 6
                local.set 5
                loop  ;; label = @7
                  local.get 5
                  i32.const 0
                  i32.gt_s
                  if  ;; label = @8
                    local.get 8
                    local.get 5
                    i32.const -1
                    i32.add
                    local.tee 5
                    i32.const 2
                    i32.shl
                    local.get 4
                    i32.add
                    i32.load
                    local.get 11
                    i32.add
                    i32.eq
                    br_if 2 (;@6;)
                    br 1 (;@7;)
                  end
                end
                local.get 3
                i32.const 1
                i32.le_s
                br_if 3 (;@3;)
                local.get 6
                local.set 3
                br 1 (;@5;)
              end
            end
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            local.get 1
            i32.lt_s
            if  ;; label = @5
              local.get 8
              local.set 3
              br 1 (;@4;)
            end
          end
          global.get 0
          i32.const 5243184
          i32.add
          i32.load
          br_if 1 (;@2;)
          local.get 10
          local.set 5
          i32.const 2
          local.set 0
          loop  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 2
              i32.shl
              local.get 4
              i32.add
              i32.load
              local.set 6
              local.get 0
              local.set 3
              loop  ;; label = @6
                local.get 3
                i32.const -1
                i32.add
                local.tee 8
                i32.const 2
                i32.shl
                local.get 4
                i32.add
                i32.load
                local.get 5
                i32.add
                local.get 6
                i32.ne
                if  ;; label = @7
                  local.get 3
                  i32.const 1
                  i32.le_s
                  br_if 2 (;@5;)
                  local.get 8
                  local.set 3
                  br 1 (;@6;)
                end
              end
              local.get 0
              i32.const 1
              i32.add
              local.tee 0
              local.get 1
              i32.ge_s
              br_if 3 (;@2;)
              local.get 6
              local.set 5
              br 1 (;@4;)
            end
          end
          local.get 9
          call 1
          local.set 0
          global.get 0
          i32.const 5243184
          i32.add
          local.get 0
          i32.store
          local.get 0
          local.get 4
          local.get 9
          call 2
          drop
          global.get 0
          i32.const 5243188
          i32.add
          local.get 1
          i32.store
          br 1 (;@2;)
        end
        br 1 (;@1;)
      end
      local.get 7
      i32.const 1
      i32.store
    end
    i32.const 2
    local.get 1
    local.get 4
    local.get 7
    call 7
    local.get 4
    call 0
    local.get 7
    i32.load
    local.get 2
    i32.sub
    local.get 7
    global.set 1)
  (func (;9;) (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 1
    local.set 2
    global.get 1
    i32.const 80
    i32.add
    global.set 1
    local.get 2
    i32.const 32
    i32.add
    local.set 7
    local.get 2
    i32.const 24
    i32.add
    local.set 3
    local.get 2
    i32.const 72
    i32.add
    local.tee 4
    i32.const 1
    i32.store
    local.get 2
    i32.const -64
    i32.sub
    local.tee 1
    i32.const 0
    i32.const 0
    local.get 4
    local.get 0
    i32.const 1
    i32.const 12
    call 6
    local.get 1
    i32.load
    local.set 8
    local.get 1
    i32.load offset=4
    local.set 4
    local.get 2
    local.get 0
    i32.store
    global.get 0
    i32.const 4
    i32.add
    local.get 2
    call 3
    drop
    local.get 2
    i32.const 8
    i32.add
    local.tee 1
    local.get 0
    i32.store
    local.get 1
    local.get 8
    i32.store offset=4
    global.get 0
    i32.const 13
    i32.add
    local.get 1
    call 3
    drop
    local.get 2
    i32.const 16
    i32.add
    local.tee 1
    local.get 4
    i32.store
    global.get 0
    i32.const 52
    i32.add
    local.get 1
    call 3
    drop
    local.get 4
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      global.get 0
      i32.const 97
      i32.add
      local.get 3
      call 3
      drop
      global.get 0
      i32.const 5243184
      i32.add
      i32.load
      local.set 5
      global.get 0
      i32.const 5243188
      i32.add
      i32.load
      local.tee 1
      i32.const 1
      i32.gt_s
      if  ;; label = @2
        i32.const 0
        local.set 3
        local.get 1
        i32.const -1
        i32.add
        local.set 1
        loop  ;; label = @3
          local.get 3
          i32.const 2
          i32.shl
          local.get 5
          i32.add
          local.tee 6
          i32.load
          local.set 9
          local.get 6
          local.get 1
          i32.const 2
          i32.shl
          local.get 5
          i32.add
          local.tee 6
          i32.load
          i32.store
          local.get 6
          local.get 9
          i32.store
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          i32.lt_s
          br_if 0 (;@3;)
        end
        global.get 0
        i32.const 5243188
        i32.add
        i32.load
        local.set 1
      end
      i32.const 91
      call 4
      drop
      local.get 1
      i32.const 0
      i32.gt_s
      if  ;; label = @2
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 7
          local.get 3
          i32.const 2
          i32.shl
          local.get 5
          i32.add
          i32.load
          i32.store
          global.get 0
          local.get 7
          call 3
          drop
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 1
          i32.ne
          br_if 0 (;@3;)
        end
      end
      global.get 0
      i32.const 203
      i32.add
      call 5
      drop
    end
    global.get 0
    i32.const 5243184
    i32.add
    i32.load
    local.tee 1
    if  ;; label = @1
      local.get 1
      call 0
      global.get 0
      i32.const 5243184
      i32.add
      i32.const 0
      i32.store
      global.get 0
      i32.const 5243188
      i32.add
      i32.const 0
      i32.store
    end
    local.get 0
    i32.const 79
    i32.gt_s
    if  ;; label = @1
      global.get 0
      i32.const 206
      i32.add
      call 5
      drop
      local.get 2
      global.set 1
      return
    end
    local.get 2
    i32.const 56
    i32.add
    local.set 1
    local.get 2
    i32.const 48
    i32.add
    local.set 3
    local.get 2
    i32.const 40
    i32.add
    local.tee 5
    local.get 0
    local.get 8
    i32.const 1
    i32.add
    local.get 4
    call 8
    local.tee 0
    i32.store
    global.get 0
    i32.const 115
    i32.add
    local.get 5
    call 3
    drop
    local.get 0
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      global.get 0
      i32.const 164
      i32.add
      local.get 3
      call 3
      drop
      global.get 0
      i32.const 5243184
      i32.add
      i32.load
      local.set 4
      global.get 0
      i32.const 5243188
      i32.add
      i32.load
      local.set 3
      i32.const 91
      call 4
      drop
      local.get 3
      i32.const 0
      i32.gt_s
      if  ;; label = @2
        i32.const 0
        local.set 0
        loop  ;; label = @3
          local.get 1
          local.get 0
          i32.const 2
          i32.shl
          local.get 4
          i32.add
          i32.load
          i32.store
          global.get 0
          local.get 1
          call 3
          drop
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          local.get 3
          i32.ne
          br_if 0 (;@3;)
        end
      end
      global.get 0
      i32.const 203
      i32.add
      call 5
      drop
    end
    global.get 0
    i32.const 5243184
    i32.add
    i32.load
    local.tee 0
    i32.eqz
    if  ;; label = @1
      local.get 2
      global.set 1
      return
    end
    local.get 0
    call 0
    global.get 0
    i32.const 5243184
    i32.add
    i32.const 0
    i32.store
    global.get 0
    i32.const 5243188
    i32.add
    i32.const 0
    i32.store
    local.get 2
    global.set 1)
  (func (;10;) (type 6) (result i32)
    global.get 0
    i32.const 237
    i32.add
    call 5
    drop
    i32.const 7
    call 9
    i32.const 14
    call 9
    i32.const 21
    call 9
    i32.const 29
    call 9
    i32.const 32
    call 9
    i32.const 42
    call 9
    i32.const 64
    call 9
    i32.const 47
    call 9
    i32.const 79
    call 9
    i32.const 191
    call 9
    i32.const 382
    call 9
    i32.const 379
    call 9
    i32.const 0)
  (func (;11;) (type 7)
    global.get 0
    i32.const 304
    i32.add
    global.set 1
    global.get 1
    i32.const 5242880
    i32.add
    global.set 2)
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) i32 (i32.const 5243184))
  (global (;4;) i32 (i32.const 5243188))
  (global (;5;) i32 (i32.const 186))
  (export "__post_instantiate" (func 11))
  (export "_main" (func 10))
  (export "_example" (global 3))
  (export "_exampleLen" (global 4))
  (export "_str" (global 5))
  (data (;0;) (global.get 0) "%d \00\0aN = %d\0a\00Minimum length of chains : L(%d) = %d\0a\00Number of minimum length Brauer chains : %d\0a\00Brauer example : \00Number of minimum length non-Brauer chains : %d\0a\00Non-Brauer example : \00Error in tryPerm\00\08]\00Non-Brauer analysis suppressed\00Searching for Brauer chains up to a minimum length of 12:"))
