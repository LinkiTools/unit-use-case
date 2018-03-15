#lang racket

(require "../public-sigs/user-sig.rkt"
         "../public-sigs/framework-sig.rkt"
         "framework-unit.rkt")

(define (start-up user value)
  (define user-path
    (build-path (current-directory) ".." "users" user "entry.rkt"))
  (define-unit-binding user@
    (dynamic-require user-path (string->symbol (format "~a@" user)))
    (import framework^)
    (export user^))
  (define-compound-unit/infer whole-unit@
    (import)
    (export user^)
    (link user@ framework@))
  (define-values/invoke-unit/infer whole-unit@)
  (define algo (new algo%))

  (printf "User name: ~a~n" (send algo get-username))
  (printf "Algo outputs: ~a~n" (send algo execute value)))

(module+ main

  (define username (make-parameter "fact"))

  (define value
    (command-line
     #:program "algo-runner"
     #:once-each
     [("-u" "--user") user
                     "Name of the provider of an algo"
                     (printf "found flag ~a~n" user)
                     (username user)]
     #:args (val)
     val))

  (printf "username: ~a~n" (username))

  (start-up (username) value))
