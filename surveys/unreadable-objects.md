# Unreadable objects

This is a survey of the lexical syntax that the `write` procedure uses
to write unreadable objects.

| Implementation | Syntax   | Skippable |
|----------------|----------|-----------|
| Chez Scheme    | `#<...>` | no        |
| Chibi-Scheme   | `#<...>` | no        |
| Chicken        | `#<...>` | no        |
| Gambit         | `#<...>` | no        |
| Gauche         | `#<...>` | no        |
| Guile          | `#<...>` | no        |
| Kawa           | `#<...>` | no        |
| MIT Scheme     | `#[...]` | no        |
| Mosh           | `#<...>` | no        |
| Sagittarius    | `#<...>` | no        |
| STklos         | `#[...]` | YES?      |
| (Common Lisp)  | `#<...>` | no        |

**Skippable** means that the written stand-in object can be parsed as
an S-expression (using the syntax of that implementation) and
therefore skipped to find more S-expressions in the same stream.

## Conflicts

Chicken and Gambit support multi-line strings via the following
syntax. (The syntax imitates the Bourne shell, which calls a
multi-line string a "here-document".)

    <<end
    .
    .
    .
    end

An arbitrary identifier can be used in place of `end`.

SRFI 107 (_XML reader syntax_) uses `#<` for XML tags mixed in with
Scheme code. It is implemented by Kawa. An example of this syntax is
`#<da></da>`.

In both cases there is a syntactic ambiguity. Chicken, Gambit, and
Kawa all use `#<` to write unreadable objects. Since valid Scheme
source code cannot contain unreadable objects, there is no read-time
ambiguity for valid code. The ambiguity does make it harder to deal
with invalid input where an unreadable object may be silently
misinterpreted as some type of readable object or rejected with a
confusing error message.

STklos has a similar syntax `#<<end` but since it does not use
`#<...>` for unreadable data there is no ambiguity.
