(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32 i32 i32 i32)))
  (type (;4;) (func (param i32 i32 i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32 i32) (result i32)))
  (import "env" "putchar" (func $putchar (type 0)))
  (import "env" "memset" (func $memset (type 1)))
  (func $__wasm_call_ctors (type 2))
  (func $rot (type 3) (param i32 i32 i32 i32)
    (block  ;; label = @1
      (br_if 0 (;@1;)
        (local.get 3))
      (block  ;; label = @2
        (block  ;; label = @3
          (br_if 0 (;@3;)
            (i32.eq
              (local.get 2)
              (i32.const 1)))
          (local.set 3
            (i32.load offset=4
              (local.get 1)))
          (local.set 2
            (i32.load
              (local.get 1)))
          (br 1 (;@2;)))
        (i32.store
          (local.get 1)
          (local.tee 2
            (i32.sub
              (local.tee 3
                (i32.add
                  (local.get 0)
                  (i32.const -1)))
              (i32.load
                (local.get 1)))))
        (i32.store offset=4
          (local.get 1)
          (local.tee 3
            (i32.sub
              (local.get 3)
              (i32.load offset=4
                (local.get 1))))))
      (i32.store offset=4
        (local.get 1)
        (local.get 2))
      (i32.store
        (local.get 1)
        (local.get 3))))
  (func $d2pt (type 4) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    (i64.store align=4
      (local.get 2)
      (i64.const 0))
    (block  ;; label = @1
      (br_if 0 (;@1;)
        (i32.lt_s
          (local.get 0)
          (i32.const 2)))
      (local.set 3
        (i32.const 0))
      (local.set 4
        (i32.const 0))
      (local.set 5
        (i32.const 1))
      (loop  ;; label = @2
        (local.set 7
          (i32.and
            (local.tee 6
              (i32.div_s
                (local.get 1)
                (i32.const 2)))
            (i32.const 1)))
        (block  ;; label = @3
          (block  ;; label = @4
            (br_if 0 (;@4;)
              (i32.eqz
                (local.tee 6
                  (i32.and
                    (i32.xor
                      (local.get 6)
                      (local.get 1))
                    (i32.const 1)))))
            (local.set 8
              (local.get 3))
            (local.set 9
              (local.get 4))
            (br 1 (;@3;)))
          (block  ;; label = @5
            (br_if 0 (;@5;)
              (local.get 7))
            (local.set 8
              (local.get 4))
            (local.set 9
              (local.get 3))
            (br 1 (;@4;)))
          (local.set 9
            (i32.sub
              (local.tee 8
                (i32.add
                  (local.get 5)
                  (i32.const -1)))
              (local.get 3)))
          (local.set 8
            (i32.sub
              (local.get 8)
              (local.get 4))))
        (local.set 1
          (i32.div_s
            (local.get 1)
            (i32.const 4)))
        (local.set 3
          (i32.add
            (local.get 8)
            (i32.mul
              (local.get 6)
              (local.get 5))))
        (local.set 4
          (i32.add
            (local.get 9)
            (i32.mul
              (local.get 7)
              (local.get 5))))
        (br_if 0 (;@5;)
          (i32.lt_s
            (local.tee 5
              (i32.shl
                (local.get 5)
                (i32.const 1)))
            (local.get 0))))
      (i32.store offset=4
        (local.get 2)
        (local.get 3))
      (i32.store
        (local.get 2)
        (local.get 4))))
  (func $__original_main (type 5) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 9216))))
    (i32.store8
      (local.tee 1
        (call $memset
          (local.get 0)
          (i32.const 32)
          (i32.const 9216)))
      (i32.const 46))
    (local.set 2
      (i32.add
        (local.get 1)
        (i32.const 96)))
    (local.set 3
      (i32.or
        (local.get 1)
        (i32.const 1)))
    (local.set 4
      (i32.const 0))
    (local.set 5
      (i32.const 0))
    (local.set 6
      (i32.const 1))
    (loop  ;; label = @1
      (local.set 7
        (local.get 5))
      (local.set 8
        (local.get 4))
      (local.set 10
        (i32.and
          (local.tee 9
            (i32.shr_u
              (local.get 6)
              (i32.const 3)))
          (i32.const 1)))
      (local.set 4
        (i32.and
          (local.tee 0
            (i32.shr_u
              (local.get 6)
              (i32.const 1)))
          (i32.const 1)))
      (local.set 0
        (i32.and
          (i32.xor
            (local.get 0)
            (local.get 6))
          (i32.const 1)))
      (block  ;; label = @2
        (block  ;; label = @3
          (br_if 0 (;@3;)
            (i32.eqz
              (local.tee 9
                (i32.and
                  (i32.xor
                    (local.get 9)
                    (i32.shr_u
                      (local.get 6)
                      (i32.const 2)))
                  (i32.const 1)))))
          (local.set 11
            (local.get 0))
          (local.set 0
            (local.get 4))
          (br 1 (;@2;)))
        (block  ;; label = @4
          (br_if 0 (;@4;)
            (local.get 10))
          (local.set 11
            (local.get 4))
          (br 1 (;@3;)))
        (local.set 0
          (i32.xor
            (local.get 0)
            (i32.const 1)))
        (local.set 11
          (i32.xor
            (local.get 4)
            (i32.const 1))))
      (local.set 12
        (i32.and
          (local.tee 4
            (i32.shr_u
              (local.get 6)
              (i32.const 5)))
          (i32.const 1)))
      (local.set 9
        (i32.or
          (local.get 11)
          (i32.shl
            (local.get 9)
            (i32.const 1))))
      (local.set 10
        (i32.or
          (local.get 0)
          (i32.shl
            (local.get 10)
            (i32.const 1))))
      (block  ;; label = @5
        (block  ;; label = @6
          (br_if 0 (;@6;)
            (i32.eqz
              (local.tee 0
                (i32.and
                  (i32.xor
                    (local.get 4)
                    (i32.shr_u
                      (local.get 6)
                      (i32.const 4)))
                  (i32.const 1)))))
          (local.set 4
            (local.get 9))
          (local.set 9
            (local.get 10))
          (br 1 (;@5;)))
        (block  ;; label = @7
          (br_if 0 (;@7;)
            (local.get 12))
          (local.set 4
            (local.get 10))
          (br 1 (;@6;)))
        (local.set 9
          (i32.sub
            (i32.const 3)
            (local.get 9)))
        (local.set 4
          (i32.sub
            (i32.const 3)
            (local.get 10))))
      (local.set 10
        (i32.shr_u
          (local.get 6)
          (i32.const 9)))
      (local.set 11
        (i32.and
          (local.tee 13
            (i32.shr_u
              (local.get 6)
              (i32.const 7)))
          (i32.const 1)))
      (local.set 4
        (i32.or
          (local.get 4)
          (i32.shl
            (local.get 0)
            (i32.const 2))))
      (local.set 9
        (i32.or
          (local.get 9)
          (i32.shl
            (local.get 12)
            (i32.const 2))))
      (block  ;; label = @8
        (block  ;; label = @9
          (br_if 0 (;@9;)
            (i32.eqz
              (local.tee 0
                (i32.and
                  (i32.xor
                    (local.get 13)
                    (i32.shr_u
                      (local.get 6)
                      (i32.const 6)))
                  (i32.const 1)))))
          (local.set 12
            (local.get 4))
          (local.set 4
            (local.get 9))
          (br 1 (;@8;)))
        (block  ;; label = @10
          (br_if 0 (;@10;)
            (local.get 11))
          (local.set 12
            (local.get 9))
          (br 1 (;@9;)))
        (local.set 4
          (i32.sub
            (i32.const 7)
            (local.get 4)))
        (local.set 12
          (i32.sub
            (i32.const 7)
            (local.get 9))))
      (local.set 9
        (i32.and
          (local.get 10)
          (i32.const 1)))
      (local.set 0
        (i32.or
          (local.get 12)
          (i32.shl
            (local.get 0)
            (i32.const 3))))
      (local.set 4
        (i32.or
          (local.get 4)
          (i32.shl
            (local.get 11)
            (i32.const 3))))
      (block  ;; label = @11
        (block  ;; label = @12
          (br_if 0 (;@12;)
            (i32.eqz
              (local.tee 12
                (i32.and
                  (i32.xor
                    (local.get 10)
                    (i32.shr_u
                      (local.get 6)
                      (i32.const 8)))
                  (i32.const 1)))))
          (local.set 11
            (local.get 0))
          (local.set 0
            (local.get 4))
          (br 1 (;@11;)))
        (block  ;; label = @13
          (br_if 0 (;@13;)
            (local.get 9))
          (local.set 11
            (local.get 4))
          (br 1 (;@12;)))
        (local.set 0
          (i32.sub
            (i32.const 15)
            (local.get 0)))
        (local.set 11
          (i32.sub
            (i32.const 15)
            (local.get 4))))
      (i32.store8
        (i32.add
          (i32.add
            (local.get 1)
            (i32.mul
              (local.tee 4
                (i32.or
                  (local.get 0)
                  (i32.shl
                    (local.get 9)
                    (i32.const 4))))
              (i32.const 288)))
          (local.tee 14
            (i32.mul
              (local.tee 5
                (i32.or
                  (local.get 11)
                  (i32.shl
                    (local.get 12)
                    (i32.const 4))))
              (i32.const 3))))
        (i32.const 46))
      (block  ;; label = @14
        (block  ;; label = @15
          (br_if 0 (;@15;)
            (i32.eq
              (local.tee 15
                (i32.mul
                  (local.get 4)
                  (i32.const 3)))
              (local.tee 13
                (i32.mul
                  (local.get 8)
                  (i32.const 3)))))
          (local.set 9
            (i32.mul
              (local.get 10)
              (i32.const 48)))
          (block  ;; label = @16
            (br_if 0 (;@16;)
              (i32.lt_s
                (local.get 13)
                (local.get 15)))
            (local.set 9
              (i32.add
                (i32.xor
                  (local.get 9)
                  (i32.const -1))
                (i32.sub
                  (local.get 13)
                  (i32.mul
                    (local.get 0)
                    (i32.const 3)))))
            (local.set 0
              (i32.add
                (local.get 2)
                (i32.add
                  (i32.add
                    (i32.add
                      (i32.mul
                        (local.get 10)
                        (i32.const 4608))
                      (i32.mul
                        (local.get 0)
                        (i32.const 288)))
                    (i32.mul
                      (local.get 12)
                      (i32.const 48)))
                  (i32.mul
                    (local.get 11)
                    (i32.const 3)))))
            (loop  ;; label = @17
              (i32.store8
                (local.get 0)
                (i32.const 95))
              (local.set 0
                (i32.add
                  (local.get 0)
                  (i32.const 96)))
              (br_if 0 (;@17;)
                (local.tee 9
                  (i32.add
                    (local.get 9)
                    (i32.const -1))))
              (br 3 (;@14;))))
          (br_if 1 (;@16;)
            (i32.ge_s
              (i32.add
                (local.get 13)
                (i32.const 1))
              (local.get 15)))
          (local.set 9
            (i32.add
              (i32.xor
                (local.get 13)
                (i32.const -1))
              (i32.add
                (local.get 9)
                (i32.mul
                  (local.get 0)
                  (i32.const 3)))))
          (local.set 0
            (i32.add
              (local.get 2)
              (i32.add
                (i32.add
                  (i32.mul
                    (local.get 8)
                    (i32.const 288))
                  (i32.mul
                    (local.get 12)
                    (i32.const 48)))
                (i32.mul
                  (local.get 11)
                  (i32.const 3)))))
          (loop  ;; label = @18
            (i32.store8
              (local.get 0)
              (i32.const 95))
            (local.set 0
              (i32.add
                (local.get 0)
                (i32.const 96)))
            (br_if 0 (;@18;)
              (local.tee 9
                (i32.add
                  (local.get 9)
                  (i32.const -1))))
            (br 2 (;@16;))))
        (block  ;; label = @19
          (br_if 0 (;@19;)
            (i32.lt_s
              (local.tee 10
                (i32.mul
                  (local.get 7)
                  (i32.const 3)))
              (local.get 14)))
          (br_if 1 (;@18;)
            (i32.ge_s
              (i32.add
                (local.get 14)
                (i32.const 1))
              (local.get 10)))
          (drop
            (call $memset
              (i32.add
                (local.get 3)
                (i32.add
                  (i32.add
                    (i32.add
                      (i32.mul
                        (local.get 9)
                        (i32.const 4608))
                      (i32.mul
                        (local.get 0)
                        (i32.const 288)))
                    (local.tee 0
                      (i32.mul
                        (local.get 12)
                        (i32.const 48))))
                  (local.tee 9
                    (i32.mul
                      (local.get 11)
                      (i32.const 3)))))
              (i32.const 124)
              (i32.sub
                (i32.add
                  (local.get 10)
                  (i32.xor
                    (local.get 9)
                    (i32.const -1)))
                (local.get 0))))
          (br 1 (;@18;)))
        (br_if 0 (;@19;)
          (i32.ge_s
            (i32.add
              (local.get 10)
              (i32.const 1))
            (local.get 14)))
        (drop
          (call $memset
            (i32.add
              (local.get 3)
              (i32.add
                (i32.add
                  (i32.mul
                    (local.get 9)
                    (i32.const 4608))
                  (i32.mul
                    (local.get 0)
                    (i32.const 288)))
                (local.get 10)))
            (i32.const 124)
            (i32.add
              (i32.xor
                (local.get 10)
                (i32.const -1))
              (i32.add
                (i32.mul
                  (local.get 12)
                  (i32.const 48))
                (i32.mul
                  (local.get 11)
                  (i32.const 3)))))))
      (br_if 0 (;@19;)
        (i32.ne
          (local.tee 6
            (i32.add
              (local.get 6)
              (i32.const 1)))
          (i32.const 1024))))
    (local.set 6
      (i32.const 0))
    (local.set 9
      (local.get 1))
    (loop  ;; label = @20
      (local.set 0
        (i32.const 0))
      (loop  ;; label = @21
        (drop
          (call $putchar
            (i32.load8_s
              (i32.add
                (local.get 9)
                (local.get 0)))))
        (br_if 0 (;@21;)
          (i32.ne
            (local.tee 0
              (i32.add
                (local.get 0)
                (i32.const 96)))
            (i32.const 9216))))
      (drop
        (call $putchar
          (i32.const 10)))
      (local.set 9
        (i32.add
          (local.get 9)
          (i32.const 1)))
      (br_if 0 (;@21;)
        (i32.ne
          (local.tee 6
            (i32.add
              (local.get 6)
              (i32.const 1)))
          (i32.const 96))))
    (global.set 0
      (i32.add
        (local.get 1)
        (i32.const 9216)))
    (i32.const 0))
  (func $main (type 6) (param i32 i32) (result i32)
    (call $__original_main))
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66560))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66560))
  (global (;4;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "__data_end" (global 1))
  (export "__global_base" (global 2))
  (export "__heap_base" (global 3))
  (export "__dso_handle" (global 4))
  (export "rot" (func $rot))
  (export "d2pt" (func $d2pt))
  (export "main" (func $main))
  (export "__original_main" (func $__original_main)))
