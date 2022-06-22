# Syntax definitions - to infinity and beyond

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
| Peroxide    | Maximum macro expansion depth reached |
| Racket      | enters infinite loop |
| Sagittarius | enters infinite loop |
| Scheme48    | GC reports insufficient memory |
| Scheme9     | too many levels of macro expansion |
| STklos      | enters infinite loop |
| Unsyntax    | enters infinite loop |
| Ypsilon     | enters infinite loop |
