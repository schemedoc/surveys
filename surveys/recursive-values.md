# Recursive values

The `let-values` form will return a list if given a single
variable for binding. I have tried the following code in several Schemes:


```
(let-values ((x (values 1 2 (values 3 4))))
  x)
```

Most systems will eval `(values 3 4)` and return 3, so
the end result will be `(1 2 3)`. However, some of them
will complain about arity mismatch and some will give
different results.

| sysyem | outcome |
|---|---|
Chez        | error (single value expected) |
Chibi       | `(1 2 ((values) 3 4))` |
Chicken     | `(1 2 3)` |
Gambit      | `(1 2 #<unknown>)` |
Gauche      | `(1 2 3)` |
Guile       | `(1 2 3)` |
Kawa        | `(1 2 3 4)` |
Loko        | `(1 2 3)` |
MIT         | `;Value: (1 2 #[multi-values 12])`
Racket      | error: result arity mismatch |
Sagittarius | `(1 2 3)` |
Scheme48    | error (wrong number of values) |
STklos      | `(1 2 3)` |
Unsyntax    | `(1 2 ((values) 3 4))` |

* Guile and Racket need SRFI 11 to be loaded first.
