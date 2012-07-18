;; 树的平面展开
(define (fringe t)
  (cond ((null? t) t)
	((pair? t) (append (fringe (car t)) (fringe (cdr t))))
	(else (cons t '()))
	))
(display (fringe '((1 2) (3 4))))
(newline)
