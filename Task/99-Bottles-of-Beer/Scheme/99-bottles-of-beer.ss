(define (bottles x)
	(format #t "~a bottles of beer on the wall~%" x)
	(format #t "~a bottles of beer~%" x)
	(format #t "Take one down, pass it around~%")
	(format #t "~a bottles of beer on the wall~%" (- x 1))
	(if (> (- x 1) 0)
		(bottles (- x 1))))