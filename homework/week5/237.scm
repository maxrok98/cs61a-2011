(load "236") ; load accumulate-n

(define (dot-product v w)
	(accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
	(map (lambda (vec) (dot-product vec v)) m))

;(display (matrix-*-vector (list (list 1 2 3) (list 4 5 6) (list 7 8 9)) (list 1 2 3) ))

(define (transpose mat)
	(accumulate-n cons (list) mat))

;(display (transpose (list (list 1 2 3) (list 4 5 6) (list 7 8 9)) ))

(define (matrix-*-matrix m n)
	(let ((ncols (transpose n)))
		(map (lambda (mrow) (matrix-*-vector ncols mrow)) m)))

;(display (matrix-*-matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9))
;													(list (list 1 2 3) (list 4 5 6) (list 7 8 9))  ))
