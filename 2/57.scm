(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
          (if (same-variable? exp var) 1 0))
        ((sum? exp)
          (make-sum (deriv (addend exp) var)
                    (deriv (augend exp) var)))
        ((product? exp)
          (make-sum
            (make-product (multiplier exp)
                          (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var)
                          (multiplicand exp))))
        ((exponentiation? exp)
          (let ((e (exponent exp))
                (b (base exp)))
            (make-product e
                          (make-product (make-exponentiation b
                                                             (- e 1))
                                        (deriv b var)))))
        (else
          (error "неизвестный тип выражения -- DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum . xs)
  (let ((num-sum (fold-right + 0 (filter number? xs)))
        (no-num-list (filter (lambda (x) (not (number? x)))
                             xs)))
    (cond ((and (= num-sum 0) (null? no-num-list)) 0)
          ((= num-sum 0) 
             (if (null? (cdr no-num-list))
               (car no-num-list)
               (append '(+) no-num-list)))
          ((null? no-num-list) num-sum)
          (else (append (list '+ num-sum) no-num-list)))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (make-product . xs)
  (let ((num-sum (fold-right * 1 (filter number? xs)))
        (no-num-list (filter (lambda (x) (not (number? x)))
                             xs)))
    (cond ((= num-sum 0) 0)
          ((= num-sum 1) 
             (if (null? (cdr no-num-list))
               (car no-num-list)
               (append '(*) no-num-list)))
          ((null? no-num-list) num-sum)
          (else (append (list '* num-sum) no-num-list)))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) 
  (if (null? (cdddr s))
    (caddr s)
    (append '(+) (cddr s))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) 
  (if (null? (cdddr p))
    (caddr p)
    (append '(*) (cddr p))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x) (cadr x))

(define (exponent x) (caddr x))

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        (else (list '** b e))))
