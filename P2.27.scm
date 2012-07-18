;; 反向单个list
(define (list-reverse l)
  (define (inner l t)
    (if (null? l)
	t
	(inner (cdr l) (cons (car l) t))))
  (inner l '()))
(display (list-reverse '(1 2 3 4 5)))
(newline)
;; 反向一棵树
(define (reverse t)
  (list-reverse (map list-reverse t)))
(display (reverse '((1 2) (3 4))))
(newline)
