# Boolean=?

The errata for R7RS-small explains that "the procedure `boolean=?` is
defined to return `#t` if the arguments are all booleans and are
either all `#t` or all `#f`. The words "are all booleans and"
incorrectly suggest that the value is `#f` if at least one argument is
not a boolean. In fact it is an error to apply `boolean=?` to
non-booleans."

In fact, there are three ways to interpret the text from R7RS
if we don't look at the errata:
1. It is an error to apply the procedure to non-booleans.
2. `(boolean=? 1 #t)` returns `#t`, because *after interpreting `1` as a boolean*, it is a non-false value, and hence equivalent to `#t`.
3. `(boolean=? 1 #t)` returns `#f`, because `1` is different from `#t`.

And *even if we adopt interpretation \#1*, R7RS doesn't require the
system to signal an error, so answering `#t` or `#f` is actually
legal.

So this survey shows the result of `(boolean=? 1 #t)` in different
implementations.


| System      | result |
|-------------|--------|
| Biwa        | #t     |
| Chez        | error  |
| Chibi       | error  |
| Chicken     | error  |
| Cyclone     | #f     |
| Foment      | error  |
| Gabmit      | error  |
| Gauche      | error  |
| Kawa        | #t     |
| Lips        | #f     |
| Loko        | error  |
| MIT         | #t     |
| Racket      | error  |
| Sagittarius | error  |
| Stklos      | #f     |
| Unsyntax    | error  |
| Ypsilon     | error  |


* Bigloo, Guile, Scheme9, Tinyscheme do not seem to have `boolean=?`
  bound, so were not included in the comparison.
