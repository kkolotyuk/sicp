(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)(adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs) 
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)
                             (cadr pair))
                  (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-lea(define tree (generate-huffman-tree
               '(("A" 2) ("NA" 16) ("BOOM" 1) ("SHA" 3) ("GET" 2) ("YIP" 9) ("JOB" 2) ("WAH" 1))))

(encode '("GET" "A" "JOB"
"SHA" "NA" "NA" "NA" "NA" "NA" "NA" "NA" "NA"
"GET" "A" "JOB"
"SHA" "NA" "NA" "NA" "NA" "NA" "NA" "NA" "NA"
"WAH" "YIP" "YIP" "YIP" "YIP" "YIP" "YIP" "YIP" "YIP" "YIP"
"SHA" "BOOM") tree)f-set pairs)))

(define (successive-merge trees)
  (if (null? (cdr trees))
    (car trees)
    (let ((t1 (car trees))
          (t2 (cadr trees)))
      (successive-merge (adjoin-set (make-code-tree t1 t2)
                                    (cddr trees))))))
