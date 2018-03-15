#lang racket

(require "../../public-sigs/user-sig.rkt"
         "../../public-sigs/framework-sig.rkt")

(provide fact@)

(define-unit fact@

  (import framework^)
  (export user^)

  (define name "factorial")

  (define algo%
    (class algo-base%
      (define/public (execute n)
        (for/fold ([f 1])
                  ([i (in-range n)])
          (* f (add1 i)))))))
