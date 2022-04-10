; Why and, or is a special form and not a function and how to prove it

(define (new-or boleans)
		(cond ((empty? boleans) '())
					((equal? (first boleans) #t) #t)
					(else (new-or (butfirst boleans)))
		)
)

; Prove that or is not a function
; (define x 0)
; (or (= x 0) (< 5 (/ 6 x))) 			<--- OK
; (new-or (= x 0) (< 5 (/ 6 x))) 	<--- Error (divide by 0)
; as scheme uses applicative order of evaluetion, it tries to evaluete operands, that's why
; second example tries to evaluete division by 0
; but or evalueting operands one by one, and if it is find at least on #t, it's immidiately
; returns #t 

; Another reason to use special form is because of efficiency, not necessary to evaluete all 
; operands

; Reason to make and and or function: consistency - what looks like function, works like function

