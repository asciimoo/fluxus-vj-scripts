(start-audio "Mixxx:out_0" 1024 44100)

(clear)

(define s (build-sphere 29 31))
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
                      (vmul (pdata-ref "n" n) (* 0.015 (gh n))))))
        (deform (- n 1)))))

(define (render)
  (with-primitive s
    (colour (vector 0.6 0 1))
    (rotate (vector 0 (* .5 (gh 3)) (* .5 (gh 9)))))
  (deform num))

(every-frame (render))
