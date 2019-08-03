((fork
  (features
   thunk
   thread-safe)

  (implementation
   chicken
   process-fork
   (thunk))

  (implementation
   gambit
   sys-fork
   ()))

 (spawn
  (features
   fork
   double-fork
   setsid
   exec
   wait
   path-search
   arg-shell
   arg-list
   arg-zero
   arg-w32-quote
   env
   dir
   sig-mask
   new-pgrp
   stdin-pipe
   stdout-pipe
   stderr-pipe
   any-fd-dup
   other-fd-close
   )

  (implementation
   chicken
   process-execute
   (path-search
    arg-list
    arg-w32-quote
    env))

  (implementation
   gambit
   open-process
   (env
    dir
    stdin-pipe
    stdout-pipe
    stderr-pipe))

  (implementation
   gauche
   sys-system
   (fork
    exec
    wait
    arg-shell))

  (implementation
   gauche
   sys-exec
   (exec
    arg-list
    arg-zero
    dir
    sig-mask
    any-fd-dup
    other-fd-close
    ))

  (implementation
   gauche
   sys-fork-and-exec
   (fork
    double-fork
    setsid
    exec
    dir
    any-fd-dup
    other-fd-close
    sig-mask
    new-pgrp
    ))))
