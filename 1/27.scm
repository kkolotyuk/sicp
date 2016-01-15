(define (fermat-test n)
  (define (square x) (* x x))
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                       m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))
  (define (try-it a)
    (= (expmod a n n) a))
  (define (fermat-test-iter count)
    (cond ((= count 0) #t)
          ((try-it count) (fermat-test-iter (- count 1)))
          (else #f)))
  (fermat-test-iter (- n 1)))


(fermat-test 561) ;; #t
(fermat-test 1105) ;; #t
(fermat-test 1729) ;; #t
(fermat-test 2465) ;; #t
(fermat-test 2821) ;; #t
(fermat-test 6601) ;; #t
