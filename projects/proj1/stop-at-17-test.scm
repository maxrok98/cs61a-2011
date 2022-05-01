(load "assert")
(load "twenty-one")

(assert eq? (stop-at-17 '(10h 7h) '()) #f "stop if 17")


(display "stop-at-17-test completed\n")
