# Log requires floating point?

Does `log` need to be computed using floating-point representation?
This excludes the larger part of bignums.

This is a test:

```
(define x (expt 10 2480))
(log x)
```

If the implementation wants to answer `(log x)` with the correct
number, the logarithm must be calculated without the floating-point 
C library log function, since the number is far too large to fit 
in current days 64-bit doubles.

|System      | result |
|------------|--------|
|Bigloo      | -inf.0 |
|Biwa        | +inf.0 |
|Chez        | 5710.411030625233 |
|Chibi       | +inf.0 |
|Chicken     | +inf.0 |
|Cyclone     | +inf.0 |
|Foment      | +inf.0 |
|Gambit      | 5710.411030625233 |
|Gauche      | 5710.411030625233 |
|Guile       | 5710.411030625233 |
|Kawa        | +inf.0 |
|LIPS        | +inf.0 |
|Loko        | +inf.0 |
|MIT         | +inf.0 |
|Racket      | 5710.411030625233 |
|Sagittarius | 5710.411030625233 |
|Scheme 9    | 5710.41103062521399 |
|STklos      | +inf.0 |
|Tinyscheme  | +inf.0 |
|Unsyntax    | +inf.0 |
|Ypsilon     | 5710.411030625233
|            |          |
|Common Lisp | 5710.411 |
|Emacs Lisp  | 1.0e+INF |


* Biwa and Tinyscheme already compute `x` as the inexact infinity `+inf.0`.
* The Common Lisp standard requires that the implementations compute this answer correctly.
