What garbage collector does each Scheme implementation use?

| Scheme | GC | type |
|---|---|---|
| Bigloo  | `libgc`  | conservative, mark-sweep, incremental, generational |
| Chibi   | custom   | generational |
| Cyclone | [custom](https://justinethier.github.io/cyclone/docs/Garbage-Collector)  | |
| Gauche  | `libgc`  | conservative, mark-sweep, incremental, generational |
| Guile   | `libgc`? | conservative, mark-sweep, incremental, generational |
| MIT     | custom?  | `src/runtime/gc.scm`? |
| STklos  | `libgc`  | conservative, mark-sweep, incremental, generational |

