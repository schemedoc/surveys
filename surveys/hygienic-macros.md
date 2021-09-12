# Hygienic macros

How are hygienic macro systems implemented?

* "er" and "sc" are "explicitly-renaming" and "syntatic closures";
* "how" means how the hygienic macro system is implemented (what is its based on);
  ER (explicitly-renaming macros), syntax-case, some native implementation in C or Java etc.
* "where" is the source location of the basic hygienic syntax code.

|system | syntax-rules | syntax-case | er | sc | how | where |
|---|---|---|---|---|---|---|
|Chibi	        |Y	|Y	|Y	|	| ER over SC                       | `lib/init7.scm` |
|Chicken        |Y	|N	|Y	|       | ER	                       | `synrules.scm expand.scm` |
|Gauche	        |Y	|N !	|Y	|	| syntax-rules written in C    | `src/macro.c` |
|Guile	        |Y	|Y	|N	|	| syntax-case                  | `module/ice-9/safe-r5rs.scm module/ice-9/psyntax.scm` |
|Kawa 	        |Y	|Y	|	|	| syntax-rules written in Java | `kawa/lang/Syntax{Pattern,Rule,Rules}.java  kawa/standard/syntax_case.java kawa/lang/SyntaxForms.java` |
|LIPS           |Y      |N      |N      |N      | syntax-rules written in Javascript | `lips.js` |
|Loko           |Y	|Y	|	|	| syntax-case                  | `psyntax` |
|MIT            |Y	|N	|Y	|Y	| ER                           | `src/runtime/syntax-rules.scm` |
|Peroxide       |Y  | N ! | Y | Y | ER over SC | `src/primitives/syntactic_closure.rs` `src/scheme-lib/init.scm` |
|Sagittarius	|Y	|Y	|Y	|       | syntax-case; ER separate     | `boot/lib/macro.scm` |
|STklos         |Y      |N      |N      |N      | define-macro (no lexical scope) | `lib/mbe.stk` |
|Unsyntax	|Y	|Y	|	|       | syntax-case                  | `src/unsyntax/expander/syntax-case.scm src/unsyntax/syntax.scm` |

`!` = at least seems to be planned
