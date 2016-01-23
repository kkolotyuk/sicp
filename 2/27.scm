(define (deep-reverse items)
  (define (reverse-iter items res)
    (if (null? items)
      res
      (let ((first (car items))
            (tail (cdr items)))
        (if (pair? first)
          (reverse-iter tail (cons (reverse-iter first '()) res))
          (reverse-iter tail (cons first res)))
        )))
  (reverse-iter items '()))

(deep-reverse '((1 2 (5 6 (7 8))) (3 4))
