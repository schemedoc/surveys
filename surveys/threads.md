# Threads

Using _OS threads_, also known as _native threads_, there is exactly
one operating system thread for each virtual machine thread.

Using _virtual threads_, also known as _green threads_ (after the
_Green Team_ working on Java at Sun), each OS thread can switch
between multiple VM threads using co-operative multitasking. The
threads visible to the Scheme program are the VM threads; the OS
threads are an internal implementation detail.

|Scheme|Standard API|Custom API|OS threads|Virtual threads|Re-entrant interpreter
|------|------------|----------|----------|---------------|----------------------
|Bigloo|SRFI 18|?|["POSIX threads"][bigloo-pthread]|["Fair threads"][bigloo-fthread]|?
|Chez Scheme|?|?|?|?|?
|Chibi-Scheme|?|?|?|?|?
|CHICKEN|SRFI 18|?|Yes|No|?|?|?
|Cyclone|SRFI 18*|?|No|pthreads|?|?|?
|Gambit|SRFI 18|?|Yes|No|?|?|?
|Gauche|SRFI 18|?|No|pthreads, Win32|?|?|?
|Gerbil|?|?|?|?|?
|Guile|SRFI 18|[Here][guile-custom]|[pthreads][guile-pthreads]|[`(ice-9 futures)`][guile-futures]|Yes
|IronScheme|?|?|?|?|?
|Kawa|?|?|?|?|?
|Larceny|?|?|?|?|?
|Loko|?|?|?|?|?
|MIT Scheme|?|?|?|?|?
|Racket|?|?|?|?|?
|Sagittarius|?|?|?|?|?
|Scheme48|?|?|?|?|?
|STKlos|SRFI 18|?|No|pthreads|Yes
|TinyScheme|No|?|?|?|?|Yes
|Unsyntax|?|?|?|?|?
|Vicare|?|?|?|?|?
|Ypsilon|?|?|Yes|?|?

*) Partial support

[bigloo-fthread]: https://www-sop.inria.fr/mimosa/fp/Bigloo/manual-chapter16.html#Fair%20Threads
[bigloo-pthread]: [https://www-sop.inria.fr/mimosa/fp/Bigloo/manual-chapter16.html#Posix%20Threads]

[guile-pthreads]: https://www.gnu.org/software/guile/manual/html_node/Scheduling.html
[guile-custom]: https://www.gnu.org/software/guile/manual/html_node/Threads.html
[guile-futures]: https://www.gnu.org/software/guile/manual/html_node/Futures.html
