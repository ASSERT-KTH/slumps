(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i64 i64 i64 i64)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func))
  (type (;5;) (func (param i32)))
  (type (;6;) (func (param i64 i64) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32)))
  (type (;9;) (func (param i64 i32 i32) (result i32)))
  (type (;10;) (func (param i64 i32) (result i32)))
  (type (;11;) (func (param i32 i32 i32 i32 i32)))
  (type (;12;) (func (param i32 i64 i64 i32 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i64 i64 i32)))
  (type (;14;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;15;) (func (param i64 i64 i64 i64) (result i32)))
  (type (;16;) (func (param i32 f64)))
  (type (;17;) (func (param i32 i32)))
  (import "env" "memory" (memory (;0;) 4096))
  (import "env" "__syscall140" (func (;0;) (type 3)))
  (import "env" "__syscall146" (func (;1;) (type 3)))
  (import "env" "__syscall54" (func (;2;) (type 3)))
  (import "env" "__syscall6" (func (;3;) (type 3)))
  (func (;4;) (type 8) (param i32 i32 i32)
    local.get 0
    i32.load8_u
    i32.const 32
    i32.and
    i32.eqz
    if  ;; label = @1
      local.get 1
      local.get 2
      local.get 0
      call 14
      drop
    end)
  (func (;5;) (type 11) (param i32 i32 i32 i32 i32)
    (local i32 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 256
    i32.sub
    local.tee 5
    i32.store
    block  ;; label = @1
      local.get 2
      local.get 3
      i32.le_s
      br_if 0 (;@1;)
      local.get 4
      i32.const 73728
      i32.and
      br_if 0 (;@1;)
      local.get 2
      local.get 3
      i32.sub
      local.tee 4
      i32.const 256
      i32.lt_u
      local.set 6
      local.get 5
      local.get 1
      local.get 4
      i32.const 256
      local.get 6
      select
      call 17
      drop
      local.get 6
      i32.eqz
      if  ;; label = @2
        local.get 2
        local.get 3
        i32.sub
        local.set 2
        loop  ;; label = @3
          local.get 0
          local.get 5
          i32.const 256
          call 4
          local.get 4
          i32.const -256
          i32.add
          local.tee 4
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
        end
        local.get 2
        i32.const 255
        i32.and
        local.set 4
      end
      local.get 0
      local.get 5
      local.get 4
      call 4
    end
    i32.const 1024
    local.get 5
    i32.const 256
    i32.add
    i32.store)
  (func (;6;) (type 13) (param i32 i64 i64 i32)
    (local i64)
    block  ;; label = @1
      block (result i64)  ;; label = @2
        local.get 3
        i32.const 64
        i32.and
        i32.eqz
        if  ;; label = @3
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          i32.const 64
          local.get 3
          i32.sub
          i64.extend_i32_u
          i64.shr_u
          local.get 2
          local.get 3
          i64.extend_i32_u
          local.tee 4
          i64.shl
          i64.or
          local.set 2
          local.get 1
          local.get 4
          i64.shl
          br 1 (;@2;)
        end
        local.get 1
        local.get 3
        i32.const -64
        i32.add
        i64.extend_i32_u
        i64.shl
        local.set 2
        i64.const 0
      end
      local.set 1
    end
    local.get 0
    local.get 1
    i64.store
    local.get 0
    local.get 2
    i64.store offset=8)
  (func (;7;) (type 15) (param i64 i64 i64 i64) (result i32)
    (local i32 i64 i64)
    i32.const 1
    local.set 4
    block  ;; label = @1
      local.get 0
      i64.const 0
      i64.ne
      local.get 1
      i64.const 9223372036854775807
      i64.and
      local.tee 5
      i64.const 9223090561878065152
      i64.gt_u
      local.get 5
      i64.const 9223090561878065152
      i64.eq
      select
      br_if 0 (;@1;)
      local.get 2
      i64.const 0
      i64.ne
      local.get 3
      i64.const 9223372036854775807
      i64.and
      local.tee 6
      i64.const 9223090561878065152
      i64.gt_u
      local.get 6
      i64.const 9223090561878065152
      i64.eq
      select
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        local.get 0
        i64.or
        local.get 6
        local.get 5
        i64.or
        i64.or
        i64.eqz
        i32.eqz
        if  ;; label = @3
          local.get 3
          local.get 1
          i64.and
          i64.const 0
          i64.lt_s
          br_if 1 (;@2;)
          i32.const -1
          local.set 4
          local.get 0
          local.get 2
          i64.lt_u
          local.get 1
          local.get 3
          i64.lt_s
          local.get 1
          local.get 3
          i64.eq
          select
          br_if 2 (;@1;)
          local.get 0
          local.get 2
          i64.xor
          local.get 1
          local.get 3
          i64.xor
          i64.or
          i64.const 0
          i64.ne
          return
        end
        i32.const 0
        return
      end
      i32.const -1
      local.set 4
      local.get 0
      local.get 2
      i64.gt_u
      local.get 1
      local.get 3
      i64.gt_s
      local.get 1
      local.get 3
      i64.eq
      select
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i64.xor
      local.get 1
      local.get 3
      i64.xor
      i64.or
      i64.const 0
      i64.ne
      local.set 4
    end
    local.get 4)
  (func (;8;) (type 3) (param i32 i32) (result i32)
    local.get 0
    i32.const 24
    i32.shl
    local.get 0
    i32.const 8
    i32.shl
    i32.const 16711680
    i32.and
    i32.or
    local.get 0
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 0
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    local.get 0
    local.get 1
    select)
  (func (;9;) (type 13) (param i32 i64 i64 i32)
    (local i64)
    block  ;; label = @1
      block (result i64)  ;; label = @2
        local.get 3
        i32.const 64
        i32.and
        i32.eqz
        if  ;; label = @3
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 2
          i32.const 64
          local.get 3
          i32.sub
          i64.extend_i32_u
          i64.shl
          local.get 1
          local.get 3
          i64.extend_i32_u
          local.tee 4
          i64.shr_u
          i64.or
          local.set 1
          local.get 2
          local.get 4
          i64.shr_u
          local.set 2
          i64.const 0
          br 1 (;@2;)
        end
        local.get 2
        local.get 3
        i32.const -64
        i32.add
        i64.extend_i32_u
        i64.shr_u
        local.set 1
        i64.const 0
        local.set 2
        i64.const 0
      end
      local.tee 4
      local.get 1
      i64.or
      local.set 1
    end
    local.get 0
    local.get 1
    i64.store
    local.get 0
    local.get 2
    i64.store offset=8)
  (func (;10;) (type 10) (param i64 i32) (result i32)
    (local i32 i32 i32 i64)
    block  ;; label = @1
      local.get 0
      i64.const 4294967296
      i64.ge_u
      if  ;; label = @2
        loop  ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          local.get 0
          local.get 0
          i64.const 10
          i64.div_u
          local.tee 5
          i64.const 10
          i64.mul
          i64.sub
          i32.wrap_i64
          i32.const 48
          i32.or
          i32.store8
          local.get 0
          i64.const 42949672959
          i64.gt_u
          local.set 2
          local.get 5
          local.set 0
          local.get 2
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
        unreachable
      end
      local.get 0
      local.set 5
    end
    local.get 5
    i32.wrap_i64
    local.tee 2
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 2
        local.get 2
        i32.const 10
        i32.div_u
        local.tee 3
        i32.const 10
        i32.mul
        i32.sub
        i32.const 48
        i32.or
        i32.store8
        local.get 2
        i32.const 9
        i32.gt_u
        local.set 4
        local.get 3
        local.set 2
        local.get 4
        br_if 0 (;@2;)
      end
    end
    local.get 1)
  (func (;11;) (type 2) (param i32 i64 i64 i64 i64)
    (local i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 96
    i32.sub
    local.tee 5
    i32.store
    local.get 3
    i64.const 17
    i64.shr_u
    local.get 4
    i64.const 47
    i64.shl
    i64.or
    local.set 16
    local.get 1
    i64.const 32
    i64.shr_u
    local.get 2
    i64.const 32
    i64.shl
    i64.or
    local.set 17
    local.get 3
    i64.const 49
    i64.shr_u
    local.get 4
    i64.const 281474976710655
    i64.and
    local.tee 10
    i64.const 15
    i64.shl
    i64.or
    local.set 19
    local.get 4
    local.get 2
    i64.xor
    i64.const -9223372036854775808
    i64.and
    local.set 12
    local.get 10
    i64.const 17
    i64.shr_u
    local.set 15
    local.get 2
    i64.const 281474976710655
    i64.and
    local.tee 11
    i64.const 32
    i64.shr_u
    local.set 18
    local.get 4
    i64.const 48
    i64.shr_u
    i32.wrap_i64
    i32.const 32767
    i32.and
    local.set 8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i64.const 48
          i64.shr_u
          i32.wrap_i64
          i32.const 32767
          i32.and
          local.tee 6
          i32.const -1
          i32.add
          i32.const 32765
          i32.le_u
          if  ;; label = @4
            local.get 8
            i32.const -1
            i32.add
            i32.const 32766
            i32.lt_u
            br_if 1 (;@3;)
          end
          local.get 1
          i64.eqz
          local.get 2
          i64.const 9223372036854775807
          i64.and
          local.tee 13
          i64.const 9223090561878065152
          i64.lt_u
          local.get 13
          i64.const 9223090561878065152
          i64.eq
          select
          i32.eqz
          if  ;; label = @4
            local.get 2
            i64.const 140737488355328
            i64.or
            local.set 12
            br 3 (;@1;)
          end
          local.get 3
          i64.eqz
          local.get 4
          i64.const 9223372036854775807
          i64.and
          local.tee 14
          i64.const 9223090561878065152
          i64.lt_u
          local.get 14
          i64.const 9223090561878065152
          i64.eq
          select
          i32.eqz
          if  ;; label = @4
            local.get 4
            i64.const 140737488355328
            i64.or
            local.set 12
            local.get 3
            local.set 1
            br 3 (;@1;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.get 13
              i64.const 9223090561878065152
              i64.xor
              i64.or
              i64.const 0
              i64.eq
              if  ;; label = @6
                local.get 3
                local.get 14
                i64.or
                i64.eqz
                br_if 1 (;@5;)
                local.get 4
                i64.const -9223372036854775808
                i64.and
                local.get 2
                i64.xor
                local.set 12
                br 5 (;@1;)
              end
              local.get 3
              local.get 14
              i64.const 9223090561878065152
              i64.xor
              i64.or
              i64.const 0
              i64.ne
              br_if 1 (;@4;)
              local.get 1
              local.get 13
              i64.or
              i64.eqz
              br_if 0 (;@5;)
              local.get 2
              i64.const -9223372036854775808
              i64.and
              local.get 4
              i64.xor
              local.set 12
              local.get 3
              local.set 1
              br 4 (;@1;)
            end
            i64.const 9223231299366420480
            local.set 12
            br 2 (;@2;)
          end
          local.get 1
          local.get 13
          i64.or
          i64.const 0
          i64.eq
          br_if 1 (;@2;)
          local.get 3
          local.get 14
          i64.or
          i64.const 0
          i64.eq
          br_if 1 (;@2;)
          local.get 13
          i64.const 281474976710655
          i64.le_u
          if  ;; label = @4
            local.get 5
            i32.const 80
            i32.add
            local.get 1
            local.get 11
            local.get 1
            local.get 11
            local.get 11
            i64.eqz
            local.tee 7
            select
            i64.clz
            local.get 7
            i32.const 6
            i32.shl
            i64.extend_i32_u
            i64.add
            i32.wrap_i64
            local.tee 7
            i32.const -15
            i32.add
            call 6
            i32.const 16
            local.get 7
            i32.sub
            local.set 7
            local.get 5
            i64.load offset=80
            local.tee 1
            i64.const 32
            i64.shr_u
            local.get 5
            i32.const 88
            i32.add
            i64.load
            local.tee 11
            i64.const 32
            i64.shl
            i64.or
            local.set 17
            local.get 11
            i64.const 32
            i64.shr_u
            local.set 18
          end
          local.get 14
          i64.const 281474976710655
          i64.gt_u
          br_if 0 (;@3;)
          local.get 5
          i32.const -64
          i32.sub
          local.get 3
          local.get 10
          local.get 3
          local.get 10
          local.get 10
          i64.eqz
          local.tee 9
          select
          i64.clz
          local.get 9
          i32.const 6
          i32.shl
          i64.extend_i32_u
          i64.add
          i32.wrap_i64
          local.tee 9
          i32.const -15
          i32.add
          call 6
          i32.const 16
          local.get 9
          i32.sub
          local.get 7
          i32.add
          local.set 7
          local.get 5
          i64.load offset=64
          local.tee 3
          i64.const 49
          i64.shr_u
          local.get 5
          i32.const 72
          i32.add
          i64.load
          local.tee 2
          i64.const 15
          i64.shl
          i64.or
          local.set 19
          local.get 3
          i64.const 17
          i64.shr_u
          local.get 2
          i64.const 47
          i64.shl
          i64.or
          local.set 16
          local.get 2
          i64.const 17
          i64.shr_u
          local.set 15
        end
        local.get 11
        i64.const 4294967295
        i64.and
        local.set 10
        local.get 19
        i64.const 4294967295
        i64.and
        local.tee 11
        local.get 10
        i64.mul
        local.tee 22
        local.get 16
        i64.const 4294967295
        i64.and
        local.tee 4
        local.get 18
        i64.const 65536
        i64.or
        local.tee 2
        i64.mul
        i64.add
        local.tee 19
        local.get 15
        i64.const 2147483647
        i64.and
        i64.const 2147483648
        i64.or
        local.tee 16
        local.get 17
        i64.const 4294967295
        i64.and
        local.tee 13
        i64.mul
        i64.add
        local.set 17
        local.get 4
        local.get 13
        i64.mul
        local.tee 14
        local.get 3
        i64.const 15
        i64.shl
        i64.const 4294934528
        i64.and
        local.tee 3
        local.get 10
        i64.mul
        i64.add
        local.tee 15
        local.get 11
        local.get 1
        i64.const 4294967295
        i64.and
        local.tee 1
        i64.mul
        i64.add
        local.set 18
        local.get 17
        local.get 15
        local.get 14
        i64.lt_u
        i64.extend_i32_u
        local.get 18
        local.get 15
        i64.lt_u
        i64.extend_i32_u
        i64.add
        i64.add
        local.tee 15
        local.get 16
        local.get 10
        i64.mul
        local.tee 23
        local.get 11
        local.get 2
        i64.mul
        i64.add
        local.tee 14
        i64.const 32
        i64.shl
        i64.add
        local.tee 20
        local.get 4
        local.get 10
        i64.mul
        local.tee 24
        local.get 3
        local.get 2
        i64.mul
        i64.add
        local.tee 10
        local.get 11
        local.get 13
        i64.mul
        i64.add
        local.tee 11
        local.get 16
        local.get 1
        i64.mul
        i64.add
        local.tee 21
        i64.const 32
        i64.shr_u
        local.get 10
        local.get 24
        i64.lt_u
        i64.extend_i32_u
        local.get 11
        local.get 10
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 21
        local.get 11
        i64.lt_u
        i64.extend_i32_u
        i64.add
        i64.const 32
        i64.shl
        i64.or
        i64.add
        local.set 10
        local.get 18
        local.get 4
        local.get 1
        i64.mul
        local.tee 4
        local.get 3
        local.get 13
        i64.mul
        i64.add
        local.tee 11
        i64.const 32
        i64.shr_u
        local.get 11
        local.get 4
        i64.lt_u
        i64.extend_i32_u
        i64.const 32
        i64.shl
        i64.or
        i64.add
        local.tee 4
        local.get 21
        i64.const 32
        i64.shl
        i64.add
        local.set 13
        local.get 19
        local.get 22
        i64.lt_u
        i64.extend_i32_u
        local.get 17
        local.get 19
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 15
        local.get 17
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 16
        local.get 2
        i64.mul
        i64.add
        local.get 14
        local.get 23
        i64.lt_u
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.get 14
        i64.const 32
        i64.shr_u
        i64.or
        i64.add
        local.get 20
        local.get 15
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 10
        local.get 20
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 10
        local.get 4
        local.get 18
        i64.lt_u
        i64.extend_i32_u
        local.get 13
        local.get 4
        i64.lt_u
        i64.extend_i32_u
        i64.add
        i64.add
        local.tee 4
        local.get 10
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.set 10
        local.get 11
        i64.const 32
        i64.shl
        local.tee 11
        local.get 3
        local.get 1
        i64.mul
        i64.add
        local.tee 2
        local.get 11
        i64.lt_u
        i64.extend_i32_u
        local.get 13
        i64.add
        local.set 1
        local.get 6
        local.get 8
        i32.add
        local.get 7
        i32.add
        i32.const -16383
        i32.add
        local.set 6
        block  ;; label = @3
          local.get 10
          i64.const 281474976710656
          i64.and
          i64.eqz
          if  ;; label = @4
            local.get 2
            i64.const 63
            i64.shr_u
            local.set 3
            local.get 10
            i64.const 1
            i64.shl
            local.get 4
            i64.const 63
            i64.shr_u
            i64.or
            local.set 10
            local.get 1
            i64.const 63
            i64.shr_u
            local.get 4
            i64.const 1
            i64.shl
            i64.or
            local.set 4
            local.get 2
            i64.const 1
            i64.shl
            local.set 2
            local.get 3
            local.get 1
            i64.const 1
            i64.shl
            i64.or
            local.set 1
            br 1 (;@3;)
          end
          local.get 6
          i32.const 1
          i32.add
          local.set 6
        end
        local.get 6
        i32.const 32767
        i32.ge_s
        if  ;; label = @3
          local.get 12
          i64.const 9223090561878065152
          i64.or
          local.set 12
          br 1 (;@2;)
        end
        block (result i64)  ;; label = @3
          local.get 6
          i64.extend_i32_u
          i64.const 48
          i64.shl
          local.get 10
          i64.const 281474976710655
          i64.and
          i64.or
          local.get 6
          i32.const 0
          i32.gt_s
          br_if 0 (;@3;)
          drop
          i32.const 1
          local.get 6
          i32.sub
          local.tee 6
          i32.const 127
          i32.gt_u
          br_if 1 (;@2;)
          local.get 5
          i32.const 32
          i32.add
          local.get 2
          local.get 1
          local.get 6
          call 9
          local.get 5
          i32.const 16
          i32.add
          local.get 4
          local.get 10
          i32.const 128
          local.get 6
          i32.sub
          local.tee 8
          call 6
          local.get 5
          i32.const 48
          i32.add
          local.get 2
          local.get 1
          local.get 8
          call 6
          local.get 5
          local.get 4
          local.get 10
          local.get 6
          call 9
          local.get 5
          i64.load offset=16
          local.get 5
          i64.load offset=32
          i64.or
          local.get 5
          i64.load offset=48
          local.get 5
          i32.const 56
          i32.add
          i64.load
          i64.or
          i64.const 0
          i64.ne
          i64.extend_i32_u
          i64.or
          local.set 2
          local.get 5
          i32.const 24
          i32.add
          i64.load
          local.get 5
          i32.const 40
          i32.add
          i64.load
          i64.or
          local.set 1
          local.get 5
          i64.load
          local.set 4
          local.get 5
          i32.const 8
          i32.add
          i64.load
        end
        local.tee 3
        local.get 12
        i64.or
        local.set 12
        local.get 2
        i64.eqz
        local.get 1
        i64.const -1
        i64.gt_s
        local.get 1
        i64.const -9223372036854775808
        i64.eq
        select
        i32.eqz
        if  ;; label = @3
          local.get 12
          local.get 4
          i64.const 1
          i64.add
          local.tee 1
          local.get 4
          i64.lt_u
          i64.extend_i32_u
          i64.add
          local.set 12
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i64.const -9223372036854775808
        i64.xor
        i64.or
        i64.const 0
        i64.eq
        if  ;; label = @3
          local.get 12
          local.get 4
          local.get 4
          i64.const 1
          i64.and
          i64.add
          local.tee 1
          local.get 4
          i64.lt_u
          i64.extend_i32_u
          i64.add
          local.set 12
          br 2 (;@1;)
        end
        local.get 4
        local.set 1
        br 1 (;@1;)
      end
      i64.const 0
      local.set 1
    end
    local.get 0
    local.get 1
    i64.store
    local.get 0
    local.get 12
    i64.store offset=8
    i32.const 1024
    local.get 5
    i32.const 96
    i32.add
    i32.store)
  (func (;12;) (type 2) (param i32 i64 i64 i64 i64)
    (local i32 i32 i32 i32 i64 i64 i64 i64)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 112
    i32.sub
    local.tee 5
    i32.store
    local.get 2
    i64.const 9223372036854775807
    i64.and
    local.tee 9
    local.get 1
    i64.const -1
    i64.add
    local.tee 11
    local.get 1
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.const -1
    i64.add
    local.set 12
    local.get 4
    i64.const 9223372036854775807
    i64.and
    local.set 10
    block  ;; label = @1
      block  ;; label = @2
        local.get 11
        i64.const -1
        i64.eq
        local.get 12
        i64.const 9223090561878065151
        i64.gt_u
        local.get 12
        i64.const 9223090561878065151
        i64.eq
        select
        i32.eqz
        if  ;; label = @3
          local.get 10
          local.get 3
          i64.const -1
          i64.add
          local.tee 11
          local.get 3
          i64.lt_u
          i64.extend_i32_u
          i64.add
          i64.const -1
          i64.add
          local.set 12
          local.get 11
          i64.const -1
          i64.ne
          local.get 12
          i64.const 9223090561878065151
          i64.lt_u
          local.get 12
          i64.const 9223090561878065151
          i64.eq
          select
          br_if 1 (;@2;)
        end
        local.get 1
        i64.eqz
        local.get 9
        i64.const 9223090561878065152
        i64.lt_u
        local.get 9
        i64.const 9223090561878065152
        i64.eq
        select
        i32.eqz
        if  ;; label = @3
          local.get 2
          i64.const 140737488355328
          i64.or
          local.set 4
          local.get 1
          local.set 3
          br 2 (;@1;)
        end
        local.get 3
        i64.eqz
        local.get 10
        i64.const 9223090561878065152
        i64.lt_u
        local.get 10
        i64.const 9223090561878065152
        i64.eq
        select
        i32.eqz
        if  ;; label = @3
          local.get 4
          i64.const 140737488355328
          i64.or
          local.set 4
          br 2 (;@1;)
        end
        local.get 1
        local.get 9
        i64.const 9223090561878065152
        i64.xor
        i64.or
        i64.const 0
        i64.eq
        if  ;; label = @3
          i64.const 9223231299366420480
          local.get 2
          local.get 3
          local.get 1
          i64.xor
          local.get 4
          local.get 2
          i64.xor
          i64.const -9223372036854775808
          i64.xor
          i64.or
          i64.eqz
          local.tee 6
          select
          local.set 4
          i64.const 0
          local.get 1
          local.get 6
          select
          local.set 3
          br 2 (;@1;)
        end
        local.get 3
        local.get 10
        i64.const 9223090561878065152
        i64.xor
        i64.or
        i64.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 9
        i64.or
        i64.const 0
        i64.ne
        if  ;; label = @3
          local.get 3
          local.get 10
          i64.or
          i64.eqz
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          local.set 3
          local.get 2
          local.set 4
          br 2 (;@1;)
        end
        local.get 3
        local.get 10
        i64.or
        i64.const 0
        i64.ne
        br_if 1 (;@1;)
        local.get 3
        local.get 1
        i64.and
        local.set 3
        local.get 4
        local.get 2
        i64.and
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      local.get 1
      local.get 3
      local.get 1
      i64.gt_u
      local.get 10
      local.get 9
      i64.gt_u
      local.get 10
      local.get 9
      i64.eq
      select
      local.tee 7
      select
      local.set 10
      local.get 2
      local.get 4
      local.get 7
      select
      local.set 11
      local.get 4
      local.get 2
      local.get 7
      select
      local.tee 4
      i64.const 281474976710655
      i64.and
      local.set 9
      local.get 11
      i64.const 48
      i64.shr_u
      i32.wrap_i64
      i32.const 32767
      i32.and
      local.set 8
      local.get 4
      i64.const 48
      i64.shr_u
      i32.wrap_i64
      i32.const 32767
      i32.and
      local.tee 6
      i32.eqz
      if  ;; label = @2
        local.get 5
        i32.const 96
        i32.add
        local.get 10
        local.get 9
        local.get 10
        local.get 9
        local.get 9
        i64.eqz
        local.tee 6
        select
        i64.clz
        local.get 6
        i32.const 6
        i32.shl
        i64.extend_i32_u
        i64.add
        i32.wrap_i64
        local.tee 6
        i32.const -15
        i32.add
        call 6
        i32.const 16
        local.get 6
        i32.sub
        local.set 6
        local.get 5
        i32.const 104
        i32.add
        i64.load
        local.set 9
        local.get 5
        i64.load offset=96
        local.set 10
      end
      local.get 1
      local.get 3
      local.get 7
      select
      local.set 3
      local.get 11
      i64.const 281474976710655
      i64.and
      local.set 1
      local.get 8
      i32.eqz
      if  ;; label = @2
        local.get 5
        i32.const 80
        i32.add
        local.get 3
        local.get 1
        local.get 3
        local.get 1
        local.get 1
        i64.eqz
        local.tee 7
        select
        i64.clz
        local.get 7
        i32.const 6
        i32.shl
        i64.extend_i32_u
        i64.add
        i32.wrap_i64
        local.tee 7
        i32.const -15
        i32.add
        call 6
        i32.const 16
        local.get 7
        i32.sub
        local.set 8
        local.get 5
        i32.const 88
        i32.add
        i64.load
        local.set 1
        local.get 5
        i64.load offset=80
        local.set 3
      end
      local.get 9
      i64.const 3
      i64.shl
      local.get 10
      i64.const 61
      i64.shr_u
      i64.or
      local.set 2
      local.get 3
      i64.const 3
      i64.shl
      local.set 9
      local.get 4
      local.get 11
      i64.xor
      local.set 11
      block (result i64)  ;; label = @2
        local.get 1
        i64.const 3
        i64.shl
        local.get 3
        i64.const 61
        i64.shr_u
        i64.or
        i64.const 2251799813685248
        i64.or
        local.tee 1
        local.get 6
        local.get 8
        i32.sub
        local.tee 7
        i32.eqz
        br_if 0 (;@2;)
        drop
        local.get 7
        i32.const 127
        i32.le_u
        if  ;; label = @3
          local.get 5
          i32.const -64
          i32.sub
          local.get 9
          local.get 1
          i32.const 128
          local.get 7
          i32.sub
          call 6
          local.get 5
          i32.const 48
          i32.add
          local.get 9
          local.get 1
          local.get 7
          call 9
          local.get 5
          i64.load offset=48
          local.get 5
          i64.load offset=64
          local.get 5
          i32.const 72
          i32.add
          i64.load
          i64.or
          i64.const 0
          i64.ne
          i64.extend_i32_u
          i64.or
          local.set 9
          local.get 5
          i32.const 56
          i32.add
          i64.load
          br 1 (;@2;)
        end
        i64.const 1
        local.set 9
        i64.const 0
      end
      local.set 1
      local.get 2
      i64.const 2251799813685248
      i64.or
      local.set 2
      local.get 10
      i64.const 3
      i64.shl
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 11
          i64.const -1
          i64.gt_s
          if  ;; label = @4
            local.get 1
            local.get 2
            i64.add
            local.get 9
            local.get 3
            i64.add
            local.tee 3
            local.get 9
            i64.lt_u
            i64.extend_i32_u
            i64.add
            local.tee 1
            i64.const 4503599627370496
            i64.and
            i64.eqz
            br_if 1 (;@3;)
            local.get 3
            i64.const 1
            i64.shr_u
            local.get 1
            i64.const 63
            i64.shl
            i64.or
            local.get 3
            i64.const 1
            i64.and
            i64.or
            local.set 3
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            local.get 1
            i64.const 1
            i64.shr_u
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 1
          i64.sub
          local.get 3
          local.get 9
          i64.lt_u
          i64.extend_i32_u
          i64.sub
          local.set 1
          local.get 3
          local.get 9
          i64.sub
          local.tee 3
          local.get 1
          i64.or
          i64.eqz
          br_if 1 (;@2;)
          local.get 1
          i64.const 2251799813685247
          i64.gt_u
          br_if 0 (;@3;)
          local.get 5
          i32.const 32
          i32.add
          local.get 3
          local.get 1
          local.get 3
          local.get 1
          local.get 1
          i64.eqz
          local.tee 7
          select
          i64.clz
          local.get 7
          i32.const 6
          i32.shl
          i64.extend_i32_u
          i64.add
          i32.wrap_i64
          i32.const -12
          i32.add
          local.tee 7
          call 6
          local.get 6
          local.get 7
          i32.sub
          local.set 6
          local.get 5
          i32.const 40
          i32.add
          i64.load
          local.set 1
          local.get 5
          i64.load offset=32
          local.set 3
        end
        local.get 4
        i64.const -9223372036854775808
        i64.and
        local.set 4
        local.get 6
        i32.const 32767
        i32.ge_s
        if  ;; label = @3
          local.get 4
          i64.const 9223090561878065152
          i64.or
          local.set 4
          i64.const 0
          local.set 3
          br 2 (;@1;)
        end
        i32.const 0
        local.set 7
        block  ;; label = @3
          local.get 6
          i32.const 0
          i32.gt_s
          if  ;; label = @4
            local.get 6
            local.set 7
            br 1 (;@3;)
          end
          local.get 5
          i32.const 16
          i32.add
          local.get 3
          local.get 1
          i32.const 128
          i32.const 1
          local.get 6
          i32.sub
          local.tee 6
          i32.sub
          call 6
          local.get 5
          local.get 3
          local.get 1
          local.get 6
          call 9
          local.get 5
          i64.load
          local.get 5
          i64.load offset=16
          local.get 5
          i32.const 24
          i32.add
          i64.load
          i64.or
          i64.const 0
          i64.ne
          i64.extend_i32_u
          i64.or
          local.set 3
          local.get 5
          i32.const 8
          i32.add
          i64.load
          local.set 1
        end
        local.get 3
        i64.const 3
        i64.shr_u
        local.get 1
        i64.const 61
        i64.shl
        i64.or
        local.tee 2
        local.get 3
        i32.wrap_i64
        i32.const 7
        i32.and
        local.tee 6
        i32.const 4
        i32.gt_u
        i64.extend_i32_u
        i64.add
        local.tee 9
        i64.const 1
        i64.and
        i64.const 0
        local.get 6
        i32.const 4
        i32.eq
        select
        local.tee 10
        local.get 9
        i64.add
        local.set 3
        local.get 1
        i64.const 3
        i64.shr_u
        i64.const 281474976710655
        i64.and
        local.get 4
        i64.or
        local.get 7
        i64.extend_i32_u
        i64.const 48
        i64.shl
        i64.or
        local.get 9
        local.get 2
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 3
        local.get 10
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.set 4
        br 1 (;@1;)
      end
      i64.const 0
      local.set 3
      i64.const 0
      local.set 4
    end
    local.get 0
    local.get 3
    i64.store
    local.get 0
    local.get 4
    i64.store offset=8
    i32.const 1024
    local.get 5
    i32.const 112
    i32.add
    i32.store)
  (func (;13;) (type 2) (param i32 i64 i64 i64 i64)
    (local i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 5
    i32.store
    local.get 5
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    i64.const -9223372036854775808
    i64.xor
    call 12
    local.get 5
    i64.load
    local.set 1
    local.get 0
    local.get 5
    i64.load offset=8
    i64.store offset=8
    local.get 0
    local.get 1
    i64.store
    i32.const 1024
    local.get 5
    i32.const 16
    i32.add
    i32.store)
  (func (;14;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 2
      i32.load offset=16
      local.tee 3
      i32.eqz
      if  ;; label = @2
        local.get 2
        call 18
        br_if 1 (;@1;)
        local.get 2
        i32.const 16
        i32.add
        i32.load
        local.set 3
      end
      local.get 3
      local.get 2
      i32.load offset=20
      local.tee 6
      i32.sub
      local.get 1
      i32.lt_u
      if  ;; label = @2
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.load offset=36
        call_indirect (type 0)
        return
      end
      block  ;; label = @2
        local.get 2
        i32.load8_s offset=75
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        local.set 4
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 1
          local.get 3
          i32.eq
          br_if 1 (;@2;)
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 4
          local.get 1
          i32.add
          local.set 7
          local.get 4
          i32.const -1
          i32.add
          local.tee 8
          local.set 4
          local.get 7
          i32.const -1
          i32.add
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        local.get 1
        local.get 3
        i32.sub
        i32.const 1
        i32.add
        local.tee 5
        local.get 2
        i32.load offset=36
        call_indirect (type 0)
        local.tee 4
        local.get 5
        i32.lt_u
        br_if 1 (;@1;)
        local.get 8
        local.get 1
        i32.add
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const 20
        i32.add
        i32.load
        local.set 6
        local.get 3
        i32.const -1
        i32.add
        local.set 1
      end
      local.get 6
      local.get 0
      local.get 1
      call 37
      drop
      local.get 2
      i32.const 20
      i32.add
      local.tee 3
      local.get 3
      i32.load
      local.get 1
      i32.add
      i32.store
      local.get 5
      local.get 1
      i32.add
      return
    end
    local.get 4)
  (func (;15;) (type 7) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 112
    i32.sub
    local.tee 6
    i32.store
    local.get 6
    local.get 1
    i32.store offset=108
    local.get 6
    i32.const 70
    i32.add
    local.set 19
    local.get 6
    i32.const 71
    i32.add
    local.set 16
    i32.const 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              block  ;; label = @6
                local.get 14
                i32.const 0
                i32.lt_s
                br_if 0 (;@6;)
                local.get 1
                i32.const 2147483647
                local.get 14
                i32.sub
                i32.gt_s
                if  ;; label = @7
                  i32.const 1620
                  i32.const 75
                  i32.store
                  i32.const -1
                  local.set 14
                  br 1 (;@6;)
                end
                local.get 1
                local.get 14
                i32.add
                local.set 14
              end
              local.get 6
              i32.load offset=108
              local.tee 8
              i32.load8_u
              local.tee 7
              if  ;; label = @6
                local.get 8
                i32.const 2
                i32.add
                local.set 5
                local.get 8
                i32.const 1
                i32.add
                local.set 1
                block  ;; label = @7
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 7
                      i32.const 255
                      i32.and
                      local.tee 7
                      i32.eqz
                      br_if 1 (;@8;)
                      local.get 7
                      i32.const 37
                      i32.ne
                      if  ;; label = @10
                        local.get 5
                        i32.const 1
                        i32.add
                        local.set 5
                        local.get 6
                        local.get 1
                        i32.store offset=108
                        local.get 1
                        i32.load8_u
                        local.set 7
                        local.get 1
                        i32.const 1
                        i32.add
                        local.set 1
                        br 1 (;@9;)
                      end
                    end
                    local.get 1
                    i32.const -1
                    i32.add
                    local.set 1
                    loop  ;; label = @9
                      local.get 5
                      i32.const -1
                      i32.add
                      i32.load8_u
                      i32.const 37
                      i32.ne
                      br_if 2 (;@7;)
                      local.get 1
                      i32.const 1
                      i32.add
                      local.set 1
                      local.get 6
                      local.get 5
                      i32.store offset=108
                      local.get 5
                      i32.load8_u
                      local.set 7
                      local.get 5
                      i32.const 2
                      i32.add
                      local.set 5
                      local.get 7
                      i32.const 37
                      i32.eq
                      br_if 0 (;@9;)
                      br 2 (;@7;)
                    end
                    unreachable
                  end
                  local.get 1
                  i32.const -1
                  i32.add
                  local.set 1
                end
                local.get 1
                local.get 8
                i32.sub
                local.set 1
                local.get 0
                if  ;; label = @7
                  local.get 0
                  local.get 8
                  local.get 1
                  call 4
                end
                local.get 1
                br_if 1 (;@5;)
                i32.const -1
                local.set 15
                i32.const 1
                local.set 10
                local.get 6
                i32.load offset=108
                local.set 11
                block  ;; label = @7
                  local.get 6
                  i32.load offset=108
                  i32.load8_s offset=1
                  i32.const -48
                  i32.add
                  i32.const 10
                  i32.lt_u
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 11
                  i32.load8_u offset=2
                  i32.const 36
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 11
                  i32.load8_s offset=1
                  i32.const -48
                  i32.add
                  local.set 15
                  i32.const 1
                  local.set 17
                  i32.const 3
                  local.set 10
                end
                local.get 6
                local.get 11
                local.get 10
                i32.add
                local.tee 1
                i32.store offset=108
                i32.const 0
                local.set 12
                block  ;; label = @7
                  local.get 1
                  i32.load8_s
                  local.tee 7
                  i32.const -32
                  i32.add
                  local.tee 5
                  i32.const 31
                  i32.gt_u
                  br_if 0 (;@7;)
                  i32.const 1
                  local.get 5
                  i32.shl
                  local.tee 5
                  i32.const 75913
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 11
                  local.get 10
                  i32.add
                  i32.const 1
                  i32.add
                  local.set 11
                  loop  ;; label = @8
                    local.get 5
                    local.get 12
                    i32.or
                    local.set 12
                    local.get 6
                    local.get 11
                    local.tee 1
                    i32.store offset=108
                    local.get 1
                    i32.load8_s
                    local.tee 7
                    i32.const -32
                    i32.add
                    local.tee 5
                    i32.const 32
                    i32.ge_u
                    br_if 1 (;@7;)
                    local.get 1
                    i32.const 1
                    i32.add
                    local.set 11
                    i32.const 1
                    local.get 5
                    i32.shl
                    local.tee 5
                    i32.const 75913
                    i32.and
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  block (result i32)  ;; label = @8
                    block  ;; label = @9
                      local.get 7
                      i32.const 42
                      i32.eq
                      if  ;; label = @10
                        local.get 1
                        i32.load8_s offset=1
                        i32.const -48
                        i32.add
                        i32.const 10
                        i32.lt_u
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 6
                        i32.load offset=108
                        local.tee 5
                        i32.load8_u offset=2
                        i32.const 36
                        i32.ne
                        br_if 1 (;@9;)
                        local.get 4
                        local.get 5
                        i32.load8_s offset=1
                        i32.const 2
                        i32.shl
                        i32.add
                        i32.const -192
                        i32.add
                        i32.const 10
                        i32.store
                        local.get 3
                        local.get 5
                        i32.load8_s offset=1
                        i32.const 4
                        i32.shl
                        i32.add
                        i32.const -768
                        i32.add
                        i32.load
                        local.set 13
                        i32.const 1
                        local.set 17
                        local.get 5
                        i32.const 3
                        i32.add
                        br 2 (;@8;)
                      end
                      local.get 6
                      i32.const 108
                      i32.add
                      call 22
                      local.tee 13
                      i32.const 0
                      i32.lt_s
                      br_if 7 (;@2;)
                      local.get 6
                      i32.load offset=108
                      local.set 1
                      br 2 (;@7;)
                    end
                    local.get 17
                    br_if 6 (;@2;)
                    i32.const 0
                    local.set 17
                    i32.const 0
                    local.set 13
                    local.get 0
                    if  ;; label = @9
                      local.get 2
                      local.get 2
                      i32.load
                      local.tee 1
                      i32.const 4
                      i32.add
                      i32.store
                      local.get 1
                      i32.load
                      local.set 13
                    end
                    local.get 6
                    i32.load offset=108
                    i32.const 1
                    i32.add
                  end
                  local.set 1
                  local.get 6
                  local.get 1
                  i32.store offset=108
                  local.get 13
                  i32.const -1
                  i32.gt_s
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 13
                  i32.sub
                  local.set 13
                  local.get 12
                  i32.const 8192
                  i32.or
                  local.set 12
                end
                i32.const -1
                local.set 9
                block  ;; label = @7
                  local.get 1
                  i32.load8_u
                  i32.const 46
                  i32.ne
                  br_if 0 (;@7;)
                  block (result i32)  ;; label = @8
                    block  ;; label = @9
                      local.get 1
                      i32.load8_u offset=1
                      i32.const 42
                      i32.eq
                      if  ;; label = @10
                        local.get 1
                        i32.load8_s offset=2
                        i32.const -48
                        i32.add
                        i32.const 10
                        i32.lt_u
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 6
                        i32.load offset=108
                        local.tee 1
                        i32.load8_u offset=3
                        i32.const 36
                        i32.ne
                        br_if 1 (;@9;)
                        local.get 4
                        local.get 1
                        i32.load8_s offset=2
                        i32.const 2
                        i32.shl
                        i32.add
                        i32.const -192
                        i32.add
                        i32.const 10
                        i32.store
                        local.get 3
                        local.get 1
                        i32.load8_s offset=2
                        i32.const 4
                        i32.shl
                        i32.add
                        i32.const -768
                        i32.add
                        i32.load
                        local.set 9
                        local.get 1
                        i32.const 4
                        i32.add
                        br 2 (;@8;)
                      end
                      local.get 6
                      local.get 1
                      i32.const 1
                      i32.add
                      i32.store offset=108
                      local.get 6
                      i32.const 108
                      i32.add
                      call 22
                      local.set 9
                      local.get 6
                      i32.load offset=108
                      local.set 1
                      br 2 (;@7;)
                    end
                    local.get 17
                    br_if 6 (;@2;)
                    block (result i32)  ;; label = @9
                      local.get 0
                      if  ;; label = @10
                        local.get 2
                        local.get 2
                        i32.load
                        local.tee 1
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 1
                        i32.load
                        br 1 (;@9;)
                      end
                      i32.const 0
                    end
                    local.set 9
                    local.get 6
                    i32.load offset=108
                    i32.const 2
                    i32.add
                  end
                  local.set 1
                  local.get 6
                  local.get 1
                  i32.store offset=108
                end
                i32.const 0
                local.set 5
                loop  ;; label = @7
                  local.get 5
                  local.set 11
                  i32.const -1
                  local.set 10
                  local.get 1
                  i32.load8_s
                  i32.const -65
                  i32.add
                  i32.const 57
                  i32.gt_u
                  br_if 6 (;@1;)
                  local.get 6
                  local.get 1
                  i32.const 1
                  i32.add
                  local.tee 7
                  i32.store offset=108
                  local.get 11
                  i32.const 58
                  i32.mul
                  local.get 1
                  i32.load8_s
                  i32.add
                  i32.const 2735
                  i32.add
                  i32.load8_u
                  local.set 5
                  local.get 7
                  local.set 1
                  local.get 5
                  i32.const -1
                  i32.add
                  i32.const 8
                  i32.lt_u
                  br_if 0 (;@7;)
                end
                local.get 5
                i32.eqz
                br_if 5 (;@1;)
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 5
                      i32.const 19
                      i32.eq
                      if  ;; label = @10
                        local.get 15
                        i32.const -1
                        i32.le_s
                        br_if 1 (;@9;)
                        br 9 (;@1;)
                      end
                      local.get 15
                      i32.const 0
                      i32.lt_s
                      br_if 1 (;@8;)
                      local.get 4
                      local.get 15
                      i32.const 2
                      i32.shl
                      i32.add
                      local.get 5
                      i32.store
                      local.get 6
                      local.get 3
                      local.get 15
                      i32.const 4
                      i32.shl
                      i32.add
                      local.tee 1
                      i32.const 8
                      i32.add
                      i64.load
                      i64.store offset=88
                      local.get 6
                      local.get 1
                      i64.load
                      i64.store offset=80
                    end
                    i32.const 0
                    local.set 1
                    local.get 0
                    i32.eqz
                    br_if 3 (;@5;)
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 6
                  i32.const 80
                  i32.add
                  local.get 5
                  local.get 2
                  call 21
                  local.get 6
                  i32.load offset=108
                  local.set 7
                end
                local.get 12
                i32.const -65537
                i32.and
                local.tee 15
                local.get 12
                local.get 12
                i32.const 8192
                i32.and
                select
                local.set 5
                i32.const 0
                local.set 10
                i32.const 3264
                local.set 18
                local.get 16
                local.set 12
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
                                      block (result i32)  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block (result i32)  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block (result i32)  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block (result i32)  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          local.get 7
                                                                          i32.const -1
                                                                          i32.add
                                                                          i32.load8_s
                                                                          local.tee 1
                                                                          i32.const -33
                                                                          i32.and
                                                                          local.get 1
                                                                          local.get 1
                                                                          i32.const 15
                                                                          i32.and
                                                                          i32.const 3
                                                                          i32.eq
                                                                          select
                                                                          local.get 1
                                                                          local.get 11
                                                                          select
                                                                          local.tee 1
                                                                          i32.const 82
                                                                          i32.gt_s
                                                                          if  ;; label = @36
                                                                            local.get 1
                                                                            i32.const -83
                                                                            i32.add
                                                                            local.tee 7
                                                                            i32.const 37
                                                                            i32.gt_u
                                                                            br_if 19 (;@17;)
                                                                            block  ;; label = @37
                                                                              local.get 7
                                                                              i32.const 1
                                                                              i32.sub
                                                                              br_table 20 (;@17;) 20 (;@17;) 20 (;@17;) 20 (;@17;) 10 (;@27;) 20 (;@17;) 20 (;@17;) 20 (;@17;) 20 (;@17;) 20 (;@17;) 20 (;@17;) 20 (;@17;) 20 (;@17;) 2 (;@35;) 20 (;@17;) 3 (;@34;) 0 (;@37;) 2 (;@35;) 2 (;@35;) 2 (;@35;) 20 (;@17;) 0 (;@37;) 20 (;@17;) 20 (;@17;) 20 (;@17;) 8 (;@29;) 4 (;@33;) 5 (;@32;) 9 (;@28;) 20 (;@17;) 20 (;@17;) 11 (;@26;) 20 (;@17;) 13 (;@24;) 20 (;@17;) 20 (;@17;) 10 (;@27;) 6 (;@31;)
                                                                            end
                                                                            local.get 6
                                                                            i64.load offset=80
                                                                            local.tee 20
                                                                            i64.const -1
                                                                            i64.le_s
                                                                            br_if 13 (;@23;)
                                                                            local.get 5
                                                                            i32.const 2048
                                                                            i32.and
                                                                            br_if 14 (;@22;)
                                                                            i32.const 3266
                                                                            i32.const 3264
                                                                            local.get 5
                                                                            i32.const 1
                                                                            i32.and
                                                                            local.tee 10
                                                                            select
                                                                            br 15 (;@21;)
                                                                          end
                                                                          local.get 1
                                                                          i32.const -69
                                                                          i32.add
                                                                          i32.const 3
                                                                          i32.lt_u
                                                                          br_if 0 (;@35;)
                                                                          local.get 1
                                                                          i32.const 65
                                                                          i32.eq
                                                                          br_if 0 (;@35;)
                                                                          local.get 1
                                                                          i32.const 67
                                                                          i32.ne
                                                                          br_if 18 (;@17;)
                                                                          local.get 6
                                                                          i32.const 12
                                                                          i32.add
                                                                          i32.const 0
                                                                          i32.store
                                                                          local.get 6
                                                                          local.get 6
                                                                          i64.load offset=80
                                                                          i64.store32 offset=8
                                                                          local.get 6
                                                                          local.get 6
                                                                          i32.const 8
                                                                          i32.add
                                                                          i32.store offset=80
                                                                          i32.const -1
                                                                          local.set 9
                                                                          local.get 6
                                                                          i32.const 8
                                                                          i32.add
                                                                          br 5 (;@30;)
                                                                        end
                                                                        local.get 0
                                                                        local.get 6
                                                                        i64.load offset=80
                                                                        local.get 6
                                                                        i64.load offset=88
                                                                        local.get 13
                                                                        local.get 9
                                                                        local.get 5
                                                                        local.get 1
                                                                        call 47
                                                                        local.set 1
                                                                        br 29 (;@5;)
                                                                      end
                                                                      local.get 19
                                                                      local.get 6
                                                                      i64.load offset=80
                                                                      i64.store8
                                                                      i32.const 1
                                                                      local.set 9
                                                                      local.get 19
                                                                      local.set 8
                                                                      local.get 15
                                                                      local.set 5
                                                                      br 16 (;@17;)
                                                                    end
                                                                    i32.const 0
                                                                    local.set 1
                                                                    local.get 11
                                                                    i32.const 255
                                                                    i32.and
                                                                    local.tee 5
                                                                    i32.const 7
                                                                    i32.gt_u
                                                                    br_if 27 (;@5;)
                                                                    block  ;; label = @33
                                                                      local.get 5
                                                                      i32.const 1
                                                                      i32.sub
                                                                      br_table 21 (;@12;) 22 (;@11;) 23 (;@10;) 24 (;@9;) 28 (;@5;) 25 (;@8;) 26 (;@7;) 0 (;@33;)
                                                                    end
                                                                    local.get 6
                                                                    i32.load offset=80
                                                                    local.get 14
                                                                    i32.store
                                                                    br 27 (;@5;)
                                                                  end
                                                                  local.get 6
                                                                  i64.load offset=80
                                                                  local.tee 20
                                                                  local.get 16
                                                                  call 49
                                                                  local.set 8
                                                                  local.get 5
                                                                  i32.const 8
                                                                  i32.and
                                                                  i32.eqz
                                                                  br_if 11 (;@20;)
                                                                  local.get 9
                                                                  local.get 16
                                                                  local.get 8
                                                                  i32.sub
                                                                  local.tee 1
                                                                  i32.const 1
                                                                  i32.add
                                                                  local.get 9
                                                                  local.get 1
                                                                  i32.gt_s
                                                                  select
                                                                  local.set 9
                                                                  br 11 (;@20;)
                                                                end
                                                                local.get 9
                                                                i32.eqz
                                                                br_if 16 (;@14;)
                                                                local.get 6
                                                                i32.load offset=80
                                                              end
                                                              local.set 12
                                                              i32.const 0
                                                              local.set 1
                                                              local.get 12
                                                              local.set 8
                                                              loop  ;; label = @30
                                                                local.get 8
                                                                i32.load
                                                                local.tee 7
                                                                i32.eqz
                                                                br_if 15 (;@15;)
                                                                local.get 6
                                                                i32.const 4
                                                                i32.add
                                                                local.get 7
                                                                call 20
                                                                local.tee 7
                                                                i32.const 0
                                                                i32.lt_s
                                                                local.tee 11
                                                                br_if 14 (;@16;)
                                                                local.get 7
                                                                local.get 9
                                                                local.get 1
                                                                i32.sub
                                                                i32.gt_u
                                                                br_if 14 (;@16;)
                                                                local.get 8
                                                                i32.const 4
                                                                i32.add
                                                                local.set 8
                                                                local.get 9
                                                                local.get 7
                                                                local.get 1
                                                                i32.add
                                                                local.tee 1
                                                                i32.gt_u
                                                                br_if 0 (;@30;)
                                                                br 15 (;@15;)
                                                              end
                                                              unreachable
                                                            end
                                                            i32.const 1620
                                                            i32.load
                                                            i32.const 3412
                                                            i32.load offset=188
                                                            call 45
                                                            br 3 (;@25;)
                                                          end
                                                          local.get 9
                                                          i32.const 8
                                                          local.get 9
                                                          i32.const 8
                                                          i32.gt_u
                                                          select
                                                          local.set 9
                                                          local.get 5
                                                          i32.const 8
                                                          i32.or
                                                          local.set 5
                                                          i32.const 120
                                                          local.set 1
                                                        end
                                                        local.get 6
                                                        i64.load offset=80
                                                        local.tee 20
                                                        local.get 16
                                                        local.get 1
                                                        i32.const 32
                                                        i32.and
                                                        call 50
                                                        local.set 8
                                                        local.get 5
                                                        i32.const 8
                                                        i32.and
                                                        i32.eqz
                                                        br_if 6 (;@20;)
                                                        local.get 20
                                                        i64.eqz
                                                        br_if 6 (;@20;)
                                                        local.get 5
                                                        i32.const -65537
                                                        i32.and
                                                        local.get 5
                                                        local.get 9
                                                        i32.const -1
                                                        i32.gt_s
                                                        select
                                                        local.set 5
                                                        local.get 1
                                                        i32.const 4
                                                        i32.shr_u
                                                        i32.const 3264
                                                        i32.add
                                                        local.set 18
                                                        i32.const 2
                                                        local.set 10
                                                        i32.const 1
                                                        local.set 1
                                                        br 7 (;@19;)
                                                      end
                                                      local.get 6
                                                      i32.load offset=80
                                                      local.tee 1
                                                      i32.const 3280
                                                      local.get 1
                                                      select
                                                    end
                                                    local.tee 8
                                                    i32.const 0
                                                    local.get 9
                                                    call 48
                                                    local.tee 1
                                                    local.get 8
                                                    local.get 9
                                                    i32.add
                                                    local.get 1
                                                    select
                                                    local.set 12
                                                    local.get 15
                                                    local.set 5
                                                    local.get 1
                                                    local.get 8
                                                    i32.sub
                                                    local.get 9
                                                    local.get 1
                                                    select
                                                    local.set 9
                                                    br 7 (;@17;)
                                                  end
                                                  local.get 6
                                                  i64.load offset=80
                                                  local.set 20
                                                  i32.const 3264
                                                  br 2 (;@21;)
                                                end
                                                local.get 6
                                                i64.const 0
                                                local.get 20
                                                i64.sub
                                                local.tee 20
                                                i64.store offset=80
                                                i32.const 1
                                                local.set 10
                                                i32.const 3264
                                                br 1 (;@21;)
                                              end
                                              i32.const 1
                                              local.set 10
                                              i32.const 3265
                                            end
                                            local.set 18
                                            local.get 20
                                            local.get 16
                                            call 10
                                            local.set 8
                                          end
                                          local.get 5
                                          i32.const -65537
                                          i32.and
                                          local.get 5
                                          local.get 9
                                          i32.const -1
                                          i32.gt_s
                                          select
                                          local.set 5
                                          local.get 20
                                          i64.const 0
                                          i64.ne
                                          local.set 1
                                          local.get 9
                                          br_if 0 (;@19;)
                                          local.get 20
                                          i64.eqz
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          local.get 16
                                          local.set 8
                                          i32.const 0
                                          br 1 (;@18;)
                                        end
                                        local.get 9
                                        local.get 16
                                        local.get 8
                                        i32.sub
                                        local.get 1
                                        i32.const 1
                                        i32.xor
                                        i32.add
                                        local.tee 1
                                        local.get 9
                                        local.get 1
                                        i32.gt_s
                                        select
                                      end
                                      local.set 9
                                    end
                                    local.get 0
                                    i32.const 32
                                    local.get 10
                                    local.get 12
                                    local.get 8
                                    i32.sub
                                    local.tee 11
                                    local.get 9
                                    local.get 9
                                    local.get 11
                                    i32.lt_s
                                    select
                                    local.tee 12
                                    i32.add
                                    local.tee 7
                                    local.get 13
                                    local.get 13
                                    local.get 7
                                    i32.lt_s
                                    select
                                    local.tee 1
                                    local.get 7
                                    local.get 5
                                    call 5
                                    local.get 0
                                    local.get 18
                                    local.get 10
                                    call 4
                                    local.get 0
                                    i32.const 48
                                    local.get 1
                                    local.get 7
                                    local.get 5
                                    i32.const 65536
                                    i32.xor
                                    call 5
                                    local.get 0
                                    i32.const 48
                                    local.get 12
                                    local.get 11
                                    i32.const 0
                                    call 5
                                    local.get 0
                                    local.get 8
                                    local.get 11
                                    call 4
                                    local.get 0
                                    i32.const 32
                                    local.get 1
                                    local.get 7
                                    local.get 5
                                    i32.const 8192
                                    i32.xor
                                    call 5
                                    br 11 (;@5;)
                                  end
                                  i32.const -1
                                  local.set 10
                                  local.get 11
                                  br_if 14 (;@1;)
                                end
                                local.get 0
                                i32.const 32
                                local.get 13
                                local.get 1
                                local.get 5
                                call 5
                                local.get 1
                                if  ;; label = @15
                                  i32.const 0
                                  local.set 7
                                  loop  ;; label = @16
                                    local.get 12
                                    i32.load
                                    local.tee 8
                                    i32.eqz
                                    br_if 3 (;@13;)
                                    local.get 6
                                    i32.const 4
                                    i32.add
                                    local.get 8
                                    call 20
                                    local.tee 8
                                    local.get 7
                                    i32.add
                                    local.tee 7
                                    local.get 1
                                    i32.gt_s
                                    br_if 3 (;@13;)
                                    local.get 0
                                    local.get 6
                                    i32.const 4
                                    i32.add
                                    local.get 8
                                    call 4
                                    local.get 12
                                    i32.const 4
                                    i32.add
                                    local.set 12
                                    local.get 7
                                    local.get 1
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                    br 3 (;@13;)
                                  end
                                  unreachable
                                end
                                i32.const 0
                                local.set 1
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 1
                              local.get 0
                              i32.const 32
                              local.get 13
                              i32.const 0
                              local.get 5
                              call 5
                            end
                            local.get 0
                            i32.const 32
                            local.get 13
                            local.get 1
                            local.get 5
                            i32.const 8192
                            i32.xor
                            call 5
                            local.get 13
                            local.get 1
                            local.get 13
                            local.get 1
                            i32.gt_s
                            select
                            local.set 1
                            br 7 (;@5;)
                          end
                          local.get 6
                          i32.load offset=80
                          local.get 14
                          i32.store
                          br 6 (;@5;)
                        end
                        local.get 6
                        i32.load offset=80
                        local.get 14
                        i64.extend_i32_s
                        i64.store
                        br 5 (;@5;)
                      end
                      local.get 6
                      i32.load offset=80
                      local.get 14
                      i32.store16
                      br 4 (;@5;)
                    end
                    local.get 6
                    i32.load offset=80
                    local.get 14
                    i32.store8
                    br 3 (;@5;)
                  end
                  local.get 6
                  i32.load offset=80
                  local.get 14
                  i32.store
                  br 2 (;@5;)
                end
                local.get 6
                i32.load offset=80
                local.get 14
                i64.extend_i32_s
                i64.store
                br 1 (;@5;)
              end
            end
            local.get 14
            local.set 10
            local.get 0
            br_if 3 (;@1;)
            local.get 17
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.const 16
            i32.add
            local.set 8
            local.get 4
            i32.const 4
            i32.add
            local.set 1
            i32.const 1
            local.set 5
            loop  ;; label = @5
              local.get 1
              i32.load
              local.tee 7
              i32.eqz
              br_if 2 (;@3;)
              local.get 8
              local.get 7
              local.get 2
              call 21
              local.get 8
              i32.const 16
              i32.add
              local.set 8
              local.get 1
              i32.const 4
              i32.add
              local.set 1
              i32.const 1
              local.set 10
              local.get 5
              i32.const 1
              i32.add
              local.tee 5
              i32.const 10
              i32.lt_u
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
            unreachable
          end
          i32.const 0
          local.set 10
          br 2 (;@1;)
        end
        loop  ;; label = @3
          local.get 1
          i32.load
          br_if 1 (;@2;)
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 9
          i32.le_u
          br_if 0 (;@3;)
        end
        i32.const 1
        local.set 10
        br 1 (;@1;)
      end
      i32.const -1
      local.set 10
    end
    i32.const 1024
    local.get 6
    i32.const 112
    i32.add
    i32.store
    local.get 10)
  (func (;16;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 48
    i32.sub
    local.tee 4
    i32.store
    local.get 4
    local.get 0
    i32.load offset=28
    local.tee 3
    i32.store offset=32
    local.get 0
    i32.load offset=20
    local.set 6
    local.get 4
    local.get 1
    i32.store offset=40
    local.get 4
    local.get 2
    i32.store offset=44
    local.get 4
    local.get 6
    local.get 3
    i32.sub
    local.tee 3
    i32.store offset=36
    local.get 0
    i32.load offset=60
    local.set 1
    i32.const 2
    local.set 7
    local.get 4
    i32.const 2
    i32.store offset=24
    local.get 4
    local.get 1
    i32.store offset=16
    local.get 4
    local.get 4
    i32.const 32
    i32.add
    i32.store offset=20
    block (result i32)  ;; label = @1
      block  ;; label = @2
        block (result i32)  ;; label = @3
          i32.const 146
          local.get 4
          i32.const 16
          i32.add
          call 1
          local.tee 1
          i32.const -4095
          i32.ge_u
          if  ;; label = @4
            i32.const 1620
            i32.const 0
            local.get 1
            i32.sub
            i32.store
            i32.const -1
            local.set 1
          end
          local.get 3
          local.get 2
          i32.add
          local.tee 8
          local.get 1
          local.tee 1
          i32.ne
        end
        if  ;; label = @3
          local.get 4
          i32.const 32
          i32.add
          local.set 3
          local.get 0
          i32.const 60
          i32.add
          local.set 9
          loop  ;; label = @4
            local.get 1
            i32.const -1
            i32.le_s
            br_if 2 (;@2;)
            local.get 3
            i32.const 8
            i32.add
            local.get 3
            local.get 1
            local.get 3
            i32.load offset=4
            local.tee 5
            i32.gt_u
            local.tee 6
            select
            local.tee 3
            local.get 3
            i32.load
            local.get 1
            local.get 5
            i32.const 0
            local.get 6
            select
            i32.sub
            local.tee 5
            i32.add
            i32.store
            local.get 3
            local.get 3
            i32.load offset=4
            local.get 5
            i32.sub
            i32.store offset=4
            local.get 9
            i32.load
            local.set 5
            local.get 4
            local.get 7
            local.get 6
            i32.sub
            local.tee 7
            i32.store offset=8
            local.get 4
            local.get 3
            i32.store offset=4
            local.get 4
            local.get 5
            i32.store
            local.get 8
            local.get 1
            i32.sub
            local.tee 8
            block (result i32)  ;; label = @5
              i32.const 146
              local.get 4
              call 1
              local.tee 1
              i32.const -4095
              i32.ge_u
              if  ;; label = @6
                i32.const 1620
                i32.const 0
                local.get 1
                i32.sub
                i32.store
                i32.const -1
                local.set 1
              end
              local.get 1
              local.tee 1
            end
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 0
        i32.const 28
        i32.add
        local.get 0
        i32.load offset=44
        local.tee 3
        i32.store
        local.get 0
        i32.const 20
        i32.add
        local.get 3
        i32.store
        local.get 0
        local.get 3
        local.get 0
        i32.load offset=48
        i32.add
        i32.store offset=16
        local.get 2
        br 1 (;@1;)
      end
      local.get 0
      i64.const 0
      i64.store offset=16 align=4
      local.get 0
      i32.const 28
      i32.add
      i32.const 0
      i32.store
      local.get 0
      local.get 0
      i32.load
      i32.const 32
      i32.or
      i32.store
      i32.const 0
      local.get 7
      i32.const 2
      i32.eq
      br_if 0 (;@1;)
      drop
      local.get 2
      local.get 3
      i32.load offset=4
      i32.sub
    end
    local.set 1
    i32.const 1024
    local.get 4
    i32.const 48
    i32.add
    i32.store
    local.get 1)
  (func (;17;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i64)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 3
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 1
      i32.store
      local.get 3
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 4
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=8
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 1
      i32.store
      local.get 4
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.store offset=16
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 3
      local.get 1
      i32.store offset=20
      local.get 3
      local.get 1
      i32.store offset=24
      local.get 2
      i32.const -24
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 1
      i32.store
      local.get 2
      i32.const -16
      i32.add
      local.get 1
      i32.store
      local.get 4
      local.get 3
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 4
      i32.sub
      local.tee 2
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      local.tee 5
      i64.const 32
      i64.shl
      local.get 5
      i64.or
      local.set 5
      local.get 3
      local.get 4
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 5
        i64.store
        local.get 1
        i32.const 8
        i32.add
        local.get 5
        i64.store
        local.get 1
        i32.const 16
        i32.add
        local.get 5
        i64.store
        local.get 1
        i32.const 24
        i32.add
        local.get 5
        i64.store
        local.get 1
        i32.const 32
        i32.add
        local.set 1
        local.get 2
        i32.const -32
        i32.add
        local.tee 2
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;18;) (type 1) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load8_u offset=74
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store8 offset=74
    local.get 0
    i32.load
    local.tee 1
    i32.const 8
    i32.and
    i32.eqz
    if  ;; label = @1
      local.get 0
      i64.const 0
      i64.store offset=4 align=4
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
      return
    end
    local.get 0
    local.get 1
    i32.const 32
    i32.or
    i32.store
    i32.const -1)
  (func (;19;) (type 13) (param i32 i64 i64 i32)
    (local i32 i32 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 32
    i32.sub
    local.tee 4
    i32.store
    block  ;; label = @1
      local.get 2
      i64.const 48
      i64.shr_u
      i32.wrap_i64
      local.tee 6
      i32.const 32767
      i32.and
      local.tee 5
      i32.const 32767
      i32.eq
      br_if 0 (;@1;)
      block (result i32)  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.eqz
          if  ;; label = @4
            local.get 1
            local.get 2
            i64.const 0
            i64.const 0
            call 7
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            local.get 1
            local.get 2
            i64.const 0
            i64.const 4645181540655955968
            call 11
            local.get 4
            i32.const 16
            i32.add
            local.get 4
            i64.load
            local.get 4
            i32.const 8
            i32.add
            i64.load
            local.get 3
            call 19
            local.get 4
            i64.load offset=24
            local.set 2
            local.get 4
            i64.load offset=16
            local.set 1
            local.get 3
            i32.load
            i32.const -120
            i32.add
            br 2 (;@2;)
          end
          local.get 3
          local.get 6
          i32.const 32767
          i32.and
          i32.const -16382
          i32.add
          i32.store
          local.get 6
          i32.const 32768
          i32.and
          i32.const 16382
          i32.or
          i64.extend_i32_u
          i64.const 48
          i64.shl
          local.get 2
          i64.const 281474976710655
          i64.and
          i64.or
          local.set 2
          br 2 (;@1;)
        end
        i32.const 0
      end
      local.set 5
      local.get 3
      local.get 5
      i32.store
    end
    local.get 0
    local.get 1
    i64.store
    local.get 0
    local.get 2
    i64.store offset=8
    i32.const 1024
    local.get 4
    i32.const 32
    i32.add
    i32.store)
  (func (;20;) (type 3) (param i32 i32) (result i32)
    local.get 0
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.const 0
      call 46
      return
    end
    i32.const 0)
  (func (;21;) (type 8) (param i32 i32 i32)
    (local i32 i64)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 3
    i32.store
    block  ;; label = @1
      local.get 1
      i32.const 20
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      i32.const -9
      i32.add
      local.tee 1
      i32.const 9
      i32.gt_u
      br_if 0 (;@1;)
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
                          local.get 1
                          i32.const 1
                          i32.sub
                          br_table 1 (;@10;) 2 (;@9;) 3 (;@8;) 4 (;@7;) 5 (;@6;) 6 (;@5;) 7 (;@4;) 8 (;@3;) 9 (;@2;) 0 (;@11;)
                        end
                        local.get 2
                        local.get 2
                        i32.load
                        local.tee 1
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 0
                        local.get 1
                        i32.load
                        i32.store
                        br 9 (;@1;)
                      end
                      local.get 2
                      local.get 2
                      i32.load
                      local.tee 1
                      i32.const 4
                      i32.add
                      i32.store
                      local.get 0
                      local.get 1
                      i64.load32_s
                      i64.store
                      br 8 (;@1;)
                    end
                    local.get 2
                    local.get 2
                    i32.load
                    local.tee 1
                    i32.const 4
                    i32.add
                    i32.store
                    local.get 0
                    local.get 1
                    i64.load32_u
                    i64.store
                    br 7 (;@1;)
                  end
                  local.get 2
                  local.get 2
                  i32.load
                  i32.const 7
                  i32.add
                  i32.const -8
                  i32.and
                  local.tee 1
                  i32.const 8
                  i32.add
                  i32.store
                  local.get 0
                  local.get 1
                  i64.load
                  i64.store
                  br 6 (;@1;)
                end
                local.get 2
                local.get 2
                i32.load
                local.tee 1
                i32.const 4
                i32.add
                i32.store
                local.get 0
                local.get 1
                i64.load16_s
                i64.store
                br 5 (;@1;)
              end
              local.get 2
              local.get 2
              i32.load
              local.tee 1
              i32.const 4
              i32.add
              i32.store
              local.get 0
              local.get 1
              i64.load16_u
              i64.store
              br 4 (;@1;)
            end
            local.get 2
            local.get 2
            i32.load
            local.tee 1
            i32.const 4
            i32.add
            i32.store
            local.get 0
            local.get 1
            i64.load8_s
            i64.store
            br 3 (;@1;)
          end
          local.get 2
          local.get 2
          i32.load
          local.tee 1
          i32.const 4
          i32.add
          i32.store
          local.get 0
          local.get 1
          i64.load8_u
          i64.store
          br 2 (;@1;)
        end
        local.get 2
        local.get 2
        i32.load
        i32.const 7
        i32.add
        i32.const -8
        i32.and
        local.tee 1
        i32.const 8
        i32.add
        i32.store
        local.get 3
        local.get 1
        f64.load
        call 35
        local.get 0
        local.get 3
        i32.const 8
        i32.add
        i64.load
        i64.store offset=8
        local.get 0
        local.get 3
        i64.load
        i64.store
        br 1 (;@1;)
      end
      local.get 2
      local.get 2
      i32.load
      i32.const 15
      i32.add
      i32.const -16
      i32.and
      local.tee 1
      i32.const 16
      i32.add
      i32.store
      local.get 1
      i64.load
      local.set 4
      local.get 0
      local.get 1
      i64.load offset=8
      i64.store offset=8
      local.get 0
      local.get 4
      i64.store
    end
    i32.const 1024
    local.get 3
    i32.const 16
    i32.add
    i32.store)
  (func (;22;) (type 1) (param i32) (result i32)
    (local i32 i32 i32)
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
        local.get 0
        i32.load
        local.tee 1
        i32.load8_s
        local.set 3
        local.get 0
        local.get 1
        i32.const 1
        i32.add
        i32.store
        local.get 3
        local.get 2
        i32.const 10
        i32.mul
        i32.add
        i32.const -48
        i32.add
        local.set 2
        local.get 1
        i32.load8_s offset=1
        local.tee 1
        i32.const -48
        i32.add
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
      end
      local.get 2
      return
    end
    i32.const 0)
  (func (;23;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 288
    i32.sub
    local.tee 3
    i32.store
    local.get 3
    local.get 2
    i32.store offset=284
    local.get 3
    i32.const 240
    i32.add
    i32.const 0
    i32.const 40
    call 17
    drop
    local.get 3
    local.get 3
    i32.load offset=284
    i32.store offset=280
    i32.const -1
    local.set 2
    i32.const 0
    local.get 1
    local.get 3
    i32.const 280
    i32.add
    local.get 3
    i32.const 80
    i32.add
    local.get 3
    i32.const 240
    i32.add
    call 15
    i32.const -1
    i32.gt_s
    if  ;; label = @1
      local.get 0
      i32.load offset=76
      i32.const 0
      i32.ge_s
      if  ;; label = @2
        i32.const 0
        local.set 5
      end
      local.get 0
      i32.load
      local.set 2
      local.get 0
      i32.load8_s offset=74
      i32.const 0
      i32.le_s
      if  ;; label = @2
        local.get 0
        local.get 2
        i32.const -33
        i32.and
        i32.store
      end
      local.get 2
      i32.const 32
      i32.and
      local.set 6
      block (result i32)  ;; label = @2
        local.get 0
        i32.load offset=48
        if  ;; label = @3
          local.get 0
          local.get 1
          local.get 3
          i32.const 280
          i32.add
          local.get 3
          i32.const 80
          i32.add
          local.get 3
          i32.const 240
          i32.add
          call 15
          br 1 (;@2;)
        end
        local.get 0
        i32.const 48
        i32.add
        local.tee 2
        i32.const 80
        i32.store
        local.get 0
        local.get 3
        i32.const 80
        i32.add
        i32.store offset=16
        local.get 0
        local.get 3
        i32.store offset=28
        local.get 0
        local.get 3
        i32.store offset=20
        local.get 0
        i32.load offset=44
        local.set 4
        local.get 0
        local.get 3
        i32.store offset=44
        local.get 0
        local.get 1
        local.get 3
        i32.const 280
        i32.add
        local.get 3
        i32.const 80
        i32.add
        local.get 3
        i32.const 240
        i32.add
        call 15
        local.tee 1
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        drop
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=36
        call_indirect (type 0)
        drop
        local.get 0
        i32.const 44
        i32.add
        local.get 4
        i32.store
        local.get 2
        i32.const 0
        i32.store
        local.get 0
        i32.const 16
        i32.add
        i32.const 0
        i32.store
        local.get 0
        i32.const 28
        i32.add
        i32.const 0
        i32.store
        local.get 0
        i32.const 20
        i32.add
        local.tee 2
        i32.load
        local.set 4
        local.get 2
        i32.const 0
        i32.store
        local.get 1
        i32.const -1
        local.get 4
        select
      end
      local.set 1
      local.get 0
      local.get 0
      i32.load
      local.tee 2
      local.get 6
      i32.or
      i32.store
      local.get 2
      i32.const 32
      i32.and
      local.set 2
      i32.const -1
      local.get 1
      local.get 2
      select
      local.set 2
    end
    i32.const 1024
    local.get 3
    i32.const 288
    i32.add
    i32.store
    local.get 2)
  (func (;24;) (type 6) (param i64 i64) (result i32)
    (local i32 i64)
    local.get 1
    i64.const 281474976710655
    i64.and
    local.set 3
    block (result i32)  ;; label = @1
      local.get 1
      i64.const 48
      i64.shr_u
      i32.wrap_i64
      i32.const 32767
      i32.and
      local.tee 2
      i32.const 32767
      i32.ne
      if  ;; label = @2
        i32.const 4
        local.get 2
        br_if 1 (;@1;)
        drop
        i32.const 2
        i32.const 3
        local.get 3
        local.get 0
        i64.or
        i64.eqz
        select
        return
      end
      local.get 3
      local.get 0
      i64.or
      i64.eqz
    end)
  (func (;25;) (type 1) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load8_u
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.const 1
            i32.add
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.const 3
              i32.and
              i32.eqz
              br_if 1 (;@4;)
              local.get 1
              i32.load8_u
              local.set 3
              local.get 1
              i32.const 1
              i32.add
              local.tee 2
              local.set 1
              local.get 3
              br_if 0 (;@5;)
            end
            local.get 2
            i32.const -1
            i32.add
            local.set 2
            br 3 (;@1;)
          end
          local.get 1
          i32.const -4
          i32.add
          local.set 1
          loop  ;; label = @4
            local.get 1
            i32.const 4
            i32.add
            local.tee 1
            i32.load
            local.tee 2
            i32.const -1
            i32.xor
            local.get 2
            i32.const -16843009
            i32.add
            i32.and
            i32.const -2139062144
            i32.and
            i32.eqz
            br_if 0 (;@4;)
          end
          local.get 2
          i32.const 255
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          loop  ;; label = @4
            local.get 1
            i32.load8_u offset=1
            local.set 3
            local.get 1
            i32.const 1
            i32.add
            local.tee 2
            local.set 1
            local.get 3
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
          unreachable
        end
        local.get 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      local.set 2
    end
    local.get 2
    local.get 0
    i32.sub)
  (func (;26;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 32
    i32.sub
    local.tee 3
    i32.store
    local.get 0
    i32.const 1
    i32.store offset=36
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=60
      local.set 4
      local.get 3
      i32.const 21523
      i32.store offset=4
      local.get 3
      local.get 4
      i32.store
      local.get 3
      local.get 3
      i32.const 24
      i32.add
      i32.store offset=8
      i32.const 54
      local.get 3
      call 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 255
      i32.store8 offset=75
    end
    local.get 0
    local.get 1
    local.get 2
    call 16
    local.set 0
    i32.const 1024
    local.get 3
    i32.const 32
    i32.add
    i32.store
    local.get 0)
  (func (;27;) (type 5) (param i32)
    i32.const 1024
    local.get 0
    i32.store)
  (func (;28;) (type 1) (param i32) (result i32)
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
  (func (;29;) (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 32
    i32.sub
    local.tee 3
    i32.store
    local.get 0
    i32.load offset=60
    local.set 0
    local.get 3
    i32.const 16
    i32.add
    local.get 2
    i32.store
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 0
    i32.store
    local.get 3
    local.get 3
    i32.const 28
    i32.add
    i32.store offset=12
    block (result i32)  ;; label = @1
      block (result i32)  ;; label = @2
        i32.const 140
        local.get 3
        call 0
        local.tee 0
        i32.const -4095
        i32.ge_u
        if  ;; label = @3
          i32.const 1620
          i32.const 0
          local.get 0
          i32.sub
          i32.store
          i32.const -1
          local.set 0
        end
        local.get 0
        i32.const 0
        i32.ge_s
      end
      if  ;; label = @2
        local.get 3
        i32.load offset=28
        br 1 (;@1;)
      end
      local.get 3
      i32.const -1
      i32.store offset=28
      i32.const -1
    end
    local.set 1
    i32.const 1024
    local.get 3
    i32.const 32
    i32.add
    i32.store
    local.get 1)
  (func (;30;) (type 4)
    unreachable)
  (func (;31;) (type 17) (param i32 i32)
    (local i32 i64 i64)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 2
    i32.store
    block (result i64)  ;; label = @1
      local.get 1
      if  ;; label = @2
        local.get 2
        local.get 1
        i64.extend_i32_u
        i64.const 0
        i32.const 81
        i32.const 0
        local.get 1
        i32.clz
        local.tee 1
        i32.sub
        i32.sub
        call 6
        local.get 2
        i64.load
        local.set 3
        local.get 2
        i32.const 8
        i32.add
        i64.load
        i64.const 281474976710656
        i64.xor
        i32.const 16414
        local.get 1
        i32.sub
        i64.extend_i32_u
        i64.const 48
        i64.shl
        i64.add
        br 1 (;@1;)
      end
      i64.const 0
    end
    local.set 4
    local.get 0
    local.get 3
    i64.store
    local.get 0
    local.get 4
    i64.store offset=8
    i32.const 1024
    local.get 2
    i32.const 16
    i32.add
    i32.store)
  (func (;32;) (type 17) (param i32 i32)
    (local i32 i32 i32 i64 i64)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 2
    i32.store
    block (result i64)  ;; label = @1
      local.get 1
      if  ;; label = @2
        local.get 1
        local.get 1
        i32.const 31
        i32.shr_s
        local.tee 3
        i32.add
        local.get 3
        i32.xor
        local.tee 3
        i32.clz
        local.set 4
        local.get 2
        local.get 3
        i64.extend_i32_u
        i64.const 0
        i32.const 81
        i32.const 0
        local.get 4
        i32.sub
        i32.sub
        call 6
        local.get 2
        i64.load
        local.set 5
        local.get 2
        i32.const 8
        i32.add
        i64.load
        i64.const 281474976710656
        i64.xor
        i32.const 16414
        local.get 4
        i32.sub
        i64.extend_i32_u
        i64.const 48
        i64.shl
        i64.add
        local.get 1
        i32.const -2147483648
        i32.and
        i64.extend_i32_u
        i64.const 32
        i64.shl
        i64.or
        br 1 (;@1;)
      end
      i64.const 0
    end
    local.set 6
    local.get 0
    local.get 5
    i64.store
    local.get 0
    local.get 6
    i64.store offset=8
    i32.const 1024
    local.get 2
    i32.const 16
    i32.add
    i32.store)
  (func (;33;) (type 6) (param i64 i64) (result i32)
    (local i32 i32 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 2
    i32.store
    block  ;; label = @1
      local.get 1
      i64.const 0
      i64.lt_s
      br_if 0 (;@1;)
      local.get 1
      i64.const 48
      i64.shr_u
      i32.wrap_i64
      i32.const 32767
      i32.and
      local.tee 4
      i32.const 16383
      i32.lt_u
      br_if 0 (;@1;)
      i32.const -1
      local.set 3
      local.get 4
      i32.const -16383
      i32.add
      i32.const 31
      i32.gt_u
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      local.get 1
      i64.const 281474976710655
      i64.and
      i64.const 281474976710656
      i64.or
      i32.const 16495
      local.get 4
      i32.sub
      call 9
      local.get 2
      i32.load
      local.set 3
    end
    i32.const 1024
    local.get 2
    i32.const 16
    i32.add
    i32.store
    local.get 3)
  (func (;34;) (type 6) (param i64 i64) (result i32)
    (local i32 i32 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 3
    i32.store
    block (result i32)  ;; label = @1
      i32.const 0
      local.get 1
      i64.const 48
      i64.shr_u
      i32.wrap_i64
      i32.const 32767
      i32.and
      local.tee 4
      i32.const 16383
      i32.lt_u
      br_if 0 (;@1;)
      drop
      local.get 1
      i64.const 62
      i64.shr_u
      i32.wrap_i64
      i32.const -1
      i32.xor
      i32.const 2
      i32.and
      i32.const -1
      i32.add
      local.set 2
      i32.const 2147483647
      i32.const -2147483648
      local.get 2
      i32.const 1
      i32.eq
      select
      local.get 4
      i32.const -16383
      i32.add
      i32.const 32
      i32.ge_u
      br_if 0 (;@1;)
      drop
      local.get 3
      local.get 0
      local.get 1
      i64.const 281474976710655
      i64.and
      i64.const 281474976710656
      i64.or
      i32.const 16495
      local.get 4
      i32.sub
      call 9
      local.get 2
      local.get 3
      i32.load
      i32.mul
    end
    local.set 2
    i32.const 1024
    local.get 3
    i32.const 16
    i32.add
    i32.store
    local.get 2)
  (func (;35;) (type 16) (param i32 f64)
    (local i32 i32 i64 i64 i64 i64)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 2
    i32.store
    local.get 1
    i64.reinterpret_f64
    local.tee 5
    i64.const -9223372036854775808
    i64.and
    local.set 7
    block (result i64)  ;; label = @1
      local.get 5
      i64.const 9223372036854775807
      i64.and
      local.tee 4
      i64.const -4503599627370496
      i64.add
      i64.const 9214364837600034815
      i64.le_u
      if  ;; label = @2
        local.get 4
        i64.const 60
        i64.shl
        local.set 6
        local.get 4
        i64.const 4
        i64.shr_u
        i64.const 4323455642275676160
        i64.add
        br 1 (;@1;)
      end
      local.get 4
      i64.const 9218868437227405312
      i64.ge_u
      if  ;; label = @2
        local.get 5
        i64.const 60
        i64.shl
        local.set 6
        local.get 5
        i64.const 4
        i64.shr_u
        i64.const 9223090561878065152
        i64.or
        br 1 (;@1;)
      end
      block (result i32)  ;; label = @2
        block  ;; label = @3
          local.get 4
          i64.eqz
          i32.eqz
          if  ;; label = @4
            local.get 4
            i64.const 4294967296
            i64.ge_u
            br_if 1 (;@3;)
            local.get 5
            i32.wrap_i64
            i32.clz
            i32.const 32
            i32.add
            br 2 (;@2;)
          end
          i64.const 0
          br 2 (;@1;)
        end
        local.get 4
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        i32.clz
      end
      local.set 3
      local.get 2
      local.get 4
      i64.const 0
      local.get 3
      i32.const 49
      i32.add
      call 6
      local.get 2
      i64.load
      local.set 6
      local.get 2
      i32.const 8
      i32.add
      i64.load
      i64.const 281474976710656
      i64.xor
      i32.const 15372
      local.get 3
      i32.sub
      i64.extend_i32_u
      i64.const 48
      i64.shl
      i64.or
    end
    local.set 4
    local.get 0
    local.get 6
    i64.store
    local.get 0
    local.get 4
    local.get 7
    i64.or
    i64.store offset=8
    i32.const 1024
    local.get 2
    i32.const 16
    i32.add
    i32.store)
  (func (;36;) (type 15) (param i64 i64 i64 i64) (result i32)
    local.get 0
    i64.const 0
    i64.ne
    local.get 1
    i64.const 9223372036854775807
    i64.and
    local.tee 1
    i64.const 9223090561878065152
    i64.gt_u
    local.get 1
    i64.const 9223090561878065152
    i64.eq
    select
    local.get 2
    i64.const 0
    i64.ne
    local.get 3
    i64.const 9223372036854775807
    i64.and
    local.tee 3
    i64.const 9223090561878065152
    i64.gt_u
    local.get 3
    i64.const 9223090561878065152
    i64.eq
    select
    i32.or)
  (func (;37;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.set 3
            block  ;; label = @5
              loop  ;; label = @6
                local.get 3
                local.get 1
                i32.load8_u
                i32.store8
                local.get 2
                i32.const -1
                i32.add
                local.set 4
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                local.get 2
                i32.const 1
                i32.eq
                br_if 1 (;@5;)
                local.get 4
                local.set 2
                local.get 1
                i32.const 3
                i32.and
                br_if 0 (;@6;)
              end
            end
            local.get 3
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 2
          local.set 4
          local.get 0
          local.tee 3
          i32.const 3
          i32.and
          br_if 1 (;@2;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 16
          i32.ge_u
          if  ;; label = @4
            local.get 3
            local.get 4
            i32.const -16
            i32.add
            local.tee 6
            i32.const -16
            i32.and
            local.tee 7
            i32.const 16
            i32.add
            local.tee 8
            i32.add
            local.set 5
            local.get 1
            local.set 2
            loop  ;; label = @5
              local.get 3
              local.get 2
              i32.load
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.get 2
              i32.const 4
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 8
              i32.add
              local.get 2
              i32.const 8
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 12
              i32.add
              local.get 2
              i32.const 12
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 16
              i32.add
              local.set 3
              local.get 2
              i32.const 16
              i32.add
              local.set 2
              local.get 4
              i32.const -16
              i32.add
              local.tee 4
              i32.const 15
              i32.gt_u
              br_if 0 (;@5;)
            end
            local.get 6
            local.get 7
            i32.sub
            local.set 4
            local.get 1
            local.get 8
            i32.add
            local.set 1
            br 1 (;@3;)
          end
          local.get 3
          local.set 5
        end
        local.get 4
        i32.const 8
        i32.and
        if  ;; label = @3
          local.get 5
          local.get 1
          i32.load
          i32.store
          local.get 5
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 5
          i32.const 8
          i32.add
          local.set 5
        end
        local.get 4
        i32.const 4
        i32.and
        if  ;; label = @3
          local.get 5
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 4
          i32.add
          local.set 5
        end
        local.get 4
        i32.const 2
        i32.and
        if  ;; label = @3
          local.get 5
          local.get 1
          i32.load8_u
          i32.store8
          local.get 5
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 5
          i32.const 2
          i32.add
          local.set 5
          local.get 1
          i32.const 2
          i32.add
          local.set 1
        end
        local.get 4
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 5
        local.get 1
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        local.get 4
        i32.const 32
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.const 3
          i32.and
          local.tee 2
          i32.const 3
          i32.ne
          if  ;; label = @4
            local.get 2
            i32.const 2
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 1
            i32.ne
            br_if 2 (;@2;)
            local.get 3
            local.get 1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 3
            local.get 1
            i32.load
            local.tee 6
            i32.store8
            local.get 3
            local.get 1
            i32.load8_u offset=2
            i32.store8 offset=2
            local.get 1
            i32.const 16
            i32.add
            local.set 2
            local.get 4
            i32.const -19
            i32.add
            local.set 9
            local.get 4
            i32.const -3
            i32.add
            local.set 7
            local.get 3
            i32.const 3
            i32.add
            local.set 5
            local.get 1
            local.get 4
            i32.const -20
            i32.add
            i32.const -16
            i32.and
            local.tee 8
            i32.const 19
            i32.add
            local.tee 10
            i32.add
            local.set 1
            loop  ;; label = @5
              local.get 5
              local.get 2
              i32.const -12
              i32.add
              i32.load
              local.tee 4
              i32.const 8
              i32.shl
              local.get 6
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 5
              i32.const 4
              i32.add
              local.get 2
              i32.const -8
              i32.add
              i32.load
              local.tee 6
              i32.const 8
              i32.shl
              local.get 4
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 5
              i32.const 8
              i32.add
              local.get 2
              i32.const -4
              i32.add
              i32.load
              local.tee 4
              i32.const 8
              i32.shl
              local.get 6
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 5
              i32.const 12
              i32.add
              local.get 2
              i32.load
              local.tee 6
              i32.const 8
              i32.shl
              local.get 4
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 5
              i32.const 16
              i32.add
              local.set 5
              local.get 2
              i32.const 16
              i32.add
              local.set 2
              local.get 7
              i32.const -16
              i32.add
              local.tee 7
              i32.const 16
              i32.gt_u
              br_if 0 (;@5;)
            end
            local.get 9
            local.get 8
            i32.sub
            local.set 4
            local.get 3
            local.get 10
            i32.add
            local.set 3
            br 2 (;@2;)
          end
          local.get 3
          local.get 1
          i32.load
          local.tee 6
          i32.store8
          local.get 1
          i32.const 16
          i32.add
          local.set 2
          local.get 4
          i32.const -17
          i32.add
          local.set 9
          local.get 4
          i32.const -1
          i32.add
          local.set 7
          local.get 3
          i32.const 1
          i32.add
          local.set 5
          local.get 1
          local.get 4
          i32.const -20
          i32.add
          i32.const -16
          i32.and
          local.tee 8
          i32.const 17
          i32.add
          local.tee 10
          i32.add
          local.set 1
          loop  ;; label = @4
            local.get 5
            local.get 2
            i32.const -12
            i32.add
            i32.load
            local.tee 4
            i32.const 24
            i32.shl
            local.get 6
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 5
            i32.const 4
            i32.add
            local.get 2
            i32.const -8
            i32.add
            i32.load
            local.tee 6
            i32.const 24
            i32.shl
            local.get 4
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 5
            i32.const 8
            i32.add
            local.get 2
            i32.const -4
            i32.add
            i32.load
            local.tee 4
            i32.const 24
            i32.shl
            local.get 6
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 5
            i32.const 12
            i32.add
            local.get 2
            i32.load
            local.tee 6
            i32.const 24
            i32.shl
            local.get 4
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 5
            i32.const 16
            i32.add
            local.set 5
            local.get 2
            i32.const 16
            i32.add
            local.set 2
            local.get 7
            i32.const -16
            i32.add
            local.tee 7
            i32.const 18
            i32.gt_u
            br_if 0 (;@4;)
          end
          local.get 9
          local.get 8
          i32.sub
          local.set 4
          local.get 3
          local.get 10
          i32.add
          local.set 3
          br 1 (;@2;)
        end
        local.get 3
        local.get 1
        i32.load
        local.tee 6
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 1
        i32.const 16
        i32.add
        local.set 2
        local.get 4
        i32.const -18
        i32.add
        local.set 9
        local.get 4
        i32.const -2
        i32.add
        local.set 7
        local.get 3
        i32.const 2
        i32.add
        local.set 5
        local.get 1
        local.get 4
        i32.const -20
        i32.add
        i32.const -16
        i32.and
        local.tee 8
        i32.const 18
        i32.add
        local.tee 10
        i32.add
        local.set 1
        loop  ;; label = @3
          local.get 5
          local.get 2
          i32.const -12
          i32.add
          i32.load
          local.tee 4
          i32.const 16
          i32.shl
          local.get 6
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 5
          i32.const 4
          i32.add
          local.get 2
          i32.const -8
          i32.add
          i32.load
          local.tee 6
          i32.const 16
          i32.shl
          local.get 4
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 5
          i32.const 8
          i32.add
          local.get 2
          i32.const -4
          i32.add
          i32.load
          local.tee 4
          i32.const 16
          i32.shl
          local.get 6
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 5
          i32.const 12
          i32.add
          local.get 2
          i32.load
          local.tee 6
          i32.const 16
          i32.shl
          local.get 4
          i32.const 16
          i32.shr_u
          i32.or
          i32.store
          local.get 5
          i32.const 16
          i32.add
          local.set 5
          local.get 2
          i32.const 16
          i32.add
          local.set 2
          local.get 7
          i32.const -16
          i32.add
          local.tee 7
          i32.const 17
          i32.gt_u
          br_if 0 (;@3;)
        end
        local.get 9
        local.get 8
        i32.sub
        local.set 4
        local.get 3
        local.get 10
        i32.add
        local.set 3
      end
      local.get 4
      i32.const 16
      i32.and
      if  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        local.get 1
        i32.load8_u offset=8
        i32.store8 offset=8
        local.get 3
        local.get 1
        i32.load8_u offset=9
        i32.store8 offset=9
        local.get 3
        local.get 1
        i32.load8_u offset=10
        i32.store8 offset=10
        local.get 3
        local.get 1
        i32.load8_u offset=11
        i32.store8 offset=11
        local.get 3
        local.get 1
        i32.load8_u offset=12
        i32.store8 offset=12
        local.get 3
        local.get 1
        i32.load8_u offset=13
        i32.store8 offset=13
        local.get 3
        local.get 1
        i32.load8_u offset=14
        i32.store8 offset=14
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=15
        i32.store8 offset=15
        local.get 3
        i32.const 16
        i32.add
        local.set 3
        local.get 1
        i32.const 16
        i32.add
        local.set 1
      end
      local.get 4
      i32.const 8
      i32.and
      if  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        local.get 1
        i32.const 8
        i32.add
        local.set 1
      end
      local.get 4
      i32.const 4
      i32.and
      if  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      local.get 4
      i32.const 2
      i32.and
      if  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        i32.const 2
        i32.add
        local.set 3
        local.get 1
        i32.const 2
        i32.add
        local.set 1
      end
      local.get 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func (;38;) (type 3) (param i32 i32) (result i32)
    (local i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 2
    i32.store
    local.get 2
    local.get 1
    i32.store offset=12
    i32.const 1624
    i32.load
    local.get 0
    local.get 1
    call 23
    local.set 1
    i32.const 1024
    local.get 2
    i32.const 16
    i32.add
    i32.store
    local.get 1)
  (func (;39;) (type 1) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 1624
    i32.load
    local.tee 1
    i32.load offset=76
    i32.const 0
    i32.ge_s
    if  ;; label = @1
      i32.const 0
      local.set 2
    end
    block  ;; label = @1
      block  ;; label = @2
        i32.const -1
        i32.const 0
        local.get 0
        call 25
        local.tee 3
        local.get 0
        i32.const 1
        local.get 3
        local.get 1
        call 42
        i32.ne
        select
        i32.const 0
        i32.ge_s
        if  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load8_u offset=75
            i32.const 10
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=20
            local.tee 0
            local.get 1
            i32.load offset=16
            i32.ge_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 20
            i32.add
            local.get 0
            i32.const 1
            i32.add
            i32.store
            local.get 0
            i32.const 10
            i32.store8
            i32.const 0
            local.set 0
            br 3 (;@1;)
          end
          local.get 1
          i32.const 10
          call 40
          i32.const 31
          i32.shr_s
          local.set 0
          br 2 (;@1;)
        end
        i32.const -1
        local.set 0
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
      end
    end
    local.get 0)
  (func (;40;) (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 3
    i32.store
    local.get 3
    local.get 1
    i32.store8 offset=15
    block  ;; label = @1
      local.get 0
      i32.load offset=16
      local.tee 2
      i32.eqz
      if  ;; label = @2
        i32.const -1
        local.set 2
        local.get 0
        call 18
        br_if 1 (;@1;)
        local.get 0
        i32.const 16
        i32.add
        i32.load
        local.set 2
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.tee 4
        local.get 2
        i32.lt_u
        if  ;; label = @3
          local.get 1
          i32.const 255
          i32.and
          local.tee 2
          local.get 0
          i32.load8_s offset=75
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const -1
        local.set 2
        local.get 0
        local.get 3
        i32.const 15
        i32.add
        i32.const 1
        local.get 0
        i32.load offset=36
        call_indirect (type 0)
        i32.const 1
        i32.ne
        br_if 1 (;@1;)
        local.get 3
        i32.load8_u offset=15
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      i32.const 20
      i32.add
      local.get 4
      i32.const 1
      i32.add
      i32.store
      local.get 4
      local.get 1
      i32.store8
    end
    i32.const 1024
    local.get 3
    i32.const 16
    i32.add
    i32.store
    local.get 2)
  (func (;41;) (type 1) (param i32) (result i32)
    (local i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 1
    i32.store
    local.get 1
    local.get 0
    i32.load offset=60
    i32.store
    i32.const 6
    local.get 1
    call 3
    local.tee 0
    i32.const -4095
    i32.ge_u
    if  ;; label = @1
      i32.const 1620
      i32.const 0
      local.get 0
      i32.sub
      i32.store
      i32.const -1
      local.set 0
    end
    local.get 0
    local.set 0
    i32.const 1024
    local.get 1
    i32.const 16
    i32.add
    i32.store
    local.get 0)
  (func (;42;) (type 14) (param i32 i32 i32 i32) (result i32)
    (local i32)
    local.get 2
    local.get 1
    i32.mul
    local.set 4
    block  ;; label = @1
      local.get 3
      i32.load offset=76
      i32.const -1
      i32.gt_s
      if  ;; label = @2
        local.get 0
        local.get 4
        local.get 3
        call 14
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      local.get 4
      local.get 3
      call 14
      local.set 0
    end
    local.get 0
    local.get 4
    i32.eq
    if  ;; label = @1
      local.get 2
      i32.const 0
      local.get 1
      select
      return
    end
    local.get 0
    local.get 1
    i32.div_u)
  (func (;43;) (type 3) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 1
    i32.load8_u
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load8_u
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 2
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.load8_u
        local.set 2
        local.get 0
        i32.load8_u
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        local.get 2
        i32.eq
        br_if 0 (;@2;)
      end
    end
    local.get 3
    local.get 2
    i32.sub)
  (func (;44;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load
    i32.const 1794895138
    i32.add
    local.tee 4
    call 8
    local.set 5
    local.get 0
    i32.load offset=12
    local.get 4
    call 8
    local.set 3
    local.get 0
    i32.load offset=16
    local.get 4
    call 8
    local.set 6
    block  ;; label = @1
      local.get 5
      local.get 1
      i32.const 2
      i32.shr_u
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      local.get 5
      i32.const 2
      i32.shl
      i32.sub
      local.tee 7
      i32.ge_u
      br_if 0 (;@1;)
      local.get 6
      local.get 7
      i32.ge_u
      br_if 0 (;@1;)
      local.get 6
      local.get 3
      i32.or
      i32.const 3
      i32.and
      br_if 0 (;@1;)
      local.get 6
      i32.const 2
      i32.shr_u
      local.set 10
      local.get 3
      i32.const 2
      i32.shr_u
      local.set 11
      loop  ;; label = @2
        local.get 0
        local.get 8
        local.get 5
        i32.const 1
        i32.shr_u
        local.tee 6
        i32.add
        local.tee 12
        i32.const 1
        i32.shl
        local.tee 13
        local.get 11
        i32.add
        i32.const 2
        i32.shl
        i32.add
        local.tee 3
        i32.load
        local.get 4
        call 8
        local.set 7
        local.get 3
        i32.const 4
        i32.add
        i32.load
        local.get 4
        call 8
        local.tee 3
        local.get 1
        i32.ge_u
        br_if 1 (;@1;)
        local.get 7
        local.get 1
        local.get 3
        i32.sub
        i32.ge_u
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        local.get 7
        i32.add
        i32.add
        i32.load8_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        local.get 3
        i32.add
        call 43
        local.tee 3
        if  ;; label = @3
          local.get 5
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          local.get 6
          local.get 5
          local.get 6
          i32.sub
          local.get 3
          i32.const 0
          i32.lt_s
          local.tee 3
          select
          local.set 5
          local.get 8
          local.get 12
          local.get 3
          select
          local.set 8
          br 1 (;@2;)
        end
      end
      local.get 0
      local.get 13
      local.get 10
      i32.add
      i32.const 2
      i32.shl
      i32.add
      local.tee 5
      i32.load
      local.get 4
      call 8
      local.set 3
      local.get 5
      i32.const 4
      i32.add
      i32.load
      local.get 4
      call 8
      local.tee 4
      local.get 1
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      local.get 4
      i32.sub
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 0
      local.get 4
      i32.add
      local.get 0
      local.get 4
      local.get 3
      i32.add
      i32.add
      i32.load8_u
      select
      return
    end
    i32.const 0)
  (func (;45;) (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              local.get 2
              i32.const 3664
              i32.add
              i32.load8_u
              local.get 0
              i32.eq
              br_if 1 (;@4;)
              i32.const 87
              local.set 3
              local.get 2
              i32.const 1
              i32.add
              local.tee 2
              i32.const 87
              i32.ne
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
            unreachable
          end
          local.get 2
          local.tee 3
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 3760
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.load8_u
          local.set 4
          local.get 2
          i32.const 1
          i32.add
          local.tee 0
          local.set 2
          local.get 4
          br_if 0 (;@3;)
          local.get 0
          local.set 2
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
        unreachable
      end
      i32.const 3760
      local.set 0
    end
    block (result i32)  ;; label = @1
      local.get 1
      i32.load offset=20
      local.tee 1
      if  ;; label = @2
        local.get 1
        i32.load
        local.get 1
        i32.load offset=4
        local.get 0
        call 44
        br 1 (;@1;)
      end
      i32.const 0
    end
    local.tee 1
    local.get 0
    local.get 1
    select)
  (func (;46;) (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 0
      if  ;; label = @2
        local.get 1
        i32.const 127
        i32.le_u
        br_if 1 (;@1;)
        block  ;; label = @3
          block  ;; label = @4
            i32.const 3412
            i32.load offset=188
            i32.load
            if  ;; label = @5
              local.get 1
              i32.const 2047
              i32.gt_u
              br_if 1 (;@4;)
              local.get 0
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=1
              local.get 0
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 192
              i32.or
              i32.store8
              i32.const 2
              return
            end
            local.get 1
            i32.const -128
            i32.and
            i32.const 57216
            i32.eq
            br_if 3 (;@1;)
            br 1 (;@3;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.const 55296
              i32.lt_u
              br_if 0 (;@5;)
              local.get 1
              i32.const -8192
              i32.and
              i32.const 57344
              i32.eq
              br_if 0 (;@5;)
              local.get 1
              i32.const -65536
              i32.add
              i32.const 1048575
              i32.gt_u
              br_if 1 (;@4;)
              local.get 0
              local.get 1
              i32.const 18
              i32.shr_u
              i32.const 240
              i32.or
              i32.store8
              local.get 0
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=3
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
              i32.const 4
              return
            end
            local.get 0
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8
            local.get 0
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=2
            local.get 0
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=1
            i32.const 3
            return
          end
        end
        i32.const 1620
        i32.const 84
        i32.store
        i32.const -1
        local.set 3
      end
      local.get 3
      return
    end
    local.get 0
    local.get 1
    i32.store8
    i32.const 1)
  (func (;47;) (type 12) (param i32 i64 i64 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 7680
    i32.sub
    local.tee 8
    i32.store
    local.get 8
    i32.const 0
    i32.store offset=300
    block (result i32)  ;; label = @1
      local.get 2
      local.tee 24
      i64.const 63
      i64.shr_u
      i32.wrap_i64
      if  ;; label = @2
        local.get 2
        i64.const -9223372036854775808
        i64.xor
        local.set 2
        i32.const 1
        local.set 19
        i32.const 3296
        br 1 (;@1;)
      end
      local.get 5
      i32.const 2048
      i32.and
      i32.eqz
      if  ;; label = @2
        i32.const 3302
        i32.const 3297
        local.get 5
        i32.const 1
        i32.and
        local.tee 19
        select
        br 1 (;@1;)
      end
      i32.const 1
      local.set 19
      i32.const 3299
    end
    local.set 20
    block  ;; label = @1
      block  ;; label = @2
        block (result i32)  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  local.get 2
                  call 24
                  i32.const 1
                  i32.gt_s
                  if  ;; label = @8
                    local.get 8
                    i32.const 224
                    i32.add
                    local.get 1
                    local.get 2
                    local.get 8
                    i32.const 300
                    i32.add
                    call 19
                    local.get 8
                    i32.const 208
                    i32.add
                    local.get 8
                    i64.load offset=224
                    local.tee 1
                    local.get 8
                    i64.load offset=232
                    local.tee 2
                    local.get 1
                    local.get 2
                    call 12
                    local.get 8
                    i64.load offset=208
                    local.tee 1
                    local.get 8
                    i32.const 216
                    i32.add
                    i64.load
                    local.tee 2
                    i64.const 0
                    i64.const 0
                    call 7
                    if  ;; label = @9
                      local.get 8
                      local.get 8
                      i32.load offset=300
                      i32.const -1
                      i32.add
                      i32.store offset=300
                    end
                    local.get 8
                    i32.const 256
                    i32.add
                    local.set 18
                    local.get 6
                    i32.const 32
                    i32.or
                    local.tee 21
                    i32.const 97
                    i32.ne
                    br_if 1 (;@7;)
                    local.get 20
                    i32.const 9
                    i32.add
                    local.get 20
                    local.get 6
                    i32.const 32
                    i32.and
                    local.tee 11
                    select
                    local.set 13
                    local.get 4
                    i32.const 26
                    i32.gt_u
                    br_if 3 (;@5;)
                    i32.const 27
                    local.get 4
                    i32.sub
                    i32.eqz
                    br_if 3 (;@5;)
                    local.get 4
                    i32.const -27
                    i32.add
                    local.set 7
                    i64.const 4612248968380809216
                    local.set 24
                    local.get 8
                    i32.const 120
                    i32.add
                    local.set 9
                    loop  ;; label = @9
                      local.get 8
                      i32.const 112
                      i32.add
                      local.get 25
                      local.get 24
                      i64.const 0
                      i64.const 4612530443357519872
                      call 11
                      local.get 9
                      i64.load
                      local.set 24
                      local.get 8
                      i64.load offset=112
                      local.set 25
                      local.get 7
                      i32.const 1
                      i32.add
                      local.tee 7
                      br_if 0 (;@9;)
                    end
                    local.get 13
                    i32.load8_u
                    i32.const 45
                    i32.ne
                    br_if 2 (;@6;)
                    local.get 8
                    i32.const -64
                    i32.sub
                    local.get 1
                    local.get 2
                    i64.const -9223372036854775808
                    i64.xor
                    local.get 25
                    local.get 24
                    call 13
                    local.get 8
                    i32.const 48
                    i32.add
                    local.get 25
                    local.get 24
                    local.get 8
                    i64.load offset=64
                    local.get 8
                    i32.const 72
                    i32.add
                    i64.load
                    call 12
                    local.get 8
                    i32.const 56
                    i32.add
                    i64.load
                    i64.const -9223372036854775808
                    i64.xor
                    local.set 2
                    local.get 8
                    i64.load offset=48
                    local.set 1
                    br 3 (;@5;)
                  end
                  local.get 0
                  i32.const 32
                  local.get 3
                  local.get 19
                  i32.const 3
                  i32.add
                  local.tee 4
                  local.get 5
                  i32.const -65537
                  i32.and
                  call 5
                  local.get 0
                  local.get 20
                  local.get 19
                  call 4
                  local.get 0
                  i32.const 3360
                  i32.const 3376
                  local.get 6
                  i32.const 5
                  i32.shr_u
                  i32.const 1
                  i32.and
                  local.tee 7
                  select
                  i32.const 3328
                  i32.const 3344
                  local.get 7
                  select
                  local.get 1
                  local.get 2
                  local.get 1
                  local.get 2
                  call 36
                  select
                  i32.const 3
                  call 4
                  br 6 (;@1;)
                end
                local.get 4
                i32.const 0
                i32.lt_s
                local.set 7
                block  ;; label = @7
                  local.get 1
                  local.get 2
                  i64.const 0
                  i64.const 0
                  call 7
                  if  ;; label = @8
                    local.get 8
                    i32.const 192
                    i32.add
                    local.get 1
                    local.get 2
                    i64.const 0
                    i64.const 4619285842798575616
                    call 11
                    local.get 8
                    local.get 8
                    i32.load offset=300
                    i32.const -28
                    i32.add
                    local.tee 10
                    i32.store offset=300
                    local.get 8
                    i32.const 200
                    i32.add
                    i64.load
                    local.set 2
                    local.get 8
                    i64.load offset=192
                    local.set 1
                    br 1 (;@7;)
                  end
                  local.get 8
                  i32.load offset=300
                  local.set 10
                end
                i32.const 6
                local.get 4
                local.get 7
                select
                local.set 13
                local.get 8
                i32.const 304
                i32.add
                local.get 8
                i32.const 7216
                i32.add
                local.get 10
                i32.const 0
                i32.lt_s
                select
                local.tee 16
                local.set 9
                loop  ;; label = @7
                  local.get 8
                  i32.const 176
                  i32.add
                  local.get 1
                  local.get 2
                  call 33
                  local.tee 7
                  call 31
                  local.get 8
                  i32.const 160
                  i32.add
                  local.get 1
                  local.get 2
                  local.get 8
                  i64.load offset=176
                  local.get 8
                  i32.const 184
                  i32.add
                  i64.load
                  call 13
                  local.get 8
                  i32.const 144
                  i32.add
                  local.get 8
                  i64.load offset=160
                  local.get 8
                  i32.const 168
                  i32.add
                  i64.load
                  i64.const 0
                  i64.const 4619810130798575616
                  call 11
                  local.get 9
                  local.get 7
                  i32.store
                  local.get 9
                  i32.const 4
                  i32.add
                  local.set 9
                  local.get 8
                  i64.load offset=144
                  local.tee 1
                  local.get 8
                  i32.const 152
                  i32.add
                  i64.load
                  local.tee 2
                  i64.const 0
                  i64.const 0
                  call 7
                  br_if 0 (;@7;)
                end
                block  ;; label = @7
                  local.get 10
                  i32.const 1
                  i32.ge_s
                  if  ;; label = @8
                    local.get 16
                    local.set 11
                    loop  ;; label = @9
                      local.get 10
                      i32.const 29
                      local.get 10
                      i32.const 29
                      i32.lt_s
                      select
                      local.set 10
                      block  ;; label = @10
                        local.get 9
                        i32.const -4
                        i32.add
                        local.tee 7
                        local.get 11
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 10
                        i64.extend_i32_u
                        local.set 24
                        i64.const 0
                        local.set 2
                        loop  ;; label = @11
                          local.get 7
                          i64.load32_u
                          local.get 24
                          i64.shl
                          local.get 2
                          i64.const 4294967295
                          i64.and
                          i64.add
                          local.tee 1
                          i64.const 1000000000
                          i64.div_u
                          local.set 2
                          local.get 7
                          local.get 1
                          local.get 2
                          i64.const 1000000000
                          i64.mul
                          i64.sub
                          i64.store32
                          local.get 7
                          i32.const -4
                          i32.add
                          local.tee 7
                          local.get 11
                          i32.ge_u
                          br_if 0 (;@11;)
                        end
                        local.get 2
                        i32.wrap_i64
                        local.tee 7
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 11
                        i32.const -4
                        i32.add
                        local.tee 11
                        local.get 7
                        i32.store
                      end
                      block  ;; label = @10
                        loop  ;; label = @11
                          local.get 9
                          local.tee 7
                          local.get 11
                          i32.le_u
                          br_if 1 (;@10;)
                          local.get 7
                          i32.const -4
                          i32.add
                          local.tee 9
                          i32.load
                          i32.eqz
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 8
                      local.get 8
                      i32.load offset=300
                      local.get 10
                      i32.sub
                      local.tee 10
                      i32.store offset=300
                      local.get 7
                      local.set 9
                      local.get 10
                      i32.const 0
                      i32.gt_s
                      br_if 0 (;@9;)
                      br 2 (;@7;)
                    end
                    unreachable
                  end
                  local.get 9
                  local.set 7
                  local.get 16
                  local.set 11
                end
                local.get 10
                i32.const -1
                i32.le_s
                if  ;; label = @7
                  local.get 13
                  i32.const 45
                  i32.add
                  i32.const 9
                  i32.div_s
                  i32.const 1
                  i32.add
                  local.set 17
                  local.get 21
                  i32.const 102
                  i32.eq
                  local.set 22
                  loop  ;; label = @8
                    i32.const 0
                    local.get 10
                    i32.sub
                    local.tee 9
                    i32.const 9
                    local.get 9
                    i32.const 9
                    i32.lt_s
                    select
                    local.set 4
                    block  ;; label = @9
                      local.get 11
                      local.get 7
                      i32.lt_u
                      if  ;; label = @10
                        i32.const 1000000000
                        local.get 4
                        i32.shr_u
                        local.set 14
                        i32.const 1
                        local.get 4
                        i32.shl
                        i32.const -1
                        i32.add
                        local.set 15
                        i32.const 0
                        local.set 12
                        local.get 11
                        local.set 9
                        loop  ;; label = @11
                          local.get 9
                          local.get 9
                          i32.load
                          local.tee 10
                          local.get 4
                          i32.shr_u
                          local.get 12
                          i32.add
                          i32.store
                          local.get 10
                          local.get 15
                          i32.and
                          local.get 14
                          i32.mul
                          local.set 12
                          local.get 9
                          i32.const 4
                          i32.add
                          local.tee 9
                          local.get 7
                          i32.lt_u
                          br_if 0 (;@11;)
                        end
                        local.get 11
                        local.get 11
                        i32.const 4
                        i32.add
                        local.get 11
                        i32.load
                        select
                        local.set 11
                        local.get 12
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 7
                        local.get 12
                        i32.store
                        local.get 7
                        i32.const 4
                        i32.add
                        local.set 7
                        br 1 (;@9;)
                      end
                      local.get 11
                      local.get 11
                      i32.const 4
                      i32.add
                      local.get 11
                      i32.load
                      select
                      local.set 11
                    end
                    local.get 8
                    local.get 8
                    i32.load offset=300
                    local.get 4
                    i32.add
                    local.tee 10
                    i32.store offset=300
                    local.get 16
                    local.get 11
                    local.get 22
                    select
                    local.tee 9
                    local.get 17
                    i32.const 2
                    i32.shl
                    i32.add
                    local.get 7
                    local.get 7
                    local.get 9
                    i32.sub
                    i32.const 2
                    i32.shr_s
                    local.get 17
                    i32.gt_s
                    select
                    local.set 7
                    local.get 10
                    i32.const 0
                    i32.lt_s
                    br_if 0 (;@8;)
                  end
                end
                i32.const 0
                local.set 9
                block  ;; label = @7
                  local.get 11
                  local.get 7
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 16
                  local.get 11
                  i32.sub
                  i32.const 2
                  i32.shr_s
                  i32.const 9
                  i32.mul
                  local.set 9
                  local.get 11
                  i32.load
                  local.tee 12
                  i32.const 10
                  i32.lt_u
                  br_if 0 (;@7;)
                  i32.const 10
                  local.set 10
                  loop  ;; label = @8
                    local.get 9
                    i32.const 1
                    i32.add
                    local.set 9
                    local.get 12
                    local.get 10
                    i32.const 10
                    i32.mul
                    local.tee 10
                    i32.ge_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 13
                i32.const 0
                local.get 9
                local.get 21
                i32.const 102
                i32.eq
                select
                local.tee 15
                i32.sub
                local.get 13
                i32.const 0
                i32.ne
                local.get 21
                i32.const 103
                i32.eq
                i32.and
                local.tee 14
                i32.sub
                local.tee 10
                local.get 7
                local.get 16
                i32.sub
                i32.const 2
                i32.shr_s
                i32.const 9
                i32.mul
                i32.const -9
                i32.add
                i32.lt_s
                if  ;; label = @7
                  local.get 10
                  i32.const 147456
                  i32.add
                  local.tee 10
                  i32.const 9
                  i32.div_s
                  local.tee 12
                  i32.const 9
                  i32.mul
                  local.set 17
                  local.get 16
                  local.get 12
                  i32.const -16384
                  i32.add
                  local.tee 22
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.const 4
                  i32.add
                  local.set 4
                  i32.const 10
                  local.set 12
                  local.get 10
                  local.get 17
                  i32.sub
                  i32.const 7
                  i32.le_s
                  if  ;; label = @8
                    local.get 13
                    local.get 14
                    i32.sub
                    i32.const 147455
                    i32.add
                    local.get 15
                    i32.sub
                    local.get 17
                    i32.sub
                    local.set 10
                    loop  ;; label = @9
                      local.get 12
                      i32.const 10
                      i32.mul
                      local.set 12
                      local.get 10
                      i32.const 1
                      i32.add
                      local.tee 10
                      i32.const 7
                      i32.lt_s
                      br_if 0 (;@9;)
                    end
                  end
                  local.get 4
                  i32.load
                  local.tee 10
                  local.get 12
                  i32.div_u
                  local.set 15
                  local.get 10
                  local.get 15
                  local.get 12
                  i32.mul
                  i32.sub
                  local.set 14
                  block  ;; label = @8
                    local.get 4
                    i32.const 4
                    i32.add
                    local.tee 17
                    local.get 7
                    i32.eq
                    if  ;; label = @9
                      local.get 14
                      i32.eqz
                      br_if 1 (;@8;)
                    end
                    local.get 15
                    i32.const 1
                    i32.and
                    local.set 15
                    i64.const 4611123068473966592
                    local.set 1
                    local.get 14
                    local.get 12
                    i32.const 1
                    i32.shr_u
                    local.tee 23
                    i32.ge_u
                    if  ;; label = @9
                      i64.const 4611404543450677248
                      i64.const 4611545280939032576
                      local.get 14
                      local.get 23
                      i32.eq
                      select
                      i64.const 4611545280939032576
                      local.get 17
                      local.get 7
                      i32.eq
                      select
                      local.set 1
                    end
                    local.get 15
                    i64.extend_i32_u
                    local.set 24
                    i64.const 4643211215818981376
                    local.set 2
                    block  ;; label = @9
                      local.get 19
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 20
                      i32.load8_u
                      i32.const 45
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 1
                      i64.const -9223372036854775808
                      i64.xor
                      local.set 1
                      i64.const -4580160821035794432
                      local.set 2
                    end
                    local.get 8
                    i32.const 128
                    i32.add
                    local.get 24
                    local.get 2
                    i64.const 0
                    local.get 1
                    call 12
                    local.get 4
                    local.get 10
                    local.get 14
                    i32.sub
                    local.tee 10
                    i32.store
                    local.get 8
                    i64.load offset=128
                    local.get 8
                    i32.const 136
                    i32.add
                    i64.load
                    local.get 24
                    local.get 2
                    call 7
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 10
                    local.get 12
                    i32.add
                    local.tee 9
                    i32.store
                    local.get 9
                    i32.const 1000000000
                    i32.ge_u
                    if  ;; label = @9
                      local.get 16
                      local.get 22
                      i32.const 2
                      i32.shl
                      i32.add
                      local.set 9
                      loop  ;; label = @10
                        local.get 9
                        i32.const 4
                        i32.add
                        i32.const 0
                        i32.store
                        local.get 9
                        local.get 11
                        i32.lt_u
                        if  ;; label = @11
                          local.get 11
                          i32.const -4
                          i32.add
                          local.tee 11
                          i32.const 0
                          i32.store
                        end
                        local.get 9
                        local.get 9
                        i32.load
                        i32.const 1
                        i32.add
                        local.tee 10
                        i32.store
                        local.get 9
                        i32.const -4
                        i32.add
                        local.set 9
                        local.get 10
                        i32.const 999999999
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                      local.get 9
                      i32.const 4
                      i32.add
                      local.set 4
                    end
                    local.get 16
                    local.get 11
                    i32.sub
                    i32.const 2
                    i32.shr_s
                    i32.const 9
                    i32.mul
                    local.set 9
                    local.get 11
                    i32.load
                    local.tee 12
                    i32.const 10
                    i32.lt_u
                    br_if 0 (;@8;)
                    i32.const 10
                    local.set 10
                    loop  ;; label = @9
                      local.get 9
                      i32.const 1
                      i32.add
                      local.set 9
                      local.get 12
                      local.get 10
                      i32.const 10
                      i32.mul
                      local.tee 10
                      i32.ge_u
                      br_if 0 (;@9;)
                    end
                  end
                  local.get 4
                  i32.const 4
                  i32.add
                  local.tee 10
                  local.get 7
                  local.get 7
                  local.get 10
                  i32.gt_u
                  select
                  local.set 7
                end
                i32.const 0
                local.set 15
                i32.const 0
                local.get 9
                i32.sub
                local.set 4
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 7
                    local.tee 10
                    local.get 11
                    i32.le_u
                    br_if 1 (;@7;)
                    local.get 10
                    i32.const -4
                    i32.add
                    local.tee 7
                    i32.load
                    i32.eqz
                    br_if 0 (;@8;)
                  end
                  i32.const 1
                  local.set 15
                end
                local.get 21
                i32.const 103
                i32.ne
                br_if 4 (;@2;)
                local.get 13
                local.get 13
                i32.eqz
                i32.add
                local.tee 7
                local.get 9
                i32.le_s
                br_if 2 (;@4;)
                local.get 9
                i32.const -4
                i32.lt_s
                br_if 2 (;@4;)
                local.get 7
                i32.const -1
                i32.add
                local.get 9
                i32.sub
                local.set 13
                local.get 6
                i32.const -1
                i32.add
                br 3 (;@3;)
              end
              local.get 8
              i32.const 96
              i32.add
              local.get 1
              local.get 2
              local.get 25
              local.get 24
              call 12
              local.get 8
              i32.const 80
              i32.add
              local.get 8
              i64.load offset=96
              local.get 8
              i32.const 104
              i32.add
              i64.load
              local.get 25
              local.get 24
              call 13
              local.get 8
              i32.const 88
              i32.add
              i64.load
              local.set 2
              local.get 8
              i64.load offset=80
              local.set 1
            end
            local.get 8
            i32.load offset=300
            local.tee 7
            i32.const 31
            i32.shr_s
            local.set 9
            local.get 7
            local.get 9
            i32.add
            local.get 9
            i32.xor
            i64.extend_i32_s
            local.get 18
            call 10
            local.tee 7
            local.get 18
            i32.eq
            if  ;; label = @5
              local.get 8
              i32.const 48
              i32.store8 offset=255
              local.get 8
              i32.const 255
              i32.add
              local.set 7
            end
            local.get 19
            i32.const 2
            i32.or
            local.set 15
            local.get 8
            i32.load offset=300
            local.set 9
            local.get 7
            i32.const -2
            i32.add
            local.tee 14
            local.get 6
            i32.const 15
            i32.add
            i32.store8
            local.get 7
            i32.const -1
            i32.add
            local.get 9
            i32.const 30
            i32.shr_u
            i32.const 2
            i32.and
            i32.const 43
            i32.add
            i32.store8
            local.get 5
            i32.const 8
            i32.and
            local.set 10
            local.get 8
            i32.const 256
            i32.add
            local.set 9
            local.get 4
            i32.const 0
            i32.gt_s
            local.set 12
            loop  ;; label = @5
              local.get 9
              local.set 7
              local.get 8
              i32.const 32
              i32.add
              local.get 1
              local.get 2
              call 34
              local.tee 9
              call 32
              local.get 8
              i32.const 16
              i32.add
              local.get 1
              local.get 2
              local.get 8
              i64.load offset=32
              local.get 8
              i32.const 40
              i32.add
              i64.load
              call 13
              local.get 8
              local.get 8
              i64.load offset=16
              local.get 8
              i32.const 24
              i32.add
              i64.load
              i64.const 0
              i64.const 4612530443357519872
              call 11
              local.get 7
              local.get 9
              i32.const 3392
              i32.add
              i32.load8_u
              local.get 11
              i32.or
              i32.store8
              local.get 8
              i32.const 8
              i32.add
              i64.load
              local.set 2
              local.get 8
              i64.load
              local.set 1
              block  ;; label = @6
                local.get 7
                i32.const 1
                i32.add
                local.tee 9
                local.get 8
                i32.const 256
                i32.add
                i32.sub
                i32.const 1
                i32.ne
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 10
                  br_if 0 (;@7;)
                  local.get 12
                  br_if 0 (;@7;)
                  local.get 1
                  local.get 2
                  i64.const 0
                  i64.const 0
                  call 7
                  i32.eqz
                  br_if 1 (;@6;)
                end
                local.get 7
                i32.const 1
                i32.add
                i32.const 46
                i32.store8
                local.get 7
                i32.const 2
                i32.add
                local.set 9
              end
              local.get 1
              local.get 2
              i64.const 0
              i64.const 0
              call 7
              br_if 0 (;@5;)
            end
            local.get 0
            i32.const 32
            local.get 3
            block (result i32)  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.eqz
                br_if 0 (;@6;)
                i32.const -258
                local.get 8
                i32.sub
                local.get 9
                i32.add
                local.get 4
                i32.ge_s
                br_if 0 (;@6;)
                local.get 4
                local.get 18
                i32.add
                i32.const 2
                i32.add
                local.get 14
                i32.sub
                br 1 (;@5;)
              end
              local.get 18
              local.get 8
              i32.const 256
              i32.add
              i32.sub
              local.get 14
              i32.sub
              local.get 9
              i32.add
            end
            local.tee 11
            local.get 15
            i32.add
            local.tee 4
            local.get 5
            call 5
            local.get 0
            local.get 13
            local.get 15
            call 4
            local.get 0
            i32.const 48
            local.get 3
            local.get 4
            local.get 5
            i32.const 65536
            i32.xor
            call 5
            local.get 0
            local.get 8
            i32.const 256
            i32.add
            local.get 9
            local.get 8
            i32.const 256
            i32.add
            i32.sub
            local.tee 7
            call 4
            local.get 0
            i32.const 48
            local.get 11
            local.get 7
            local.get 18
            local.get 14
            i32.sub
            local.tee 9
            i32.add
            i32.sub
            i32.const 0
            i32.const 0
            call 5
            local.get 0
            local.get 14
            local.get 9
            call 4
            br 3 (;@1;)
          end
          local.get 7
          i32.const -1
          i32.add
          local.set 13
          local.get 6
          i32.const -2
          i32.add
        end
        local.set 6
        local.get 5
        i32.const 8
        i32.and
        br_if 0 (;@2;)
        i32.const 9
        local.set 12
        block  ;; label = @3
          local.get 15
          i32.eqz
          br_if 0 (;@3;)
          local.get 10
          i32.const -4
          i32.add
          i32.load
          local.tee 14
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 12
          local.get 14
          i32.const 10
          i32.rem_u
          br_if 0 (;@3;)
          i32.const 10
          local.set 7
          loop  ;; label = @4
            local.get 12
            i32.const 1
            i32.add
            local.set 12
            local.get 14
            local.get 7
            i32.const 10
            i32.mul
            local.tee 7
            i32.rem_u
            i32.eqz
            br_if 0 (;@4;)
          end
        end
        local.get 10
        local.get 16
        i32.sub
        i32.const 2
        i32.shr_s
        i32.const 9
        i32.mul
        i32.const -9
        i32.add
        local.set 7
        local.get 6
        i32.const 32
        i32.or
        i32.const 102
        i32.eq
        if  ;; label = @3
          local.get 13
          local.get 7
          local.get 12
          i32.sub
          local.tee 7
          i32.const 0
          local.get 7
          i32.const 0
          i32.gt_s
          select
          local.tee 7
          local.get 13
          local.get 7
          i32.lt_s
          select
          local.set 13
          br 1 (;@2;)
        end
        local.get 13
        local.get 7
        local.get 9
        i32.add
        local.get 12
        i32.sub
        local.tee 7
        i32.const 0
        local.get 7
        i32.const 0
        i32.gt_s
        select
        local.tee 7
        local.get 13
        local.get 7
        i32.lt_s
        select
        local.set 13
      end
      local.get 0
      i32.const 32
      local.get 3
      local.get 19
      local.get 13
      i32.add
      i32.const 1
      local.get 5
      i32.const 3
      i32.shr_u
      i32.const 1
      i32.and
      local.get 13
      select
      i32.add
      block (result i32)  ;; label = @2
        local.get 9
        i32.const 0
        local.get 9
        i32.const 0
        i32.gt_s
        select
        local.get 6
        i32.const 32
        i32.or
        local.tee 14
        i32.const 102
        i32.eq
        br_if 0 (;@2;)
        drop
        local.get 18
        local.get 4
        local.get 9
        local.get 9
        i32.const 0
        i32.lt_s
        select
        i64.extend_i32_s
        local.get 18
        call 10
        local.tee 7
        i32.sub
        i32.const 1
        i32.le_s
        if  ;; label = @3
          local.get 7
          i32.const -1
          i32.add
          local.set 7
          loop  ;; label = @4
            local.get 7
            i32.const 48
            i32.store8
            local.get 18
            local.get 7
            i32.sub
            local.set 4
            local.get 7
            i32.const -1
            i32.add
            local.tee 12
            local.set 7
            local.get 4
            i32.const 2
            i32.lt_s
            br_if 0 (;@4;)
          end
          local.get 12
          i32.const 1
          i32.add
          local.set 7
        end
        local.get 7
        i32.const -2
        i32.add
        local.tee 17
        local.get 6
        i32.store8
        local.get 7
        i32.const -1
        i32.add
        local.get 9
        i32.const 30
        i32.shr_u
        i32.const 2
        i32.and
        i32.const 43
        i32.add
        i32.store8
        local.get 18
        local.get 17
        i32.sub
      end
      i32.add
      i32.const 1
      i32.add
      local.tee 4
      local.get 5
      call 5
      local.get 0
      local.get 20
      local.get 19
      call 4
      local.get 0
      i32.const 48
      local.get 3
      local.get 4
      local.get 5
      i32.const 65536
      i32.xor
      call 5
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 14
            i32.const 102
            i32.eq
            if  ;; label = @5
              local.get 16
              local.get 11
              local.get 11
              local.get 16
              i32.gt_u
              select
              local.set 12
              local.get 8
              i32.const 256
              i32.add
              i32.const 8
              i32.or
              local.set 14
              local.get 8
              i32.const 256
              i32.add
              i32.const 9
              i32.or
              local.set 11
              local.get 12
              local.set 9
              loop  ;; label = @6
                local.get 9
                i64.load32_u
                local.get 11
                call 10
                local.set 7
                block  ;; label = @7
                  local.get 9
                  local.get 12
                  i32.ne
                  if  ;; label = @8
                    local.get 7
                    local.get 8
                    i32.const 256
                    i32.add
                    i32.le_u
                    br_if 1 (;@7;)
                    loop  ;; label = @9
                      local.get 7
                      i32.const -1
                      i32.add
                      local.tee 7
                      i32.const 48
                      i32.store8
                      local.get 7
                      local.get 8
                      i32.const 256
                      i32.add
                      i32.gt_u
                      br_if 0 (;@9;)
                      br 2 (;@7;)
                    end
                    unreachable
                  end
                  local.get 7
                  local.get 11
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const 48
                  i32.store8 offset=264
                  local.get 14
                  local.set 7
                end
                local.get 0
                local.get 7
                local.get 11
                local.get 7
                i32.sub
                call 4
                local.get 9
                i32.const 4
                i32.add
                local.tee 9
                local.get 16
                i32.le_u
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 8
              i32.and
              local.get 13
              i32.or
              if  ;; label = @6
                local.get 0
                i32.const 3408
                i32.const 1
                call 4
              end
              local.get 9
              local.get 10
              i32.ge_u
              br_if 1 (;@4;)
              local.get 13
              i32.const 1
              i32.lt_s
              br_if 1 (;@4;)
              loop  ;; label = @6
                local.get 9
                i64.load32_u
                local.get 11
                call 10
                local.tee 7
                local.get 8
                i32.const 256
                i32.add
                i32.gt_u
                if  ;; label = @7
                  loop  ;; label = @8
                    local.get 7
                    i32.const -1
                    i32.add
                    local.tee 7
                    i32.const 48
                    i32.store8
                    local.get 7
                    local.get 8
                    i32.const 256
                    i32.add
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                local.get 7
                local.get 13
                i32.const 9
                local.get 13
                i32.const 9
                i32.lt_s
                select
                call 4
                local.get 13
                i32.const -9
                i32.add
                local.set 7
                local.get 9
                i32.const 4
                i32.add
                local.tee 9
                local.get 10
                i32.ge_u
                br_if 3 (;@3;)
                local.get 13
                i32.const 9
                i32.gt_s
                local.set 12
                local.get 7
                local.set 13
                local.get 12
                br_if 0 (;@6;)
                br 3 (;@3;)
              end
              unreachable
            end
            block  ;; label = @5
              local.get 13
              i32.const 0
              i32.lt_s
              br_if 0 (;@5;)
              local.get 10
              local.get 11
              i32.const 4
              i32.add
              local.get 15
              select
              local.set 14
              local.get 5
              i32.const 8
              i32.and
              local.set 15
              local.get 8
              i32.const 256
              i32.add
              i32.const 8
              i32.or
              local.set 16
              local.get 8
              i32.const 256
              i32.add
              i32.const 9
              i32.or
              local.set 12
              local.get 11
              local.set 9
              loop  ;; label = @6
                local.get 9
                i64.load32_u
                local.get 12
                call 10
                local.tee 7
                local.get 12
                i32.eq
                if  ;; label = @7
                  local.get 8
                  i32.const 48
                  i32.store8 offset=264
                  local.get 16
                  local.set 7
                end
                block  ;; label = @7
                  local.get 9
                  local.get 11
                  i32.ne
                  if  ;; label = @8
                    local.get 7
                    local.get 8
                    i32.const 256
                    i32.add
                    i32.le_u
                    br_if 1 (;@7;)
                    loop  ;; label = @9
                      local.get 7
                      i32.const -1
                      i32.add
                      local.tee 7
                      i32.const 48
                      i32.store8
                      local.get 7
                      local.get 8
                      i32.const 256
                      i32.add
                      i32.gt_u
                      br_if 0 (;@9;)
                      br 2 (;@7;)
                    end
                    unreachable
                  end
                  local.get 0
                  local.get 7
                  i32.const 1
                  call 4
                  local.get 7
                  i32.const 1
                  i32.add
                  local.set 7
                  local.get 15
                  i32.eqz
                  if  ;; label = @8
                    local.get 13
                    i32.const 1
                    i32.lt_s
                    br_if 1 (;@7;)
                  end
                  local.get 0
                  i32.const 3408
                  i32.const 1
                  call 4
                end
                local.get 0
                local.get 7
                local.get 12
                local.get 7
                i32.sub
                local.tee 10
                local.get 13
                local.get 13
                local.get 10
                i32.gt_s
                select
                call 4
                local.get 13
                local.get 10
                i32.sub
                local.set 13
                local.get 9
                i32.const 4
                i32.add
                local.tee 9
                local.get 14
                i32.ge_u
                br_if 1 (;@5;)
                local.get 13
                i32.const -1
                i32.gt_s
                br_if 0 (;@6;)
              end
            end
            local.get 0
            i32.const 48
            local.get 13
            i32.const 18
            i32.add
            i32.const 18
            i32.const 0
            call 5
            local.get 0
            local.get 17
            local.get 18
            local.get 17
            i32.sub
            call 4
            br 2 (;@2;)
          end
          local.get 13
          local.set 7
        end
        local.get 0
        i32.const 48
        local.get 7
        i32.const 9
        i32.add
        i32.const 9
        i32.const 0
        call 5
      end
    end
    local.get 0
    i32.const 32
    local.get 3
    local.get 4
    local.get 5
    i32.const 8192
    i32.xor
    call 5
    i32.const 1024
    local.get 8
    i32.const 7680
    i32.add
    i32.store
    local.get 3
    local.get 4
    local.get 4
    local.get 3
    i32.lt_s
    select)
  (func (;48;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 2
    i32.const 0
    i32.ne
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.const 3
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.const 255
              i32.and
              local.set 4
              loop  ;; label = @6
                local.get 0
                i32.load8_u
                local.get 4
                i32.eq
                br_if 2 (;@4;)
                block  ;; label = @7
                  local.get 2
                  i32.const 1
                  i32.ne
                  local.set 5
                  local.get 2
                  i32.const -1
                  i32.add
                  local.set 3
                  local.get 0
                  i32.const 1
                  i32.add
                  local.set 0
                  local.get 2
                  i32.const 1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 3
                  local.set 2
                  local.get 0
                  i32.const 3
                  i32.and
                  br_if 1 (;@6;)
                end
              end
              local.get 5
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            local.get 2
            local.set 3
            local.get 4
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 2
          local.set 3
        end
        local.get 0
        i32.load8_u
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        if  ;; label = @3
          local.get 3
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 3
          i32.const 4
          i32.ge_u
          if  ;; label = @4
            local.get 1
            i32.const 255
            i32.and
            i32.const 16843009
            i32.mul
            local.set 4
            loop  ;; label = @5
              local.get 0
              i32.load
              local.get 4
              i32.xor
              local.tee 2
              i32.const -1
              i32.xor
              local.get 2
              i32.const -16843009
              i32.add
              i32.and
              i32.const -2139062144
              i32.and
              br_if 2 (;@3;)
              local.get 0
              i32.const 4
              i32.add
              local.set 0
              local.get 3
              i32.const -4
              i32.add
              local.tee 3
              i32.const 3
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 1
        i32.const 255
        i32.and
        local.set 2
        loop  ;; label = @3
          local.get 0
          i32.load8_u
          local.get 2
          i32.eq
          br_if 2 (;@1;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.set 0
    end
    local.get 0)
  (func (;49;) (type 10) (param i64 i32) (result i32)
    local.get 0
    i64.eqz
    i32.eqz
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
  (func (;50;) (type 9) (param i64 i32 i32) (result i32)
    local.get 0
    i64.eqz
    i32.eqz
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
        i32.const 3392
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
  (func (;51;) (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 1024
    i32.const 1024
    i32.load
    i32.const 16
    i32.sub
    local.tee 3
    i32.store
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
                i32.const 75
                local.set 2
                i32.const 0
                local.set 0
                block  ;; label = @7
                  local.get 1
                  i32.const 1
                  i32.sub
                  br_table 5 (;@2;) 0 (;@7;) 1 (;@6;) 3 (;@4;) 4 (;@3;) 6 (;@1;)
                end
                i32.const 625
                local.set 2
                br 4 (;@2;)
              end
              i32.const 1250
              local.set 2
              br 3 (;@2;)
            end
            local.get 3
            local.get 1
            i32.store
            i32.const 1040
            local.get 3
            call 38
            drop
            i32.const -1
            local.set 0
            br 3 (;@1;)
          end
          i32.const 6250
          local.set 2
          br 1 (;@2;)
        end
        i32.const 12500
        local.set 2
      end
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 2
        local.set 1
        loop  ;; label = @3
          local.get 0
          block (result i32)  ;; label = @4
            block (result i32)  ;; label = @5
              i32.const 1032
              i32.const 1032
              i32.load
              local.tee 0
              i32.const 1
              i32.add
              i32.store
              local.get 0
              i32.const 16384
              i32.and
            end
            if  ;; label = @5
              i32.const 1032
              i32.const 1032
              i32.load
              local.tee 0
              i32.const 1
              i32.add
              i32.store
              i32.const 17
              local.get 0
              i32.const 16384
              i32.and
              br_if 1 (;@4;)
              drop
            end
            i32.const 19
          end
          i32.add
          local.set 0
          block  ;; label = @4
            block (result i32)  ;; label = @5
              i32.const 1032
              i32.const 1032
              i32.load
              local.tee 4
              i32.const 1
              i32.add
              i32.store
              local.get 4
              i32.const 16384
              i32.and
              i32.eqz
            end
            if  ;; label = @5
              i32.const 1032
              i32.const 1032
              i32.load
              local.tee 4
              i32.const 1
              i32.add
              i32.store
              local.get 4
              i32.const 16384
              i32.and
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 0
            i32.const 23
            i32.add
            local.set 0
          end
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          br_if 0 (;@3;)
        end
        local.get 5
        i32.const 1
        i32.add
        local.tee 5
        i32.const 27000
        i32.ne
        br_if 0 (;@2;)
      end
      i32.const 1056
      call 39
      drop
    end
    i32.const 1024
    local.get 3
    i32.const 16
    i32.add
    i32.store
    local.get 0)
  (table (;0;) 5 5 funcref)
  (export "main" (func 51))
  (export "stackAlloc" (func 28))
  (export "stackRestore" (func 27))
  (elem (;0;) (i32.const 0) 30 16 41 26 29)
  (data (;0;) (i32.const 1040) "error: %d\5cn")
  (data (;1;) (i32.const 1056) "ok")
  (data (;2;) (i32.const 1624) "\5c\06")
  (data (;3;) (i32.const 1628) "\05")
  (data (;4;) (i32.const 1640) "\02")
  (data (;5;) (i32.const 1664) "\03\00\00\00\04\00\00\00\e8\06\00\00\00\04")
  (data (;6;) (i32.const 1688) "\01")
  (data (;7;) (i32.const 1703) "\0a\ff\ff\ff\ff")
  (data (;8;) (i32.const 2800) "\11\00\0a\00\11\11\11\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b")
  (data (;9;) (i32.const 2832) "\11\00\0f\0a\11\11\11\03\0a\07\00\01\13\09\0b\0b\00\00\09\06\0b\00\00\0b\00\06\11\00\00\00\11\11\11")
  (data (;10;) (i32.const 2881) "\0b")
  (data (;11;) (i32.const 2890) "\11\00\0a\0a\11\11\11\00\0a\00\00\02\00\09\0b\00\00\00\09\00\0b\00\00\0b")
  (data (;12;) (i32.const 2939) "\0c")
  (data (;13;) (i32.const 2951) "\0c\00\00\00\00\0c\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c")
  (data (;14;) (i32.const 2997) "\0e")
  (data (;15;) (i32.const 3009) "\0d\00\00\00\04\0d\00\00\00\00\09\0e\00\00\00\00\00\0e\00\00\0e")
  (data (;16;) (i32.const 3055) "\10")
  (data (;17;) (i32.const 3067) "\0f\00\00\00\00\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\12\00\00\00\12\12\12")
  (data (;18;) (i32.const 3122) "\12\00\00\00\12\12\12\00\00\00\00\00\00\09")
  (data (;19;) (i32.const 3171) "\0b")
  (data (;20;) (i32.const 3183) "\0a\00\00\00\00\0a\00\00\00\00\09\0b\00\00\00\00\00\0b\00\00\0b")
  (data (;21;) (i32.const 3229) "\0c")
  (data (;22;) (i32.const 3241) "\0c\00\00\00\00\0c\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c")
  (data (;23;) (i32.const 3264) "-+   0X0x")
  (data (;24;) (i32.const 3280) "(null)")
  (data (;25;) (i32.const 3296) "-0X+0X 0X-0x+0x 0x")
  (data (;26;) (i32.const 3328) "inf")
  (data (;27;) (i32.const 3344) "INF")
  (data (;28;) (i32.const 3360) "nan")
  (data (;29;) (i32.const 3376) "NAN")
  (data (;30;) (i32.const 3392) "0123456789ABCDEF")
  (data (;31;) (i32.const 3408) ".")
  (data (;32;) (i32.const 3600) "<\06")
  (data (;33;) (i32.const 3664) "T!\22\19\0d\01\02\03\11K\1c\0c\10\04\0b\1d\12\1e'hnopqb \05\06\0f\13\14\15\1a\08\16\07($\17\18\09\0a\0e\1b\1f%#\83\82}&*+<=>?CGJMXYZ[\5c]^_`acdefgijklrstyz{|")
  (data (;34;) (i32.const 3760) "Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is down\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00Block device required\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Device not a stream\00No data available\00Device timeout\00Out of streams resources\00Link has been severed\00Protocol error\00Bad message\00File descriptor in bad state\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Socket type not supported\00Not supported\00Protocol family not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Cannot send after socket shutdown\00Operation already in progress\00Operation in progress\00Stale file handle\00Remote I/O error\00Quota exceeded\00No medium found\00Wrong medium type\00No error information"))
