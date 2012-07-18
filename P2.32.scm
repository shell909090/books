;; 给定集合s，生成所有s的子集
(define (subset s)
  (if (null? s)
      (list '())
      (let ((rest (subset (cdr s))))
	(append rest
		(map (lambda (x) (cons (car s) x)) rest)))
      ))
(display (subset '(1 2 3)))
(newline)