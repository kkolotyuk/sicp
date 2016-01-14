;; Recursive
(define (f n) 
  (if (< n 3)
    n
    (+ (f (- n 1))
       (f (- n 2))
       (f (- n 3)))))

;; Iterative
(define (f n)
  (define (f-iter fn-1 fn-2 fn-3 counter)
    (if (> counter n)
      fn-1
      (f-iter (+ fn-1 fn-2 fn-3)
              fn-1
              fn-2
              (+ counter 1))))
  (if (< n 3)
    n
    (f-iter 2 1 0 3))
