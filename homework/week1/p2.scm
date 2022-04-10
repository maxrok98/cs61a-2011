(define (squares numbers)
	(if (empty? numbers)
		'()
		(sentence (square (first numbers)) (squares (butfirst numbers)))
	)
)

(define (square x)
	(* x x))

(display (squares '(2 3 4 5)))
