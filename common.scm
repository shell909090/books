(define (square x)
  (* x x))
;; 整除判定
(define (divides? a b)
  (= (remainder b a) 0))
;; 找到第一个可以整除的数据，并返回。如果不存在，则返回n本身。
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
;; 判定某个数是否是质数
(define (prime? n)
  (= n (find-divisor n 2)))

;; 传说中的reduce
(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;; 平行映射，对seq中的每个元素x，取(proc x)为一个列表。(flatmap proc seq)为所有列表的总和。
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
;; 生成[a, b]的区间序列
(define (enumerate-interval a b)
  (if (>= a b)
      (list b)
      (cons a (enumerate-interval (+ a 1) b))))

(define (display-line x)
  (display x)
  (newline))
