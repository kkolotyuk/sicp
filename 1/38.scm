(define (cont-frac n d k)
  (define (cont-frac-i i)
    (if (< i k)
      (/ (n i) (+ (d i) (cont-frac-i (+ i 1))))
      (/ (n k) (d k))))
  (cont-frac-i 1))

(define (d i)
  (if (= 2 (remainder i 3))
    (* (+ 1 (quotient i 3)) 2.0)
    1.0))

(cont-frac (lambda (i) 1) d 100)
