(define (cc amount coin-values)
  (define (except-first-denomination items)
    (cdr items))
  (define (no-more? items)
    (null? items))
  (define (first-denomination items)
    (car items))
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))
                 
                 
(define us-coins (list 50 25 10 5 1))

;; Order of coins does not matter.
