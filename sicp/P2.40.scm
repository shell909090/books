(load "common.scm")
;; 生成所有的序对(i, j)，使得0<i<j<=n
(define (unique-pairs n)
  (flatmap (lambda (j)
	     (map (lambda (i) (list i j))
		  (enumerate-interval 1 (- j 1))))
	   (enumerate-interval 2 n)))
(display (unique-pairs 4))
(newline)

;; 如上文产生的序对中，有哪些序对(i, j)满足i+j为质数
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (prime-sum-pairs n)
  (map make-pair-sum (filter prime-sum? (unique-pairs n))))
(display (prime-sum-pairs 6))
(newline)
