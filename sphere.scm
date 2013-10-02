(start-audio "Mixxx:out_0" 1024 44100)

(clear)

(define s (build-sphere 29 31))
(define num 0)
(with-primitive s
    (set! num (pdata-size))
    (pdata-copy "p" "pc"))

(define (deform n)
  (cond ((> n 0)
        (with-primitive s
            (pdata-set "p" n
                (vadd (pdata-ref "pc" n)
                      (vmul (pdata-ref "n" n) (* 0.08 (gh n))))))
        (deform (- n 1)))))

(define (render)
  (with-primitive s
    (rotate (vector 0 (gh 3) (gh 9))))
  (deform num))

(every-frame (render))
