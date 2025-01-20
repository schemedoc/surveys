# Random number generation

Is there a fixed seed for the pseudo-random number generator?
And what method is used for generating them?

What is the result of

```
(import (srfi 27))
(random-real)
```

or equivalent?

(Evidently, the test is performed several times starting a 
fresh REPL then exiting, and then starting over...)

Interestingly, some schemes do share both the seed and the
*method* -- because the generated random real is the same for them.

At least in the case of Sagittarius and STklos, that is *not* due to
implementors using the reference implementation of SRFI-27: STklos
uses a custom Mersenne Twister generator.

| System      | fixed or varies? | value               | obs               | PRNG method                                                                    |
|-------------|------------------|---------------------|-------------------|--------------------------------------------------------------------------------|
| Bigloo      | varies           |                     | `(randomfl)`      |                                                                                |
| Chez        | fixed            | 0.49980777502645934 | `(random 1.0)`    | random seed generated from thread context. (`c/number.c`)                      |
| Chibi       | varies           |                     |                   |                                                                                |
| Chicken     | fixed            | 0.857402537562821   | = S48, gambit     | Reference implementation of SRFI-27 (based on Pierre Lecuyer's MRG32K3A)       |
| Cyclone     | varies           |                     |                   | Linear Congruential (`srfi/27.sld`)                                            |
| Foment      | varies           |                     |                   | C++ `<random>`     (`src/random.cpp`)                                          |
| Gambit      | fixed            | 0.8574025375628211  | = S48, chicken    | Reference implementation of SRFI-27 (based on Pierre Lecuyer's MRG32K3A)       |
| Gauche      | fixed            | 0.8147236863931789  |                   | Mersenne Twister                                                               |
| Guile       | fixed            | 0.8187953998906781  |                   | Multiply With Carry (`libguile/random.c`); also external?  (`lib/getrandom.c`) |
| MIT         | fixed            | 0.9123799209965706  |                   | ChaCha20 (`src/runtime/random.scm`)                                            |
| LIPS        | fixed            | 0.6589080521371216  | `(random)`        | Linear Congruential (`lib/R5RS.scm`)                                           |
| Sagittarius | fixed            | 0.7868209548678019  | = STklos          | Mersenne Twister (`sitelib/srfi/%3a27/random-bits.scm`)                        |
| Scheme48    | fixed            | 0.8574025375628211  | = gambit, chicken |                                                                                |
| STklos      | fixed            | 0.7868209548678019  | = sagittarius     | Mersenne Twister (`lib/srfi/27.{stk,c}`)                                       |
| Unsyntax    | varies           |                     |                   |                                                                                |
| Ypsilon     | varies           |                     |                   | Multiply With Carry (`sitelib/srfi/27.scm`)                                    |

