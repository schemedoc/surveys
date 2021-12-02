# Reader: Vertical Bar Concatenated With Number

What does the implementation understand when `|1|1` or `|a|b|c|` is given to
its reader?

|system      | `|1|1` | `|a|b|c|` |
|---|---|---|
|Bigloo      | symbol `1` followed by number `1` | three symbols, `a`, `b`, `c` |
|Biwa        | symbol `|1|1` | symbol `|a|b|c|` |
|Chibi       | symbol `1` followed by number `1` | symbol `a` and symbol `b|c|` |
|Chicken     | symbol `11` | symbol `abc` |
|Chez        | symbol `11` | symbol `abc` |
|Cyclone     | symbol `1` followed by number `1` | symbol `a` and symbol `b|c|` |
|Gambit      | symbol `1` followed by number `1` | three symbols, `a`, `b`, `c` |
|Gauche      | symbol `1` followed by number `1` | three symbols, `a`, `b`, `c` |
|Guile       | symbol `|1|1` | symbol `|a|b|c|`
|Kawa        | symbol `11`   | symbol `abc` |
|LIPS        | reader gets confused | symbol `a|b|c` |
|Loko        | symbol `1` followed by number `1` | three symbols, `a`, `b`, `c` |
|MIT         | symbol `1` followed by number `1` | symbol `a` and symbol `b|c|` |
|Peroxide    | symbol `|1|1` | symbol `|a|b|c|` |
|Racket      | symbol `11` | symbol `abc` |
|Sagittarius | symbol `1` followed by number `1` | symbol `a` and symbol `b|c|` |
|STklos      | symbol `11` | symbol `abc` |
|Unsyntax    | symbol `1` followed by number `1` | symbol `a` and symbol `b|c|` |


|system      | `|1|1` | `|a|b|c|` |
|---|---|---|
|Clojure     | symbol `|1|1` | symbol `|a|b|c|` |
|Common Lisp | symbol `11`   | symbol `aBc`     |
|Emacs Lisp  | symbol `|1|1` | symbol `|a|b|c|` |
