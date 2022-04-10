(define (repeated f t)
	(if (= t 1)
		(lambda (x) (f x))
		(lambda (x) (f ((repeated f (- t 1)) x)))
	)
)
