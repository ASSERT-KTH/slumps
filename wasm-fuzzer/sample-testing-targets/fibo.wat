(module $fibo
  (func $naive (export "naive") (param $i i64) (result i64)
    local.get $i
    i64.const 2
    i64.lt_s
    if $naiveif (result i64)
      i64.const 1
    else
      local.get $i
      i64.const 2
      i64.sub
      call $naive
      local.get $i
      i64.const 1
      i64.sub
      call $naive
      i64.add
    end)

  (func $inner (param $n2 i64) (param $n1 i64) (param $n i64) (result i64)
    (if $innerif (result i64) (i64.gt_s (local.get $n) (i64.const 1))
      (then
        local.get $n1
        local.get $n1
        local.get $n2
        i64.add
        local.get $n
        i64.const 1
        i64.sub
        call $inner)
      (else
        local.get $n1)))

  (func $clever (export "clever") (param $i i64) (result i64)
    i64.const 1
    i64.const 1
    local.get $i
    call $inner)

  (func $loop (export "loop") (param $n i64) (result i64)
    (local $n1 i64)
    (local $n2 i64)
    (local $tmp i64)
    (local.set $n1 (i64.const 1))
    (local.set $n2 (i64.const 1))
    (block $done
      (loop $loop
        (br_if $done (i64.le_s (local.get $n) (i64.const 1)))
        (local.set $tmp (i64.add (local.get $n1) (local.get $n2)))
        (local.set $n2 (local.get $n1))
        (local.set $n1 (local.get $tmp))
        (local.set $n (i64.sub (local.get $n) (i64.const 1)))
        (br $loop)))
    local.get $n1))
