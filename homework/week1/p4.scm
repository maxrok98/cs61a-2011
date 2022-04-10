(define (ordered? nums)
	(if (empty? nums)
		#f
		(ordered1? (first nums) (butfirst nums))
	)
)

(define (ordered1? prev nums)
	(cond ((empty? nums) #t)
				((> prev (first nums)) #f)
				(else (ordered1? (first nums) (butfirst nums)))
	)
)
		
