(module
  (type $t0 (func (param i32)))
  (type $t1 (func))
  (type $t2 (func (result i32)))
  (type $t3 (func (param i32) (result i32)))
  (type $t4 (func (param i32 i32) (result i32)))
  (type $t5 (func (param i32 i32 i32) (result i32)))
  (type $t6 (func (param i32 i64 i32) (result i64)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $wasi_snapshot_preview1.args_sizes_get (type $t4)))
  (import "wasi_snapshot_preview1" "args_get" (func $wasi_snapshot_preview1.args_get (type $t4)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $wasi_snapshot_preview1.proc_exit (type $t0)))
  (import "env" "main" (func $env.main (type $t4)))
  (func $f4 (type $t1))
  (func $_start (type $t1)
    block $B0
      i32.const 1
      i32.eqz
      br_if $B0
      call $f4
    end
    call $f6
    call $f12
    unreachable)
  (func $f6 (type $t2) (result i32)
    call $f7)
  (func $f7 (type $t2) (result i32)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32)
    global.get $g0
    i32.const 16
    i32.sub
    local.tee $l0
    global.set $g0
    block $B0
      block $B1
        local.get $l0
        local.tee $l1
        i32.const 12
        i32.add
        local.get $l1
        i32.const 8
        i32.add
        call $wasi_snapshot_preview1.args_sizes_get
        br_if $B1
        block $B2
          block $B3
            local.get $l1
            i32.load offset=12
            local.tee $l2
            br_if $B3
            i32.const 0
            local.set $l2
            br $B2
          end
          local.get $l0
          local.get $l2
          i32.const 2
          i32.shl
          local.tee $l2
          i32.const 19
          i32.add
          i32.const -16
          i32.and
          i32.sub
          local.tee $l0
          local.tee $l3
          global.set $g0
          local.get $l3
          local.get $l1
          i32.load offset=8
          i32.const 15
          i32.add
          i32.const -16
          i32.and
          i32.sub
          local.tee $l3
          global.set $g0
          local.get $l0
          local.get $l2
          i32.add
          i32.const 0
          i32.store
          local.get $l0
          local.get $l3
          call $wasi_snapshot_preview1.args_get
          br_if $B0
          local.get $l1
          i32.load offset=12
          local.set $l2
        end
        local.get $l2
        local.get $l0
        call $f8
        local.set $l0
        local.get $l1
        i32.const 16
        i32.add
        global.set $g0
        local.get $l0
        return
      end
      i32.const 71
      call $wasi_snapshot_preview1.proc_exit
      unreachable
    end
    i32.const 71
    call $wasi_snapshot_preview1.proc_exit
    unreachable)
  (func $f8 (type $t4) (param $p0 i32) (param $p1 i32) (result i32)
    local.get $p0
    local.get $p1
    call $env.main)
  (func $__errno_location (type $t2) (result i32)
    i32.const 1024)
  (func $f10 (type $t0) (param $p0 i32)
    local.get $p0
    call $wasi_snapshot_preview1.proc_exit
    unreachable)
  (func $f11 (type $t1)
    (local $l0 i32)
    i32.const 0
    local.set $l0
    block $B0
      i32.const 0
      i32.const 0
      i32.le_u
      br_if $B0
      loop $L1
        local.get $l0
        i32.const -4
        i32.add
        local.tee $l0
        i32.load
        call_indirect $__indirect_function_table (type $t1)
        local.get $l0
        i32.const 0
        i32.gt_u
        br_if $L1
      end
    end
    call $f13)
  (func $f12 (type $t0) (param $p0 i32)
    call $f13
    call $f11
    call $f13
    local.get $p0
    call $f10
    unreachable)
  (func $f13 (type $t1))
  (func $stackSave (type $t2) (result i32)
    global.get $g0)
  (func $stackRestore (type $t0) (param $p0 i32)
    local.get $p0
    global.set $g0)
  (func $stackAlloc (type $t3) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32)
    global.get $g0
    local.get $p0
    i32.sub
    i32.const -16
    i32.and
    local.tee $l1
    global.set $g0
    local.get $l1)
  (func $f17 (type $t3) (param $p0 i32) (result i32)
    i32.const 1)
  (func $f18 (type $t0) (param $p0 i32))
  (func $f19 (type $t0) (param $p0 i32))
  (func $f20 (type $t0) (param $p0 i32))
  (func $f21 (type $t2) (result i32)
    i32.const 1028
    call $f19
    i32.const 1036)
  (func $f22 (type $t1)
    i32.const 1028
    call $f20)
  (func $fflush (type $t3) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32)
    block $B0
      block $B1
        local.get $p0
        i32.eqz
        br_if $B1
        block $B2
          local.get $p0
          i32.load offset=76
          i32.const -1
          i32.gt_s
          br_if $B2
          local.get $p0
          call $f24
          return
        end
        local.get $p0
        call $f17
        local.set $l1
        local.get $p0
        call $f24
        local.set $l2
        local.get $l1
        i32.eqz
        br_if $B0
        local.get $p0
        call $f18
        local.get $l2
        return
      end
      i32.const 0
      local.set $l2
      block $B3
        i32.const 0
        i32.load offset=1040
        i32.eqz
        br_if $B3
        i32.const 0
        i32.load offset=1040
        call $fflush
        local.set $l2
      end
      block $B4
        call $f21
        i32.load
        local.tee $p0
        i32.eqz
        br_if $B4
        loop $L5
          i32.const 0
          local.set $l1
          block $B6
            local.get $p0
            i32.load offset=76
            i32.const 0
            i32.lt_s
            br_if $B6
            local.get $p0
            call $f17
            local.set $l1
          end
          block $B7
            local.get $p0
            i32.load offset=20
            local.get $p0
            i32.load offset=28
            i32.le_u
            br_if $B7
            local.get $p0
            call $f24
            local.get $l2
            i32.or
            local.set $l2
          end
          block $B8
            local.get $l1
            i32.eqz
            br_if $B8
            local.get $p0
            call $f18
          end
          local.get $p0
          i32.load offset=56
          local.tee $p0
          br_if $L5
        end
      end
      call $f22
    end
    local.get $l2)
  (func $f24 (type $t3) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32)
    block $B0
      local.get $p0
      i32.load offset=20
      local.get $p0
      i32.load offset=28
      i32.le_u
      br_if $B0
      local.get $p0
      i32.const 0
      i32.const 0
      local.get $p0
      i32.load offset=36
      call_indirect $__indirect_function_table (type $t5)
      drop
      local.get $p0
      i32.load offset=20
      br_if $B0
      i32.const -1
      return
    end
    block $B1
      local.get $p0
      i32.load offset=4
      local.tee $l1
      local.get $p0
      i32.load offset=8
      local.tee $l2
      i32.ge_u
      br_if $B1
      local.get $p0
      local.get $l1
      local.get $l2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get $p0
      i32.load offset=40
      call_indirect $__indirect_function_table (type $t6)
      drop
    end
    local.get $p0
    i32.const 0
    i32.store offset=28
    local.get $p0
    i64.const 0
    i64.store offset=16
    local.get $p0
    i64.const 0
    i64.store offset=4 align=4
    i32.const 0)
  (table $__indirect_function_table 2 2 funcref)
  (memory $memory 256 256)
  (global $g0 (mut i32) (i32.const 5243936))
  (global $__data_end i32 (i32.const 1044))
  (export "memory" (memory 0))
  (export "__indirect_function_table" (table 0))
  (export "_start" (func $_start))
  (export "__errno_location" (func $__errno_location))
  (export "fflush" (func $fflush))
  (export "stackSave" (func $stackSave))
  (export "stackRestore" (func $stackRestore))
  (export "stackAlloc" (func $stackAlloc))
  (export "__data_end" (global 1))
  (elem $e0 (i32.const 1) func $f4))
