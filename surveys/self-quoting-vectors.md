# Self-quoting vectors

Currently Racket, Gauche, MIT, Bigloo, Guile, Kawa, Chibi, SCM, NexJ, STklos, Shoe, TinyScheme, Scheme 9, Dream, s7, XLisp, Rep, Schemik, UMB, VX, Oaklisp, Llava, Spark, FemtoLisp, Dfsch, Owl Lisp, Sagittarius, Chicken, LIPS treat vectors as self-quoting.

Gambit, Scheme48/scsh, SISC, Chez, Ikarus/Vicare, Ypsilon, Mosh, IronScheme, KSi, SigScheme, RScheme, Elk, SXM, Sizzle, Inlab treat unquoted vectors as errors.

Larceny prints a warning from the macro expander, but then treats the vector as self-quoting.

BDC does not support vector constants.
