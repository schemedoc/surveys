;; Default element used by `make-list` (default settings, without
;; importing any SRFI):

(bigloo     r-val "#unspecified")
(chezscheme r-val "#<void>")
(chibi      r-val "#undef")
(chicken    error "make-list is undefined")
(cyclone    value #f)
(gambit     value 0)
(gauche     value #f)
(guile      value ())
(racket     error "need a second parameter")
(stklos     r-val "#void")
