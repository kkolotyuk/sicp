(define (reverse items)
  (define (reverse-iter items res)
    (if (null? items)
      res
      (reverse-iter (cdr items) (cons (car items) res))))
  (reverse-iter items '()))

(define (even? x) (= (remainder x 2) 0))

(define (odd? x) (= (remainder x 2) 1))

(define (filter xs criteria)
  (define (filter-iter xs res)
    (if (null? xs)
      res
      (let ((first (car xs))
            (tail (cdr xs)))
        (if (criteria first)
          (filter-iter tail (cons first res))
          (filter-iter tail res)))))
  (reverse(filter-iter xs '())))

(define (same-parity x . xs)
  (let ((criteria (if (even? x) even? odd?)))
    (cons x (filter xs criteria))))

(same-parity 1 2 3 4 5 6)
