;; With normal order program will be ended with 0 result. 
;; With application order the program will not finish calculation.

(define (p) (p))
(define (test x y)
  (if (= x 0)
    0
    y))
