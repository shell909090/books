(load "P2.08.scm")
;;不同计算方式的不同结果
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))
(define (par2 r1 r2)
  (div-interval one
		(add-interval (div-interval one r1)
			      (div-interval one r2))))
(display (par1 (make-interval 1 10) (make-interval 1 2)))
(newline)
(display (par2 (make-interval 1 10) (make-interval 1 2)))
(newline)