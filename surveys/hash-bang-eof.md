# Hash bang EOF

I tested the REPLs of the usual Schemes to determine which ones terminated when they read `#!eof` from standard input.

Terminated: Chicken, SISC, Detroit, Chez, Vicare, KSi

Lexical syntax error: Racket, Gauche, Scheme48/scsh, Guile, Larceny, NexJ, SigScheme, MiniScheme, S7, Unlikely, SIOD, Rep, SXM, Sizzle, Foment, Chibi

Self-quoting object:  MIT, Gambit, Kawa

Special object: Llava, Owl Lisp

Unknown identifier: SigScheme, Shoe, BDC, XLisp, Schemik, UMB, Inlab

Attempts to evaluate an eof-object: Mosh, LIPS

Apparently ignores it:  Bigloo, SCM, Ypsilon, IronScheme, JScheme, STklos, TinyScheme, Scheme 9, RScheme, Elk, FemtoLisp, Dfsch, Sagittarius, Picrin

I also tried evaluating `(eof-object? #!eof)` in the REPL for a subset of the above.  Schemes that report a lexical syntax error or treat `#!eof` as an identifier were not retested.  Schemes that ignore `#!eof` usually ignored the closing `)` as well; when one was supplied, they reported a missing argument to `eof-object?`.

Reports premature EOF: MIT, Detroit, KSi, S7

Attempts to evaluate an EOF object: Vicare (will return `#t` to `(eof-object? '#!eof)`)

Lexical syntax error: Mosh

Does not have `eof-object?`: Owl Lisp

Returns `#t`: Gambit, Chicken, Kawa, SISC, Chez

Returns `#f`: Llava
