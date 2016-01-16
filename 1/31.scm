;; a
(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (PI n)
  (define (inc x) (+ x 1))
  (define (term m)
    (if (even? m)
      (/ (+ m 2) (inc m))
      (/ (inc m) (+ m 2))))
  (* 4 (product term 1 inc n)))

(define (factorial n)
  (define (inc x) (+ x 1))
  (product identity 1 inc n))

;; b
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (* result (term a)))))
  (iter a 1))
