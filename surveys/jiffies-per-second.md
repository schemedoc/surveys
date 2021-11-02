# jiffies-per-second

What is the value of `jiffies-per-second` in different R7RS
implementations?

| Implementation | OS   | `jiffies-per-second` |
|----------------|------|----------------------|
| Chibi          | Unix | `1_000`              |
| Gambit         | Unix | `1_000_000`          |
| Gauche         | Unix | `1_000_000_000`      |
| Guile          | Unix | `1_000_000_000`      |
| Kawa           | Unix | `1_000_000_000`      |
| Sagittarius    | Unix | `1_000_000_000`      |
