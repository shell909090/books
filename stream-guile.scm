(load "common.scm")
;; guile的实现
(use-modules (ice-9 streams))

(format #t "odd list:~%")
;; make-stream函数是基于迭代函数的，每次传入一个状态，传出目标值和下一个状态
;; 这个是stream-cons的包装，比较好用
;; 虽然和yield有区别，但是已经非常接近生成器
(define odds (make-stream (lambda (state)
			    (cons state (+ state 2)))
			  1))
(display (stream-car odds))
(newline)
(display (stream-car (stream-cdr odds)))
(newline)

(format #t "enumerate interval:~%")
(define (stream-enumerate-interval low high)
  (make-stream
   (lambda (x)
     (if (> x high) '()
	 (cons x (+ x 1))))
   low))
(define (stream-display s)
  (stream-for-each
   (lambda (x)
     (display x)
     (newline))
   s))
(stream-display (stream-enumerate-interval 10 20))

(format #t "prime list:~%")
;; 可以证明，make-stream和stream-cons是等效的
;; 更精确的说，可以通过stream-cons来实现make-stream
;; 反过来我还没想出怎么实现
(define (stream-filter p s)
  (define (inner x)
    (cond ((stream-null? x)
	   '())
	  ((p (stream-car x))
	   (cons (stream-car x) (stream-cdr x)))
	  (else
	   (inner (stream-cdr x)))))
  (make-stream inner s))
(stream-display
 (stream-filter prime? (stream-enumerate-interval 2 100)))

(format #t "stream map:~%")
(define (stream-map-0 f . stream-list)
  (make-stream
   (lambda (x)
     (if (stream-null? (car x)) '()
	 (cons (apply f (map stream-car x))
	       (map stream-cdr x))))
   stream-list))
(stream-display
 (stream-map *
	     (stream-enumerate-interval 1 10)
	     (stream-enumerate-interval 1 10)))
(stream-display
 (stream-map-0 *
	       (stream-enumerate-interval 1 10)
	       (stream-enumerate-interval 1 10)))
