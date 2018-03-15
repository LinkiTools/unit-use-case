#lang racket

(require "../../public-sigs/user-sig.rkt"
         "../../public-sigs/framework-sig.rkt")

(provide double@)

(define-unit double@

  (import framework^)
  (export user^)

  (define name "double-the-number")

  (define algo%
    (class algo-base%
      (define/public (execute n)
        (* 2 n)))))
