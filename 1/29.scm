(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (even? x) (= (remainder x 2) 0))

(define (inc n) (+ n 1))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (term counter)
    (if (even? counter)
      (* 2 (f (+ a (* counter h))))
      (* 4 (f (+ a (* counter h))))))
  (* (/ h 3) 
     (+ (f a) (f b) (sum term 1 inc (- n 1)))))
