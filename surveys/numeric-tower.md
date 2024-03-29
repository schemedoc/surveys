# Numeric tower

This is an analysis of the R5RS provision that the full numeric tower may be subsetted.  In this analysis, four boolean feature settings characterize different kinds of numeric towers: `exactness-preserving`, `ratios`, `inexact`, and `complex`.  These refer respectively to the closure of exact numbers under rational operations (except `/`), exact non-integer values, inexact rationals, and non-real numbers.

There are therefore 16 possible numeric towers.  9 of them are known to have implementations, as shown below.  I write `+` if a feature is present and `-` if it is absent, and give a general description of the resulting tower and some Scheme implementations that provide it.

|`exactness-preserving`|`ratios`|`inexact`|`complex`|Description|Implementations|
|----------|------|-------|-------|-----------|---------------|
|-|-|-|-|Bounded exact integers only|!SigScheme†, MiniScheme†|
|-|-|+|-|Fixnums and flonums|Plain Chicken 4, Shoe†, TinyScheme†, RScheme, JScheme†, SIOD, BDC†, XLisp†, Schemik†, VX, SXM†, Inlab, Llava, Sixx, Picrin†, Sizzle, Dfsch†, Stalin (also Elisp†, C†)|
|-|+|+|+|Limited-range exact and inexact numbers|S7, Wraith|
|+|-|+|-|Exact integers and inexact real numbers|Bigloo, Scheme 9, Unlikely Scheme††, Elk (also ISLisp)|
|+|-|+|+|Exact integers, inexact real numbers, and complex numbers|SCM, Cyclone|
|+|+|-|-|Exact rational numbers only|Dream, Oaklisp
|+|+|-|+|Exact numbers only|Owl Lisp
|+|+|+|-|Real numbers only|Psyche, Ikarus, Rep, Dfsch (also Clojure)|
|+|+|+|+|Full numeric tower|Racket, Gauche, MIT, Gambit, Chicken 4 with the `numbers` egg, Chicken 5, Scheme48/scsh, Kawa, SISC, Chibi, Guile, Chez, Vicare, Larceny, Ypsilon, Mosh, IronScheme, STklos, KSi, UMB, Spark, Sagittarius (also R6RS, Common Lisp, Pure)|

†These systems are technically exactness-preserving, but silently return the wrong answers when their arithmetic operations overflow.  This makes them non-conformant.

††This system provides ratios, but they are so buggy as to be useless:  `(/ 1 3)` => 3/7.

NexJ's numeric tower is undocumented and behaves inconsistently in any case:  applying `expt` to two fixnums, for example, returns a bignum, but adding them returns a potentially incorrect fixnum.  Basically it does what Java does.

## See also

See also: [Complex representations](../complex-representations/) for information on which Schemes support exact, inexact, and mixed-exactness complex numbers.

See also: [Float precision](../float-precision/) for information on the different precisions of inexact numbers that some Schemes support.
