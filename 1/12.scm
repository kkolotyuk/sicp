;; n - row, m - column
(define (f n m)
  (if (or (= n 1) (= n 2) (= m 1) (= m n))
    1
    (+ (f (- n 1) (- m 1)) (f (- n 1) m))))
