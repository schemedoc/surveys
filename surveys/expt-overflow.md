# Overflow in `expt`

What is the result of `(expt 2 2305843009213693951)`?
The exponent is too large for the number to be computed, so the system may
detect it and report an error or try anyway and crash due to lack of memory.

| System      | result             | note                                               |
|-------------|--------------------|----------------------------------------------------|
| Bigloo      | +inf.0             |                                                    |
| Biwa        | +inf.0             |                                                    |
| Chez        | abort              |                                                    |
| Chibi       | loop (?)           |                                                    |
| Chicken     | loop (?)           |                                                    |
| Cyclone     | error (no crash)   | "Bad argument type"                                |
| Gambit      | uses up all memory |                                                    |
| Gauche      | error (no crash)   | complains about too large a number                 |
| Guile       | abort              |                                                    |
| Kawa        | +inf.0             |                                                    |
| LIPS        | error (no crash)   | complains about bigint being too large to allocate |
| Loko        | loop (?)           |                                                    |
| MIT         | error (no crash)   | complains about not having enough memory           |
| Racket      | error (no crash)   | complains about not having enough memory           |
| Sagittarius | crash              |                                                    |
| SCM         | error (no crash)   | complains about a bignum overflow                  |
| STklos      | crash              |                                                    |
| Unsyntax    | loop (?)           |                                                    |
| Ypsilon     | crash              |                                                    |


For comparison,

| System  | result   | type           | note                   |
|---------|----------|----------------|------------------------|
| ABCL    | error    | overflow       |                        |
| Clisp   | error    | overflow       |                        |
| CCL     | error    | overflow       |                        |
| ECL     | loop (?) |                |                        |
| GCL     | abort    |                |                        |
| SBCL    | error    | heap exhausted | "proceed with caution" |
|         |          |                |                        |
| Clojure | error    | overflow       |                        |
| elisp   | error    | overflow       |                        |
