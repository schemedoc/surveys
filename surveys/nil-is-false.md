# Nil is false

R2RS, R3RS, and R4RS permit `()` and `#f` to be the same (in the sense of `eq?`), as is required in Common Lisp and most other Lisps; this was done to make conversion of older Lisp code easier.  For the same reason, `()` counts as false for conditional tests in R2RS and R3RS, and is permitted but not required to count as false in R4RS.  IEEE Scheme, R5RS, R6RS, or R7RS don't allow any of this confusion.

Almost all the Schemes in the test suite, even those that claim only R3RS or R4RS conformance, distinguish cleanly between `()` and `#f`, and treat only `#f` as false.  The only exceptions are XLisp and Rep, which specifically state that they draw on ideas from both Scheme and Common Lisp, and consider `()` and `#f` to be the same.
