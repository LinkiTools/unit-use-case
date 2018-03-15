#lang racket

(require "../public-sigs/framework-sig.rkt"
         "../public-sigs/user-sig.rkt")

(provide framework@)

(define-unit framework@

  (import user^)
  (export framework^)

  (define algo-base%
    (class object%
      (define username name)
      (abstract execute)
      (define/public (get-username)
        username))))
