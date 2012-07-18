(load "P2.40.scm")
;; 产生所有(i, j, k)，使得i+j+k=s。其中，i, j, k互相不等，并且都大于0小于n。
(format #t "2.41:~%")
(define (resolve n s)
  ;; 生成总和为s的三元组
  (define (make-tuple x)
    (list (car x) (cadr x) (- s (car x) (cadr x))))
  ;; 检查这个三元组是否合法
  (define (filter-tuple x)
    (and (> (caddr x) 0)
	 (not (= (caddr x) (car x)))
	 (not (= (caddr x) (cadr x)))))
  (filter filter-tuple (map make-tuple (unique-pairs n))))
(display (resolve 4 6))
(newline)