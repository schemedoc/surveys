# Log requires floating point?

Does `log` need to be computed using floating-point representation?
This excludes the larger part of bignums.

This is a test:

```scheme
(define x (expt 10 2480))
(log x)
```

If the implementation wants to answer `(log x)` with the correct
number, the logarithm must be calculated without the floating-point 
C library log function, since the number is far too large to fit 
in current days 64-bit doubles.

Another interesting test is this -- what if we have a bignum that *does* fit a double?

```scheme
(define x (expt 2 200))
(log x)
```

|System      | (log (expt 2 200)) | (log (expt 2 200)) |
|------------|--------------------|---|
|Bigloo      | -inf.0             | -inf.0             |
|Biwa        | +inf.0             | 138.62943611198907 |
|Chez        | 5710.411030625233  | 138.62943611198907 |
|Chibi       | +inf.0             | 138.62943611198907 |
|Chicken     | +inf.0             | 138.62943611198907 |
|Cyclone     | +inf.0             | 138.62943611198907 |
|Foment      | +inf.0             | 138.62943611198907 |
|Gambit      | 5710.411030625233  | 138.62943611198907 |
|Gauche      | 5710.411030625233  | 138.62943611198907 |
|Guile       | 5710.411030625233  | 138.62943611198907 |
|Kawa        | +inf.0             | 138.62943611198907 |
|LIPS        | +inf.0             | 138.62943611198907 |
|Loko        | +inf.0             | +inf.0             |
|MIT         | +inf.0             | 138.62943611198907 |
|Racket      | 5710.411030625233  | 138.62943611198907 |
|Sagittarius | 5710.411030625233  | 138.62943611198907 |
|Scheme 9    | 5710.411030625213  | 138.629436111989054|
|STklos      | +inf.0             | +inf.0             |
|Tinyscheme  | +inf.0             | 138.6294361        |
|Unsyntax    | +inf.0             | 138.6294361        |
|Ypsilon     | 5710.411030625233  | 138.62943611198907 |
|            |          |           |
| ABCL       | error    | 138.62944 |
| CCL        | 5710.411 | 138.62943 |
| Clisp      | 5710.411 | 138.62943 |
| CMUCL      | 5710.411 | 138.62943 |
| ECL        | 5710.411 | 138.62943 |
| SBCL       | 5710.411 | 138.62943 |
|            |          |
|Emacs Lisp  | 1.0e+INF | 138.62943611198907 |


* Biwa and Tinyscheme already compute `x` as the inexact infinity `+inf.0`.


Another experiment:

```
(log 1/6319748715279270675921934218987893281199411530039296)
```
Should return -119.27551918982401. (This was posted to the ECL mailing list on 2022-Jul-03 -- ECL does not compute the value, and complains about the user requesting log of zero).

* Cyclone needs the number to be given as explicit division (doesn't support rationals), and returns `-inf.0`
* Loko returns `-inf.0`
* Tinyscheme needs the number to be given as explicit division (doesn't support rationals), and returns `-43.66827238`

All others return the correct result; Bigloo and Scheme9 need the rational to be described as division, not as rational type.
