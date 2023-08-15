# Is `abs` the same as complex norm?

What is the result of `(abs -3-4i)`?

Some systems will complain that the argument is not real; some will
compute the complex norm; and some will make some other decision, such
as return the argument unchanged or take the absolute value of the
real part only.

| System      | result       | remark           |
|-------------|--------------|------------------|
| Bigloo      | no complexes |                  |
| Biwa        | no complexes |                  |
| Chez        | error        |                  |
| Chibi       | -3-4i        | leaves unchanged |
| Chicken     | error        |                  |
| Cyclone     | 3.0          | abs of real part |
| Gambit      | error        |                  |
| Gauche      | 5.0          |                  |
| Guile       | error        |                  |
| Kawa        | 5.0          |                  |
| LIPS        | error        |                  |
| MIT         | error        |                  |
| Racket      | error        |                  |
| Sagittarius | 5            | keeps exactness  |
| STklos      | error        |                  |
| Unsyntax    | -3-4i        | leaves unchanged |
|             |              |                  |
| ABCL        | 5.0          |                  |
| CCL         | 5            | keeps exactness  |
| Clisp       | 5            | keeps exactness  |
| ECL         | 5.0          |                  |
| GCL         | 5.0          |                  |
| SBCL        | 5.0          |                  |
