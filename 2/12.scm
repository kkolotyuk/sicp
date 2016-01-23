(define (make-interval a b) (cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((width (/ (* c p) 100)))
    (make-interval (- c width) (+ c width))))

(define (percent x)
  (let ((c (center x))
        (w (width x)))
    (* 100 (/ w c))))
