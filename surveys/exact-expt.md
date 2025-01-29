# Exact expt

## Exact rational base

This tests whether exponentiation of exact numbers produces an exact result.
The test expression was `(expt 1/3 3)`, except on systems without exact rationals, where `(expt 3 3)` was substituted.


| System      | `(expt 1/3 3)`        | `(expt 3 3)` |
|-------------|-----------------------|--------------|
| Bigloo      |                       | 27           |
| Biwa        |                       | 27           |
| Chez        | 1/27                  |              |
| Chibi       | 1/27                  |              |
| Chicken     | 1/27                  |              |
| Elk         |                       | 27           |
| Gambit      | 1/27                  |              |
| Gauche      | 1/27                  |              |
| Guile       | 1/27                  |              |
| Kawa        | 1/27                  |              |
| LIPS        | 1/27                  |              |
| Loko        | 1/27                  |              |
| MIT         | 1/27                  |              |
| Racket      | 1/27                  |              |
| Sagittarius | 1/27                  |              |
| Scheme48    | 1/27                  |              |
| Scheme9     |                       | 27           |
| SCM         | 3.7037037037037035e-2 |              |
| STklos      | 1/27                  |              |
| Tinyscheme  |                       | 27           |


## Exact rational exponent

What happens when the exponent is an exact rational, the base is exact, and it *would* be possible to return an exact result?

The following expression was evaluated:

```
(expt 81 1/4)
```

Implementations that do not support rationals are not included.
Some Common Lisp systems were also checked, for comparison.

| system      | `(expt 81 1/4)`    |
|-------------|--------------------|
| Chez        | 3.0                |
| Chibi       | 3.0                |
| Chicken     | 3                  |
| Gambit      | 3                  |
| Gauche      | 3                  |
| Guile       | 3.0                |
| Kawa        | 3.0                |
| LIPS        | 3                  |
| Loko        | 3.000000238418579  |
| MIT         | 3.0                |
| Racket      | 3.0                |
| Sagittarius | 3.0                |
| Scheme48    | 3.0000000000000004 |
| SCM         | 3.0                |
| STklos      | 3.0000000000000004 |
|-------------|--------------------|
| ABCL        | 3.0                |
| CCL         | 3.0                |
| Clisp       | 3                  |
| ECL         | 3.0                |
| GCL         | 3.0000000000000006 |
| SBCL        | 3.0                |

* The systems with result `3.0` in the first column are those where `(= 3.0 (expt 81 1/4))` is true.
  In the other systems, which do not return the precise `3.0` floating-point representation, the
  returned value indicates at least one digit where it differs from 3.0.

* The test  `(= 3.0 (expt 81 1/4))` was necessary, since we do not know if `3.0` actually means a
  precise representation of the number. For example, STklos will answer `3.0`, but after changing
  the default print precision with `(real-precision 50)`, it will show that the number is not
  the same as `3.0`.

