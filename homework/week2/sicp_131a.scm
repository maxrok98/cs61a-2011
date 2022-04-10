(define (product term a next b)
	(if (> a b)
		1
		(* (term a)
			 (product term (next a) next b))
	)
)

(define (test-product)
	(product
		(lambda (x) x)
		2
		(lambda (x) (+ x 1))
		4)
)

(define (factorial a)
	(product (lambda (x) x)
					 1
					 1+ ; same (lambda (x) (+ x 1))
					 a))

; compute pi by John Wallis method
; (2*4*4*6*6..)/(3*3*5*5*7..)=(pi/4)
(define (compute-pi len)
	(define m1 (lambda (x) (- x 1)))
	(* 4 (product (lambda (x) (* (/ (m1 x) x) (/ (1+ x) x) ))
								 3
								 (lambda (x) (+ x 2))
								 len
			 )
	)
)
 
