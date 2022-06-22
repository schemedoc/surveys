# Self-referential macro

This is not the same as a recursive macro.

Define this:

```
(define-syntax f
  (syntax-rules () 
    ((f) f)))
```

Now what is the result of `(f)`? There are three possible results:

1. `f` is not bound (macros are only looked up when in CAR of the list
   being evaluated)
2. the value of `f`, "a macro" (the system knows it's a macro, and
   evaluates it)
3. wrong use of syntax (the system knows it's a macro, but won't
   evaluate the macro in non-call position)
  
When `syntax-rules` is implemented on top of `syntax-case`, the result
is likely to be (3).

|system| result|
|---|---|
|Bigloo  | 1 ("f unbound")    |
|Biwa    | 2 ("a macro")      |
|Chibi   | 3 ("syntax error") |
|Chicken | 1 ("f unbound")    |
|Chez    | 3 ("syntax error") |
|Cyclone | 2 ("a macro")      |
|Gambit  | 3 ("syntax error") |
|Gauche  | 2 ("a macro")      |
|Guile   | 3 ("syntax error") |
|Kawa    | 2 ("a macro")      |
|LIPS    | 2 ("a macro")      |
|Loko    | 3 ("syntax error") |
|MIT     | 3 ("syntax error") |
|Peroxide| 3 ("syntax error") |
|Sagittarius| 3 ("syntax error") |
|Scheme 48  | 1 ("f unbound")    |
|Scheme 9   | see below |
|STklos     | 1 ("f unbound")    |
|Unsyntax   | 3 ("syntax error") |

For Scheme 9 From Empty Space, we get:

```
> (define-syntax f
    (syntax-rules () 
      ((f) f)))
> (f)
*** error: undefined symbol: _
*** trace: alpha-conv form conv subst expand
```

It isn't useful to compare this to Common Lisp and Emacs Lisp (because
they are Lisp-2, and there is no way to reference the macro itself in
its expansion). But we can do that in Clojure:

```
Clojure 1.10.2
user=> (defmacro f [] f)
#'user/f
user=> (f)
#object[user$f 0x3ff57625 "user$f@3ff57625"]
```

It *seems* that it does return the macro, but checking its type
doesn't tell much:

```
user=> (type (f))
user$f
```
