(load "common-racket.scm")
;; 看stream-racket有更详细内容
(define (stream-map-0 proc . args)
  (if (stream-empty? (car args))
      '()
      (stream-cons
       (apply proc (map stream-first args))
       (apply stream-map-0
	      (cons proc (map stream-rest args))))))

(display-for-each one)
(display-for-each (stream-map-0 (lambda (x) (* x 2)) one))