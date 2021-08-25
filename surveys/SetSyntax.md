# Set syntax

* define a macro `g`
* define a local macro `f` that uses `g`
* `set!` the identifier `g` to a procedure
* use the macro `f`

Will the system expand `f` using the macro `g`, the procedure
`g`, or will it signal an error?

```scheme
(define-syntax g
  (syntax-rules ()
    ((g 2) -3)))

(let-syntax ((f (syntax-rules ()
                  ((f 1) (g 2)))))
  (set! g (lambda (x) -1000))
  (f 1))
```

* These allow the redefinition, returning -3:
  Chicken, Gauche, Cyclone

* Kawa complains, saying identifiers bound to macros are immutable

* These complain about the `set!` not being correct:
  Chibi, Guile, Gambit, MIT, Loko, Chez, Sagittarius, Unsyntax

* Bigloo acts as if we were trying to set! an undefined variable (which is also true!)

* STklos' behavior is different - it complains about not being able to match a clause
when expanding the macro (g was registered as a macro, and we set it to a procedure
that does not do clause matching).
