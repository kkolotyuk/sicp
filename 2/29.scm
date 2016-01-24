(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (define (branch-weight branch)
    (let ((s (branch-structure branch)))
      (if (pair? s)
        (total-weight s)
        s)))
  (let ((l (left-branch mobile))
        (r (right-branch mobile)))
    (+ (branch-weight l) (branch-weight r))))

(define (balanced? mobile)
  (define (branch-moment branch)
    (let ((s (branch-structure branch))
          (l (branch-length branch)))
      (if (pair? s)
        (* l (total-weight s))
        (* l s))))
  (define (balanced-or-weight? branch)
    (let ((s (branch-structure branch)))
      (if (pair? s)
        (balanced? s)
        #t)))
  (let ((l (left-branch mobile))
        (r (right-branch mobile)))
    (and (= (branch-moment l) (branch-moment r))
         (balanced-or-weight? l)
         (balanced-or-weight? r))))