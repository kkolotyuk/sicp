(define (miller-rabin-test n)
  (define (square x) (* x x))
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder 
            (square 
             (trivial-test (expmod base (/ exp 2) m) m))
            m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))
  (define (trivial-test r m)
    (if (or (= r 1) (= r (- m 1)))
        r
        (if (= (remainder (square r) m) 1) 
            0
            r)))
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (do-miller-rabin-test n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) 
         (do-miller-rabin-test n (- times 1)))
        (else #f)))

(do-miller-rabin-test 7919 1000) ;; #t
(do-miller-rabin-test 561 10) ;; #f
