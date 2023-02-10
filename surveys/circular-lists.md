# Circular lists -- how they're dealt with

After

```
(define a (list 10 20 30))
(set-cdr! (cddr a) (cdr a))
```
what happens if I do `(length a)` and `(map - a)` ?

We have specifically built a circular *sublist*, so as to make
it harder to detect circularity (it doesn't suffice to check for
links to the head).

| sysyem   | (length a) | (map - a) |
|---|---|---|
| Bigloo   | loop  | loop |
| Biwa     | error | error |
| Chez     | error | error |
| Chibi    | error | loop |
| Chicken  | error | loop |
| Cyclone  | loop  | loop |
| Foment   | error | error, exit system |
| Gambit   | loop  | loop |
| Gauche   | error | loop |
| Guile    | error | error |
| Kawa     | 2147483647 | loop |
| LIPS     | 2 | error |
| Loko     | stack overflow | stack overflow |
| MIT      | error | out of memory |
| Sagittarius | -2 | loop |
| Scheme48 | loop  | heap overflow |
| Scheme9  | loop  | loop |
| SCM      | error | loop |
| STklos   | loop  | loop |
| Unsyntax | error | loop |
| Ypsilon  | error | error |
