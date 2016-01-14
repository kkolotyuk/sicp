(define (square x)
  (* x x))

(define (sum-of-squares x y z)
  (+ (square x) 
     (square y)
     (square z)))

(define (min x y z)
  (cond ((and (<= x y) (<= x z)) x)
        ((and (<= y x) (<= y z)) y)
        ((and (<= z x) (<= z y)) z)))

(define (sum-of-square-two-max x y z)
  (- (sum-of-squares x y z) (square (min x y z))))
