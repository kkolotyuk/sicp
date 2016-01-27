(define (smaller-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smaller-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime-range from to)
  (if (<= from to)
    (if (= 0 (remainder from 2))
      (prime-range (+ from 1) to)
      (handle-candidate from to))))

(define (handle-candidate candidate to)
  (timed-prime-test candidate)
  (prime-range (+ candidate 1) to))

(prime-range 1000000000000 1000000000063) ;; 2.03
(prime-range 10000000000000 10000000000063) ;; 6

;; Time ~ number of steps