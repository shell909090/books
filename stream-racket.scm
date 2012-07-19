(load "common.scm")
;; racket的实现
(require racket/stream)

(format "odd list:~%")
;; stream-cons的定义还比较原始，严格照搬了SICP上的定义
;; 当然，可以做的变化和组合也多一些
(define (odds-stream n)
  (stream-cons n (odds-stream (+ n 2))))
(define odds (odds-stream 1))
(display (stream-first odds))
(newline)
(display (stream-first (stream-rest odds)))
(newline)

(format "enumerate interval:~%")
(define (stream-enumerate-interval low high)
  (if (> low high)
      '()
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1) high))))
(define (stream-display s)
  (stream-for-each
   (lambda (x)
     (display x)
     (newline))
   s))
(stream-display (stream-enumerate-interval 10 20))

(format "prime list:~%")
(stream-display
 (stream-filter prime? (stream-enumerate-interval 2 100)))

(format "stream map:~%")
(define (stream-map-0 f . stream-list)
  (if (stream-empty? (car stream-list)) '()
      (stream-cons
       (apply f (map car stream-list))
       (apply stream-map-0 (cons proc (map cdr stream-list))))
      ))
;; racket根本不支持stream-map多参数
(stream-display
 (stream-map (lambda (x) (* x x))
	     (stream-enumerate-interval 1 10)))
(stream-display
 (stream-map-0 *
	       (stream-enumerate-interval 1 10)
	       (stream-enumerate-interval 1 10)))
