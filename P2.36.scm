(load "common.scm")
;; seq是一个序列的序列，accumulate-n用于对每个序列的第1, 2, ... n个元素分别求和，得到一个新的序列
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))
      ))
(display (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12))))
(newline)
