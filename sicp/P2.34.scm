(load "common.scm")
(define (horner-eval x coefficient-sequence)
  (accumulate
   (lambda (this-coeff higher-terms)
     (+ (* higher-terms x) this-coeff))
   0
   coefficient-sequence))
;; 计算1+3x+5x^3+x^5在x=2时的值
(display (horner-eval 2 '(1 3 0 5 0 1)))
(newline)
