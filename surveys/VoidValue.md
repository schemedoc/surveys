# Void value

Does the implementation have `(void)` or `(undefined)`? What about
lexical syntax for void values?

Since not all implementations display anything for a top-level void
value, try `(list (void))` or `(list (undefined))` to ensure the value
is displayed.

| Implementation | Procedure     | Syntax           |
| -------------- | ------------- | ---------------- |
| Chez Scheme    | `(void)`      | `#<void>`        |
| Chibi-Scheme   | N/A           | N/A              |
| Chicken        | `(void)`      | `#<unspecified>` |
| Cyclone        | N/A           | N/A              |
| Gambit         | `(void)`      | `#!void`         |
| Gauche         | N/A           | N/A              |
| Kawa           | N/A           | `#!void`         |
| Mosh           | N/A           | N/A              |
| Owl Lisp       | N/A           | N/A              |
| Racket         | `(void)`      | `#<void>`        |
| s7             | N/A           | N/A              |
| Sagittarius    | `(undefined)` | `#<unspecified>` |
| STklos         | `(void)`      | `#void`          |
| TinyScheme     | N/A           | N/A              |
