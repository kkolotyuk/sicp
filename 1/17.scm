(define (double x) (* 2 x))

(define (halve x) (/ x 2))

(define (fast-mult x y)
  (cond ((= y 0) 0)
        ((even? y) (fast-mult (double x) (halve y)))
        (else (+ x (fast-mult x (- y 1))))))
