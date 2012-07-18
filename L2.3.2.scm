;; 求导程序，对表达式求导
(define (deriv exp var)
  ;; (display exp) (newline)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 (list 'deriv exp var)))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product (multiplier exp)
			(deriv (multipliend exp) var))
	  (make-product (deriv (multiplier exp) var)
			(multipliend exp))))
	(else
	 (error "unknown expression type -- DERIV" exp))))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (make-sum a1 a2)
  (cond ((and (number? a1) (= a1 0)) a2)
	((and (number? a2) (= a2 0)) a1)
	(else (list '+ a1 a2))))
(define (make-product m1 m2)
  (cond ((or (and (number? m1) (= m1 0)) (and (number? m2) (= m2 0))) 0)
	((and (number? m1) (= m1 1)) m2)
	((and (number? m2) (= m2 1)) m1)
	(else (list '* m1 m2))))
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multipliend p) (caddr p))
(display
 (deriv '(* (* x y) (+ x 3)) 'x))
(newline)