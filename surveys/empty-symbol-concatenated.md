# Empty symbol concatenated

What does the reader do with `symbol-name||`?

```Scheme
some-scheme> (define name "the value")
some-scheme> name||
```

* Treats the whole sequence as a single symbol `name||`:
Biwa, Chibi, Guile, MIT, Sagittarius, Tinyscheme, Unsyntax

* Concatenate `name` with `||` and returns the value of `name`:
Chicken, Chez, Loko, Kawa, Racket, STklos, LIPS

* Read the sequence as if there were a space between `name` and `||`:
Bigloo, Gambit, Gauche
