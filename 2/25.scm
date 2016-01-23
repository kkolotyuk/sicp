(define items '(1 3 (5 7) 9))
(car (cdr (car (cdr (cdr items)))))

(define items '((7)))
(car (car items))

(define items '(1 (2 (3 (4 (5 (6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr items))))))))))))
