(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (enumerate-interval l r)
  (define (iter l r res)
    (if (< r l)
      res
      (iter l (- r 1) (cons r res))))
  (iter l r '()))

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (let ((new-position (list new-row k)))
           (append rest-of-queens (list new-position))))

(define (conflict? p1 p2)
  (let ((p11 (car p1))
        (p12 (car (cdr p1)))
        (p21  (car p2))
        (p22 (car (cdr p2))))
    (or (= p11 p21)
        (= p12 p22)
        (= (abs (- p11 p21)) (abs (- p12 p22))))))

(define (nth n l)
  (if (or (> n (length l)) (< n 0))
    (display "Index out of bounds.")
    (if (= n 0)
      (car l)
      (nth (- n 1) (cdr l)))))

(define (safe? k positions)
  (define (iter position positions)
    (if (null? positions)
      #t
      (let ((f (car positions)))
        (and (not (conflict? position f))
             (iter position (cdr positions))))))
  (if (null? positions)
    #t
    (iter (nth (- k 1) positions) (remove (nth (- k 1) positions) positions))))

(define (queens board-size)
  (define (queen-cols k) ; (((1 1) (1 2)) ((1 1) (2 2)))
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))
