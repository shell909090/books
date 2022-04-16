(load "P2.08.scm")
;; 这个计算方式不符合结合律，因此基于结合律推导的算式一概不能用
(let ((r1 (make-interval 5 10))
      (r2 (make-interval -7 20))
      (r3 (make-interval -2 -1)))
  (display (mul-interval (add-interval r1 r2) r3))
  (newline)
  (display (add-interval (mul-interval r1 r3) (mul-interval r2 r3)))
  (newline))
