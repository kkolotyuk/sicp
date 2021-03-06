;; a. There are no operators

;; b. c.

(define (install-deriv-package)
  (define (=number? exp num)
    (and (number? exp) (= exp num)))

  ;; sum
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))

  (define (addend s) (cadr s))

  (define (augend s) (caddr s))
  
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var) 
              (deriv (augend exp) var)))

  ;; prod
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  
  (define (multiplier p) (cadr p))

  (define (multiplicand p) (caddr p))

  (define (deriv-prod exp var)
    (make-sum (make-product (multiplier exp) 
                            (deriv (multiplicand exp) var))
              (make-product (deriv (multiplier exp) var)
                            (multiplicand exp))))
  ;; exp
  (define (base x) (cadr x))

  (define (exponent x) (caddr x))

  (define (make-exponentiation b e)
    (cond ((=number? e 0) 1)
          ((=number? e 1) b)
          (else (list '** b e))))

  (define (deriv-exp exp var)
    (let ((e (exponent exp))
          (b (base exp)))
      (make-product e
        (make-product (make-exponentiation b
                                           (- e 1))
                      (deriv b var)))))

  (put 'deriv '+ deriv-sum)
  (put 'deriv '** deriv-exp)
  (put ’deriv '* deriv-prod))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; d. Just put another way (put '+ 'deriv)
