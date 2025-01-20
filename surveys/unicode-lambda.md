# Unicode lambda

Which schemes support, by default, the unicode lambda character as an alternative to "`lambda`"?

The following expression was evaluated on the REPL: `((λ () "ok"))`.

Of course, any Scheme supporting Unicode in identifiers and any form of symbol aliasing (`syntax-case`, for example, allows one to do that) could be programmed to translate unicode lambda in ASCII `lambda`. This shows the default behavior on the REPL only.

| Scheme| supports λ ?| remark
|-------|----|---|
|Bigloo	|NO	| |
|Biwa	|NO	| |
|Chez	|NO	| |
|Chibi	|NO	| |
|Chicken|NO	| |
|Loko	|NO	| |
|Gambit	|NO	| |
|Gauche | NO|uses caret (`^`)|
|Guile	|YES| |
|Kawa	|NO	| |
|LIPS	|NO	| |
|MIT	|NO	| |
|Peroxide |NO | |
|Racket	|YES|	| |
|Sagittarius|NO	| |
|STklos	|YES|	| |
|Tinyscheme	|NO	| |
|Unsyntax	|NO	| |
|Ypsilon  |NO | |
