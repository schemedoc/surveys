# Default values for make-list, make-vector, make-string, make-bytevector

What is the result of the following expressions?

```
(list-ref          (make-list 1)       0)
(string-ref        (make-string 1)     0)
(vector-ref        (make-vector 1)     0)
(bytevector-u8-ref (make-bytevector 1) 0)
```

Surprisingly, some of the values are random (which is perfectly fine
according to the standards).

| System      | list           | string    | vector           | bytevector                      |
|-------------|----------------|-----------|------------------|---------------------------------|
| Bigloo      | `#unspecified` | `#\space` | `#unspecified`   |                                 |
| Biwa        |                | `#\space` | `(unspecified)`  |                                 |
| Chez        | `#<void>`      | `#\nul`   | `0`              | random, but most often zero (?) |
| Chibi       | `#<undef>`     | `#\space` | `#<undef>`       | `0`                             |
| Cyclone     | `#f`           | `#\space` | `#f`             | random!                         |
| Gambit      | `0`            | `#\null`  | `0`              | `0`                             |
| Gauche      | `#f`           | `#\space` | `#<undef>`       |                                 |
| Chicken     |                | `#\space` | `#<unspecified>` |                                 |
| Guile       | `'()`          | `#\nul`   | `#<unspecified>` |                                 |
| Kawa        | `#!null`       | `#\space` | `#!null`         | `0`                             |
| LIPS        | `#void`        | `#\space` | `#void`          | `0`                             |
| Loko        |                | `#\nul`   | `0`              | `0`                             |
| MIT         | `#!default`    | `#\null`  | `#f`             | `0`                             |
| Racket      |                | `#\nul`   | `0`              |                                 |
| Sagittarius |                | `#\space` | `#<unspecified>` | `0`                             |
| Scheme48    |                | `#\?`     | `#{Unspecific}`  |                                 |
| SCM         |                | random!   | `#<unspecified>` |                                 |
| STklos      | `#void`        | `0`       | `#void`          | `0`                             |
| TinyScheme  |                | `#\space` | `'()`            |                                 |
| Unsyntax    | `#<undef>`     | `#\space` | `#<undef>`       | `0`                             |
| Ypsilon     | `#f`           | `#\space` | `#<unspecified>` | `0`                             |
|             |                |           |                  |                                 |
| ABCL        | `NIL`          | `#\Null`  | `NIL`            |                                 |
| CCL         | `NIL`          | `#\Null`  | `0`              |                                 |
| Clisp       | `NIL`          | `#\Null`  | `NIL`            |                                 |
| CMUCL       | `NIL`          | `#\Null`  | `0`              |                                 |
| ECL         | `NIL`          | `#\space` | `NIL`            |                                 |
| GCL         | `NIL`          | `#\space` | `NIL`            |                                 |
| SBCL        | `NIL`          | `#\Null`  | `0`              |                                 |
