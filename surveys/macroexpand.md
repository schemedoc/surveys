# Macroexpand

How can one expand a macro?

| Implementation | Method | Remark |
|---|---|---|
| Bigloo   | `expand`       | |
| Biwa     | `macroexpand`  | Biwa only supports low-level macros |
| Chibi    | `macroexpand`  | needed: `(import (chibi ast))` |
| Chicken  | `expand`       | |
| Chez     | `expand`       | |
| Cyclone  | ? | |
| Gambit   | `pp`           | not exactly a macro-expander? |
| Gauche   | `macroexpand`  | |
| Guile    | `macroexpand`  | |
| Kawa     | `expand`       | needed: `(require 'syntax-utils)` |
| LIPS     | `macroexpand`  | |
| Loko     | `expand` | |
| MIT      | ? | |
| Racket   | `expand` | |
| Sagittarius | ? | |
| Scheme 9 | `macro-expand` | |
| STklos   | `macro-expand` | |
| Unsyntax | ? | |
