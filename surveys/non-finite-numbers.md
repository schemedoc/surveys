# Non-finite numbers

## Syntax

Here's how various Schemes deal with syntax for non-finite inexact numbers.  "Standard syntax" means what R6RS prescribes: `+inf.0` for positive infinity, `-inf.0` for negative infinity, and both `+nan.0` and `-nan.0` for NaN.

Racket, Gauche, Chicken (with or without the numbers egg), Scheme48, Guile, Kawa, Chez, Ikarus/Vicare, Larceny, Ypsilon, Mosh, IronScheme, STklos, Spark, Sagittarius accept and print the standard syntax.

Gambit, Bigloo, Chibi accept and print the standard syntax, except that they do not accept `-nan.0`.

SigScheme, Scheme 9, Dream, Oaklisp, Owl Lisp are excluded because they do not have inexact non-finite numbers.

The following table concisely describes the other Schemes in the test suite.  "Std syntax" is "yes" if the Scheme can read the standard syntax, "print" shows what `(let* ((i (* 1.0e200 1.0e200)) (n (- i i))) (list i (- i) n))` prints, and "own syntax" is "yes" if the Scheme can reread what it prints.  The implementations are listed in roughly decreasing order of standardosity.

|Scheme|std syntax|prints|own syntax|
|------|----------|------|----------|
|KSi|yes|`(+inf.0 -inf.0 nan.0)`|yes|
|NexJ|yes|`(Infinity -Infinity NaN)`|no|
|VX|yes|`(inf. -inf. -nan.)`|no|
|SCM|*|`(+inf.0 -inf.0 0/0)`|yes|
|S7|no|`(inf.0 -inf.0 -nan.0)`|no|
|SXM|no|`(inf.0 -inf.0 -nan.0)`|no|
|Inlab|no|`(inf.0 -inf.0 -nan.0)`|no|
|UMB|no|`(inf.0 -inf.0 -nan)`|no|
|Shoe|no|`(inf -inf -nan)`|no|
|!TinyScheme|no|`(inf -inf -nan)`|no|
|XLisp|no|`(inf -inf -nan)`|no|
|Schemik|no|`(inf -inf -nan)`|no|
|scsh|no|`(inf. -inf. -nan.)`|no|
|Rep|no|`(inf. -inf. -nan.)`|no|
|RScheme|no|`(inf. -inf. -nan.)`|no|
|Elk|no|`(inf -inf -nan.0)`|no|
|SISC|no|`(infinity.0 -infinity.0 nan.0)`|no|
|BDC|no|`(Infinity -Infinity NaN)`|no|
|MIT|no|`(#[+inf] #[-inf] #[NaN])`|no|

[*] Accepts `+inf.0` and `-inf.0` but not `+nan.0` or `-nan.0`

## NaN equivalence

The following implementations return `#t` for `(eqv +nan.0 +nan.0)`: Chez, Gambit, Guile, Ikarus/Vicare, Kawa, Larceny, Racket, STklos, Sagittarius.

The following implementations return `#f` for `(eqv +nan.0 +nan.0)`: Bigloo, Chibi, Chicken, Gauche, MIT Scheme, Scheme48.

### Different NaNs: Is (/ 0.0 0.0) the same as +nan.0?

I ran the following code:

```scheme
(list (equal? +nan.0 (/ 0.0 0.0)) (eqv? +nan.0 (/ 0.0 0.0)) (= +nan.0 (/ 0.0 0.0)) (eq? +nan.0 (/ 0.0 0.0)) )
```

And got this:

| Scheme      | Result          |
|-------------|-----------------|
| Bigloo      | `(#f #f #f #f)` |
| Biwa        | `(#t #f #f #f)` |
| Chibi       | `(#f #f #f #f)` |
| Chicken     | `(#f #f #f #f)` |
| Cyclone     | `(#f #f #f #f)` |
| Foment      | error (division by zero) |
| Gambit      | `(#f #f #f #f)` |
| Gauche      | `(#f #f #f #f)` |
| Guile       | `(#t #t #f #t)` |
| Kawa        | `(#t #t #f #f)` |
| LIPS        | `(#t #t #f #f)` |
| Loko        | `(#f #f #f #f)` |
| MIT         | `(#f #f #f #f)` |
| Racket      | `(#t #t #f #f)` |
| Sagittarius | `(#t #t #f #t)` |
| STklos      | `(#t #t #t #f)` |
| Unsyntax    | `(#f #f #f #f)` |
| Ypsilon     | `(#t #t #f #t)` |

Emacs Lisp returns `(nil nil nil)` (without the `eqv` part, which elisp does not have)

## Infinity examples

These are the R6RS examples involving `+inf.0` and `-inf.0` (already accounted for verbally in the "Implementation extensions" section of R7RS):

```Scheme
(complex? +inf.0)    => #t     ; infinities are real but not rational
(real? -inf.0)       => #t
(rational? -inf.0)   => #f
(integer? -inf.0)    => #f

(inexact? +inf.0)    => #t     ; infinities are inexact

(= +inf.0 +inf.0)    => #t     ; infinities are signed
(= -inf.0 +inf.0)    => #f
(= -inf.0 -inf.0)    => #t
(positive? +inf.0)   => #t
(negative? -inf.0)   => #t
(abs -inf.0)         => +inf.0

(finite? +inf.0)     => #f     ; infinities are infinite
(infinite? +inf.0)   => #t

                               ; infinities are maximal
(max +inf.0 x)       => +inf.0 where x is real
(min -inf.0 x)       => -inf.0 where x is real
(< -inf.0 x +inf.0)) => #t where x is real and finite
(> +inf.0 x -inf.0)) => #t where x is real and finite
(floor +inf.0)       => +inf.0
(ceiling -inf.0)     => -inf.0

                               ; infinities are sticky
(+ +inf.0 x)         => +inf.0 where x is real and finite
(+ -inf.0 x)         => -inf.0 where x is real and finite
(+ +inf.0 +inf.0)    => +inf.0

(+ +inf.0 -inf.0)    => +nan.0 ; sum of oppositely signed infinities is NaN
(- +inf.0 +inf.0)    => +nan.0

(* 5 +inf.0)         => +inf.0 ; infinities are sticky
(* -5 +inf.0)        => -inf.0
(* +inf.0 +inf.0)    => +inf.0
(* +inf.0 -inf.0)    => -inf.0

(/ 0.0)              => +inf.0 ; infinities are reciprocals of zero
(/ 1.0 0)            => +inf.0
(/ -1 0.0)           => -inf.0
(/ +inf.0)           => 0.0
(/ -inf.0)           => -0.0 if distinct from 0.0

(rationalize +inf.0 3)      => +inf.0
(rationalize +inf.0 +inf.0) => +nan.0
(rationalize 3 +inf.0)      => 0.0

(exp +inf.0)         => +inf.0
(exp -inf.0)         => 0.0
(log +inf.0)         => +inf.0
(log 0.0)            => -inf.0
(log -inf.0)         => +inf.0+3.141592653589793i ; approximately
(atan -inf.0)        => -1.5707963267948965 ; approximately
(atan +inf.0)        => 1.5707963267948965 ; approximately

(sqrt +inf.0)        => +inf.0
(sqrt -inf.0)        => +inf.0i

(angle +inf.0)       => 0.0
(angle -inf.0)       => 3.141592653589793
(magnitude (make-rectangular x y)) => +inf.0 where x or y or both are infinite
```

## NaN examples

These are the R6RS examples involving NaNs (already accounted for verbally in the "Implementation extensions" section of R7RS):

```Scheme
(number? +nan.0)   => #t ; NaN is real but not rational
(complex? +nan.0)  => #t
(real? +nan.0)     => #t
(rational? +nan.0) => #f

                         ; NaN compares #f to anything
(= +nan.0 z)       => #f where z numeric
(< +nan.0 x)       => #f where x real
(> +nan.0 x)       => #f where x real

(zero? +nan.0)     => #f ; NaN is unsigned
(positive? +nan.0) => #f
(negative? +nan.0) => #f

                         ; NaN is mostly sticky
(* 0 +inf.0)       => 0 or +nan.0
(* 0 +nan.0)       => 0 or +nan.0
(+ +nan.0 x)       => +nan.0 where x real
(* +nan.0 x)       => +nan.0 where x real and not exact 0

                         ; Sum of +inf.0 and -inf.0 is NaN
(+ +inf.0 -inf.0)  => +nan.0
(- +inf.0 +inf.0)  => +nan.0

                         ; 0/0 is NaN unless both 0s are exact
(/ 0 0.0) => +nan.0
(/ 0.0 0) => +nan.0
(/ 0.0 0.0) => +nan.0

(round +nan.0)     => +nan.0 ; Nan rounds (etc.) to NaN

(rationalize +inf.0 +inf.0) => +nan.0 ; Rationalizing infinity to nearest infinity is NaN
```

## `expt` and infinities

The following table shows how Scheme implementations deal with
exponentiation of infinities.

| System      | `(expt +inf.0 -inf.0)`         | `(expt -inf.0 +inf.0)` |
|-------------|--------------------------------|------------------------|
| Bigloo      | 0.0                            | +inf.0                 |
| Biwa        | 0                       exact! | +inf.0                 |
| Chez        | 0.0                            | +inf.0                 |
| Chibi       | 0.0                            | +inf.0                 |
| Chicken     | 0.0                            | +nan.0+nan.0i          |
| Cyclone     | +inf.0                         | +inf.0                 |
| Gambit      | 0.0                            | +nan.0+nan.0i          |
| Gauche      | 0.0                            | +nan.0+nan.0i          |
| Guile       | 0.0                            | +nan.0+nan.0i          |
| Kawa        | 0.0                            | +inf.0                 |
| LIPS        | 0                       exact! | +inf.0                 |
| MIT         | 0.0                            | -nan.0-nan.0i          |
| Sagittarius | +nan.0+nan.0i                  | +inf.0                 |
| STklos      | 0.0                            | -nan.0-nan.0i          |
|-------------|--------------------------------|------------------------|
| C (pow)     | 0                              | inf                    |
| Emacs Lisp  | 0.0                            | 1.0e+INF               |
| Javascript  | 0                              | Infinity               |

* The exactness of Biwa's and LIPS' answer is likely due to Javascript, where
  `(+Infinity)**(-Infinity)` returns exact zero. The `+inf.0` in the other case
  is also consistent with the Javescript result.
* The First case (`inf^(-inf)`) is zero for most implementations probably because
  it is what the C `pow` function returns.
* Similarly, its likely that the (`-inf^inf`) case is most usually `+inf.0`
  for the same reason
* The `nan` cases in (`-inf^inf`) could happen when computing `x^y` as
  `exp(y*log(x))`, since `( +inf * log(-inf) )` = `( +inf * (+inf + PI*i) )`,
  which becomes NaN. (Using `exp(y*log(x))` instead of `pow` makes sense because
  it works for complexes.)
