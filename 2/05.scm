(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (even? x)
  (= 0 (remainder x 2)))

(define (triple? x)
  (= 0 (remainder x 3)))

(define (two x res)
  (if (even? x)
    (two (/ x 2) (+ res 1))
    res))

(define (three x res)
  (if (triple? x)
    (three (/ x 3) (+ res 1))
    res))

(define (car z)
  (two z 0))

(define (cdr z)
  (three z 0))
