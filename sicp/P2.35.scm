(load "common.scm")
;; 计算出一颗树t上有多少个叶子节点
(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t)))
(display (count-leaves '((1 2) (3 4))))
(newline)

