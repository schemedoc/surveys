# Hash-quote

`#"..."` is rarely used.  Of my 39 test Schemes, only Racket, Gambit, Larceny, IronScheme, Shoe, and XLisp do something other than error out as soon as they see #" -- but in most of these cases, I don't know what they are actually doing.

Except:

Racket: creates byte string
LIPS: create interpolated string
