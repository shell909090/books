(load "P2.07.scm")

;; 中间值和附加误差
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
;; 附加误差为百分比算法的算法
(define (make-center-percent d p)
  (make-interval (* d (- 1 p)) (* d (+ 1 p))))
(define (percent i)
  (/ (width i) (center i)))
