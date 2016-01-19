(define (cont-frac n d k)
  (define (cont-frac-i i)
    (if (< i k)
      (/ (n i) (+ (d i) (cont-frac-i (+ i 1))))
      (/ (n k) (d k))))
  (cont-frac-i 1))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
      x
      (- (* x x))))
  (define (d i)
    (- (* 2.0 i) 1))
  (cont-frac n d k))

(tan-cf 1 10)
