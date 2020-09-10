# Load path

How to get the filename of the source file currently being loaded.

Common Lisp: `*load-pathname*`, `*load-truename*`

Gauche: `(current-load-path)`

Rep (librep): `load-filename`

SRFI 193 (`script-file`, `script-directory`) is similar but does not
apply to all loaded files, only "scripts".
