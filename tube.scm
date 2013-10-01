(start-audio "Mixxx:out_1" 1024 44100)

(define num-bars 16)
(define max-bars 2048)

(define (bars c)
    (cond ((not (negative? c))
        (translate (vector 5.5 0.03 0.4))
        (rotate (vector 0.4 12 (/ (gh c) 8)))
        (with-state
            (colour (vector 0 1 (/ 20 (gh (modulo c num-bars)))))
            (rotate (vector (* 40 (sin (gh (modulo c num-bars))) (sin (time))) 0 0.1))
            (scale (vector (+ 1 (sin (time))) (+ 1.5 (* 0.3 (gh (modulo c num-bars)))) 2))
            (draw-cube))
        (bars (- c 1)))))

;(hint-wire)
(blur 0.4)
(gain 2)
(set-num-frequency-bins num-bars)
(every-frame (bars (- max-bars 1)))
