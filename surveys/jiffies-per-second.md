# jiffies-per-second

What is the value of `jiffies-per-second` in different R7RS
implementations?

| Implementation | OS   | `jiffies-per-second` | One jiffy is    |
|----------------|------|----------------------|-----------------|
| Chibi          | Unix | `1_000`              | One millisecond |
| Gambit         | Unix | `1_000_000`          | One microsecond |
| Gauche         | Unix | `1_000_000_000`      | One nanosecond  |
| Guile          | Unix | `1_000_000_000`      | One nanosecond  |
| Kawa           | Unix | `1_000_000_000`      | One nanosecond  |
| Sagittarius    | Unix | `1_000_000_000`      | One nanosecond  |
