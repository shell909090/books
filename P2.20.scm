;; 同奇偶性判断
(define (same-partiy a . l)
  (let ((ev (remainder a 2)))
    (filter (lambda (x) (= ev (remainder x 2))) l)))
(display (same-partiy 1 3 4 5 6 7))
(newline)
