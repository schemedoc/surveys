# read-line

## Is the newline returned?

In Racket, Gauche, MIT, Gambit, Chicken, Bigloo, Kawa, Chibi, SCM,
Vicare, Scheme 9, RScheme, S7, BDC, XLisp, Spark, Inlab, Sagittarius,
`read-line` returns the next line from the specified or current input
port, stripping the trailing end of line.

In STklos it returns two values, the line and the end of line.

In Rep it returns the line including the end of line.

## Carriage return

Assume a file `foo.txt` whose contents are `foo\rbar`.

What is the return value of each of the following expressions?

```Scheme
(read-line (open-input-file "foo.txt"))
(read-line (open-input-string "foo\rbar"))
```

| Implementation | File port     | String port
| -------------- | ------------- | ------------
| Racket         | `"foo\rbar"`  | Same
| Gauche         | `"foo"`       | Same
| Chibi          | `"foo\rbar"`  | `"foo"`
| Chicken        | `"foo\\rbar"` | `"foo"`
| MIT            | `"foo\rbar"`  | Same
| Gambit         | `"foo\rbar"`  | Same
| Kawa           | `"foo"`       | Same

In the source code of MIT Scheme (`src/runtime/textual-port.scm`),
string ports and file ports are both wrapped in the record type
`<textual-port-type>`. So when using `read-line` the same interface is
invoked.

But in Chibi and Chicken, there is no such wrapper. `read-line`
directly treats a string port and a file port differently. That is why
the output is different.
