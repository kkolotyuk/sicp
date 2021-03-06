(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; (add-1 zero)
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

;; (add-1 one)
;; (lambda (f) (lambda (x) (f ((one f) x))))
;; (lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

;; Further
;; (define three (lambda (f) (lambda (x) (f (f (f x))))))
;; (define four (lambda (f) (lambda (x) (f (f (f (f x)))))))
;; ...

(define (plus n1 n2)
  (lambda (f) (lambda (x) ((n1 f) ((n2 f) x)))))
