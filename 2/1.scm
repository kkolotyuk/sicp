(define (sgn x)
  (cond ((negative? x) -1)
        ((positive? x) 1)
        (else 0)))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((sign (sgn (* n d)))
        (n (abs n))
        (d (abs d))
        (g (gcd (abs n) (abs d))))
    (cons (* sign (/ n g)) (/ d g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
