(load "common.scm")
;; huffman编码树
(use-modules (srfi srfi-1))
(define (get-symbol x) (car x))
(define (get-weight x) (cadr x))
(define (make-subtree left right)
  (list (list (get-symbol left) (get-symbol right))
	(+ (get-weight left) (get-weight right))))
(define (lowest l)
  (define (min-node x y)
    (cond ((null? x) y)
  	  ((null? y) x)
  	  ((< (get-weight x) (get-weight y)) x)
  	  (else y)))
  (reduce min-node '() l))
(define (filter-not l x)
  (filter (lambda (y) (not (eq? x y))) l))
(define (list-to-huffman l)
  (define (step-to-huffman ls)
    (let* ((low1 (lowest ls))
	   (r1 (filter-not ls low1))
	   (low2 (lowest r1))
	   (rest (filter-not r1 low2)))
      (cons (make-subtree low1 low2) rest)))
  (if (= (length l) 1)
      l
      (list-to-huffman (step-to-huffman l))))
(display-line
 (get-symbol (car (list-to-huffman '((b 2) (e 10) (c 5) (a 1) (d 6))))))
