(define (square x)
    (* x x))

(define (cubic-iter new-guess old-guess x)
  (if (good-enough? new-guess old-guess)
    new-guess
    (cubic-iter (improve new-guess x)
               new-guess x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) 
        (* 2 guess))
     3))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? new-guess old-guess)
  (< (abs (/ (- new-guess old-guess) old-guess)) 0.001))

(cubic-iter 1 8 8)
