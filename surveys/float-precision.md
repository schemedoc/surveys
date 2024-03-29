# Float precision

## Multiple inexact-number precisions

Scheme (before R7RS) and Common Lisp require that implementations understand short-float, single-float, double-float and long-float syntax.  These are written by replacing the `e` of exponential notation with an `s`, `f`, `d`, or `l` respectively.  However, there is no requirement that any of these be distinct, only that they be consistent: short-floats cannot have more precision than long-floats, for example.  Common Lisp requires that `e` notation be equivalent to `f` notation by default; Scheme has no such requirement.

I asked the usual Schemes and some Common Lisps to evaluate `3.1415926535897932385s0`,  `3.1415926535897932385f0`, `3.1415926535897932385d0`, and `3.1415926535897932385l0`, where the numeric value is a 64-bit version of *π*.  Common Lisps were asked about precision directly using the standard `float-bits` procedure.  For Scheme, I inferred how many bits of precision were provided by the answers.  Here are the results:

All four numbers are the same and have 53-bit precision (IEEE double):  Racket CS. Gauche, Gambit, Chicken, Guile*, Kawa, SISC, Chibi, SCM, Chez, Vicare, Larceny, Ypsilon, Mosh, IronScheme, STklos, KSI, S7, UMB, VX, SXM, Spark, Dfsch, Inlab, Sagittarius

All four numbers are the same and have 18-digit precision (between 59 and 60 bits): Scheme 9

All four numbers are the same and have 20-bit precision: Shoe

The first two numbers have 24-bit precision, the last two have 53-bit precision:  Racket BC, NexJ, Armed Bear CL, Allegro CL, Clozure CL, CMU CL, Embeddable CL, GNU CL, Steel Bank CL, Scieneer CL

The numbers have 19-bit, 24-bit, 53-bit, and 53-bit precision respectively: LispWorks

The numbers have 17-bit, 24-bit, 53-bit, and arbitrary (at least 64-bit) precision respectively: CLISP

The numbers have 24-bit, 24-bit, 53-bit, and arbitrary precision respectively: Kawa

No inexact numbers: SigScheme, Dream, Oaklisp, Owl Lisp

Report syntax errors or treat input as identifiers:  Bigloo, Scheme48/scsh, TinyScheme, Dream, RScheme, BDC, XLisp, Rep, Schemik, Elk, Sizzle, FemtoLisp, Emacs Lisp

Inputs are treated as as special lexical syntax, not as numbers: Llava

