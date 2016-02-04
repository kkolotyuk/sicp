(define (make-segment begin-vector end-vector) (cons begin-vector end-vector))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
