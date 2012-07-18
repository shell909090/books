;; 获得非空表中最后一个元素
(define (last-pair l)
  (if (null? (cdr l))
      (car l)
      (last-pair (cdr l))
      ))
(display (last-pair (list 1 2 3 4 5)))
(newline)