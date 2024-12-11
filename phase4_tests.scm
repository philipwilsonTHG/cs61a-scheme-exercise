;;; Test cases for Scheme, Phase 4.

;;; *** Add more of your own here! ***

;;; Project UID 2d6261568f83a98aa474c0a2b04179ce000b9a48

(define (y c) (c x))

(define x 3)

(define z (+ 1 (call-with-current-continuation y)))
z
; expect 4

(define (a b) (+ b (call-with-current-continuation y)))

(define c (call-with-current-continuation (lambda (cc) cc)))

(define d c)

(d 3)
c
; expect 3

(d 4)
c
; expect 4

(d 'a)
c
; expect a

(define e (begin (display 2)
                 (call-with-current-continuation (lambda (cc) cc))
          )
)
; expect 2e

(define f e)

(f 5)
; expect e
e
; expect 5

(define (foo cc) cc)

(define bar (cons '(1 2) (call-with-current-continuation foo)))
; expect bar

(define baz (cdr bar))

(baz 3)
; expect bar
bar
; expect ((1 2) . 3)
(baz '(3 4))
; expect bar
bar
; expect ((1 2) 3 4)
