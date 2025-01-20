# Void value

Does the implementation have `(void)` or `(undefined)`? What about
lexical syntax for void values?

Since not all implementations display anything for a top-level void
value, try `(list (void))` or `(list (undefined))` to ensure the value
is displayed.

| Implementation | Procedure     | Read Syntax      | Write Syntax     |
| -------------- | ------------- | ---------------- | ---------------- |
| Chez Scheme    | `(void)`      | N/A              | `#<void>`        |
| Chibi-Scheme   | N/A           | N/A              | N/A              |
| Chicken        | `(void)`      | N/A              | `#<unspecified>` |
| Cyclone        | N/A           | N/A              | N/A              |
| Gambit         | `(void)`      | `#!void`         | `#!void`         |
| Gauche         | N/A           | N/A              | N/A              |
| Guile          | ?             | ?                | `#<unspecified>` |
| Kawa           | N/A           | `#!void`         | nothing written  |
| LIPS           | N/A           | `#void`          | `#void`          |
| MIT            | ?             | `#!unspecific`   | `#!unspecific`   |
| Mosh           | ?             | N/A              | `#<unspecified>` |
| Owl Lisp       | N/A           | N/A              | N/A              |
| Racket         | `(void)`      | N/A              | `#<void>`        |
| s7             | N/A           | N/A              | N/A              |
| Sagittarius    | `(undefined)` | N/A              | `#<unspecified>` |
| Scheme 9       | `(void)`      | N/A              | `#<unspecific>`  |
| STklos         | `(void)`      | `#void`          | `#void`          |
| TinyScheme     | N/A           | N/A              | N/A              |
