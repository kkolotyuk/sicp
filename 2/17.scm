(define (last-pair items)
  (if (null? items)
    items
    (let ((first (car items))
          (tail (cdr items)))
      (if (null? tail)
        (list first)
        (last-pair tail)))))
