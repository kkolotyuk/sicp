;; a
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (accumulate combiner 
                (combiner null-value (term a))
                term
                (next a)
                next
                b))) ;; iterative process

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

;; b
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner null-value
              (accumulate combiner (term a) term (next a) next b))) ;; recursive process
