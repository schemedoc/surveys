# Definitions in cond clauses

The two expressions were evaluated:

```
A: (cond (#t (define x 7) x))
B: (cond (else (define x 7) x))
```

| System      | A     | B         |
|-------------|-------|-----------|
| Bigloo      | 7     | 7         |
| Biwa        | 7     | 7         |
| Chez        | error | 7         |
| Chibi       | error | 7         |
| Chicken     | 7     | 7         |
| Cyclone     | 7     | 7         |
| Gambit      | error | error     |
| Gauche      | 7     | 7         |
| Guile       | 7     | 7         |
| Kawa        | 7     | 7         |
| LIPS        | 7     | error (*) |
| Loko        | error | error     |
| MIT         | error | 7         |
| Racket      | 7     | 7         |
| Sagittarius | 7     | 7         |
| Scheme48    | error | 7         |
| Scheme 9    | error | 7         |
| SCM         | 7     | 7         |
| STklos      | 7     | 7         |
| Tinyscheme  | 7     | 7         |

    
* LIPS does not recognise the 'else' clause.
