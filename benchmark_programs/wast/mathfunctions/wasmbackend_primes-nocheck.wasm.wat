(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32)))
  (import "env" "memory" (memory (;0;) 4096))
  (func (;0;) (type 2) (param i32)
    i32.const 1024
    local.get 0
    i32.store)
  (func (;1;) (type 0) (param i32) (result i32)
    (local i32)
    i32.const 1024
    i32.const 1024
    i32.load
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 1
    i32.store
    local.get 1)
  (func (;2;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 f32 f32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 2
                i32.lt_s
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=4
                i32.load8_s
                i32.const -48
                i32.add
                local.tee 1
                i32.const 5
                i32.gt_u
                br_if 1 (;@5;)
                i32.const 33000
                local.set 2
                i32.const 0
                local.set 0
                block  ;; label = @7
                  local.get 1
                  i32.const 1
                  i32.sub
                  br_table 5 (;@2;) 0 (;@7;) 1 (;@6;) 3 (;@4;) 4 (;@3;) 6 (;@1;)
                end
                i32.const 130000
                local.set 2
                br 4 (;@2;)
              end
              i32.const 220000
              local.set 2
              br 3 (;@2;)
            end
            i32.const -1
            return
          end
          i32.const 610000
          local.set 2
          br 1 (;@2;)
        end
        i32.const 1010000
        local.set 2
      end
      i32.const 2
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 1
          f32.convert_i32_s
          f32.sqrt
          local.tee 4
          f32.const 0x1p+1 (;=2;)
          f32.gt
          i32.const 1
          i32.xor
          i32.eqz
          if  ;; label = @4
            i32.const 3
            local.set 0
            loop  ;; label = @5
              local.get 1
              local.get 0
              i32.const -1
              i32.add
              i32.rem_u
              i32.eqz
              br_if 2 (;@3;)
              local.get 0
              f32.convert_i32_s
              local.set 5
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              local.get 4
              local.get 5
              f32.gt
              i32.const 1
              i32.xor
              i32.eqz
              br_if 0 (;@5;)
            end
          end
          local.get 3
          i32.const 1
          i32.add
          local.set 3
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        local.get 2
        i32.lt_s
        br_if 0 (;@2;)
      end
      i32.const 0
      local.set 0
    end
    i32.const 0)
  (export "main" (func 2))
  (export "stackAlloc" (func 1))
  (export "stackRestore" (func 0)))
