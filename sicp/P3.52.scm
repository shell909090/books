(load "common-racket.scm")

(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (divides? 5 x)) seq))

(display-line (stream-ref y 7))
(display-stream z)