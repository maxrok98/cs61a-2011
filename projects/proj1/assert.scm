(define (assert comparer actual expected msg)
	(if (not (comparer actual expected))
		(display (format #f "ERROR! ~S: actual ~A expected ~A\n" msg actual expected))))
