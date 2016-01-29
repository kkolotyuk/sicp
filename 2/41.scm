(define (enumerate-interval l r)
  (define (iter l r res)
    (if (< r l)
      res
      (iter l (- r 1) (cons r res))))
  (iter l r '()))
  
(define (sum-equal? triple s)
  (= s (fold-right + 0 triple)))

(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (triples n)
  (flatmap
    (lambda (pair) 
      (map (lambda (k) (append pair (list k)))
           (enumerate-interval 1 (- (car (cdr pair)) 1))))
    (flatmap
      (lambda (i)
        (map (lambda (j) (list i j))
             (enumerate-interval 1 (- i 1))))
      (enumerate-interval 1 n))))
      
(define (triples-sum n s)
  (filter (lambda (x) (sum-equal? x s))
          (triples n)))
