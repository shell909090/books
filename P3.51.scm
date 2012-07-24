(load "common-racket.scm")

(define (show x)
  (display-line x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))

;; 正确的ref实现不会去force不需要的数据，因此不会触发stream-map调用不必要的map
;; 整个机制很精巧，颇有点惊艳的感觉
(stream-ref x 5)
(stream-ref x 7)
