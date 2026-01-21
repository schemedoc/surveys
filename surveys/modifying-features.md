
R7RS says it is an error to try to modify the list returned by `(features)`.

After `(set-car! (features) 10)` (if didn't signal an error) the value of `(features)` is:

| Implementation | result          | remark                               |
|----------------|-----------------|--------------------------------------|
| Bigloo         | no `(features)` |                                      |
| Biwa           | no `(features)` |                                      |
| Chez           | no `(features)` |                                      |
| Chibi          | 10              |                                      |
| Chicken        | no `(features)` |                                      |
| Cyclone        | unchanged       | `set-car!` returns the list modified |
| Gambit         | error           |                                      |
| Gauche         | unchanged       | need to start with `-r7` flag        |
| Guile          | no `(features)` |                                      |
| Kawa           | error           |                                      |
| LIPS           | 10              |                                      |
| Loko           | no `(features)` |                                      |
| MIT            | unchanged       |                                      |
| Sagittarius    | no `(features)` |                                      |
| STklos         | unchanged       |                                      |
| TR7            | unchanged       | `set-car!` returns the list modified |
| Unsyntax       | 10              |                                      |
