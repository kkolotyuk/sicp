(define (reverse items)
  (define (reverse-iter items res)
    (if (null? items)
      res
      (reverse-iter (cdr items) (cons (car items) res))))
  (reverse-iter items '()))
