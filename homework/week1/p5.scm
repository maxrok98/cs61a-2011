(define (ends-e sent)
	(if (empty? sent)
		'()
		(se (word-ends-e (first sent)) (ends-e (butfirst sent)))
	)
)

(define (word-ends-e word)
	(if (equal? (last word) 'e) 
			word
			'()
	)
)

(display (ends-e '(please put the salami above the blue elephant)))
