(define (perimeter r)
  (+ (* 2 (width r))
     (* 2 (height r))))

(define (area r)
  (* (width r)
     (height r)))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

;; version 1

(define (make-rect p1 p2)
  (cons p1 p2))

(define (p1-rect r)
  (car r))

(define (p2-rect r)
  (cdr r))

(define (width r)
  (- (x-point (p2-rect r))
     (x-point (p1-rect r))))

(define (height r)
  (- (y-point (p1-rect r))
     (y-point (p2-rect r))))

(area (make-rect (make-point 0 1) (make-point 2 0))) ;; 2
(perimeter (make-rect (make-point 0 1) (make-point 2 0))) ;; 6

;; version 2

(define (make-rect p1 width height)
  (cons p1 (cons width height)))

(define (width r)
  (car (cdr r)))

(define (height r)
  (cdr (cdr r)))

(area (make-rect (make-point 0 1) 2 1)) ;; 2
(perimeter (make-rect (make-point 0 1) 2 1)) ;; 6
