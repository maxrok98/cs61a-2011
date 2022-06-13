(load "obj")

; ex 1
(define-class (random-generator range)
	(instance-vars (ncalls 0))
	(method (number)
		(set! ncalls (+ 1 ncalls))
		(random range))
	(method (count) ncalls))

; ex 2
(define-class (coke-machine coke-amount price)
	(instance-vars (money 0))
	(method (deposit pay)
		(set! money (+ money pay)))
	(method (coke)
		(let ((localm money))
			(if (< localm price)
				'(NOT ENOUGH MONEY)
				(begin 
					(set! money 0)
					(set! coke-amount (- coke-amount 1))
					(- localm price)
				))))
	(method (fill amount)
		(set! coke-amount (+ coke-amount amount))) )

; ex 3
(define-class (deck cards)
	(initialize (set! cards (shuffle cards)))
	(method (empty?)
		(null? cards))
	(method (deal)
		(if (ask self 'empty?)
			'()
			(let ((first-card (first cards)))
				(begin 
						(set! cards (butfirst cards))
						first-card)))) )


(define (shuffle deck)
	(if (null? deck)
		'()
		(let ((card (nth (random (length deck)) deck)))
			(cons card (shuffle (remove card deck))) )))

; ex 4
(define-class (miss-manners obj)
	(method (please msq arg)
		(ask obj msq arg)))

(define-class (mock)
	(method (test1 arg)
		arg)
	(method (test2 arg)
		(+ 1 arg)))
