(start-audio "Mixxx:out_0" 1024 44100)

(define max-height 20)
(define max-width 20)
(define gh-num 8)

(define (draw-row height count)
  (cond
    ((not (zero? count))
     (translate (vector 2 0 0))
     (with-state
         (scale (vector 1 1 (* .4 (gh (modulo (+ (* height count) height count) gh-num)))))
         (colour (vector (* .2 count) 0 (+ .1 (* 1 (gh count)))))
         (draw-cube))
     (draw-row height (- count 1)))))


(define (draw-wall height width)
    (rotate (vector (cos (time)) (* 2 (sin (time))) (* 2 (cos (time)))))
    (cond
      ((not (zero? height))
       (translate (vector (* -2 max-width) 2 0))
       (with-state
         (draw-row height width)
         (draw-wall (- height 1) width)))))


(define (render)
    ;(translate (vector 0 0 0))
    (rotate (vector (* 40 (time)) (+ 1 (time)) 0))
    (translate (vector 0 -30 0))
    (with-state
        (draw-wall max-height max-width)))
(hint-wire)
(gain 1)
;(hint-none)
;(hint-anti-alias)
(opacity 0.6)
(blur 0.1)
;(ambient 0.5)
;(shinyness 30)
(every-frame (render))
