;; 活动体平衡问题，用来解释数据抽象
(define (make-mobile left right)
  (list left right))
(define (left-brench mobile)
  (car mobile))
(define (right-brench mobile)
  (car (cdr mobile)))
(define (make-brench length structure)
  (list length structure))
(define (brench-length brench)
  (car brench))
(define (brench-structure brench)
  (car (cdr brench)))
(define (total-weight mobile)
  (if (pair? mobile)
      (+ (total-weight (brench-structure (left-brench mobile)))
	 (total-weight (brench-structure (right-brench mobile))))
      mobile
      ))
(define (balance mobile)
  (if (not (pair? mobile))
      #t
      (and (balance (brench-structure (left-brench mobile)))
	   (balance (brench-structure (right-brench mobile)))
	   (= (* (brench-length (left-brench mobile))
		 (total-weight (brench-structure (left-brench mobile))))
	      (* (brench-length (right-brench mobile))
		 (total-weight (brench-structure (right-brench mobile)))))
	   )))
(display (balance (make-mobile (make-brench 2 3) (make-brench 3 2))))
(newline)
