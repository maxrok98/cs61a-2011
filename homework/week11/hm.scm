; 3.51
(define (show x)
	(display x)
	(display "\n")
	x)

(define x 
	(stream-map show 
		(stream-enumerate-interval 0 10)))

; > 0 ;when define of x is executed
; > (stream-ref x 5)
; > 1234555 
; > (stream-ref x 7)
; > 677

; 3.52
(define sum 0)
(define (accum x) (set! sum (+ x sum)) sum)
(define seq
	(stream-map accum
		(stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z 
	(stream-filter (lambda (x) (= (remainder x 5) 0))
		seq))

; 3.53
(define (add-streams s1 s2) (stream-map + s1 s2))
(define s (cons-stream 1 (add-streams s s)))

; 3.54
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))
(define (mul-streams s1 s2) (stream-map * s1 s2))
(define factorials
	(cons-stream 1 (mul-streams integers factorials)))

; 3.55
(define (partial-sums s)
	(define news (cons-stream (stream-car s) (add-streams news (stream-cdr s))))
	news)
