# Log and sqrt require floating point?

Does `log` or `sqrt` need to be computed using floating-point representation?
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

A third test:
```scheme
(define S (+ (expt 2 2030) 111111111111111111111111117))
(sqrt S)
```

|System      | (log (expt 2 200)) | (log (expt 2 200)) | (sqrt S) |
|------------|--------------------|---|---|
|Bigloo      | -inf.0             | -inf.0             | 10540925533894.598 |
|Biwa        | +inf.0             | 138.62943611198907 | +inf.0 |
|Chez        | 5710.411030625233  | 138.62943611198907 | 3.511119404027961e305 |
|Chibi       | +inf.0             | 138.62943611198907 | 3.511119404027961e+305 |
|Chicken     | +inf.0             | 138.62943611198907 | +inf.0 |
|Cyclone     | +inf.0             | 138.62943611198907 | +inf.0 |
|Foment      | +inf.0             | 138.62943611198907 | error |
|Gambit      | 5710.411030625233  | 138.62943611198907 | 3.511119404027961e305 |
|Gauche      | 5710.411030625233  | 138.62943611198907 | +inf.0 |
|Guile       | 5710.411030625233  | 138.62943611198907 | 3.511119404027961e305 |
|Kawa        | +inf.0             | 138.62943611198907 | +inf.0 |
|LIPS        | +inf.0             | 138.62943611198907 | +inf.0 |
|Loko        | +inf.0             | +inf.0             | +inf.0 |
|MIT         | +inf.0             | 138.62943611198907 | error |
|Racket      | 5710.411030625233  | 138.62943611198907 | 3.511119404027961e+305
|Sagittarius | 5710.411030625233  | 138.62943611198907 | +inf.0 |
|Scheme 9    | 5710.411030625213  | 138.629436111989054| 3.51111940402796075e+305 |
|STklos      | +inf.0             | +inf.0             | +inf.0 |
|Tinyscheme  | +inf.0             | 138.6294361        | +inf.0 |
|Unsyntax    | +inf.0             | 138.6294361        | 3.511119404027961e+305 |
|Ypsilon     | 5710.411030625233  | 138.62943611198907 | +inf.0 |
|            |          |           |
| ABCL       | error    | 138.62944 | error (argument too large to fit single float) |
| CCL        | 5710.411 | 138.62943 | overflow |
| Clisp      | 5710.411 | 138.62943 | overflow |
| CMUCL      | 5710.411 | 138.62943 | overflow |
| ECL        | 5710.411 | 138.62943 | overflow |
| GCL        | error    | 138.62943611198907 | error |
| SBCL       | 5710.411 | 138.62943 | overflow |
|            |          |
|Emacs Lisp  | 1.0e+INF | 138.62943611198907 | 1.0e+INF |

* Biwa and Tinyscheme already compute `x` as the inexact infinity `+inf.0`.
* Bigloo computes `(expt 2 2030)` as zero

Another experiment:

```
(log 1/6319748715279270675921934218987893281199411530039296)
```
Should return -119.27551918982401. (This was posted to the ECL mailing list on 2022-Jul-03 -- ECL does not compute the value, and complains about the user requesting log of zero).

* Cyclone needs the number to be given as explicit division (doesn't support rationals), and returns `-inf.0`
* Loko returns `-inf.0`
* Tinyscheme needs the number to be given as explicit division (doesn't support rationals), and returns `-43.66827238`

All others return the correct result; Bigloo and Scheme9 need the rational to be described as division, not as rational type.
