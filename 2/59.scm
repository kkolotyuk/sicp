(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (union s1 s2)
  (cond ((null? s1) s2)
        ((element-of-set? (car s1) s2) (union (cdr s1) s2))
        (else (union (cdr s1) (cons (car s1) s2)))))
