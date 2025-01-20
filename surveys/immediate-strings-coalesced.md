# Immediate strings coalesced

## Are immediate strings coalesced?

Asked to evaluate `(let ((a "hello") (b "hello")) (eq? a b))`, Racket, Gauche, MIT, Gambit, Chicken, Bigloo, SISC, Chibi, Chez, STklos, Kawa, SCM, Ikarus/Vicare, Mosh, KSi, SigScheme, TinyScheme, Scheme 9, Dream, S7, BDC, XLisp, Rep, Schemik, Elk, UMB, Oaklisp, Owl Lisp, and LIPS all return `#f`.

Scheme48/scsh, Guile, Larceny, Ypsilon, IronScheme, NexJ, Shoe, RScheme, JScheme, VX, Sagittarius return `#t`.

There may be some false negatives here, because an implementation might coalesce literals in the compiler but not at the REPL.
