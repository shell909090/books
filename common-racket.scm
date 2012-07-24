(require racket/promise)
(load "common.scm")

(define (display-for-each s)
  (stream-for-each display-line s))

(define (stream-enumerate-interval begin end)
  (if (> begin end)
      '()
      (stream-cons begin
		   (stream-enumerate-interval (+ begin 1) end))))

(define one (stream-cons 1 one))
