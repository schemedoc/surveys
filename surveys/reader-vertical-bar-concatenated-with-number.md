# Reader: Vertical Bar Concatenated With Number

What does the implementation understand when `|1|1` is given to its reader?

|system      | result |
|---|---|
|Bigloo      | symbol `1` followed by number `1` |
|Biwa        | symbol `|1|1` |
|Chibi       | symbol `1` followed by number `1` |
|Chicken     | symbol `11` |
|Chez        | symbol `11` |
|Cyclone     | symbol `1` followed by number `1` |
|Gambit      | symbol `1` followed by number `1` |
|Gauche      | symbol `1` followed by number `1` |
|Guile       | symbol `|1|1` |
|Kawa        | symbol `11`   |
|LIPS        | reader gets confused |
|Loko        | symbol `1` followed by number `1` |
|MIT         | symbol `1` followed by number `1` |
|Peroxide    | symbol `|1|1` |
|Racket      | symbol `11` |
|Sagittarius | symbol `1` followed by number `1` |
|STklos      | symbol `11` |
|Unsyntax    | symbol `1` followed by number `1` |


|system      | result |
|---|---|
|Clojure     | symbol `|1|1` |
|Common Lisp | symbol `11` |
|Emacs Lisp  | symbol `|1|1` |
