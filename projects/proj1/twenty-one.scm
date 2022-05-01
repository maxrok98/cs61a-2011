(define (twenty-one strategy)
  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1)
	  ((< (best-total dealer-hand-so-far) 17)
	   (play-dealer customer-hand
			(se dealer-hand-so-far (first rest-of-deck))
			(bf rest-of-deck)))
	  ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
	  ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
	  (else 1)))

  (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
    (cond ((> (best-total customer-hand-so-far) 21) -1)
	  ((strategy customer-hand-so-far dealer-up-card)
	   (play-customer (se customer-hand-so-far (first rest-of-deck))
			  dealer-up-card
			  (bf rest-of-deck)))
	  (else
	   (play-dealer customer-hand-so-far
			(se dealer-up-card (first rest-of-deck))
			(bf rest-of-deck)))))

  (let ((deck (make-deck)))
    (play-customer (se (first deck) (first (bf deck)))
		   (first (bf (bf deck)))
		   (bf (bf (bf deck))))) )

(define (make-ordered-deck)
  (define (make-suit s)
    (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K)) )
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C)) )

(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)
	  (se (first in) (shuffle (se (bf in) out) (- size 1)))
	  (move-card (bf in) (se (first in) out) (- which 1)) ))
    (if (= size 0)
	deck
    	(move-card deck '() (random size)) ))
  (shuffle (make-ordered-deck) 52) )

(define (best-total hand)
	(define (sort hand) ; move ace to the end
	 	(cond ((empty? hand) '())
					((eq? (first (first hand)) 'a)
						(se (sort (bf hand)) (first hand)))
					(else (se (first hand) (sort (bf hand))))
		)
	)
	(define (total hand sum)
		(if (empty? hand)
			sum
			(let* ((name (butlast (first hand)))
						(num (cond ((eq? name 'a) 
													(if (> (+ sum 11) 21) 1 11))
											 ((not (number? name)) 10)
											 (else name)
									)
											
						))
						(total (bf hand) (+ sum num)))	
		)
	)
	(total (sort hand) 0)
)

(define (stop-at-17 customer-hand dealer-card)
	(if (< (best-total customer-hand) 17) #t #f))

(define (play-n strategy n)
	(define (iter strategy n wins)
		(cond ((> n 0) (iter strategy (- n 1) (+ wins (twenty-one strategy))))
					(else wins)
		)
	)
	(iter strategy n 0)
)

(define (dealer-sensitive customer-hand dealer-card)
		(let ((custom-total (best-total customer-hand))
					(dealer-total (best-total dealer-card)))
			(if (or (and (> dealer-total 6) (< custom-total 17))
							(and (and (> dealer-total 2) (< dealer-total 7)) (< custom-total 12)))
					#t #f)
		)
)	

(define (stop-at n)
	(lambda (customer-hand dealer-card) 
		(if (< (best-total customer-hand) n) #t #f)))

(define (valentine customer-hand dealer-card)
	;(if (has-suit customer-hand 'h)
	(if (member? 'h (every last customer-hand))
			((stop-at 19) customer-hand dealer-card)
			((stop-at 17) customer-hand dealer-card)
	)
)
(define (has-suit hand suit)
	(cond ((empty? hand) #f)
				((eq? (last (first hand)) suit) #t)
				(else (has-suit (bf hand) suit))))

; (play-n (suit-strategy 'h (stop-at 19) (stop-at 17)) 1000)
(define (suit-strategy suit strategy-with strategy-without)
	(lambda (customer-hand dealer-card)
		(if (member? suit (every last customer-hand))
			(strategy-with customer-hand dealer-card)
			(strategy-without customer-hand dealer-card))))

(define (majority s1 s2 s3)
	(lambda (customer-hand dealer-card)
		(let ((r1 (if (s1 customer-hand dealer-card) 1 0))
					(r2 (if (s2 customer-hand dealer-card) 1 0))
					(r3 (if (s3 customer-hand dealer-card) 1 0)))
		(if (>= (+ r1 r2 r3) 2) #t #f))))

(define (reckless s1)
	(lambda (customer-hand dealer-card)
		(if (and (s1 customer-hand dealer-card) (< 21 (best-total customer-hand)))
			#t #f)))
;                                      32
