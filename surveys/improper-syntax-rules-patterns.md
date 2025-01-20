# Improper syntax-rules patterns

What happens when we define the following syntax:

```
(define-syntax f
  (syntax-rules ()
    ((f a ... x . y)
     (begin (begin (write a) (display " ")
                   (write x) (display " ")
                   (write y) (display " ")
                   (newline)) ...))))
```
And try to evaluate `(f 10 20 30 'a 'b)`?

Three results are possible:
1. The system does not accept the definition;
2. The definition is accepted, but evaluating `(f 10 20 30 'a 'b)` triggers an error, since the definition required an improper list, and a proper list was passed;
3. The system accepts the definition and, when evaluating `(f 10 20 30 'a 'b)`, treats it as it it were `(f 10 20 30 'a 'b . ())` and the result is:
```
10 b () 
20 b () 
30 b () 
a b () 
```

| System      | result                          |
|-------------|---------------------------------|
| Bigloo      | error while *expanding*         |
| Chez        | error while *expanding*         |
| Chibi       | error while *expanding*         |
| Chicken     | error when *defining* the macro |
| Cyclone     | error when *defining* the macro |
| Gambit      | error when *defining* the macro |
| Gauche      | accepts                         |
| Guile       | error while *expanding*         |
| Kawa        | accepts                         |
| LIPS        | accepts                         |
| Loko        | error while *expanding*         |
| MIT         | accepts                         |
| Racket      | error while *expanding*         |
| Sagittarius | accepts                         |
| Scheme9     | error while *expanding*         |
| STklos      | error while *expanding*         |
| Unsyntax    | error while *expanding*         |
| Ypsilon     | error while *expanding*         |
