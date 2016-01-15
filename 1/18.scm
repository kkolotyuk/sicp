(define (double x) (* 2 x))

(define (halve x) (/ x 2))

(define (mult-iter x y a)
  (cond ((= y 0) a)
        ((even? y) (mult-iter (double x) (halve y) a))
        (else (mult-iter x (- y 1) (+ a x)))))
