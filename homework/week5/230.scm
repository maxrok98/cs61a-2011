(define (square-tree tree)
	(map (lambda (sub-tree) 
		(if (pair? sub-tree)
			(square-tree sub-tree)
			(* sub-tree sub-tree)))
		tree) )