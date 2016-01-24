(define (tree-map f tree)
  (map (lambda (subtree)
       (if (pair? subtree)
         (square-tree subtree)
         (f subtree)))
     tree))

(define (square-tree tree)
  (tree-map (lambda (x) (* x x)) tree))
