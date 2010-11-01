(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))
      ))
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
(define (enumerate-interval a b)
  (if (>= a b)
      (list b)
      (cons a (enumerate-interval (+ a 1) b))))
;; (enumerate-interval 1 4)
(define (unique-pairs n)
  (flatmap (lambda (j)
	     (map (lambda (i) (list i j))
		  (enumerate-interval 1 (- j 1))))
	   (enumerate-interval 2 n)))
;; (unique-pairs 4)
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (prime-sum-pairs n)
  (map make-pair-sum (filter prime-sum? (unique-pairs n))))
;; (prime-sum-pairs 6)
(define (resolve n s)
  (define (make-tuple x)
    (list (car x) (cadr x) (- s (car x) (cadr x))))
  (define (filter-tuple x)
    (and (> (caddr x) 0)
	 (not (= (caddr x) (car x)))
	 (not (= (caddr x) (cadr x)))))
  (filter filter-tuple (map make-tuple (unique-pairs n))))
;; (resolve 4 6)
(define (queens board-size)
  (define (queen-cols i)
    (if (= i 0)
	(list (empty-board))
	(filter
	 (lambda (positions) (safe? positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (j)
		   (adjoin-position i j rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- i 1))))
	))
  (queen-cols board-size)
  )
(define (empty-board) (list))
(define (adjoin-position i j rest-of-queens)
  (cons (cons i j) rest-of-queens))
(define (safe? positions)
  (define (safe-row? j positions)
    (eq? '()
	 (filter (lambda (y) (= y j))
		 (map (lambda (p) (cdr p)) (cdr positions))
		 )))
  (define (safe-add? s positions)
    (eq? '()
	 (filter (lambda (e) (= e s))
		 (map (lambda (p) (+ (car p) (cdr p))) (cdr positions))
		 )))
  (define (safe-dec? d positions)
    (eq? '()
	 (filter (lambda (e) (= e d))
		 (map (lambda (p) (- (car p) (cdr p))) (cdr positions))
		 )))
  (and (safe-row? (cdar positions) positions)
       (safe-add? (+ (caar positions) (cdar positions)) positions)
       (safe-dec? (- (caar positions) (cdar positions)) positions))
  )
(queens 8)
;; X O O O O O O O
;; O O O O X O O O
;; O O O O O O O X
;; O O O O O X O O
;; O O X O O O O O
;; O O O O O O X O
;; O X O O O O O O
;; O O O X O O O O

