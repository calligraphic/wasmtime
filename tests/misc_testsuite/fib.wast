(module
  (func $fib (export "fib") (param $n i32) (result i32)
    (if (result i32)
      (i32.eq
        (i32.const 0)
        (local.get $n)
      )
      (then
        (i32.const 1)
      )
      (else
        (if (result i32)
          (i32.eq
            (i32.const 1)
            (local.get $n)
          )
          (then
            (i32.const 1)
          )
          (else
            (i32.add
              ;; fib(n - 1)
              (call $fib
                (i32.add
                  (local.get $n)
                  (i32.const -1)
                )
              )
              ;; fib(n - 2)
              (call $fib
                (i32.add
                  (local.get $n)
                  (i32.const -2)
                )
              )
            )
          )
        )
      )
    )
  )
)

(assert_return (invoke "fib" (i32.const 0)) (i32.const 1))
(assert_return (invoke "fib" (i32.const 1)) (i32.const 1))
(assert_return (invoke "fib" (i32.const 2)) (i32.const 2))
(assert_return (invoke "fib" (i32.const 3)) (i32.const 3))
(assert_return (invoke "fib" (i32.const 4)) (i32.const 5))
(assert_return (invoke "fib" (i32.const 5)) (i32.const 8))
(assert_return (invoke "fib" (i32.const 6)) (i32.const 13))
(assert_return (invoke "fib" (i32.const 7)) (i32.const 21))
(assert_return (invoke "fib" (i32.const 8)) (i32.const 34))
(assert_return (invoke "fib" (i32.const 9)) (i32.const 55))
(assert_return (invoke "fib" (i32.const 10)) (i32.const 89))

;; Generated by Rust.
(module
  (func $fib (export "fib") (param $p0 i32) (result i32)
    (local $l1 i32)
    (local.set $l1
      (i32.const 1))
    (block $B0
      (br_if $B0
        (i32.lt_u
          (local.get $p0)
          (i32.const 2)))
      (local.set $l1
        (i32.const 1))
      (loop $L1
        (local.set $l1
          (i32.add
            (call $fib
              (i32.add
                (local.get $p0)
                (i32.const -1)))
            (local.get $l1)))
        (br_if $L1
          (i32.gt_u
            (local.tee $p0
              (i32.add
                (local.get $p0)
                (i32.const -2)))
            (i32.const 1)))))
    (local.get $l1))
)

(assert_return (invoke "fib" (i32.const 0)) (i32.const 1))
(assert_return (invoke "fib" (i32.const 1)) (i32.const 1))
(assert_return (invoke "fib" (i32.const 2)) (i32.const 2))
(assert_return (invoke "fib" (i32.const 3)) (i32.const 3))
(assert_return (invoke "fib" (i32.const 4)) (i32.const 5))
(assert_return (invoke "fib" (i32.const 5)) (i32.const 8))
(assert_return (invoke "fib" (i32.const 6)) (i32.const 13))
(assert_return (invoke "fib" (i32.const 7)) (i32.const 21))
(assert_return (invoke "fib" (i32.const 8)) (i32.const 34))
(assert_return (invoke "fib" (i32.const 9)) (i32.const 55))
(assert_return (invoke "fib" (i32.const 10)) (i32.const 89))