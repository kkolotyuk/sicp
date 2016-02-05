(define (make-leaf symbol weight) (list 'leaf symbol weight))

(define (leaf? object)(eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree) (list (symbol-leaf tree)) (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (encode message tree)
  (if (null? message) 
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

(define (encode-symbol-iter symbol tree res)
  (cond ((leaf? tree) (reverse res))
        ((member symbol (symbols (left-branch tree)))
         (encode-symbol-iter symbol (left-branch tree) (cons 0 res)))
        ((member symbol (symbols (right-branch tree)))
         (encode-symbol-iter symbol (right-branch tree) (cons 1 res)))))

(define (encode-symbol symbol tree)
  (if (member symbol (symbols tree))
    (encode-symbol-iter symbol tree '())
    (error "bad symbol " symbol)))

(define (make-code-tree left right)
  (list left 
        right 
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define tree (make-code-tree (make-leaf 'A 4)
                             (make-code-tree (make-leaf 'B 2) 
                                             (make-code-tree (make-leaf 'D 1) 
                                                             (make-leaf 'C 1)))))
