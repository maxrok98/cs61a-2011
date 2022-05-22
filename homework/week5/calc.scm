;; Scheme calculator -- evaluate simple expressions

; The read-eval-print loop:

(define (calc)
  (display "calc: ")
  (flush)
	(let ((result (calc-eval (read))) )
		(if (equal? result 'q) #f
			(begin (print result) (calc) )))
  )

; Evaluate an expression:

(define (calc-eval exp)
  (cond ((or (number? exp) (symbol? exp)) exp)
	((list? exp) (calc-apply (car exp) (map calc-eval (cdr exp))))
	(else (error "Calc: bad expression:" exp))))

; Apply a function to arguments:

(define (calc-apply fn args)
  (cond ((eq? fn '+) (accumulate + 0 args))
	((eq? fn '-) (cond ((null? args) (error "Calc: no args to -"))
			   ((= (length args) 1) (- (car args)))
			   (else (- (car args) (accumulate + 0 (cdr args))))))
	((eq? fn '*) (accumulate * 1 args))
	((eq? fn '/) (cond ((null? args) (error "Calc: no args to /"))
			   ((= (length args) 1) (/ (car args)))
			   (else (/ (car args) (accumulate * 1 (cdr args))))))
	((eq? fn 'first) (if (null? args) (error "Calc: no args to first")
				 (first (car args))))
	((eq? fn 'butfirst) (if (null? args) (error "Calc: no args to butfirst")
				 (butfirst (car args))))
	(else (error "Calc: bad operator:" fn))))


