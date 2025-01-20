# Case insensitivity

## Symbols

Racket, Gauche, Gambit, Chicken, Bigloo, scsh, Guile, Kawa, Chibi, Chez, Vicare, Larceny, Ypsilon, Mosh, IronScheme, NexJ, KSi, SigScheme, Shoe, RScheme, S7, BDC, Rep, Schemik, Llava, Sizzle, Spark, Femtolisp, Dfsch, Owl Lisp, Sagittarius, LIPS return `#f` to `(eq? 't 'T)`.

MIT, Scheme48, SISC, SCM, STklos, TinyScheme, Scheme 9, Dream, XLisp, Elk, UMB, VX, Oaklisp, SXM, Inlab return `#t`.

## Preferred case is upper case

I also decided to check the case-insensitive implementations using `(string=? (symbol->string 't) "T")` to see which ones converted symbols to upper case internally.  Only XLisp (which is not really Scheme-compliant) and Oaklisp (which is somewhat R3RS-compliant) did so.

## Character names

Is `#\Space` a valid constant?

Racket, Gauche, MIT, Bigloo, Scheme48, Guile, Kawa, Chibi, Chez, NexJ, STklos, KSi, SigScheme, TinyScheme, Scheme 9, Dream, RScheme, Rep, Elk, Oaklisp, Llava, SXM, Spark, Dfsch, Inlab, LIPS accept `#\Space`.

Gambit, Chicken, scsh, Vicare, Ypsilon, Mosh, IronScheme, Shoe, S7, Schemik, UMB, Sizzle, FemtoLisp, Owl Lisp, Sagittarius reject `#\Space`.

## Boolean constants

Gambit, TinyScheme, S7, VX, Sizzle, Owl Lisp, LIPS do not accept `#T` as equivalent to `#t`.

The other Schemes in the test suite do.

## Inexact constants

All Schemes in the test suite accept `E` as well as `e` in inexact constants (except those without inexact number support).

## From practical-scheme.net

Although symbols themselves are case-sensitive (you can create uppercase and lowercase symbols via string->symbol), by R5RS the standard required the reader to effectively fold the cases when it is reading symbol, so that 'a and 'A are treated as eq?

Almost all active implementations, however, have a switch to choose case-sensitiveness of the symbol reader. Furthermore, more and more recent implementations seem to adopt case-sensitive reader by default.

Here's a list of implementations and their default case sensitivity ('S' for sensitive, 'I' for insensitive), and whether they have an option to switch.

| Implementation | default | option? |
| -------------- | ------- | ------- |
| Bigloo         | S       | yes (option -fcase-insensitive) |
| ChezScheme     | S       | yes (parameter case-sensitive) |
| Chicken        | S       | yes (compiler command line option) |
| Cyclone        | S       | no |
| Elk            | S       | yes (command line) |
| Gambit         | S       | yes (command line / readtable) |
| Gauche         | S       | yes (command line -fcase-fold) |
| Guile          | S       | yes (reader option) |
| Ikarus         | S       | no? |
| Kawa           | S       | yes (variable symbol-read-case) |
| Larceny        | S       | yes (command line switches, parameter, per-port flags) |
| LispMe         | I       | yes (settings dialog) |
| MIT-Scheme     | I       | yes (variable *parser-canonicalize-symbols?*) |
| PLT-Scheme     | S       | yes (parameter read-case-sensitive, per-expression prefix #cs and #ci) |
| Pocket-Scheme  | I*      | no |
| RScheme        | S       | ? |
| Scheme48       | I       | no |
| SCM            | I       | no |
| Scsh           | S       | no? |
| SigScheme      | S       | no? |
| SISC           | I       | yes (parameter case-sensitive) |
| Stalin         | I       | no |
| STklos         | S       | yes (command line and directive #!no-fold-case) |
| TinyScheme     | I       | no |
| LIPS           | S       | yes (directive #!fold-case)

(* Pocket Scheme: only folds case between U+0000 - U+00FF)

(* STklos: was case insensitive; with 1.40 it became case sensitive by default)
