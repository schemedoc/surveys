# Definitions in cond clauses

The two expressions were evaluated:

```
A: (cond (#t (define x 7) x))
B: (cond (else (define y 7) y))
```

Then we evaluated `x` and `y`.

| System      | A     | x     | B         | y         |
|-------------|-------|-------|-----------|-----------|
| Bigloo      | 7     | x     | 7         | 7         |
| Biwa        | 7     | 7     | 7         | 7         |
| Chez        | error | error | 7         | 7         |
| Chibi       | error | error | 7         | 7         |
| Chicken     | 7     | 7     | 7         | 7         |
| Cyclone     | 7     | error | 7         | error     |
| Gambit      | error | error | error     | error     |
| Gauche      | 7     | 7     | 7         | 7         |
| Guile       | 7     | error | 7         | error     |
| Kawa        | 7     | error | 7         | 7         |
| LIPS        | 7     | 7     | 7         | 7         |
| Loko        | error | error | error     | error     |
| MIT         | error | error | error     | error     |
| Racket      | 7     | error | 7         | error     |
| Sagittarius | 7     | 7     | 7         | 7         |
| Scheme48    | error | error | 7         | 7         |
| Scheme 9    | error | error | 7         | 7         |
| SCM         | 7     | 7     | 7         | 7         |
| STklos      | 7     | 7     | 7         | 7         |
| Tinyscheme  | 7     | 7     | 7         | 7         |
