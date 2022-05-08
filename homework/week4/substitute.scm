(define (substitute li old new)
	(define (sub li)
		(if (word? li)
			(if (eq? li old) new li)
			(map sub li)) )
	(map sub li) )

(define sub-test (substitute '((one two three) (one four) one six) 'one 'five))

(define (substitute2 li old new)
	(define (sub li)
		(if (word? li)
			(sub-word li old new)
			(map sub li)) )
	(map sub li) )

(define (sub-word wo old new)
	(if (or (null? old) (null? new))
		wo
		(if (eq? wo (car old)) 
			(car new)
			(sub-word wo (cdr old) (cdr new)))) )

(define sub2-test (substitute2 '((4 calling birds) (3 french hens) (2 turtle doves))
															 '(1 2 3 4) '(one two three four)))
