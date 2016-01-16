(define (accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter (term a)) (accumulate filter
                                       combiner 
                                       (combiner null-value (term a))
                                       term
                                       (next a)
                                       next
                                       b))
        (else (accumulate filter
                          combiner
                          null-value
                          term
                          (next a)
                          next
                          b))))

;; a
(define (square a) (* a a))

(define (sum-square-primes a b)
  (accumulate prime? + 0 square a inc b))

;; b
 (define (gcd m n) 
   (cond ((< m n) (gcd n m)) 
         ((= n 0) m) 
         (else (gcd n (remainder m n))))) 
  
 (define (relative-prime? m n) 
   (= (gcd m n) 1))   
  
 (define (product-of-relative-primes n) 
   (define (filter x) 
     (relative-prime? x n)) 
   (accumulate filter * 1 identity 1 inc n))
