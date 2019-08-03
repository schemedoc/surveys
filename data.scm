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
   pty
   timeout
   raise-exit-code
   text-ports
   stdin-pipe
   stdout-pipe
   stderr-pipe
   any-fd-dup
   other-fd-close)

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
    pty
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
    other-fd-close))

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
    ))

  (implementation
   python
   subprocess.run
   (fork
    exec
    wait
    timeout
    raise-exit-code
    text-ports)))

 (wait
  (features
   process-object
   any-pid
   any-pgrp
   timeout
   no-hang
   get-exit-code)

  (implementation
   gambit
   process-status
   (process-object
    timeout
    get-exit-code))

  (implementation
   gauche
   sys-wait
   ())

  (implementation
   gauche
   sys-waitpid
   (any-pid
    any-pgrp
    no-hang)))

 (readdir
  (features
   in-path
   in-dir-object
   no-dot-dot
   no-dotfiles
   no-w32-hidden
   sort
   out-fullpaths)

  (implementation
   gambit
   open-directory
   (in-path
    no-dot-dot
    no-dotfiles
    no-w32-hidden))

  (implementation
   gauche
   sys-readdir
   (in-path))))
