# jiffies-per-second

What is the value of `jiffies-per-second` in different R7RS
implementations?

| Implementation | OS   | `jiffies-per-second` | One jiffy is    |
|----------------|------|----------------------|-----------------|
| Chibi          | Unix | `1_000`              | One millisecond |
| Cyclone        | Unix | `1_000_000`          | One microsecond |
| Gambit         | Unix | `1_000_000`          | One microsecond |
| Gauche         | Unix | `1_000_000_000`      | One nanosecond  |
| Guile          | Unix | `1_000_000_000`      | One nanosecond  |
| Kawa           | Unix | `1_000_000_000`      | One nanosecond  |
| LIPS           | Unix | `1_000_000`          | One microsecond |
| MIT            | Unix | `100`                | One hundredth of a second |
| Peroxide       | Unix | `1_000_000_000`      | One nanosecond  |
| Sagittarius    | Unix | `1_000_000_000`      | One nanosecond  |
| STklos         | Unix | `1_000_000_000`      | One nanosecond  |
| Ypsilon        | Unix | `1_000_000`          | One microsecond |
