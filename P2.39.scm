(load "P2.38.scm")
;; 使用accumulate来定义reverse
(define (reverse1 sequence)
  (accumulate (lambda (x y) (append y (list x ))) '() sequence))
(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
(format #t "2.39:~%")
(display (reverse1 '(1 2 3)))
(newline)
(display (reverse2 '(1 2 3)))
(newline)
