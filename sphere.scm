(start-audio "Mixxx:out_0" 1024 44100)

(clear)

(define s (build-sphere 29 29))
(define num 0)
(with-primitive s
    (texture (load-texture "textures/stripes.png"))
    (set! num (pdata-size))
    (pdata-copy "p" "pc"))

(define (deform n)
  (cond ((> n 0)
        (with-primitive s
            (pdata-set "p" n
                (vadd (pdata-ref "pc" n)
                      (vmul (pdata-ref "n" n) (* 0.025 (gh n))))))
        (deform (- n 1)))))

(define (render)
  (with-primitive s
    (colour (vector 0.6 (+ 2 (sin (/ (time) 3))) 0))
    (rotate (vector (* .2 (gh 10)) (* .5 (gh 3)) (* .5 (gh 9)))))
  (deform num))

(every-frame (render))
