;; 获得反向表
(define (reverse l)
  (define (rev l t)
    (if (null? l)
	t
	(rev (cdr l) (cons (car l) t))
	))
  (rev l '())
  )
(display (reverse '(1 2 3 4 5)))
(newline)
