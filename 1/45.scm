(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average x y) 
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (f x n)
  (lambda (y) (/ x (expt y (- n 1)))))

(define (3-root x)
  (fixed-point (average-damp (f x 3)) 2))
  

(define (repeated f n)
  (if (= n 1)
    f
    (repeated (lambda (x) (f (f x)))
              (- n 1))))

(define (n-root-m-average x n m)
  (fixed-point ((repeated average-damp m) (f x n)) 2))
  

(define (n-root x n)
  (define (log2 x)
    (/ (log x) (log 2)))
  (n-root-m-average x n (floor (log2 n))))
