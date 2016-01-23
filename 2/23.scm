(define (for-each f items)
  (if (not (null? items))
    (let ((first (car items))
          (tail (cdr items)))
      (f first)
      (for-each f tail))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))
