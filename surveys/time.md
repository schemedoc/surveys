# Convenience `time` macro

Most Lisps have a `time` macro that measures the execution time of
code.

| Implementation | Method | Procedure or Syntax | Remark |
|---|---|---|---|
| Bigloo   | `time`       | procedure |
| Biwa     | n/a | | |
| Chibi    | `time`  | syntax | `(import (chibi time))` |
| Chicken  | `time`  | syntax | time and memory |
| Chez     | `time`  | syntax | time and memory |
| Cyclone  | n/a | | |
| Gambit   | `time`  | syntax | time and memory |
| Gauche   | `time`  | syntax | only times |
| Guile    | ? | | |
| Kawa     | ? | | |
| LIPS     | n/a | | |
| Loko     | `time` | syntax | time and memory |
| MIT      | `with-timings` | procedure | time only (\*) |
| Racket   | `time` | syntax | time and memory |
| Sagittarius | `time` | syntax | `(import (time)` - only times |
| Scheme 9 | n/a | | |
| STklos   | `time` | syntax | only times |
| Unsyntax | n/a | | |
| Ypsilon  | `time` | syntax | `(import (ypsilon time))` |


(*) An example from the MIT Scheme Reference Manual:
```scheme
          (with-timings
           (lambda () ... hairy computation ...)
           (lambda (run-time gc-time real-time)
             (write (internal-time/ticks->seconds run-time))
             (write-char #\space)
             (write (internal-time/ticks->seconds gc-time))
             (write-char #\space)
             (write (internal-time/ticks->seconds real-time))
             (newline)))
```

| System | Method | Procedure or Syntax |
|---|---|
| elisp | n/a |  |
| Common Lisp | `time` | syntax |
| Clojure | `time` | syntax |

