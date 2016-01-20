(define (iterative-improve good? improve)
  (define (foo guess)
    (if (good? guess)
      guess
      (foo (improve guess))))
  foo)

(define (sqrt x)
  (define (good? guess)
    (< (abs (- (* guess guess) x)) 0.001))
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good? improve) 1.0))

(sqrt 4) ;; 2

(define (fixed-point f)
  (define tolerance 0.00001)
  (define (good? v1)
    (< (abs (- v1 (f v1))) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve good? improve) 1.0))

(fixed-point cos 1.0) ;; 0.7390893414033927
