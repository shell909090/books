(load "common.scm")
;; 和accumulate操作方向相反
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest) result
	(iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))
(display (accumulate cons '() '(1 2 3)))
(newline)
(display (accumulate list '() '(1 2 3)))
(newline)
(display (fold-left list '() '(1 2 3)))
(newline)
