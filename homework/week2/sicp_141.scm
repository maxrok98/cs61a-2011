(define (double f)
	(lambda (x) (f (f x)))
)

;((double 1+) 5)
;> 7

;(((double (double double)) 1+) 5)
;> 21
