(define (sqrt-iter new-guess old-guess x)
  (if (good-enough? new-guess old-guess)
    new-guess
    (sqrt-iter (improve new-guess x)
               new-guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? new-guess old-guess)
  (< (abs (/ (- new-guess old-guess) old-guess)) 0.001))

(sqrt-iter 0.4 0.0001 0.0001)
