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

Besides that, although not mentioned in the errata, the text for
`boolean=?` is
> `(boolean=? boolean1 boolean2 boolean3 . . . )`
> Returns `#t` if all the arguments are `#t` or all are `#f`.
This *implicitly* forbids zero arguments, and not necessarily
excludes a single argument.

So this survey shows the result, in several implementations,
of:
1. `(boolean=? 1 #t)`
2. `(boolean=? #f)`
3. `(boolean=?)`

This was done regardless of the system explicitly supporting R7RS or
R6RS -- it was done for all that had the procedure `boolean=?`.

| System      | `(boolean=? 1 #t)` | `(boolean=? #f)` | `(boolean=?)` |
|-------------|--------------------|------------------|---------------|
| Biwa        | #t                 | error            | error         |
| Chez        | error              | error            | error         |
| Chibi       | error              | error            | error         |
| Chicken     | error              | error            | error         |
| Cyclone     | #f                 | error            | error         |
| Foment      | error              | error            | error         |
| Gabmit      | error              | #t               | #t            |
| Gauche      | error              | error            | error         |
| Kawa        | #t                 | error            | error         |
| LIPS        | #f                 | error            | error         |
| Loko        | error              | error            | error         |
| MIT         | #t                 | error            | error         |
| Racket      | error              | error            | error         |
| Sagittarius | error              | error            | error         |
| Stklos      | #f                 | #t               | error         |
| Unsyntax    | error              | error            | error         |
| Ypsilon     | error              | error            | error         |


* Bigloo, Guile, Scheme9, TinyScheme do not seem to have `boolean=?`
  bound, so were not included in the comparison.
