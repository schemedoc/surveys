# Syntax Mutation

Can we change a variable from a transformer into a procedure?

R7RS explains that `(define <variable> <expression>)` is the same as
`(set! <variable> <expression>)`
*if `<variable>` is bound to a non-syntax value* -- but if `<variable>`
is a syntactic keyword, then the definition would bind `<variable>`
to a new location.

We tested:

1. re-defining a macro (which should work, according ot the standard),
2. `define-syntax` on a name, and later using `set!` to change it into a procedure
   (not specified by R7RS).

Some of the tested systems do not aim at R7RS compliance, but it is interesting 
to see the results nevertheless.

## 1. re-defining a macro

```
(define-syntax f
  (syntax-rules ()
    ((_) -1)))

(define (f) -2)

(display (f))
(newline)
```

|system  | REPL | batch/compiled |
|--------|---|---|
|Bigloo  | -1 |    |
|Chibi   | -2 | -2 |
|Chicken | -1 | -2 |
|Chez    | -2 | -2 |
|Cyclone | -2 | -1 |
|Gambit  | -1 (error on `define`) | error on `define` |
|Gauche  | -2 | -2 |
|Guile   | -2 | -2 |
|Kawa    | -2 |  ? |
|LIPS    | -2 |    |
|Loko    | -2 |    |
|MIT     | -2 | error (Variable reference to a syntactic keyword) |
|Peroxide| -2 | |
|Racket  | -2 |    |
|Sagittarius | -2 | -2 |
|Scheme48| -2 |    |
|STklos  | -1 | -1 |
|scheme9 | -1 |    |
|Unsyntax| -2 | duplicate definition of identifier |
|Ypsilon | -2 |    |

The same program was translated into Elisp, Common Lisp and Clojure:

|system|result|
|---|---|
|elisp| -2 |
|Clojure| -2 |
|Common Lisp| -2 |

## 2. re-setting a macro to a value

```
(define-syntax f
  (syntax-rules ()
    ((_) -1)))

(define (change-f)
  (set! f (lambda () -2)))

(display (f))
(newline)
```

|system | REPL | batch/compiled |
|-------|-------------|----------|
|Bigloo | Unbound variable |  |
|Chez   | invalid syntax | |
|Chibi  | invalid use of syntax |  |
|Cyclone| -2          | Error: Unbound variable |
|Chicken| -1          | -2 |
|Gambit | Macro name can't be used as a variable: `f` | Macro name can't be used as a variable: `f`|
|Gauche | -2          | -2 |
|Guile  | `set!` - not a transformer | `set!` - not a transformer |
|Kawa   | error - constant variable f is set!          | unexpected exception while compiling: `java.lang.NullPointerException` |
|LIPS   | -2 | n/a |
|Loko   | invalid syntax | |
|MIT    | Variable required | |
|Peroxide| cannot set non-variable `f` | |
|Racket | set!: cannot mutate syntax identifier | |
|Sagittarius | syntax error | n/a |
|Scheme48| -1 (after warning: invalid assignment) | |
|STklos | -1  (after error: variable 'f' unbound)        | error ('f' unbound) |
|Scheme9   | -1          | n/a |
|Unsyntax| -1 (after error: not a variable transformer '`f`') | |
|Ypsilon | error in set!: misplaced syntactic keyword as variable | |

The same program was translated into Elisp, Common Lisp and Clojure:

|system|result|
|---|---|
|elisp| -1 |
|Clojure| -2 |
|Common Lisp| -2 |

(In Common Lisp, the function value of `f` was changed with `(setf (symbol-function 'f) (lambda () -2))`

`n/a` = no compiler, or no difference between "compiled" and "running from the REPL".
