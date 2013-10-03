(start-audio "Mixxx:out_0" 1024 44100)

(clear)

(define s (build-sphere 29 31))
(define c (build-cube))
(define num 0)
(with-primitive s
    (set! num (pdata-size))
    (pdata-copy "p" "pc"))

(define (deform n)
  (cond ((> n 0)
        (with-primitive s
            (pdata-set "p" n
                (vadd (pdata-ref "pc" n)
                      (vmul (pdata-ref "n" n) (* 0.015 (gh n))))))
        (deform (- n 1)))))

(define (render)
  (with-primitive s
    (colour (vector 0.6 0 1))
    (rotate (vector 0 (gh 3) (gh 9))))
  (with-primitive c
       (colour (vector 0 1 0))
       (rotate (vector 0 (* -0.5 (gh 3)) (* -0.5 (gh 9)))))
  (deform num))

(every-frame (render))
