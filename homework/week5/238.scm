(define fold-right accumulate)
(define (fold-left op initial sequence)
	(define (iter result rest)
		(if (null? rest)
			result
			(iter (op result (car rest))
						(cdr rest))))
	(iter initial sequence))

;(display (fold-right / 1 (list 1 2 3)))
;> 3/2
;(display (fold-left / 1 (list 1 2 3)))
;> 1/6
;(display (fold-right list nil (list 1 2 3)))
;> (1 (2 (3 ())))
;(display (fold-left list nil (list 1 2 3)))
;> (((() 1) 2) 3)

; op must be associative for fold-right == fold-left
