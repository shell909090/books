;; 区间算术
(define (make-interval a b) (cons a b))
(define one (make-interval 1 1))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))
;; 等于
(define (eq-interval? x y)
  (and (= (lower-bound x) (lower-bound y))
       (= (upper-bound x) (upper-bound y))))
