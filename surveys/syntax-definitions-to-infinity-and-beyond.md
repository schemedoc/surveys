What is the outcome of

```
(define-syntax f (syntax-rules () ((_) (f))))

(f)
```




| sysyem   | outcome |
|---|---|
| Bigloo      | segmentation violation (stack overflow? GC error when allocating?) |
| Chez        | enters infinite loop |
| Chibi       | enters infinite loop |
| Chicken     | enters infinite loop |
| Gambit      | enters infinite loop |
| Gauche      | enters infinite loop |
| Guile       | enters infinite loop |
| Kawa        | stack overflow |
| LIPS        | stack overflow |
| Loko        | enters infinite loop |
| MIT         | enters infinite loop |
| Racket      | enters infinite loop |
| Sagittarius | enters infinite loop |
| Scheme48    | GC reports insufficient memory |
| STklos      | enters infinite loop |
| Unsyntax    | enters infinite loop |
