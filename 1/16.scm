(define (square x) (* x x))

(define (even? x) (= (remainder x 2) 0))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a) 
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))
