# Redefining special forms

## Experiment

We first try to redefine `define` as `set!`, as if it were a symbol:

```
(define define set!)

(define x 1)

x => ?
```

The idea is to try to set it to *another macro*, not just to another value.

Now we try again, but properly as a macro:

```
(define-syntax define
  (syntax-rules ()
    ((define a b)
     (set! a b))))

(define x 1)

x => ?
```

## Results

Since `x` was unbound, if `define` is changed to mean `set!` then `(define x 1)`
should complain about `x` not being bound.

| system | redefine define | (define x 1) | define-macro define | (define x 1) |
|---|---|---|---|---|
|Bigloo     | set! unbound |           | warning | x unbound |
|Biwa       | error        |           | ok      | ignores macro and DEFINEs x |
|Chibi      | error        |           | ok      | x unbound |
|Chicken    | error        |           | ok      | ignores macro and DEFINEs x |
|Chez       | error        |           | ok      | ignores macro and DEFINEs x |
|Cyclone    | set! unbound |           | ok      | ignores macro and DEFINEs x |
|Gambit     | error        |           | ok      | x unbound |
|Gauche     | ok           | x unbound | ok      | x unbound |
|Guile      | error        |           | ok      | x unbound |
|Kawa       | ok           | x unbound | ok      | x unbound |
|LIPS       | ok           | x unbound | ok      | x unbound |
|Loko       | error        |           | ok      | ignores macro and DEFINEs x |
|MIT        | error        |           | ok      | x unbound |
|Peroxide   | set! unbound |           | ok      | x unbound |
|Racket     | error        |           | ok      | x unbound |
|Sagittarius| set! unbound |           | ok      | x unbound |
|Scheme 48  | set! unbound |           | error   |           |
|Scheme 9   | set! unbound |           | ok      | ignores macro and DEFINEs x |
|STklos     | set! unbound |           | ok      | x unbound |
|Unsyntax   | error        |           | ok      | ignores macro and DEFINEs x |

Biwa doesn't have `syntax-rules`, so `define-macro` was used.

## Other Lisps (redefining special form to value, not to another special form)

Interestingly, only some Common Lisp implementations allow
redefining the function value of the symbol `DEFUN`.
For example, this is Clisp:

```
[9]> (setf (fdefinition 'defun) #'+)
#<SYSTEM-FUNCTION +>
[10]> (defun 2 3)
5
```

|system | result |
|---|---|
|ABCL  | allows |
|CLASP | allows |
|Clisp | allows |
|CCL   | allows (asks to ignore lock) |
|ECL   | allows (asks to ignore lock) |
|GCL   | no |
|SBCL  | asks to ignore lock, says everything went OK, but doesn't do it |


Emacs Lisp allows it:

```
ELTR version 0.0.3.
Emacs version 29.0.50 -- c9cb59bc4f68d6050451bc0a619fd3eb6a6ed554,
built 2021-12-10 13:14:21 on socrates.
It will be a nice day. I can feel it!
1> (fset 'defun #'+)
;; (fset 'defun #'+)
1=> +
                       ( symbol )
2> (defun 2 3)
;; (defun 2 3)
2=> 5
  ( ?\C-e #x5 #b101 #o5 )
                       ( integer )
```

