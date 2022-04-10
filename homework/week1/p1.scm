(define (pigl wd)
  (if (pl-done? wd)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

; Works OK
;(define (pigl wd)
;  (cond ((pl-done? wd)
;      	(word wd 'ay))
;      	(else (pigl (word (bf wd) (first wd))))))

(define (pl-done? wd)
  (vowel? (first wd)))

(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
				(else else-clause)))

; Scheme uses applicative order, it means that if we use new-if instead of if in pigl function 
; it will cause infinit recursion
; if is a special form and new-if is a function. when using new-if, it will try to evaluate
; each operand(then-clause, else-clause) and that's what is causing infinit recursion
; because to evaluate else-clause it needs to call pigl again

; Applicative order - when arguments evaluated first and then we call aperator or function
; with define operands
;
; Example of applicative order:
;
; (zero (random 10))
;    (random 10) ==> 8
; (zero 8) ---->
; (- 8 8) ==> 0
; 0

; Normal order - at firs we enter function until we hit primitive operator, then we star to
; evaluet operands
;
; Example of normal order:
;
; (zero (random 10)) ---->
; (- (random 10) (random 10))
;    (random 10) ==> 3
;    (random 10) ==> 2
; (- 3 2) ==> 1
; 1

