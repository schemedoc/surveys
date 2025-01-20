# cond-expand

Is `(cond-expand ...)` supported at the REPL?

`cond-expand` was originally defined in [SRFI
0](https://srfi.schemers.org/srfi-0/srfi-0.html). It was included in
R7RS with an additional `(library ...)` requirement type. Notably,
`cond-expand` is absent from R6RS and all prior RnRS standards, though
many implementations of those standards support it.

Supported: Gauche, MIT, Chicken, Bigloo, Kawa, SISC, STklos, SigScheme, Scheme 9, RScheme, S7, SXM, Foment, Chibi, Sagittarius, Guile, LIPS

Not supported: Racket* , Scheme48/scsh, SCM, Chez, Vicare*, Larceny*, Ypsilon*, Mosh, IronScheme, NexJ, JScheme, KSi, Shoe, TinyScheme, BDC, XLisp, Rep, Schemik, Elk, Llava, Sizzle, FemtoLisp, Dfsch, Inlab, Owl Lisp

*Said to support SRFI 0 through [a third-party library](https://code.launchpad.net/~scheme-libraries-team/scheme-libraries/srfi); not tested

Note:  Although [SRFI 0](http://srfi.schemers.org/srfi-0/srfi-0.html) says that `cond-expand` can only be portably used at the top level, all the above Schemes support nested `cond-expand`.  R7RS allows `cond-expand` anywhere a syntactic expression is permitted (it's also a library declaration).

## Can it skip unknown requirement types?

SRFI 0 specifies only the following types of requirements:

* `else`
* _symbol_
* (`not` _requirement_)
* (`and` _requirement_ ...)
* (`or` _requirement_ ...)

R7RS adds:

* (`library` _library-name_)

If `cond-expand` stops evaluating `and` as soon as a _requirement_
fails to match, then a symbol can be used as a guard for each new
requirement type, and it's possible to write future-proof things like
this:

```Scheme
(cond-expand
  ((and no-such-feature (no-such-test arg))
   'impossible)
  (else
   'expected))
```

Which implementations support the above?

* bigloo             `expected`
* chibi              `expected`
* chicken            `expected`
* gambit             `expected`
* gauche             `expected`
* guile              `expected`
* kawa               `expected`
* LIPS               `expected`
* stklos             `expected`
* scheme 9           `expected`
* Ypsilon with `-7`  `expected`

Signal an error:

* foment
* MIT
* Ypsilon with default behavior
