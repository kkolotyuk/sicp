(define (draw-outline frame)
  ((segments->painter 
    (list (make-segment (make-vect 0 0)
                        (make-vect 1 0))
          (make-segment (make-vect 1 0)
                        (make-vect 1 1))
          (make-segment (make-vect 1 1)
                        (make-vect 0 1))
          (make-segment (make-vect 0 1)
                        (make-vect 0 0)))
    frame)))

(define (draw-X frame)
  ((segments->painter
    (list (make-segment (make-vect 0 0)
                        (make-vect 1 1))
          (make-segment (make-vect 1 0)
                        (make-vect 0 1))))
   frame))

(define (draw-diamond frame)
  ((segments->painter
    (list (make-segment (make-vect 0.5 0.0)
                        (make-vect 1.0 0.5))
          (make-segment (make-vect 1.0 0.5)
                        (make-vect 0.5 1.0))
          (make-segment (make-vect 0.5 1.0)
                        (make-vect 0.0 0.5))
          (make-segment (make-vect 0.0 0.5)
                        (make-vect 0.5 0.0))))
   frame))

(define (wave frame)
  ; I am going to skip this.
)
