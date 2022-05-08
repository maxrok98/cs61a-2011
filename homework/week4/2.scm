(define (mul-interval x y)
	(let ((p1 (* (lower-bound x) (lower-bound y)))
				(p2 (* (lower-bound x) (upper-bound y)))
				(p3 (* (upper-bound x) (lower-bound y)))
				(p4 (* (upper-bound x) (upper-bound y))))
	(make-interval (min p1 p2 p3 p4)
								 (max p1 p2 p3 p4))))

(define (div-interval x y)
	(if (= (width y) 0) (error '(y = 0))
	(mul-interval
	 x
	 (make-interval (/ 1.0 (upper-bound y))
									(/ 1.0 (lower-bound y))))))

(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
								 (+ (upper-bound x) (upper-bound y))))

; 2.7
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

; 2.8
(define (sub-interval x y)
	(make-interval (- (lower-bound y) (lower-bound x))
								 (- (upper-bound y) (upper-bound x))))

; 2.10
(define (width x)
	(- (upper-bound x) (lower-bound x)))

; 2.12
(define (make-center-percent a p)
	(make-interval (* (- 1.0 p) a) (* (+ 1.0 p) a)))

; 2.17
(define (last-pair l)
	(if (eq? (cdr l) nil)
		l
		(last-pair (cdr l))))

; 2.20 - iter
(define (same-parity first . lis)
	(define (s-parity nlis lis)
		(cond ((null? lis) nlis)
					((= (modulo first 2) (modulo (car lis) 2))
						 (s-parity (append nlis (list (car lis))) (cdr lis)))
					 (else (s-parity nlis (cdr lis)))) )
	(s-parity (list first) lis) )

; 2.20 - recurs
(define (same-parity4 first . l)
  (define (s-parity lis)
		(cond ((null? lis) '())
					((= (modulo first 2) (modulo (car lis) 2))
						 (cons (car lis) (s-parity (cdr lis))))
					 (else (s-parity (cdr lis)))))
  (s-parity (cons first l))
)

(define (same-parity2 . lis)
	(filter (lambda (e) (= (remainder (car lis) 2) (remainder e 2))) lis))

(define (same-parity3 x . lis)
	(filter (if (even? x) even? odd?) (cons x lis)))

; 2.23
(define (for-each f l)
	(cond ((null? l) #t)
		(else (f (car l)) (for-each f (cdr l)))) )

(define (for-each2 f l)
	(if (null? l) #t
		((lambda () 
			(f (car l))
			(for-each f (cdr l)) )) )) 

(define (for-each3 f l)
	(if (null? l) #t
		(begin 
			(f (car l))
			(for-each f (cdr l)) ) )) 
