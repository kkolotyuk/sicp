(define (make-interval a b) (cons a b))

(define (upper-bound x) (cdr x))

(define (lower-bound x) (car x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (minus x)
  (make-interval (- (upper-bound x))
                 (- (lower-bound x))))

(define (sub-interval x y)
  (add-interval x (minus y)))
