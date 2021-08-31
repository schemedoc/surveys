# Threads

Using _OS threads_, also known as _native threads_, there is exactly
one operating system thread for each virtual machine thread.

Using _virtual threads_, also known as _green threads_ (after the
_Green Team_ working on Java threads at Sun), each OS thread can
switche between multiple VM threads using co-operative multitasking.
The threads visible to the Scheme program are the VM threads; the OS
threads are an internal implementation detail.

|Scheme|Standard API|Custom API|Virtual threads|OS threads|Re-entrant interpreter
|------|------------|----------|---------------|----------|----------------------
|Bigloo|?|?|?|?|?
|Chez Scheme|?|?|?|?|?
|Chibi-Scheme|?|?|?|?|?
|CHICKEN|SRFI 18|?|Yes|No|?|?|?
|Cyclone|SRFI 18|?|None|pthreads|?|?|?
|Gambit|SRFI 18|?|Yes|None|?|?|?
|Gauche|SRFI 18|?|None|pthreads|?|?|?
|Gerbil|?|?|?|?|?
|Guile|?|?|?|?|?
|Iron|?|?|?|?|?
|Kawa|?|?|?|?|?
|Larceny|?|?|?|?|?
|Loko|?|?|?|?|?
|MIT Scheme|?|?|?|?|?
|Racket|?|?|?|?|?
|Sagittarius|?|?|?|?|?
|Scheme48|?|?|?|?|?
|STKlos|SRFI 18|?|None|pthreads|Yes
|TinyScheme|None|?|?|?|?|Yes
|Unsyntax|?|?|?|?|?
|Vicare|?|?|?|?|?
|Ypsilon|?|?|Yes|?|?
