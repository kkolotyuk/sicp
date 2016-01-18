;; Recursive

(define (cont-frac n d k)
  (define (cont-frac-i i)
    (if (< i k)
      (/ (n i) (+ (d i) (cont-frac-i (+ i 1))))
      (/ (n k) (d k))))
  (cont-frac-i 1))


(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 12)

;; Iterative

(define (cont-frac-iter n d k i res)
  (if (= i 0)
    res
    (cont-frac-iter n
                    d
                    k
                    (- i 1)
                    (/ (n (- i 1)) (+ (d (- i 1)) res)))))

(define (cont-frac n d k)
  (define (cont-frac-iter i res)
    (if (= i 1)
      res
      (cont-frac-iter (- i 1)
                      (/ (n (- i 1)) (+ (d (- i 1)) res)))))
  (cont-frac-iter k (/ (n k) (d k))))
